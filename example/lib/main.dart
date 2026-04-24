import 'package:flutter/material.dart';
import 'package:ithaki_design_system/ithaki_design_system.dart';

void main() => runApp(const CatalogApp());

class CatalogApp extends StatelessWidget {
  const CatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ithaki Widget Catalog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'NotoSans',
      ),
      home: const CatalogHome(),
    );
  }
}

class CatalogHome extends StatelessWidget {
  const CatalogHome({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = <String, Widget>{
      'AppBar': const _AppBarPage(),
      'Button': const _ButtonPage(),
      'TextField': const _TextFieldPage(),
      'PasswordField': const _PasswordFieldPage(),
      'PhoneField': const _PhoneFieldPage(),
      'Dropdown': const _DropdownPage(),
      'SelectorField': const _SelectorFieldPage(),
      'Checkbox': const _CheckboxPage(),
      'ChipGroup': const _ChipGroupPage(),
      'ChipSection': const _ChipSectionPage(),
      'OptionCard': const _OptionCardPage(),
      'StepTabs': const _StepTabsPage(),
      'ValidationRow': const _ValidationRowPage(),
      'BackLink': const _BackLinkPage(),
      'ResendTimer': const _ResendTimerPage(),
      'SalaryInput': const _SalaryInputPage(),
      'JobCard': const _JobCardPage(),
      'Icon': const _IconPage(),
      'Flag': const _FlagPage(),
      'ScreenLayout': const _ScreenLayoutPage(),
      'MatchBar': const _MatchBarPage(),
      'InfoTag': const _InfoTagPage(),
      'JobRecommendationCard': const _JobRecommendationCardPage(),
      'StatCard': const _StatCardPage(),
      'CourseCard': const _CourseCardPage(),
      'NewsTile': const _NewsTilePage(),
      'GradientBanner': const _GradientBannerPage(),
      'Footer': const _FooterPage(),
      'NavDrawer': const _NavDrawerPage(),
      'HatchProgressBar': const _HatchProgressBarPage(),
      'ProductTourBanner': const _ProductTourBannerPage(),
      'ProfileCompletionCard': const _ProfileCompletionCardPage(),
    };

    return Scaffold(
      appBar: AppBar(title: const Text('Ithaki Widget Catalog')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: pages.length,
        separatorBuilder: (context, index) => const SizedBox(height: 4),
        itemBuilder: (context, index) {
          final entry = pages.entries.elementAt(index);
          return ListTile(
            title: Text(entry.key),
            trailing: const Icon(Icons.chevron_right),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            tileColor: IthakiTheme.softGray,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    _DetailPage(title: entry.key, child: entry.value),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DetailPage extends StatelessWidget {
  final String title;
  final Widget child;
  const _DetailPage({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: child,
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Individual widget pages
// ---------------------------------------------------------------------------

class _AppBarPage extends StatelessWidget {
  const _AppBarPage();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Label('Default (no action)'),
        SizedBox(height: 56, child: IthakiAppBar()),
        const SizedBox(height: 24),
        const _Label('With action label'),
        SizedBox(
          height: 56,
          child: IthakiAppBar(actionLabel: 'Login', onActionPressed: () {}),
        ),
        const SizedBox(height: 24),
        const _Label('With action (Sign Up)'),
        SizedBox(
          height: 56,
          child: IthakiAppBar(actionLabel: 'Sign Up', onActionPressed: () {}),
        ),
      ],
    );
  }
}

class _ButtonPage extends StatelessWidget {
  const _ButtonPage();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _Label('Primary'),
        IthakiButton('Continue', onPressed: () {}),
        const SizedBox(height: 16),
        const _Label('Primary (disabled)'),
        const IthakiButton('Continue'),
        const SizedBox(height: 16),
        const _Label('Outline'),
        IthakiButton(
          'Skip',
          variant: IthakiButtonVariant.outline,
          onPressed: () {},
        ),
      ],
    );
  }
}

class _TextFieldPage extends StatefulWidget {
  const _TextFieldPage();
  @override
  State<_TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<_TextFieldPage> {
  final _ctrl = TextEditingController();
  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IthakiTextField(
      label: 'Full Name',
      hint: 'John Doe',
      controller: _ctrl,
    );
  }
}

class _PasswordFieldPage extends StatefulWidget {
  const _PasswordFieldPage();
  @override
  State<_PasswordFieldPage> createState() => _PasswordFieldPageState();
}

class _PasswordFieldPageState extends State<_PasswordFieldPage> {
  final _ctrl = TextEditingController();
  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IthakiPasswordField(
      label: 'Password',
      hint: 'Enter password',
      controller: _ctrl,
    );
  }
}

class _PhoneFieldPage extends StatefulWidget {
  const _PhoneFieldPage();
  @override
  State<_PhoneFieldPage> createState() => _PhoneFieldPageState();
}

class _PhoneFieldPageState extends State<_PhoneFieldPage> {
  final _ctrl = TextEditingController();
  bool _valid = false;
  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IthakiPhoneField(
          controller: _ctrl,
          onValidationChanged: (v) => setState(() => _valid = v),
        ),
        const SizedBox(height: 12),
        Text(
          'Valid: $_valid',
          style: TextStyle(color: _valid ? Colors.green : Colors.red),
        ),
      ],
    );
  }
}

class _DropdownPage extends StatefulWidget {
  const _DropdownPage();
  @override
  State<_DropdownPage> createState() => _DropdownPageState();
}

class _DropdownPageState extends State<_DropdownPage> {
  String? _value;
  @override
  Widget build(BuildContext context) {
    return IthakiDropdown<String>(
      label: 'Country',
      hint: 'Select country',
      value: _value,
      items: [
        'Spain',
        'Greece',
        'Germany',
      ].map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
      onChanged: (v) => setState(() => _value = v),
    );
  }
}

class _SelectorFieldPage extends StatefulWidget {
  const _SelectorFieldPage();
  @override
  State<_SelectorFieldPage> createState() => _SelectorFieldPageState();
}

class _SelectorFieldPageState extends State<_SelectorFieldPage> {
  String? _value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _Label('Default'),
        IthakiSelectorField(
          label: 'Location',
          hint: 'Select location',
          value: _value,
          onTap: () => setState(() => _value = 'Madrid, Spain'),
        ),
        const SizedBox(height: 16),
        const _Label('Optional'),
        IthakiSelectorField(
          label: 'Secondary Location',
          hint: 'Select location',
          optional: true,
          onTap: () {},
        ),
      ],
    );
  }
}

class _CheckboxPage extends StatefulWidget {
  const _CheckboxPage();
  @override
  State<_CheckboxPage> createState() => _CheckboxPageState();
}

class _CheckboxPageState extends State<_CheckboxPage> {
  bool _checked = false;
  @override
  Widget build(BuildContext context) {
    return IthakiCheckbox(
      value: _checked,
      onChanged: (v) => setState(() => _checked = v),
      child: const Text('I agree to the Terms & Conditions'),
    );
  }
}

class _ChipGroupPage extends StatefulWidget {
  const _ChipGroupPage();
  @override
  State<_ChipGroupPage> createState() => _ChipGroupPageState();
}

class _ChipGroupPageState extends State<_ChipGroupPage> {
  Set<String> _selected = {};
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _Label('Multi-select (max 3)'),
        IthakiChipGroup(
          options: const [
            'Flutter',
            'React',
            'Swift',
            'Kotlin',
            'Dart',
            'TypeScript',
          ],
          selected: _selected,
          onChanged: (v) => setState(() => _selected = v),
          maxSelect: 3,
        ),
      ],
    );
  }
}

class _ChipSectionPage extends StatefulWidget {
  const _ChipSectionPage();
  @override
  State<_ChipSectionPage> createState() => _ChipSectionPageState();
}

class _ChipSectionPageState extends State<_ChipSectionPage> {
  Set<String> _selected = {};
  @override
  Widget build(BuildContext context) {
    return IthakiChipSection(
      title: 'Skills',
      description: 'Select up to 5 skills that describe your expertise.',
      options: const [
        'Design',
        'Development',
        'Marketing',
        'Sales',
        'Management',
      ],
      selected: _selected,
      onChanged: (v) => setState(() => _selected = v),
      maxSelect: 5,
    );
  }
}

class _OptionCardPage extends StatefulWidget {
  const _OptionCardPage();
  @override
  State<_OptionCardPage> createState() => _OptionCardPageState();
}

class _OptionCardPageState extends State<_OptionCardPage> {
  int _selected = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _Label('Horizontal'),
        IthakiOptionCard(
          icon: 'envelope',
          label: 'Send secured code via SMS',
          isSelected: _selected == 0,
          onTap: () => setState(() => _selected = 0),
        ),
        const SizedBox(height: 12),
        IthakiOptionCard(
          icon: 'whatsapp',
          label: 'Send secured code via WhatsApp',
          isSelected: _selected == 1,
          onTap: () => setState(() => _selected = 1),
        ),
        const SizedBox(height: 24),
        const _Label('Vertical'),
        IthakiOptionCard(
          icon: 'envelope',
          label: 'Email',
          isSelected: _selected == 2,
          onTap: () => setState(() => _selected = 2),
          axis: Axis.vertical,
        ),
      ],
    );
  }
}

class _StepTabsPage extends StatefulWidget {
  const _StepTabsPage();
  @override
  State<_StepTabsPage> createState() => _StepTabsPageState();
}

class _StepTabsPageState extends State<_StepTabsPage> {
  int _current = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IthakiStepTabs(
          steps: const ['Account', 'Profile', 'Skills', 'Review'],
          currentIndex: _current,
          completedUpTo: _current,
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: _current > 0 ? () => setState(() => _current--) : null,
              child: const Text('Previous'),
            ),
            const SizedBox(width: 16),
            TextButton(
              onPressed: _current < 3 ? () => setState(() => _current++) : null,
              child: const Text('Next'),
            ),
          ],
        ),
      ],
    );
  }
}

class _ValidationRowPage extends StatelessWidget {
  const _ValidationRowPage();
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        IthakiValidationRow(valid: true, text: 'At least 8 characters'),
        SizedBox(height: 8),
        IthakiValidationRow(valid: false, text: 'Contains a number'),
        SizedBox(height: 8),
        IthakiValidationRow(valid: true, text: 'Contains uppercase letter'),
      ],
    );
  }
}

class _BackLinkPage extends StatelessWidget {
  const _BackLinkPage();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Label('Default label'),
        IthakiBackLink(onTap: () => Navigator.pop(context)),
        const SizedBox(height: 16),
        const _Label('Custom label'),
        IthakiBackLink(label: 'Go back to login', onTap: () {}),
      ],
    );
  }
}

class _ResendTimerPage extends StatefulWidget {
  const _ResendTimerPage();
  @override
  State<_ResendTimerPage> createState() => _ResendTimerPageState();
}

class _ResendTimerPageState extends State<_ResendTimerPage>
    with CountdownMixin {
  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _Label('Card variant'),
        IthakiResendTimer(
          canResend: countdownCanResend,
          secondsLeft: countdownSeconds,
          label: 'Resend link via email',
          icon: 'envelope',
          onResend: () => startCountdown(),
          variant: IthakiResendTimerVariant.card,
        ),
        const SizedBox(height: 24),
        const _Label('Text variant'),
        IthakiResendTimer(
          canResend: countdownCanResend,
          secondsLeft: countdownSeconds,
          label: 'Resend code',
          onResend: () => startCountdown(),
        ),
      ],
    );
  }
}

class _SalaryInputPage extends StatefulWidget {
  const _SalaryInputPage();
  @override
  State<_SalaryInputPage> createState() => _SalaryInputPageState();
}

class _SalaryInputPageState extends State<_SalaryInputPage> {
  final _ctrl = TextEditingController();
  String? _term;
  bool _preferNot = false;

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IthakiSalaryInput(
      amountController: _ctrl,
      paymentTerm: _term,
      paymentTermOptions: const [
        SearchItem(id: 'monthly', label: 'Monthly'),
        SearchItem(id: 'yearly', label: 'Yearly'),
        SearchItem(id: 'hourly', label: 'Hourly'),
      ],
      onPaymentTermChanged: (v) => setState(() => _term = v),
      preferNotToSpecify: _preferNot,
      onPreferNotToSpecifyChanged: (v) => setState(() => _preferNot = v),
    );
  }
}

class _JobCardPage extends StatelessWidget {
  const _JobCardPage();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IthakiJobCard(
          title: 'Senior Flutter Developer',
          subtitle: 'Google - Madrid',
          onDelete: () {},
        ),
        const SizedBox(height: 12),
        IthakiJobCard(
          title: 'Product Designer',
          subtitle: 'Figma - Remote',
          onDelete: () {},
        ),
      ],
    );
  }
}

class _IconPage extends StatelessWidget {
  const _IconPage();
  @override
  Widget build(BuildContext context) {
    final icons = [
      'check',
      'arrow-down',
      'envelope',
      'whatsapp',
      'eye',
      'eye-off',
      'trash',
      'menu',
      'search',
    ];
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: icons.map((name) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IthakiIcon(name, size: 24),
            const SizedBox(height: 4),
            Text(name, style: const TextStyle(fontSize: 14)),
          ],
        );
      }).toList(),
    );
  }
}

class _FlagPage extends StatelessWidget {
  const _FlagPage();
  @override
  Widget build(BuildContext context) {
    final codes = [
      'es',
      'us',
      'gb',
      'gr',
      'de',
      'fr',
      'it',
      'pt',
      'nl',
      'jp',
      'br',
      'in',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Label('Rectangular (default)'),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: codes.map((code) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IthakiFlag(code),
                const SizedBox(height: 4),
                Text(code.toUpperCase(), style: const TextStyle(fontSize: 14)),
              ],
            );
          }).toList(),
        ),
        const SizedBox(height: 24),
        const _Label('Oval'),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: codes.take(6).map((code) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IthakiFlag(code, oval: true),
                const SizedBox(height: 4),
                Text(code.toUpperCase(), style: const TextStyle(fontSize: 14)),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _ScreenLayoutPage extends StatelessWidget {
  const _ScreenLayoutPage();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(color: IthakiTheme.borderLight),
        borderRadius: BorderRadius.circular(14),
      ),
      clipBehavior: Clip.hardEdge,
      child: const IthakiScreenLayout(
        child: Center(child: Text('Content inside IthakiScreenLayout')),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// New widget pages
// ---------------------------------------------------------------------------

class _MatchBarPage extends StatelessWidget {
  const _MatchBarPage();
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _Label('85% match'),
        IthakiMatchBar(percentage: 85, label: 'Match'),
        SizedBox(height: 16),
        _Label('50% match'),
        IthakiMatchBar(percentage: 50, label: 'Match'),
        SizedBox(height: 16),
        _Label('20% match'),
        IthakiMatchBar(percentage: 20, label: 'Match'),
      ],
    );
  }
}

class _InfoTagPage extends StatelessWidget {
  const _InfoTagPage();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Label('With different icons'),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            IthakiInfoTag(
              icon: IthakiIcon(
                'clock',
                size: 16,
                color: IthakiTheme.textSecondary,
              ),
              label: '40h/week',
            ),
            IthakiInfoTag(
              icon: IthakiIcon(
                'pc',
                size: 16,
                color: IthakiTheme.textSecondary,
              ),
              label: 'Remote',
            ),
            IthakiInfoTag(
              icon: IthakiIcon(
                'level',
                size: 16,
                color: IthakiTheme.textSecondary,
              ),
              label: 'Senior',
            ),
          ],
        ),
      ],
    );
  }
}

class _JobRecommendationCardPage extends StatelessWidget {
  const _JobRecommendationCardPage();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _Label('With initials'),
        IthakiJobRecommendationCard(
          companyName: 'Google',
          companyInitials: 'G',
          companyColor: const Color(0xFF4285F4),
          jobTitle: 'Senior Flutter Developer',
          salary: '\$120,000/year',
          location: 'Madrid, Spain',
          workMode: 'Remote',
          employmentType: 'Full-Time',
          level: 'Senior',
          matchPercentage: 85,
          matchLabel: 'Match',
          onTap: () {},
        ),
        const SizedBox(height: 16),
        const _Label('Minimal'),
        IthakiJobRecommendationCard(
          companyName: 'Figma',
          companyInitials: 'F',
          jobTitle: 'Product Designer',
          salary: '\$90,000/year',
          matchPercentage: 72,
          matchLabel: 'Match',
          onTap: () {},
        ),
      ],
    );
  }
}

class _StatCardPage extends StatelessWidget {
  const _StatCardPage();
  @override
  Widget build(BuildContext context) {
    return IthakiStatCard(
      title: 'Job Applications',
      rows: [
        IthakiStatRowData(
          icon: IthakiIcon('check', size: 18, color: IthakiTheme.primaryPurple),
          label: 'Applied',
          value: 12,
          change: 3,
        ),
        IthakiStatRowData(
          icon: IthakiIcon('eye', size: 18, color: IthakiTheme.primaryPurple),
          label: 'Viewed',
          value: 8,
          change: -1,
        ),
        IthakiStatRowData(
          icon: IthakiIcon(
            'envelope',
            size: 18,
            color: IthakiTheme.primaryPurple,
          ),
          label: 'Responses',
          value: 4,
        ),
      ],
    );
  }
}

class _CourseCardPage extends StatelessWidget {
  const _CourseCardPage();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _Label('With all metadata'),
        IthakiCourseCard(
          title: 'Introduction to Flutter',
          description:
              'Learn how to build beautiful mobile apps with Flutter framework.',
          tags: const ['Flutter', 'Mobile', 'Dart'],
          format: 'Online',
          duration: '6 weeks',
          level: 'Beginner',
          onTap: () {},
        ),
        const SizedBox(height: 16),
        const _Label('Minimal'),
        IthakiCourseCard(
          title: 'Advanced UI Patterns',
          description:
              'Deep dive into complex UI architectures and state management.',
          onTap: () {},
        ),
      ],
    );
  }
}

class _NewsTilePage extends StatelessWidget {
  const _NewsTilePage();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IthakiNewsTile(
          tag: 'Career Tips',
          date: 'Mar 20, 2026',
          title: 'Top 10 Skills Employers Look For in 2026',
          onTap: () {},
        ),
        const SizedBox(height: 12),
        IthakiNewsTile(
          tag: 'Industry News',
          date: 'Mar 18, 2026',
          title: 'Remote Work Trends: What to Expect This Year',
          onTap: () {},
        ),
      ],
    );
  }
}

class _GradientBannerPage extends StatelessWidget {
  const _GradientBannerPage();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _Label('Default gradient'),
        IthakiGradientBanner(
          title: 'Ready to find your next role?',
          subtitle:
              'Let us help you discover opportunities tailored to your skills.',
          buttonLabel: 'Get Started',
          onButtonPressed: () {},
        ),
        const SizedBox(height: 16),
        const _Label('Custom colors'),
        IthakiGradientBanner(
          title: 'Complete your profile',
          subtitle:
              'A complete profile increases your chances of getting hired.',
          buttonLabel: 'Fill Profile',
          gradientColors: const [
            Color(0xFF0D47A1),
            Color(0xFF1976D2),
            Color(0xFF42A5F5),
          ],
          onButtonPressed: () {},
        ),
      ],
    );
  }
}

class _FooterPage extends StatelessWidget {
  const _FooterPage();
  @override
  Widget build(BuildContext context) {
    return IthakiFooter(
      brandName: 'Ithaki Talent',
      copyright: '2026 Ithaki. All rights reserved.',
      privacyLabel: 'Privacy Policy',
      termsLabel: 'Terms of Service',
      onPrivacyTap: () {},
      onTermsTap: () {},
    );
  }
}

class _NavDrawerPage extends StatelessWidget {
  const _NavDrawerPage();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: IthakiNavDrawer(
        currentRoute: '/home',
        items: const [
          IthakiNavItem(icon: 'home', label: 'Home', route: '/home'),
          IthakiNavItem(icon: 'search', label: 'Job Search', route: '/search'),
          IthakiNavItem(
            icon: 'envelope',
            label: 'My Applications',
            route: '/applications',
            badge: 3,
          ),
          IthakiNavItem(
            icon: 'chat',
            label: 'Career Assistant',
            route: '/assistant',
          ),
          IthakiNavItem(
            icon: 'check',
            label: 'My Assessments',
            route: '/assessments',
          ),
          IthakiNavItem(
            icon: 'learn',
            label: 'Learning Hub',
            route: '/learning',
          ),
          IthakiNavItem(icon: 'news', label: 'Blog & News', route: '/news'),
        ],
        profileProgress: 0.45,
        languageLabel: 'English',
        languageFlagCode: 'gb',
        onLanguageTap: () {},
        onItemTap: (_) {},
      ),
    );
  }
}

class _HatchProgressBarPage extends StatelessWidget {
  const _HatchProgressBarPage();
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _Label('25%'),
        IthakiHatchProgressBar(progress: 0.25),
        SizedBox(height: 16),
        _Label('50%'),
        IthakiHatchProgressBar(progress: 0.50),
        SizedBox(height: 16),
        _Label('75%'),
        IthakiHatchProgressBar(progress: 0.75),
        SizedBox(height: 16),
        _Label('100%'),
        IthakiHatchProgressBar(progress: 1.0),
      ],
    );
  }
}

class _ProductTourBannerPage extends StatelessWidget {
  const _ProductTourBannerPage();
  @override
  Widget build(BuildContext context) {
    return IthakiProductTourBanner(onStart: () {}, onDismiss: () {});
  }
}

class _ProfileCompletionCardPage extends StatelessWidget {
  const _ProfileCompletionCardPage();
  @override
  Widget build(BuildContext context) {
    return IthakiProfileCompletionCard(
      items: const [
        IthakiProfileChecklistItem(label: 'About Me', completed: true),
        IthakiProfileChecklistItem(label: 'Photo', completed: true),
        IthakiProfileChecklistItem(label: 'My Experience', completed: false),
        IthakiProfileChecklistItem(label: 'My Education', completed: false),
        IthakiProfileChecklistItem(label: 'My Skills', completed: false),
        IthakiProfileChecklistItem(label: 'Documents', completed: false),
      ],
      benefits: const [
        'Higher visibility to employers',
        'Better job matches',
        'Priority application review',
      ],
      onFillProfile: () {},
    );
  }
}

// ---------------------------------------------------------------------------
// Helper
// ---------------------------------------------------------------------------

class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: IthakiTheme.textSecondary,
        ),
      ),
    );
  }
}

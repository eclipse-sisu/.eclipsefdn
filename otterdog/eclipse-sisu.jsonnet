local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('technology.sisu', 'eclipse-sisu') {
  settings+: {
    blog: "https://projects.eclipse.org/projects/technology.sisu",
    description: "Eclipse Sisu is a modular JSR-330-based container that supports classpath scanning, auto-binding, and dynamic auto-wiring.",
    email: "webmaster@eclipse-foundation.org",
    name: "Eclipse Sisu",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  _repositories+:: [
    orgs.newRepo('sisu-project') {
      aliases: ['sisu.inject'],
      allow_update_branch: false,
      default_branch: "main",
      delete_branch_on_merge: false,
      description: "Sisu Inject",
      has_discussions: true,
      homepage: "https://eclipse.dev/sisu/",
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "pass:bots/technology.sisu/sonarcloud.io/token",
        },
      ],
      variables: [
        orgs.newRepoVariable('SONAR_PROJECT_KEY') {
          value: "eclipse-sisu_sisu.inject",
        },
        orgs.newRepoVariable('SONAR_ORGANIZATION') {
          value: "eclipse-sisu",
        },
      ],
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          requires_pull_request: true,
          required_approving_review_count: 1,
        }
      ],
    },
    orgs.newRepo('sisu.mojos') {
      archived: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Sisu Mojos",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "master",
      gh_pages_source_path: "/docs",
      homepage: "https://www.eclipse.org/sisu",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('sisu.plexus') {
      archived: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Sisu Plexus",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "master",
      gh_pages_source_path: "/docs",
      homepage: "https://www.eclipse.org/sisu",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('sisu-website') {
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Sisu Website (source for Sisu website, populated from sisu-project)",
      has_discussions: false,
      homepage: "https://eclipse.dev/sisu/",
      web_commit_signoff_required: false,
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}

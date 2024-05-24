local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-sisu') {
  settings+: {
    blog: "https://projects.eclipse.org/projects/technology.sisu",
    dependabot_alerts_enabled_for_new_repositories: false,
    dependabot_security_updates_enabled_for_new_repositories: false,
    dependency_graph_enabled_for_new_repositories: false,
    description: "Eclipse Sisu is a modular JSR330-based container that supports classpath scanning, auto-binding, and dynamic auto-wiring.",
    email: "webmaster@eclipse-foundation.org",
    members_can_change_project_visibility: false,
    name: "Eclipse Sisu",
    packages_containers_internal: false,
    packages_containers_public: false,
    two_factor_requirement: false,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  _repositories+:: [
    orgs.newRepo('sisu-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
    orgs.newRepo('sisu.inject') {
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Sisu Inject",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "master",
      gh_pages_source_path: "/docs",
      has_discussions: true,
      homepage: "https://www.eclipse.org/sisu",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('sisu.mojos') {
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Sisu Mojos",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "master",
      gh_pages_source_path: "/docs",
      homepage: "https://www.eclipse.org/sisu",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('sisu.plexus') {
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Sisu Plexus",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "master",
      gh_pages_source_path: "/docs",
      homepage: "https://www.eclipse.org/sisu",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
  ],
}

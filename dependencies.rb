# hash from each js filename to array of other js filesnames it depends on
# css will be included automatically if name matches
DEPENDENCIES = {
  'thirdparty/bootstrap/dropdown' => ['thirdparty/jquery'],
  'global-nav' => [],
  'page-myaccount' => [],
  'page-issue' => ['autoNavs', 'thirdparty/bootstrap/tooltip'],
  'page-town' => [],
  'page-loggedouthome' => [],
  'autoNavs' => ['thirdparty/bootstrap/scrollspy']
}
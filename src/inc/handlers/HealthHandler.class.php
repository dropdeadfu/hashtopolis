<?php

class HealthHandler implements Handler {
  public function __construct($userId = null) {
    //nothing to do
  }
  
  public function handle($action) {
    try {
      switch ($action) {
        case DHealthCheckAction::CREATE:
          AccessControl::getInstance()->checkPermission(DHealthCheckAction::CREATE_PERM);
          HealthUtils::createHealthCheck(intval($_POST['hashtypeId']), intval($_POST['type']), intval($_POST['crackerBinaryVersionId']));
          break;
        case DHealthCheckAction::RESET_AGENT:
          AccessControl::getInstance()->checkPermission(DHealthCheckAction::RESET_AGENT_PERM);
          HealthUtils::resetAgentCheck(intval($_POST['healthCheckAgentId']));
          break;
        default:
          throw new HTException("Invalid action!");
      }
    }
    catch (HTException $e) {
      UI::addMessage(UI::ERROR, $e->getMessage());
    }
  }
}
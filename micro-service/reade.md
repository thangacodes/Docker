## Rolling Updates & Rollback Strategies

Kubernetes provides built-in commands to manage deployment rollouts and revert to previous versions if needed.

### 1. Check Rollout History

Use the following command to view the revision history of a deployment:

```bash
kubectl rollout history deployment <deployment-name>
This shows all previous revisions of the deployment.

### 2. Roll Back to a Previous Revision

If a deployment causes issues, you can roll back to a specific revision:

kubectl rollout undo deployment <deployment-name> --to-revision=<revision-number>

Example:
kubectl rollout undo deployment my-app --to-revision=2

```
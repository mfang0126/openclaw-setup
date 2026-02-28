# Team Directory

@mention 格式：<@USER_ID>

| 角色 | Discord Bot | User ID | @mention |
|------|------------|---------|----------|
| King (Commander) | @King | 1475020838074843273 | <@1475020838074843273> |
| Product Owner | @Product | 1475020349962850499 | <@1475020349962850499> |
| Tech Lead | @Tech Lead | 1475019570807963688 | <@1475019570807963688> |
| Content Writer | @Writer | 1475020605903343656 | <@1475020605903343656> |

## 协作方式
- King 监听所有消息，判断后 @mention 对应 agent
- 被 @mention 的 agent 响应，完成后回报
- `maxPingPongTurns: 0` — agent 之间不会无限对话

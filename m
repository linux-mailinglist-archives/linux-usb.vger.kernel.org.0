Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 410AA63D026
	for <lists+linux-usb@lfdr.de>; Wed, 30 Nov 2022 09:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234413AbiK3IMT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Nov 2022 03:12:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234383AbiK3IMR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Nov 2022 03:12:17 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2058.outbound.protection.outlook.com [40.107.21.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C10FF27B1B
        for <linux-usb@vger.kernel.org>; Wed, 30 Nov 2022 00:12:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5CykABcE1vABNpQM+d0u2/IWt44Ql2QCMRirnpz7iLI6dhWfe+KVVdWE3MEa+tz7rbYP1RCUPHI3PScJpa2uRxzYTcyfZOCCOPzSdFAgsGq0irRQsJzYLXg8YmhQ4EMGDeTHQ/pdPXoEpRZSIUnBNrokBLZA/5IsyPVLfkwInU6zgtyofHTAo/o9/XMRh1ovtcCqnGoGYHQ57m44/6TsoR7wqwlTcnWs8AiEVq24dFidplHLeAOY4cW6JJAf9IC1jJDKssBdDUFygU6ETcfL3fk0QG58Fhsc+HYL49OnP/XsI7gvrnNTXM8jOI542nzbXs8pGPqlzFle4lSqA1yhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVU2GNHqNVB3bqGiwjV2zYo0GiWsKjZhGHt0BQwwQlM=;
 b=Oe7NGk7WJp5cbY+zxZv2LNpMV8ff0kS3Vk0GvbEHqd4Y5RyJD/ae0odPM7jsSYJ9jytdli6dIZui4vWoI7l7C/Q6EEflCMTB90pFDLWo6UNW6z/xc5IBZDjnYVsKXgEpMj/lAdR8jJrg1BAni0evlLJhrZhW/y5uVbpeE8dggs7vn8or/o8DiydD1T6vTPxaiCsYpT6WOXmb0GMDYSpTP4IdTY1bVOijhXH8g5VMllWMgkPR9+8ecRCaFv3BYk6T3Hx4dZcV+avndNEuMOJhdFTg7/ek50ChrZwvxpkjCjSuF5eHPlxOlwt9i8euf+2nXxlJqHJm/75ZztwL1RKC1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVU2GNHqNVB3bqGiwjV2zYo0GiWsKjZhGHt0BQwwQlM=;
 b=FlRZk0X3pB1Q3HQcWmj6MGjbyU/60O3YvBLMyljimMLAMpMiUixyY6k1vrc+PjyLYI7fPzj2gR+mR/oIp0MnuvRAaRke4LGFQ/ojd3M8+QnYgn9zysmsCgEc7UFaab8fgKs7I2bXzVNSdBX6jH4RdIjObK7Q24cXz6PAOv2ZTZk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com (2603:10a6:102:270::18)
 by DB8PR04MB6890.eurprd04.prod.outlook.com (2603:10a6:10:117::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 08:12:11 +0000
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493]) by PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493%6]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 08:12:11 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH v2 1/3] usb: chipdea: core: don't return -EINVAL if request role is the same with current role
Date:   Wed, 30 Nov 2022 16:12:29 +0800
Message-Id: <20221130081231.3127369-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::19)
 To PA4PR04MB9591.eurprd04.prod.outlook.com (2603:10a6:102:270::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9591:EE_|DB8PR04MB6890:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ba3cf4c-4448-477a-df78-08dad2aa94c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UQyu5+tdV1w+LVpnroGU2Eq2BsZmx9IhSrlaYNmmEE7m2xszzYa9yiDk9bRCWRRd2HImwqfZa2PXq6+Hj0WGf1byQWh6WU0hXWZRnmG1Z72KK80QiT5h/UtxK3NgayiXPRvhFeXkUO375e3va4O0JbBMEDBwNqs0rBXkK031zc16u411rs7SaTY1mK9zWkwqsa0OhEMI6yuIf5NoRGFrjPnHE0xhePzrVy0ffGx+x0Qi4mNByuN3U/JIgMdXJWIZYuqy5d6mz3mWOE4DyLXlhBzo109r8zu+qP9mIfVeTWWQDQ2J0CEq2XyGFzGcbCkk2LoQM8A29XYoIx/8diHlM7M+AqWPYK5YuEDpGmPy0TtW+G2lWxGqsfccbwqp2xUb8WIxqMLi3QVe1BzdVIgb+RZGk8NWCbwPgISXK+8ZT1wkTIKXICU3V/yNGgBn1ZdSnsL2BnyAJUNlOhpi5Lkz7PD9Tl6Qpv4PEF+4X4j76efzhCX5ooSCqveVSWQNe6jnqn7zWQyawaY+1k1Z511J6dV/OjpBDDqh+YWfQC+AtjDa6aldd9InyR/xibwsjkYJhDcEC32f6AtIjpoyYrRx5NeAdOWDxIWPrGVDg4Ey2Zow8QHJeP7KYNTxeMVg7CZ/qFzddBT1Rtlz7y9JhnKeH/O3NXmS8CObFK7KddQbVd5JkHcU6jD5F9y0KySMGGfP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9591.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(451199015)(2616005)(186003)(1076003)(6486002)(316002)(6916009)(86362001)(36756003)(38100700002)(83380400001)(6666004)(38350700002)(52116002)(6512007)(26005)(6506007)(478600001)(41300700001)(2906002)(4744005)(8676002)(66556008)(8936002)(5660300002)(66476007)(66946007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EyNlJZBnH7FDSi/Qsx17+yt2eIxc2GrZhU7//JHiMUSwKjRZ+WZCycY7vGXq?=
 =?us-ascii?Q?/VsI+FLMgtL1/YH1qSnQwEhTHALYk+Cd6NpHcMN1/qkqyPJ+qtGh2kXe6IJx?=
 =?us-ascii?Q?JSNd+95fF+63j5kr3yqfjR2YzsgZ6csCM1o9nQykauCHfi0XxHuMwYs4IDkn?=
 =?us-ascii?Q?MycVO+74K7RcK/g6rFcdQ86e/5MzW1CWPh20vPh6tf52s8A+L1/0pzLbzUJp?=
 =?us-ascii?Q?o0oOUJEHCy+W/NaWSqdG1SQTV+uUsMO6JFSF6I19gN5uB8UjRO44e/BYkbGn?=
 =?us-ascii?Q?BmdrWcNyvI2IcWuCf/oARMaadLk98Ed5+9dER1DDs01iKGOQE+x4iS1TIg8c?=
 =?us-ascii?Q?KksJ9axqTv/ugZ4t6psEBAn0mQhVgiuJwpheq/ZE+xB8XaoCc/Rar65FxI+m?=
 =?us-ascii?Q?n3Rt58gjxjXZsmYq2EzO38zTztMSKo35JurDZbhIctEvb5wsn+lrmRtngC8n?=
 =?us-ascii?Q?YLZLj8iCSOGQQ2VagCQPeaPgeyPeADJrSyEIBMjni25NdCNTJLh5a4nrqjBi?=
 =?us-ascii?Q?tyS+1jb66aYBOnstMbc/9aaAqZzX6n1DKwrbktHvljsotOhiBHEaGJUt8NvF?=
 =?us-ascii?Q?AdYht0PsftgAofCINucZQ4FvEwZZR8wWMYYknNFm6qngfskSs4anILzoU5tK?=
 =?us-ascii?Q?dEl16gONDjvFpedF1KK0KFY6CqLt0CTxXVb2y8cuFOsQNGYC9Q/D71G9fTJo?=
 =?us-ascii?Q?WgojaTJQGhhXORL/i6rApsydyC1gIThM3grpn9NC4coggZwiLDnfYKm8Ysjc?=
 =?us-ascii?Q?6N7PHXhb1/RzI12LaNjj+K4bGyfaJuvacmU82L+17VomlquSVFBgYK3EnfDR?=
 =?us-ascii?Q?qLd4TrnEjs0yPlxJela/uiHpRFuem3ovt628rvMAIziepv5pjKtY8VmfDf3f?=
 =?us-ascii?Q?SA+ryHrzVUUMIOdOuL49pCUXLE79oPrVBxjUrNUkBcqsZpYOU5C7PVyb8J2x?=
 =?us-ascii?Q?7reZcqsugI1N1FBun8wrfoXltUTpkVAk7yO/g8Fyz4IuPTp6i3hjo8r1IZm4?=
 =?us-ascii?Q?+5O3RSO/vbzAU6H6lESVC/XT10Q6ICuGCo/cRuJW1SL+hImxLqcgSL7PpPM2?=
 =?us-ascii?Q?iN6ezox8q0kkHN9muXowyCtTeaz23E6lcG2DGiyg1RqbyZ5ACRupgUVoA48z?=
 =?us-ascii?Q?vI8QvvRbDuFH7BOr5E/fqxPNy7gEXbku7ojd+Dj9h9384bazVzMgCv0eyQPd?=
 =?us-ascii?Q?9IMNCfflHPjz/AqBJo4nNIRef/43q9ubZmWTyYFger9Ea4FQ7zW9Jdd73kiX?=
 =?us-ascii?Q?PjrSJ6w1AaN1c/5y7vbpt6lf1gJhI+AIv0T8ZN7Y5BKCMbzQMKGsnzzktP4L?=
 =?us-ascii?Q?nNXKbaebPeU/3jUhwn+DNid3i4hL38eS1OGdVBLD0d1v70hr1ovmfJIFxgdj?=
 =?us-ascii?Q?NvDsYQ3WZ4hxiwz4KDhTBtxnTCpyDL/CP9A9mAuJ4/3QOuOpBxDAN87sk1LD?=
 =?us-ascii?Q?WRixMlP51UMHuhKhojvJV0PKkfpcelm4nPoY04C/NZ7u039HhVQAlhwZosfg?=
 =?us-ascii?Q?xVKFsvcodcEzsX2+mAq8LWChkuzIC09/if9FeQl3vshZ+ikfspFzCOfuIPNn?=
 =?us-ascii?Q?fucAhheSy9/gPBITzUEcWWTOnatPQk1hez7G46e6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba3cf4c-4448-477a-df78-08dad2aa94c1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9591.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 08:12:11.1165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQNubG84jBe/dS76nNo9HBShAWq+CBLpRX5o6nxUYI2cRGKS8CIYXVhTC5OX5WUrALyAx37gMXHDm8nwN1YLSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6890
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It should not return -EINVAL if the request role is the same with current
role, return non-error and without do anything instead.

Fixes: a932a8041ff9 ("usb: chipidea: core: add sysfs group")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
changes since v1:
- no change
---
 drivers/usb/chipidea/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 484b1cd23431..fcb175b22188 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -984,9 +984,12 @@ static ssize_t role_store(struct device *dev,
 			     strlen(ci->roles[role]->name)))
 			break;
 
-	if (role == CI_ROLE_END || role == ci->role)
+	if (role == CI_ROLE_END)
 		return -EINVAL;
 
+	if (role == ci->role)
+		return n;
+
 	pm_runtime_get_sync(dev);
 	disable_irq(ci->irq);
 	ci_role_stop(ci);
-- 
2.34.1


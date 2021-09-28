Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2584C41ADAD
	for <lists+linux-usb@lfdr.de>; Tue, 28 Sep 2021 13:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240210AbhI1LSA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Sep 2021 07:18:00 -0400
Received: from mail-db8eur05on2085.outbound.protection.outlook.com ([40.107.20.85]:51393
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239068AbhI1LR7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Sep 2021 07:17:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lA2PyAchyWGBLqH4pcm7c5XpP8KNpDAvUUGSbcnNYEn6tN5pFsq8gYKg6FH/k0IlF2XzoQOFCFtmL0xYSM5Avo17n38YxrBlUYJiqk9RtE1XxqGxFa1hArbC7Af/ZD1FhF93f5NyG4qrLbh5EGuwF6AQoPJkYIxYdh+f+S4q7GvfzYDS41cLv4rlnIt68flNgEF9MP0lnbpP8PeUrXFD0cptbVX3faoOEsH24H2d0oKUsfpfWTgnQdma1+4bq/OCgrZ6DOLXcAiIIcM27jGT2rGJpz3+ur7h6BWqLvzXUSDAf02liCuU+Ka3QAPip02XbYcCzr1yXIiQXMjjkNCXHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=lJLd4DtUzhFoZlptHqMT0j07a6W0QtwGvce1P8VaQQo=;
 b=AviZW/d7Tqi4I3UL3ZE303xM6VWonmyWyW7iwDbvoaJi4iVWRjDwq0t85nHIDRU3tiMrLnNaNH8QxKIlzT31pYcT+r1hdWEvx4ttgiiB1ZfUNVHf8bHZG2Ohdxu9J+CwchUH1CcXKOoELrO2lxnpfcOOS4nYWAHNK0uTivtdUXOczgi6eEfiIO3D0KxpqNijlzfkp4NEtqL4oxz39m4TJWXph4SMyoYSiLsDjfrtd2yYpAgSJHSb8HWkH7CX/+jrMddomu2eINsh/zddg6rkLY0xyO91wNxhH5DyZTCo1OR+8dh95Q2p5jOcGCPyaQUvHMAQUmGniHjPqEjsDW+J0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJLd4DtUzhFoZlptHqMT0j07a6W0QtwGvce1P8VaQQo=;
 b=hrUBUvbN9/wNHHmjekSf0uahg7PoCsf05CTfpXGRkE7Rqp2kVctznaOpZ7ldlEmKNKrg3WJicNTk3LIjkR/ZqMkQX4xTyfSE887wGqKws/4aajZJPNyqe2EzZF1ozoQB0YHOP9LkbE0hVfXs/X7kGP6roYCtN+HSRCNwGWNNJoI=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com (2603:10a6:10:11b::14)
 by DB6PR0402MB2919.eurprd04.prod.outlook.com (2603:10a6:4:9b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 11:16:18 +0000
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::418c:d3c5:fe04:dfb2]) by DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::418c:d3c5:fe04:dfb2%8]) with mapi id 15.20.4523.018; Tue, 28 Sep 2021
 11:16:18 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com
Subject: [PATCH] usb: typec: tcpm: handle SRC_STARTUP state if cc changes
Date:   Tue, 28 Sep 2021 19:16:39 +0800
Message-Id: <20210928111639.3854174-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR01CA0097.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::38) To DB8PR04MB6843.eurprd04.prod.outlook.com
 (2603:10a6:10:11b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by AM0PR01CA0097.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.22 via Frontend Transport; Tue, 28 Sep 2021 11:16:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ade7efe-9dd8-4d12-f432-08d9827164be
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2919:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0402MB29199664C2A854A42253946E8CA89@DB6PR0402MB2919.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5O6SKeVvqFUo6jbDSoU6oL6cBHalTtHr3xVxgTyGG5qBatBKr+8LtaAXcqvoJSu/XXkeR9UI7+mcE1BXcx1I8tabQ3kElSpbedTi1+eHHuolpuF3CqFDn9Zph6jTyxgS/bXYffPMYrMQ0nzcnB2Zz93CLH86QnpClIzfw9wZQhAIw4V5P1bJnnNttaV175DiFpwc9oZluTb0Jm5O5jCOhTqpE+OPaIUqkALkNxXF26LiLDVDJpo+zOS0jEbwpf0wi+0FMcJI3goolu9g8YHBe8JsX7vP7Q3L/4IeOX3uOsNKs9VzkmoYFnX+n7TregnR+0la3w+KjkosFq4DkgLEonBHv0adxuxuFebKYGLg/MsvY1X2jeQBJSNGq3qoEwgAQiMuOdtiQgnnOus4w54M7t80ZOt9E+W6B1zvLyWwXC6rs7FmWOfCJdp2hLvNmlhcIuw/uygEuY9iv1qQuHLHH90sjLYxCdCXHwcaupmk0gAbMrURxTJx06zBIifp1fVq67eWNXmbzqdkIfscbGE5gqLlrZHqVGBX30agqpDUB7Xq1HV693ATikK76TRJll27RqR4j6D4pX6na9JcWRx7v8BZvfLmm2j2sIZbmZIHoxVqnRENxvEHsNXw9PXXqt7XADkEkOQpJ3NEXPmrMhJae0D8SkMX6TkQXLFMDApYdHhZUaFhVl2ApgGeAIonNipr3n2h7ynHwWJ4GHUB5i9rog==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6843.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(4744005)(38100700002)(38350700002)(86362001)(5660300002)(36756003)(186003)(8676002)(26005)(956004)(66946007)(66556008)(2906002)(52116002)(6666004)(2616005)(4326008)(498600001)(8936002)(6512007)(6506007)(1076003)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QAN1w3RF8Gqz+ZXkSBbzOvlWVRNMiq8D0k3g9X9tMQj+PIJzo6GpCoNXKrjk?=
 =?us-ascii?Q?ITTvSwC6aKKpzWQ4DnvPQt7qdpPwNnXiYgLqzm/8Vjm7tbEVllBFVkQtPOOI?=
 =?us-ascii?Q?aBTUemzhtm/HS96E40JdIabp2uEqh1wqetzK/Q/cSw6RkwpFOPhlyaCrmtHr?=
 =?us-ascii?Q?HRKHGcvZADwqWyN72nSRprbzVcjBSPIIznAxm6+vvdkReACiOU23OdsgJ3Ry?=
 =?us-ascii?Q?nptdENe/NkMvGEyldzXLRi4L0n0Etz+iUsFch9xjcni8LQi+Sl9a3ZGM9FG6?=
 =?us-ascii?Q?aTxrgishnHu3xBdZBAoC9XG05dwvUW8ogsHfMjOrUICczmWZxDBeHKvQK0gi?=
 =?us-ascii?Q?LnUcYbduJYIIbIGuzdMphbXqcZYjS9dCpSsi+201oyRi+3RsdtI908cW7gFR?=
 =?us-ascii?Q?2neIZ2/aMqD7x+e38j+W+D84ynIv87cy1RNRdZ1IYIQMsFczkLuCHrB1DaJx?=
 =?us-ascii?Q?JM5b5VgQiO48b3/qgfHP+kN6jDNWijz0o+8wTOzXAfo2MYjsqoqk8J1B9zt0?=
 =?us-ascii?Q?UjQZbFUx0dEMn9pRqckD6ELfAkw/HLJfAfRjM7pmSBQmGybs4vnCpwxusPr7?=
 =?us-ascii?Q?Q4Q2kgX7YXaARzCWLoQUyti7LPngi1MsigCT14MYJQAZIvtkjFH06eE4stqL?=
 =?us-ascii?Q?OaSSpiUIpZ/mfbAyITd7WQM9Q4ydB8QXCm2yybXJtvSgdPzvwWD+3BGz00Ln?=
 =?us-ascii?Q?3obhEvo/tKB7VVguzomaZMpQLNJ97PQLCCvlGfEMBDym99EpePUi6P3UYqAO?=
 =?us-ascii?Q?gKu2N6m0dWQEYO7wnKyyN+Nzcj77R0fTL/w6PYcFp3xOhtGaPsU5Eh6iukjI?=
 =?us-ascii?Q?2OpSjt73k6LV+Q8StVC+4OrplvQ8Jy27BJvQ10kQ29qQ9/yC88pnGlbQqPq8?=
 =?us-ascii?Q?363NNaibO5ExQBLdO+vT1yW2yMlTAhR9MCpU94UDWjzrpU3ibvmIapGcOn/7?=
 =?us-ascii?Q?acavdF0rkEc8K0m9By4caX51VXziJ4HLLQvDdKqqa8LZxVp+beO1uQJ1Bunk?=
 =?us-ascii?Q?OomZOi6bZjKUHLM6NY/3MIxCrh1eCMVHAlQtp5fLp3d9NQHQFPKLOKYOa++j?=
 =?us-ascii?Q?ysYVRnWRfvxRu1fjXaBaFFlH77CclPPqxdH7Z966SkxVAp1+RWKPueCWp7hF?=
 =?us-ascii?Q?qJP/oyMYFmo5NMlOaHR1nOmscuxSoOhhywdlGK3KR9H4STR0AUdYVZlDgx27?=
 =?us-ascii?Q?f2kmKMNkGML/+vJ3Xof/iwdg9BoY/v8nlFOVBrbguIcCczN0iTznoGbWZ8rt?=
 =?us-ascii?Q?XQRpC045LWXKpuvQlZEP+e30QbGQa80hrEMJbZQTX93Mb179HdF8KQmCzuQx?=
 =?us-ascii?Q?ODtzip8e2/LyCjduj+VJn56K?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ade7efe-9dd8-4d12-f432-08d9827164be
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6843.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 11:16:18.6689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wHJ207O3j+P2z8+kTomHHmqxoqf7sNWeci38EgOO7FkFsb+1KW26f2TzYUROHa1h1HO+R4nCQPoaTaK1p44aQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2919
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

TCPM for DRP should do the same action as SRC_ATTACHED when cc changes in
SRC_STARTUP state. Otherwise, TCPM will transition to SRC_UNATTACHED state
which is not satisfied with the Type-C spec.

Per Type-C spec:
DRP port should move to Unattached.SNK instead of Unattached.SRC if sink
removed.

Fixes: 4b4e02c83167 ("typec: tcpm: Move out of staging")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index a4d37205df54..7f2f3ff1b391 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4876,6 +4876,7 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
 			tcpm_set_state(port, SRC_ATTACH_WAIT, 0);
 		break;
 	case SRC_ATTACHED:
+	case SRC_STARTUP:
 	case SRC_SEND_CAPABILITIES:
 	case SRC_READY:
 		if (tcpm_port_is_disconnected(port) ||
-- 
2.25.1


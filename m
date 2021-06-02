Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A833B398615
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jun 2021 12:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbhFBKQj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Jun 2021 06:16:39 -0400
Received: from mail-eopbgr150081.outbound.protection.outlook.com ([40.107.15.81]:64891
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229826AbhFBKQj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Jun 2021 06:16:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFX7A38BhG8c7WhRrKC7aNtJKYHdL3xz7HZYi2xsgE5cRqxOcPz2Q+s6Tg424eVQj1pg/MEILbN0WTs4o3+RNPPq1tPMbjdOmffBFAgFKJWKfGr9+pHKxD6YfjlkiUz6laAtaNfh5xB/80AZT3Q/Y/J4W5gfgjAswt3euacPWmwLiWn7dAblJt66DAs5pNpz+BXDgKElAU6vuEAHn/Jl3MRzBEypg0qTHUMQQR6T07ym4F1S/EJdw8Q13UUfRVSlefKjhW3X71E0CWM2cb3/2d7enjQCXaKvpt0NghHD/OAVRli0Os1DOlQ0O6oBYg7WL0A63j06Eth5iuzdsQ4sCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3LSXCMvAZlQR7OjqD9URwwrMbb97mdFrdpmBACeN4w=;
 b=kwXyr4j++OwIi3/ZMogWArtdBtnPtyU7SVSbvWvtW+QrXAojB9p+4MelvwqipG4Q765b/Vd9VwwfsfLJxGk0OJxNG6FIIZgBATLfoGUf3F9riIa8zWxagavNS2JKssHJYb7mSvN83dZQbSH2yuFRsrXMoU8QWePfIZnkrKeVgFVab9oLcJDNAFgHvaH+HkCo/c1cIHkdHT8A4RFVA454T9Dc2ywRPtqcvl19qiEzflfZEVkAXI5dffNUu/0dYJJr05jMIkUwKIUQBKL09a2ymk3rY7TQdbgytR7Fa1dZljbfDDMf6StCw6qTE3l0pdjRs/EosdGpPT9/MNZSiRUoJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3LSXCMvAZlQR7OjqD9URwwrMbb97mdFrdpmBACeN4w=;
 b=dA5o8kYzfEuc/qU2PFVH/KVw1UhTDZtOlRVsPmbUH8QqubKa8gyHXLpKPOWeBkrlcUqFneoAuOr6qOj6MJHrr9FWOxECzn9p0G70i+O2wqPxXCOPE1R44lxMbccLMGOUv2aC0GwiGPiiS5NNsGbddRPZ1gOH/9xLq//f67tKiLk=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VE1PR04MB7357.eurprd04.prod.outlook.com (2603:10a6:800:1ae::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Wed, 2 Jun
 2021 10:14:55 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::453c:f24d:af8e:f194]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::453c:f24d:af8e:f194%7]) with mapi id 15.20.4195.020; Wed, 2 Jun 2021
 10:14:55 +0000
From:   Li Jun <jun.li@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: [PATCH 3/3] usb: typec: tcpm: cancel send discover hrtimer when unregister tcpm port
Date:   Wed,  2 Jun 2021 17:57:09 +0800
Message-Id: <1622627829-11070-3-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622627829-11070-1-git-send-email-jun.li@nxp.com>
References: <1622627829-11070-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0156.apcprd06.prod.outlook.com
 (2603:1096:1:1f::34) To VI1PR04MB5935.eurprd04.prod.outlook.com
 (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0156.apcprd06.prod.outlook.com (2603:1096:1:1f::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4173.20 via Frontend Transport; Wed, 2 Jun 2021 10:14:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1f59307-9539-4f96-ade4-08d925af448b
X-MS-TrafficTypeDiagnostic: VE1PR04MB7357:
X-Microsoft-Antispam-PRVS: <VE1PR04MB7357C9DD900C35DF9C77095A893D9@VE1PR04MB7357.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Eb2TfasbB8mAZcRp1Kvjgyn/qz6DicyE2gEjr5mbX5Z7oDejC6YdlBVsSqjy0CL+A+yfiFfNYGsEmE1tkRmDv3s8ynY1ux8UCM2KtWKxiYgkUZ7g9EmzaDkY9JiCpLrOK78NSoFhXYsHYTpkKHPqjO8Rt//FZiY8vYdRIIOYWruEYa8VXVGhD62yWy2AT+DMR8qrJGqPlo21kcNwzkSEdEoITzA90BgxlOq8nob/LW0uXKdcbN0RYWEog4IfnZiRIr5f9LJcxo9JFC2v/IibaBAX2IYvQpqHu+zR1JKVrLuqYts2bbkJJTgRVqXkbhjMGVJvs+eQI7alAzRL2lhm/3lu7uNdppFSdPFBTvnN7NHUjS6eldVaLLjzW96U/SH4+I64Yc05hqeo6Ox5IcCZYm+TnZGJV2u2jM27Q+psWawVE753ORCVc71fR19l7+rDtXY7RZhMdVhsIl1/gUJx32673N9KAC4Q8xI5I/vqmBhjcHnf6Q9YuSL7n6PrewZWW6fm5EMqfLqURHBjEdiachE0HrwA4uMVIiKFmfxqlBi2oBG6gFoNO29VdTvvf2fGzdbnPWE64ksc8XM9fFroTXivmSEwvAxxLq+PjI44ndyyKUpn9kKJI9fhwPccGt6PRLqBFr/uRs86c3PZNAyDve/eFRmjP59SP8RTxyYX7NHbIvLbYCKoNZ1z6Mz2KP5x
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(6512007)(6666004)(316002)(956004)(5660300002)(2616005)(8676002)(16526019)(66946007)(6486002)(6506007)(38100700002)(26005)(86362001)(2906002)(66476007)(186003)(478600001)(8936002)(52116002)(38350700002)(36756003)(4744005)(4326008)(66556008)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?obNbCZ1g3iWl2CFXVqSaT51Y42y12HuoQSnaTwfUz1/0afpvz3ZAwsXzcSVd?=
 =?us-ascii?Q?AFuM2mO7t9ZJzm/7GcRqjkYOPoUWe0XCYEEUyXPhbR33EfPv2vT7CGFYtq/L?=
 =?us-ascii?Q?eeG92zObMK/OT9wUGrVKL0r0SvV9e9rwOL6n5y+18j59XOqfBfTeK2+Zp/yE?=
 =?us-ascii?Q?4RZLkXlsRyxCu0u4zMhZ7c1Nj67IbBfvQnLedBU5yDmFM9bXlPsJLIwBO6K/?=
 =?us-ascii?Q?cDpqHpgIojufRS88TPzOYtgc+6gTGa6QYOWt2z/hQWG1SWQUfDwxZ82ahmxF?=
 =?us-ascii?Q?H2n7c4M6raFga9aFqfQvmw2+NGRPuT+D1WNn6MMeYGPExEo2DS0Z+7MVlPIn?=
 =?us-ascii?Q?Cy+W3uIEN+SeQS+ukZKt2Y+ENg0dLCYdSfSngcQnLQcjHt1lCngnj85NGFaC?=
 =?us-ascii?Q?2XTpPS++Z78TtYDSwTFa7voYstIpsA4+ohl1jL4BbN6ri19w15Nv5pDxq4um?=
 =?us-ascii?Q?W07mz5NA3DZ+rWR50Rg904KQvy/WwPOGgGpqEtiRmKVntZjjYC3oJniGlwTt?=
 =?us-ascii?Q?QEP0slnAkNc7IU8TC4i9dOb+VBkfZEgyzy2kKLHl6W+8dKSb2qd3ieJ/uSrX?=
 =?us-ascii?Q?xxB69ynQKCnVSGCH3wlbF6I8ntYdFFMOvUH62kWu+5Gkxf0EPEqxUBW3wzIC?=
 =?us-ascii?Q?g2YPiHQoLT4F1vr1e6u8vfeXovFkwH8ANQz3xiMqqp1ng2FkIdpgDE3bn1S3?=
 =?us-ascii?Q?fjIHBO0ui/BYWJRywWXJq1phAaZfkSH7Vcea49ETnO5F+nITgOuG+KLktD7I?=
 =?us-ascii?Q?8X4WNJbPVn0joFr4HjUWcT+Dpf8dbKaRMia0yaWTR33MgzSWWUIyX/9RY6eJ?=
 =?us-ascii?Q?mq/wVQv6Yo/BHZWEJV1wtmXGGgzXC/IpMSRCyXnIEunoacIg2/2HZA5WFrjp?=
 =?us-ascii?Q?tl14vhVp72aPUKeqXys08BeH7Bqpc14pQzQiNG3DPrFYlWKEKWIgyoRadVbn?=
 =?us-ascii?Q?5x6gMBnZcs79+6XfWl/R9H86ZyXrFclLEx3ql1kCLET0gFSxnysznYapKJko?=
 =?us-ascii?Q?q/r5+fhGsAQ5vjkDA4nPwKKQXz7Su1CnP1A8nSkvsxFSXLzuc3soKU3GTp6Z?=
 =?us-ascii?Q?Xb5r8gLRohvxifP3zQ/lQHpeFU+A3OerCeEwTabfg9T6io8QDlWjgjkU27z3?=
 =?us-ascii?Q?WF38Db+m6NyObuMXZQwnnqegqoshxvs8gd9vWGWJZlyVP4EfRWktcS3mI63n?=
 =?us-ascii?Q?tj8TFEElGRWUZhvynk6AfIhQMEaeJIHC32VjD6bdOzIZw7d1zafAUtddrB0a?=
 =?us-ascii?Q?88scKMgghBuRoerbrSBweGBdk31Z+2h+5rJk7Pba4vGtezA0gvMaE0lj33j7?=
 =?us-ascii?Q?qYj/zw1fWmMjkekZh1sVgaY4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f59307-9539-4f96-ade4-08d925af448b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 10:14:55.2093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ez8WPPbN4+5tWKAqnat7gnCITT8l32aqmfspJqfPZlQhDBs+2NTIv/xPFw1S3BcO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7357
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Like the state_machine_timer, we should also cancel possible pending
send discover identity hrtimer when unregister tcpm port.

Fixes: c34e85fa69b9 ("usb: typec: tcpm: Send DISCOVER_IDENTITY from dedicated work")
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index c7460df2119d..2899c9de6d20 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6328,6 +6328,7 @@ void tcpm_unregister_port(struct tcpm_port *port)
 {
 	int i;
 
+	hrtimer_cancel(&port->send_discover_timer);
 	hrtimer_cancel(&port->enable_frs_timer);
 	hrtimer_cancel(&port->vdm_state_machine_timer);
 	hrtimer_cancel(&port->state_machine_timer);
-- 
2.25.1


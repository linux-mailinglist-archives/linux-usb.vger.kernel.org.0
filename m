Return-Path: <linux-usb+bounces-4296-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A796581663D
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 07:08:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6022F282280
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 06:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFCB16FA3;
	Mon, 18 Dec 2023 06:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="fcpk5U91"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2043.outbound.protection.outlook.com [40.107.7.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3F16AB0
	for <linux-usb@vger.kernel.org>; Mon, 18 Dec 2023 06:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Op7TnEsNMPut8DF217mchmJBxVmffhKt7aon2XViX5Hv3tvTP0elomrvBi2T4MDjxN/Gi5Jaq5HhrwSnWeId5gXGifzSAjSun+bt+BFxAROlcfaZi8dCzvZVEVvtJrsXFPW/X9sqS0FY8VU+dQJvbWiEYp+MDkQGTd4cOh++yyHoF/wg4dSmsNxxTvvFDtHQ6J7Br+GtSY+KI1r9eh5+0upUG5outRKVCsXl58Clb59/YPgSW+ue33ZlS9qwQkePCxZS4qrLVVDWCHLdUimkUH+tuA2fleNYL6UqCgtUn//EQ0xsVD+RkDJZNXSnU6rBh9SnnAjuRPln3vQLTlPILQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xq1MyAjGyTGWxmdxGTsVG8Mytvv+w3+GwNWUHLAZWb4=;
 b=IqHRqznmdGciAqDbVhtluGvF+CavPBtz/oZLP6YQdFRdSG26Jzi/Si5uEI94PwJsgc+0Z8X3t/QdDjkbqv7ATHO6BH+e37FvmPgZshP1B3R51ruKRWOJWrbtNFKdLKMxojGwmSRSWdg8zXcJoHSoFFtq5mNM+1vunKcIqX2J7ccNHz6tyOQnZdi4vcs7S+Aaeuc9uiB/tiHT8CcQRLIyMRc5HwMKLOAfhUhxqnGSQTsj+6gNsuGwNJlM4Ms5LjmyRI5ScHbM+1vj6Vd+KexY07fOKPBCWPDA3vc2ceB/9JeOYqrerVPRp9g8mV/zrr6YRyE1ghdmHym5pE/KryC9vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xq1MyAjGyTGWxmdxGTsVG8Mytvv+w3+GwNWUHLAZWb4=;
 b=fcpk5U91DZHFjY7gxTB3eZpnOSkxZ3VmElj4EqeyCBIGz+ZczOYQkQD7xl1aAVhthAkutxA6bSQHGDFeYshqjq8sk2JoFI4/GaJp0K1lkj9ZPCzIvnadWHpkICeBkPi6hd2NtAAyDBIkpBHAdOUa3r01Cvh0ams2YIBCH5BvP7k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by AS8PR04MB8625.eurprd04.prod.outlook.com (2603:10a6:20b:428::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 06:08:29 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30%7]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 06:08:29 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org
Cc: gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	luca.ceresoli@bootlin.com,
	jun.li@nxp.com,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/3] usb: chipidea: wait controller resume finished for wakeup irq
Date: Mon, 18 Dec 2023 14:14:19 +0800
Message-Id: <20231218061420.3460145-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218061420.3460145-1-xu.yang_2@nxp.com>
References: <20231218061420.3460145-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB5146:EE_|AS8PR04MB8625:EE_
X-MS-Office365-Filtering-Correlation-Id: cd2fa90f-7c25-470a-7608-08dbff8fc170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ahEKuNg7OWq8Bhi5OjF3jYlgjpsqSf3X8+8HsYEtEpBho/3IOjiCZIHTysGrDV84fS4uSkqWmmk9OoOIhaDBYermsfUXd+9w4FEVWKwzmeSf0sn5VziJZi0RrwP0w6eG2VjBnhhTDO3+vwkgZQUMA8CSIqJGd3OtYH8KQftChKrOyfTrUWRcAeyfFLL1SLw3dlODGzpaWThdEXTnnSN/WL4KxdOUp3OwOG/W7zjdeDlmSpI/LaM1LaM0sVqL1Hz/Vos9B3JytJAQyoHmsIlidx1INfVRLslyXbvunirADEksmFlFTytry6NabEvqsMx1V9MI09gsof+b/WTahTYL2M14gZRYMt3QNmsveuMqB91Mo5eN2eyo/a3HC7/iIcPc5YrFas76BYjy/mL+H6YC0ibdxubzEuCWIWQenBIgIsRBH0cY2KwqsojjuT4oJWDQjy//tlC1hBo+iCcVgaXfIk3iI+ozp7KijWGDbslAFxKi+qCpb3SbPZ3ejE0i/tqv6ZwEX+zXAp2JvWHiSDW2m4OKssAi8ArMRbCm+6CF38rcxeCvsc9rZ9xTjG9ucGYlfaQCjJBsJpkMrPZnj7Q6IepvEpnxDByINn49HzCOt1TuwzobmuHeWUjXdSX3SkS8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(346002)(376002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(1076003)(26005)(2616005)(38350700005)(36756003)(86362001)(38100700002)(5660300002)(6512007)(6506007)(52116002)(6666004)(8936002)(8676002)(4326008)(66946007)(66556008)(6486002)(316002)(6916009)(66476007)(2906002)(41300700001)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tiH5XGenCXDcXVvx6gSQnqMfINybKl5mAiUPYpYGh7/5oC7GEtEiA/YPXr9g?=
 =?us-ascii?Q?Osk7EA7N/cigh9MADUxGDSP0vM8NfgnCxOv3DLZ0Tkm+XUbBhB3jzhhD4Grq?=
 =?us-ascii?Q?qViXP0AEBazhqpWDTOvMXPYJiTgwAVt+KgaDHhKe9AzuoxbqY7G3xKHL+apn?=
 =?us-ascii?Q?AasQGpqNyjZqyCkUmoAOD8RsUfpzOlFC/Mae680c/TSXj7NbiaHFYlgTAAbG?=
 =?us-ascii?Q?qKHtRwc8WnPnWJhASaalCj50adXHRPxgE0c3rFpuH4LWhghO3D0EGNmb9PhI?=
 =?us-ascii?Q?Fp+om+efagD+JQpJW5Ae7RIRPnP+w0n6wuOP5+qB1y6KF3f68Pe6Ym0yPNDO?=
 =?us-ascii?Q?RuOj++djGMJNLnypYkkybufVkSAD6PF3HDXAgte94zabR2kPcdMZdKJjaJHc?=
 =?us-ascii?Q?Y5l6xDZtCljGpErmxXpAP6fo82sDvwI3Sm0VbvDOrFabMxjRzZIT37dalvug?=
 =?us-ascii?Q?oVJUbQPnMrlEYPpPDjCVdxKH0MuSxnUM/yQuKqB/X81eFO7GXsUDVSw3W8fx?=
 =?us-ascii?Q?7GVg8CCTej9EknSbuQFUs8yOyJeSggDmcVBcXt4q8qjhdnQ5EikNfc9lTLSQ?=
 =?us-ascii?Q?uWySvnssODeIlxouNYifqKmYjTiCQ3IPFLT3VjQyg1nOyg6OrTWb62pbI3Nd?=
 =?us-ascii?Q?9rhj8sHc1xIcgZeETNgDjyW7CDvbXMh0iQTeAL8Fcq881+cBv8jRKKhEzahE?=
 =?us-ascii?Q?KVSS9l1DahyxqpG8OvTEom4V150GweMkhFJShmV1PMK97KOZt1RvnHieRMxq?=
 =?us-ascii?Q?IH/lU0RzLIrgTyUxZ51GnvQBoLS/hLQUe1mxCQDYr2oGf1q+qByteGuTQQS4?=
 =?us-ascii?Q?B0eUJ+MzphPMYZbKKziNT9bGJzfvUoTj5AINPqIZMhixkpezHtpu/ibQHQGn?=
 =?us-ascii?Q?IDZXkVmzwA/Cleb1S1Je0RptgKi2hCz+uBGRvQl8BAWG9QH6A+tNSRU2NSvs?=
 =?us-ascii?Q?aIMs5N/sivBJ2NAfGMiIduGz7VGaea/hUDf10hwHvWTvgATSlKjEQ3vKKnaq?=
 =?us-ascii?Q?plY+/qO/zEVfizqolPgZ/gpsCKqGLDScDeyAhjDjM//ddajBiM/TiK5CKOov?=
 =?us-ascii?Q?MmVxIPTmb7p19+NRItjiN8GAQcl0FuJNFOnLUHoDi0ay+3Z+mfDwbzV0PnS7?=
 =?us-ascii?Q?qJTFhFgTL0wucx4u/w/FGxgkyJ8id8zdv78AATE5f3ZJExt/GZe3mzCuqPKx?=
 =?us-ascii?Q?Ek0cZBHjONjWlbe7dU/pp/RFyPiPcDpgtrYBxrZRkJPqKDWhzUzKnBLzyz+C?=
 =?us-ascii?Q?xQkd4nrYHGWk0T/nTc9bgi6jf4PjeWMn8Fz44tqNR7eHexYKBZwWL+jNXme6?=
 =?us-ascii?Q?LKYvXtiRF0+xBYFEAyvbXvjKPI5BDfv3ZXFJCrRfj9/ZmLk6OyMFcBz5NDrH?=
 =?us-ascii?Q?wLcQzIHoeZtEEZKwUfzFVwq9/nzcUjwNDuivQxOXCxnpycR7JHVfIYS7M4Rk?=
 =?us-ascii?Q?w1mW+70QH7XgYaVlS4fWtQEqRZOUyK0/s41zeKFhXV2Tf3mlMD+PIygmyKKc?=
 =?us-ascii?Q?a/HeOH7Te+/cxwtMva5cAiKjulDLzFdFF6plQjhSnqYyfPQlEzjO2TRplTlK?=
 =?us-ascii?Q?NLPCm+fP+Uay63OWaOyt26xG4uh6Q+Y1Wkpye/V7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2fa90f-7c25-470a-7608-08dbff8fc170
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 06:08:29.5513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M8MmkvAN53uhHHGJ5Yy9DxnU6c6dF8G3CQo8bWxbEG14plNllVW6dF3uqwG7uVDRm8yteUKCuRfvGWa5WiLnkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8625

After the chipidea driver introduce extcon for id and vbus, it's able
to wakeup from another irq source, in case the system with extcon ID
cable, wakeup from usb ID cable and device removal, the usb device
disconnect irq may come firstly before the extcon notifier while system
resume, so we will get 2 "wakeup" irq, one for usb device disconnect;
and one for extcon ID cable change(real wakeup event), current driver
treat them as 2 successive wakeup irq so can't handle it correctly, then
finally the usb irq can't be enabled. This patch adds a check to bypass
further usb events before controller resume finished to fix it.

Fixes: 1f874edcb731 ("usb: chipidea: add runtime power management support")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
Signed-off-by: Li Jun <jun.li@nxp.com>

---
Changes in v2:
 - no changes
---
 drivers/usb/chipidea/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 7ac39a281b8c..85e9c3ab66e9 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -523,6 +523,13 @@ static irqreturn_t ci_irq_handler(int irq, void *data)
 	u32 otgsc = 0;
 
 	if (ci->in_lpm) {
+		/*
+		 * If we already have a wakeup irq pending there,
+		 * let's just return to wait resume finished firstly.
+		 */
+		if (ci->wakeup_int)
+			return IRQ_HANDLED;
+
 		disable_irq_nosync(irq);
 		ci->wakeup_int = true;
 		pm_runtime_get(ci->dev);
-- 
2.34.1



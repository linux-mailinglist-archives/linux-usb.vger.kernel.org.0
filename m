Return-Path: <linux-usb+bounces-4602-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2AD81F774
	for <lists+linux-usb@lfdr.de>; Thu, 28 Dec 2023 12:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDDAA1C22CDA
	for <lists+linux-usb@lfdr.de>; Thu, 28 Dec 2023 11:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BADFD6FC3;
	Thu, 28 Dec 2023 11:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="reufqZ1J"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2086.outbound.protection.outlook.com [40.107.22.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674C56AAC
	for <linux-usb@vger.kernel.org>; Thu, 28 Dec 2023 11:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a287cK4d/iqV9V3bsinLigfV7ZyyZUN0jMRDRzQdq0d0wu1Aav3DjmQvicBAH9ecC/ZbiicAI/bw/6YJjYpjxPOlp0GDaHFMTfKlLg2Kp562otoBx2Xz0TQh6OcIPCwT/RdNBmnr+LqzIBnIzrTaRg06g79ersBH1bi3AqRhnMRw70joPlMtT9E+cL77D0nZaApZ7aDZOiE0o0TEUn0E0GZWQQDSdF+5oxByCMXQ+S/pJAzdTzcuGcCeMSufmBWBWQpZwuD6KFLcQZLCNPT5JoBDnY/ZlLFBJqXQdwXPtWLYRx3rh+m5+enxAOz69Z/orn1WYqLVz7+KT1n8cHoChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KH1j8qRhxouJwSAWosvyH/P/e6yzzfyv6AHuaXWNi1w=;
 b=FYLXt7SWLOQ4s1uvCaFdA833Z0jz7sy/j+Wza+u95ZU4Hce0WRc3UtM9eT3fAZntXuzO+mhkk5YLch/DBCTAGjUCrma2f7X+2n+AxBlLQYlV+aXJLtq5QjMsA9vz0rFpaMksfRV6SdECrCHkfq2RjIh91vibm/v7dn228yGExOv+WAWnVlZ8HP9+tOeR80ms3Zje1muzLu28ma+PfCV1NwkfyN5VB/3Quppm8/n4/LUsBTV8w4g0A5pCsEL9frthoIu1cWQx0/Jfi/LaaLhS8y2Pj9TiHfRXW4Q/P/qZAzoH5bjDzj18Ug01Tq/EyGhxCg/rLN0qYMTqrDZJxNz9ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KH1j8qRhxouJwSAWosvyH/P/e6yzzfyv6AHuaXWNi1w=;
 b=reufqZ1JdBpAKojcOV1H3Vkdmz32132Ibsct0fJVQ8c0jIz5Ln+s2llnXK4jzOJxd1Xt5HRBjFJNXkMw40h9YqcMDu6s3WGOhx8SEQf4dGQFlYyfltOb48wz9z6huLCetinDUsS48c94O+6yHslSLWoSpLWZMy74EylLFtwahE8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.19; Thu, 28 Dec
 2023 11:01:56 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30%7]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 11:01:56 +0000
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
Subject: [PATCH v3 2/3] usb: chipidea: wait controller resume finished for wakeup irq
Date: Thu, 28 Dec 2023 19:07:52 +0800
Message-Id: <20231228110753.1755756-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231228110753.1755756-1-xu.yang_2@nxp.com>
References: <20231228110753.1755756-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::20)
 To DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB5146:EE_|DB8PR04MB6795:EE_
X-MS-Office365-Filtering-Correlation-Id: 6657a5f0-6dd1-487f-1ffd-08dc079467f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FlWXCD9L/gLGwle9LbILEmfv8tAXzt767PCR921RTc4BvIQY7XtWXNwlPu4/u0KU7k/mbB6DySiLS8ZboOyaqsvEV67WAiYFmLmgBk1KBer0YHpJYr55fkLYtuU1nmubOVIY653V3cLqVjBOnbTVRRRPsS9g9xgY2dUIQeyxAHapAaGUxo/CvgzAAXX76fAbv5bZpCCtRevz8JEDYBDdje5ERtPzJjkOfTJv7EOp2IheUFvqvk4NvzWpeCkQeruGmDzy3zIbyCpyoimMRoASRVhNC+nhq5lO76BpYnK/kWjDQgFZuoPhiFy6jhjPiOe27ksRI/sTh8EFmrFQhLwai0SXdbjXYpIIjKggVup+AeliNW1A8LCVbcAivDGhH7vkCoap4ZDQJhE6DtEsMRzTFCEboRE7Hi/j8ZuO2XAWTeBv6rSXBoIswSOr/3Fc3rEu/2wijyj6SFhjOhhSk8gvUXpW72oq7QHKF2NrnJmZhEe2u25RtKJpg8ZPCQCL/0YcvJyMIHO02IT4vhaP65bDw972HUVFeHp0H78TzQsFeXfya+E6la9D6q2NKvU0L9YvOr1fsgtzwEsX+PKZoYa1MeeIrxqI44SkEg7gDQyhKo6QKNW6WTaWFPfw5GXi/wgW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(136003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(6506007)(2616005)(1076003)(26005)(6666004)(6512007)(52116002)(5660300002)(4326008)(8676002)(2906002)(6486002)(8936002)(66476007)(478600001)(316002)(66556008)(41300700001)(6916009)(66946007)(86362001)(36756003)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?arPfzHO5164Bbi/Gntr9ONPMaT6o8fZBf5ZpAIZTi6ileXZZ55CPb4Rp48ss?=
 =?us-ascii?Q?2e3nRLx43ZVWAElB1OonaysgPKe+lEBJxTSCWGVP0zbuVY0vEMkgTfE8PzXk?=
 =?us-ascii?Q?7UdrvltNkqEPqxasuMh/N8i2aE7GqHKuQdrGykD83ZqzK0O8r10Kktv3Cd8p?=
 =?us-ascii?Q?9CrGPLLmQAgXxIzaT0ExEwJO0UQHA0M6mQi6JYOi9qy4pWXBODIlTrWvFEZI?=
 =?us-ascii?Q?36n2n8Fi4GADu2WHDPqdPBLP4Wqr+Ui3KzSACkrk2AoFMdgrUkUlyoge+vNV?=
 =?us-ascii?Q?K6jkxv0rxWcnhtqdjUhjBztsfp5jh+e8VBKjC8gE5I4yrFuuvRBa9jOyzN9l?=
 =?us-ascii?Q?DMVFknHWq3Ny7QI0yNWmxlKvD8jCljTcUl+U9shu0EAYtYsBqCFRNwekumyy?=
 =?us-ascii?Q?Y/8uH/uyLUvFxfqWj5Bs72dRVpzQpEljej602FGLdWPZshmc7w9PA09ylakf?=
 =?us-ascii?Q?/VPMymthNIQtqtSe4Q/1/eYwbWt1jKR+fiFM36kV/JZgl49mS2aK9sGZ6vPh?=
 =?us-ascii?Q?DSpIut3Eciu5jPdxwyHwjgB8zi6lx9B+QI20DV5kH+uORT7tfDPxBOkY98zY?=
 =?us-ascii?Q?pls/vXk2z/FYvceAV51DJJzJqN7g7HB0g3G5yuRxnj53UjrCLxjdwJh6E7cU?=
 =?us-ascii?Q?RonV5xDq/QtQoutj4vmqsAyWNb4cassF4D03TXKn4yis2uQtu225UwTqVUlb?=
 =?us-ascii?Q?j4L+EjOLRVQNXLrBSpJqtJ5vuJPctQdxYHPbFqI/8uIaTn961ujS/7O9HFtd?=
 =?us-ascii?Q?erjL1+CXjR3gPuu69swaki+WU8qOnCNpTd21vMwm04PArqCTXEQrz9XT/EMq?=
 =?us-ascii?Q?4SmZlctwxisgb3/4uSqzZoY9eYm9rWMMB1SbT+7J7REIVYUbcnr7ewK8QcJd?=
 =?us-ascii?Q?VDJp2wFvvaH+u/pCppG8nbixO0PFnQ8Np439cS1bi/V9cXIe99E8fbji6B88?=
 =?us-ascii?Q?WDB6LpST7o+5/b/MBOxUNsk3jGG4aWU4UdptKV1auwX48bk9zl94gTW4jWF6?=
 =?us-ascii?Q?r6/K4omOtSaZXuaFs9GMuWrAfJeQOrX0MMqGJhb9ffjii2mvNivSKhBN5KiQ?=
 =?us-ascii?Q?hFmIlVhFfCvQ+Hkk230XtSrCHtGD5mH5PB2YZyXnrF6xBD7bldTGpN+6S/80?=
 =?us-ascii?Q?QiaHlNKm1lntzmJIf+tzItqMbi4FpCrRI2q703ibj3UFlj1tKYhqLr6ZOFkJ?=
 =?us-ascii?Q?oVFYbGxG3bMGlpGFdsitGulWXNobrYkpvjiYJCMA120T2gPpCEOBFVuSxhDI?=
 =?us-ascii?Q?i8HEz1/nlijk3ihc1tTWLBUjpQIogh3jw6C8IKPrOeE3xm7KSIaKNHKSEjxd?=
 =?us-ascii?Q?m4G3qRglcNdG6fcuuymvYDE0oJ66czs7qjBjWMAmFIgFk2thiPv1+NUeEKEC?=
 =?us-ascii?Q?rOx6fGpB1n2BIa3swiTIZaZJHCgBCYnQ44lN2PDuZ4ZNydwjsK9C+a1rKpQN?=
 =?us-ascii?Q?bMXiYgwemeANWe8QjJpXVX/Mr4VZRHqg61vOIm26FchOjq1gEnheDBN5d9RS?=
 =?us-ascii?Q?NK+A2waWFPta7JXeQvBZogXi5IfR2ZxS9GqiO/dV+bbD+HzPnWPCQYPK3X+0?=
 =?us-ascii?Q?raMLKHjG1XxSvE5DdpyBwfQguSqskkmloTwMnI2E?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6657a5f0-6dd1-487f-1ffd-08dc079467f3
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 11:01:56.2006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ao2U/GTUo/3ef2MYQGFSlvNR/8Z3wqfuDGF/pocYe1fPvrTtm5SkgBlmpFTaK7vRViN2I3IwPowmYMsWmu5aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6795

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
Acked-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
Signed-off-by: Li Jun <jun.li@nxp.com>

---
Changes in v2:
 - no changes
Changes in v3:
 - no changes
---
 drivers/usb/chipidea/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 0af9e68035fb..41014f93cfdf 100644
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



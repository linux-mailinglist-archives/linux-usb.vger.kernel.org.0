Return-Path: <linux-usb+bounces-5271-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 692DA83297A
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 13:29:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D66B81F236A6
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 12:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C564F203;
	Fri, 19 Jan 2024 12:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="sntqoYwt"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2087.outbound.protection.outlook.com [40.107.21.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDF64F1FA
	for <linux-usb@vger.kernel.org>; Fri, 19 Jan 2024 12:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705667359; cv=fail; b=AjIgGLQgrReXWp4c+rtYN0wBK5+MNtzv/Ttixw1cU2wrf/mts+6Lsf9aaIbCe+QX20Jtb03JsOHcpIY/EAlpv7Bott17iAeyRo6XYQvcLMOJnUEY/pwOlO+d92W5IrYn1fLqttEbBXiiUuLgAvJtEoNvCTAVpdJJnt9WgtDQS9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705667359; c=relaxed/simple;
	bh=RPdq27X9DON4FvXu1kHtBpOzsibLmbAzq7+23iqAJ64=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=XcvvWIb0bKPy1fjJaldb96LcTlWALOLPN4a1QV3Cx8ljdy9vkKsZnRqqL3GbYMFJOeYj8wyDcWftRUy/iJvC1DwbOtsM6eZE21hwPcCGCZ0pve1MDZTkhJrFvREJ0/Fl9Nz59C4q9nsNspj5/GLRCXumEZ0WRCVicLvLaMLJxrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=sntqoYwt; arc=fail smtp.client-ip=40.107.21.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgNAkJf5R2vhHLaPbgx9NnXFLOn1W6rFGyaWIVj66KavzF9lDuhmPwod1boDkf0DuU3kThnxXrDVRSaJk+U6I8yz8tzSOPuF5Ykd190d7FwZ45+XQj8L/k+rXv8rOwNEtAUmGPxJGy/i0r8uXrUDvxVyJLlSDD1lDFSyUQq6Eo5Fk5rHwDntwDgCLohwem2mDZhEH+OqZOnBybbRlcFCdtzLScbs5UpqIYc7LkdNrnlPmhtCuFv47HAe9BENMWUEGAPnVlRQ7E0+PgmjNrjhU4J8ZiBMkWl0/qLiYagzCiDCk5J+or4ftfDAvE2rgeDaBVzjOyPeyNmV+gnGqaWymQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqFZ4K4IInBfrn6Oi9eUieVSplLIM9q06obx+kG1Ozo=;
 b=cvD/L/Ptbj9GQmgxBYb4icV8zdYvMxEcfgvTC0J1h0Ll7+n8O0fgzubGP92KFQDo9Fa2N0vyxZYsPHjZuWMiVu1u/5kqsSJcEumWuiHRL0MUK+4vjHDQ5dn7XeF/y88a+KmuM8/rzP3iXRBU1MHO1vCtL8JAtWldb2BqyQBBgmbPyni1aufC8lPsi0la22r2MiO/PLnNDsi310JQKJwlnHuTNxJ5gPa+Ry3yYu0BKQYLbAF2m1rEzUf6nplz/B0mTSpNQ07aOjFWo9TG4qcTpHBGd6BNV/OxhX15bacjp7mzgTOfFrJj046vLp5MKmq75j3d5VByNeddG/8mdhdD8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqFZ4K4IInBfrn6Oi9eUieVSplLIM9q06obx+kG1Ozo=;
 b=sntqoYwt68a0L2WKodpXU4wX869penrleDCvmWNCrS+Y0HTx3jm/rAKIU7mePmCIkhP6j+o4FJl74dxXztQ0wd9w7kNMjnrP6gJyZuAk9MQQeuCw/HPpPTvX/R94O2IPCqWTXCznYlfAos5ZWVqeTPUeAzy2txXwwAEzwHZLxvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB9PR04MB9308.eurprd04.prod.outlook.com (2603:10a6:10:36c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 12:29:13 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 12:29:13 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	jun.li@nxp.com,
	linux-imx@nxp.com
Subject: [PATCH] usb: chipidea: core: handle power lost in workqueue
Date: Fri, 19 Jan 2024 20:35:37 +0800
Message-Id: <20240119123537.3614838-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0181.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::13) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB9PR04MB9308:EE_
X-MS-Office365-Filtering-Correlation-Id: bbecdf55-dfb6-4634-44dd-08dc18ea3ede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EkCOvY8SU3SpQhjgi/V1bRmFrmkdC1I9MGszjIQZdSH4Y/ru1NoWaIwE12q27tpuKEyb7IikZkE0JczxyZBYF+aWDQBfaPRvqUWFpWhZncIZ01pUUclkZeW1qlUk6LCIxWHG4cAPTBIpGk5RMA1Bgxt7gsCgzLmghOsU96UZjhyvAMwOnhtY29nmgR/CmxRQ2a9K5Z/HnDcxwOucqzK9NVJK9xv8GNI9CoNBQMq86euEdIJ7bhG8LggFoY6WmbfnuaQr1Vhkay5n6QvwGbi2Nz7UkRTbhaDwnuRLlk8iJ5pVPInf3+0c4Mnri3fL0jlbbVrxKoY1ww4ouEjwURzdxK+RluawiF8QQ7WV6sIjzrgZrkrHTkmbWRMqeYPBwRCdgVd2tdp6zMQ5CTuj0AiXhDy37xHCQjfSntFyZ0KMzATmKQVTJi5+lNUITDtElTf56ZuW4Ji21xQZk2Sd3Jbd5nv9S2zzCxX4259b11JR1kpB/kb/6S1rfhMrY/rD9RGLSBZuYf4gSzY+Zl7W6QJ1BxNtB2gxUyofSbsl7QyK6tC12wDVnVu2D2VUIR39Gli6obuojfAKiqdSqcjKXU17IiPPp7A+GQNtlz7fCT3JRKyncwtXL2gBWmH8Hcso/tGu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(346002)(376002)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(66476007)(8936002)(6666004)(8676002)(52116002)(6506007)(4326008)(41300700001)(26005)(38100700002)(38350700005)(5660300002)(1076003)(36756003)(2616005)(2906002)(86362001)(83380400001)(6512007)(316002)(6486002)(66556008)(66946007)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XTpFBt/EBj96hTrNhj6kYglqVMxxyouz+kPLUcxGHAeYb8Dmfo37BoLmLKPL?=
 =?us-ascii?Q?o/uRMn7uk60pdmLwgqaWXmIb08AimADOiUMn2Dl+ED5aYUrKeQ+G522p4Utq?=
 =?us-ascii?Q?7WULM+iLMu+SVz4RRSnngtTF2CZ6y7hZvoUXwrrH5pqHw5H4N+OtbAT6ssxK?=
 =?us-ascii?Q?ukOCJCt+ScCBjJV8Km/gPw9pfCNV6Inh/KXuHFS6YiXsKV5+TKyH06r7AJA1?=
 =?us-ascii?Q?JclL2/yNRr4eooNoMr95kXcnGvusqm4OfxUSVYY9aWCDAaWu0MYLtpbKFnMK?=
 =?us-ascii?Q?R4s6NKcGpKbTqWU3G95dgt+uICIIYUZWnlPiz6xrYxR7qUgdZ5+A6rZed8rD?=
 =?us-ascii?Q?th24/4ytwFPu2X1hPutNQCMzQSl3+Zd/z04n+ei4OWaoqhKjTzCrTEMD35o1?=
 =?us-ascii?Q?ZKFa1BsDHDU3H/mirOWR19LyXVBw2QZcpPdzLh8iFsJvRwSym7IYTj9BGy7M?=
 =?us-ascii?Q?6gHLLxxKbyjXiQngsX7yNRR/u6bdE0gBNLRVRfCR6oJdhHxggy1q6je1Ei27?=
 =?us-ascii?Q?Sn5cgzxXYqDPmYnaZNCDbZjRxFo/dqVLprSws8z2QHlABXq7ZfnekDRkFWE3?=
 =?us-ascii?Q?A3+ZeTlqBRmx2eDLXyX0voWH3+mkK9I9AojepP2/uePcxjDvxKSIiJqY6K2f?=
 =?us-ascii?Q?ymlcBcGeFOqcIEpuiGf5hs2K9Of6ufeXBsn+BxPqZ+MTuLssXuD3//PXyXsv?=
 =?us-ascii?Q?Gss5MuYIOxb1oz3hrJWnTBmKXEg0U2JWq6oeiRUPpY0fglaJEyTD61HN+J4v?=
 =?us-ascii?Q?CcgCC0psYO35hJBYg/kLLmpElWNg/7iecajLvFAD6/7Qhez1pdLTvNvp4jQa?=
 =?us-ascii?Q?TOdHMRdbyXg/qa6mjwf9NeV33Z9znuyPgzOwTvIbzs9tn1f3fwWqtvlMWq+Z?=
 =?us-ascii?Q?vrjg2yN5F8xMyubY7ubD0FbKc0FuO44P1tWUhYSzFoiv4pcWTo/TjqGk8z89?=
 =?us-ascii?Q?q0OwyDPL1D6A5K+C8M/tCq2UlBmUZcVqsfIqcIH0BSamOOs3EpdaQqyvyG3e?=
 =?us-ascii?Q?qU83CetkO+EHd6HiS9qfzLEGAkoQbrphI1BHT+ZqInvEfuTAcRY0Zd8+Dh8t?=
 =?us-ascii?Q?Mu65hpCBfLj3vKZ4d+PLa6z+5YbC+Wszu7VXMRkwAQBhlbqmX7SNEegMrwLn?=
 =?us-ascii?Q?1186OL+irHcU9eDrESL1dq/E4DXdoPNLxUIPkM8zscgi0Fcr2DjAvxl9kRb9?=
 =?us-ascii?Q?vQpQam/mldqurdPxexNCvig08NkNgYikY1BDYWTjCV9Ba7DHFEPFirZV909V?=
 =?us-ascii?Q?fzcYKBI8E6p/4X0ROBz0dW6a9oJKfkBTbZFLBVNhX4smh6Kwj0f6oTdqlKd5?=
 =?us-ascii?Q?gfSkK3YGoXWANXNV5MJafYdIuuX78CFfgyAG8ftug5cF4Y5BXar22AEhsjPQ?=
 =?us-ascii?Q?byJXjqunJ6JSadwQQEMmiF4030hbjYZXbyaXu1bbSjDzHGspN89MKizrODsX?=
 =?us-ascii?Q?8RUAt0+wleMnLOkwSsQv1mlmXnmcrJB7merw4SgVfBgK9IpeQElYa8BixfBG?=
 =?us-ascii?Q?UgiVYtP3wjLvUHd2LhhucXN+6wXzNtSpDjOBG54xaUGzd7tCL41gIS7F7df5?=
 =?us-ascii?Q?zI9HPG3Z7hRvJrkbE/J26LNqQV/B7OE2ikJvNnGN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbecdf55-dfb6-4634-44dd-08dc18ea3ede
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 12:29:13.8743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6XumOhCeyskh0mu0Xb7zAgTz+Blyn14rI2lenUTF/Fhbf46AbTWxD7YQCbHh7Y3G7y0dZQvfCxsUPxpIwT+cfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9308

When power is recycled in usb controller during system power management,
the controller will recognize it and switch role if role has been changed
during power lost. In current design, it will be completed in resume()
function. However, this may bring issues since usb class devices have
their pm operations too and these device's resume() functions are still
not being called at this point. When usb controller recognized host role
should be stopped, these usb class devices will be removed at this point.
But these usb class devices can't be removed in some cases, such as scsi
devices. Since scsi driver may sync data to U-disk, however it will block
there because scsi drvier can only handle pm request when is in suspended
state. Therefore, there may exist a dependency between ci_resume() and usb
class device's resume(). To break this potential dependency, we need to
handle power lost work in a workqueue.

Fixes: 74494b33211d ("usb: chipidea: core: add controller resume support when controller is powered off")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/ci.h   |  2 ++
 drivers/usb/chipidea/core.c | 44 ++++++++++++++++++++-----------------
 2 files changed, 26 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
index d9bb3d3f026e..2a38e1eb6546 100644
--- a/drivers/usb/chipidea/ci.h
+++ b/drivers/usb/chipidea/ci.h
@@ -176,6 +176,7 @@ struct hw_bank {
  * @enabled_otg_timer_bits: bits of enabled otg timers
  * @next_otg_timer: next nearest enabled timer to be expired
  * @work: work for role changing
+ * @power_lost_work: work for power lost handling
  * @wq: workqueue thread
  * @qh_pool: allocation pool for queue heads
  * @td_pool: allocation pool for transfer descriptors
@@ -226,6 +227,7 @@ struct ci_hdrc {
 	enum otg_fsm_timer		next_otg_timer;
 	struct usb_role_switch		*role_switch;
 	struct work_struct		work;
+	struct work_struct		power_lost_work;
 	struct workqueue_struct		*wq;
 
 	struct dma_pool			*qh_pool;
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 41014f93cfdf..835bf2428dc6 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -856,6 +856,27 @@ static int ci_extcon_register(struct ci_hdrc *ci)
 	return 0;
 }
 
+static void ci_power_lost_work(struct work_struct *work)
+{
+	struct ci_hdrc *ci = container_of(work, struct ci_hdrc, power_lost_work);
+	enum ci_role role;
+
+	disable_irq_nosync(ci->irq);
+	pm_runtime_get_sync(ci->dev);
+	if (!ci_otg_is_fsm_mode(ci)) {
+		role = ci_get_role(ci);
+
+		if (ci->role != role) {
+			ci_handle_id_switch(ci);
+		} else if (role == CI_ROLE_GADGET) {
+			if (ci->is_otg && hw_read_otgsc(ci, OTGSC_BSV))
+				usb_gadget_vbus_connect(&ci->gadget);
+		}
+	}
+	pm_runtime_put_sync(ci->dev);
+	enable_irq(ci->irq);
+}
+
 static DEFINE_IDA(ci_ida);
 
 struct platform_device *ci_hdrc_add_device(struct device *dev,
@@ -1045,6 +1066,8 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 
 	spin_lock_init(&ci->lock);
 	mutex_init(&ci->mutex);
+	INIT_WORK(&ci->power_lost_work, ci_power_lost_work);
+
 	ci->dev = dev;
 	ci->platdata = dev_get_platdata(dev);
 	ci->imx28_write_fix = !!(ci->platdata->flags &
@@ -1396,25 +1419,6 @@ static int ci_suspend(struct device *dev)
 	return 0;
 }
 
-static void ci_handle_power_lost(struct ci_hdrc *ci)
-{
-	enum ci_role role;
-
-	disable_irq_nosync(ci->irq);
-	if (!ci_otg_is_fsm_mode(ci)) {
-		role = ci_get_role(ci);
-
-		if (ci->role != role) {
-			ci_handle_id_switch(ci);
-		} else if (role == CI_ROLE_GADGET) {
-			if (ci->is_otg && hw_read_otgsc(ci, OTGSC_BSV))
-				usb_gadget_vbus_connect(&ci->gadget);
-		}
-	}
-
-	enable_irq(ci->irq);
-}
-
 static int ci_resume(struct device *dev)
 {
 	struct ci_hdrc *ci = dev_get_drvdata(dev);
@@ -1446,7 +1450,7 @@ static int ci_resume(struct device *dev)
 		ci_role(ci)->resume(ci, power_lost);
 
 	if (power_lost)
-		ci_handle_power_lost(ci);
+		queue_work(system_freezable_wq, &ci->power_lost_work);
 
 	if (ci->supports_runtime_pm) {
 		pm_runtime_disable(dev);
-- 
2.34.1



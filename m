Return-Path: <linux-usb+bounces-12434-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C09893CA2C
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2024 23:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B628F283290
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2024 21:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7513613D893;
	Thu, 25 Jul 2024 21:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IiwQuZJg"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012069.outbound.protection.outlook.com [52.101.66.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1EE5C8FC
	for <linux-usb@vger.kernel.org>; Thu, 25 Jul 2024 21:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721942936; cv=fail; b=SsxR+PiS4rja6mFs/pQHwie8Os5NLXiZVM24fKFagLHqUab4JXqt7QE9gG/66RhkkXdwPpi4eSW2fJUEJkqTouC9ZE1bnJnjGeKjqs3n6nzl8D5U07E9BR/oHTe/GVT3K9GJHu8oDGaK1FyV+YJm8Sjd/8qt5axUKCzW51hEJbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721942936; c=relaxed/simple;
	bh=XaXGj0P7QgvwRoP4L/OU3gQYjsm/2WQFRWjMbh9GwSU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=VdIjrJ3HySew4YHFZPTg9kOdfSpq9IAufzuFaUGb5VRk+OKeCEgSjR6YG01cNaxO1JEfBdorvwaEANeyQ35KuUJOWD8qTDZmo1EHwJ2UTx/T32Mb5a+xm/U+uYyu2uonmw6775UoNOU7axgWxAJmbno6k7Wp4vcjlcRSgoYnhBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IiwQuZJg; arc=fail smtp.client-ip=52.101.66.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BCrdLuwTPklCk/FDXI8fPSs/DHHLk3KkardlAZXvFK6NIXGkcUTW0lf5imAslkEOdzfT65fx3YR9lklzlHF+WIYii/Qy7efsBwZdFfZ+uhBTuUfYCxuhLKGikEVT6ph2SrBOOkeAUl1KJnT0WppU1wCr2qCMkkgoeVmJjiCqgy4/t/31hlBulbT+W/FqjSqVqlIJuvdqrtwXGRD4i6/wmegBq9ooutQby4dLGpCEJoEIG5iypG8gZuzxe1wbz373eZTozMq1PFvX7nl/2ot5XP9oxRfIesVonY5BmQOfbIzA0rdLwHbHNpQ6z62HcMlxr6xTyKYdfpNBG3ejOX7ddw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/dqk0WEW4kgbVSyuZMfLyTrYcSQhTqQsPap7xj3ac0=;
 b=cfZcCX6Y3bqoBBFeEphYfQLnV3niHy80w+W03u6YRXzX4a0qs4tfHEY/1DOQkDRijcmAI9SxHQMa3YF2FFYXUOd2SsutxVBRYNjQMhObT4zs5Bv+quJy00wcKttJo9bvLMSUR5jlGg4HXE84JcnkuR6MqEL1HvjgaJeTt99pZD9tZFhlzGKgS9ECpxnXfXLhvcapLFh2FAEfdasYnAefIVekagBD3mkrex+mUhv3MzSZ53ht6t+i4dMl903nEZCV7G6lde2KBUL7PqkVJ/Po67CxHGqVT8MwLT+1DOFNmX3IwA66hrZzMquRAnZBfWCGd6aAzjTyTu6BBqsA+XpIgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/dqk0WEW4kgbVSyuZMfLyTrYcSQhTqQsPap7xj3ac0=;
 b=IiwQuZJgtp+UPZSes4D/QlimytTJjINqpjQqXHt47Q1epIPJ337yNg5jhdYD1qSdueWtt+fuXhrB3ZoUbWxEQOhlWmi4TQKlb2/Y1EKv2h48JBWZsIHN4MccL8PSf/j6dr0T8nFxsqjIRBaJoMqCHax9oynHCy3LaYu3ON2MaGkco+sje8Bj9OanWWIQGluXhpwP+kaejU1bb5OoAuyNI5cDMZymOLQiALlTuuQ57Oxp9j/dDLpI65GcK7XD0bgb2k+tWx3qylkHJdEGg1r9u94WseW5CJEdonNTSraZ97QNCOPVnJQ2PVB4HJR0s6T3jE0Rys9RUjwdFr88aFhAPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7)
 by PAXPR04MB9122.eurprd04.prod.outlook.com (2603:10a6:102:22d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Thu, 25 Jul
 2024 21:28:51 +0000
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::4fa4:48:95fd:4fb0]) by AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::4fa4:48:95fd:4fb0%4]) with mapi id 15.20.7784.020; Thu, 25 Jul 2024
 21:28:51 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Frank Li <frank.li@nxp.com>,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com
Subject: [PATCH] usb: cdns3: imx: simplify system pm using _force_suspend/_resume
Date: Thu, 25 Jul 2024 16:28:11 -0500
Message-Id: <20240725212811.296307-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:217::31) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9176:EE_|PAXPR04MB9122:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a4446ac-265f-4768-f331-08dcacf0c0ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?z5wa8b47muaAKCvm27KkP74rL/IiGLpns/bMKrW/fH42+6OpCgdX7BMujYEQ?=
 =?us-ascii?Q?/+5ju3UkONg5c+Zbf7hm0Tt//N1umwr+H3JJw7exHpawt2zT3IZKpvQyJO1h?=
 =?us-ascii?Q?EcyQIz74IVv922XBjbUt0DCAZSf9MsZDhXTGHBN+Hw3DuTFsdKjTMNtlmGc0?=
 =?us-ascii?Q?gk51/gZoYt/xxthnk+t9AgM0uiAKG41DECGJ+EWHXL54OA0D+BDRogkdBpjj?=
 =?us-ascii?Q?bBir4EJ1kC/SffwXJsgEIrtldKpJA6DXocxAHApmyGKnEHvRuMX3K98iaAHd?=
 =?us-ascii?Q?701KGlDB4rJ+NUoM4JIZ8/3rFmqwyi7rH0C20nM0hbjcpcBA09tcoI6rQ7VU?=
 =?us-ascii?Q?I9uT1TvgMvStoEzEWBKBidqjcsfGpYK0OLCdGWS0Wv1+8m1jjmLX1+LrGRBb?=
 =?us-ascii?Q?prMn3dovRVDpKVOy1ptOuc52/CU4Fr/3ZsEJZq5huqRDEZWp6Pbd444EZd9v?=
 =?us-ascii?Q?Dd4WDIgTjteFK82nwotnoWYETyBF6375SRx5dntFdKRSC5Vd4h/Gx5Qbnkvv?=
 =?us-ascii?Q?lH7LN3cqO6I5Qyp0WPMvtfrcJm9lxEzEd+6CXgnfWTsDTE/q3tfz8LX3E4Mu?=
 =?us-ascii?Q?m3Sk311z6SGtoBJmFv1PAudFeAs5seNxk9L685qHqtKvflk6ZBXHaIs+SZjF?=
 =?us-ascii?Q?qTSjSU0rGec8S+Rp60kh0ysRqFM+Yz8VNl2+fyJMiDfKf541b9gNB4UJ1UHd?=
 =?us-ascii?Q?ZNeIwUBFUWNQiyaXLMmtyWSoerOCab0AjIZo19cpMqvwvYuiUpetHUhRdyJl?=
 =?us-ascii?Q?GUBUHwoTE3kBu2X6DuRQBPvowKVt7+9fj0NHvHkWsnLQweOdN9LnhKdeznJB?=
 =?us-ascii?Q?0U6sehMjv8US72WZQoZug9hjIZn5Iiq0GEZx4Sbu0kgvl3uStUyyQFBTXhOL?=
 =?us-ascii?Q?KB/DwKJjytpG1rCmcg8TBaAgai+JwOd8zR/YVL0q46nVWniRcKNypFM+u731?=
 =?us-ascii?Q?D9phz6kKiczjeGMP6b83Y8tXD199ZuEIwbdVsI0G/VFBecehymiM0slXmB6W?=
 =?us-ascii?Q?TllBl8mbF9VeAcHdmOM2MPMOylScPSvgFsbZFY4eSKHTLUmYLqKhfYI5cPo7?=
 =?us-ascii?Q?3++LZOv3uCyFI1p40/bzB238PnIDoYZxqZlWiWS8p6xvZiBup7oYhY1xzEbs?=
 =?us-ascii?Q?aVPsuVHGskvk/voMg/v9XPntvMNHL0eI0GY5vwoQdwF4gxth03dCPPcBsQoN?=
 =?us-ascii?Q?Nr5HyEqlX+4WifXy0Vb6FzNryK4Gn5aQShRku/C5jmFi+u9b79tduHFyjqYo?=
 =?us-ascii?Q?SwDU5ZzmRP+eDoQHHM1x6kcIhlU8n91BA1VsUXU/Z25smeoEVdCeTyRELbL/?=
 =?us-ascii?Q?25hN2ovrHFpe7hVrasKwndkxwzikPXfDuehI+VD9aho+AXIXUM3OvgJpclUt?=
 =?us-ascii?Q?yh4cExMCh2Tcb6s1GYm+8Sq//5GYhaCmK1akMtirpjNGl90XEQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9176.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CisfvRZ4hHvvh0JperhSEt6yNZjhUrws4kVcitShqaNS6dxbbUHX73QAReCJ?=
 =?us-ascii?Q?H5lqJlNuWSa0aRMNPYFM09Wml/cszm4vklIgTyZ7tyIlj3M8BnHT5Q/WbFNs?=
 =?us-ascii?Q?ViAmlXwRT2UjlkSO+/VTUZ4bZpw248suhMTdj7MG942aJEpU3vi17HBhmKgF?=
 =?us-ascii?Q?R9q63/FmIBro9paJj26ZJ1zvJVNshAuTTR6Vo6ezsPI7plm76DvmWMvB4uwD?=
 =?us-ascii?Q?qEaGNrytuKYm+AteTZdEtg0xf9dR9l7aV3I6uxqp1mTeSNZi0nGO5Q5wiMdu?=
 =?us-ascii?Q?7WXw2PRaXCJgnsuQavf6zLLHaxMnLYsC43LfnkriRm45NwGZE7tD9kM8IrGM?=
 =?us-ascii?Q?p6ay4JU1sQ94W7wKyM33B4Gpq6DuDaFrswKVlR26GcTxrqUYzThVCI0RMX+N?=
 =?us-ascii?Q?kegpaSveUT1o/YP7/0mzThI/pp0z5nwxvAYWnq2n9ZTeZ3/k6cWhVvGKUT6A?=
 =?us-ascii?Q?XeQXF3VzUmGuK1CLf2OT8OFpWKjI/2AtgWYyS1x0OPdcUeKNAGGvdqgOMIES?=
 =?us-ascii?Q?EkmzwejsoVRBQTk6gWUJ+1qeGFvrlbvwNNGWZos3pJMZcNFSyzDgLiOHdMHY?=
 =?us-ascii?Q?aGrgGTN//Bq6D6PSedhn1j81+Re09KA2BBhkmEJ1z4Z4w3y85UPdIrPxe/AQ?=
 =?us-ascii?Q?6cIqe86IqkfagvOzPxL96fPFSWURPTEd4maJVCgXOPcyxODlLSOkD7Hc+vgb?=
 =?us-ascii?Q?jXSJzQf4vHr86Pd8EJFqtTZ9urIWhYIrn5uu46c8mH+rvDya8VHbKQ4RTB6Q?=
 =?us-ascii?Q?QktCGDOQnOYQTZL4lTDBaidghLoDGg84iKv0bKF7cCJ/tB3t4qFB+5B8DCVJ?=
 =?us-ascii?Q?Mcb1yGjV2jMcdMCHTy0UFlppAACLRgDBvTaeMKP7pp3y3HFAwACE5YM0cHZv?=
 =?us-ascii?Q?jcZ//CtaO8o76foyv7MhbOdhnYuswUdwNJH4hi9oskz5exrcLlTpVIsYvdLh?=
 =?us-ascii?Q?QzGqlQQH4ixJnSFikDEbNbN0LlYtiik2JH5C4x11x/e3ZxHL8/6tTzm7t+Hs?=
 =?us-ascii?Q?5ioOSXA6Rga7z3GyPaWO7BTZMVBfmrlAoNmkiPHLIvdLrYcG0ZeVtC5PwWfP?=
 =?us-ascii?Q?D7IXo9Qrf2jaVcZpAYbd69R/28tITpAhobUlTcDEDYyYYcBpkart/MP2ecAb?=
 =?us-ascii?Q?hDcFPyIWMOL8WC6kOFjVZ8KmIdENTz/9WoOI+yxK7jSh8a9KeQxQOEuAE/WZ?=
 =?us-ascii?Q?JiXjHfmdkO/GKz+ypctlT6YbRQ0KtF1nlQYY/NRnry9GX+1XBIzSuvso8s1m?=
 =?us-ascii?Q?9z8bUTMQ2404XUKU43afmdfjDIzmkR47fDhQHvBp1bnmOo9Rp6lebHI7pa7/?=
 =?us-ascii?Q?CpaqxSpQO925+TiORyzvSDbhEzLEYg+hZvDKNuSoYOO4kSDZcFn1GmmCQD0f?=
 =?us-ascii?Q?Xijf1V4hr6wU2ZqpdydYuiYlb/YfCcHNDaAraXNqTmAqNvMVlnrI14eYs8wf?=
 =?us-ascii?Q?D91pM1DUevF4+HAcxazSDIG6kFZftYOaKCnsUYXcjiQZ4Vf01vbBYzOOPoJ7?=
 =?us-ascii?Q?U8aslyHp1ZFomTLu4xLuuDEW8KZDTKGi1IyzO0BNqeCBK4RWKHYfqk+8eFRX?=
 =?us-ascii?Q?Wgq2h0l6MZzVxAEc9tjaXt0ypCg3BqTqUqdrQ8b1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a4446ac-265f-4768-f331-08dcacf0c0ef
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 21:28:51.4015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QnDO3lqT055q3i2iwc5nVVbtG3rYQDTB3JGWrwGVpUWuwjAc0nv7tYamZBAgenpaR+RfAz7Yk9+eXXEsG4zvPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9122

By utilizing _force_suspend and _force_resume, ensures a more consistent
and simple approach to handling system sleep states. It also aligns the
driver's PM behavior with the other drivers' common practices.

Fixes: db3c4e366287 ("usb: cdns3: imx: Rework system PM to avoid duplicated operations")
Reviewed-by: Frank Li <frank.li@nxp.com>
Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/usb/cdns3/cdns3-imx.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
index 281de47e2a3b..9051cbe9d68b 100644
--- a/drivers/usb/cdns3/cdns3-imx.c
+++ b/drivers/usb/cdns3/cdns3-imx.c
@@ -360,7 +360,6 @@ static int cdns_imx_suspend(struct device *dev)
 	return 0;
 }
 
-
 /* Indicate if the controller was power lost before */
 static inline bool cdns_imx_is_power_lost(struct cdns_imx *data)
 {
@@ -373,22 +372,18 @@ static inline bool cdns_imx_is_power_lost(struct cdns_imx *data)
 		return false;
 }
 
-static int __maybe_unused cdns_imx_system_suspend(struct device *dev)
-{
-	pm_runtime_put_sync(dev);
-	return 0;
-}
-
 static int __maybe_unused cdns_imx_system_resume(struct device *dev)
 {
 	struct cdns_imx *data = dev_get_drvdata(dev);
 	int ret;
 
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret < 0) {
-		dev_err(dev, "Could not get runtime PM.\n");
+	if (ret)
 		return ret;
-	}
 
 	if (cdns_imx_is_power_lost(data)) {
 		dev_dbg(dev, "resume from power lost\n");
@@ -397,6 +392,7 @@ static int __maybe_unused cdns_imx_system_resume(struct device *dev)
 			cdns_imx_suspend(dev);
 	}
 
+	pm_runtime_put_autosuspend(dev);
 	return ret;
 }
 
@@ -411,7 +407,7 @@ static int cdns_imx_platform_suspend(struct device *dev,
 
 static const struct dev_pm_ops cdns_imx_pm_ops = {
 	SET_RUNTIME_PM_OPS(cdns_imx_suspend, cdns_imx_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(cdns_imx_system_suspend, cdns_imx_system_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, cdns_imx_system_resume)
 };
 
 static const struct of_device_id cdns_imx_of_match[] = {
-- 
2.34.1



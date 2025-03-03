Return-Path: <linux-usb+bounces-21244-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE12A4B6B3
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 04:33:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1504F1890E8C
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 03:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F231DED72;
	Mon,  3 Mar 2025 03:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iLy8iCom"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2062.outbound.protection.outlook.com [40.107.20.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1446E1D517E;
	Mon,  3 Mar 2025 03:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740972769; cv=fail; b=gsNTQwEPu9kBqBQzs8pFzdyeILcYxshQLsHtS3BCVCU2aLTHWtMXsv+wK5KKwT+iEtdGB9PK0wqhGwRBZENLhxCG802HyPymmWRKwVGCzEBjYe7GiJx7KqXfGl90aJy+kRyza5gZlA46IhifP0yrdWtrJ328la9NMNY15tM0UXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740972769; c=relaxed/simple;
	bh=iQvzdXD2KdGVTSjIh+v8zfv270927u/u2J6kTaedl8w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V4CSVeWdFn/WmNOJO4tgcXxf453iQM9lNsRMEpmJv4uNx2Oqd5ceZD08XzwqrlbPPU7+GdxyF6k/PhxqyzH3G5ZlTKG6beAYkUguOpx6wfIZaEP63THJF8ZUwbSq7sL+At+AZusN3InL7C/TCRQbhJYtIINHBECT8T6mrmMNp0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iLy8iCom; arc=fail smtp.client-ip=40.107.20.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8TugxjNYRjYFzh//MES0sZztGFZC0LLM3cF69jxWcs9UiEQmnwCFm1TqrQdnkmXRa+FFUmP4+7WzpvWpfUSvBgpon6960JiO1UYN69le/k81L32+ADFxusKoQ9bnWAHgKd45zVeBiGBr3ODsyg9aW8MGezvf62vgcQ7PAYdjlz449F7vfkIQikqPVUdOvhVNs7yN657T4CMmOrjTX/q0FGnMymey1lPlLRFV9CvOsNiJhlcpsaEFHnZpRW5Hu6cFkl7+KMtgPfRjDS+NnocjmVcyXjUik0g3GFA0H3407Al4zIiPeScWNKgsgg2WKtLDWpY+xflJfuJAhXyrdn1pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvbzcBYtHNr5M3XDfkuB+kCPjryVNjfqRr8N1suX3Sc=;
 b=Ek5PaUu/5BxqEBLpy5+KMsN05kMsHUZbQ/zor7qtSyWCwRCVLiNhAsW13qNlNsEupweiI20VpoCh7taIcIvq2FKJtupRRE/CAro+xhRyQNBmvwn9bLawzyt+yNiaopFq8TAbD2Ighko3PJV4ntD2m5ACQQkZPB4G5gbBxdj9sVqfVJqNUqlDBs8tyMkMpo+As+gC8aSSX540Up3D3UWqRrCMTGQRh6K0tQZCQaFp/MTuUWEs8F8vL30nvaka3P0uCFoxKXKLUaoieN016PGni4TcVM83QoKGUlHIkzbRprVcSnQpNMf+0GyINJ4MPaEAmIiEpwq4jCIxbeT1Us7cOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvbzcBYtHNr5M3XDfkuB+kCPjryVNjfqRr8N1suX3Sc=;
 b=iLy8iComatYd6DZ3s/poneS6XyU5cR22nU+IX5m0/3384lRY2qcCjc7EQlChZHCpmSFg2mjMoaK5KdpVz6On6th4Je2HU58ihz0W0eGpWoibU5DneP79NKO9OBml34baPQxWtz7vajF8soXiC2o0ArPg7F8w8gAcEjttwWIQvKwz8eqb1w+hmse36jey2ctHT7kus0pJVJxUHhU1ZDBiqWgVvqVq0PQ9+1lvrknXoX5rKVv3E/nEmo6E9EZA5ofesxlFb6BBnIhYJEfqpVRpHuhxzYTCRHlz3ulXDycTkQox/N+47+Vgn9HnybqbFxrLhYTCNZfz1i+//BfrsQIPBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by VI1PR04MB10026.eurprd04.prod.outlook.com (2603:10a6:800:1df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 03:32:44 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 03:32:44 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peter.chen@kernel.org
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v4 3/6] usb: chipidea: imx: add wakeup interrupt handling
Date: Mon,  3 Mar 2025 11:33:41 +0800
Message-Id: <20250303033344.1251076-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303033344.1251076-1-xu.yang_2@nxp.com>
References: <20250303033344.1251076-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096::24) To
 PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|VI1PR04MB10026:EE_
X-MS-Office365-Filtering-Correlation-Id: 04296023-6bae-424f-262b-08dd5a040f8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P8IRQ4AihxDwf24Ozw0YDo6z4YiymS7921O3lVKka/RPw/Zw8TQsAm50wtdW?=
 =?us-ascii?Q?woJFUiJbZCXnB7Bv7A3rVamYNc9pvBUlgkJu1wE1foY7nq1Yhb1lTYdpcAVb?=
 =?us-ascii?Q?m9lYe4WMqTP2H8AeSZYaAsMIMxQuqvZfVmh1BO+OuWSMaONL+YG4zDz+fuf+?=
 =?us-ascii?Q?FGglh2BgkgFk0LkKmXUhGTvJTTDWsfx7ShdCHAFZ0Kx5Dh4+aETAwSTMESop?=
 =?us-ascii?Q?gTB0gtQJkCS0quGPlZ8fGkgO6zqxkzv4YgNQ+acXK0bkscEjVMb5FStrfgiZ?=
 =?us-ascii?Q?1N6uOd/qFgKb3yPRroE+pHuWd9d6d5qio8HQGLhkkykHGFtCotYMru2I9ChT?=
 =?us-ascii?Q?hcHHCxoRSnzBIUsyh0Zc85+8zRbvmW4PaTOd4dwJuHW0HFqRel9jLZe97AdG?=
 =?us-ascii?Q?lGAESPkz16FvkXigrRznKzLDQJ0RaQMQlUlT2bePcYqCl0IDtVp6nXXJWiUt?=
 =?us-ascii?Q?SGXkJyGb6tJV9W88ehQbbedB54+d6oPWDrCWdaj81e8YxcMfH23sw4XM/3Py?=
 =?us-ascii?Q?M2th5I+fMLJsAfQs3hHjaMvTKyej5Ur/55EtZYy2ddY4V5mjIii9WV8YiMYh?=
 =?us-ascii?Q?AlS415mQLyfl/lPkgbq3PcFnUljp+dR8wurb7YqIOUXzI3cAtyQ8UQFmqggP?=
 =?us-ascii?Q?hylx/oddgv8u1QfNwJTpoSJAePMouBYxtqCMghxdR7w87Ze5p7EpA3+vuIN2?=
 =?us-ascii?Q?Zw+Ko7mydPUX2ddwWfmRMnCKsNYXKzPUtY4Ma6Gus5VXhNmB+6V03sY5oQ/y?=
 =?us-ascii?Q?uRBy4KCuoSjvVWqlgi9fpYpGHqPEpYAQHECAtHny6hVUp/iVYwIvkz9mwgL5?=
 =?us-ascii?Q?XIxmG7flW79w4pMp9pAIEvgSUl+NegseWnnScOXXDT212/twCcz1p8eDAseH?=
 =?us-ascii?Q?8mVFchy8+9WtMxBBR5vgQ18CQVlB62by3X08p2CVZWErfkwpV1ukkUgUCCex?=
 =?us-ascii?Q?E3u9HgzszDxfllArO/c9inDQj++unVcHcl8380J3K6yM1cB5/ZmutADMdLB+?=
 =?us-ascii?Q?/wP7mHiAhuN/EclVbCHOLtJrM8beaLg6HLhI8p7X99szZ1Wg8xFohJ3LlRRs?=
 =?us-ascii?Q?RXdPlCslfdqg73hwFwS4xaodfoT+gIoBAH241r/Os/lt5Gx81qcxG9I+zXDn?=
 =?us-ascii?Q?5KCrV5cxVbY/m2kTk9+cfFY1d2SBootvDsvbC4vUtMGnB4+qWx1x+XxkZfsd?=
 =?us-ascii?Q?KifqbNXrqgeZXxjVi3G2Fvl/Hv+OlmfEK3okXGo1/MWDGNdDen7UoBJwI2cS?=
 =?us-ascii?Q?KOe95jJwutCOz3Bw+Thq46wffKAip8mq5fIZ4doIVUXMk/RRigIQuvNriraZ?=
 =?us-ascii?Q?+ti+/9YvcEeDz9MzU+L/X7cYDHhvGHRUiDRsdfoLNGqywFg2O/Ps7d6SObNx?=
 =?us-ascii?Q?mJxJvme6rxuj2CcfdcUllLxghRuE+ONRkIPGqVckZN3BdzKo3B1NFL3wjnrM?=
 =?us-ascii?Q?uGBAifu+hqZuEyYv6EJqbhLlXiOOd46H?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FN0qYkEgMsIiJ/Ynys4AGNJvDrwnva5pumRt3kwsPwdiul6CYHooC0gXMllC?=
 =?us-ascii?Q?WlPYqGUJPH9oR3LlAceYkkhebDzRSn5FczIXEcHKP7Kd2G4N9KJP7gkyw8mz?=
 =?us-ascii?Q?YfLEsQktG6BRZqlAfy2mCDxbY6BACoLvBoJf96xnORxOl8Vmn03mSiuxA6xM?=
 =?us-ascii?Q?DEtcraxidD3w1DPuGjF8RuO+JUi4WBd3WfRgtOvLHO/aJ3fJ30tKxAc20ep4?=
 =?us-ascii?Q?HUgs6QvU/et3HmGxAlZJWBGI1MppCfxgbej0Rrw6R48sRS2TQuyB/YAqZxhC?=
 =?us-ascii?Q?4/nk5Dw9PUZn2ZsQmGc/L4aA3AgsOTbGA9dkg9NCYumTtNWvbDlOV+7BjgOd?=
 =?us-ascii?Q?CIHPBmMo8cW2h7RXR4fvXJohgCgXfkm2lxgtGfbsbRw8q8j29q/wVEY5L4+a?=
 =?us-ascii?Q?w+hiAbzMKKMteRnjwvrayDcrDOF4fJcNXs3hGc/UNU65yeNJWkFYtsFRRkHa?=
 =?us-ascii?Q?Piw7vvJpxUA2VOKSPcEhF8UiZP5cGPbRk3+O1tK7+tHgpx5WM03VLQy6kDIE?=
 =?us-ascii?Q?sCWPbnX/0Y3ozab7hv/mC1V0kQYFB+QIXst2qt8WhinsB/CZZslI9jmlSndt?=
 =?us-ascii?Q?nZy908lm5msl5lGFJwBarifZr451GFMBPZJvXp8MLC+KAY/1cqb+IJ8Xoadk?=
 =?us-ascii?Q?3rv5yojbiY5vnxlHDfk2DaIj+WDLugs7falas16NgYVFDhEyAXxFSXL0vgMo?=
 =?us-ascii?Q?uqm2bjQ5JoKQ+jM0Hihu4C3005wkE64pB5URLIQYMeOGCkHi4jM3IhqK8CBv?=
 =?us-ascii?Q?GDp6SCxapbF0P+drvaaiIp8iMnwqEVID72g2qA9X0sr4Jnm3D+sIz9fTvQVH?=
 =?us-ascii?Q?sqW4gNeVSJKwFY1c5WOY+sotiswyJuSDIu+QmivKKKuFHEXAGV1uahwCHUpV?=
 =?us-ascii?Q?1EbvhlTV+aFov6w6InR+rcVabWYsD/6No+tG0PtwKH/taRPmU7B1hyTpfnJg?=
 =?us-ascii?Q?M7hJSmc11q/lbhqIgs8HgST7yu97ceBlZA3bDebOe/QK8L+Mf1b9ltOl62FB?=
 =?us-ascii?Q?UX/vN3fkllo36PPyPgOyTj2Str0Ig7yTup+s6v4YO2019MwkRbGRZtjdJcZv?=
 =?us-ascii?Q?KgdybqDC+kiMQaQxdV4ykFo1vQ/zCgqFTxZFyD2GVKD/ie59lEA34QUywC4H?=
 =?us-ascii?Q?YmNBi3NUiBe063pAevHl2FnfEPotqKf0MPIq6gnxaPqFIc8O3sEX9E2ZFfYn?=
 =?us-ascii?Q?Trk/oj07/6NLZjUJ8q1srLRmt0Z1Pyi+BW32Cl+iNa8f+W/ETyyCWp9FE8Ng?=
 =?us-ascii?Q?vbC1654F0pS66gnJALHiZXWhQxnGzw+OQ/c0lt3IXmtFGhleAc8sJ4OEKntA?=
 =?us-ascii?Q?sqNn2+vDun029dauwifJfryj4j2bMVoS8G3sYOPp4LO2oilPYXnKJeQuUktt?=
 =?us-ascii?Q?7A/uqjwGPKzK8WneqXgqefNW6Rq3ZtN+PmgAC6K0YBuRTIierERQji/EO9fh?=
 =?us-ascii?Q?NZHbx0DsbdrktNMZaOCMky46yQP/2ACPL8eoIuNwf/aMxBEBZcH56rnlvOyp?=
 =?us-ascii?Q?jZh3NNChzq2wRLH/Vcf9+mciht4aJgFuFS+KkzJ/LIUmbt4XV5YbKKhvJCwN?=
 =?us-ascii?Q?h9SLDZJmu82oLDxD3Eh7Hf+fAaNZn42oB7lpeD/4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04296023-6bae-424f-262b-08dd5a040f8a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 03:32:44.5617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oHPwxUQILoB9+rbzPD2yCCSF78cTrE2uA+XRi2382pR6FQThFSmB95BnDcImWJcZ6BCJWf/qXJgcTetEmnwNkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10026

In previous imx platform, normal USB controller interrupt and wakeup
interrupt are bound to one irq line. However, it changes on latest
i.MX95 platform since it has a dedicated irq line for wakeup interrupt.
This will add wakeup interrupt handling for i.MX95 to support various
wakeup events.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
Changes in v4:
 - warning if no irq provided for imx95
Changes in v3:
 - include <linux/irq.h> to fix possible build issue
Changes in v2:
 - rename irq to wakeup_irq
 - disable irq by default
 - enable irq when suspend, disable irq when resume
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 35 ++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 1a7fc638213e..2baae9e6e673 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/irq.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
@@ -98,6 +99,7 @@ struct ci_hdrc_imx_data {
 	struct clk *clk;
 	struct clk *clk_wakeup;
 	struct imx_usbmisc_data *usbmisc_data;
+	int wakeup_irq;
 	bool supports_runtime_pm;
 	bool override_phy_control;
 	bool in_lpm;
@@ -336,6 +338,16 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
 	return ret;
 }
 
+static irqreturn_t ci_wakeup_irq_handler(int irq, void *data)
+{
+	struct ci_hdrc_imx_data *imx_data = data;
+
+	disable_irq_nosync(irq);
+	pm_runtime_resume(&imx_data->ci_pdev->dev);
+
+	return IRQ_HANDLED;
+}
+
 static int ci_hdrc_imx_probe(struct platform_device *pdev)
 {
 	struct ci_hdrc_imx_data *data;
@@ -476,6 +488,18 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	if (pdata.flags & CI_HDRC_SUPPORTS_RUNTIME_PM)
 		data->supports_runtime_pm = true;
 
+	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
+	if (data->wakeup_irq > 0) {
+		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
+						NULL, ci_wakeup_irq_handler,
+						IRQF_ONESHOT | IRQF_NO_AUTOEN,
+						pdata.name, data);
+		if (ret)
+			goto err_clk;
+	} else if (device_is_compatible(dev, "fsl,imx95-usb")) {
+		dev_warn(dev, "wakeup irq is missing\n");
+	}
+
 	ret = imx_usbmisc_init(data->usbmisc_data);
 	if (ret) {
 		dev_err(dev, "usbmisc init failed, ret=%d\n", ret);
@@ -584,6 +608,7 @@ static int imx_controller_suspend(struct device *dev,
 	}
 
 	imx_disable_unprepare_clks(dev);
+	enable_irq(data->wakeup_irq);
 	if (data->plat_data->flags & CI_HDRC_PMQOS)
 		cpu_latency_qos_remove_request(&data->pm_qos_req);
 
@@ -608,6 +633,9 @@ static int imx_controller_resume(struct device *dev,
 	if (data->plat_data->flags & CI_HDRC_PMQOS)
 		cpu_latency_qos_add_request(&data->pm_qos_req, 0);
 
+	if (!irqd_irq_disabled(irq_get_irq_data(data->wakeup_irq)))
+		disable_irq_nosync(data->wakeup_irq);
+
 	ret = imx_prepare_enable_clks(dev);
 	if (ret)
 		return ret;
@@ -643,6 +671,10 @@ static int ci_hdrc_imx_suspend(struct device *dev)
 		return ret;
 
 	pinctrl_pm_select_sleep_state(dev);
+
+	if (device_may_wakeup(dev))
+		enable_irq_wake(data->wakeup_irq);
+
 	return ret;
 }
 
@@ -651,6 +683,9 @@ static int ci_hdrc_imx_resume(struct device *dev)
 	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
 	int ret;
 
+	if (device_may_wakeup(dev))
+		disable_irq_wake(data->wakeup_irq);
+
 	pinctrl_pm_select_default_state(dev);
 	ret = imx_controller_resume(dev, PMSG_RESUME);
 	if (!ret && data->supports_runtime_pm) {
-- 
2.34.1



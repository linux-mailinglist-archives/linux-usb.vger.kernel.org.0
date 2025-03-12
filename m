Return-Path: <linux-usb+bounces-21674-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C45FA5D824
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 09:28:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 999593AAF1A
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 08:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414C7235371;
	Wed, 12 Mar 2025 08:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RsoSRwDn"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013017.outbound.protection.outlook.com [40.107.159.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0A323535C;
	Wed, 12 Mar 2025 08:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741768065; cv=fail; b=FS3zKHSmmH3PIKffQd5xILPO0QYgx6ij4vn9k6VrX3VXZYh9R2WMLZ/NM4svI+HNKowk+Zys2hdbs9esycTnOPAJnYpiTlyjWxB7rsxLEBMpId/dN3CVjZpM8HXjxqxHtNdsxiWvDLDkZWsfgAQV8n4kJyRl26jGxnHIHeu+91M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741768065; c=relaxed/simple;
	bh=zRzSWCGQwFVmbe9IV4zMLoYPw5NnNLjrY0PpF+YBXmo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r9zEsmvxgnec+tzIfENvEuue0Zn91/iCw8sLqYUuiXH9y8uxIn0lk1FskLPwgYJqlISjQtX/4Qu8JapwnNCCSpdK9BSJOfeD8gq5feRoJGuhbB+VOvaQeIZ5nLTxsJbJ3MoO9MJybIR85HoQZflrYNGFJ5R/UopykMG+GmAzWCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RsoSRwDn; arc=fail smtp.client-ip=40.107.159.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPsRO3jiQQNJ4df75YiQbFLpvKvorxYHSC1pxFO3mqr7QZzdz9uiavAwxoFa+9cVNtrobD3WJdjPbRLmry6hkAbOFYCEx+243y60w0MssmeM+XWg/CKqlIqTlGVWbJmpFrcqVr/xxOmYH+Om47ertjPClDhwzyGQPfhf0Lvih2dJDKq5/4GD2YrWu1q9OTZdd75aHAKZoy4WTojyTylbG/NUmVsPRuvexFyOzepyXwFE/5gRWoxkLgpZzmOCVR0O5rCMUtjwCMOPIlgfUAEH+XdRt+yIUTE7kxl9x/H6oerI4SwLHuz70JiEnaBro46NaU1xZGAd65CkMc6VpUfnTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0tFf5k26A+KAoigELTpjazycoPVa7NsI+M+XDQ0YdQ=;
 b=Q43DkLaTlI5prHYuW5WwE5pNTX8pOnrIv6A+XBwDQOUklDbD68OEuEhMES7CN0mG4BdbByOLvLLUK6dgPrBKPWZUlTz7cLYsuEpTva+fgbjeEaWaBxLH2yJb4jXF//LdQwEnLvjABeeNXlLJ6n8LwzOuO3R8M95sADXVUKq+wgvQORKXQsqIpH5OJr72FO2ITqPePi/I5uyd3EYXbk/sehFGviICvM6t/kAljGRBVMX+d2ubpfinUtNqH92GMQcBFSFBHcpgdvJQ4wRmJW4QbFw5FnVqf8lz4VRFfAIsRCFOxtQxBGDK7NO8Dx1fbuYs2b46dp3e57ucJKSMb3E36g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0tFf5k26A+KAoigELTpjazycoPVa7NsI+M+XDQ0YdQ=;
 b=RsoSRwDnxNMdqD2dtp98UC6t2YSSZ6fEv3Y2yt4gOg/DJXlVhodIyT8K7OPdFAbXwCjHjFp6dJx3dbp+ng8qLgzodzGH8HL1mYZnkYeu0f244dDzuaiN5cMK3XtEOjxCh+oeF3lOLJ/US7rRRQP6D+2fOQ13D/zAmdtnhrO54djTr3iw/HcXk7xQbKoYbDaubz4VqkkHdDHKrwtcqaiLDgsdokbKSXsBcdqNlTLNEmuK5NBtBuSpx9KfhXVTW3jcmPdSUpMp9KLezozvEzTwJU0rL92tdQwBqAyAtdcheqkut3110JufZa9xiSmR0aBRf1zzJA/YJ2jJZ9muk2MT1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10592.eurprd04.prod.outlook.com (2603:10a6:800:266::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 08:27:40 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 08:27:40 +0000
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
Subject: [PATCH v5 3/6] usb: chipidea: imx: add wakeup interrupt handling
Date: Wed, 12 Mar 2025 16:26:57 +0800
Message-Id: <20250312082700.260260-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312082700.260260-1-xu.yang_2@nxp.com>
References: <20250312082700.260260-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::9)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10592:EE_
X-MS-Office365-Filtering-Correlation-Id: 16a0328d-2931-4c9a-c1fd-08dd613fc0f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PSfLTM4nGSN/mIUkes5rckzYKGFrCSCyNppNZjlk9ksCgkFdLr9+a1YPSmsJ?=
 =?us-ascii?Q?vO/S07zrI6okkUCap8HPper8bcTfs+T/nT+8wG3JHAijou12YswqaZv+4dOq?=
 =?us-ascii?Q?LINO1ytQHVAkYzmQmhyQRvj/uFoLfH0mGXvNpRhNmvqjWKNab0u9kPl27mj/?=
 =?us-ascii?Q?lmeBNVtbGvi89nZpl1WqLBW99EWu12YANMVvh8LLzZD9SFG5IfykyGW3eck9?=
 =?us-ascii?Q?JADcnxuB/dsanwWcy24/velF1GYCD8FfWQhiiDWhOVaYcj/1cOwQHj//lIiP?=
 =?us-ascii?Q?IF6QCYS+NlvgYwsBVH0GngjhYuZLJm1zZZscdK79qkqG/glVN2gxIWslo5Zl?=
 =?us-ascii?Q?7yuYDxYRtJ1CXUkrph/moTyO9Uyl7db+ZzayFIc//ZS+yGyOse+63KqkgzR6?=
 =?us-ascii?Q?H7nW7BOsdH0+3p89BIb9JefuyyLXIEj/DkT88WGL4eM3i+DNyt5nXdOt5ouu?=
 =?us-ascii?Q?NBNgA4iFGhPGONafAdvuFpu+xPLbABZcUhElZA5T+OrCebxOlVuPxj1zjV7I?=
 =?us-ascii?Q?CtkkMfplq+uJQP62HDKrFZL3elVJGFX1fYQgM71I9Cnw3Dx70wf8ayZCAwrJ?=
 =?us-ascii?Q?9qR6v8osOaGbeqsDZNflI8ZhZLrMYdDFYwXSp0Ff/2JF0q9ox0CJLm1C1Upq?=
 =?us-ascii?Q?57Rt9LFT6iXT7jNr2GqPQOUoVHOo78EoFq94C/vIb+m95uhjsYvNxdCRZVQV?=
 =?us-ascii?Q?4wfmUPA9nCCFAUvWz8QOUL2yisQx9D+6YlM4P2KLBSYD/cuoYe6IO/mSwC8/?=
 =?us-ascii?Q?YTQxu4suphVJjl89L+HXdy3t4rrw5WyFp8LRQoj79M1Sbw0Em3CFhuPkKchA?=
 =?us-ascii?Q?7NEGoQJDTeW3CG/xHD2feXk57eLXRowVKPCaV3m8yDTb/69C9fHyR95s+UFN?=
 =?us-ascii?Q?zilzCASY6HDGbciXsObLcZ3l+62q9yk6iYsSDQKuo/z9MMJ/qOgjPFKunyD0?=
 =?us-ascii?Q?dTc4oGgcnJeMqsZii/Ut8f3RODMdXD94mfUzisgIvuFyGo3I0Ld7D6Vd8xbe?=
 =?us-ascii?Q?+635eTxoA0Qe///n7wH63OXMdxqml2sJJao4tdg9A0rO8CJ3auccXMACVjRM?=
 =?us-ascii?Q?Q15eBxrcVc0PP+UO5cm+08rS0yV6YdiSv2BHMzZjOVi4Y8rtdlEQlvyvxjIK?=
 =?us-ascii?Q?sbYsQE90xPRaAV9Z78x75OhUx+3TxmdduxSrIebNbDx2/NQ/CInVIeAPSeBE?=
 =?us-ascii?Q?zLdA/zD2hH5FKCsjizW+yYwgSNxuXtq8c4XvzxXrQ4q0cqQCrjvSGjyhT1u7?=
 =?us-ascii?Q?9dVATHHHr/ExWUQbyvP2rbIMQsatAgS2HJ2KXoN4z/fULl340NkOsHzfYUEz?=
 =?us-ascii?Q?c2f4cScwoFGGE2FX/R0rcgx51HV0K7E6i6j/pjR/HWm/PY69VYEVaqo+OcuK?=
 =?us-ascii?Q?Igsbkt7KTGNVlYWO3qGD3EjDZzYYww9EmqYvloW4bbT/F0DnDY5lZUgm97/I?=
 =?us-ascii?Q?+kGpaK2/KNFwgxuOnE2/aIW3omcz/e/x?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ry5lvHR20tFVgwMDlv9BzE4UtvmTZYNoi+4WDXMf3gIsLJO//UY7xLPg3iUq?=
 =?us-ascii?Q?jX/UYt4TUsp5AUjpaZrT59h3cViTXJ5bHT13a5/s3c7YgEjuM2RxgmxCDF20?=
 =?us-ascii?Q?Y0RTXRhUkUHO46aMirsN0xPpM3ljhpS4Mgd5WBLJZzYx7CCTCihfHviaEi+p?=
 =?us-ascii?Q?fNUcrH0dnWxPx2VGxgn1WD6PrhoywLl44+gi7HudwDJ4xQg2D/UEfPiAJXPm?=
 =?us-ascii?Q?KNi8KKyEHaunJDEb7kZE2MuzCprBNRE1AAYuUHnSUE7NmW78jlykN8UFryIO?=
 =?us-ascii?Q?tAGZR7O/zF/xtiZTbCFfXmNxJvy4E3MGSUbLEXI4fJVU/HO5csywJQTYLwxl?=
 =?us-ascii?Q?UQz+ikw+foLfa/SsrttAZ6jzIcL8Vol5ylDhX/Fp/Z2J7vVWKOIbwVq4tGTZ?=
 =?us-ascii?Q?BsmW/o2BNBl2OCDetJvjI1lcbusr9b3NlBw0BGHmySs1LgRSqUb/uyItxcoz?=
 =?us-ascii?Q?+n8Wd6lyYXBIOIyP+g3UH8mgpF3mnjGsHw7yqLh7EHI8J9RiSbNfucnFyf//?=
 =?us-ascii?Q?uGcTlTKBd9KqXpjsUTq1OO11P6ZR0iA7WV+iFvdnkv5VY36FylRVfcBX9Ut9?=
 =?us-ascii?Q?/4C0osUgRxMZU+Rq6j1FNMq4Yu4YVCRWnh7RwKRoKbsdHjEZyoThFuBW57q5?=
 =?us-ascii?Q?HA3Viyuan81LytNx9VFcwHCT8AZKLTPpzJseAtRXs8Ht2Jz4KfJ3O2PRcrCk?=
 =?us-ascii?Q?8AR/7AoFwAxfn8NHRTkE0MJgjP4Fhe7wEDEsrMS6R2B+0+ST1mowWI5tQSe2?=
 =?us-ascii?Q?uGBgXTNGY7qp7Y8E0K9AZHKCjxs7B93Dwip3Kvvc4SQRaKg0PqcqzoSi+ZlH?=
 =?us-ascii?Q?XoZlhkNJ1FKzFi/PoPkHven8L+glW/r6dtgOMgG/AdnuVdcNJAUMWRyK2Ik3?=
 =?us-ascii?Q?GEFTZYFcEyIZsZSrOhf1Ax2VQ8+P659eFUysc13jl/t9U40WMNqpqBS0axp4?=
 =?us-ascii?Q?GwFE72xVVKeAI0h8pYcro8xKKAicw1Ds9VH4AZlrEbxHt2Elu8sPzDrTH0Og?=
 =?us-ascii?Q?1KWwm2Lqi+zVGl5DnNQvdOhB2vCtj/M/7oi5FkoDZMklQLQtCmEqLsr5Xwom?=
 =?us-ascii?Q?qIp6yCBfeXgTlYusod38tN7u9Au+gSQvnloWfznD4P7esBwzjQWIembbYJDp?=
 =?us-ascii?Q?Ku9+fgOr+excs0mehrSCgBYTqXV7AovYamn7+67yV/kHc15m7EVWIs6UY+bS?=
 =?us-ascii?Q?laUTc7wnZWPfCVgFgSPusxR5YNPx/9sgKUutQw5D/IU6Mvg5/swUGynpimFo?=
 =?us-ascii?Q?ZydiHrWL4YS+vAXd99+CKpQw+pOfenJC07GA02vbjQrD9DWU6v+SEYv/R6tt?=
 =?us-ascii?Q?5JObNUO14Os1iTduTSJKIWH44dwcQzmyIknvRHYGOFwd/DTqXgb+h2M9cvMl?=
 =?us-ascii?Q?gjMeSPuKir0yxLNdv1278FA2bsl+IJe5vRuIxNUOlxbiqftu642FbPlwTXCY?=
 =?us-ascii?Q?kuNXi/+R0Vr55bgwmG/En7LokKqU+WXEZOuBHvH4YvqwE0hqi2+TsxovKW0f?=
 =?us-ascii?Q?6Hih9yu8Jj0LA8xFBAsmqxkV0kK1TeHpsTs81vkZTDMReX/c/XPQivbe01BG?=
 =?us-ascii?Q?edu2IRj4IqTAVAF5uf2un9dZadqV/2nN6I0uf2Na?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16a0328d-2931-4c9a-c1fd-08dd613fc0f2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 08:27:40.7370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zd/rtf9nVNGtrUEJY+MHBp3LbJO/RRTjUMYNddjih4JlYZoYLWGV5gcmPnA1qgHdywDxFPpwsSGICcu0og3nnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10592

In previous imx platform, normal USB controller interrupt and wakeup
interrupt are bound to one irq line. However, it changes on latest
i.MX95 platform since it has a dedicated irq line for wakeup interrupt.
This will add wakeup interrupt handling for i.MX95 to support various
wakeup events.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
Changes in v5:
 - remove warning
 - add wakeup_irq checking
Changes in v4:
 - warning if no irq provided for imx95
Changes in v3:
 - include <linux/irq.h> to fix possible build issue
Changes in v2:
 - rename irq to wakeup_irq
 - disable irq by default
 - enable irq when suspend, disable irq when resume
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 37 ++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 1a7fc638213e..c34298ccc399 100644
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
@@ -476,6 +488,16 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
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
+	}
+
 	ret = imx_usbmisc_init(data->usbmisc_data);
 	if (ret) {
 		dev_err(dev, "usbmisc init failed, ret=%d\n", ret);
@@ -584,6 +606,10 @@ static int imx_controller_suspend(struct device *dev,
 	}
 
 	imx_disable_unprepare_clks(dev);
+
+	if (data->wakeup_irq > 0)
+		enable_irq(data->wakeup_irq);
+
 	if (data->plat_data->flags & CI_HDRC_PMQOS)
 		cpu_latency_qos_remove_request(&data->pm_qos_req);
 
@@ -608,6 +634,10 @@ static int imx_controller_resume(struct device *dev,
 	if (data->plat_data->flags & CI_HDRC_PMQOS)
 		cpu_latency_qos_add_request(&data->pm_qos_req, 0);
 
+	if (data->wakeup_irq > 0 &&
+	    !irqd_irq_disabled(irq_get_irq_data(data->wakeup_irq)))
+		disable_irq_nosync(data->wakeup_irq);
+
 	ret = imx_prepare_enable_clks(dev);
 	if (ret)
 		return ret;
@@ -643,6 +673,10 @@ static int ci_hdrc_imx_suspend(struct device *dev)
 		return ret;
 
 	pinctrl_pm_select_sleep_state(dev);
+
+	if (data->wakeup_irq > 0 && device_may_wakeup(dev))
+		enable_irq_wake(data->wakeup_irq);
+
 	return ret;
 }
 
@@ -651,6 +685,9 @@ static int ci_hdrc_imx_resume(struct device *dev)
 	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
 	int ret;
 
+	if (data->wakeup_irq > 0 && device_may_wakeup(dev))
+		disable_irq_wake(data->wakeup_irq);
+
 	pinctrl_pm_select_default_state(dev);
 	ret = imx_controller_resume(dev, PMSG_RESUME);
 	if (!ret && data->supports_runtime_pm) {
-- 
2.34.1



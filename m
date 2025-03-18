Return-Path: <linux-usb+bounces-21848-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C5FA6774E
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 16:11:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94174189624F
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 15:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ACA420E6F0;
	Tue, 18 Mar 2025 15:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VU7mxfNW"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2079.outbound.protection.outlook.com [40.107.20.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD3920E034;
	Tue, 18 Mar 2025 15:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742310481; cv=fail; b=ZVvWpEfHyVz3LSguufV6mifYiDfC6uVTGYH7i1261ia3kVhwrmHofSu+y7bcyAWq5yT5GhZerK3vECsZhBXd1hcZC+wjjkFFYk81FOnSBNCtctkTzk1j4NChxSmPZ3/Bbvc8WWYC5gvyCfQBjjxbqzTnJsCxEBXJr94BJwUwDK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742310481; c=relaxed/simple;
	bh=QfWySGhwRt4hWOim02Q68G2DIYeJu06VBzNFIER+p4I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QKMpSfCSMYkAz1Dxn+tupjZHmcXu0059kRaOfRyzARy3+LqecU4HS37yR06dDpnf7ZjTBUtuZUcf6LOrQ8kJ9KPE+ebF1j3joV7bVJw68VI2FY/ji/+Dh/iNixMRX8pDXdbPrHUj4Wyi5fNy3+smDOV+eNC0V2q74Cx//TH1iuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VU7mxfNW; arc=fail smtp.client-ip=40.107.20.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iU071nv4XL8gjp+71DJG/rkDfWK1VmPcngiIm/pRO+4fOt0otp74L8CMplCBzZtYDY/DPF3UEF4gpgn9JRL0/qLSlz2XnC16ySdmfZ4DNLDfBj+DUeJVnHa+OEmNcSK9HJ+i32GurEeJKDa96fI0zQ9K7//o+u8DcrJqsk2Oh28wR7bSsYD3f676A00iFdurA3joLRQQwCtkecT8nB1swCID1X1EQpQ5G9Z7i5Cbs4KO/+oKpBO0/nogpz+lJ0eh8oeAa2YD/aOLjsAUqLLb3LW5/k4R1QUwkrIEj0YXV3XPvYVJQDhbl7hEjmkSAy4TMKfRD+AnCF+LOff8q6NnDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIUS0fdwfmM/XT19YzKDUA4ekaVNRz6FEuXXw/O8z48=;
 b=rrDysEHYe+m4b/33M9O8048fwaH6mLydXaZK8X7cHM16VjgIZrc2SoXLx3tiBHX1B2QkH/eGFX6flI5Y6mK7Sj7+pJa3hj2HjPz4OrBmQizrYl3oQhDztIOLe9JuToPO3M1BmHbi8rbdvPZHy5HB11tnHAjimCPcIMjXJinnKI2Aq56kAVCL4jeb8HNE0OL9RBBeL/8FWgh026k1EUdaPIjGUlfH+fL043HRKda0Psgz25IiAEmac0DJG5HQmt5Ivv3PfSpa9Ue6PVtK+lVz3HLv+MVbFnGU7rhBLg5so7XBmqc3IWU5GjUvB4Y7wLBzPR/ENm70P7b9AwCDDBc5zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIUS0fdwfmM/XT19YzKDUA4ekaVNRz6FEuXXw/O8z48=;
 b=VU7mxfNW12qJSzjgYbsjXdVx2/nKOyv1yOY3vrR+r79SMZWB0ZpAHMckYaoiTxClC9NbOXM6X8n47tp9EIQ0af92/vx5Y1feRDfW4jf+4vryTfundXx4FrFN7j08CsprUBDVRTbffq1I0arNmCA4/kUhAT26DKOjXqkirKm2IEFopfK8gMjPAzfIp61Nw+eu2TdLJShG3ap49RUbx5io7FFyO2+MPoy5CQq/7Xrjs0FWn7era6lTrcmKVhQVUWfwQK8sTPN27+ZueDtVGGliZRa81cMGMhUntg4QxwMnyNCVTucMLIfnw8dwwSwIrsgmrie5UOuHlSLcnyA7gze2UA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA2PR04MB10257.eurprd04.prod.outlook.com (2603:10a6:102:401::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 15:07:55 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%7]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 15:07:54 +0000
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
Subject: [PATCH v6 3/4] usb: chipidea: imx: add wakeup interrupt handling
Date: Tue, 18 Mar 2025 23:09:07 +0800
Message-Id: <20250318150908.1583652-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318150908.1583652-1-xu.yang_2@nxp.com>
References: <20250318150908.1583652-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::6) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA2PR04MB10257:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a200b66-7352-468b-3a14-08dd662ea8fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fQ81bfeuB/2zkGRbYcGBA5GfUnspsBJqi4s4Sj9g7h4KAR3G6M+vDXTCzuSo?=
 =?us-ascii?Q?T2ljERswZuySIOQtrDstVS29P4xMIEwqX/BeYtumDQ+1dOWnjMx17Oq74gvA?=
 =?us-ascii?Q?QXymrETbsKFEQNqEPlcWPcv0FElIAZJZPlGGiMtpQdloQPvf9Z6C+EkLNpvM?=
 =?us-ascii?Q?4bWQWIxksoy2wB9hGAOtlmgjceJxZo8mb4GL4utHiEj+hcMBhI3iDas5iiFH?=
 =?us-ascii?Q?e8+JyeKYlWx3lVOUhE86MUbV0fhP2D6ChEXO4yXaqrhktIrjdlrJpYDl6sPc?=
 =?us-ascii?Q?oTLVyddQw0W5HLRw1j16uATF+VnSX2i5hTMYmXbA5z0f/Gvt5XhW76uyKwnH?=
 =?us-ascii?Q?ooaIsWlQTBWh+DKBGMXne06UK2CwUsBwK5vy7aiW4Sbz+wdUS0DwvylLGnzc?=
 =?us-ascii?Q?q+6ChOaC6pPhmioYTh40BhlN1gmPd5FOgsPg+6QKBY6Sv8cVI+IOu7xUFXDv?=
 =?us-ascii?Q?x6eY/r4SIXafRCaaN36DUTKoZNsoRqpQk0hoeeu9y73cjJB+dnvu5j62+9xQ?=
 =?us-ascii?Q?axyIlHKCfDjRp30xZPqdOpKQpyZ0IZkAtoFDasDWE+8Gr92WIQ3p7klYdP1p?=
 =?us-ascii?Q?KUVAek+qv+9NpSgcOT9TJoWe/AexKW/KMSpQwcTlpgjGlVOSBzrf9GulRpc4?=
 =?us-ascii?Q?ymlYnQm0nkPjXz1qYiE8h0KDjUjvPgQ7cLSeiKlteDyIQd2TnkhC6eZKtrpQ?=
 =?us-ascii?Q?FpjFZ5QoSFBRO3/y1lM+KfEJUo2E5u9krM0ThJqzbelvI94iKwneS0WPAONV?=
 =?us-ascii?Q?dm0gc76IUUHR4cn9Alocidmfy+0Ielfc4fd9JWMM/rkfd+WSjEMBFpHAtO7p?=
 =?us-ascii?Q?P1uXzx7iqKdmY0KxWQgLIyXuspWGK49oI4BBOQwhYhpYksTGrd4jWxrMeY7D?=
 =?us-ascii?Q?ldcNoQnwexoDdt3TXGtyxE21QzU2lWexEbcSj1KwzxyMwxQy2svnyv7NT4pZ?=
 =?us-ascii?Q?NHzJU1fDOxokFbZWprJUDhUul//merIaVqkOvcl0WLX5DeOP5YEu5yiw6o7F?=
 =?us-ascii?Q?9F4OQ/+sqdzJVwmrWyplgr6CAICD+TjtRUXTItG7s+P7nf7jP+X8NZTcPgwp?=
 =?us-ascii?Q?X6wB/H0tC3gSiS4fAcRqOfIaZBgdj05USsfTEJMo8COyCrStfDvVl47WlSw2?=
 =?us-ascii?Q?KOERnxqvNutY1wlI+Zo6s7CoBkuWGspztVOUPvuMLgUK48WN5MEJhGwwSNfj?=
 =?us-ascii?Q?lG6/cAJ4dnaFB6lSIc9Xw9Z/K8cPvYr98qdbgYEcA362per5ak1Yob7C+Li/?=
 =?us-ascii?Q?OmAGiPsE4UBjrJeVLbc5jXo1+Ky/t1iW3q0D8c/HTUfZx2MuxYBRwIySKjlR?=
 =?us-ascii?Q?lNd27vjZW2iQFzSbdIZSbvYpmK4Bdqy7zJvqXMI1Je4qurEjRukk3xvcgOYJ?=
 =?us-ascii?Q?RSiLvirwucRPT/fC5+eD3TDIrMNV0PKeWLAJ4OLlrmA0RRvAG3+UqWCM/y6+?=
 =?us-ascii?Q?Z4IM0RjYhwCxyd1CKLp53UpuGJOG4QzI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wVPM1+2vKY/2EfyrpIxhbbt6ZNDFsq2wPCYgZRsr/w/54LgbQE8Xk8dY3ULF?=
 =?us-ascii?Q?kVDQCzSKlXGJJR+5SmD6N4JlhryqZbbpOVV4e9kwqG6NlVPaIDlEiUzcSWcj?=
 =?us-ascii?Q?LgLVevAiq/EMfc58uzA6/E8gDaOVuTUGEcQa4j6A45tuUEI9wHCSdTrDEs3S?=
 =?us-ascii?Q?pHBMeXgXWjgMSf4Mjrcl1q3q4AqgphopunVB4JHHOctYXJ/QlfncUx+1OIMk?=
 =?us-ascii?Q?XgotPAdzXeccws6LzSpWcO971rszZNuLm6B0WHH3jRf6AJl2V01XClslzIct?=
 =?us-ascii?Q?CDv5UjCPFfZkhlV0ze7+gld3idbvzfIAogiKeJ/4zhvQuWKDDmbcLisxGn5o?=
 =?us-ascii?Q?A0xBe9d0/MynU6xA/q4Vo/fFYTIei6nvlwP0psCqJ7tySVBUdX/G1tvNfBG7?=
 =?us-ascii?Q?j2xW7TThAjRhCl5w7ou3wJFzpYJ/3ZYrL3mBhlO70ZVC4UFmi/Iw6R4NCbqT?=
 =?us-ascii?Q?sfS3th/+Wtw68pMqGd6TlHTajnyGQENM9e0080n5tHVjp0gl3v9iBz+G7Nho?=
 =?us-ascii?Q?nQfmvKziuoPyzbafVfM0G9GbKvUAyj33yRieWNqSyBBE19WlWEDdXtBzJplo?=
 =?us-ascii?Q?5LGZVLmN1CYR1FMvSPQpFaTShdBJY8yAbGDdPAyZ61b1/gEX4OkMRAE9OqKB?=
 =?us-ascii?Q?pVAJpnHg71NUaAKIWHussqMg27MwoGkvogtZYR9mhzijncew3/pCXhWBACc5?=
 =?us-ascii?Q?jiNxzOq+MLFgtFnzLx9XHt1XSF9HtDvgjSkmIfoustVCUAeErAuBzQr4MJpr?=
 =?us-ascii?Q?p1e4oR05vcP2MuWU+Jl3CpfmHJOyTtqG4vWJ4hC0GZ5VqS3l30PDmrGhV+1A?=
 =?us-ascii?Q?tbBr3QVPnjZmwre8e637vN5yWYWT0ykjHErll4T8oPhNso+ZFOiKN6hvtblo?=
 =?us-ascii?Q?Dj4uoSIhAmmn3NsYdXAXH4ooVE0YJT8QB1yBajD6HgbFF4KjiD2n6MF4gtiK?=
 =?us-ascii?Q?SLtWt6viwMRkISegt1GHa2MUgalSRBsJHWOCRgQAvartf4sv16HLs8O5fi0Q?=
 =?us-ascii?Q?bptCCU8niAfcYwJGKJN1xy5LdYQAwt+gx6WUlOAcS0UWg0xK/ssO5DgYd2Mp?=
 =?us-ascii?Q?hyMvgjHC/au4DsMq+ARIMZYaNHfD+KvB04fg+MOwdwQzBM7t8Vg+zXR35Eln?=
 =?us-ascii?Q?ZHLSBEEFXmcxyb6DB9pGWy6TbO7TDJ/1QNKZUzZSV+rd87w8480Qly2ZvMFl?=
 =?us-ascii?Q?MmBUmgnQL0s8Zq3V98Yb0p4fcoJ9cj8oDs+OeT2B7R9folbjdETxAkgODt0a?=
 =?us-ascii?Q?oE77DyQyKtpF97l6r7YViw6dt0iGOksR4rExXnMoquNNX/Gp6uTS1/LxA0EF?=
 =?us-ascii?Q?yfURRUA8dODtEwsIr8thnnFZwHe1CNZPRrMHStPzI/qjkPsjRm5GEcbKGvC4?=
 =?us-ascii?Q?bBD3I6A7Njm8hd8ieqYpKLZqQsemDed3wRXERsO3O2uXmsG0ELeIg95YD3wi?=
 =?us-ascii?Q?OPPlSn0Q7iFq9PVKDrYvPnZqDaEVppX6zWVpqjDEe3FcyZtdyUP+zuNrfxzD?=
 =?us-ascii?Q?xrBzJyi9OLHznn6qrbAEb5qZjjQSUWOuHIO/NOZFYlCLBsWYrAxiL0GBQyQO?=
 =?us-ascii?Q?S6BRGVo9uHTd/aaZnBfrFOq1UWfZba/t4T/kHZNU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a200b66-7352-468b-3a14-08dd662ea8fb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 15:07:54.8305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n9r0wKLPc316GPr3yxMn3+PfMCDianyQH9v1gQSTvedcAG3BKsv4UjRbUrBxIo3zb39x6UYdqCQOS2u3H3S1cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10257

In previous imx platform, normal USB controller interrupt and wakeup
interrupt are bound to one irq line. However, it changes on latest
i.MX95 platform since it has a dedicated irq line for wakeup interrupt.
This will add wakeup interrupt handling for i.MX95 to support various
wakeup events.

Acked-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
Changes in v6:
 - add Ack tag
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



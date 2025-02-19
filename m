Return-Path: <linux-usb+bounces-20814-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC0AA3BA31
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 10:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76216188AE6D
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 09:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041101E1A2D;
	Wed, 19 Feb 2025 09:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="h0OO4e0d"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2063.outbound.protection.outlook.com [40.107.104.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00261E1023;
	Wed, 19 Feb 2025 09:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739957458; cv=fail; b=nI2SChiNoyC53AYgMAVkK7RTQ+T344MmyrZyUkxJZq/FV5INUn7fNp35A4POfKuvjoc8qmxfJ120xT/aI3mHWtpYAgiriYCEyF51r8GT7DoePxlh13sDl3eG8V+7f2msYrmAOxXw1uUQsLCX0s5khGUYbFbT/YrGoNaWBEUmu20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739957458; c=relaxed/simple;
	bh=npfRP8+Qrq5tcjSBeMQF5W0oaIjFKc533kdO12ygbcs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Oyks0Ch20OU6VVRFD88O7WKKBVVlIlo7mOvgI/q5LtMYo0rNW6qv3LquGJliXsCbrLOC2ug0TZl5IPrYFc3iL4eyrdK7SUjwaVqxPlopHFqqUf4ufXk59nICgMerc2hZePFUs2s5cu+eiaELNEJisXZEL1fNUMlg38+U3Rd+GDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=h0OO4e0d; arc=fail smtp.client-ip=40.107.104.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kegHG/8K3Z4PGwZYJ0NWzr3S/vQ2M394Q8mZ/umqtGqtXRQje+qzETII5YrEb9gtbgkypoKZy+vyuJUwIGOpAVERKPAa8SM/+882hJlymGAsv/G6/isfVXJIDBW8+5+ITDHHSUA3/psBcEWsZdcbNiIvk5iJMRoZTkNE9KAtaRyZyU2Nd8AYa6UT1b6EY4JPWwv0TmPRZcKhp9LKpdKKx4WWjhAjNWTrNZQOwrQySY6cFyX93kP6sklasxsYIevHy2Ow30Q6I7WW8LE5XTOPkBOBwYpzE3HN/siTMCXcIODloMVbUy+A71qikMPUDSh5fbZyC05yQChBLFlhSx+ayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGrNt0uxgbUQo27+HWc9PcVCM4w3E+9oj1pHJLuMmx0=;
 b=GafhYsta7a+msWP2OBNfR2xyhEg/Z6qHbgZW0pOszdwOMwCKg5DzrylBHBJ8k42ed98RC8kwSdvNtyjzGhIG3zd5xeli4KjmqM7HnCRrV+pJ2nBrVQRK58YO3tizljeOAI+DXmzqK9VFRmy/RL63vDHgkpHZV8GNCEkKjo7M59LMfLGcmM4vBYHJaqd5Ep6sHCSst4HIoOOkh2mVI2kRilJmyn1PZnYaOx1pHsDcWzBnD/P34Hli9tQ+ZD+cZGPD9K2kw/BsNbztxnzzVNeVo8zKVVpis7avJ+lpUMg7ubi5IjwMthoDeDt2A9rV0/7QQATefC5SiPvlPMxqXqqcag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGrNt0uxgbUQo27+HWc9PcVCM4w3E+9oj1pHJLuMmx0=;
 b=h0OO4e0d/6IcBV1zKiOBMnedM/4zkpsNeKGBcfp+qc59zuZmb2jar3hTPYDNFBR3HHm1KNuXiq8BPcwcD0oiBI8wxVCbLAwO3DV/GXAyuu+bnUKKyY1zcUmnCkF4pE8xx687WrQGFaUFxkd+/K/LbDBLc40Kj4nBLjgc+XWQ4m1A4uqrf2xPNeTd1lxCRPXx5M3//5asbidUEyJsem8X4NmyOB/XlOWfzcPgFUN5JKnI0ngH64q7GEkSdI1nJ5K0wnCaBv6LmhJDkjedrcykZroh2uEsjfY5Z/yGsynWJM6PR4j3rGVrVf1e46M8ohvBN29+xmDQk+B2C/Jd2kTivw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AS4PR04MB9550.eurprd04.prod.outlook.com (2603:10a6:20b:4f9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Wed, 19 Feb
 2025 09:30:53 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.8445.016; Wed, 19 Feb 2025
 09:30:53 +0000
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
Subject: [PATCH 3/6] usb: chipidea: imx: add wakeup interrupt handling
Date: Wed, 19 Feb 2025 17:31:01 +0800
Message-Id: <20250219093104.2589449-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219093104.2589449-1-xu.yang_2@nxp.com>
References: <20250219093104.2589449-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:4:197::8) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AS4PR04MB9550:EE_
X-MS-Office365-Filtering-Correlation-Id: a6052448-7519-4720-7d1f-08dd50c81a97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iH7TYyYjGCbjuXDYw8+OQYEL5F7OdVeaF+/QwCh3jCiNYrmhJBGvldQ/QD/N?=
 =?us-ascii?Q?l1d5lju3g3q0qWYPhPWi8BhkUohYbXB0+o+iaG8/wl1ECv8B9xgaNfAfU/oK?=
 =?us-ascii?Q?6BOHQM5f1Q2uBqEL2cNtr8W/yY2TcmvcFSBZTpHRmZhT25QSe2amPGZX7Tg8?=
 =?us-ascii?Q?jfiTVWTvkZnVoTM1suFEN4rJlzRxz7EXUYMyVKgCpnc1nMZ+H9DPWGTQjOB6?=
 =?us-ascii?Q?dKv2G4XpJXhtUW9xQZ3Tg++KRswlBmpsoZHOJFxg+c51CQktiL/j4NScbwbV?=
 =?us-ascii?Q?H13rx/P42PIXF1FZrpECcXsdDTSbi7ZLvCZWi90TYRX/sRtnitXADwFxUaoh?=
 =?us-ascii?Q?TNRKnSTY3wDTmkp897CQNi9wb6BcxraaqJ9RC/7cB6FRuyei1hcAcwWH4pAc?=
 =?us-ascii?Q?tLZOjO3HArX2dqxpeSKaYJB92NCOSVukWkd8D2EU4jDlmaIAOJojfhKtYdzY?=
 =?us-ascii?Q?AjvkIrqcJR3Y+QZDHuNx0Xnx9/OAZhAi+/4/s/EBAswrn/2EMdiCDcOjHPD1?=
 =?us-ascii?Q?2LLq8/zXodTRQ2aydQlV85o+0T6NBSQyIvIST6OWRAIg5KBTAWa0cLw8tjXN?=
 =?us-ascii?Q?5RXmyqAkNwpxdgiScGjSHyK+3CMny3zDIGDgYHJbe26GBZFBXadvMAR4WW9O?=
 =?us-ascii?Q?N7Spe5794DxJ40BDq/E/QJIHqXsUEyU1NvxODL4+jXIQXucFFr5ErpMM0H2C?=
 =?us-ascii?Q?CqxBokvbZMBiDqW5EAwpHrsUhBSu8k8e42HYny6nwtSDVFvoLtoSfyCMHOAO?=
 =?us-ascii?Q?BWDjI+3aFn/0uf6MOvFN438Xe4bsNQjetCgLFfGOncMKXgkaxqzk7SJbreoJ?=
 =?us-ascii?Q?Iu4kyZKNl5gZ1qocaeZNgPewuzzpzLrgC+gQ4Gvg2eCOmsLDaSlUtkwOrq3s?=
 =?us-ascii?Q?Rjy61wYtMa/Y8yIgbSwjCxwSHylw/SIuByfxSdUW8nshd3TDyq8UszPb7HHN?=
 =?us-ascii?Q?DRsggJ8c5iOFObBkGJuLZSVBR79JuRvvz2mDOzPsYrbw3sjCLXGd2oLo7gB6?=
 =?us-ascii?Q?vjNVbmYsoc0++aUtFJ+mBxFT9bO61FSMvmwwufy67zdlYHfaNPx/YEyAlnVA?=
 =?us-ascii?Q?zU8YwZN5lO5Dw/oBqMAVflMy8Q1f9yalmPh3wILU7gBoe7UlL4KcaP2UpZpU?=
 =?us-ascii?Q?gPw1fqJD1NPUvoP3FHr7zwefc+mEN77K86V3yXNDSE2reLE27+1E7SHQAyFK?=
 =?us-ascii?Q?yHa1bXRjSoCTQLbqkRe9WDndrORswlTU1AE85h2KZ40YR5HvMfwTl+Ptg7Nh?=
 =?us-ascii?Q?EGJORUjNbRRh1o81XnzurTEUczK/rfTWvUqli2KLCji5WUpSpaepFSYxz7FJ?=
 =?us-ascii?Q?P27sjX2DNTB8ujOcDvCL+VxqYJclHKK+WRLXzchwwZNbSFm8G3due2QjNK33?=
 =?us-ascii?Q?o1rYDt+fCXWB6OD0vHWiSolsdUAVlu9cE8JRokLnaMIvqgaD81k1yOMJMd+B?=
 =?us-ascii?Q?C9ObiNS+02U8q3p8QBNuxL9vJAH6JODP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kH1SbDEe5HUpW4b3U20HRoiD7q20rwKSkTML2vFnxaQoRv8hvFN8VOApBUno?=
 =?us-ascii?Q?LVPS/c4pE3OVqJqOqBlwAe/ES8eE1PlXdmJ3VsZmiBQ1lA97oqVb3a1IbmHE?=
 =?us-ascii?Q?Q/CtQhE4idE8wL2cHFwC75iKVA/7ED8gkM5M8mjWqmHdtQaPrUXLuSU3Eg5r?=
 =?us-ascii?Q?tQeXd34pSCuzW8CYa76apaXzsWLqn3xiQOtxtYJirmy3UfXEKcrNw082twgM?=
 =?us-ascii?Q?zi6iOZEsb6SO6WwWlCmJ/tK5MJdrxSzWTy4TfrTSVK2mgBCuvvPubcG1Bvls?=
 =?us-ascii?Q?PX1mlAPyxEsn2PRcj9bUqlyEs1zPEqc4CnON35fBHn2jSlJkGBOdcrseoRrm?=
 =?us-ascii?Q?Ko7EP9JNlkQt4TBk24dzautd0iu2fTv+y/Q+fCwhrPUN/JUmpdHVSeUMLv2v?=
 =?us-ascii?Q?236+zSed/FYbvWXKAeL4PoGSPhqmnJkgKsX74jLVMS0K7nuXOXIxXttsuozn?=
 =?us-ascii?Q?PyexL7+w98gq52bkuGwbu/cCid8fHu4CXF12DXIZVFN7pwj6ApFrUak1m/gF?=
 =?us-ascii?Q?gxG2vrtDYFxtWooPXKbIJL8WOy6FmkPGaWdw5KRUAzRGjtL4dMt8KhqhG3Un?=
 =?us-ascii?Q?OKnFG/OwmBoRX/sHhSvBhuquHxNQ7/66tq9nuIyX4jc2tcSFmOH/gBUEFp99?=
 =?us-ascii?Q?FaIvZv29JVodvGEzP137Hfc8ySmZ/xQdHYDS1uwgHOITv8Ff1VTdTzf1ESAP?=
 =?us-ascii?Q?Hidf2XBOf+vO69RAtOLk/7ftZwvrvp9XJz3IKcG8SvwBkXnxHXFG6dX6ESmJ?=
 =?us-ascii?Q?8tjiJ9SaF6ZtcjiJX3ZolMTmxMy1vgEi5hMiw6BPC/dW6Yejzc8/NBXvuiEI?=
 =?us-ascii?Q?ioyi5ao2QetNSGa2Sf1ly72Ga2LX+S6PO2+3UuDHC7ZCrJOEFH+6193uZMQd?=
 =?us-ascii?Q?yKxUilBCs9duc0QGNi8rZJw7es041wfF3GfBAlsKwEbbyDNE8wk3Gwtr0vly?=
 =?us-ascii?Q?W7FX8bL3CeplKaYCxP9TS2vkaENKygxBhWjhqXtPn0TEZ8SQdws17EDkfdM2?=
 =?us-ascii?Q?ftLRiP3X+d+/vRy57w3+LdV46s9ZB89m3vRI18MK54y3MNP2taj2Klzv2Ua4?=
 =?us-ascii?Q?4UH7LWZVLCxI7RlxaZxhbdrws3zWN01ULVTaniXaQNjUTx0jVSh8MWH9fjdu?=
 =?us-ascii?Q?4+0oM6nqGqsfOcA6eDT+VcLKQygVIyZkvTg6JA00UiIMVzteOaoaBXyqnQ3t?=
 =?us-ascii?Q?AGwdgdLqLH84D9HRMv4IV+xSlCxiF+IAEK8RLZ3vw69f9z2OPsaREXcms+w2?=
 =?us-ascii?Q?gfOMgtJcehksOHHG7rJeY459VpptlLLlxOfHgliu0KWU3UuZK1buAxHoQI/v?=
 =?us-ascii?Q?WtpUNsgtLibJm6MMFBRKFCZvJGmmzoahIBbQn790Esw7PJDJIyd1Ykw6AMBv?=
 =?us-ascii?Q?+uyyCoSHDxX7No/xJQNcOHd2FycU+BAEl9tFU97O63V6+PwhauvK8hUlrCf0?=
 =?us-ascii?Q?bAvwdmK6zFjQ5OCtjRQ+2Xcn38sX3WisZLnuF2i08roP9uObiLj7QPgxvnyY?=
 =?us-ascii?Q?S1iYm5o3dc0tpwCg9LrdsKggKSDo57bEDMxmwU8SFtyFY/xEJ746FBwNmVts?=
 =?us-ascii?Q?MXGdZANC0UuwoY3DVKbpANrYC8XcbmNLdaUFpNCg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6052448-7519-4720-7d1f-08dd50c81a97
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 09:30:52.9426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CzLF5sL2hmBkD7Zr8zXUg/GWepMpmuqnqGygGhKqNVuiCbkSszQ6hDkqpf+8X7YdWsAypeHyXlT5sThXgUreXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9550

In previous imx platform, normal USB controller interrupt and wakeup
interrupt are bound to one irq line. However, it changes on latest
i.MX95 platform since it has a dedicated irq line for wakeup interrupt.
This will add wakup interrupt handling for i.MX95 to support various
wakeup events.

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 42 ++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 1a7fc638213e..5779568ebcf6 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -98,9 +98,12 @@ struct ci_hdrc_imx_data {
 	struct clk *clk;
 	struct clk *clk_wakeup;
 	struct imx_usbmisc_data *usbmisc_data;
+	/* wakeup interrupt*/
+	int irq;
 	bool supports_runtime_pm;
 	bool override_phy_control;
 	bool in_lpm;
+	bool wakeup_pending;
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *pinctrl_hsic_active;
 	struct regulator *hsic_pad_regulator;
@@ -336,6 +339,24 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
 	return ret;
 }
 
+static irqreturn_t ci_wakeup_irq_handler(int irq, void *data)
+{
+	struct ci_hdrc_imx_data *imx_data = data;
+
+	if (imx_data->in_lpm) {
+		if (imx_data->wakeup_pending)
+			return IRQ_HANDLED;
+
+		disable_irq_nosync(irq);
+		imx_data->wakeup_pending = true;
+		pm_runtime_resume(&imx_data->ci_pdev->dev);
+
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
+}
+
 static int ci_hdrc_imx_probe(struct platform_device *pdev)
 {
 	struct ci_hdrc_imx_data *data;
@@ -476,6 +497,15 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	if (pdata.flags & CI_HDRC_SUPPORTS_RUNTIME_PM)
 		data->supports_runtime_pm = true;
 
+	data->irq = platform_get_irq_optional(pdev, 1);
+	if (data->irq > 0) {
+		ret = devm_request_threaded_irq(dev, data->irq,
+				NULL, ci_wakeup_irq_handler,
+				IRQF_ONESHOT, pdata.name, data);
+		if (ret)
+			goto err_clk;
+	}
+
 	ret = imx_usbmisc_init(data->usbmisc_data);
 	if (ret) {
 		dev_err(dev, "usbmisc init failed, ret=%d\n", ret);
@@ -621,6 +651,11 @@ static int imx_controller_resume(struct device *dev,
 		goto clk_disable;
 	}
 
+	if (data->wakeup_pending) {
+		data->wakeup_pending = false;
+		enable_irq(data->irq);
+	}
+
 	return 0;
 
 clk_disable:
@@ -643,6 +678,10 @@ static int ci_hdrc_imx_suspend(struct device *dev)
 		return ret;
 
 	pinctrl_pm_select_sleep_state(dev);
+
+	if (device_may_wakeup(dev))
+		enable_irq_wake(data->irq);
+
 	return ret;
 }
 
@@ -651,6 +690,9 @@ static int ci_hdrc_imx_resume(struct device *dev)
 	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
 	int ret;
 
+	if (device_may_wakeup(dev))
+		disable_irq_wake(data->irq);
+
 	pinctrl_pm_select_default_state(dev);
 	ret = imx_controller_resume(dev, PMSG_RESUME);
 	if (!ret && data->supports_runtime_pm) {
-- 
2.34.1



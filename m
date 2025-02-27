Return-Path: <linux-usb+bounces-21133-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BB0A47995
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 10:53:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFA073B38DA
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 09:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA241229B03;
	Thu, 27 Feb 2025 09:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bgNT1ujP"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2072.outbound.protection.outlook.com [40.107.247.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446C521B1BE;
	Thu, 27 Feb 2025 09:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740649978; cv=fail; b=dFD7RVODHgmUeCGY1wQ7ATlvYy00NFKPR+wn/GIqUOz6SqEib/W8m5H9CEnUOTIJh7kddExFNZqCQgM/Si5NINvI2wcI/TSTkIGtMUgXHpKkW9IuP0YSLi0dAlG/EILZ/B3Fao91wi5PWpRSBmlmhXH/jwefHS6DResaVp9glgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740649978; c=relaxed/simple;
	bh=mhZNo8zNLJf05/KmGt6nGi+GJB3Fi5s1+CG30Ijscls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=boWkEbzAQ0fVXwQaV/I+WABh6oN9/mr8VCyCNx1vdCXbPjqRVPdk0XxnFr+Vzr+JPcONXc+ZyKRI3ReJK5ta/1zzCMPgJl+XMXVQaW8qhJT4n3LjqkzgOxOFZF+dsyYMKrdj5cfNvxU0hLlDo8Sh5WazaWmygZIL7HxvFoiL+84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bgNT1ujP; arc=fail smtp.client-ip=40.107.247.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GAjd2OYXrMqtJVm418mIJEQeH16s1fY8o49Kflxk8zGx+GfPKXgwqyZjmtOmdKQhY1L0WsJevPp7hXtKa/T/K+rkXKlUQT/BUUcL4cVOvmADjq800v84IROBxDcEL2fy+541FCfFZyX0IZ9PnLtWkQGUdE7aTxfxQVNT4e1RRxjvZzgx0lsXhKDO8KyRbGW3JtKyI/bDUyf218iZmDzNx1cElMKd52pOxIXa0xAkLzHTTG6Rl3ou9jLkzfpqqiNq7a3E6oaub3ZPyay92lO1AMBXHDHS51tem+ybEiseRu7Ep1i2nppkNhhsZk4E/2AhzqXW0ww21r6h68rihI9HJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+gsji+JQ/I0p2Aj5UaosIqZMHdF6Tl21vF5RC6TpWQ=;
 b=HeiZLgy6fx2EkIiaL5aa7G1guypZ7MHLWn9s+UZwZIpGOrEIalOxOJ+3RhQAX46jdGe195wzxPuS4MO7SaUcj/kZ7oWqnSsF6ek2afB58SceGc1tQbzu9jeNR4MFKRn/QkkgZMRagk7W7/kGTN5kLlpQ7PtzAb6Dbx54wGQEUr2en4+j380BG7boIx9B3GeSpkj5T1reNFjrCcEUsW9kf0i7gDARBOU4J1uJ7RK0fONHKFJKAgrs0mgAEfl4OCfAjYP7Y7Am9rLr+xmqadym2JggbgRTNK3PXTexze6bJ/EC+oH3eW32ya7SrSAvPt36JG4uaH6zgpOaypG/8USPeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+gsji+JQ/I0p2Aj5UaosIqZMHdF6Tl21vF5RC6TpWQ=;
 b=bgNT1ujPy/cR3KXhApTycImBvrH+J9Bb8lkBI8/EVOTl/TWZMiVwYHU3e4B1eZgIh3wPVqVWpfi7FH4JpHRXiHgrxOkaVqiiwGmDMnLPTPHoeT4+xc0O6+k9zY2Ncg/7YHKR8c9YQP3Wy4VlYnSQccaUKxwXOS+b/BSeMWw3qJ/3GWf884xYLmLFH0puDwstfbMqwI9yLM5iDn+jyqI86rhKSJYQpXIj2IVsDTP/33eN8ek71OoAe/UPIKnTqxD05kw+Loqy5bRkZ2oVy0P043s0q+SI3mG1MdoV74u+TkF6Zb0YwIkX1Qb6fxApSNE85YmGGvZgUT0bmHvJ6xYNFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI1PR04MB6848.eurprd04.prod.outlook.com (2603:10a6:803:13c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 09:52:53 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8489.021; Thu, 27 Feb 2025
 09:52:53 +0000
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
Subject: [PATCH v3 3/6] usb: chipidea: imx: add wakeup interrupt handling
Date: Thu, 27 Feb 2025 17:53:45 +0800
Message-Id: <20250227095348.837223-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227095348.837223-1-xu.yang_2@nxp.com>
References: <20250227095348.837223-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0205.apcprd06.prod.outlook.com
 (2603:1096:4:68::13) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI1PR04MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: fdef2d31-faca-4ea0-3aee-08dd571480e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fJru1DoNEV6fx8Y17zcI62Tou94UAXNQBMajIDM0aw8nYEJT2tcJnInJ4Ya0?=
 =?us-ascii?Q?+S7SRsdmY30fB8M03WVQpHe07SAy7FlyukCywprfJ3OzvxWhkZdqH/zDf9B7?=
 =?us-ascii?Q?6RgBcODkcGDbtaFcSWc4M9i8AOydPPdiKcLh0qFkoELbWXbbi6tpGKTjlwaH?=
 =?us-ascii?Q?Gb6gg2eEj0zGSeZ003LF8zole4H8pKfFasiwaBPNn75BRCImhpk1AgYLZCdn?=
 =?us-ascii?Q?8QuQrl1ytp6m7ElSB5n6Loi5nWcrK+MjKbILmp4C/t42GASFz4V/5gmC8Jzp?=
 =?us-ascii?Q?BJhosUQCEmsPyAXAwVkOrBpnI9p5w2Ai4jHMa2aASto1sBbmQ7SouXTUp4fv?=
 =?us-ascii?Q?IABzOUxqCViAYWRM3OYudm+zD6VVzkB2wf9/1nlIiaQI4GprM5riOg+xuG5t?=
 =?us-ascii?Q?RuF3AkNXoDlWV2JwtXGwgSpF6p9Exs8Toh/Wc1LgdAu9cBfUcpSl5Rcx4sdn?=
 =?us-ascii?Q?gEuTJi8w4uNMfNk4n2C86i0n1se2vAHtT0oBivzFVhwWRBoEGLvDm+UJpht5?=
 =?us-ascii?Q?+FFffm7laUCDsccXH9fDL+kqm+M6IuH/CZOZLeJtKw2BMA5KmvuRnYJTXZWY?=
 =?us-ascii?Q?yGtTd9M3L9mljg5ZVVs846ies1braYLVPK93ZcfJz9mv7Ast+xvuMrSUfbBE?=
 =?us-ascii?Q?uoHNqALa5s00dtl9nObRmBr1XtL6VDL0nodrQdDf5ElCjocvL9YSh/YBZHj0?=
 =?us-ascii?Q?SdRjUD09FIkK6IZRVNqs4UrlLcFv0QoItqMVWNkEqX2+juGmozYn77pWJRCn?=
 =?us-ascii?Q?TE0hJNAlIzgTnQmx+CQsmFrpEb4b2ugWJXua7jF5gKwmHf8qQOT9DV0SLep8?=
 =?us-ascii?Q?MhZ3dmyKC2iQPGwM+sFxFH7w+JDgcz/jpZITnepI6kBExE8zaW55FnvSdpEH?=
 =?us-ascii?Q?kDzSOVwc/go3Lqp7MtFliJUb+FSYuwdKDsQeQyHXBmku13lU9h6IXe+YGcZ5?=
 =?us-ascii?Q?LwvRApmsTa3um2AuzyGdcXhc0NPvG0o1l9PNp0jbZ7TcuH9QCcqox3rZf7Y9?=
 =?us-ascii?Q?tAHILlIBRky9fQXWV7ZzJNRBFMpqnx9xrIt5ZJ7ftEsi9wSThk8ZsM+JFxrY?=
 =?us-ascii?Q?y80hltqsgAHVkrSHDIBgeo+/TO7vdzI+otDv3zqIc6oHE1hb1y3kIM8Q7cbj?=
 =?us-ascii?Q?KHeS6ylwHAt1lcMIvC/WFz0a4k/cIqqT1+2qfdWJvMYmmkXLAs+eHE5bHghI?=
 =?us-ascii?Q?tbtbSmg4QX6VzBlyljBmF488rfAstNz5q9GsXC3amUphOxSoB4gC82DYiAz6?=
 =?us-ascii?Q?Scy3A2theHdlmSkkeOkWoO6CM6OMUGUJcSHHVrAxShThmmAyig9HpfNfR8gD?=
 =?us-ascii?Q?KhcRNUxZGT78F3iyXmQe1ItNvdIfuk0e7stX6ekF2gdCQkKFRmgSVcgL1V7y?=
 =?us-ascii?Q?jHeEk+YS/OqoYCsGRYlSSCgxmDY+sfqABt1IE9YjCT3rcqTaaT6iRqK2DKSr?=
 =?us-ascii?Q?336syPGDyo52e9yBSALUy3BSuUgscQaW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YBW8Y8patik3W2Fubg6i4UGXpvmdEg5Hb64SCOXtRseTb3KVREsqVGCaSTiV?=
 =?us-ascii?Q?bhz3jrB/3GFh/FmhXgcTu41uIueiwgk9rdx6Sl4gfxSt4w4iDsTmst+8QDl2?=
 =?us-ascii?Q?RjR+s5ptid2saKQ7uSiVVVrHOSNcaJrR2SrpqH4NnIMtugrjIvC1O5jXpf5j?=
 =?us-ascii?Q?UGiy15yGYBSGmDkMAgDvNWZUL0ABO2r1npXlVuLc96s11mGh7rcGzdEE4HNf?=
 =?us-ascii?Q?csXimuMzVFos3wTp8+Yi9lxhzjUKK//BWcrd9t8ProgdjOT7fGI+36ozo863?=
 =?us-ascii?Q?7xvYRC6G9rQfDKof1EZ1T0G7qN5pnvAAIsknqAHzV2+PiZMRR0AYZMIWycnS?=
 =?us-ascii?Q?PEHbKdgfonNWOKV7xtnq3ATRw3ChGSLNqr49OqlsINqUKC5BbUv2ixNW8vXA?=
 =?us-ascii?Q?o75QHN1hFEEDwl62JZ3ViYIFkEnR58WObV/Dlu6sesTt3ACyqWvZNrQ1AP3P?=
 =?us-ascii?Q?KVZSirsWmpsiXD/iaMLynnThkyp4XCCsre/GkK8IpDc8EfUUNgP5MP5O4gQy?=
 =?us-ascii?Q?iZQXJurA0CxjFPe5vOYLH4QKeRGijm7AYDmD6ShpfuMVpfSNBxcNOiYNLxcM?=
 =?us-ascii?Q?uDULQGVmCCmfdPebJ//dnVrBtxk6c6dnj9QCoLO3b+wg42U8rLd09T9bOtNJ?=
 =?us-ascii?Q?sMySN7Y1XZi0X7GBMTV1fG8aOBxBnSObhYyPOXW/0fSv1IVxAzAFDO4Y+Ims?=
 =?us-ascii?Q?3fDw0Cppt7fQpk7WiboPx+U3aSmVsb6Eq5HngWsxgo6ar/89mXfELeODOF4a?=
 =?us-ascii?Q?ZxXzLwzlxT3aP9y2TItCu6eX6SOo6vRrPyiA+vjJzbIQPvS9iTfiO5SCkS51?=
 =?us-ascii?Q?PyHCZQe+uC+9tcEpjJwpfzUGDAcmL/Okn/D5UL6e5Xqip8HP/hAY7TEbErPi?=
 =?us-ascii?Q?6aoLSnTNC3surm4RdD7aSDcqO744LNB1Ptm7thzcbLvUXDL4O/t5Z0To3LX/?=
 =?us-ascii?Q?Bkpuum9s0qldatemv6ZeNiv8JRkzyiW/yo7DPcM+FDh9JpZrC1laNvxekgI6?=
 =?us-ascii?Q?AvqjADzGbUb+q7iRr1R2d4KgP8ZHnm+6pNr9xF+gSE7Sc1DNG7oljrCX3tqR?=
 =?us-ascii?Q?KPjywFL57wuEZWjAUgD4RTBOa+j9qQWP4E5AcvxQSW1D+w6wIkaRWz0Z8Rw9?=
 =?us-ascii?Q?N6hm5Xk5cg8hGlLt4NmVcVDQ3Brwuv0vQl31a1wVRDO/242juE+KrAMM9fie?=
 =?us-ascii?Q?8vHexTwhL70xzJxDAlBmjWZuUVciW6HcDQ2sI9o6gtSuXefpqT0B9BDCDr63?=
 =?us-ascii?Q?D+3kEQyzPsxg4Tx2afutiVoUTcEoI/yf3hk7+7em7ZMjKTeCqFkfe9+TsqHz?=
 =?us-ascii?Q?mAzbnitg4Aa1wDeQvZM87bb+uMoNo60uL8oHsh1rsZb2baOGaYTRLMb/Tmpb?=
 =?us-ascii?Q?kdCBMpf4xHkwYf2rFXip3NJTgCWyJJ1sWewzF3yELos1IkpnzhMDjBnY7Yr1?=
 =?us-ascii?Q?F/HMKktFKSVY/rjRGhKnWU+0gmb+Ize6QnDxMIOY66Ukx2eY8n8NMufEvj88?=
 =?us-ascii?Q?ZNsu70ubNnzCwsq6rZ/HrRuPdJiYqG1BPF13r3E1UaajRbANhsVXxUxhPUVU?=
 =?us-ascii?Q?ECagP+1UqCoeOatgRDmF1SWnKi+q96vN11PqOuxN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdef2d31-faca-4ea0-3aee-08dd571480e0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 09:52:53.1730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h5q2W+iHMZSe1o2oEYnUXyQJwn7+BDzcedTdyIFZ9igHXCPDo1NtkEsBTfWFlZ1ARw7vYPRjnZhigc6rf3caMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6848

In previous imx platform, normal USB controller interrupt and wakeup
interrupt are bound to one irq line. However, it changes on latest
i.MX95 platform since it has a dedicated irq line for wakeup interrupt.
This will add wakeup interrupt handling for i.MX95 to support various
wakeup events.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
Changes in v3:
 - include <linux/irq.h> to fix possible build issue
Changes in v2:
 - rename irq to wakeup_irq
 - disable irq by default
 - enable irq when suspend, disable irq when resume
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 33 ++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 1a7fc638213e..535a1476a6cf 100644
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
+				NULL, ci_wakeup_irq_handler,
+				IRQF_ONESHOT | IRQF_NO_AUTOEN,
+				pdata.name, data);
+		if (ret)
+			goto err_clk;
+	}
+
 	ret = imx_usbmisc_init(data->usbmisc_data);
 	if (ret) {
 		dev_err(dev, "usbmisc init failed, ret=%d\n", ret);
@@ -584,6 +606,7 @@ static int imx_controller_suspend(struct device *dev,
 	}
 
 	imx_disable_unprepare_clks(dev);
+	enable_irq(data->wakeup_irq);
 	if (data->plat_data->flags & CI_HDRC_PMQOS)
 		cpu_latency_qos_remove_request(&data->pm_qos_req);
 
@@ -608,6 +631,9 @@ static int imx_controller_resume(struct device *dev,
 	if (data->plat_data->flags & CI_HDRC_PMQOS)
 		cpu_latency_qos_add_request(&data->pm_qos_req, 0);
 
+	if (!irqd_irq_disabled(irq_get_irq_data(data->wakeup_irq)))
+		disable_irq_nosync(data->wakeup_irq);
+
 	ret = imx_prepare_enable_clks(dev);
 	if (ret)
 		return ret;
@@ -643,6 +669,10 @@ static int ci_hdrc_imx_suspend(struct device *dev)
 		return ret;
 
 	pinctrl_pm_select_sleep_state(dev);
+
+	if (device_may_wakeup(dev))
+		enable_irq_wake(data->wakeup_irq);
+
 	return ret;
 }
 
@@ -651,6 +681,9 @@ static int ci_hdrc_imx_resume(struct device *dev)
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



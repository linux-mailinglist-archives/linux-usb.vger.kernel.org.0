Return-Path: <linux-usb+bounces-17614-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8F99CDBAB
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2024 10:34:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A31FE1F234F6
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2024 09:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC4018FDDA;
	Fri, 15 Nov 2024 09:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="diVbWPHV"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2062.outbound.protection.outlook.com [40.107.103.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28CD18FDB4;
	Fri, 15 Nov 2024 09:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731663241; cv=fail; b=PCGTx7jbMkQI08jBjLWVZymw8vmrKyf1ITTpnq6Asfpp9mv+INu0Zgwefw5qbVzMfv1XvDgLuYe+DRqLuwmG4lO6Eczf2sdj6NjGlVGjzqsWDd1IIGVaLmzzp8/Hv1GhX1OBfBuVkVBQAIeRkCNYSlhaNIgnSe9citK9MojWQ6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731663241; c=relaxed/simple;
	bh=TroSg1CDKk6pHDzddfZ+nUSfLe82PFUdnN/lft9ES8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I8eAwSeDL39jpL85PqV/u9GetvGi1Hi19ZMvwGNpcER53G7YA/Op6xYDGhUJmc8hVpdF/Z054dHF/+VRsDwZbvE4PQeNo3lvbkLmaXqGhzz9UZCw/3c5zR02sCG6Aicsawd3HCzD9KiLBRg747yKe2Tm20+42It+h//CBRG/GZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=diVbWPHV; arc=fail smtp.client-ip=40.107.103.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WSogbxT6v4j96h2qLUFpiMJ2JlA2Rl7MpTZdZUaB/kN0YJD8xYszz+bDa8UpaJmKMAmWCBE5YIA0pKrcJZFlnSAeguDgCgpBVMAih1lC2fDe5TPzTPztpKtCI6wESpFPgeMDj9wDG3uhD7aaQwuu3knYDf1xkQiZIl8GImugfcREzPRADDZrSaanYxpsCFuZDBGB5Gr6ey9FokKdlrBZbzG5kmREIFRmb5E98g0uBYt7N9dG8pkKfHijMEwVs4Wrdy/2mUOwKJWxMcnC2MXoQVqeQdYs1QLZVBuXRUf92JU3F/jXPQk6zLMsrhnsilG8M+LVAUgXDOMZ3m1Bb7V0SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Umst0GgCE8XGdAMk4QyG+/1bS4eZCNRb788ibcKmrc=;
 b=CvFoiNtmTkVOSJ42o8ZOwffTtPhKGtQgRB2GYqNIjBXQZrzoqWyNYmQN4awtkrvAS2atqUxTsXw2EDqdHFw2NYCIFKHvPHfrBItH2dTYI5oHqWl6O9LYrZu0Ac44SFugiLFRU7TTrTlZ1ea88yve4Yy+J0PRE8pm69z8rqC/NzjiQXuERGZAHyt1yN8ALnJ5ZTGhx3GYG81r1nvuTLoD8m8fNZAw84Mh8+UWXoV/cpHAvXQsJs1gb1kD8DN5UjEgqR7tUt7VnpYoAjBQWRAScmuMg4r+RiBmSGaGnvDvZ6VFOKza08DqjhddUGykBcU+hTHrn41EsLECrup/LzzH8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Umst0GgCE8XGdAMk4QyG+/1bS4eZCNRb788ibcKmrc=;
 b=diVbWPHVotZOquq1FuPdSRKf8x2Yn91Jfce7aVTNRvQzyHKVHAoRZwCULP9E4mc5Uf53wU1px3rgqUq96UV2ZimsTC3+10GTfO/ObDmBbNFz/qJUUOtM9gq4ISxm1Fq/mkLM1kCI+B2dkPMV713gS3WUH5BTGMvGXTbfgi81gMeVlPDPANCcDLAYyz1uE1OFwm/kEEO24G3zNjTQIWu11QYmIWFhOe81T/YDdM9mwCnW08xRzakL/BspvdhLE7wTJVd1bzZHqwtqYHSwpRkDxca5vxSc9c2H/UR6kHn1CylclydW2L1mz9Kzy1zksug55ifxzVLj3HOsEE7IJ+b5/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAWPR04MB9743.eurprd04.prod.outlook.com (2603:10a6:102:384::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Fri, 15 Nov
 2024 09:33:57 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 09:33:57 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	gregkh@linuxfoundation.org,
	jun.li@nxp.com,
	alexander.stein@ew.tq-group.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v10 3/3] arm64: dts: imx95-19x19-evk: add typec nodes and enable usb3 node
Date: Fri, 15 Nov 2024 17:33:12 +0800
Message-Id: <20241115093312.3407815-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241115093312.3407815-1-xu.yang_2@nxp.com>
References: <20241115093312.3407815-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0116.apcprd03.prod.outlook.com
 (2603:1096:4:91::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAWPR04MB9743:EE_
X-MS-Office365-Filtering-Correlation-Id: 28c81716-5b7d-4485-9b69-08dd0558a132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kAJ0pyb4SrKjacx03EkeSbjG/zlpKVuCpsB+xSbdgKtq0JXCodL5MjPnLTmb?=
 =?us-ascii?Q?oc0uJ4Yj6ua11U1tS4Ult4SQT54xz0sN7TKtEUNQkDHWEP2dtnTScxGZWdLA?=
 =?us-ascii?Q?ETiMOtUOXuW0ds/ZjVDZWS187m7R9cJqZUJIARY1DFJ3rjo1E90k7MJztt62?=
 =?us-ascii?Q?ACnRT2fFSWSzoaEn5uPYSqnGG3mlSAMWi315/vLKvyp3ORsmTSj+Oqx31FQd?=
 =?us-ascii?Q?wZL5Y4BvjyCGEa6Wi5gecdvh9mBIDEQ5TktakDaHYqdvBqTmbBrIyLwryyJW?=
 =?us-ascii?Q?mgsg/+IjP/olKCpa4XqYHFgUgUUFeeiLejA37Obgto+NVAckO7FRE8Ek0M6+?=
 =?us-ascii?Q?v54o/2b1gPeaiZzujn3vaD+ABJJgAUCTKtyJyPP1e/Ieo530C2yj9kKuJnrM?=
 =?us-ascii?Q?Yzhsa6IapDTXNbx+ImJu9IJNv3ZE/97hY1ywOPCQuuv9FCX3V3aZ4EoNK/d6?=
 =?us-ascii?Q?DRpIRVJphYpYGtXzQijusAbwKB2j+aEcQWD2mr1OVKGg1U7Tl3LlCt6MeB3k?=
 =?us-ascii?Q?SPzAHn1kbkRRyaQ6srHa40TFd58laZdAnnay/QC551tNn6fQiIsvJraobu7U?=
 =?us-ascii?Q?FtaSZUyeY27ezGxs7ZPms1MlKkoCCjN3Ktf3wzzBWx+XZbd8atBoY83MaMi+?=
 =?us-ascii?Q?DHDVOO7wcF6YTBtx33YKbuJy367VCtOeF5Bd60Us4M4CAZhksfYA+mGWe0V4?=
 =?us-ascii?Q?x2Ly0OrHkknmtNIG1XiYlP8mkIkgooL+EtZQXS+OL+WGmtdkDQStwq3mFLGr?=
 =?us-ascii?Q?mronytpMrL4JDmsgTWWQGjMQpFexMjPIG/5hKJJohoU2QOw61O3Xom4iLUnY?=
 =?us-ascii?Q?caB6qiFyfT800zVdsCEkXa92LYo6rI0VB8k4WT6uqH846D5W7PYsHMPUH6c5?=
 =?us-ascii?Q?4Ib+uBSNKzgVfu703oOyRou+XrjkLr6fPnkjLIL27PrBalQ4UTm+JCtDlmru?=
 =?us-ascii?Q?CAcQ1PUEwp7qR7QtI3W+LQVs2d+APMduPGpKlbYKhQOGtb9LNTrjxYCKbPLM?=
 =?us-ascii?Q?MeroP3ziO+3lWLZf8OKyzOJwbN9SipJKu7fS7yF4JVu+YBsm5hleR9BN+2rE?=
 =?us-ascii?Q?iBwH5jQTHyQA4ypb6eNQnHlmgmZPqPzNc8ffyz4z+FbT2lSB+UWHu+PPxBPH?=
 =?us-ascii?Q?K9FVNCN62mHGDePvTzVHzB3/wBnlof+XDOiMLR72ROTLJx0LjNrJHku5yZWV?=
 =?us-ascii?Q?5lwV2o4ahmlgZRLny+QHMets3ZQ92tP3rdhhbOJ21FQJPkDIB/sKyHoRkUoN?=
 =?us-ascii?Q?h2naY/wn/rL54TyL7yrmr+cZ/KYzRHPvBPvzhNDruu3UOpDZqNBlb4jvXA+E?=
 =?us-ascii?Q?Nt8aB7ffoiUL4Y84fq6UZy8J8Rt6V7P/GiFzYSS15LGyMeA/vBFr46rea/jr?=
 =?us-ascii?Q?YRBSbcgpmhy1EuMpl5Ar/5qQELaI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nlz2aqtsMzyqPWNRuj9JUaVSRNVCftELw80rcYf/m3Dle7AfeEZkIzH/2HAg?=
 =?us-ascii?Q?wUsgeqYJloVxc0u9ctL5S/u9tBSZDREq2wk5G/O+E7ZL8PixSziT+HkSeWfl?=
 =?us-ascii?Q?DH8HVxsXVyXW29dSfxCNrw0oDb4t92X/N1DUJ1nJUUIIuyGiGy12+Zclj2NM?=
 =?us-ascii?Q?g84cOqW8SrL/+YPjbdjemfqvvNXsbWWbZCO3ZUS0gZvF5I3efmI8gSmlvqk8?=
 =?us-ascii?Q?/DEViZq2q7LPLJrlWfT/4m55GdgAUYEBS/67SPUwBUAMQeYysPxc8iQUcAr5?=
 =?us-ascii?Q?KrntimnUSc1U6p/aHCRDK2myb0DkOHw3eRN2mGWZ9jJt7WcC0PCHeoc+bXst?=
 =?us-ascii?Q?oLyLQmNssGMuEr5TKWv2kar14ehw0XPAGvc8jwKMsOmgPYJLI7OeKF3S2+KI?=
 =?us-ascii?Q?7peajcrAr+T2iIyDBYVPfmGDM8ZYtGw8LQpjbIexUbGQ+xeFFvyqFeeBwFyb?=
 =?us-ascii?Q?EI0B1sJST8a78NN6XzwuGFeQydQM301nLvHk2ZeH14QwSEY76PiCBRue7aXk?=
 =?us-ascii?Q?6ih3k3K/PG5ZUuEP8i/delaKdpyMC4X0/XUHv/Wviy70oNDhyJ5W1ssIx/vr?=
 =?us-ascii?Q?cm4jrQj6Ir+SDZZ9jEDjWADCtUeQRGZ8NAURM9pST7tupJiqImYTBp/MDRLA?=
 =?us-ascii?Q?NEqHzzeK7pug4+5kNKWs0q0xZkFBHIQ2ao0LDn63UwheDbChzw0ol6Mn+qDu?=
 =?us-ascii?Q?zriZfR4E12lp4RzL2JVuhrlB2/ykZeL/KVtnZC6JBfXcpb3vwAIGIibOHpFq?=
 =?us-ascii?Q?1yfcIYqUfQpPsgoefiXhIjmuCUIHuwbKrZqI2h07uMg87GEtaUXroiLssBG6?=
 =?us-ascii?Q?u60GDmd/XsBi/ccz93NZo8BPMIsGhnkd+ieBDbqKXxrqqTf7lyUnT3la+SmC?=
 =?us-ascii?Q?iuStaWvj50xW0SUQoizdAqneJf92f9dL2MFMsYp3Zr9QGEOmxRheslpoOINJ?=
 =?us-ascii?Q?DQSWX8ZNdYZGOaLnwaEBVYIClpmV09Qw6g3ShHG3OhWVuutOn7U4Bhtfq3Br?=
 =?us-ascii?Q?vOoDSwi8JpXOngDHPxX9C+x3CqdYuZq0rOyHq6bS+N1r+HvegHV3ylU6e5lG?=
 =?us-ascii?Q?fQwQBB5ta9uRhutn2I6akLk7nqiO3e5cD+r5+VTnQSv90EqlFy0Rw+jwBTg7?=
 =?us-ascii?Q?y4Fp8PxkX5QGHzRo+PtLEZXug78FlOttieyoxjVYf98ZkoPTK68UkOJrXoC0?=
 =?us-ascii?Q?7WbXNYvi3TyvUtyR89IKtyf3a5hykGkJurESF27k/wPZKKb6W3ojSLTVnOwJ?=
 =?us-ascii?Q?wgrCSukuFue1rhCrBjCnW8DeTs+o3u+SBraXIMA4d2GW9zEXmL0jVYHyQcUq?=
 =?us-ascii?Q?k0HjdZZcqUgCXRBdNbzBaIz+2lmaQvfEKBiQftXUcPuMFPs23yYwapjUMnKM?=
 =?us-ascii?Q?VY03jANjB5jW3CTHndmdc7H6gLxdAxPYvqUsB8B2tTgsPEQTvdPqixYAxmLq?=
 =?us-ascii?Q?c4gTyPGCQeD8kcL+SJB4kvmD78EcVfS1E1kH9Oj3PxgTloJ2mr2EAdon8AYs?=
 =?us-ascii?Q?LzJvu15hiHtHH9va0StsOGtBXHM2morGNTOBuuVRuLgsbdNWJxUJgm3TKVCS?=
 =?us-ascii?Q?aaBzHivozS5z/MLblvBPRYN7gUOUWUw6rVXembYP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c81716-5b7d-4485-9b69-08dd0558a132
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 09:33:57.8528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IcxdcXio+A7UtFV8XC30h8j33F66twnl2jHw0aPKg1RFll5GmU2j/10hDwybhz+jhvgBv340Uzb+bdpDHzOMJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9743

This board has one Type-C port which has USB3 capability. This will
add typec nodes and enable usb3 node.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
Changes in v3:
 - no changes
Changes in v4:
 - no changes
Changes in v5:
 - correct nodes order
Changes in v6:
 - rebase to latest
Changes in v7:
 - no changes
Changes in v8:
 - no changes
Changes in v9:
 - add tunning param for usb3_phy
Changes in v10:
 - move orientation-switch from dtsi
 - rebase to latest
---
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 6086cb7fa5a0..68b2ae091279 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/usb/pd.h>
 #include "imx95.dtsi"
 
 #define FALLING_EDGE			1
@@ -308,6 +309,48 @@ i2c7_pcal6524: i2c7-gpio@22 {
 		interrupt-parent = <&gpio5>;
 		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
+
+		typec_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <0>;
+			self-powered;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					typec_con_hs: endpoint {
+						remote-endpoint = <&usb3_data_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					typec_con_ss: endpoint {
+						remote-endpoint = <&usb3_data_ss>;
+					};
+				};
+			};
+		};
+	};
 };
 
 &lpuart1 {
@@ -390,6 +433,40 @@ &sai3 {
 	status = "okay";
 };
 
+&usb3 {
+	status = "okay";
+};
+
+&usb3_dwc3 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+	status = "okay";
+
+	port {
+		usb3_data_hs: endpoint {
+			remote-endpoint = <&typec_con_hs>;
+		};
+	};
+};
+
+&usb3_phy {
+	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
+	orientation-switch;
+	status = "okay";
+
+	port {
+		usb3_data_ss: endpoint {
+			remote-endpoint = <&typec_con_ss>;
+		};
+	};
+};
+
 &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
 	pinctrl-0 = <&pinctrl_usdhc1>;
@@ -624,6 +701,12 @@ IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7		0x31e
 		>;
 	};
 
+	pinctrl_typec: typecgrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14			0x31e
+		>;
+	};
+
 	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
 		fsl,pins = <
 			IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0		0x31e
-- 
2.34.1



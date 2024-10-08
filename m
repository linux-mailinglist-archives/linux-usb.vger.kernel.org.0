Return-Path: <linux-usb+bounces-15836-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6607F993F36
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 09:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A86A1C2084E
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 07:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8747A1DED73;
	Tue,  8 Oct 2024 06:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BZEFciZP"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060.outbound.protection.outlook.com [40.107.20.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3505A1DE4D9;
	Tue,  8 Oct 2024 06:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728368814; cv=fail; b=nyQAECZavXZrWa90NUJrVI6n0WViwqnKidirtpgbCDIs2eaD5YUnL7RWGSk7pbxSffNeqZ3hNRJzd1xy5v34Ldsttg0FDNiQxWhiWLs2nINQV1DlYwhCL87ymyIJKIKhbL0bmwD2bi9vZcSeX6qLNZBur4jusr2WBR7M8TM61Vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728368814; c=relaxed/simple;
	bh=J3ys/6zHGL8eOgN7FrqJ6tgJiaTMxqlx8vXRzYTL7J4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OEK0HlwCKeBeaNsxCZLRFFZRMGnUCI8PhdGDne6OibHY43VE6OwJoJC5fN++F5WWz+O+++0YHerunkS/53dB18G4WdFO6A9M17BG8Ho2jSeucE90SMVPiQqh/LvS/6kt4zAooLvnhYI2ou6kFvCnOpLKaLLSnFlorIEP9+iMB7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BZEFciZP; arc=fail smtp.client-ip=40.107.20.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLK03X5FG4HR9Ej+8BuYqeRTjFfkDlgmTmHr6YeYwJWu6wfqzaNSXO5YteWT69MQcB3Laqqw4nvXU/zXt8MZ22cjJ6hpo1zEvDfl7Gchml+XNhJcxa1o4efXO0Kwqka41icd81rndwDCEXvF9EEEM+KdU+bGnyupKYjGJUN5Kt/kwHex5AQ1zyCVjBvOnEOoMzmySfc5zj1fBmbCrqSTzHINbSADsujcgBWHrtnBazn6iLrv9QV33jJB/xQ/pNvH4VZ2cnu8Eyk1UjiJaT5uRgi1LbNXQHwGn/IE2+S3ppXuB13JWbw5g3Xh/qPMW8otwSbSfdE7PVrNj+j5AZcyBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpG+FR6cAZZtrk30AGNerX2AGPuu7+hXCxPZ1QpoLlU=;
 b=rnZpUa6fq3KGwSa5I5ouRGudA4SR6JRcgm6roRajv7Fym6hvMaCBOaT8CN5+uASkUcuWr2MTAkt+7Vumc7npyeppVNFSzqqs7EZi4zfV+UkCnj1QmfJwZmknSyWTCnmBhhnR5X2xAPAXnyn8X7J052FT1wkffVptH0wjLyj39rRIX6Hnvx0EJIbQBZNApUYSUiN2cSKNwjwkVPV5IOAk9ZQVcsZUfz9jv+gNaL2RQGN14MdXpzLtFhkY85AItzaY/Rt0RSt9hbQOXH/96jcf7SbCrvB1wOhS+kOUXLmce16g4DdyqL1urisxLbWyrxc9tsvYrPxedknTcq+hkMs61Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SpG+FR6cAZZtrk30AGNerX2AGPuu7+hXCxPZ1QpoLlU=;
 b=BZEFciZP/ySj/9L4b8fSERmGIa5tHv96hb9qttl6zaElK4K1I6FlpQkDV0Vm2pnnO+kH9a3BPBFShAwesI7RxGCd62d0WrmiqYzXZXKINmzRcat5DFljxpExVfmxjYB/jAk+PrUHtnvgj5eIIRB4Kqix9UFMOFfwX2lJfxURFSpUpnLeAMq6GXh2npIDcemQFrXOVnJL4Q7qXXBo9kPJJkdPcaz8uKqIHXzy38jlPHReed1+ePYXF9RxH0W2PIN6M0X1+dI7pTJ9ZWk15GuHlUFNLOtsOsQ+rZ4Mr+RDkrSJieIxNZ96meGUo3ourrVJP5E7WErlmNIrPCEElh951A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB8PR04MB6956.eurprd04.prod.outlook.com (2603:10a6:10:11b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24; Tue, 8 Oct
 2024 06:26:48 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 06:26:48 +0000
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
	peter.chen@kernel.org,
	herve.codina@bootlin.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	jun.li@nxp.com
Subject: [PATCH v6 3/3] arm64: dts: imx95-19x19-evk: add typec nodes and enable usb3 node
Date: Tue,  8 Oct 2024 14:27:44 +0800
Message-Id: <20241008062744.2211539-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008062744.2211539-1-xu.yang_2@nxp.com>
References: <20241008062744.2211539-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::29)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB8PR04MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: 71f50331-9edf-42e3-45f6-08dce762306d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VRHaMEGBZa2s74Kk61Ap6JV4gr8MOgkGCKYgBwKDPa7WjXyrVBzFDjbmUL+1?=
 =?us-ascii?Q?5hFREbMs+7SmQpgDP1t7zRs9yKhsSPwSZhSdZUksTWpbtnQpsHs5YLJtLJ8A?=
 =?us-ascii?Q?93rWO5Yzj8mNcZzdQBHJjqsFSjYG6SXpcqqh8uEA3k5KaKwsY3R4Mgdexe3R?=
 =?us-ascii?Q?EoppBJWBcRtgz3L3mNXuhX0zNtWxy4Dhn23djJgoHCGaA8WLqlHuWRYSUFP8?=
 =?us-ascii?Q?uo8tcmRc7yFtDiANOIYIcibKWILFUvAufQhqGbxssw1s1GMn/VlQN7Zj+UpI?=
 =?us-ascii?Q?EOPcAymlDBi/tQxaazVoULHRj9QBE12+QuwMv3wU6U9lL9BHZP1sL7cCqzdu?=
 =?us-ascii?Q?RlNPWfJ1Zjhy1qi0Ku+6z7/L5X0yOZm9K0YfSekGFDXQhSiPYBCSdjQBTh7P?=
 =?us-ascii?Q?d4kU/kmscjLJOcaK/IkdS7fXIXkBDTkwlgoT1Yb7OVce220MsgOAroleX54r?=
 =?us-ascii?Q?xg5hxz+eoDHoy7nuwDgAG/rusSuQ5RxqLB5e+/mgOlv1W+uY5l4i0zBiBsBK?=
 =?us-ascii?Q?QNBaCf/xabx4mRy9Ecu+HyzkzxkW/xIkGSHc8kv9X6xQbTMvBszh5mMqr/9l?=
 =?us-ascii?Q?m+XS/CdruYRNKalsSyPMxPQg1SMPGF1HkjEC8fqKrvwgkcFMgXB+O7WCI/oj?=
 =?us-ascii?Q?ka/rEZ1qpzgNFk7uuYb+g3+DgDr8WUAvp5ZAR7F2rc4Ug/ph6GVnEmT7qxMQ?=
 =?us-ascii?Q?GZ5qUl7CKz5Z0zVJZ6kjFCaF7gI0iDGPsFOE0mATYcQl5LhrSU2pS62bXBvf?=
 =?us-ascii?Q?lKJ1j9uxtGFUSuvhA62FAotY+y5Xv7LslmGQ1QkglA61wzCc7dnOURmPV1rG?=
 =?us-ascii?Q?b1ontcxfpYirE4bkBZwiCKNzkENx51JT3bdp+O0Gyvp0s3xxdcNzpTUOhw2M?=
 =?us-ascii?Q?Dcum1iA7p9NAcG6dlz1PIiwvTJKqUsAwbLogDoY6lJcfNHZeOpyuT36ifbzk?=
 =?us-ascii?Q?bdx0/hSf6qVTNNrnG0V1orZbvXRdA5Zm1hORQOU+zU1suy0kpihQfajNX6Nq?=
 =?us-ascii?Q?YHQBQlU07JOs+VFRkgT5NSHW1ienTlsyl2H7y7PBjccjcm08NS/9JUkxt5WV?=
 =?us-ascii?Q?j9y7HGGoI4ZfQjipT++GQcG+1hMQPQFrHm/M4ARobj6zBUdxPBvNxxly2/tD?=
 =?us-ascii?Q?ZPYJajfHhP3Mr/XxZJIeEGBowS/y0H0FmXD/g0ofAQtg+nO3TIAYLChxKExC?=
 =?us-ascii?Q?BeOteHAtXNGDCV9SbwlK44CPhYJl1SiJkosgBiaTIFFYUapMS5q/xCzxs+ks?=
 =?us-ascii?Q?kOASOnCKNjHNQWDu4YsKb3R4cZmXxhhSDRAKyDZpx0B0ilrdqhNBDjW7Dfv4?=
 =?us-ascii?Q?pmaQJ1NSBabRplh/MuaiOKTfB4V2UUCaQt7ehA4mlAv/MlCpe1Vn0SQyCD/I?=
 =?us-ascii?Q?WGmWwTQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JKNB+NNbTWQpwLnPo0OCSx+MYn5RF2n/RyA5hrH/HPJ7ELoFTbi0Rf49oYOd?=
 =?us-ascii?Q?GIO8z8YWGutTOoDEdHac505T31OmEMsSdkUwmgbGfsa06As2fLoFGJfhPXfI?=
 =?us-ascii?Q?zLE+nKJ8GyyAoT81IsE38sYYPCkHqyNCuOBZqQRV7eZovSXhhEbUbsWJVE4a?=
 =?us-ascii?Q?OkC3/9raMM5Ruy4ZKdO+mAJnM44VbLgU3U03Hoeig47AgsjIAUWRQlYzw4YI?=
 =?us-ascii?Q?HWyIEaWqHVwo11clkaKN8+n/PqHxGgUkybyQZp2SBPcZb65ROYxu7vg/v+N5?=
 =?us-ascii?Q?qzKwWsqdITbizOOjOPebZpUhFRY+Re/vBCaRVRYFyml0+UZErGqkH2KEg4fp?=
 =?us-ascii?Q?ohxAwrtiP9Ds4bamPRDPoEMM1LY01l1RV//9u7VIDOyeC02l75nhBtD/jRV2?=
 =?us-ascii?Q?Y3f6JANQrYlhUpcnxbI2VngxVynkFfc/WPBR1lVDMXqlJBMUw5TdZQlqHXhW?=
 =?us-ascii?Q?ucsSejSh+RYfFU23fDDNAqY/6+gb8ZVu12zDfAchgTFWbtut3TvNeMtePgKx?=
 =?us-ascii?Q?3BIJNnjziuiLjnJ8T7HsruQg/+MLLG0Zz64Dz+L7/Y8H7qs3aWtzFac++Qi9?=
 =?us-ascii?Q?afzlZpCdBxgqleYJa5Dn5vAjhUEo+X6baGaumH7J/q5/zKiGoB0YIDw/BI8s?=
 =?us-ascii?Q?rvQtHF+QgLxT7rL5FgA0DGCzHm1DxZ125PCh9qYMxbVM6alvvVnd8EVmHI1L?=
 =?us-ascii?Q?rSXQoHaYWBa3QKHaFdlq9MBV7WuQD41Q9zM5/AaJBfumP/VpH2R73QcutAZ4?=
 =?us-ascii?Q?E9shc4hUhHRkNFSWOTDDIQ34lYDhoncvaH3McaKIgVzchZcq20cETRHBGELd?=
 =?us-ascii?Q?88yTwSqO06SNc92E2TnYFH/fcl2h9xBv6GB4PrbUD0p/y3HmoQioPq+gn9Qa?=
 =?us-ascii?Q?pKmJNIR0aQS+T+l4CdsnDIo171Plc1fJ1lMaqP6HCm4CKuyig1xYAR9ZC0nx?=
 =?us-ascii?Q?+IaHaWHZ/qaOr5fht4pwy7cqk3/UTeB9cgJdCPAF+ZDZYFgDb0DtPgXtXfjp?=
 =?us-ascii?Q?MD2BdI+sTLhsjudros7LSOAOHv3aW6a6aMbKP0Xp6FmkwdxSqVr477kZeCi7?=
 =?us-ascii?Q?gji9Uj//L10na4ma5M2dPG3bB0o3ctEHMOPzrwbYm/NHYG/MO087iSfvkXBy?=
 =?us-ascii?Q?B64+7rjUwHZIvo6V0vCKcI1D3eIyFjyQisO86G+ugc1S9aAYLTVsht6R1kEA?=
 =?us-ascii?Q?jiwRJ5W3F4oukZldnzOdQbxaoW4WQMsGXvWmLmb4vSIXodrKq9LQZybsc2mU?=
 =?us-ascii?Q?If3eQmySJX+vTbEeM2aTyGb1SRGlHp3mn0WGmJZZEw/0rAZqXQ0pg1OWbFGa?=
 =?us-ascii?Q?n/urC0dxPpd2rJrH5svoQe1PGS4e9n9uJ7HtEDzXxR1E9htDYnu++PQBM2Sp?=
 =?us-ascii?Q?6zqSd5EbNvZ3vErQ1dK1ab/M9KND3IHUhUTaK1Qy6H89W57hKyMbi57ij5Jd?=
 =?us-ascii?Q?Esr8pg0qTgb+PfXeFXWQv0NGlbMsDvVZcx6huaj5LLx+45VekVQpxvRPsnuH?=
 =?us-ascii?Q?6iSFMB3yWmQe8m2RvQjECGjOSxWycQAt4UBiXjV+yFT48Dnec90sLnPM1xAa?=
 =?us-ascii?Q?FtLmFWYVcGO+kYNOvKwHKp/Us6VWxSv2Qw43scmd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f50331-9edf-42e3-45f6-08dce762306d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 06:26:48.6823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YCeLENzbdAzfQpCbpNQ8jX0e3izF/dvFVxrzjfSZ3n2IcbrNsjfnoNRcTrxvDaeC4d7txXHUc9UFRIQQHqw49g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6956

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
---
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 37a1d4ca1b20..41a4ee4751ed 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/usb/pd.h>
 #include "imx95.dtsi"
 
 / {
@@ -250,6 +251,48 @@ i2c7_pcal6524: i2c7-gpio@22 {
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
@@ -332,6 +375,38 @@ &sai3 {
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
@@ -538,6 +613,12 @@ IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7		0x31e
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



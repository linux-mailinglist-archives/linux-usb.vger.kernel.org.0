Return-Path: <linux-usb+bounces-21002-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55648A434C1
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 06:40:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84A78189D37E
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 05:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE272561D9;
	Tue, 25 Feb 2025 05:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OL/YHEWN"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA412561D6;
	Tue, 25 Feb 2025 05:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740461961; cv=fail; b=jUjUC3lW09lK9ceXYUdZWXISBUiQK0DaUM+nfS+NaGxsPQxumo3VyIb/UhgParAO8f4ujklAmJdXLwJG1x8cT6M0Mh30yq6CDNCTQHBTzhQquPuTP2wVtE815/wWdAS5RmTqR+rJcF695tjSV1/dQF36IkvOdrn1Adq+E0g1EXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740461961; c=relaxed/simple;
	bh=1bYs2XkwZIaDeCrR3ref72gFnhrBM5tn08evVEygbJs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F2bn52fE8pEokJxrfG8Zt5+ptb4M8hHVibBBWxdEqXHy31k9ApGhgCLtepcj//3DtAFesIGLQwpiFmCpaAIngfqoJFNweOmAAxl5HI4NaDu72bbvcXxnwSCw9mKwcRVCXVYerMzZ+J8SPVRTH+IOS+oOOVCF2wGH973Tr1Ye0DQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OL/YHEWN; arc=fail smtp.client-ip=40.107.22.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1TrOQtKd8BfZNs06+BIC66nh203qMoI8wjg8nSGmyyAxG2obJ7RcvwQLwA5JWv94DL7uHuppywj9CFZSLhdsSyZzBQ+cM2DuP0cmF13sI83UGuZU5sO2zyRoQlRdsLgFoBqaE+SMLI46UyAKnMDtBWdPI0HfaQtbx4bfB6EbtYg8nZkqi9kIcP0bZQV0TZhd6YfGzD8F8RGFg9cB7U8FVxGTZ5aUYO7MxBy/1udgdpIfs11xMT6NV3rxnJniPmkM8+T70YfU9VaTk+v0Y95PaCPfCASAkKeSqX7gxD29E9iixJubWs14LCyPFL8ckaYAYfQhZFJILwaSVBjTsSv+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABLtjGqaIKhuhkoX78zO8JHyubwcG5up9L1MV1k4zxo=;
 b=I4PpgC4ko/oMJA2eKAJskSzdVCv/HDeOY/lDxFpil8GUqK+2tpiwMwK1AFgkZs5CCpR7E1LE4g8lJW87F9r1NZ+GO5kKAQS3meHVoM0xwQUnJwhjChqSuXfvAq1woDUuR8IbOpre9UnN7uGMTjZEuqIUse26Gykoa/hK4jmF8gFBu3jDkL/MdIumOP/G7mR/M8NJLYD9B9ShI+GVm2QiQlOM+4roQuL1C5xW3qQUZU/ux1D9MwuqMoJPUfqMCPhyKIH5qgf5e1E++K5ZZ2dleM31IqAC2zQDx9Oi0g7R2OlTzEPIC7v9G2dbrkX4ApOF3KDV/c5GTBXrCRWhO6jUIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABLtjGqaIKhuhkoX78zO8JHyubwcG5up9L1MV1k4zxo=;
 b=OL/YHEWNXaXNDPJAm+ELBd40E15LlCq+35DrTdHVENqmwAgfefWlDbY0prh4/nMv4Pwdr1Q+02ZqNP66BHE4HFZ6iluCI5Ct3k7TPD6zk4ACLKK02NPXqV+Mfe6VrUmXQYJVzqjKyEVgcfLWs1oX446VkQJXFWcPlPvTR7Q2ihD2rF8XjARvan2I4ihhhjYcAbCZD6pZRgmi+Couvc0W7hiHEuWdFf/tn5b7KjFxKJynztSG6IwsEO7G+Z4jKQSFVSDumuAEQ+IKMMCLSzgiRRcX6bgU/0DG9uXAVkdf9feyC0ik8y/7UrnNHyxoeFJZIW2T/Sz8FS9frtOYaCsObQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by VI2PR04MB10714.eurprd04.prod.outlook.com (2603:10a6:800:26d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 05:39:16 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 05:39:16 +0000
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
Subject: [PATCH v2 6/6] arm64: dts: imx95-19x19-evk: enable USB2.0 node
Date: Tue, 25 Feb 2025 13:39:55 +0800
Message-Id: <20250225053955.3781831-7-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225053955.3781831-1-xu.yang_2@nxp.com>
References: <20250225053955.3781831-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|VI2PR04MB10714:EE_
X-MS-Office365-Filtering-Correlation-Id: c2071080-203b-48f2-8121-08dd555ebe47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FdZ3YAHwdpWZqrya+pn7yxVb4sOl3rdhAHoxXfNXxgb1xGyueBW6KVDwYM5W?=
 =?us-ascii?Q?71S8tU1x3rkj37nL0lb3WAJnFepfbzMvhXvkrTdOU31xuC0VmWltuj+zWGYp?=
 =?us-ascii?Q?6ibEuzlXcacN5WgR1TiiE0g2QpOAqv6yyR4H+BwYFUeS9zQFyniYc+/kb/4K?=
 =?us-ascii?Q?GPWxrR/PPfdOH/8kqmiu8tzd/4y+ez/0eACgOeDp3QtP718Y+4RPzC5gz9J/?=
 =?us-ascii?Q?3u8RtSf4hZYmSMfrR79W93V9zmGIDgKZJntqBnAwmWY3c2Gyr3pGmzwkuTRT?=
 =?us-ascii?Q?dvrZWEsLci+cBbei8Uw9tmfOY6UlJi5yOa0T9sCpxe5q27qo72s3jrlPz6d3?=
 =?us-ascii?Q?S2XNhafy0yi2vpJmKzj13HrSfKtgmMpU9bQajfJ3lorhB5YHgQy2vjlwXq68?=
 =?us-ascii?Q?KoFJTgQE3wq/9+sPoAtAoZuh37W+wa3Qy3zeChE5VHh2H8GY0A0LDIubHdnF?=
 =?us-ascii?Q?kOjlolLO9BNwCy/9yYsdn+I2sHfTkSIGmKkIV1iOX5nog9B0uDX3bf3oi+xS?=
 =?us-ascii?Q?3Q/lzDmcLpViUL3413/1XsSoQC8UpVeX3jraWkEZUWdAM71ISscnx6JRffpT?=
 =?us-ascii?Q?HIBVQPF9HpSoBTch+IIYDPK/nYbx9WWH8GRa8MFh25CnuVp5axHXHzCymS8S?=
 =?us-ascii?Q?T5R5ELxtqARjUylKDcy3Sywl5FFNyN7mZXVUVEUdc9mwwJYL3Lwd4HXz6qNG?=
 =?us-ascii?Q?XhCjzf1vlMkkfPR4KYnxCw4dxzGcdrB5K3ztaNGfTyps/rQw5LiR8xB5wKSu?=
 =?us-ascii?Q?5zBfqsjH6Mu81497bZWaJznT5S29fpN5p782jtzPCuD2RRxpQ8mAVyOBFdQ3?=
 =?us-ascii?Q?tcn0pdcy3dnLv778oy/pEqtrEl8y5Y3/+ft48d74N+h1s/vhr6Q+qE/VkWb7?=
 =?us-ascii?Q?lt8qbbN5U/7jiew9Wjg4kD10YKjsBN4dPhnLoTjGUL0Tlg0aPxcqmiM6RZDi?=
 =?us-ascii?Q?jfHpA7mHt0RSU4Af0Nc+tjnPlW+FYJyq2+VfWYGvx5gdLyuN2mLd4+UzItE9?=
 =?us-ascii?Q?FNP7ZHLIZyQE4uKLQIml1ugDM7LMnmsgm8EUSuqxX0Xv5DdlClj5J+xjMOf4?=
 =?us-ascii?Q?ttBaHejtBv0wYV5iOC0giEP25bScqf8fYrNZAPquyT9pd7udH2x42UbmEiKt?=
 =?us-ascii?Q?nyyn2BkNjA0oQ+5bCvcbvvAR63+XU+BQacju9qbZtNpvXagtSocvudPMh8Tu?=
 =?us-ascii?Q?5BeQK5Al/bRN7qjeXYG/h8Gbnfea/rdj7ixx0A7zsbAGgXOl50/jRpjaEaGb?=
 =?us-ascii?Q?McGiXnlPYqory677/GjxfrR+shiUgG56In9ZrcSZo9ywo9EkIfXO8oJNtv48?=
 =?us-ascii?Q?+xcsdN2gEgRmu5F6/PJYjtr20TjYwSDLb/dld/Lofz90IxbcxfRG4+HM4h+p?=
 =?us-ascii?Q?VN2dnYITZcFSocXR0qFmMIaETflxYKGqLqQFx+bOrzqBQxxhN/Fvz3UmB2LC?=
 =?us-ascii?Q?JXxbYS/uJCOPvMyk3rQ3gQfvKkR488pI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V93AT63eh9wocL9w+lXz1PCIVG7j6cGKlZbLVx9XlNBpkU8wg4zbs2tc8lu0?=
 =?us-ascii?Q?+abXLUMDupXQBgVd9NM7OX+pAxotP0jUSwzmGwTBB7VUNX695q4AxqiVDiGT?=
 =?us-ascii?Q?RPydqFGkf8F0bQauMuljT0xjBDxstIULz8wJqF5FLzzSPhjZlo/3pNC3ffty?=
 =?us-ascii?Q?a2cwmjcQmGw9GGUJKQOspezpIbb/gVpcTLN3EkaWPdz7NVYPpqQHHlg4UzmI?=
 =?us-ascii?Q?I3376gAPAg5Kd9QL3JOpsYsyDtRsCBVF43COOtm9BSMH7iHZq3NXfDn+NVLx?=
 =?us-ascii?Q?c7Ca0vdBtl230hS3H5QNeNxIjrEpNhLfyyvDe+qDbDcl971OJk3WVJtGh5Xo?=
 =?us-ascii?Q?5qs89vzTyr7qWouVed8uF1TrAtXK5hebWrIsxyX7Hne8/uy/eL2kbkWguBO9?=
 =?us-ascii?Q?p8gQ07CQ8b6v1HvAcBOWn8Xptiy0GxBwBwr63yMTQEj6zn3/pjfkg+CCV+q4?=
 =?us-ascii?Q?32uWDn/gFM33PYQlpZ4+7GIIDgCaU+mes2rdHDr7efGeijM7J3Y9dp0LjNhI?=
 =?us-ascii?Q?HydQSwIT6b/01dbG6Mwnln/R0Ml9mJEaYExiBWvf6IZovYNLLpbmWtQl9psm?=
 =?us-ascii?Q?4uK/rPlkncvSL1BiHQ27gXWPm4+AJEJfqzvlSvy2vEtHNtKe4d4/JDGIxP3d?=
 =?us-ascii?Q?cTtYJ+WUwKD6kzt/yG9L48lomVByPDBu0DwPx6LMIgA8+qs8VZGRWQOAHS8z?=
 =?us-ascii?Q?AVgC6+Qo1pdr5ADL++NaiC3hFGt5w+pffFKKqAt1XnCSO0VehWgA5VC3tvym?=
 =?us-ascii?Q?u1i5ZaYppRaFTIzL8DCEbPtFBnqg9IXbAPyAXO8jLoU63Ym6gkCsgJ+X8fL6?=
 =?us-ascii?Q?1V5Gmwjfagzi0Hc1GkfewF4xUNWSmKYBW2uyTf95GcXGOk1dtb00jkfvcYje?=
 =?us-ascii?Q?bmBJqq3vWxYF0NAOAq7Cy6NgZwBZFmqED0WYTFHOFe9QE8kDIhfa3ahipJI8?=
 =?us-ascii?Q?dfsPM//DXbz54Ni4KsHzgmYoCR/+w/7QMAms3GhWzIVk39u5PziwTS3hhBR2?=
 =?us-ascii?Q?ffsv6omNOQgz5eWP9DXaqGvuRtQl6Q//xCD8JPj4O/2uWgbPhAhdqZ6t1x+b?=
 =?us-ascii?Q?LrJ26liTs4IOiZyHOAng2S31j3ed3zMFnBWCej19bFqGr/x93ioXI3Z7GDbH?=
 =?us-ascii?Q?Hx2INLRQ8mawcLdLHYfEssD2jgoN06qT2GuxIj/lyRESCkkC5GprWQBp2qkW?=
 =?us-ascii?Q?pHKW8YO/oK8UT+baBRwlCJBoNzfnJ8OrfToGx4HvYdg0qD1jNRQKlqbMYS02?=
 =?us-ascii?Q?GpwRKfj/Nd0QeVHdSfuy/94By+e1X2dyI7ehr63qOxrUHsMceHU3HgUSHKwi?=
 =?us-ascii?Q?cV9Q2FKpg6cTDzkR6yfgo6VFjEYfw8iBa4hFyos7bJRhqHWNpzSQ/pkgdniN?=
 =?us-ascii?Q?tUdMaXqh04dgXpekR5iZRHskvJHBj8BsHa3QV+bP6/fsXn2noJ9Uknxm7ly5?=
 =?us-ascii?Q?Ebqf/vY8PqOVE1GtwedbMPO00B2y9pybOZdZx5cNN+6Vqvq2OP7uJTkD1orO?=
 =?us-ascii?Q?0ymionBghENGp7HLKreJid2M04/v2ebGxOHEwmuEJCJWl3TE3NNUmHSPVKO9?=
 =?us-ascii?Q?oucI4h8wqqe6alnZhlMFEijQJqBwLpWkGqccYRPn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2071080-203b-48f2-8121-08dd555ebe47
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 05:39:16.8182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKedNX0H9fr1etgOHDRNABguZ6tUpPJT+8hY2Egc9veaHG2xF0LnN0BZa29tjAnryXryLjIhgH0UnUT8/xaFqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10714

On this board, USB2.0 is a host-only port, add vbus regulator node
and enable USB2.0 node.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - reorder regulator node
---
 .../arm64/boot/dts/freescale/imx95-19x19-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 25ac331f0318..a41d542488ed 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -145,6 +145,15 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		off-on-delay-us = <12000>;
 	};
 
+	reg_usb_vbus: regulator-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&i2c7_pcal6524 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	sound-bt-sco {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "bt-sco-audio";
@@ -461,6 +470,13 @@ &sai3 {
 	status = "okay";
 };
 
+&usb2 {
+	dr_mode = "host";
+	disable-over-current;
+	vbus-supply = <&reg_usb_vbus>;
+	status = "okay";
+};
+
 &usb3 {
 	status = "okay";
 };
-- 
2.34.1



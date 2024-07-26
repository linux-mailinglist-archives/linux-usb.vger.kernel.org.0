Return-Path: <linux-usb+bounces-12449-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC41D93D259
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2024 13:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91FFA282109
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2024 11:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC61C17B409;
	Fri, 26 Jul 2024 11:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="U7agIDPZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013017.outbound.protection.outlook.com [52.101.67.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7373A17A598;
	Fri, 26 Jul 2024 11:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721993542; cv=fail; b=KW8QHHfZDz5VhEat/uSvVvsVfSehPa2E4iihJfryk/IjhNSwiM61cXfw3OcMQrBZTwN3wyyDYyWB0eJnV03VTA6JHu8hBQXIYGT5b9WNip1f6bcmXJ5E+NUlX/TrJbksFLLCgCXrlPBagofyNw/s9qHJohtPo1c7eOhyVMi8hQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721993542; c=relaxed/simple;
	bh=nqkYbRQvxF8gyR00VpKDrj87GISzYXgFltu4UWPAUwk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E1vdMiKbqM0CJlJ6KfIVwTAm98W4/GbACN7zsXInm5Od43oEpppwP0rcROFAQaq1E2PfRxmdoDH9S7/RSn6gnil42/01eYWHbluwczc+3L4CcfdTcF1Xnc/si5iEP/qnqqxsshOVDxHDGB2Fvj635PuL0s03cou6pl92VH09YaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=U7agIDPZ; arc=fail smtp.client-ip=52.101.67.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8Tl89bR6YlcU10gWYD6SOkD6dl60TdC96SHAGqkUuZsylDCMEz5dtQXO1EL0MWT8i6LIAPRgB0WAmZS60dVWlMIqI0kbR0AGzArqwmr1uQi2TVMASivpYWTRqP361aPkeBhnsbXqb7Zsc6D3OrB5BAC97BdZYn5fvo3oWFYjmLVSv3ouVFU+EuAnlsMETcfff2XFe47M9drYErhr9xO75ibBFqdYRswCr/3AmAUyeguykRwZb7WDoB1bA7CRrE3qrZV7UB6qeXQjithyQMwo5U3xXuSdfFMVoW3skPoCWVcfvHY4xAttGK/SN26YeQR0Swkb7FV0hqdCbx7O+L7RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L93+HcyNFp4IfBYFlSv1XWUhtE3I1jgokJYwagoMASI=;
 b=cVveicep/df2KZopA8xym4X7yj16QgfNQakGKUjfbT0jmq+FFyqk/9B7ik9V9P9TPaqxYK7LgBftaA9cHN1ESnjCi46627YupVO+/IexR0yossglDag/HKK27Fgbm7o0+gOXuT9Qk0tmDYfny72E3QJZk5uUFhkA1use5wl/F1abb7q/mRW6C9x33iupGJM8omXKEH4vDRuskhiU8iIofEqOK3XbWrJVDFtc6TjUYBTxd0V2VTwjiHBv5JIMDyd2lbxdfaxY+VZyAqGMtliqqKVJ2sECKPEvdnqXSGTwpir4ez/NEl37baDFleB5rj5SrfG5YtRybnSdiNjz+VQw5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L93+HcyNFp4IfBYFlSv1XWUhtE3I1jgokJYwagoMASI=;
 b=U7agIDPZ+JdF56J/O+z2/su+/TTlph3iaqb4kcaoLyXZ+SDKd8tSS0Nr5Xp/+9311sCs1Y2X8DRiMEzvaN/JLwmI40YLqkAicMSKHjt2uRr38pbFKBcM6RXoQFfcnr8WxwAixID9Jd1IZ69AZaJzMfE14WUTZin/gwV7H8ceY8ET11K41N4STTeQ4K/bzBRUxG5B9BHUTddxLykxkUP7Jtpoux1WrC+i8ISKLqnlFSYuRToJfF2VV3coxfqakXLUzFQLdGkaaj0oc/sAJz40L5mreWGrc70HR/pu63fjgx7i5i8cIJYqE+vbvDZrgTUSa87NQFXI0KIpPPwiPG14sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA1PR04MB10889.eurprd04.prod.outlook.com (2603:10a6:102:491::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Fri, 26 Jul
 2024 11:32:17 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Fri, 26 Jul 2024
 11:32:17 +0000
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
Subject: [PATCH v2 6/6] ARM: dts: imx7ulp: add "nxp,sim" property for usbphy1
Date: Fri, 26 Jul 2024 19:32:07 +0800
Message-Id: <20240726113207.3393247-6-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240726113207.3393247-1-xu.yang_2@nxp.com>
References: <20240726113207.3393247-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA1PR04MB10889:EE_
X-MS-Office365-Filtering-Correlation-Id: cd0e85bd-fc75-46f6-9c25-08dcad669ad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M2Aloj02HuwUCsPTby2uojILXAJiPgV+BvpF6P8y2DQHCV/sMp4fzr7KFrl8?=
 =?us-ascii?Q?4BVktct1IYO4rtSc3WM0d9ErUwLoIVPWVcqaKG32Si5Vlq/6g+0FioQcmPZh?=
 =?us-ascii?Q?C6pTMIkJC6M+gwi+wjLOPPYKwhd+U+GNv+3D+R4yBWRuq8wzOr1KZ3A2w+8Z?=
 =?us-ascii?Q?SLYNPxW8LcJEUXScudWhVSeRQ9v/AgbffWkIwaEPCz59wDhfTvE1moM25SZ7?=
 =?us-ascii?Q?6VkdzR/r1W+IwfqWjnzjhMW1XiwlfFxJLKvk9xGjkhG36s7IdiyF0fDihiC/?=
 =?us-ascii?Q?M+dp3lRuLvl4ngpYLL7nWXAA4Ci1hk+Zpsq2qrBXztaX1wPjqVH5+TTno5t1?=
 =?us-ascii?Q?0yPsXGezvuRKkRdGydlYkyUonOmasdgyl1ZA8xdhYIqyKd0HWeHQQS8hwQKh?=
 =?us-ascii?Q?ojPa47/qR5TiWThVBfe4iYmzARL2rve+PAmoGBV7wN9m8nW1TwYQxpBlaC+p?=
 =?us-ascii?Q?+8s/3wAScnBDmP6I2PdLw+AcGvpWd/dPOx3V0th2xjCeezEJKHLgF6rD9yjX?=
 =?us-ascii?Q?ESpEoyuPNMNGnwMD7CDMnFQWHb3JHhoG9Jpoxiwkeed4fViUyRIaXCLlqwBV?=
 =?us-ascii?Q?gtpKfXro0/1NGHjV/KIJ+EPBtRmFjtLQ4eJkIUOTvLXly8qY24QlTcAkUzI/?=
 =?us-ascii?Q?PDsUbGgrCOUa+Qsyj7FYJzjueQMBdz8VYTPcxTIqX0usoU7J0VzD2DqGxZly?=
 =?us-ascii?Q?dRc/Oh5HkAHCDUINYzrFLCp0EwIBLpKLwyHMaeV/2La4sGEH59GCG5pPR/xT?=
 =?us-ascii?Q?es2Ci8WPRLIHsal/wFM9hn2XaSEBS/pzoB47iJ5mU0Y01m+/GxNupHZb17Vr?=
 =?us-ascii?Q?2IU0g3yU5mTHG83+wE9YiSfEdHRCDE2K/Sr4PMyA1SRnWd9drM4lnBDkO1gB?=
 =?us-ascii?Q?Ix6ShBWq71/VmBhvdFpXakgFcAmh5ycAxqI0xMCfvmuNr0PMt48HXNmeV15P?=
 =?us-ascii?Q?OtpHRRYvFf2GK3nxD2q6wEee70kRGwgVc9vSDPVYRgQ+/RnM2joSb7oAEKLY?=
 =?us-ascii?Q?yaOfcgd9iVaRGy2lfc4HhweqvwVx0HR2VBA6/aDDARLfzy4uDCboPmObEKD8?=
 =?us-ascii?Q?1hxdTX2mzQXL4ISe3LowQXosyyZkewndELH8ZbatFE9pM+JSu1QebM8K0HH0?=
 =?us-ascii?Q?YpmUAxxLgJaCJxigT+uIsq0GuQWxtF7OjMmfFCg5+4dUniz9Cq31RJDibvvM?=
 =?us-ascii?Q?MVwzCGvDvnPj0z4G41q04FqFU/YOGH5zAZjAbkXecN0USnfuXfedtrc0/f/a?=
 =?us-ascii?Q?eg2lWooNmJbTwAUJyHaVsyCy6bD9gGHvy3vUPiNraErMIrEfBlAuKu5zk2Ys?=
 =?us-ascii?Q?3xKXzwxOtF6nMFYafA1d0DrgOQPDv7D2tewckKcJbqO4L73W+mt9Z5Nh6FpM?=
 =?us-ascii?Q?EEnHwBfdaaoYTKFtsh2TljI020N92bbq7/iwRCOZWXOmGa7kUpOPNnrUxQER?=
 =?us-ascii?Q?Yms9h4sdSeU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wNKRMqDstJGNkPdzjVd0iF5epQ0uj6rIE1JWIzdjHuE6n75Hru9Ze/RThsHv?=
 =?us-ascii?Q?+9IC08VoLLNVKLF5VT18fJ3m37f99elTqJ0fDoMQV8KRVSN647PZkOhlYEjm?=
 =?us-ascii?Q?ST2fJ25bXcOq9PaYCSMKtVZ2Cb1A4OH/0G4C7aTO/LLYNL2/XulppyVPzydF?=
 =?us-ascii?Q?SWbslpqBYWHUld/VlCVpOCMjGdE1wTFwm8YwfHL3tmYhmBiQr2lPYVtHQD7/?=
 =?us-ascii?Q?K2DBC1YhXHLIR+Mcwk93tXks49OGnaA7c3h3E4ulGlW579jVSV4aoryFaNL8?=
 =?us-ascii?Q?hgwWS6EiXBjm/P/17c0Spx2P5ilWbbXsMrCjCvweFq5p1+7X1SispRi0+s3k?=
 =?us-ascii?Q?w6WlQQuDzsQtnMPzklI7gPtghD4OeJs6Fvbi8jWmP+LhOzThwMLxl7siXxQH?=
 =?us-ascii?Q?Y5LnDELxOQ2wA6kqb+HVnB8pP46DcE8ekc3BgJe4lkkQ3tfpXgn3MZtdNZxS?=
 =?us-ascii?Q?WNhAyzHg/V9HwZoiMt2o9R62AE0NOB1v82YEU8uQxi+5gLV2Y4Nm9yijY5Fv?=
 =?us-ascii?Q?8nxmvh6t9Ua4FZQhQD6bGDNldM3WpGcD7Gd3VDw4dAI2Yf61KIoTeLaU+9+9?=
 =?us-ascii?Q?LNZz/QF3XMaZpUTw+floAtEq5DgpI8hp0ns183iKh2BII+C7n0J+5R161Odk?=
 =?us-ascii?Q?vdU86LDfogC+u9IfpV+rdhXrpHW8txN81WmfTMFV2y1e9MOsLkArcHnuRNJm?=
 =?us-ascii?Q?53AUglwyuRy5A2P2fep84uftUc4zZvdIqjPvkqT7RKb3KAzFs3vOo5SXoF2b?=
 =?us-ascii?Q?Ecr4pC1EJJDdECgOgkPNY1Qwj2hpb06jX3SXIEwUG1etS595f6nvnCi54H9P?=
 =?us-ascii?Q?ZizV+s2KvwafJndV/Ail95diCLB7Q8vjK5JaYQ9U0lILcJ04oT0hzhyM1Mst?=
 =?us-ascii?Q?LooPxzpLRWLasIuJnbW0saf9QZoFs9YNn/GaQ6OyKijiKJOvNWJaav30kzqZ?=
 =?us-ascii?Q?9KNjP0lbTcd8PmyBtcXAJIPSbbJK4/tITEV9Uehultkna5gfjCNY9dBpaC+H?=
 =?us-ascii?Q?TTGCu93YO7PMTsnJqpnj6ygL7kRWEleR2bmYqLVncTnrqncVxlQp4nAIfeWl?=
 =?us-ascii?Q?RSJVua4tX6NPTYeiwvhAgegbnJXfzKZFhIytvZMRRxh8ck8REJf5pbYRWGtb?=
 =?us-ascii?Q?lnwcqwKX5HLYSXvaN1CFvuUuSRqODScL0F+iNu90z+DoPUZThfNQtLREetWL?=
 =?us-ascii?Q?N0ZM/big49woo/wZM1nP0kUg9XpbguLd7gIss2O+yv0Xa6YJ/vU1llt222jT?=
 =?us-ascii?Q?l1xkl9Z2DGkVYFck+uaVurWHjS5Im0UaEzzFQb8zJcnNYbZfcLmCft/J/vdH?=
 =?us-ascii?Q?WXOYdksssOSRdQZdLu+Gy2kK60XKJ/k22U066npb3X19vThq672vbE3Su8u+?=
 =?us-ascii?Q?pA6ignRdFUWwfvsJ76LwZCmkTy3/ds4kcNhi7S+vf2mL9knHXcsKisgPFmxI?=
 =?us-ascii?Q?hQycgO4PK8Ijt3KaXQSPyVYkLTNmbcxhfRaMyxISoreYVUl/pEOiWJCYIVkg?=
 =?us-ascii?Q?MSZx2MKvuixWRVGcIRtrSyxLObGpOzONQUukWVbypRTOMsA8T3eFCO59Z5yT?=
 =?us-ascii?Q?V37RCWohAqfRCHQjKu0MAh59ILeZ76XQRc03mMSE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0e85bd-fc75-46f6-9c25-08dcad669ad8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 11:32:17.9205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sq46o+P+zkdT7e6wDaC5GiZAV5ZkhZ5gNP1H2B/NaRr2/zOtwG3piXUuitmLtQPuDLoQLdfoLWjVOy5MIW/rwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10889

i.MX7ULP need properly set System Integration Module(SIM) module to make
usb wakeup work well. This will add a "nxp,sim" property for usbphy1.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
---
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
index ac338320ac1d..b093f2a447ae 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
@@ -214,6 +214,7 @@ usbphy1: usb-phy@40350000 {
 			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&pcc2 IMX7ULP_CLK_USB_PHY>;
 			#phy-cells = <0>;
+			nxp,sim = <&sim>;
 		};
 
 		usdhc0: mmc@40370000 {
-- 
2.34.1



Return-Path: <linux-usb+bounces-17545-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDDF9C6A54
	for <lists+linux-usb@lfdr.de>; Wed, 13 Nov 2024 09:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D242E28300E
	for <lists+linux-usb@lfdr.de>; Wed, 13 Nov 2024 08:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A28D189BAE;
	Wed, 13 Nov 2024 08:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZCs8y7M9"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2088.outbound.protection.outlook.com [40.107.249.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C33175D5D;
	Wed, 13 Nov 2024 08:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731485305; cv=fail; b=RMUmOjldkxTqm8pgPtZyrfeN2nHnNkOWEWxNDSVd7xJavwFpOnuBBq3hm+OYUeg25sD3i3T7oUuBkLKDTc6lvMLyQn+FMQMrusDlWOXzcNZxQXAJNsB+w+X+sWPxQ0QoXe4wrIv+Wl2jyrnElI2J1+r9xVsELgrb/yJNU5f7bWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731485305; c=relaxed/simple;
	bh=92zeFWsOQi9zHYsE9wdqHHmA46Sp2qTZEGNJxDNaboU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sjnqkBwHUYN2vVKGPKF6ohxUVmGCFWT49YrdYFBHJxvuIUCJUITnuEKTJUBSGcV6vrEWbmRFWPYR7tqffOzCCfHb3NCR2PxlatWD6u2zK3ez1Q3XHdTFnzY7s6lHMWld3EW9RJcQ9wNKhrQjTg0hSMkKYXNMpCMELuPfdbHE3wE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZCs8y7M9; arc=fail smtp.client-ip=40.107.249.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9tIzoJJI+0GRqXHEb3cZFODOM1ouzzdh9cPb3JYJSgrJdKxI7sqUHsT/QPCkoDJE3udyCFZDNriglhhoiRiHB2h/qrueHJ6h3YJzMu7xrgBHlH2BdP++V1wmW9gN43JWtx8dKrjAqePOc90YZiemA5/zmKQfbLL8BbM3LAtipjRiYCoZC2Lc/hNWQJAc5t14lAK8wW707Xf4KewmX9rq6++3EjWXCxLmYBRGSZHZsnvBIjt3FVEjbTgvzJ9TBVwQNbOAa1JPX+UUVutaA2kDE0RLcV75aAc6lYDl8tuXOWqrJg9rm6UsMgUAdL8irF0KTlOTVayFnKAjF85tKesWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEtsfa2IjSA4q++/5t5XEj4/uRWbf/7HrjPyqzd+aSs=;
 b=p+ZULiO1BpJBl3UkL9USP4c9y/ckKMeDYhR4sdF0ajyugZ5D3jNUGtRDw7MKSseLidmGey1WuS0cPO0wYh/On/6vCFeIHCGkG79lC63Q0J6lYln1FouzxrZ7N9yAFfSct2qelCobJNUFqvdhxNCTWrtURAwj3W+6ejMjShnBRjC130lRVSqFqOmScjOgTWPlgCyO8P040Imfk+dWCVEXu9bmFw5gx+hrOoXP7g38mVIY18KbJP5yB2dPkCTviYWCpVJjRHpUnL7SqT64pTm3KH0hfbBGPrCO8biiqYYA8RQ6uIuCVOimy7BR2GT2AE2mvw3uK7iat7c4dnWuZpRCpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEtsfa2IjSA4q++/5t5XEj4/uRWbf/7HrjPyqzd+aSs=;
 b=ZCs8y7M92K3qLwQxT845oZqrs38DJ/pLC6tbWCGs/jNLGnDDJN6ao3qtP8XVc3qJOM+CT6iAshgkk6ibTA5bWPjjHklKW03Xf7qoCFpxBhXCX9tlDpRC4L5WF0jq7km3ByNWltQU0p6hdEM+f1FDG3Q5XXzIdOWpu5HHtJq3DWD8dd3WmQtEv8nI+RX8VHW7YxVmVgZtp0O39MSR4KW6i/jEa4DGIF7GUB++7EreIbi1VncMDvDYh44byjaI6mjFAUqIFQLeb15ZzAJHp9TIKXpvn09HlP+hSoBY58SBquBpdR55DQONOYhSkluwIrQVOTh/yIO04R9rHxU6VI8KsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10928.eurprd04.prod.outlook.com (2603:10a6:800:261::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Wed, 13 Nov
 2024 08:08:21 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 08:08:21 +0000
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
	Frank.Li@nxp.com,
	jun.li@nxp.com,
	l.stach@pengutronix.de,
	aford173@gmail.com,
	hongxing.zhu@nxp.com,
	alexander.stein@ew.tq-group.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v9 3/3] arm64: dts: imx95-19x19-evk: add typec nodes and enable usb3 node
Date: Wed, 13 Nov 2024 16:07:45 +0800
Message-Id: <20241113080745.2300915-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113080745.2300915-1-xu.yang_2@nxp.com>
References: <20241113080745.2300915-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::14) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10928:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e468c74-9ce7-486a-6404-08dd03ba56c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X8zsCpaGtBiOL5bQYOwz5FF7b68Okpfiy5CDQjgkQTSDgv87w3qJVDAUq/bp?=
 =?us-ascii?Q?1mdd8mfuh9sVhvH96bi9T4Ey0Cnxmh15uM2PZFOMrG230YIJ3dRCcpScH5+I?=
 =?us-ascii?Q?FjwZSUDv9G/0tPeVkB0WASXsY7pZzHdm2aPKnARr9bxsLo56dQ5ch2vX9fMs?=
 =?us-ascii?Q?EnTEIjlXR9r+imD2tLW3WEukMRnZI6tEzQbJi4OtFZK4gu5oEhn3r/zAzgFV?=
 =?us-ascii?Q?lR4eD89aEgqblQrybwlfg+2yVOTV0CjYombuGI1R8sLax3jVI+QYz62LMZn3?=
 =?us-ascii?Q?e/h6u+6T0ydmZTRAl3QXnmj+TuVNr30xB/bQD7tgzhVzcKF3ZoTASGGsrJDG?=
 =?us-ascii?Q?tz5kaQSBu7ETYcoxRvM6rYqccjAdvqrt6eiNhL1Qy97u3JDdxETAhMDBjfnP?=
 =?us-ascii?Q?nzR9YcpKMCjyksTbFjWJVLOKwILLjJ9Rht5pOaC0KUddmvKaRTXusY34gCFx?=
 =?us-ascii?Q?Z3QxZOpgwg8QgrXGVU0NCXlYY6+wexOZORye0OLxA4f6h5f1rPuyRcknkokA?=
 =?us-ascii?Q?bCxohEJdS35nQda8ARMbdHbQCE4DuTcW+zdwhgnOwemcYJ1KSOOeCF9hhTqz?=
 =?us-ascii?Q?Y483/ZV2kfqyf5GPzII4CBWza6AUocoXJg8OqD6FCJTLS6tiuUzGroRPr3sS?=
 =?us-ascii?Q?0VCH2JwjD8Ib8pPLq2NpjlY+L8zcef9Iv+4MupoJDdkWWgFLHF9BxzrLPvYX?=
 =?us-ascii?Q?OFVFXnPmgW2yvGPEeXcEbCZUOoUwRY95yoqxw7f0Tld2mHmSJomr76w1ZqAS?=
 =?us-ascii?Q?yjr1v5Np0k3uDFI+wstaDv26PPgC0Ccg/GxO9Y7AU4312dtfu2236Yv3ib/c?=
 =?us-ascii?Q?rIC3uXrZpLafxKjDwZN6N81sq17Ux5u6ohzlwa0Pfkh9I2PLWz9O8fYAWwL1?=
 =?us-ascii?Q?ZZfqflQxBG8OIKGMhJGzz/IKX6su+nx7UVFa7tKu93axbxZ1rU2FizkIOQNE?=
 =?us-ascii?Q?5t5O/HMjshF2KBGTjjGspc1Lr/MOEBoLQOJzgEahE47fmb9Lro0bw+VUlOoC?=
 =?us-ascii?Q?p//FZrxekGL2zNpAW8FYPMqmUsQxmPYhUfgxQ4HM18IaIUepUpYGOSS8wvqd?=
 =?us-ascii?Q?MzEHeiYvqpZYa6VqC+rOoIuz2ZbfnfiSU3sUtqXK4OVkq3IL6sMKhl7OrT3H?=
 =?us-ascii?Q?Os/n0wD/tW+mJuzlnTG0ASNCJtP3C8hEIuMH5a7MkUoJTY6VKNkcXoUZt7of?=
 =?us-ascii?Q?F5n4Z6cfdRSHXdiSsEH02A4pHZ2ONLL3qRVhY/pbYEgmjG5eZ6pEspuwo5/4?=
 =?us-ascii?Q?LO/o0CiIw4IXVuCwOG24Ne6JilZeKxkSmxQ01L8H2SE5/3AelhL0twTc7YrL?=
 =?us-ascii?Q?nBn7wI8hLK19hFodNXn1FjZJFX/89omliu2LszGuWmy8MR2mVqx1nQQnlV8+?=
 =?us-ascii?Q?2Ox8j82K8Ud2whoMLTZt4DXDvxh0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fEBjphhVJ4fvX+Io/JrnY2c4WS+CFGxCVTiUSKCE1Zn4+tFNeGnQb4JSMygo?=
 =?us-ascii?Q?EaUqnDtKN9eO97WeyDK55eSEZ7e55zkl/mJ+egUh8GmHjnxtgq6arKXZsrsy?=
 =?us-ascii?Q?9znljTKfQUuWgDkyvvjEWV22OELMKvOS2hcmJaxVncRYJsAy4RopQL7QkjhV?=
 =?us-ascii?Q?bSOdRjFd1u8sQVqDASoSMrLr3E54B4qVsR03PZ8Kep3SX78LJKM1sny7P5KU?=
 =?us-ascii?Q?jNrXbslK1XSnF+UTW0b5vwzmuIdLHu7WEDdfsNStdld8xOeEd9SEJ7m0Q902?=
 =?us-ascii?Q?oDP7WZzPigld68IH2TmrYI5Y7iSk8TspaihpQkU3pcUyZ1WpvazCd5aqO2AG?=
 =?us-ascii?Q?af59n0AUKwvV+kMH2WDsWGb3/LHJZmGk92rqTf4XqPMIfGS1o+TwehjeUVcZ?=
 =?us-ascii?Q?SI2Cpdcjugct9hgR9mNplt+oN+IeB57svSfiDghf6zS3hWQFv1vUaeLpoW+P?=
 =?us-ascii?Q?pL2ryJgCMit2DqVBBKMx2IS3C4o9atx7E5lkCkemMRmyfWSoNexaurK/wVEH?=
 =?us-ascii?Q?Lr17IlEMgo7aKHNFe83clPXfVl/DyuXTCKyGUOKPTTdJDV3tXRWXXO4T1X5l?=
 =?us-ascii?Q?W9nPFfjJpUpYLVdvsGSmuqVJKzcGan+5W75oJ/dKZ2coDQ07NhErbf7SLW9Q?=
 =?us-ascii?Q?13H5znOgs6vlazqBp1TwthrkaD8z8Nc3+7U4oTyoWCytnXn4uI1KjdMvISHZ?=
 =?us-ascii?Q?DbIDigJuGvydDfSDOB3fjrMY+mqsLq7VIVRg0PjNgWYI9V/5pPhrUq72iGiM?=
 =?us-ascii?Q?2iRe6yjVIwig02kZ9PgmZcyTiX0Z0TBIRnWzAxvISEohM/g+CqRlPXYEDmox?=
 =?us-ascii?Q?Nx+hp/162eO1cch7qmORuk1zWzYPFF5fwO4hsnvXx8dhgsG/XGhdxdK1qQLy?=
 =?us-ascii?Q?Rp2X/OeDNgAktvArz+SLws+++ptUw59GOF4YMY4em63h2sg911Uoh2/wdSeO?=
 =?us-ascii?Q?f4YOx/w0fnskeFUhrGPizzrMFkkO70R9gOnewRAKQyHonC8oPA3W8BzS2ltd?=
 =?us-ascii?Q?Szzz3WDn7XrtDQv3/SlaZDKfEy8zwTDC9UctabgN8yjnVp7ISTxf0ck9fOtC?=
 =?us-ascii?Q?Ov0FuO1ht7YsnFdJR46HVW3zdvZ62qBuFn0RVdGJj+AxFdW18f4OvDvU6AMV?=
 =?us-ascii?Q?BBsR/pw3vcKWJkIRS1i2w+gftHlVGhdI6+NXk9AVW4nmuToY2FJvA0dMWQSD?=
 =?us-ascii?Q?dJmdhRr8++3PVxO0vtj3MIr/dIpiE05W3rLnjlcyHGAH85rUqqq9dJJwky6q?=
 =?us-ascii?Q?A8h0GN7yk4j3jnGqqhJbfU40ZmFjGO7m5cqckI8qQ+hNIDgAS3YUMd4IuAu3?=
 =?us-ascii?Q?MLvq1wCLo1toFO5Fse1LNAlRYwYzpN385MV7e65B7qpsgZORSlnKsUyhfPry?=
 =?us-ascii?Q?LlJ8CjAfdzGA2WK+MLFMXj0sT/NZ2TddWtLloadp/wwI1O3fLt98i+UoFFHt?=
 =?us-ascii?Q?TOklvhAeKbcp0yhJakPRQOxs+5vbvgtM1wuKM9rZ53qtA0Ndk2jlnlll07pS?=
 =?us-ascii?Q?mIV/eoI1crAmYftU8FeuYxv4uK9W7BhMt/q+80MUE/jopetybuJph2eo841E?=
 =?us-ascii?Q?h66QYIIuLu9lfNHHBPghOkZDTxrfJBV7xyKBdeCA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e468c74-9ce7-486a-6404-08dd03ba56c3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 08:08:21.3501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vqgdtuji25ePqXyrcLMJKvN6SqAWvIoZOLe5vZdYoSACyA5fTzgzPsQ17R6M/4ytVJGJ8YtOxsWS6PDKWrUkGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10928

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
---
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 37a1d4ca1b20..cd2b0a39e8c7 100644
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
@@ -332,6 +375,39 @@ &sai3 {
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
@@ -538,6 +614,12 @@ IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7		0x31e
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



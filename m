Return-Path: <linux-usb+bounces-14527-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D854496964A
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 09:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96505285B95
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 07:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C44520012B;
	Tue,  3 Sep 2024 07:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KlkXNkGJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2049.outbound.protection.outlook.com [40.107.104.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1265F1DAC77;
	Tue,  3 Sep 2024 07:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725350272; cv=fail; b=YAYzbztFLtZI3GkozCa/FG/6mQNt153t5gNBQT48W3TZNWORiXTzYmqSYAiblyKeLuCHuQ39ZPMtnuQOhMtFaV229CdFY0+ZrkTExjd/cp/9mqKiL9cd7msi/pkb0w++Lw+w6SRRejpfcbYDcfjiZrnIvWIGp6hc0r5ZJ3YPY+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725350272; c=relaxed/simple;
	bh=VCkQNB4t6bI5ldgL8HGuvZxdI/OIGKhDaoNc6N5sURE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nvulHdKSJYZ8JoTZAKCMKi3FyBrQ7LMArBENf91rP7nUGDavoc33xzo4wkODdMHLK7CYgQyCBs7SwCf9IZiAmPDqCrEdYEwd60If/nkINuEV/UAQhJNBC88rUIxzZD+6vzr34tc0TwII0T81lbl3IZaIGb8n+yxEkwIfnqFME1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KlkXNkGJ; arc=fail smtp.client-ip=40.107.104.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nryItw+6OtA1IWDO8M1Pi8KFy6lSjRuglmlti1QflEOmhZHYLZ5FhJMANBq6NbeJbJgHHtBugt0Ii6vLij8Ke42x6msa57hjdVOriyJcFU8NqU6wW3VBZdAetIhGDojEO5ylhP3p6sZapOqH8TUszu6LK3G2Jkd43z6hw97HDaXJe6DWZ/uOEIG2M7ctfrF5NK6ZL3BCLTjtfA9xC1Mt0hcMJCVYfINuQugeAunWb1DXFg5d/JdSsCbiHIb9UhK0QiFYx5qSvO28lxaAD1HKO0AifzduvcVIJXNHWAkmm86etO8A4h2eHia9mn5OeirP8ErPnKWToanq54txqQqo3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8yU/QcEUPHESfXqFXkQaDCl8y1jn8983Lg+grYEhRw=;
 b=Cs6mU2vFtLhxqcG4rJJTbKlSqXMukdJz7z4nhi5KxbqkHTRldlihiJSnXL42bEYxzxJJ0Kq3TwbKZ4lCugkb5wZxRaAg6V/pW+VYkHeFrMzBx72ZyQTpY7lAJvWQvrLJtwIdmJDwCxPQ8YN2A9PLtpixjcS69/iE1+Gh4/67VitJH7ODw/JoVWN3dHv+7mrAwriBzmyS8rQ/WnZNbv/N55UpwuEwzlxLDIAd1byCbK3ZGloxiTMc1av0LS/IXGiLllMGlgm7RDBGA4CxazwMsf6yUJAW5Pbk5n+pwpoFUulGKjPo1h/FUykJ9+qiMYVRTg0qUyCsj9mErQgygjXffg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8yU/QcEUPHESfXqFXkQaDCl8y1jn8983Lg+grYEhRw=;
 b=KlkXNkGJKsvvVlobCmIEI48XE3tE0FyLIMKLNsYh5gF4qTglq2rxxugaex0caBkIF8Y/t1VES7LAtkZZx/sqOc4ANtv5vbhJSZ+8n99lhE6roHLImwnvpxuR1h7F1hp2GV+BoMx6GqhEXDCQSlTXEYE8FjZFo/QJrqusO5D2SiDaQUDQ+CT0LxGgRXKeBhWYV5hw4hskVtOM2vEULO3+/PefZJGC1OU+Zpc334P0bnNrKGQQMExRZRbOscr01XXhmSVwlAETqFnC3Dm9U1JyJ3SiDXQcBV258RjgX/0YV2yO7JEaPFmXGYwvvXatFW9kicsdrRqa0Of/52TD0Lt+ZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA1PR04MB10652.eurprd04.prod.outlook.com (2603:10a6:102:491::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 07:57:48 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 07:57:48 +0000
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
	gregkh@linuxfoundation.org
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 2/2] ARM: dts: imx7ulp: add "nxp,sim" property for usbphy1
Date: Tue,  3 Sep 2024 15:58:10 +0800
Message-Id: <20240903075810.1196928-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903075810.1196928-1-xu.yang_2@nxp.com>
References: <20240903075810.1196928-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0195.apcprd06.prod.outlook.com (2603:1096:4:1::27)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA1PR04MB10652:EE_
X-MS-Office365-Filtering-Correlation-Id: 1377a31f-ccb6-49bc-074f-08dccbee1a34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4ozhfiYloVGXId9PMiekZxDZZz5RtTLrtHbFOR4eLMJrEInRYlK7Gpmad4BV?=
 =?us-ascii?Q?lAqFPzGiVPEcqbgU32xoTwuEmYpCqzBUhqHWpCKBE+lfgTw5EIT0yqDpK3Id?=
 =?us-ascii?Q?HjPL6MpfPwrf1n8EiyyKCEALAVa7/k1JXXVKuQJVAYc+aKByvNRcU4lEAima?=
 =?us-ascii?Q?wENxenoTsmcdPPo9ynk2Zgb7xpc24hlbpqcYO1SmxtIvONaC6gchDAIlzGGe?=
 =?us-ascii?Q?sxaMkR3TCw0+xdHSp3wY6IUTqL2Gf1hVWrIlzY5Z4RLYFFsDXB4Vsrx8enq7?=
 =?us-ascii?Q?jnD6oM8z3HGAHih4AMlC/Y5E0WwQS3iH0VbX+nvkeSgaLHjJW6ZKb88GvqP0?=
 =?us-ascii?Q?2doWVK17PRkyh4d+fBp/Ranq+D+YYp48s28sVw+mU8ifEzdQsqOiOCruvF7w?=
 =?us-ascii?Q?X5KxRHpIGdPKEl4BHYFrKck2PcA6NiwAlyO5Oo3zaGNGFE6W7V2ShFCFiqNz?=
 =?us-ascii?Q?tkKN7Ke9Zxf4cJWuJ+5L8B3RgcDbSut/wEVKi9c6S2XId290D/9QPIbH/FSn?=
 =?us-ascii?Q?f/16kDQ9Ife0Y0CyCbvWtAkqJfqwCL5tCdHFaNzfmt96C03zhhcWyLjvvDl2?=
 =?us-ascii?Q?FaCp1IrbU60Pbb00QHdKbMHM0N6p9539FlNO/YoSWEtdnv0dNSDltq/7cTtf?=
 =?us-ascii?Q?5e/bpDuFLoFwyvRmkw2Rv3ZyQ9R7Lp1vS1ekm8lGQqLfZdDTa9fmiPAKZogB?=
 =?us-ascii?Q?D3diS6V/mfDRwKpSZGdMhqMg1AaCb8HjW/KxaFvKUF4bJQ/YpALiMbw/8oGp?=
 =?us-ascii?Q?Ewsja7zvAHq+cWWefNpXwcW3PEXnnItuBP4jZ/R8LxwP4doEUGKGvI2Gg+Lg?=
 =?us-ascii?Q?Q1SLEiZVl4tbK3yGIX6os86niu6QLJH5PgqGmJm4+WyLNe/7DYxbaBkr5wOF?=
 =?us-ascii?Q?qxV5xFGNqSXjExTU32a1FfA/ZSouDL8L1mZnOeH6N0xt2K7Z020I4v387jam?=
 =?us-ascii?Q?s07kcSXeG4zzzVESjn5q5jnlbJy1TJZ4mSfvcEgQY5ck4h42cypp0CKYvmNh?=
 =?us-ascii?Q?hOwhadDApvnkdGw0agWL2WHRwRVIaG1i8dttkSs+Mm3Db7eheWdhP7CojiIZ?=
 =?us-ascii?Q?JOqiZsDp8dcOsHy8EMcBeeICg5oSDpD54HYfQRMS5aJwbae1kZjt8+uNIQ0x?=
 =?us-ascii?Q?OA+rvVoQOuOtz+BiqbE8S6woa1+gjaSrHMFfGbo4F12EHcPBFxKe3srvm1Ht?=
 =?us-ascii?Q?mGE0XUCrBdoGCm3sPIjaumnWUe2KWN7PNW1zesoppn1lYvwwc8VQcXCMv3SZ?=
 =?us-ascii?Q?vAnpQ73Q5oxPrm4cvLlfuLx/NGP+zPqw2twOw1pRtlZUGWnYOq9912jQxHTF?=
 =?us-ascii?Q?S7hx5XGA16jD2toXwysmGSmaT/F9eRG7ee6Y4L2bQrrowP/Dlbv44ONdMW9V?=
 =?us-ascii?Q?7TQcXDUnAQ8UsZ/nDlswA84lwN8PEYw9RoBuoPehkpMlW9ovaATChQsSLLG8?=
 =?us-ascii?Q?YGjU+0AHg5Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TDd9LzPdt89E1N/bq4Za2DB75SJX9pTbI8bsC0GIKWiC0Bbj+COXPlqljsgC?=
 =?us-ascii?Q?UzUCwaTQOggbNbSWWQ0ZZULWBtzWjNY0QlXPnr/D4Yf9SKS60yo+IO6RCLt8?=
 =?us-ascii?Q?zYYRqW9qOfY9HJXCfGbp2wxL2pFf9TXsshCc6LDm63bshAqU7hJn2aqm5Qop?=
 =?us-ascii?Q?1fb/v+AQMI6LpfP700d2hrEV1PJoZIjij1NkzHJ1wFV4yA/ntprL4ITa/HEG?=
 =?us-ascii?Q?a/zxarUHKHnIdANR8Gd1jIdaHQYUboYfSsWLB+eQeNkmENJM9h5YheiahCCN?=
 =?us-ascii?Q?9fxSP4eUIoveOt/7F1mUy12ih7RZG7zPSIMILqP+gB4Gm9xQaHq1EdKQlYFl?=
 =?us-ascii?Q?6VpTlt4D6edV401vRYsVWnvqMmUPvjVFm77xh98ppoB519yJUjGqZElXfxEo?=
 =?us-ascii?Q?Aqn6P/z9HVLHeny8Qo83f0f4vVTVaEdcaEdSJZG7c3Pei1dfmls1w46nnzK2?=
 =?us-ascii?Q?1QcZcVKyahsNDXfELi8U/tB1SNsNkWIr/Sr8DXsqpr3d7rsGqIt+1AK90jlY?=
 =?us-ascii?Q?xyJrO+L8JtVz/wWuNmTjboqfGO0XK45uDlcBrp+qf1TZN/KvyPcl2D6lmYp6?=
 =?us-ascii?Q?7n+xnb2Z32yOIL59xy7fR7e7RsySwe5ysEfMkvW/N6rcD2/PK+t0nmvIkNK8?=
 =?us-ascii?Q?3SfxqppJNcmY8OePE2euojT2Pivg6adzEQSRLL3wsierlqTE3/ujKFADe3If?=
 =?us-ascii?Q?cwMj6cJjdyNgqGvZzF9HsTixflBeoytkB5dZi+VnOirX+CzxN1LWqA67lNgv?=
 =?us-ascii?Q?3owGpcSA6szV6iK0xF0IDY+zvVOQom49BH2PWgIiYBIpwJ15Zpo8NvqEUPr7?=
 =?us-ascii?Q?+lC4DMWtZenShLgN4eA+TH27OHM1uRvnAkekjL5S3dExM1TM7NaCkSKykMKy?=
 =?us-ascii?Q?frP1KiCGtmBFbFOJYDHethaxg1h4gva9JNs4CCVdA7LbZrnjGsuwYEJu7CN9?=
 =?us-ascii?Q?yTX7T/nsTVX91Ix8PL3HSejS/sbjEZ80WL4EUpaxgYPelm4BvtOBXAsnXkqR?=
 =?us-ascii?Q?YdjhdhLD0ZDU5lcGZ8e5iImCI+TioKZYkRU/gAsWvi93vK3eIsrcDFVND91G?=
 =?us-ascii?Q?qcSo6X56imaCPsiB7UXrhZe18h3gZQmadXkw+qF6Lvbc66mlUSD15aC+lX8v?=
 =?us-ascii?Q?fCrMLYP1vbDBswTNSSRrfUa2S4TMQaOtz6pll+Rs74+BeAg8A7R6ewnw3rta?=
 =?us-ascii?Q?4bXXzFmVAKnYy/k77KJLsJ97PcEBKlT4+tTVzLn/1gyeeG0eEMeFCoJ7sQ6I?=
 =?us-ascii?Q?KZg9wI5+j3Cv7Zf1rKbuyNI7f3Hhf3Z6A81t35gv4drIzJymjaGP2mvpT3Zn?=
 =?us-ascii?Q?+LhE4X35G6d4RjDhTZvQcPbx5/YoLeZDwOqf8UrTJandSCClJPtUVLlHFXyr?=
 =?us-ascii?Q?eofXXzt6InYDEQz1ChMr9KFW+n7SXGES9cTpfQWZGAMXpiuPGs3fKIVp4qLX?=
 =?us-ascii?Q?0zC0qkWtbAJUMqp+Q6Cx2Wn5EM3dw9WqPFo66nU9UBNm7UicjPMwPj/qrnj8?=
 =?us-ascii?Q?5rUeyZdDUMsvzohANkQhjsdC2RdoRnEUE/L0q8NFollpJU93SUmryTO4ao0i?=
 =?us-ascii?Q?YvVjNMcXySKy5ijzWL6M80ilueqfbwjUxha//YB0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1377a31f-ccb6-49bc-074f-08dccbee1a34
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 07:57:48.5067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQjJBDQm8m0yReut+El1fK5KTuvxoA6NFjE90d0qvhvEHFv66sAP3yvEwJFjiXamywvjzwt9wEthei1mBxX9pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10652

i.MX7ULP need properly set System Integration Module(SIM) module to make
usb wakeup work well. This will add a "nxp,sim" property for usbphy1.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
Changes in v3:
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



Return-Path: <linux-usb+bounces-21849-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5653CA67750
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 16:11:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40C4A1897088
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 15:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75B520E6F1;
	Tue, 18 Mar 2025 15:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BIj7/YMm"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2089.outbound.protection.outlook.com [40.107.247.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F8420E021;
	Tue, 18 Mar 2025 15:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742310487; cv=fail; b=KPwkBVMWiJ9TLewy4NazI9agLYRFTRKIOdHMwUUb7i30z6uuDrnoEmSoOly12RIi4OKKuj5lKbvvCgMWu287ypFAxMsVbkxUKq3QM36w1++MWfkkrYevQJ57UCNoZjA2EX0ABeV5enOKTSrK0LdA5uliCQzH5LPjrvFtmYdiYHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742310487; c=relaxed/simple;
	bh=pEgFMUGd+NPA5jmxHScz8PX5fanc+vGyZWWFxdmyOWM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LbnhdhxuQgkvKWmrRzCkFfISJAD/kxBSFR/LLRjLyGIipg+ALfvVdcKxvJWaIZ6KPaj/Ez/ymFkQFa31X7gp/jPSFkmQzFsfVc2zsJSPAdRkyzEWi9jMzIOCTgw3U7QDT0U3YmMU86Rh9xEYUnOAKNxkYW3ZsMF7xp9Vh53UAZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BIj7/YMm; arc=fail smtp.client-ip=40.107.247.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fh8LG2npGGXmCrilgao6EmYGK7Nxp/Khm44UZXzXlxLmwMJgjtb58ZfdNSSKFBccCTWJ/jGhYIUbNv6WrrpLGWCSGWMOIOkx3D2Kjp5Z5Tdv8+MH/yviIG0KRSZNAW7bAJt89UY/gLh0j4DzLcFitmdotMNJBWqkRV46Tr2hcSQiJEtEmYrgeaWyZnlTMFtKegtdFXCM88qg2lT7FIn+O43niHbjCFlEHsAuT1oYyvA88X90+SmWbw7TtpG9/Nx0lHhS5sUii9ZgN/8h45NlDPg8ReBY93JXao8tLfTNFFJfDZcW4Zan7lGjZM2BuwcS0D1+zi+ZveBhl4XqISbXFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqWR/Z/phbw+RtIIESiaAzjtRT0go8yHKXxyvSpwroQ=;
 b=m9NopYdHd0WVCy8/8p4RsBkd1w/eun5iiIJVNtmzQyQGQYYBOGM7GO26kUqe3Z/fd0dS45H24jaqKCvVYtDuuJHNu1dDliUS2AtG4uC5GA5VgVrWcFSGMwEk1Vt/C3hveaYBycdmjnsns7/C9oXSe6CmF0S+5Oz2cazLhVov6JrQsLmc1o78g5u2H8BolvJQIY3RtWsZWHJi7Sdmek8toLWMqqh7t3+Ee4lK48uyczj7xQPn7U1IfYfE8Nu0XNf5znwMr7+WnDP/WRyo7KRKRPlXrOwjWEMzb98CQmfSJkIOXQsnEQcKEIqii+21aiPP4HfzNDNPfb6GenxAL2M0fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqWR/Z/phbw+RtIIESiaAzjtRT0go8yHKXxyvSpwroQ=;
 b=BIj7/YMm+qiRmT9WucQqKGYO9+w0WHQ7WKfqOvm3mvTa/uhT0XAucC5HWCCzNx9X0o2zHShgITklGbibAkePCDMoh4ooie63yktHM82FeATEM+CUn2tbaabZw+vOdgQHiccQG78Y2C4Hez2vO9ubnh8gdq9gl8hsQVRJ7V66c1KBZSc9mkVMBw0JaFEFx8LAiU8FS09UCu9AFNcve1hLWz38BAFLRVqrseiWjNxlEjYXurNhl/ssoPQYQ6RGCgQOlU0MphiGSJm3GwGos55NdOyho3uD3s9i7hPn+ZmCl7dsKnb8E64APjSDfA2zC6+mBuKTaBOu1Z++rs88W6vruQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU4PR04MB10598.eurprd04.prod.outlook.com (2603:10a6:10:580::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 15:07:59 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%7]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 15:07:59 +0000
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
Subject: [PATCH v6 4/4] usb: chipidea: imx: add HSIO Block Control wakeup setting
Date: Tue, 18 Mar 2025 23:09:08 +0800
Message-Id: <20250318150908.1583652-4-xu.yang_2@nxp.com>
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
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU4PR04MB10598:EE_
X-MS-Office365-Filtering-Correlation-Id: 10f98942-5660-4b47-4aed-08dd662eab7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DuthZJcnUVOB47JTsI7bixzAmSM121e3cV80GbsRYaGrI8P6IlyNpRNx+KUR?=
 =?us-ascii?Q?S5erVZk53Tl1nYYEMK9+ashWF7Ca/V7/t28W93R0egU212yPNGCqNTbRkKg+?=
 =?us-ascii?Q?4E/NsceVPLkb71YO6P5V2WH15NDqEw72bYsBk7LQKIZ1UpyNFb5chDJmZ2/2?=
 =?us-ascii?Q?87thQlKtYWftgfov0Nco15dgb5t/jBTSZs9GiDrqYDHIUHr2yf8fIScwFNtD?=
 =?us-ascii?Q?IwSx3EDeOLwzmhbKdDbwPf+MXAzYoKoU8lixtsvrdur8q/r2E9fXbxIJ4dNb?=
 =?us-ascii?Q?Q5qUX6aE9lyanAfWcWZq/rkHCODDzDV1bzDI1tJv48JxtpDc3Czx3RyjIv/N?=
 =?us-ascii?Q?Fdjlcwmug++iT0k7tAlAsYeGI6c0jgbu5cTz8j74LdarQNZx4Kh+Y4OBO/1q?=
 =?us-ascii?Q?iYKeSja1vXOYfPRN1IZxvJutEhIvVTkLOZ5UVkjvMHjX/Loj2aqv9O/uPrvn?=
 =?us-ascii?Q?Bs4NjPrAUShZ+7I/lCv1Ngsdu8RzZegMSELWXHLY2OTzS8iUudCVA9MqMrzi?=
 =?us-ascii?Q?Ma/4xO9qqX6CmZnSpRF4sHT8JE/K8rMd+pw3v5BU99jIZmIQyoPKjgoBuqGB?=
 =?us-ascii?Q?y5SK4Xz86CUlJ7AEMFYRjeCdKa64XqeWljjQunw7K1MYB8/dWErNm5KnzTPC?=
 =?us-ascii?Q?R+bc03+gIEsCPoj5W8oa7Ep6Ct/1ibVKmiQXOblcY8KKzG6MPhqPnaritT0W?=
 =?us-ascii?Q?ICC90YGodykS37CZMubJKM0VczJeBOVTcgy9J+umEBA1QiccK6v/PqNVIE4X?=
 =?us-ascii?Q?gp7zjfLftBJkvKkO5MattWQEsXPbzZGxy8SdPq2XTdFQqb6oNY/fLw7xs/iJ?=
 =?us-ascii?Q?WpguyHmQ5uxvI3j10pzgkf4EPMzcqopahmWWvNJXtXjWC6+9HF5WhpF0iFCO?=
 =?us-ascii?Q?XxOXdGY1L2wRD41OMEV4l6sTfwyws2X4Zn+cFcKfy/Ggz8tCEHJ11zH9c1Np?=
 =?us-ascii?Q?/rPemhtGhGTtGHLsXtP3wedjSh+DmbdautkaZejBycDJrnokIUyIaIMRDrd8?=
 =?us-ascii?Q?R9PdjF38tonCW7ohARkC6rmjypaTifnE/tU9hVR+CKvVZU4pjqmMi/c5VU11?=
 =?us-ascii?Q?8KiBW4ZfED4X59Un52DW62Lu0KrhWC7OvQhvZ0wj4YSUHvOEl5yNuajaQeqT?=
 =?us-ascii?Q?fFBDT3a0ghisrsBfKxrvmEOydetjXmN4JoKlQRgODWFq187+rpiRFelgRx1r?=
 =?us-ascii?Q?dQGwOXZ2TpbRiZnRq7lhkAA+An6KIUdfMDn40kDYYQZgT0k/+4sZOKBggLVm?=
 =?us-ascii?Q?1I8SU5BFyfmMsNzlgJ2mtIMgt0v1cwxd4X4D5ZTinm23VQDICUAaccauOMaf?=
 =?us-ascii?Q?q2EuaLIubjL7KQVEQ5MuwOne5NyYdHMGxQRe6SVkJFfXw3tJ0hK3YQaPQsmz?=
 =?us-ascii?Q?WbZMqIz7koRm+eLYDxbxzD0h9rmAO9/7WEXaRVmXRSwKVbtCR+z0SipmS0Nt?=
 =?us-ascii?Q?fwh6/cDo1DHVkl9Bg/C3kmrBZ5qjKz/7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cplZZxarEk/8YK995vnbBRd9Ju/4jCxcCShvGcY9aH+ZmNZCH3Hh6JCayqaz?=
 =?us-ascii?Q?nNRRpSTMDBFZItYZDgDMexeMr2AHKsYxRarG+a1JOqfObyhttHxc+RElWziO?=
 =?us-ascii?Q?KhvTk3tPPyJqKLkceGWtticTePSRDwcZ+036aaHKfMELavhJjvkXyfIu6mo/?=
 =?us-ascii?Q?kfoMCT5uVPI9I2F+bMvdcx2Q6zHyruPFJz1rvyKufuxbZUPA8AEO5WEGbQjX?=
 =?us-ascii?Q?FpZ3p9LuSLfuvA0eGu2x3x8X6e2XwtqgqG/2W+Cti7huSmP/3MO1SpN5D9+1?=
 =?us-ascii?Q?7i0yzCH4CZO4bXqYRF9N63hCVd4fxFCR0DXa+erA0dDhxOj6/0KoYSt+TbCe?=
 =?us-ascii?Q?OGmnKO8tKpRl8Q3Pe5I4MVCoLkBumQLQruOpm7+f143aMDd+P4byt6O33lfm?=
 =?us-ascii?Q?5CkVpIaMgWhw7hOEZKeyiks4UXIyOeBpCFQYjFvHHk1wN9zInmmoUJced2cY?=
 =?us-ascii?Q?fHhJMF6xMgSiACTf0La8GuqhMxmrC6tjOHaxeBml4HCWEY26Y6FWAenh2po0?=
 =?us-ascii?Q?+JvKluVpfmmgrJBh4dzG8RbvuccvAmku/pYBi/bABK95C995wDnXUTotIeQg?=
 =?us-ascii?Q?0dL5PQp2lAGB8iC6YybsjYEmbqhw9ExaSrg2bfeg15jAy4tFhatdfKzifmt3?=
 =?us-ascii?Q?/Mw3HaRArTB8fsY+jInXUGexFAy7GprkC/oglgOd9MHUQFliZA/aGGVuY4I4?=
 =?us-ascii?Q?HnmmhkS10rucVXHWzRE1dEEsUmv8JVbHH1ro2xz+80V2JOcudRKm0Park5tq?=
 =?us-ascii?Q?vYucL+y4zw5l/2No5SgvGIe9+2qa4JlN+t02verEpe+b1XjlpPRy/Q1MGBmi?=
 =?us-ascii?Q?ubi2pnPkvikzdS6gy66F0NJ56kudLn6uNW7ml1RZ4TcvcbjxWQC6a2N/sYmC?=
 =?us-ascii?Q?kgjxbczw8dpc4448nD4EQXiWX+vN2xSGwn0ZcI34MoxvwGKHv/36TvMmO2Vr?=
 =?us-ascii?Q?yRNV6zom5jV8YWcuOvofHDxCkl3g+iZe2LlSl8nUv+ghCF0qPqLf52HU9NWJ?=
 =?us-ascii?Q?Ke8b89pOXlv8GvnUWzu9yZUmqM4mzb1fh/Nck2Xs6dRgUurt/Amnve3N5SOX?=
 =?us-ascii?Q?zmeljMAyXF5sopwqKmW3dl7F3JJEZNYT1wzgiJIiKibi47sTqkueB2bAdp9C?=
 =?us-ascii?Q?nToV6ppV6o03h4OoJp9EofavDwxY07IFNvnP2sbYrICWVGKuJeDerk/E43jh?=
 =?us-ascii?Q?7J+f5TIv+eTFVI9oZ6knH8qYZQzqPcXwXhhxX/3fxXUALYT+FS9GSJxRK+hY?=
 =?us-ascii?Q?2IWKXnH/usrcpnY5y1ZNbwwTkb3B75Gdc2pQ372E8oDdjRQ8KX94l6ZdYMHr?=
 =?us-ascii?Q?SgxC8Pr1L2+X7LVj0Kn28nUJQU/D9Ye8FTwxkpBgSe9/1DF4SaiXLk9I9m2a?=
 =?us-ascii?Q?SYLe3BYNNfP7DIgbeDc+ce9d1xbjKGgSbabX7mnJXO1X2W4mSLx4at7vw4Z5?=
 =?us-ascii?Q?ejLV0Af7Hzt87Bna0LSj7iRCv0ZBoWNgXFkcTh4uCy83HqbosA+ag+sJY/sR?=
 =?us-ascii?Q?25DL9Gb/UtHSVkSCc+vItXy4mtnT2rtFy4xBebF2mzb5u6zqSCwJOYaTtCAy?=
 =?us-ascii?Q?qSfnSUL2oeEX5xpcxRa7S17/n51ZNnVWStn/d+iK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f98942-5660-4b47-4aed-08dd662eab7e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 15:07:59.0200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8LWbmWptgVFmGtU3c4w408NXEBB5k66JvTzwKeAuKd5budRdlaFp4AGiXXmZalPpiP14sfD5RtcT+hQL6xfSGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10598

On i.MX95 platform, USB wakeup setting is controlled by HSIO Block
Control:

HSIO Block Control Overview:
- The HSIO block control include configuration and status registers that
  provide miscellaneous top-level controls for clocking, beat limiter
  enables, wakeup signal enables and interrupt status for the PCIe and USB
  interfaces.

The wakeup function of HSIO blkctl is basically same as non-core, except
improvements about power lost cases. This will add the wakeup setting for
HSIO blkctl on i.MX95. It will firstly ioremap hsio blkctl memory, then do
wakeup setting as needs.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Jun Li <jun.li@nxp.com>
Acked-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v6:
 - no changes
Changes in v5:
 - add Ab tag
Changes in v4:
 - add blkctl NULL checking
 - warning if no blkctl reg provided for imx95
Changes in v3:
 - remove usbmisc_imx95_init(), use usbmisc_imx7d_init()
Changes in v2:
 - add Rb tag
---
 drivers/usb/chipidea/usbmisc_imx.c | 77 ++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 6243d8005f5d..118b9a68496b 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -139,6 +139,22 @@
 #define MX6_USB_OTG_WAKEUP_BITS (MX6_BM_WAKEUP_ENABLE | MX6_BM_VBUS_WAKEUP | \
 				 MX6_BM_ID_WAKEUP | MX6SX_BM_DPDM_WAKEUP_EN)
 
+/*
+ * HSIO Block Control Register
+ */
+
+#define BLKCTL_USB_WAKEUP_CTRL		0x0
+#define BLKCTL_OTG_WAKE_ENABLE		BIT(31)
+#define BLKCTL_OTG_VBUS_SESSVALID	BIT(4)
+#define BLKCTL_OTG_ID_WAKEUP_EN		BIT(2)
+#define BLKCTL_OTG_VBUS_WAKEUP_EN	BIT(1)
+#define BLKCTL_OTG_DPDM_WAKEUP_EN	BIT(0)
+
+#define BLKCTL_WAKEUP_SOURCE		(BLKCTL_OTG_WAKE_ENABLE	   | \
+					 BLKCTL_OTG_ID_WAKEUP_EN   | \
+					 BLKCTL_OTG_VBUS_WAKEUP_EN | \
+					 BLKCTL_OTG_DPDM_WAKEUP_EN)
+
 struct usbmisc_ops {
 	/* It's called once when probe a usb device */
 	int (*init)(struct imx_usbmisc_data *data);
@@ -159,6 +175,7 @@ struct usbmisc_ops {
 
 struct imx_usbmisc {
 	void __iomem *base;
+	void __iomem *blkctl;
 	spinlock_t lock;
 	const struct usbmisc_ops *ops;
 };
@@ -1016,6 +1033,44 @@ static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
 		return 0;
 }
 
+static u32 usbmisc_blkctl_wakeup_setting(struct imx_usbmisc_data *data)
+{
+	u32 wakeup_setting = BLKCTL_WAKEUP_SOURCE;
+
+	if (data->ext_id || data->available_role != USB_DR_MODE_OTG)
+		wakeup_setting &= ~BLKCTL_OTG_ID_WAKEUP_EN;
+
+	if (data->ext_vbus || data->available_role == USB_DR_MODE_HOST)
+		wakeup_setting &= ~BLKCTL_OTG_VBUS_WAKEUP_EN;
+
+	/* Select session valid as VBUS wakeup source */
+	wakeup_setting |= BLKCTL_OTG_VBUS_SESSVALID;
+
+	return wakeup_setting;
+}
+
+static int usbmisc_imx95_set_wakeup(struct imx_usbmisc_data *data, bool enabled)
+{
+	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
+	unsigned long flags;
+	u32 val;
+
+	if (!usbmisc->blkctl)
+		return 0;
+
+	spin_lock_irqsave(&usbmisc->lock, flags);
+	val = readl(usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
+	val &= ~BLKCTL_WAKEUP_SOURCE;
+
+	if (enabled)
+		val |= usbmisc_blkctl_wakeup_setting(data);
+
+	writel(val, usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+
+	return 0;
+}
+
 static const struct usbmisc_ops imx25_usbmisc_ops = {
 	.init = usbmisc_imx25_init,
 	.post = usbmisc_imx25_post,
@@ -1068,6 +1123,14 @@ static const struct usbmisc_ops imx7ulp_usbmisc_ops = {
 	.power_lost_check = usbmisc_imx7d_power_lost_check,
 };
 
+static const struct usbmisc_ops imx95_usbmisc_ops = {
+	.init = usbmisc_imx7d_init,
+	.set_wakeup = usbmisc_imx95_set_wakeup,
+	.charger_detection = imx7d_charger_detection,
+	.power_lost_check = usbmisc_imx7d_power_lost_check,
+	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
+};
+
 static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
 {
 	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
@@ -1289,6 +1352,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
 		.compatible = "fsl,imx8ulp-usbmisc",
 		.data = &imx7ulp_usbmisc_ops,
 	},
+	{
+		.compatible = "fsl,imx95-usbmisc",
+		.data = &imx95_usbmisc_ops,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
@@ -1296,6 +1363,7 @@ MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
 static int usbmisc_imx_probe(struct platform_device *pdev)
 {
 	struct imx_usbmisc *data;
+	struct resource *res;
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -1307,6 +1375,15 @@ static int usbmisc_imx_probe(struct platform_device *pdev)
 	if (IS_ERR(data->base))
 		return PTR_ERR(data->base);
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (res) {
+		data->blkctl = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(data->blkctl))
+			return PTR_ERR(data->blkctl);
+	} else if (device_is_compatible(&pdev->dev, "fsl,imx95-usbmisc")) {
+		dev_warn(&pdev->dev, "wakeup setting is missing\n");
+	}
+
 	data->ops = of_device_get_match_data(&pdev->dev);
 	platform_set_drvdata(pdev, data);
 
-- 
2.34.1



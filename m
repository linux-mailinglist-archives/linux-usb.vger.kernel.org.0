Return-Path: <linux-usb+bounces-17100-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4709BC888
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 10:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 913521C22517
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 09:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F5B1C2450;
	Tue,  5 Nov 2024 09:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="J6jpxHLq"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2065.outbound.protection.outlook.com [40.107.241.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAD64317C
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 09:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730797313; cv=fail; b=GQ7pb0RFm1ZpaVHF5PFBTFmA5ljIxRRHW3KTFCFVsbwGtJZPbTi9u/9Yv7hD1GhGxw9OLDPr1z3BQT8FRU1fZrSSwtY23fvKVyv8R3OL1X9UJOd32swdS2eoA5XZhNzzX5htSZMeRJjJyO73a/ploN5cFT6ZPd/2qI4XesZy8uo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730797313; c=relaxed/simple;
	bh=UGmH2yX4kvuHHJUBLEpYB0wr6DgX4Yo58QRpfTOcLjg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=AEGr5JHepTkF2u/lgAW2JnF8tTrh24Q6V2VopD6GbkDaL7O6ioJ/7kBFyVbHA95sWQKYQs8a9MprGSMIfI3LJgvQt4Xm1wGiKzQdX8LsP1Zd42V0ZTR0xVv+DSVyBg5Ir007TH6Vge5zXaGehQD0o4wh2bPMFopMHRpknkbmwI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=J6jpxHLq; arc=fail smtp.client-ip=40.107.241.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z12FYAkfYjbceq1GB5e4Y7qTnPXCpwM+Wm1gwbBI06LXq+zmens0XDKVTCQaKv/3ee76TpDJvHXbpXQLsGZ2qvxuVTXF99d8qBU+vASLCTMU3QBuywl9UCzuc84/2t7gqg/6mzUf6t1DhCH6ZW+P4N68xsoIccNNHlNSVJZdtm7KcPj5qP1VBlmwiKn9vfbf445YpKc9qp1ACnehrJFxJbJ2cC6MFn2xLA+ui2u0xrcYAQsK52MHXcbFfXUFSlCuQmaYOD3wJ7JwczYClWzQGsk+KcwFvcZCnwVGOfixbiRcXGGfVOTee4Xwzz0/ll+bMZ5EIgnSLGMbkSQcEwohvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSiMlCAJbCT4PEMIiv6FoMzcaRq+jQ84sgFwYXe6BFo=;
 b=d3hYI5bRfmTd1tSWReUZlpXSUEDLXZdutXEjszAqOLVT+8xff5chpB6P8WhB1StAtmjfG2s6DUcgPvosDhucVCWhRQnx0Ix+wH9IgNVc9sxm52ducL2W1audUwovw9WBCL4AT8A3sLY9oubaT9SB2fpJbS/Ztf5ob1cDAMg1EjRN3f6zaqScAkoNRfXXn1gWKXmMqufH6M3kLYDZSqjGTLuiIzxRYOSlcGujIZFA3skg0CjADswJYsCke6/p6Y0Hg2KZbJkL84hWO0Ka4zuUT7Lwn05zkFrfDT49wikwSNW0g852zaWoZUL3FblIFTEQi6Ih1PGYAcVLupeTEVEGLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSiMlCAJbCT4PEMIiv6FoMzcaRq+jQ84sgFwYXe6BFo=;
 b=J6jpxHLqrykeA6YzNH0rttETRvXXfClE8l81pDVXmdGoSA1FWhJA64vf0McSZwdEKFyiCWAiQdwkNHsKABjH+SeqkYVDDJKpwv/u/EH7Ei5atUMEVK6+trxH82T3VyEfazYeylQ6UTNse5Ep5Sr7tAR9Tz+LyIBEEfcbhKYNrYxkule7K2NEqWHMUClp+FYyQH43kC9I1i2aJks3+ULGbZpLMcn/PR8enLnOLyCDdpiLCs9LcWWSqIcxuCeCXE1zT11HeikYajXv6hEPRHAJk6+45V003pYqd5nw+VQc43aW61ZxGxpgVnHnDSKDBp1k5ppVGMh9pZw4xRTibBp/oQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS5PR04MB9876.eurprd04.prod.outlook.com (2603:10a6:20b:678::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 09:01:47 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 09:01:47 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	niko.mauno@vaisala.com,
	dvyukov@google.com,
	stanley_chang@realtek.com,
	andreyknvl@gmail.com,
	tj@kernel.org,
	viro@zeniv.linux.org.uk
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH] usb: core: hcd: only check primary hcd skip_phy_initialization
Date: Tue,  5 Nov 2024 17:01:20 +0800
Message-Id: <20241105090120.2438366-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0163.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS5PR04MB9876:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b0266f7-9484-44a5-817a-08dcfd787a61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qWU7+XNRS5BsqisI9BluhdaVGgJdiIIn2wCyPALFQr/dyzKmkjoc5Z897Kdq?=
 =?us-ascii?Q?gnopdtjIm2G0+qnsT0TdnZC/WTEDv1Rze1YG5l1GmX/vaWQu24K43kEzfC2G?=
 =?us-ascii?Q?DNC9zDJgV26aK/OpCrcCoSPXk1L4C0hhgjPDRCDJ0MvPgNoHXQptV7xkHQ3s?=
 =?us-ascii?Q?0HEf+nS6vY9B3QnjdqBOqs8gBGY7eMuy+jIXwXSiTbXpif7yBln76STgdBls?=
 =?us-ascii?Q?9590XEuaSilSeXw8trBkuUHSwhHqGaQPdsAh06ZOxwZK01hgimMFjAtQEnqR?=
 =?us-ascii?Q?Ouxa4/T4urIgnY6yq6A0rS6Wi4EGa4XYQUkFkVMck6hkJxQal7CXu4P416KQ?=
 =?us-ascii?Q?JLU37kA/aLPFQBVki3p5V831wJVeDhBzjrXi3ZpjzF6r7OnVVPfwI4Fu19/v?=
 =?us-ascii?Q?jz7I9W1lYy5QYgLLGReioI0JZvHv8fNXbKkpkJSem/ZcKMNriJt9OXwxoAIf?=
 =?us-ascii?Q?NFhPu+lieWLNgc/yuIHzdutW6wt9T8pV/c1pm0zHxuaNPUUfboa98O6WsX55?=
 =?us-ascii?Q?OdKQ/Kc2nSBnguD24hKkoln57ra7XyiwI2bqRf+e+syO8oDuzUtD2JvjToxl?=
 =?us-ascii?Q?Wr+HLKQoqnpeSh1HtU54Lt2aOIB2IMd8y90QiPUMuBpg6889TwBLfKEeBJAL?=
 =?us-ascii?Q?npkze3gjId44HLtRQfTgZ5n03XNZiVSzy0PF7+AsGT8VwdZ8sdBZHviz4MA3?=
 =?us-ascii?Q?lnVI5TTyZEBfXzyNZiQ2BdY5JZZ7LjTWwo9XnLiUlyWQX9VOEa7qc4COTR25?=
 =?us-ascii?Q?LGMjR0yqwTn0ILYlsXBXT4A0z9qKgUBCS1LE9vNg97E/Jbnf59Y3DY2Uu2qf?=
 =?us-ascii?Q?V154vaW5VCRSA/edujfmS9/wcAbFukuU1igib324eZ69itmJ3nou3Bxiq3XJ?=
 =?us-ascii?Q?gfI4oLWaTFvuT8J1EDECLT7vBbfzF0xBscc7aZGDOPh8aMpyOnC/KV36EZRm?=
 =?us-ascii?Q?Dr7LgukiFm/teuEL+4zoSoFveJUU4dl9sh5AuPwtv2umfjDfHyc/Gt5JnB5D?=
 =?us-ascii?Q?pqAxa8fWIPeayBNnwqQ9z6dGv/MLY3vmbkO0LX8R8o/uSA80W3gYbaVaV7TZ?=
 =?us-ascii?Q?ZuDn3Q7EznmO01DjlF6jdQ0J65Ifjgp+P3LkxYPokIrcrHpA8OxS0oIxcldY?=
 =?us-ascii?Q?xiuf6/gDHx/LPyRvk99f6wEBDzsu7J0zjy9whfSblk8qC2lP+2nWCjd7uowA?=
 =?us-ascii?Q?u5m3tws2+1FK4iUyhkl0nQj7897ycfxB77CulDxfJsm1nKofrHnxjQ/XNb+g?=
 =?us-ascii?Q?ZGLqH4GlCkoBK8Nm4bEh/BUSwKO/y6Zvq121gklIpFSfJq1tELWl4T/4DJ3R?=
 =?us-ascii?Q?uTP6iP9y6BqY+s6Uo1ryoDPWSivRWZBrlu00ZB2NVO+LQkoCEU4wM+aJ3Ov5?=
 =?us-ascii?Q?mPghfJs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9KYDzXuO4kxRMFmcXIKbj/w1ksSUcRs2CMitiZNViGCucidWDOno6ZvWuJMA?=
 =?us-ascii?Q?N8RGHadJdG7p3wtSlmb6NJIzd0psa3rd3wyN53K1pUlcz6dWj+KehVQADxGM?=
 =?us-ascii?Q?nXw+Fo04nndRImgAaLKVsJ+IvZ/AbVBRkDkib8tvT+1EHMTacSZpo4/CuUWw?=
 =?us-ascii?Q?3NPWadDtP64S2KKbKWUA0MHt2YeEwYs+QJWacXt/vMVoFyXMpvrgqtHqJDxv?=
 =?us-ascii?Q?MFpS//2M+1FrbEddbXhQmf+R+VRAdgEOZNChKsDkFyXXXhCIhdoR9l5l5aKW?=
 =?us-ascii?Q?MNOc/8iCg5f0QJ7xJQkRMIYp94ZYuZNg7Rjixx7PMtW5oOs7YHOAACkXJCmZ?=
 =?us-ascii?Q?xv0lEQxpoXEhFxY2iqb9rTogIOyclkUeMoAuU48o7MjrKMfmdiFtS+5VZYiJ?=
 =?us-ascii?Q?FFN1oTt3WgRiKf1IAwieQfpLV3CCFeKZ41DI165CRrJIOonQdVLMaO8C1Usx?=
 =?us-ascii?Q?n9/rPjCDOrF6XFD2loM77xpwjZlhDvrv9Eff3hp4adrQw64oL2L06tFfWjzl?=
 =?us-ascii?Q?IZO0JyG1MGFjaB7hU8uBXU85O5Hx5TtgQa3t4opkw/qS4QBbL26A40bQfMt7?=
 =?us-ascii?Q?zax4Y4NTNAcNmUnhEoTmEqzy+g/WVj7gpSgtC19U+2tuJd2oGBWCxuF+9NMS?=
 =?us-ascii?Q?bSKazBctVJKo6rLtEo6r7D7qHVatQPTax3KSFPC3pZU3/s56JTrCUaWpxexb?=
 =?us-ascii?Q?gvw2TeWZ7xjWWJcw3F4Uq6QhOXqozxWGh7hTE7MkOS9NgSLVTUAiiIo8d1b9?=
 =?us-ascii?Q?Xv2I7EMGM8bbx8w+j7mn/vb9FXOFEMFLUlcnekC5SJca4auyR/FJ1AWoO+tr?=
 =?us-ascii?Q?jh6gfPA7o1W4FLJlRneFP6PTZhVVxZE8HIOfGCHgqiwKskPhs7fEzJCXZ79G?=
 =?us-ascii?Q?xSfH9HLdC/V+pz4f7KlplYBbM8GHrLp1tEpRwsbm7M0/rp5H9Xdg7rC8cIO+?=
 =?us-ascii?Q?4d2QKwgXOa3tXj9f5E0M+N1KnyHTM7j3i4491c8/pk0bF24d3HWXIKeokfD9?=
 =?us-ascii?Q?SIqcKs/4q6JyHsP4eRBuRmIvXny+cKAyW6rvnaZMSWhusOJ5NR/Rp8zUDX2U?=
 =?us-ascii?Q?EaWfVqH3Dk+izTTU2brV/RfskkJ5yQj5fq0Omc49EBgIZw2MKxHagDl1bIZv?=
 =?us-ascii?Q?7UwYfHwm7IHlIUnBpcBZIVSfxS9PttRhGWDYTZNxLo2W6/tEZGrK0+2EXau1?=
 =?us-ascii?Q?dNrOWaj1CJ6B2Wn2j/l4fpwZB1VEFAB7XfYY82yWXArh8FbUcecmoelwYuMa?=
 =?us-ascii?Q?GDZ6b9X0vJ3yzF0HBU/aIyBvo8JNPoo0Pl9btPfln3n4Zx87esigbvfggFX8?=
 =?us-ascii?Q?0Cp5CK8o4BiYiFpb19Ik8st2uHxmkeBW/OfZAIzM3NFgnrMTJ1A7zxpqpVQW?=
 =?us-ascii?Q?XgMBZQoWalCDl/Fu2b/MUAnnYr4NGXkE5zCyR6ofP0qQJR2nwsDru9ZR3hoW?=
 =?us-ascii?Q?4Ahg/y1Vco1aChqRXmO8KCKVypMTvMfYKjvfKXSWDc4ZV8wZibKZXF+pXgqY?=
 =?us-ascii?Q?Ho6p7H4uQ8zOS3la9fJonvvsbPJchegjESPKtuPFwadD8mp+CeQRjMEDljuN?=
 =?us-ascii?Q?qieesxiDr6Z0FnfsCIpFOapgbayEGPwwaNLED0My?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0266f7-9484-44a5-817a-08dcfd787a61
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 09:01:47.3630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9Md184a0ldxeC/hppM5RUh7Wo+kzrH6O4ON5k1mSlL8Xct2AWbP2TtHWSd22mG2NTtk/c+c3qfQNMF/hwWxPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9876

Before commit 53a2d95df836 ("usb: core: add phy notify connect and
disconnect"), phy initialization will be skipped even when shared hcd
doesn't set skip_phy_initialization flag. However, the situation is
changed after the commit. The hcd.c will initialize phy when add shared
hcd. This behavior is unexpected for some platforms which will handle phy
initialization by themselves. To avoid the issue, this will only check
skip_phy_initialization flag of primary hcd since shared hcd normally
follow primary hcd setting.

Fixes: 53a2d95df836 ("usb: core: add phy notify connect and disconnect")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/core/hcd.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 500dc35e6477..0b2490347b9f 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -2794,8 +2794,14 @@ int usb_add_hcd(struct usb_hcd *hcd,
 	int retval;
 	struct usb_device *rhdev;
 	struct usb_hcd *shared_hcd;
+	int skip_phy_initialization;
 
-	if (!hcd->skip_phy_initialization) {
+	if (usb_hcd_is_primary_hcd(hcd))
+		skip_phy_initialization = hcd->skip_phy_initialization;
+	else
+		skip_phy_initialization = hcd->primary_hcd->skip_phy_initialization;
+
+	if (!skip_phy_initialization) {
 		if (usb_hcd_is_primary_hcd(hcd)) {
 			hcd->phy_roothub = usb_phy_roothub_alloc(hcd->self.sysdev);
 			if (IS_ERR(hcd->phy_roothub))
-- 
2.34.1



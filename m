Return-Path: <linux-usb+bounces-24860-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D74BAADE34F
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 07:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA44C3B77CC
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 05:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D31C20101D;
	Wed, 18 Jun 2025 05:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mPwvX/mU"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013007.outbound.protection.outlook.com [40.107.159.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A151EB195
	for <linux-usb@vger.kernel.org>; Wed, 18 Jun 2025 05:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750226259; cv=fail; b=A5MxcgVeiCZ8OdZLLbfay0R/VVKU605sU3tcm5eidwU9Vf7fhQXTDzk+sIblladffP5gf1H7DCzNKCoRUDzrUMdE6vrDWnWjK9Ayq05LoQyPC7HjK95kSYIAU3E1xLGpAd9zE+wRwn7RfyNCKXl4VpIpS3VGAGhZz8qDUQJ2DdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750226259; c=relaxed/simple;
	bh=uIwidMyd/5c6dWw/fSzaapMmRen/bsSC3/UNW+4J4jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cNQR3TLnKkhrlB1TPlO/NcAd2EkbypIcEmNFpq5BY/ltylIk5Zit+WjIlZpGJOExLDDtguavKoy2agn+m9Bzl9pgknghbbAYhKWEBfoBgc6XMjRQe/4BSOhha89a3OKrjD3slEh/qZx5Qg4o+wS0xfgJbrjurearK8qEtHWBRSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mPwvX/mU; arc=fail smtp.client-ip=40.107.159.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eN+jBx9Ls/whodB28cs5RiDahk8dmC68H/TKiyUva31vNmrq9o+cc2DmB1OSQw0gTB9qcwJN3jwLFHYBumb66rRhiYo71AIil9rmHOcIWxjdNt0tWLA06KzF/p9i6cSQLfWeGR5eafZtXIgZS5V/1LQxUDS16OKt+2wWsbGWqnuTH92C7cTl2wu+e8mEIW/eaCYx3Ei8Tfz8gWfpjszDUY9QFixwy0EoNS6uD1guYqQmFgXrbVlsTlY17pZbU+Dtbi26qiQefEUL6W2CqU4o7Tcf9S4Wx44REPgV3D6NaV/9tCKgUK8GjiLVMDezsL0UMpfAAgW4i4jAEt3aQ2Rj+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAe/vjCAeDjZk8H68Kq2Fah12l3tswJw1GY8O7BHH4Y=;
 b=Al2TuZgLKOAHn7xaG+PTbrxYj/SbLel4IoMySwRQULntqIjv+bf1wSu65KkmKgM5Ds0IDUrEPC0V358586bRyiwryxRShCPPXto8YJi2fxWT7XX6hhfavFvdcUc4LqYwegPQEmzHae9Ln58UF2cAz5J3TRSvuI1X0P9h7+7BJ7V0shvOh4jhLgCUF3JhRvHQErrOH4AMXFjLnAoZltZ/Bm3Vsi0M+L2v7UeWv28veBodEJcsbQDpQYl0d38RJc8YBDrLpwAuVP6mGy+Lka4AhLxSTXES2IXpWwv85Z11guSdHeTximkypWFvlRy4zZBXgbP/0MxlN9nRWoxKq09ppA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAe/vjCAeDjZk8H68Kq2Fah12l3tswJw1GY8O7BHH4Y=;
 b=mPwvX/mU/yagaNTzfVn3Tis/j0UOufUjV1kz4XlzyKgkUCLqAjktJA7/v4aUePPTOYUuCw7ElVw3RGUPrF3fz+2gqfQqUFRDivaRoXcVFDmfP6UoNFRvvbBFn3r3lCvgabDccd0DEjFWVJ+KXAQ6FI8cQOyWiWOBbwRePKozvqKTkywCuQ1bdzVdATX6JHFvwNPTAask+dVYDwyt3YmCjCHnlLSYxUGSBms1czFbAqFu4ysWLoPRfqA9GBoXd7HEt5HzcYIu1i2F8/M9pI6X6OxN9FgUy7ibEfuEJxAEFk4i450tl+g5SVVQJCDPujeUJcaQz8oGoAnWkumPHOLVrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU6PR04MB11133.eurprd04.prod.outlook.com (2603:10a6:10:5c4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 18 Jun
 2025 05:57:33 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 05:57:33 +0000
Date: Wed, 18 Jun 2025 13:52:49 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: "Peter Chen (CIX)" <peter.chen@kernel.org>
Cc: gregkh@linuxfoundation.org, shawnguo@kernel.org, john.ernberg@actia.se, 
	jun.li@nxp.com, linux-usb@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH] usb: chipidea: udc: disconnect/reconnect from host when
 do suspend/resume
Message-ID: <55htiwdoq62xjddyrf5ygasjysfhmcx6pn3h4rdayxhqhbm2rl@wbj3co3ab26q>
References: <20250614124914.207540-1-xu.yang_2@nxp.com>
 <20250617082220.GB1716298@nchen-desktop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617082220.GB1716298@nchen-desktop>
X-ClientProxiedBy: AS4P191CA0017.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::7) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU6PR04MB11133:EE_
X-MS-Office365-Filtering-Correlation-Id: 7acc7a9b-5c3b-4c67-9d06-08ddae2d046f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jN2bor40Qvs2DWerEBBRuagRIbtIS+UJOm7YNAmkuL2lo1p1SezTzyzLYvnb?=
 =?us-ascii?Q?/n2WjxYw1d3Bx85l3zhm3GLPLnTgnobyBfX/JYICF7YejdUD0EZwNP1C8/Hw?=
 =?us-ascii?Q?6kaB1qrqJElIV6rG2f3e1YqcB3gYMeJQXSzLVaPs5F6rtn0u6gNTJY/clUbp?=
 =?us-ascii?Q?80rqTA0Ooz+v89Ev5J8w4KveHx0xSwxMCgtSMDAEyZHjlbdNnKK62cNho/uh?=
 =?us-ascii?Q?rYLgZ0IpLrVwgiLZ/EoWCjt/bHD7955uOU4Tb4OpETN+e+SCPCUEVoVrC8E5?=
 =?us-ascii?Q?JOfszy5H0xsKDPNSdz4f2PvdmQ46TeWvJd7qq47OpN3R/dFlkSSK9ciP0xNQ?=
 =?us-ascii?Q?qHSKZm04ydTd/j3WPL98F2WfcZhFJST3hPw63CblJH7P04F9XNmO//MgZDH7?=
 =?us-ascii?Q?1/gbUB1I/ttmpDCJ04Q1rOsU+yQMUBKrlXoJXoTJBtghaaTSROxNTWFnnyoO?=
 =?us-ascii?Q?5MDyi2A2HDcCW0QTllfRieugxWMeUjWwePaqos2E6WuuWXsGzFGCIJLW5Fup?=
 =?us-ascii?Q?WXR4UHQqGQ7At8iqqbpi7/m+tpLNYu018hvhGrm4Zsx1gG0AZGEpAn4ExGXW?=
 =?us-ascii?Q?RbrH2G6M5dsGaffnnD/roWISNHPC7ugNTsHUBXDF74wFj6xWuZ1NR6yMO3mu?=
 =?us-ascii?Q?w/DmR13y1B0JffC6NIIWasd9rjXHuS4V8TCKLK2BZczobd7ISOwS/u0M6O/z?=
 =?us-ascii?Q?Utpsolg8YQQeugBWwuivQQuz1BN6qYBh5a3Zl7i+p5CBpVFnn7mT20+PtT7a?=
 =?us-ascii?Q?Qw74EYVmBKV6khBAkJ4KKlKNHZoqn5i5Xm17YcHqlbfdB8jGe/stcshzu7Ei?=
 =?us-ascii?Q?jsl+uKHOM9DWz+BRU/kXVcBm8XDrheTicNHH+Vs9Q8bAex/6ry8FYkSjq7En?=
 =?us-ascii?Q?wVOIdsFUZN5qsHsZ+c7HG7R/6k6cI+sqrTSar37ko+g3OYLnvy1k7Onlveb8?=
 =?us-ascii?Q?yc/zhMumV4cvk/8d46pkKb46AQiLz6Dpb9dm6oV2AQcWcqcZyFS6qAj7U1CB?=
 =?us-ascii?Q?fMcK/NGOUbxCz629OgwQhFNuI9p6aqtS0ppG28tePGyEI8baE6zMwkKxTnYq?=
 =?us-ascii?Q?Gl/3E+fZ9Yr27US5lpsGpC8UxwhOxaN2HCu9Ph3gTnsqyM1QBwO5W9ZtJvz5?=
 =?us-ascii?Q?CogFbP+KvDn78DwjOknPbSDeVDiImVpEKadVLKbOmaLvK/VLw6akmS5fdUni?=
 =?us-ascii?Q?h95P4DmJ06itvPR3h2mpiUOORC2DMU/RufDotCHbjyP+uDd61SeAQIROAoPw?=
 =?us-ascii?Q?JFV384UzViB4x6rmsPeg2K0Tox8vt38aU+G5DURPuGQ4zUH5KCM4aNfbYDL6?=
 =?us-ascii?Q?rdKnCwboYticeN0nMyciURyOv6oOSIMDPor93WMN7oekFrqT3IHyGtghlNpC?=
 =?us-ascii?Q?ML5XK7LTIFiSrbJAwk1SwbGi3ybNPfJ+9UcDSjZLff7+LslOJOIkA3sAFMuR?=
 =?us-ascii?Q?gInNtn5C4V1sXLdAWgsGcXae7Y0DQTpW6tRN0W+SbJ/3dJx0eO3kMQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Uq4A5ri2JWWDtNhDe6m1ws2o5mHidrlHEQSN+OPGgaKGfci78vnhzlyFz8Py?=
 =?us-ascii?Q?gaEp/JuxpUdLB2Fhsw6KyBsJ62vrg15HR/I4aj/eMmil99JEyP39W5ezd73E?=
 =?us-ascii?Q?7k9rGWTz5D8uLYkI4Muo8iyJAXlJTb8KhL7xRjOQeXyzj/66RaraL43LGJz9?=
 =?us-ascii?Q?+Ex9F1ioYYzoG8m1GayQtobkAQC+AHSlVin2nmXRqh8P8il8oPC2xSu7jsk8?=
 =?us-ascii?Q?4uWj9ezKuCcPrDZOHI4FlAZiuJ/pAYYJk6gPUPSrLLsyqlvIJzFuaJO96Fph?=
 =?us-ascii?Q?nxU6SkQ2jxbUCkobiLaaUXP4D4eE7mM4UO8O8Fdb5qYvyFFqaDu0DsZEmAEL?=
 =?us-ascii?Q?USzlyjkxvDTkTCAEFl+E9IaFmUaymowAFa/M6mstDgKXtNHevixC6wdeSb/P?=
 =?us-ascii?Q?3EI1kta3c2Nb3y+amepKETJr4HnyCoHtFbkgx5Z9emZGrtnCtsCdJ5hfsLqK?=
 =?us-ascii?Q?wJYcLplZ7TlN5wE8Ao5+Vfky7pYV/wixK/0DjVOrgmJQxVLme1hyxvsAT9zv?=
 =?us-ascii?Q?pDffSOwbsVXw0381+Tx/3zMjX9MohRX2Elgxc/HH0UWkHF3GedMqVNwWk1c0?=
 =?us-ascii?Q?96rsGgloizBriGQikNpYL/TkRWHCZ/li1OudBEl1Qdzw+bVIYxDbdtvPTv7H?=
 =?us-ascii?Q?uxe0BymKzUuWmS9s9PqWpxuQ2OTGhsgyO5x3M0iqTj2ey8WhWiWM53yNJCnw?=
 =?us-ascii?Q?z+y2Of1m5aOlbNolHt+/RnzFOpqPm7xs5VK6zKOqRfG5GTklZIqpVT/gg+LK?=
 =?us-ascii?Q?NuiKGerrUKop2yA3AbinUsP1Ay+w9Oe0viukPGKCghrrz1buyeb0hxjg9pRN?=
 =?us-ascii?Q?K5rQmvH+YjTyezCWDk2gDIuZtwSz7jnTyYFL4vSNmZOFvKiIjoIrKejBZAbw?=
 =?us-ascii?Q?lLhehlG9x9u5aJwzhkWIZ9r2l2RVVzktaFLrfm6xZ8CXwJQ2GjyYnYPrp1Ww?=
 =?us-ascii?Q?44Fv1S/gbSWSWz8/Ham9BVPy8Z4WCzGY5F4IhuWFxjEUYEDU6nwxH/Ubm4ur?=
 =?us-ascii?Q?FdChRYNmQFIbS1oiaS+CW9rp0mEElPkQ9gXygJJEybsvKgsNf6rnqHjpaBdI?=
 =?us-ascii?Q?xWBthOcc7pLP1Zkn9NRFukDPbovXHo9FS8Rqb/O7jJrOQbN/0F9RYoIN342v?=
 =?us-ascii?Q?X41tvdby01pGc3LUCEDa+mYFj/MxJLQseSr8d6ZEXTil9+FRbCKyrLzLBsCG?=
 =?us-ascii?Q?GpgZ4zlrYqFsnx1nTz99kWmsi57MP070PngFpDafSDaENZzWMwrRTNraJIqn?=
 =?us-ascii?Q?QTH9gG4g9bN2nnlBjXZQb2cIg05ANWNJHOboEBXPoOBY+5wJ7f14g6R/c0jx?=
 =?us-ascii?Q?WclmJJwiWW43bfVF3sEPcYdTMq6Np94R2uNJjJiAF0jwRomgu+se+Ed3GBdU?=
 =?us-ascii?Q?aeYnnqYHt/VQqbFLtHgpsu+VZZRhUcmCfnLuLj1x+AvmHnNH0LT49XPqg9t5?=
 =?us-ascii?Q?/BBctVn3gJ+iBfG9WUD2SLFC8vE7Brprl3tRQ4PlU/rS5Lm5mAP+kJSCEQTl?=
 =?us-ascii?Q?ddEQ1Gba0LUhEj4MkaSjc/eFPboLSD0g3F164QQilH+Q8Dm5LIXDmG07gJnp?=
 =?us-ascii?Q?HeBHVLU7dbhLv+qxBpVAawpTgwr5rFZwmo2UQZXl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7acc7a9b-5c3b-4c67-9d06-08ddae2d046f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 05:57:33.0823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sG35bjWQhfYQxz8SVxRvwUAnaek1BLfpF3z63mgTilNelHp+ZvlQrHxqUEKq1SrVb5bwN9rsP7JPNN7W2UvQwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11133

On Tue, Jun 17, 2025 at 04:22:20PM +0800, Peter Chen (CIX) wrote:
> On 25-06-14 20:49:14, Xu Yang wrote:
> > Shawn and John reported a hang issue during system suspend as below:
> > 
> >  - USB gadget is enabled as Ethernet
> >  - There is data transfer over USB Ethernet (scp a big file between host
> >                                              and device)
> >  - Device is going in/out suspend (echo mem > /sys/power/state)
> > 
> > The root cause is the USB device controller is suspended but the USB bus
> > is still active which caused the USB host continues to transfer data with
> > device and the device continues to queue USB requests (in this case, a
> > delayed TCP ACK packet trigger the issue) after controller is suspended,
> > however the USB controller clock is already gated off. Then if udc driver
> > access registers after that point, the system will hang.
> > 
> > The correct way to avoid such issue is to disconnect device from host when
> > the USB bus is not at suspend state. Then the host will receive disconnect
> > event and stop data transfer in time. To continue make USB gadget device
> > work after system resume, this will reconnect device automatically.
> > 
> > To make usb wakeup work if USB bus is already at suspend state, this will
> > keep connection for it only when USB device controller has enabled wakeup
> > capability.
> > 
> > Reported-by: Shawn Guo <shawnguo@kernel.org>
> > Reported-by: John Ernberg <john.ernberg@actia.se>
> > Closes: https://lore.kernel.org/linux-usb/aEZxmlHmjeWcXiF3@dragon/
> > Tested-by: John Ernberg <john.ernberg@actia.se> # iMX8QXP
> > Fixes: 235ffc17d014 ("usb: chipidea: udc: add suspend/resume support for device controller")
> > Cc: stable@vger.kernel.org
> > Reviewed-by: Jun Li <jun.li@nxp.com>
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/chipidea/udc.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> > index 8a9b31fd5c89..1a48e6440e6c 100644
> > --- a/drivers/usb/chipidea/udc.c
> > +++ b/drivers/usb/chipidea/udc.c
> > @@ -2374,6 +2374,10 @@ static void udc_suspend(struct ci_hdrc *ci)
> >  	 */
> >  	if (hw_read(ci, OP_ENDPTLISTADDR, ~0) == 0)
> >  		hw_write(ci, OP_ENDPTLISTADDR, ~0, ~0);
> > +
> > +	if (ci->gadget.connected &&
> > +	    (!ci->suspended || !device_may_wakeup(ci->dev)))
> > +		usb_gadget_disconnect(&ci->gadget);
> >  }
> 
> Don't we need to notify gadget(class) side the disconnect event?

Func usb_gadget_disconnect() will disconnect gadget at the end:

if (gadget->udc->driver)
	gadget->udc->driver->disconnect(gadget);

So gadget driver could be notified.

I thought you want me to call usb_gadget_set_state() after it is
disconnected, the user space processes is freezed before usb controller
system suspend, so it's unnecessary to change state because no user can
be notified during this period too.

Thanks,
Xu Yang

> 
> Peter
> >  
> >  static void udc_resume(struct ci_hdrc *ci, bool power_lost)
> > @@ -2384,6 +2388,9 @@ static void udc_resume(struct ci_hdrc *ci, bool power_lost)
> >  					OTGSC_BSVIS | OTGSC_BSVIE);
> >  		if (ci->vbus_active)
> >  			usb_gadget_vbus_disconnect(&ci->gadget);
> > +	} else if (ci->vbus_active && ci->driver &&
> > +		   !ci->gadget.connected) {
> > +		usb_gadget_connect(&ci->gadget);
> >  	}
> >  
> >  	/* Restore value 0 if it was set for power lost check */
> > -- 
> > 2.34.1
> > 
> 
> -- 
> 
> Best regards,
> Peter


Return-Path: <linux-usb+bounces-24751-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF92AD9CC5
	for <lists+linux-usb@lfdr.de>; Sat, 14 Jun 2025 14:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 600793B9F3A
	for <lists+linux-usb@lfdr.de>; Sat, 14 Jun 2025 12:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88052D12EE;
	Sat, 14 Jun 2025 12:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YZgqjJP7"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012053.outbound.protection.outlook.com [52.101.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607F12C15BD
	for <linux-usb@vger.kernel.org>; Sat, 14 Jun 2025 12:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749905676; cv=fail; b=kX879EASMvK63t7JvsnlRHuuqjQ1LDuJjB/7fi+9Dz3wThLAFJIXNT/wUMd8Pc6DmAq/RWlWM66fsVHIwSrGjB/giy+Xa5oTITOK5GKpry7rpaGsvGIz0BqnKb+xYvVi4b++WNLat1y1fTiwGxXesYImmRUjSlWKrovVQH8EE/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749905676; c=relaxed/simple;
	bh=oukpxuqVd3aJC/2uD/0tQgk8z6+CvKeD98Pl/QpK/+E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uk/c8C4n7X8v1Vh203xF1NccoGcfY4HZMaAzeiogojojn9UPEXSS9iX9f+KS2FkWGDHkIKvZvDlxD9c4WipYKGkiCPuU7HJY3SRXUWET32PnyR5WjgB4pJeuD3NZujvX8/OLGkGkO+0fIj8xylF8UaTSBWJzz6goFYjSmq9JhEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YZgqjJP7; arc=fail smtp.client-ip=52.101.66.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZsAf3korwFY64zEW9cxGQPBWHsTad8tKfZsSgYaV4s/N2Rrg1wRvxzOSXZ2wnro10sva+TICkyW21/xmKhWt/r5c3kU4LdFSFP3W26+PQvjs1RlrilU4BL/BM2DqL4DQRplnypeI8Qhfrh/D1aa6SICqfYcK4+mWEw4x10LiS4HexYcjqEECCIWGc2Y+t7n09861nmnjHOPR8VnzWc5PXmJzkcjg+2dQM6Phww+yvt2NKqNoLxREl1kfFHqHlB/8hoYCxgiQUc87iyWU0hrmOdhinvQcGsZBrLrBG9iY2mH4EH3O3Nm7gdke7ANaSoIeFPJrRRU6MTe2eFKaIsjwNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/3CYOVxIP56yTBMHd+FPm/RpAbk7o9lpNCFlNZqiTc=;
 b=oiicO2JkT5doyJBpFoX7JkajcCmeT9u/OhG5ZfcSLS1AAE2kV6nzTg0I1DUXFDhaUs2yHZ6SJ6v3tOEv+7f7VTUXVkmJne6avVi9Rz57pTXq4tmYjm+m724M/GFGd6RrCJY110CZh3BptUfRTv7WJnJFyz5Nd2mJLc9lC4x/0gxuhEQzFmZC+bAuz2B8UjG6pUNcQg7wwMAJQRhf8IkSMWXbJg6VOHRmbYbS2LNB3st/cZ537+/aHzwiTADhkaW8RTBYtZwbLKx3/gyOrl0dnsFzWu3srAhq3zI2kHh6TuVqFvOzze0m1qu7jUeSUngIpco86Qwm2ab6Yo6rdIsRtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/3CYOVxIP56yTBMHd+FPm/RpAbk7o9lpNCFlNZqiTc=;
 b=YZgqjJP7I0ZmzSKrxMEdmRixXxjX4bxW5B+A4jg/8J6ZwlCLq1O0mpaHsP055JCZwgH7T71OEhfyAlA+BUGayYozFS9oK+5x4KCnlAfIUTz/kh3eZs0ttsHfTzU9MvvP3Sm7vxqxCD8rxo8WPxsicHhjdObV6QtYtc+52NAwneS6s6jr1iFjO8g6oPC00paLBb8QR5FpK4Gn3MsYUHxKsQKmGw6Pzef5zFS/2CpAZE1xn4+72oiu1VZSEnaSeOA9JJg7yRDF5CoKn4agcdInwT0HAXcuQbNUWNVIEzHTp0La7ICGkbz6Eov8ZSqLVTk5od8WgRFQNhPn8u7xE/TYew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU4PR04MB10958.eurprd04.prod.outlook.com (2603:10a6:10:581::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Sat, 14 Jun
 2025 12:54:33 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8835.026; Sat, 14 Jun 2025
 12:54:33 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.d,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: jun.li@nxp.com,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] usb: chipidea: udc: add CI_HDRC_CONTROLLER_PULLUP_EVENT event
Date: Sat, 14 Jun 2025 20:56:43 +0800
Message-Id: <20250614125645.207732-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250614125645.207732-1-xu.yang_2@nxp.com>
References: <20250614125645.207732-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:4:197::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU4PR04MB10958:EE_
X-MS-Office365-Filtering-Correlation-Id: bc6feb61-9848-4d6f-a56f-08ddab429be5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qiIHrssV68Gl6vIk4zhA7SaeB08YnCpNfgsl69YWGmgCkVqubtBqYAYkPbA2?=
 =?us-ascii?Q?8OSUdIl0z2jM6gYOglSAZGy1FOdcK8MHFeWGRsavm0BQkqK6Iem4VFjSVCHV?=
 =?us-ascii?Q?2LI4rtz6uUrEfprwnfOuPwGqj+fI6EDtIoPjcJEKzuygX7dH9MU1T+COkI6w?=
 =?us-ascii?Q?HEXHa9b1jalux6HDW9ElzlUr6FTz0vV1oQyxJ3KpXn2eh2PT9HqHYGh00IJK?=
 =?us-ascii?Q?zAG8pf9TobjhGTTx9fKG90hb1hGjPqDKToJW2dN0C8eqO+6O89hChxi6WiyM?=
 =?us-ascii?Q?8H/BWVjnIIJ1MKv1eEUR06pprsqROvXEKYOjFqyokY6Bmx2HTJKQC65S//re?=
 =?us-ascii?Q?LTWd4YXe6bCVMyK6wghtDKQNoY+d/p2GYThciHT+CPLvP5UsYoUQzqmm+66c?=
 =?us-ascii?Q?wA+vl5NNUKxQ/akDXCsMiRi2IX6+SHLaOSFmMWi6DHQQZhfU/zEF/xqOYDp1?=
 =?us-ascii?Q?B7FVzIijoKVwe7T32GqBkIq3tDdnwG4Mt+9TUXxgVlHUtqqXPY4QzLTy91u7?=
 =?us-ascii?Q?LZvKe7nYGj3XMkGYoUd/OPlSSd8avFvJG2asDJOuhnHltmXRBkDJ4g4JEpSp?=
 =?us-ascii?Q?Z/mWlYpj9IvUMACfJN2RELO812dGov5Qa3mQsz1tV15LVFc5gnlWl+vyLVPU?=
 =?us-ascii?Q?dNdgO4HoM4wJB3X0fHwkgcl1fKJgnW3yLAbxhl0X98Q7mrmvqxl3+sKp2ndD?=
 =?us-ascii?Q?tMyqiSaHGFYbk2XHnVX3ktSJ/LlO/s8Q+mN5u9tpM8jiF3pK4lkang1xs5Yh?=
 =?us-ascii?Q?bKBoAzH7nwZ7WjGinwivzA11FqcZhp2lQcfNyXvLT2+zLtbuFDxTcwW7hHxT?=
 =?us-ascii?Q?Vv4yne6VjuCDliOBDxrrboHKDB6KVYIBYkhRfavYwsRJMr3Sr187pneSkyHs?=
 =?us-ascii?Q?OitylZ1+a/7CPvyKBkdB9ykf43d9dStokz/jpyPEhNBfwXPmbDuDqcL9gbdn?=
 =?us-ascii?Q?cFUtOPRHNs8NDzx/Z6lLS3xn6Jg1vsF4ejLix1tdr5ks5+bzUhZnhnxhF3qM?=
 =?us-ascii?Q?VemnT2zhhrD2pB8sVju+oJKT78zoKANpOPj1SEXoa9qhkaMMm5/kGKggyAX1?=
 =?us-ascii?Q?2u1BoATJvAas1p6LtLCvW3ZPtrYo1WUT53Gc8XKIMhIU8WvuXX6IUEwjvIlO?=
 =?us-ascii?Q?E8GRfKN7Xbsf2LoERDkKrqxk8hgImfb+1duritd+gsL7kEGUMdqir8gabt28?=
 =?us-ascii?Q?ak6CkLzx1rIk+AVgSL0QQ7CMkVsavcT8FOnOBYTPO6W2j7Udk+qiMB68kGAQ?=
 =?us-ascii?Q?kP9CMdnPaBPR0cpCnrw7E1UY53g1z+5YTGiDclDke4YhUlrEviZoOFvYg5le?=
 =?us-ascii?Q?w/qiFBNyVuW40B+g9H1QTFd8Mze68lTEgI7ZVMCqYWGs3x93mmFh4FTpQzdx?=
 =?us-ascii?Q?A1+K+ZY/arVLU9anKbuoUFn9UXdwIgn2M0dLgF1m0KhKSHUmO8NJ1ccUSsmS?=
 =?us-ascii?Q?71dBDWWPCHdyEPIvvcYl+TuCsy5s6iJuPmXKcFnX+TvUEPB+kzWnuQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?omAzNZl74IcKT2QfYve2ukV4unVuT+Tivig5pBZuVReCCIFIjNwIZ2bz1qA7?=
 =?us-ascii?Q?OYk/c2OPJySAYqIZm6DFhE7hW6SjJPln2WUf49G3wKF51pzrwjt67+EC3oex?=
 =?us-ascii?Q?X/dnjlvVA9TpQ7Ls3O1UdayhYQsIL2fX9Tu5zLPZ97Rqk1A8nfxdL1z+MJTD?=
 =?us-ascii?Q?lisW5ho2637MczXi6SwxZJTwxhH8CAbaCzOVa7UTzA5U8q+F8vtq14SMR/nK?=
 =?us-ascii?Q?JwBOqdrsBngmOt82ncwgvrYYYaAjq9xD93+sHn/ZOtA6p0FP8TagqI9hCPhe?=
 =?us-ascii?Q?f+nmmtdBNjaSmwFDHbkAkUoIS9nLTlENdoxEmcobnWEw+Ab/ajgBOiRr7WF+?=
 =?us-ascii?Q?hgiqrqgwAasCQBseWvONiBQCK4MQc5zCtCwJ0OYeUKlLUY5aPrN4KVJSJsXd?=
 =?us-ascii?Q?Pw6M2jqn38vXvkQPhYAue1NiQy4I/ZATpNWfJqq6PahGPCX16RIRGwjWPGCk?=
 =?us-ascii?Q?q8/tLnNX7gx6AN+AmiDh8kPg4tK+RMEY/NQBkEuwBXYrnlmSaF1GDy+7HS8Z?=
 =?us-ascii?Q?BFbQl5XBoG/OGT1IfJi0lemgpDuigRCJKMCm2Wpxy1qKLn9X5/hcs+HBFnUX?=
 =?us-ascii?Q?XKP1WT7IEaXuH0na9UCIOVBT1tLsOyX/WUVDfEwastPdYlR1gJWX61Pvc+nc?=
 =?us-ascii?Q?7XXDvaLFF3gjY2pERHG/QSHdkyOfrF8bJchfPNuIURh7TprOmtwwQEwXAgMY?=
 =?us-ascii?Q?O+QE5CwJbd1sVAMtvpLyYJBgN8PDw1WVHc/ykf7A93E15YRv4/uf7+CwBUNq?=
 =?us-ascii?Q?/ArgKN9eogRXGZWM9f9pV0nhiC55gw1urpkH/abQVwc98hXsyR8usDTCIarQ?=
 =?us-ascii?Q?GoAawa8roWPARPTQMwPmWYYL/zETFayqEoy4vIid2nQba3mEkpUDlUYA98Zm?=
 =?us-ascii?Q?+YJpRc3fep3dBouoG6HzqPsA7icwyg6F7G2ZT445Ft2P7zasnmuIJwWf80Yf?=
 =?us-ascii?Q?nWRsVsRSHGXl4Ml3VwxG2WpcAFDuaecGRR3MOkl7p+9oq4Ls0TdV8v+SRW1Y?=
 =?us-ascii?Q?obUb8VBNIROC7qgiP8qI/rAU9cbjtBd6TjynJNvikyYfridA5tVXrEHp+Ozo?=
 =?us-ascii?Q?SCuwVj8IdRb+JCMocusEBSDZD4Ewq+rff6/TRoWzLZQo6nPktsuhGxpp8LpO?=
 =?us-ascii?Q?/lalOkhzBrqY3i/46CbPEXCfSZ8OIKl3LiK7FIixM/EVY68mrYJbLnRdylVu?=
 =?us-ascii?Q?HvHkp6rMc2h04HfP89u7miU8RnYreiOngF+P15zmSo8Tj3u17H+wqlm3G7nn?=
 =?us-ascii?Q?q9Ym5YjfS9PvRd7oFavrETYziUGGAZhIXClnrnFvtkgyOuRtTCAm1rB5bGs1?=
 =?us-ascii?Q?DTfAmHA9HH56o0++fYLFynAIP0mfDKUw/+TkSky31ghWvXlHgBPBVcEgJoMR?=
 =?us-ascii?Q?4bLlbJBkjF/ViBNFT2sEtIoA6+8yeTn0CYyB47RxiqgePbY5dCqMyD4qruUB?=
 =?us-ascii?Q?br0tTvkZjl0eS7XKKZXbuL7zZFR/IuC5ZuVFi5wjGhiw54OZxwbELZL6+BDy?=
 =?us-ascii?Q?EuQKMoXdSWw4LC+bZiB7eSNKn3cBbKs3wPzjznS40M41y+a2nb7L3HmkM/7s?=
 =?us-ascii?Q?CgPMtdADIVQbRi8nLXByC/PrQvW6R99VOLguIj8K?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6feb61-9848-4d6f-a56f-08ddab429be5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2025 12:54:33.1930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OdvxHGi9/rxIEpfibW4YfW+lBwz6YZFnCjAfJF8LLj7S4wpAAZBrazO35Ou41LHkX5xx56A21Wqlmr+KA+WNEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10958

The device controller will send CI_HDRC_CONTROLLER_PULLUP_EVENT event
when it's going to pullup or pulldown data line.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/udc.c   | 5 +++++
 include/linux/usb/chipidea.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 1a48e6440e6c..64a421ae0f05 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -1970,6 +1970,11 @@ static int ci_udc_pullup(struct usb_gadget *_gadget, int is_on)
 		hw_write(ci, OP_USBCMD, USBCMD_RS, USBCMD_RS);
 	else
 		hw_write(ci, OP_USBCMD, USBCMD_RS, 0);
+
+	if (ci->platdata->notify_event) {
+		_gadget->connected = is_on;
+		ci->platdata->notify_event(ci, CI_HDRC_CONTROLLER_PULLUP_EVENT);
+	}
 	pm_runtime_put_sync(ci->dev);
 
 	return 0;
diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
index ebdfef124b2b..e17ebeee24e3 100644
--- a/include/linux/usb/chipidea.h
+++ b/include/linux/usb/chipidea.h
@@ -72,6 +72,7 @@ struct ci_hdrc_platform_data {
 #define CI_HDRC_IMX_HSIC_ACTIVE_EVENT		2
 #define CI_HDRC_IMX_HSIC_SUSPEND_EVENT		3
 #define CI_HDRC_CONTROLLER_VBUS_EVENT		4
+#define CI_HDRC_CONTROLLER_PULLUP_EVENT		5
 	int	(*notify_event) (struct ci_hdrc *ci, unsigned event);
 	struct regulator	*reg_vbus;
 	struct usb_otg_caps	ci_otg_caps;
-- 
2.34.1



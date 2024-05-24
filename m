Return-Path: <linux-usb+bounces-10504-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 191148CE232
	for <lists+linux-usb@lfdr.de>; Fri, 24 May 2024 10:17:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CF6F1C20B95
	for <lists+linux-usb@lfdr.de>; Fri, 24 May 2024 08:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B2B1292C2;
	Fri, 24 May 2024 08:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="WIxDSOh5"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2062.outbound.protection.outlook.com [40.107.105.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B4284A4C
	for <linux-usb@vger.kernel.org>; Fri, 24 May 2024 08:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716538648; cv=fail; b=Co8GcNC0S/o+Jfv+4OHouAUKWMDQ9vMlzGG2youssQgx62ZiQ1xhDqSdi1XaiXv+UjWC0wWZJfdSxqEvyAsVyT+wdxmPA3NfogVxtc6wQraUbmJ4Whg+RoDvXzgJQ1PZ8DyeakCci9LRY5dQJe/5VJvupPSn8qOt+o19VI6kQvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716538648; c=relaxed/simple;
	bh=biZncpF7RbKhQWof9thU5nLhtMSaAW0xVKzBzAqFklU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ihrjhuH4SWXlS8nZOvwE5deIfnDZNjeXPoWNv7ruBjNmHTapq+fHA/6m1Hw0poNzltrgmcOcvnmIbrFeD8dgxJnFxm1y5v/3OXuRwSOXDyR0Y0NZQ+cNTfe9uoFH4OuN3eb/OorRl1ZG35PzIikfyvN5MvnwepgoEjiodmNmvgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=WIxDSOh5; arc=fail smtp.client-ip=40.107.105.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWY33riuY0e39coUbgB08EPwSDNep7HiD1/AZrbRd5iRcq5rZaaWYaKUOEFFtpPfGQbjDh/swCU3NEbLOZYk3Dpq4x3jk+NDdawGul6WeuKRH2DedXLkewd2rUQHVo/6Qw3g22dBH+5WN9mFrDTKdpyMQ9rebq8HdxJ8ck+kbTbBwZ/uduGXIEcfIKIhrD8nrOuE4lGTrO5flItQ4cdxQeidvYNIp4eLvIvbI300X/xXW+7hneEDnc5f2lmk5Bv3BetmdqrZ9kJtNUnJX7Z3qHrBPQbxhxUxTVwL71VBX7xVqPyjojVjbWbAPKMRdzFtfKNPEzuNvjgeVoBjEHzuTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7giH1Z2SEb4Iam+r3ZXMC6oaZ6E78RqulZLqAp0E+DY=;
 b=A/4HqV47rludeAszMrJdYTdiRLkkb31oyLAml72NZNbBGd0Cfm0KlxRgth8OVM5v4TQwmLQPbJ6CK44QqdzCKdEwf9rZ5DetDrZBzDvChiTAr1HcKlsDXuXdLPVV4kn6eOYrxJ+hDQrxicZ3778Nzu8HGTiSAp5p1kNjeT2thzSZO4LRfn9TSmF+D1if3738uZK0TSC3eS2Z3XOdtbHJvqWm2S5sjKG8bu0xOlWL/PqM3Dqe8OkTOVT/AvUW7tKd1zbh5mOmSD/qU4YHG/dJ4ForVYeHlwqtZAcLuSKiEZ/Ad9y9O74wvfU0AKvn8YI7KzIwE+EVfhERF7sZlqajIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7giH1Z2SEb4Iam+r3ZXMC6oaZ6E78RqulZLqAp0E+DY=;
 b=WIxDSOh5/edo25+BbAoXl14xmmEXbvikAyge+B8CDmFX9E9Fx+8o0qgBgq/Jnem2YNHhBFbgOv+8zzImM0+Nslad0ZzsT936lInMruryWUUKHhHzvTQX7xq5+haXzQW/PI0Foh5mbl4p2fQfrDWdpFM3t4ZH1DjtxFnkyH2fSVc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA4PR04MB7742.eurprd04.prod.outlook.com (2603:10a6:102:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 08:17:23 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7611.016; Fri, 24 May 2024
 08:17:23 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org,
	jun.li@nxp.com,
	imx@lists.linux.dev
Subject: [PATCH] usb: dwc3: core: remove spin_lock/unlock_* to avoid deadlock when suspend gadget
Date: Sat, 25 May 2024 00:25:35 +0800
Message-Id: <20240524162535.129694-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA4PR04MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: c40b0805-3b85-4f65-d732-08dc7bc9f007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|52116005|366007|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cvUaHlRouyIFGK7nYsx36nPBc7ZTG6VGy9AoUJjLFpZuAh4OEj12HFj/awPJ?=
 =?us-ascii?Q?bbsa0UAz+hF6N2ZlRpagGoeDlrvhivT0qMjKZWAv6+/0oof1TIxF0Z827L47?=
 =?us-ascii?Q?QqO/ctannP8xpOD/sHSjq71kHa+pStHrMqE0+2qbtUtaZWmavGkUNShkDOMK?=
 =?us-ascii?Q?KZWPYsQYUxmJwdYhh+c+dWqG2OaEQAKRUL4fM1dnLjmpkTIXEgSK7k+LORtQ?=
 =?us-ascii?Q?V2cK+dUZ2E8uFbHBLvuQVL5orGsWTnTM8dLcnN7SAe7DWnk91m+nc8/h9exc?=
 =?us-ascii?Q?UZpwBHOrXTxYut+h+TgWCHLv2Dtribt73VDBtw9N1V7Twihj5/rOs7eJFZXY?=
 =?us-ascii?Q?1bpX888earn0bi3igVttT96Y989mkwVf1SqTYMPVKwA14Stk0G2SaT4WL3IQ?=
 =?us-ascii?Q?ZYKm+OhLu9YouQ1oZHJSiCndpH7aO+k3WXr/eFhaFJAZT/YsYiXEpHsJ7qcK?=
 =?us-ascii?Q?l+YS8NSdDqSPGdmhtd5bcAhia7/W6+0CTBNAazap0TNtfxEwpYQ7/NNw025J?=
 =?us-ascii?Q?zkrSYnEPP8UTZpqMBiPmatD7bZ8nWTf9u+o2mH+BU+NTQWuOT0WD4/+Qr+Iw?=
 =?us-ascii?Q?jdf+abcNgIRzit4lGMuvnPZFBsmQsqUHu31M4fS37MystK8n2i9aTo9uFL7e?=
 =?us-ascii?Q?hUPfq8R+fMbkJrGtQ3SLSZWU0Cf3tGbK9pivbrDo7ekdDuWwWCmPKWgmeYRh?=
 =?us-ascii?Q?3oa6o0fgtnEbsjl2hTGZxHF+atp1R7N3a1m84qoNvBOmB961Tz0+U7fWqPAX?=
 =?us-ascii?Q?e/JSLyW8MU2aKFp7ll8CqIKum62ddl9Sap58ijc/7QCVufqyEa08erLjKDKm?=
 =?us-ascii?Q?ZJrqw0Pvv0Zhu8E14WTY+DQOFXs4BeaVP5JQyd2Qxww0O3F2n6tMkjjP9dYg?=
 =?us-ascii?Q?J2qmqK/FF5dUYkwmv4YEqFo9jDqrCuQ6+70afrNom+PjC16MvoBOn8h455gS?=
 =?us-ascii?Q?iaCzj3eaQNJPFXQutok54VeAk0PVcIaVSBQOW1gFr/SdWDXEn6DwxwqrTsrk?=
 =?us-ascii?Q?ck2Z/2sClvT0egWjL01F0Ea56mRYF2mfULoZOtn3gNqTNYMqxM7r+T7rCGzA?=
 =?us-ascii?Q?R1YR5fBsWnbwKkYwNFHhYkj3hbPsm8Fp+IG4FSgGWS0u37DfjIcsz03sl6wu?=
 =?us-ascii?Q?lKtODo+LKEsKrcekcInIZW3jZ4kD20GcnJCeMYJ3B5r8cd6KBl/nAcduS/JM?=
 =?us-ascii?Q?0AMXjAxw6IlLRZh9COruFm036PTkD3jAu/+TqumjPYOcvLVZLZ1hdvX5bhIA?=
 =?us-ascii?Q?8xHB5/Ns+pGOcNlVZ9RxARgvjRkjOkv1I1zhyTeMRhESG50FJFFZwRrM9J9M?=
 =?us-ascii?Q?anLA8BjAlSfD3+nSiQUiLNiT+msN2wUlGRetd1HmiUJNUQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(52116005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OXm+jg7EdRm8c3k2Y1LZgPSQ6UrQ0FZcS0glcJAAT3ItHrddmq/C23PTRBab?=
 =?us-ascii?Q?SqU7eyKvt4hd2ZTUUMKeNS8ZsJSX+KC0TvrDNPllQdA6wkAPTLq0FKqcbyc3?=
 =?us-ascii?Q?sdrlc2XphZl0G9szsPozg5WknllSkld8rcuGtR10mCtdNw+Noj1Q6IrgimJJ?=
 =?us-ascii?Q?2GSY1f+yL7ZHaJ8xlZCXHp4ReWISFfO7+1OL0B6Nj2u712Cox+aqOuv88w4n?=
 =?us-ascii?Q?muNqNxFkz67xrYEnuDJ3EHNauCuV/jQQtD0Iu6bLaG1Hr1ySxHFI0ocVTDIJ?=
 =?us-ascii?Q?T+/12UsMGFyTCrsI036Ph7diMPNhM89Cngte70z8JjWWX7gtujuabnq6YXrv?=
 =?us-ascii?Q?bcJZcOtF1FOHo8tVmuE4BecAVrLqzFna7dTJA0gSyb56xllV8vTYCwFi2Gmh?=
 =?us-ascii?Q?CqIVJQ1g7NFL+DtnFn0RmrrkkZWV39I6+Y79+gtre5r/ZQ40FWWVipJ1XG52?=
 =?us-ascii?Q?CFjbUe/t39fnE+Bumr9GKAKyIRvbRywQ5GeD0BTD946MEKj9mavO0ClgxKnN?=
 =?us-ascii?Q?/kkI9wzWe2iOSXNk2cLRjLQLzp9jMDnLdiTbPKIQhuLfFJq0CtFj91Pq4Bn+?=
 =?us-ascii?Q?Sz/QgIhs3A6lN+XJ8HJYAL0zI5XT+udQkJ/d52WfNdA/4fW6J633G6RJYAX6?=
 =?us-ascii?Q?dOZWBgGcbXdFe/01bGYRkKRagnQBkKj8JoT2l7EbfOm0iq95JUaoJyW+YjJ5?=
 =?us-ascii?Q?7LN1b+0Hrc3PHta57/XxltgA+HL+GW26TQzsdEKIK9t8ykglkUkVwZH8FXpJ?=
 =?us-ascii?Q?LY+eEpK8bjiAYeaT5Bn9GBIu8T/7WN0Qp30XTNgU5L5wtpZoA0m76at5s1Mc?=
 =?us-ascii?Q?GAMIkHyo+iW12ZK/WcXWdHckIiuwmmwwuGfVrnEGRtonGwZzntlJJSmr44T/?=
 =?us-ascii?Q?soMmQZxvym5D+tLnTFdmUZC6lCWp6hFhcr7HM2SkbZkTDw9x+KAOaoDR+fBW?=
 =?us-ascii?Q?SMOv4/JjrN5KMg+AMIuP7GHZj2m8FmvBj6ndSNlKgynLJSghvCllqrC0f8MQ?=
 =?us-ascii?Q?6irie9KxDH1xJHjWcQP334uiik2VsISkuKhIc0hUOFSOzzGQv3QC1WC3/XoB?=
 =?us-ascii?Q?uTM5C6I1nfybGtBc98OXjIKHHm2QqT3k0xasFghmnIzcHsaqGI4tnzUoygKV?=
 =?us-ascii?Q?2L8vFvoF7EQ1zlJ9JoI9wvFaHSAYBd2Lnm2M+g0PdJ/BfGXNLh7w6bC7X2pb?=
 =?us-ascii?Q?6XlJcATTAFsIEL+QBnoVa4NJ0a5zNnVbdWw7ciPYqyldT4rhzQg7g1jrIMr3?=
 =?us-ascii?Q?cZPiaKUMaMaFvUTbvtiKE+FL//mt2DEwmLr4u7Conbb8EY51APx0O3aKXkFR?=
 =?us-ascii?Q?o7xWyqn5jVHSlZCobWYEP/dmeoHPiCWFIs/hTQcqe90YYhxyiJ09GpF+N1g4?=
 =?us-ascii?Q?vDH4ugA8Vc6iaX5ppztYgEmJxfDr953N9Nm2/BhZTcVG32jLNWy1vU+vGLFo?=
 =?us-ascii?Q?T6meiNW+ZCqB3G7qi6FVwhBFu60hDczNDcTUECmChU6i/o1vZsoJI0ZdX+bl?=
 =?us-ascii?Q?RJkcloBYhP7ZWcIWzUPEm0N8UCy426TyXEBd2yrbFr7lVAbH6W4enEuzENtC?=
 =?us-ascii?Q?eaMQFCbU/1MeSmSQTsOSX9KlC/ekuu3mfxmp/Loz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c40b0805-3b85-4f65-d732-08dc7bc9f007
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 08:17:22.9939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0b3rg5GzomFBd1tybRiI8qeBGBCiIlGF1ZjasFDB6qOKHRPqMbRt9iTQvk29BoTSUR+NgARQ60fD5JRM9xOsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7742

In current design, spin_lock_irqsave() will run twice when suspend gadget
device if the controller is using OTG block:

dwc3_suspend_common()
  spin_lock_irqsave(&dwc->lock, flags);      <-- 1st
  dwc3_gadget_suspend(dwc);
    dwc3_gadget_soft_disconnect(dwc);
      spin_lock_irqsave(&dwc->lock, flags);  <-- 2rd

This will cause deadlock on the suspend path. To let it work, just remove
spin_lock/unlock_* in dwc3_suspend_common() since they are redundant.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/dwc3/core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 7ee61a89520b..b8193edc41bd 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2250,7 +2250,6 @@ static int dwc3_core_init_for_resume(struct dwc3 *dwc)
 
 static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 {
-	unsigned long	flags;
 	u32 reg;
 	int i;
 
@@ -2293,9 +2292,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 			break;
 
 		if (dwc->current_otg_role == DWC3_OTG_ROLE_DEVICE) {
-			spin_lock_irqsave(&dwc->lock, flags);
 			dwc3_gadget_suspend(dwc);
-			spin_unlock_irqrestore(&dwc->lock, flags);
 			synchronize_irq(dwc->irq_gadget);
 		}
 
-- 
2.34.1



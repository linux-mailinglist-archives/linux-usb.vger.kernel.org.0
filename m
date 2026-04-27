Return-Path: <linux-usb+bounces-36504-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBK7BUMW72kQ6AAAu9opvQ
	(envelope-from <linux-usb+bounces-36504-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 09:54:43 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AB41A46EA42
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 09:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DB7443006112
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 07:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F62B39891D;
	Mon, 27 Apr 2026 07:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YfVdp253"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010046.outbound.protection.outlook.com [52.101.84.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B4A397E9D;
	Mon, 27 Apr 2026 07:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777276474; cv=fail; b=aZLGbcqxT+0nYEGYouwf37KFf3RE9w/paQDnLFAfp6TDkW46Prw2Dnn4bqhlcNJd7FqhOtKzMiklC2fxDfU5UHiYg6w/UhDhapcdXnkpI9Rp1q4XbJSWq22QG/n/anT/j9nYYQdc956x/Ya40KdBw7X1D5J5EcHIhqDNwzZjXCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777276474; c=relaxed/simple;
	bh=huecIpbzKaWKaLawSUZRj0JKmQcLK6c7M56rI8YZcHU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X3J9f9jF//1QG1VMRdI+vFExq/iFtCBRglHy/VV+7Zu+oHpfu8Ea00cqDmz6GUEZZS1XvL3fTiP8jRMP+XbHARRAZxyh90k8B6vWzixwGQozy2YLklE5x8kUr67FM5YqATJ7mI5lw2vkmhfMnVjEfv4fcErU6BQ/LIC36NSna44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YfVdp253; arc=fail smtp.client-ip=52.101.84.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WMt9DqcJTYICRcBjT2CKbXjFGV8CMlNSti1uwzmS8VnALT91/e59dxiBV/XeKqrqf9pvjgWn/xCCeTcR8wMNAysgbxVHl+dua6gl/2GoWQO8ZkDyX68T5ZJU9tynX9+kxOf0nvIkPMgJnhrHqR8eh0b/+5MXsKNIdV/sleqcEHtNGJfnQH2H/X2E9JI88t7LxhLOuQy6rPfS/KzpM+3VSk/lmFlR9wNx0Z4F+KpKDAVLurw5AM9b7E1A3iWez/w4pdeDJIcame4OjKXIOzvyzxugrfrq/UuXWHlmP7zCM84E+6PcvlMjvoL6tOHgEnfA5AwMZInli9G2TNt1nUMjUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ZrhfQf7dUDlM10Yg1MnlRZYgndKk8d6WSXtvbkQgLM=;
 b=CgeISvHe7zVNRBbnaC1SkWprJbrY0WDLH97eS3az6T0DpOjQfhzFVLOyx05CrS9xD4myAbbXkgNInfBvFkSYDxVPzUeWU3nY2sZEBHt5d0D1DJPWiF568OuygzdvTYWDVgubVUXTuFIe6m4Rg9d6I6mu0M8bdEJXAdVlYguLhOxCQvUbDt40P1KGetOrQ2XwjASYsasLedFAV5oC0W22n9+DZV9XvWqyuWA47B76XrX3JiCHi2vqn7lFm/yTHAwaiVpKaBxBH7nQQ8g0wLQ9fpcAwtjYKioqFvkKhh2NUnMLCj5zF8WGXxxSS+kYiB5+ugz9kjhMphh/BSPWzzSo8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ZrhfQf7dUDlM10Yg1MnlRZYgndKk8d6WSXtvbkQgLM=;
 b=YfVdp253Wi9UHsGGjr/keX8kRMFw5pvVZfHgtBKFR0BfF/S/lpCcU3WP7HVN/R/rhQYMqjPMrgj0Ls9lUn5hxpJgmSx/il9mq7HiIV+3+rZaOgZxhshI5Zl5IxGNUIaodlf9FBIRUs5f2uFgmgcc7NT/tYdoK7KPeaEFlyMhq7dHbVwQQY9lijymyEAIfd9pQNUIAgJ67Vu8yrLO1Z5LFPgDpHCxhuDXyxAX0bJ7wvH1atna7LCK3yCbDahWCYmTY7FlGhKY75KT7rp5KkSvaaNnK7lh7AXwoz7kobEr9tQMegiA+yioAEj8TXhgdRGbQMNwqRujpKx3QgJIp9kxHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:3df::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 07:54:27 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 07:54:27 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	jun.li@nxp.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v3 2/2] usb: chipidea: udc: support dynamic gadget add/remove
Date: Mon, 27 Apr 2026 15:56:53 +0800
Message-Id: <20260427075653.3611180-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427075653.3611180-1-xu.yang_2@nxp.com>
References: <20260427075653.3611180-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0197.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM9PR04MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 932176aa-dbd1-4e6b-a0d9-08dea4323454
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Xb4DmAAiSdKiUtHNoKODOmm7AU2sAxIMIvi30VtEIrW8+a1ns5/0q++1pIjdOZt508TIkpUQHmJjP8+UdYArBjvKP19Qo+5u2fhy+SSvDGoNupi16T1nfhDoP+AqxAypyV5bMiJtLnyZ7/cV+jfh+vNNbWgoMVhFbYopJ2uk+De3d564FEWxPnJ22Dl+S5y3VxfoZO/kctiY9QPaBrCVCa5tUqGyF1RqmsdYrN+zUaCS++SPBrvhPtGsON11pPLn0igLCcRJifzXUOYjEC+bkxq3CJJgyoAjpe8wlVGYyrRjiBPXZB3Sa0Dx6OrY+YZP/FcWNPdNUGPn43SWvu0HH64rhR+wcxB0E52Uequ5LTYgpLj8LHbRKYms5VKDwSgatiFrwPg5+7eU983Wp6mHDNTg4Pq9HVAdBVjzUAtP22koHeeH3cHnAhRzU3YHsVYykVfyUr9Tz9Tgzs20zmSXDMR5+NI9w/CRJaahU5/0NAi/vfFarJX5NexAmL1F/7ZbMA/ovxQsDU83Ng1zcBkdAC0endXMiPerj9HZ6JBLHOAYq38VX2ohWl3H3wQVqzm+xHnFbtd8DB/STykAJR9KYiLt1fDzRdkqWbbsKciANn81K+/8RKu+YCm8jzbvOTsmPEn+31LRrARgGULoDSbtXbzwFFSy0GvZyPt0TgNSW1XsYFGzX5L2HwNYYM5QFlwGxxHGqNF9Gb8bbuXlpxw/4omHYQL3ntQgme1wVFDGoszDsxpeYqyiTFc6b01TTXNzD6WrNePyzI7ZDBKyZvvKuZvSTpSiSObTPGbE7mlgA4M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pNeFGQfWo53W88ztrR1wGp8oUxToAbTOwDvo/090K7OyqWJ5X/QREroQm6j0?=
 =?us-ascii?Q?OM2D6dKBupXLx5+px3NVppfCWduX3mAK/3uY+JkPoRAYFKsIxDEINCeyT5Kn?=
 =?us-ascii?Q?TAalVv/WCqMXq8/b6hM7X61TiEQFuFQUrk7ElVSSTwfiAAbiz2BzKztAXAMR?=
 =?us-ascii?Q?9KL8rp4U3nE9cSKP6el+gPHqD6sxwOeXOnePgvlA4VeJ9VBig2phRAO6SMDk?=
 =?us-ascii?Q?c6JiLTu/CkHD0pGaYndZz2vMiuQOf2glwWblXi2NdjT5D0j/JdCo4Qq51ela?=
 =?us-ascii?Q?4HsfpSlODAUTT9b9QivM5DeJ1sdoHC8imRod5U7cAv1oRlvRyYIMua6I87/s?=
 =?us-ascii?Q?e41mtY+fU+8RjLbOn4BN14qi1hr7Ftk7UX653175GUeOPsbv9eLg/KMqgZwu?=
 =?us-ascii?Q?d9KJW3Yn357wPTj1cMBCOZ0LDrjnuG0FDR2lONlcEuJBGWf/oxoV0CUFrns1?=
 =?us-ascii?Q?pkQU08gw7zCStwBZTCdWU4n29/ZyZjU74H8EkoA2diKuFB5/Cp9La0KeyLVr?=
 =?us-ascii?Q?8l6ci3b6ukOXx+6eLnacNB6coKXE2NJn1lDMBgOnvfB7c/3QRTjrxNvTeU5G?=
 =?us-ascii?Q?72Y/TLaQSE3wzPQb4pfo8bP8froaVX2Z4dCXvSyunYgu4CDHrtll/EulMi5n?=
 =?us-ascii?Q?g7g0sxs1OHl6CnwBkmHhe0Ht4kkbaMJKH7/zAG/DkJ7aW9NZTe+DstRt93Xx?=
 =?us-ascii?Q?l1oS6kG18e9JjbUTBNvd9aVyAtduApPgAeC3ckiGF8wn20jpAnJfszfi20XY?=
 =?us-ascii?Q?f5sJn2LfLLJYsxcBLK2J9LMg63l1DYBx6BZ8wpnOayzitci5NW/jip1J5JtF?=
 =?us-ascii?Q?lFODLSYce1IJGYoj7jAmsqu4IllPt54Xa0P/B3gMtRP5GVKhq5VqYTSn6jkR?=
 =?us-ascii?Q?SGmwWYOp9TQ7lxxbZx53/KHyD7OEADPvfdGXrJCF2W7GAWmEfQM8mAEiA9+R?=
 =?us-ascii?Q?1tGdJh6zr8D5x8nTkDErfJ7gBw8PAWoZ2OwsgfHHhrXgKctDR4XjoQtG5zxC?=
 =?us-ascii?Q?+fRaQNmXdKe1EL+THd63SeeJ+Wbx0tUZfmPM8XtwTTS9Q6vd/98obSZPPPXF?=
 =?us-ascii?Q?99oNBCW2wYMAtn8X97PG27s08B+YetOHc8LV1xioOKA7aBSQXlyqEYLVERBR?=
 =?us-ascii?Q?EMXKO4eTM1yAHbcvu+K7OB6W4RJQPAQ8AqB6J8T9aJfMsBlPEK+/csIQUdBA?=
 =?us-ascii?Q?RKGnnHosmPoZizQ2lQ5skF2AHsS05um7ZL15F2dX2PXsg8ZsBAW4VTYB0cPp?=
 =?us-ascii?Q?Jez9SHXkZWUCt/sk8Vc7fltnTTXfj3RhZjdNmXCKUBCIZC9q/+/1rgXVFAJi?=
 =?us-ascii?Q?jaMK0DM9FLVYQgrz/bHmWVTlVENUZ1dScDftg1alcfsg9M3lQMzjqy0U9eRM?=
 =?us-ascii?Q?3FgM0TzuioR5AQ6TlduPAY6e3BEXNo/6G2wK8KiJnTZMzMhg/7LFroo+EOTY?=
 =?us-ascii?Q?t9CCIjGb8FcC5j70Lf/6mDyYWCCxO0bCWcCc37dZ4Gan8hEz6Ow/kmfWlIGE?=
 =?us-ascii?Q?UEuW1YCaOJXxXxcj5KOtOK6oR0LJAqDLFQVSUMUT5iyWUHi+GM4kMfmKYc6X?=
 =?us-ascii?Q?QK9OToHU+/AGXK+EJVuhCag+0YqSKYCaitsxJyUAKWmvwTOzZIws3aID81MA?=
 =?us-ascii?Q?9E95WLdN2aaXRrU493q0hnHXPiw67HbU2HAxDd/+c0R2gA+l4oihdqrM/iMP?=
 =?us-ascii?Q?F5+9X7oc6UMkd9CRI+4Hru6tDM6GlHOULgUXlmZKaT3Tg1mhrKtSzCC9vkEk?=
 =?us-ascii?Q?GvP1YPbmEg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 932176aa-dbd1-4e6b-a0d9-08dea4323454
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 07:54:26.9544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkN8ANfk18H8KTwVn9I/kuEWlBHCjrHl1XbiJ6B3xoxL0C6s919q5dHOFdXUIdoqEXZxYUizbQ2K3ieNCG9vrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8440
X-Rspamd-Queue-Id: AB41A46EA42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36504-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

An asynchronous vbus_event_work() keep running when switch the role from
device to host. This affects EHCI host controller initialization.

USBCMD.RUNSTOP bit is set at ehci_run() and cleared by following
vbus_event_work() if bus_event_work() run after ehci_run().

The log below shows what happens:

[   87.819925] ci_hdrc ci_hdrc.0: EHCI Host Controller
[   87.819963] ci_hdrc ci_hdrc.0: new USB bus registered, assigned bus number 1
[   87.955634] ci_hdrc ci_hdrc.0: USB 2.0, controller refused to start: -110
[   87.955658] ci_hdrc ci_hdrc.0: startup error -110
[   87.955682] ci_hdrc ci_hdrc.0: USB bus 1 deregistered

The problem is that the chipidea UDC driver call usb_udc_vbus_handler() to
pull down data line but it don't wait for completion before host controller
starts running.

Now UDC core can properly delete usb gadget device and make sure that vbus
work is cancelled or completed after usb_del_gadget_udc() is returned. But
the udc.c only call usb_del_gadget_udc() in ci_hdrc_gadget_destroy(). To
avoid above issue, add/remove the gadget device dynamically during USB role
switching.

To support dynamic gadget add/remove, do below steps:
  - clear ci->gadget and ci->ci_hw_ep at initialization.
  - assign udc_[start|stop]() to rdrv->[start|stop] and properly merge the
    operations in udc_id_switch_for_[device|host]() to udc_[start|stop]()

Adjust the order ci_handle_vbus_change() and ci_role_start() to avoid NULL
pointer reference since ci_hdrc_gadget_init() doesn't add gadget anymore.

Acked-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add A-b tag
 - refine the commit message
Changes in v3:
 - no change
---
 drivers/usb/chipidea/core.c | 11 +++----
 drivers/usb/chipidea/udc.c  | 65 +++++++++++++++++++------------------
 2 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 7cfabb04a4fb..95d9db159ce8 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -1191,19 +1191,16 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 
 	ci->role = ci_get_role(ci);
 	if (!ci_otg_is_fsm_mode(ci)) {
-		/* only update vbus status for peripheral */
-		if (ci->role == CI_ROLE_GADGET) {
-			/* Pull down DP for possible charger detection */
-			hw_write(ci, OP_USBCMD, USBCMD_RS, 0);
-			ci_handle_vbus_change(ci);
-		}
-
 		ret = ci_role_start(ci, ci->role);
 		if (ret) {
 			dev_err(dev, "can't start %s role\n",
 						ci_role(ci)->name);
 			goto stop;
 		}
+
+		/* only update vbus status for peripheral */
+		if (ci->role == CI_ROLE_GADGET)
+			ci_handle_vbus_change(ci);
 	}
 
 	ret = devm_request_irq(dev, ci->irq, ci_irq_handler, IRQF_SHARED,
diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index d4277d6611ee..d52f89489893 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -2044,6 +2044,8 @@ static int init_eps(struct ci_hdrc *ci)
 {
 	int retval = 0, i, j;
 
+	memset(ci->ci_hw_ep, 0, sizeof(ci->ci_hw_ep));
+
 	for (i = 0; i < ci->hw_ep_max/2; i++)
 		for (j = RX; j <= TX; j++) {
 			int k = i + j * ci->hw_ep_max/2;
@@ -2289,6 +2291,8 @@ static int udc_start(struct ci_hdrc *ci)
 	struct usb_otg_caps *otg_caps = &ci->platdata->ci_otg_caps;
 	int retval = 0;
 
+	memset(&ci->gadget, 0, sizeof(ci->gadget));
+
 	ci->gadget.ops          = &usb_gadget_ops;
 	ci->gadget.speed        = USB_SPEED_UNKNOWN;
 	ci->gadget.max_speed    = USB_SPEED_HIGH;
@@ -2327,10 +2331,15 @@ static int udc_start(struct ci_hdrc *ci)
 
 	ci->gadget.ep0 = &ci->ep0in->ep;
 
+	if (ci->platdata->pins_device)
+		pinctrl_select_state(ci->platdata->pctl,
+				     ci->platdata->pins_device);
+
 	retval = usb_add_gadget_udc(dev, &ci->gadget);
 	if (retval)
 		goto destroy_eps;
 
+	ci_udc_enable_vbus_irq(ci, true);
 	return retval;
 
 destroy_eps:
@@ -2342,38 +2351,20 @@ static int udc_start(struct ci_hdrc *ci)
 	return retval;
 }
 
-/*
- * ci_hdrc_gadget_destroy: parent remove must call this to remove UDC
- *
- * No interrupts active, the IRQ has been released
+/**
+ * udc_stop: deinitialize gadget role
+ * @ci: chipidea controller
  */
-void ci_hdrc_gadget_destroy(struct ci_hdrc *ci)
+static void udc_stop(struct ci_hdrc *ci)
 {
-	if (!ci->roles[CI_ROLE_GADGET])
-		return;
-
+	ci_udc_enable_vbus_irq(ci, false);
 	usb_del_gadget_udc(&ci->gadget);
+	ci->vbus_active = 0;
 
 	destroy_eps(ci);
 
 	dma_pool_destroy(ci->td_pool);
 	dma_pool_destroy(ci->qh_pool);
-}
-
-static int udc_id_switch_for_device(struct ci_hdrc *ci)
-{
-	if (ci->platdata->pins_device)
-		pinctrl_select_state(ci->platdata->pctl,
-				     ci->platdata->pins_device);
-
-	ci_udc_enable_vbus_irq(ci, true);
-	return 0;
-}
-
-static void udc_id_switch_for_host(struct ci_hdrc *ci)
-{
-	ci_udc_enable_vbus_irq(ci, false);
-	ci->vbus_active = 0;
 
 	if (ci->platdata->pins_device && ci->platdata->pins_default)
 		pinctrl_select_state(ci->platdata->pctl,
@@ -2422,7 +2413,6 @@ static void udc_resume(struct ci_hdrc *ci, bool power_lost)
 int ci_hdrc_gadget_init(struct ci_hdrc *ci)
 {
 	struct ci_role_driver *rdrv;
-	int ret;
 
 	if (!hw_read(ci, CAP_DCCPARAMS, DCCPARAMS_DC))
 		return -ENXIO;
@@ -2431,8 +2421,8 @@ int ci_hdrc_gadget_init(struct ci_hdrc *ci)
 	if (!rdrv)
 		return -ENOMEM;
 
-	rdrv->start	= udc_id_switch_for_device;
-	rdrv->stop	= udc_id_switch_for_host;
+	rdrv->start	= udc_start;
+	rdrv->stop	= udc_stop;
 #ifdef CONFIG_PM_SLEEP
 	rdrv->suspend	= udc_suspend;
 	rdrv->resume	= udc_resume;
@@ -2440,9 +2430,22 @@ int ci_hdrc_gadget_init(struct ci_hdrc *ci)
 	rdrv->irq	= udc_irq;
 	rdrv->name	= "gadget";
 
-	ret = udc_start(ci);
-	if (!ret)
-		ci->roles[CI_ROLE_GADGET] = rdrv;
+	ci->roles[CI_ROLE_GADGET] = rdrv;
 
-	return ret;
+	/* Pull down DP for possible charger detection */
+	hw_write(ci, OP_USBCMD, USBCMD_RS, 0);
+	return 0;
+}
+
+/*
+ * ci_hdrc_gadget_destroy: parent remove must call this to remove UDC
+ *
+ * No interrupts active, the IRQ has been released
+ */
+void ci_hdrc_gadget_destroy(struct ci_hdrc *ci)
+{
+	struct device *dev = &ci->gadget.dev;
+
+	if (ci->roles[CI_ROLE_GADGET] && device_is_registered(dev))
+		udc_stop(ci);
 }
-- 
2.34.1



Return-Path: <linux-usb+bounces-34853-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNYYAarSt2n0VgEAu9opvQ
	(envelope-from <linux-usb+bounces-34853-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 10:51:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 951E629765B
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 10:51:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 867413025E3E
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 09:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A003B38F654;
	Mon, 16 Mar 2026 09:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="C+oGGMbH"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013027.outbound.protection.outlook.com [40.107.159.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D9938F23F;
	Mon, 16 Mar 2026 09:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654378; cv=fail; b=K8Ck6PyEiKjditPyXuyaM44gVlnEQbCC8W6wsqQ3mue5kc8asWeQeeWrpraBbNXObl8ZQv50LVqWYwnHwUk/KeAw1nZjF6I64IIthXy3Gy4AzFPvlTKbux7ty76xfbhnYN4ZqkTHa62MzDvJi66SInjzpNmzA8pVG5nI4A/7I2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654378; c=relaxed/simple;
	bh=4vKEz2XsB6Tr0J+BGPt1PUjhb1Uj3she3QSURdpHRmE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=kxABIjzQCaRxWlMyxK1n8j7x0+FGaeAAxeYepusn3a2cRtX/z5+Rf0/zY9Zb20eezwruadUPrgQrms+M4UgRDGXuyhgxXrargW/uAljs84MyggXY9VSkiBHujqpxkOMFz8j1iFlqpCMsomxU/MAlVphCEh6vxg5eF/2Y+4nml4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=C+oGGMbH; arc=fail smtp.client-ip=40.107.159.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bpc9nYbEXOnKsv4gg26Exs6IW183yWtcOb9AyUtBCCE60svS//j26bfojLNcc6vIMGgFRvdeCaNrB4LFX/xHgwYFX/J3OcUvDGQGLWhaoGY6wsvCW/2M+J9PtvEjJHlH3v9jH617NBAjsFVWW2pRfkLtw3xHbVCK10Rwu+ekE3E0fwbgBodEdH29zkIPWMF/ix+5dTFIweeVUTrlaPR8i30vlcbm79wn8ERQSGGCsnnybOPbioS0IsxUXL2Ti6vR+pwUo1dNXODxmwdYMFkJhBqB3Ti3XE8I4Gi7zTb7h8necqY30jzFD+ZkTK2JXDB50x90cje1DcCUKUdRoEmWLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5IyW2ropSQrhzZVeNOwdINWwgND6fyvoyAmqsm8BKY=;
 b=o+STvZOJpremWwkAGCl9x2mSY9XnwwqL1juppr65djkC8x2BQf1o2/pVfu3MVHz/6AxGhDjfUPe/I25H7M4IBC3rpYOeFbiZ9ChOBuHMR7inZTcEGY/WADfyfNBEFLDqZNjtQ1gV18F3p9xhy5f31LpjEJ6qOHzW5N0niSq8jCJl0NXyz0L5/CNiZ3uT747KmSlBL6B6MpPYec4arWpAr+Kloo1RiZnjGOtZaxsRB4/Xny7+WOeJF8ibKwWVmuQUfhANzYLwaMgw1BFW/DtN6/+MCwmTVetPXylMQkBJ4ATtJrvfcsYh2qFUeWQX9V/Uoa9iL2+C6Hd5SvlaXkmDpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5IyW2ropSQrhzZVeNOwdINWwgND6fyvoyAmqsm8BKY=;
 b=C+oGGMbHXJyFVhCtFnftnszErQyNENitlYqo2vla4RUNDvVwDeSBqgT6hB46pD+DsEuWXUDjH0IMxdeltoFL+DI04fk9N7com/wqkUBu6lt2qkn8zU1WxlF/esc2cWbx4Zaj3SeRWErODz1OBrgF5tG7O3fQTDmk5EKQ+xLJASKqYo6/9mR9yxNn69zpglp92szmPoeGA2DzeBe+Rzr8RsOUuwpq++zVWi04a9dJqxZZpU/LDoqm8ig+yGYou0pi62u1qY/zOlrQCdbCitvDW0WPHrdgs2fUZ3wlVDDqGrluzEJIWAjwWhiGAEQtpPpaUuZegyHCDb5ShZaZObuPAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB8071.eurprd04.prod.outlook.com (2603:10a6:20b:3f9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 09:46:07 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 09:46:00 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu,
	tglx@kernel.org,
	mingo@kernel.org,
	claudiu.beznea.uj@bp.renesas.com,
	kees@kernel.org,
	bigeasy@linutronix.de,
	ulf.hansson@linaro.org,
	rafael.j.wysocki@intel.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2] usb: hcd: queue wakeup_work to system_freezable_wq workqueue
Date: Mon, 16 Mar 2026 17:48:11 +0800
Message-Id: <20260316094811.1559471-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0187.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::9) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB8071:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ea749b5-d98b-4048-be41-08de8340d4b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|19092799006|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Snqo1aJePG6TmgbD1gKh+JIWwTvd60rNStdjOm8AohlCnBIMywenXqkcb0f+emz+EHxyz3elxysoUAXjeNFa7yy/QRFNcMCI6I8M+jkvalfSSnxBdUaZVOXG84RytsUXmBeBvSlorEV+fbo12xMb39dATrKsWpyCk1pX2QSMq20ws8mGktdIEwOe4sw5Zc+ew+3r96RmKqSV79HfDzb9yy7alkG7YZ6J/q9jyBjxUkg0bK1dPW8updT3vDAyKpDasM6HcMKQLq+DmjijPP0s9L0wUA1n6uyItgZv3S5J+rG8BcGE93Cgqxskd3BAor9RPfRP2nAr5KnXemvwE59T0YfzIjrNJQyuIRM4IrishkWsjl095iBJT4PsBADtB3KuKbtDn7Pan9tpPBo69EFsPlcHbOQDRgADVg/xOZfOG7a26Plyy1lMkgoVVDFxgiZBq9dvn8cq5kSLwsvsTp2NV7G6+IXL1qZMC9XRBSt3iOolbAkjof2ynX8gBuV2mGHluQvqwYHZbR4EWLNBpn1KWYgQyKvb7gaikDL5X5VWBYqXvlldiC3c2OLu7/KymnVU2yhkNy3hZkUcn8yPFuvrHVuIaM7ULRvQQvWCtvyxyBJvCEABPuVIf8v5NRAS0w22IfznwQVmwEG++Zbd2GxuQjdVdRSnrs5OiVUSKZ4Zetg6ya3p32BZ+LJazdaH2I6SzV+fMm9QKY1ZxJ+CuBcHqtPEjYK1qM3deUb7h2QSD6EIV9sNVnQ5eMfOjRPf+PhQJjdz0w1NuzKT4zsErCH7MLMuwU/Ik6o9xXa6WfsT2ak=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(19092799006)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H1l5FnOaj2T2s16kdCkN8TjD2Ueokf86y+snzmm1BHv3CA7vMVRW36VWzue8?=
 =?us-ascii?Q?lSObOmsUe4KrUz0mMFegRrCwriXAnmuDRK+wwjfFKxyk46JksWt5CHmuyPm6?=
 =?us-ascii?Q?eE1isSNQmFmYMnesGq6tnFgTVF6ZqM6/3ds8EfAUVWFV1UJIG+oBZS0JyHdO?=
 =?us-ascii?Q?Bc6q0suPOfcZnu2wpqCUvopkCXsRYLLTZZeu5SNbYZY9Ni9h3hDLKkqchpeK?=
 =?us-ascii?Q?JLuNosre+NtvBJglxS4DbvGp7wyIYMsg6QLoPRkJ4gBlINwXtrfF11ia8lu0?=
 =?us-ascii?Q?uxH4UOzx4GgaHAokg4DdnvDLrtei1TR3rq66PWC058uqZVEWiwWjlCYPo2CO?=
 =?us-ascii?Q?ZAtO5/7MjcVaLyOQfcvMhaFz44S0O8+yJ7b40gVxj4OVySVWuGHYSvhdjygU?=
 =?us-ascii?Q?VkAHmWSC1gB3NE5HEE6rjCun+KF09BYTatg/MlOqmL7JF4+7eUrooLpyu6Fz?=
 =?us-ascii?Q?Q+LjID3l3IxOlpMRc8/vnpSRWXbb3z1AnoxlL2ilg9WM0+epaRCM46FJSKw7?=
 =?us-ascii?Q?HXrsXy17qPnlwXxX9qXmol7vng81n4WCtyZNvU+PC/qXvacCr0OsRnu8JZX+?=
 =?us-ascii?Q?0Fj+et3ZLLlRE0ejsOG+WiP3+GbdSXWdrH5+3rFa8g3KXL/z96fphgoiU/Oi?=
 =?us-ascii?Q?VF1Y7cald/81cI89SH+aJQk8lA9BNjO94wq4tp/t7YvdCDX7k0MFQRb6egYT?=
 =?us-ascii?Q?dD0LY36+bKUeitOHGnjbEN6rU5TejZNfybQI6rE+fTMbFWSYNnuNq2VcQWzJ?=
 =?us-ascii?Q?fPZQoKYrJMy8eWnymXhcp/DJiq3tCgzx8HVwz60A/IXnFuQRNu/K3PF8b1r7?=
 =?us-ascii?Q?7Apl7ObmJvXSFsu8q6oRX/23A5Rr3WF9agyTSuz9uRQSHNcYk7ZGA+iH8VPb?=
 =?us-ascii?Q?JjlWN25PZGTy09MzLfFW1ou9UZZ3unpVeCEJKf3NU4+I9/grXiOykqjRYHzX?=
 =?us-ascii?Q?qHbb/NQTJaeMEcaQHjz7pKpWmYeMdRnj0/szQHXZy7/TUUtXrDGkGH+Cw66J?=
 =?us-ascii?Q?eQuDce37yy+PQi6c4DrDlpvc9yPJ+cCC8PTqCm34soKXAZQPOZrUnvXKPewU?=
 =?us-ascii?Q?fyusGoR4Lja5P9CpjgjfOISSb6OV7AgSGDJvrd/recPpsbDQTDAdrRnmAc7G?=
 =?us-ascii?Q?lfXfXMxfIQNQ3sKLITBdkNFgJ2gGkQRs1DujYIEdgbMPRv42Yg1FUFv8SDmQ?=
 =?us-ascii?Q?deiT1gCGGrC5S5P61oHFve4sKDSnOLg2Y8uHPQ9MzVvUkz2l1lABI9gM8KIp?=
 =?us-ascii?Q?xnYUbCfYG4I07XXMG4k/77TD1NZou7NXp1Y1V9ofYiV31zWepsgN6/s4D9aa?=
 =?us-ascii?Q?Cuj3UFz7E33Cnx7uO6RG7ojFA4XfzlekXperomdfHFwYN4CKnedZfVEFW/Ew?=
 =?us-ascii?Q?V2ZpZr9uhzdKE/1cbDH1myQt4gaZT2Z7+ZEj/0K1cjxKbXSl0zGFhKfQh92B?=
 =?us-ascii?Q?3FePSekcwZ07biff0dVzqTcXtiS1U6M8hIn7uQKHkTlqG9SAu2kVg1v/YVaf?=
 =?us-ascii?Q?wW7jdfHx2ezJq1lxDRFZTRDYLzqLF23p5slk5Qb0hiCmhSMY7KwT78SAJCdL?=
 =?us-ascii?Q?hMiyyjG/ARQmiQq6TDf8MZHqtfxnkLYV+2obll34M/6GcMMSv8eb3sj1s/HY?=
 =?us-ascii?Q?KXvW4SAPX+6PpMCq2/v2PRVKaNopLreLyWOD+PLAZ7iBGYWQ+QdI0oyAoF0s?=
 =?us-ascii?Q?VqETzUAugeMTghYQUZ5NLhGXg6czIbYIBemvBkTNZMBKthg6qVkk8lxD4UdF?=
 =?us-ascii?Q?x77v/CeMzg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea749b5-d98b-4048-be41-08de8340d4b6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 09:46:00.4582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vU1KuqHM2Oay8LekHrJlKeoTpj6DxuBc0r974QBLmCAc+v30gXfcVC4UxMholXKkLpCazwbsHxVkxZWH66m4vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8071
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34853-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid,harvard.edu:email]
X-Rspamd-Queue-Id: 951E629765B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

After commit 4fb352df14de ("PM: sleep: Do not flag runtime PM workqueue
as freezable"), pm_wq workqueue will be unfreezable during system pm. This
brings issue as below:

[  344.255749] ------------[ cut here ]------------
[  344.277740] URB 000000004aae4ad1 submitted while active
[  344.282996] WARNING: drivers/usb/core/urb.c:379 at usb_submit_urb+0x5a4/0x5e0, CPU#2: kworker/u16:14/964
[  344.292477] Modules linked in:
[  344.295532] CPU: 2 UID: 0 PID: 964 Comm: kworker/u16:14 Not tainted 7.0.0-rc2-next-20260303-00006-gf03fe0b53b39-dirty #100 PREEMPT
[  344.307341] Hardware name: NXP i.MX943 EVK board (DT)
[  344.312386] Workqueue: async async_run_entry_fn
[  344.316919] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  344.323862] pc : usb_submit_urb+0x5a4/0x5e0
[  344.328046] lr : usb_submit_urb+0x5a4/0x5e0
[  344.332217] sp : ffff800083283b30
[  344.335528] x29: ffff800083283b30 x28: ffff000082631000 x27: 0000000000000000
[  344.342661] x26: 0000000000000003 x25: 0000000000000c00 x24: 0000000000000000
[  344.349793] x23: 0000000000000004 x22: 0000000000000010 x21: 0000000000000000
[  344.356917] x20: 0000000000000002 x19: ffff00008253ce40 x18: ffff000089e4eec0
[  344.364050] x17: 000000040044ffff x16: 000005d9d87f6289 x15: 0000000000000000
[  344.371174] x14: ffff000089e4eec0 x13: 6576697463612065 x12: 6c69687720646574
[  344.378298] x11: 0000000000000058 x10: 0000000000000001 x9 : 0000000000000001
[  344.385431] x8 : 0000000000000000 x7 : 0000005028dd0800 x6 : 0000000000000002
[  344.392563] x5 : ffffc48f74e9daf8 x4 : 0000000000000000 x3 : 0000000000000000
[  344.399696] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000089e4ee40
[  344.406835] Call trace:
[  344.409280]  usb_submit_urb+0x5a4/0x5e0 (P)
[  344.413456]  hub_activate+0x268/0x878
[  344.417116]  hub_resume+0x5c/0x10c
[  344.420522]  usb_resume_interface.isra.0+0xa8/0x110
[  344.425393]  usb_resume_both+0x10c/0x1e0
[  344.429310]  usb_resume+0x1c/0x70
[  344.432621]  usb_dev_resume+0x14/0x20
[  344.436278]  dpm_run_callback.isra.0+0x38/0xf8
[  344.440715]  device_resume+0xec/0x1e8
[  344.444373]  async_resume+0x20/0x38
[  344.447848]  async_run_entry_fn+0x34/0xe0
[  344.451852]  process_one_work+0x150/0x290
[  344.455856]  worker_thread+0x18c/0x300
[  344.459600]  kthread+0x118/0x124
[  344.462824]  ret_from_fork+0x10/0x20

The reason is if the host controller resume routine xhci_resume() call
usb_hcd_resume_root_hub(), wakeup_work will be queued and run immediately.
Then usb_autoresume_device() will be called and usb device will exit
runtime suspended state (if it was suspended before). For a hub device,
hub_resume()/hub_reset_resume() will be called accordingly.

After the host controller device system resume is finished, the root hub
usb device "usb1" will do system resume too. Then hub_resume() will be
called again.

Above sequence will cause hub->urb to be submitted twice. To avoid this
issue, restore the previous behavior by queuing wakeup_work to
system_freezable_wq workqueue.

Acked-by: Alan Stern <stern@rowland.harvard.edu>
Fixes: 4fb352df14de ("PM: sleep: Do not flag runtime PM workqueue as freezable")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - add Alan's ack tag
---
 drivers/usb/core/hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index dee842ea6931..89221f1ce769 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -2403,7 +2403,7 @@ void usb_hcd_resume_root_hub (struct usb_hcd *hcd)
 	if (hcd->rh_registered) {
 		pm_wakeup_event(&hcd->self.root_hub->dev, 0);
 		set_bit(HCD_FLAG_WAKEUP_PENDING, &hcd->flags);
-		queue_work(pm_wq, &hcd->wakeup_work);
+		queue_work(system_freezable_wq, &hcd->wakeup_work);
 	}
 	spin_unlock_irqrestore (&hcd_root_hub_lock, flags);
 }
-- 
2.34.1



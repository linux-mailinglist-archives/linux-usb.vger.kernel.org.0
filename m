Return-Path: <linux-usb+bounces-12988-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA21194721B
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 265E12810CD
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD4FD304;
	Mon,  5 Aug 2024 00:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aIFXTCai"
X-Original-To: linux-usb@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010008.outbound.protection.outlook.com [52.101.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574239457
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818304; cv=fail; b=CIHyN07Vf5T3qH2VtB0wYgzyv2LR7lnknj1BL2SIZeie4C8o7ELI0EkeHsLM5x/z2vx/d4Ol2+qaAKX43syCaud8Kb4/QjpBZPF2nL7K1luvNpovtsuCkuL14M9oP+YhWgSAoXDmpepB3/aLymesuk8g/MmOZbGtUR5alrbEa0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818304; c=relaxed/simple;
	bh=1UujL1eLs4rK5a5BAs7CgUYbrOlYm6we5h3bR3Tkk84=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BZCsZz8qEIW4ezcRYdF6xTYQcrMlH8U38iUCPFOij6Yy2sowKU3RiPecI3cJcvqETifRD6agvrki1afYrhh6ISSO0EkU4/NTCIPsuSefyky16AtPPYBPatTV1q91g2Dfo29chKwr2kBnrBZ+4MnekVWx7WlzBwNb163qhwlveOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aIFXTCai; arc=fail smtp.client-ip=52.101.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TNUaQ+NDW/a1wabIIZsVE5m5E38H8+g2tfwT9tgg8f7wIGORZGgDHxeJ+dxGBzzOasX1m5bB04VBo3VPS487l3KHVcYmpZzbWsjEEGD1vG22y2uvNSYY65lCbqw1UFylhn+GIME2GQL1IjlzD0mtaauaJJ03F5mAB2gcW1OxPzRHVHi+p68RMN2JJTQ5BLZ9amMRYQSZ/5kRRfVahnkgH5vcMzkeyozNMrMMJ5MnleHNpxp1P5PKxrm9nalsoqGbTKTRycpDg+1v2t4eBIBlYatqu4G/1LSt61wE9XJEKQ/9QzQlNpzd+aXKDGDjB5/0G/G2UhdsGOEFyjjCJ+L5fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x79X8snJ4NKIkcwVBLfwQ3bh8abPmmro7Rwu7naeTIo=;
 b=g9UoX7O0UnRae7prdziXC4RDPg+Vi7nMUZMorTF3iLF6FJNtUQ+1trLxAn6wUGcSmLhMnuM2UUDy+xItPA4MlTZrTSVWHNCaSYOVb7ycknAEsr7qnuCfHaXyV7+Kzy9pIh5Pl+6gX0J3r32LcvOsQfamhZ2vsffQAnqtcKXlGTTvUfrjoFHL2mtxEbM2BBgaQfPd9PqU1/PpN4g+zTxmFn6valhYtcLkTqa55qbRxixOBKTpFtt3brFffoep8oP00YdyO20Ju6sLkDDpUQWGbJY1Yszq32ROTOb3BIOrNARF3Ohp9+M+mXA70EW/udCyA4zZ6iCcLZoLDRaUAUvbog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x79X8snJ4NKIkcwVBLfwQ3bh8abPmmro7Rwu7naeTIo=;
 b=aIFXTCainh8RBb4fGpVQ1wiv13M450VxussYrN1fo3aHVZL1sT5xLtmY/+JbqUzdUwGJTBSYOdpQTzRKfVxyT3yaEqpK448OjjIFW2iNKKcZLggX14XoosNSXeZ8Lp8ke9OlNTNMPp6L6tu/Ejny0lniA7yL/obACKeqULp96bA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:38:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:38:19 +0000
Message-ID: <87le1bztvp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 038/113] ALSA: firewire: bebob: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:38:19 +0000
X-ClientProxiedBy: TYCP286CA0335.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: af0ca22e-5cff-4a8f-e5d6-08dcb4e6e713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IMKe6tOdRzFWQibq464USUUb8tA1s5Gfy6ATx+Ir3c5SxIQYjDxQicSdpMc9?=
 =?us-ascii?Q?V5JAztR1CQuUBcEXd6Y6L2F9/yM7icuxV8VJHSR4Vd+DByAHKaws4zeff2bt?=
 =?us-ascii?Q?+3IDdsiz9xO6DN0Ar5lggzH8v37AIrIs5673Mk775iBel2k0mTg5Xjst+mdO?=
 =?us-ascii?Q?aFFnt/dFFDQPH+GuVEhTXoK+ebp3MEdGTgFCAl8ZHZhfk5QskYh5T8UmXvdA?=
 =?us-ascii?Q?yqCaefnCDQi4iuxLtMzz3TgFcnqscpRRZmGfGCIuZOG7kl8NVjz3OHkaTlBG?=
 =?us-ascii?Q?ZCfIkyYpo8Gjg5ry6vbCabi4fMnPD/CA+rBAQiCA3LnaFLCCBmH5k2otE9Ea?=
 =?us-ascii?Q?UJngirx835Hi5UtW7gEq9W2deLcXo4CQnCj1sDmy2EfEQ0JAGqo6mAlW99JG?=
 =?us-ascii?Q?Q7974PkpOcUbDisZNMBbBKoWpK7JKogN2eD+H5A5SPjSTRniLay7Jo0mpqkn?=
 =?us-ascii?Q?tidp4tGiTL9X3MYycp/Z6w44iklJvT0f7yZ+D5a4nTrCLubwB892HMuhohuu?=
 =?us-ascii?Q?dU9PXky56zmf2dDOIasxbo8fdk+WDsrG40AMgvYzlFPn7XWXWAvJVbL8ZmfN?=
 =?us-ascii?Q?O3O8Iqrvq2Ar3+WgHX0+VR/GxX2wP3TYDb9P4pP/iN+W0E0HnNGQtf/4VWig?=
 =?us-ascii?Q?s3zCmi0D/brz1Jq0H8qBNVW2Nn6BVvrHlJM7stDH+EFbm7XbeB+SVdBvnoZp?=
 =?us-ascii?Q?JZib4H7+UuvHpxMqATE+eRpJu41bmOwInchGCUVgzVg8CxqUaRuzV/2J4veH?=
 =?us-ascii?Q?Ux38odsMF1lWy8CcwagxOuoeILkYOIHvwTvxOob3B5vnPzIu5YtNqIW5bpJz?=
 =?us-ascii?Q?VedIV7CYLNFaX932IyqEZvK3vleKIh++tJmHsbnKVp8NjEUEWaLVKSJ/wE7J?=
 =?us-ascii?Q?eBU5UXTQ8lL6jk2AZAD91Kuybz+AihjnnlzMUpBspuEsXs4EUJH2AMAgWjWN?=
 =?us-ascii?Q?TXJxuHidj0/Eu313DiO4vVpy0nnGz/9Kqq1EAUZI9NSEdG1NQr5sbVzMJ3eb?=
 =?us-ascii?Q?CrKO9+pWNJW5Y7CMChCtqD46Gb4C2SclOQI3O3w/IqaeSr1Vz1neKzMrjhED?=
 =?us-ascii?Q?Ihe9DNC5/eY6P0GlUGQuXe9pTz7VPNJOX6sjjLniTMQI0EpIL2gJofmp9r/p?=
 =?us-ascii?Q?drw98u8zOnvCWWL0ysUS8r403B7VZyQpDzyMAz2sq5X6kfE+9l23xg04SjM+?=
 =?us-ascii?Q?w/n4fNDoYz63U3gya1Y0zzsbx5BgSIWRskkGPyDQHNOJyBcDueYCEENtLso5?=
 =?us-ascii?Q?d8yMNfspcGaNHSZOESKjSldKX7xgwnB/GpywGzfFPMt0BAjJsNu+q5s5HZK9?=
 =?us-ascii?Q?5Gs7Z+aKAVTA6TZuEdTyNIbg772fOY0YM3Xclop/s73LZUFWfGOKzcyoyAQQ?=
 =?us-ascii?Q?g1Zk9O6ttZQaXnQsCC4+zCRQ9Ha1w3cXz1AY9Evu16uQ5u8GUA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uAsp68PVC4paDCg1Q0FkvAhS7S5rXyo0PZJnYyhr8Nl8+2BV7LieT2EO7cb4?=
 =?us-ascii?Q?MTWZBzNeQT7CJ98NvjBQG2w1TkxlovYeCIXUR9E/DZuB3gNth0huMpOdC9P7?=
 =?us-ascii?Q?A+sBdVadBd1AwaP/vfrbgB9j/X3QwAHkBHNjmYffyl28L87FGURIjh45SGHn?=
 =?us-ascii?Q?ulZA7Llxjk0bXbqfJL2xlf1+RR7zaLRYiNVllkLFvIFUuWWeVyzDL/T6RCGR?=
 =?us-ascii?Q?7QEQSjHyiuKZbQbwC3ppPe/8GyvB35jqCesbfCDpm3n4LcnSqwui59DSfwtL?=
 =?us-ascii?Q?jhaKdHSPP0n/7yMmQlkqcH8PdA3kSFIVXmprnJ0/yoTq+2Py3ZSxa05Pvkvf?=
 =?us-ascii?Q?Enf6DUvmmVB6xdNKDsBUmGZU1kYbb6hsmWIc8Bas1Psfa9dV5x7i0BvJayKI?=
 =?us-ascii?Q?U/eKqg3ngg35B4YyRJyrhSpKc1CxV/3R5xIbxxgDJTqrUAIuDeinGGWfyqqe?=
 =?us-ascii?Q?8qfZ3slzQgUgO0KiLjMbM1/AB1GOJ3eH4wfoPni3OKG56tu/JrZBr5XYGqb8?=
 =?us-ascii?Q?fuo2o1bX4oMYulKy+VM8Gca5mq9mElbYFxRfC9QyI8wUKitHgrAXGmqQP1Ga?=
 =?us-ascii?Q?tVhDuMN6mjL2euLObbuIgiW0hPdpb2bXXP9qiJV1bnZvrsfhayxo3YNljzCi?=
 =?us-ascii?Q?PfdLuBZXIy1l/V5O0gudvjXxMT9Q3NEyDv9+XhTMqmVuiYnnr7MEQj2G3fa4?=
 =?us-ascii?Q?ZYTybt/1IIKs7+4Y1R5Bb2zDdVmnBVCug87fmVwklLV05et5dkz36UCXtsM7?=
 =?us-ascii?Q?+LuNbZFod3oLzpIimmdEtPHGp8LJfxy3NsCbO1LCvfCFVL1gNpvhqgDvIR1e?=
 =?us-ascii?Q?lx4EHLx4AF/2i6YIaim+BdNawa5jRkdAO0gk4f3+OJUhGLTj83C8rB6MTwjf?=
 =?us-ascii?Q?cpv7orHaGI8VjJUW2yNh0yVZbn4aNCTPgBx2Li0IJqBjThgkVvh8PIGihczH?=
 =?us-ascii?Q?TWb0goJ32coroTtjanxj1rNne4iXmGNRij6+STp0Iboi/CcdXSsPxTvY+wlh?=
 =?us-ascii?Q?9TSisWO7wbEBxlxnfea7XT0BWBpHXfh+8euggvkgmaKwp0z/zfntf5p4QVdq?=
 =?us-ascii?Q?IVO3YDYchWpK7eA/9h2K8mIl6Axm2MvjaQl9axacnN85Lc1QhBZqSyh4ahKA?=
 =?us-ascii?Q?FOWUVtS7jzEnTSipo5mOdVvDxizIw4hSMEvwMHM+ZYSoPXwXoLZh5u35gjcG?=
 =?us-ascii?Q?kwf0mhUvaY6qvkzRcuMj6MACcliwR/wPjp1Rrw2FAKezLyuNR+y/1LT+3ZbQ?=
 =?us-ascii?Q?ruTnFZFSM6rQQwPOKdStgSgfrOQtsuETwFaTlZW8qk7j3BUnCybWN7jSbU0m?=
 =?us-ascii?Q?TxIpKl3gPORGahIG6SiwonNZwFYU5QUN2AFsVVGwBqJiXKRQM1tkUVJ6F5Dp?=
 =?us-ascii?Q?GnaC2wbmpS8KoILpv/FTgSehvgQrGOBp7cfSo69i0cYdrmZtQwOZPsa+KvfP?=
 =?us-ascii?Q?4+8w02U6uiyMLCPvFhwRjRa3vK9wIMj/3YmW1oVANacPeBE86DHTlwJ/2LVq?=
 =?us-ascii?Q?9rAbnANC4RNymgLLQEBK9nqYskt3/oCB3ULoeeZawfc+Pi9oXgZQGtWrbcTc?=
 =?us-ascii?Q?G1reoCwDaEdTM+904Rb+xHQG7gZApz2+GE2oEazeRybIHdtWecs9UiTtjjXe?=
 =?us-ascii?Q?Cp1rXWDSmixMwAQQ9wKBbZ4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af0ca22e-5cff-4a8f-e5d6-08dcb4e6e713
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:38:19.2788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+5RQmJFyywznd1FJlvHqCYZHeCHKPR5w+aP4pBbeBGFfk6EANdGmT/DMLIK7jW0GBY52SGU15a1haw3RsIVHVzAIV1kjz6aS+CtKl+TpipGRxUPCJSBH2Tk3/fciKVC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/firewire/bebob/bebob_pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/bebob/bebob_pcm.c b/sound/firewire/bebob/bebob_pcm.c
index ce49eef0fcbaa..882aab28dd96d 100644
--- a/sound/firewire/bebob/bebob_pcm.c
+++ b/sound/firewire/bebob/bebob_pcm.c
@@ -100,7 +100,7 @@ pcm_init_hw_params(struct snd_bebob *bebob,
 	struct snd_bebob_stream_formation *formations;
 	int err;
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		runtime->hw.formats = AM824_IN_PCM_FORMAT_BITS;
 		s = &bebob->tx_stream;
 		formations = bebob->tx_stream_formations;
-- 
2.43.0



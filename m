Return-Path: <linux-usb+bounces-13004-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E45DA94722C
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13AF01C20AC5
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3177D17578;
	Mon,  5 Aug 2024 00:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Op4tWC7W"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011008.outbound.protection.outlook.com [52.101.125.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7DB156CE
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818381; cv=fail; b=stimTMAHVwWaNF69ILogaimwh7eOlnzwKL16xFZmQ9pHXq5A5O4vI97gdcdKXiQqR7wRc/EUCYltEMkmce3dX/GiFGxHrn8/ghrZ+AKbxfgmm/gWxmOIERz/n/thDWqna+Kn9Q2mdFHpC92We1IwHiqdhMAYvNj1E5QvW2ROJJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818381; c=relaxed/simple;
	bh=kdSk6DECpGoT28xkw/OJQtgQ0+/lr/sU50a469vO0HU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=K3Gzv6NuazH0v9phdRwg2BmXZuhLBDapSNoYsQakhSRCxBGwFr4I4CMKpzthzh3hXvQPF/k6nHTjI90/16iUyqCkvor31DMz8f4iDcEuvtB2Th9PNcu+sAtofQJk3CEdjDuIbNVVwwIZAnVKHHrtblQhvwbDIbCNMJ4uYD0XOSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Op4tWC7W; arc=fail smtp.client-ip=52.101.125.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R4PUV134LkWTxz0dDweF1xKaL8laVMfnRCaX7BkHNBEIFY/XUmIrVW82lHzwm7l9G3H5NJVU1gSLlCUVd7y/9WEBN8lRU1MSzEdZpHXRat+naiRbmuciTCbEM+Xxb0o+CUrtIfumenMnfZtdyiUE6S0g0Au9OnYonIj687O7gQLfznziKRjz1qu+21WyHoStsqljKLxXB8z0PamlYKzj66CkNZL/8oAMsZxr+8OtCYmV31nrv0JLfJWGOLGE0wHbDdbdl1qHbCVwDvQmwkoLos9ISctZI46aHkx5qzhxVVGcYqW7508xpHZ9D7MG+Jb5Aa61aqQdIrshfZSXrJz6Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sli65yhRKxn/i96KFCrnXlOcfpmE+B1fCKXllIuLv64=;
 b=bb4s11eca7b38Qo7EeDf3uSUDPaopnQAU7QUODoiz0CSQCudtIoburnzQwwTp4nJPqXLdiH31j+l2D2o92/HcMITD0QEywoeGWwbkgwyooE6uhx3fiIH0fQ8FY8Yhw//NqPXfOpQ/kvblnEihbGwlLO8bIYeow7U8xTkOi9Kc8GY3MKuZVJVTveEFw1XdR/Gujw7zmwTwRa6uxtZPiaQbESVduLFOG2Al5ETb+Z6r5tOBRjbXTtgOgowRMJfTqbZUabfYvnZUTmyy76ddY49SHCR/sagxvbKyfcp8Ad8Ozv2/meOA2uPjKybl/mj30pYa1ow95InxPbNpC9ehIcqKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sli65yhRKxn/i96KFCrnXlOcfpmE+B1fCKXllIuLv64=;
 b=Op4tWC7WEG0VgG691e1hvoEc4LwFxvvitU/X4c4UcOaP9XBRitVAdkkxfHnAjmgEkbnQHwI+Lb5tXsGr5gQvKUjpYH9bqWYqF724vG6Q9KKr7beWfKFHnrEZh6grgI2IULVQMXNX7YWrNH/KKbT2T2SmH+x4O2i6v8UMq+cgVWg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB9459.jpnprd01.prod.outlook.com
 (2603:1096:604:1d0::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:39:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:39:37 +0000
Message-ID: <87y15byf93.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 054/113] ASoC: sof: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:39:37 +0000
X-ClientProxiedBy: TYBP286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB9459:EE_
X-MS-Office365-Filtering-Correlation-Id: 24dcd254-428b-4c4b-4fc6-08dcb4e71592
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vpvylBj3mw5GyiCDEb/KByALcaMzwDkvSyQLcGvZpVPe0YEtsm8/Ro0T1fpD?=
 =?us-ascii?Q?bkvqrl6X3ZJyGM7eyJSdmtjl5k4mFI868/BFmmI/tyQya9vdYaguG4qHXRdL?=
 =?us-ascii?Q?IPhlul8e44QdUWpT1CU1gUUKXESIs2ncAGSKnZblOrMd6csXa8Uc/hXy60YX?=
 =?us-ascii?Q?faL/yEDt8H9X5NSnUlEM8+CnI2iTj/kd4Kz4cEpwU2flMYV/pIrDiZZTLmzI?=
 =?us-ascii?Q?LVI3w4FjyDe90a2j1mm3V9+SQ7VATzlsE6Y5L5218J5sWK9nqBCTW96A8U4m?=
 =?us-ascii?Q?/BWCd6yMuDfu7nFwotBYz27TBD8+6bgzK0MtRg9S+Z8rZpHYLf6RcyBxeRKM?=
 =?us-ascii?Q?AhoTypZC0P4swq6vSEYZMEWfdfVKmFfgJSz0RyFSl3DsG1uvztV5uRYXz2Y3?=
 =?us-ascii?Q?I8nf7fdZM4SB5rixCKch2JcYkkQGYUOSJeySD7iunk3lE22qQVn+yg+cpIb6?=
 =?us-ascii?Q?wzHXz0hZ0aNdpS6DxsKaKUk4rEivLBT9hl5v91ln8yCaHEa9qpIgxQgqrkM5?=
 =?us-ascii?Q?Hd6zFlyFYNzHV072wHInwR02ClJLksxl2PLUj8t7sCRWC7fBuInvUKACzifQ?=
 =?us-ascii?Q?g+x4BVfkt0yKAnagVQ9jT5wIzfnB8yoHjGTCQt0esbaSIrntds73ycvAUdjm?=
 =?us-ascii?Q?MUtmsMXUxV10lYHCNKTZg9P58+sr8k0evR8XoAAD316rEgpspe2vvNnLtOiG?=
 =?us-ascii?Q?zI7K1cUrKUTj8rF9i7DwlWwP5j31GRo+HMYO6xdbwDprXGG1WgRAX+qr7xAa?=
 =?us-ascii?Q?m5KqEZtPCbR71+NTEcSJEGaQlONp6AkGX+4LVsKZOkdEA2EZlAgPzrtBX+Pg?=
 =?us-ascii?Q?XOsbksy5PiD8Mi+tNTJIenGyLdVjHxMQ97XpWTjjqfl9e3sHrQRoa2TPYP93?=
 =?us-ascii?Q?E5W50Hi1uoEnhA0fKN7cvy0ostaF0GINFSgBzXZQMXJeG0F2gY/Z3ylN7OF2?=
 =?us-ascii?Q?Ac5H5qanIEE2EQ2K13xXLK4lz/eSwh9r1CtNzOTlCVAFhtz/Ce7f/1g6e5kJ?=
 =?us-ascii?Q?KD9S2Vg3+RIsLMc1x39txKs9UPxRSirOyuso4jF+Jvpx8x2BZW0YkE1KweK+?=
 =?us-ascii?Q?YJjXhQ8PrezSEt6YM2hQ1SZfxcxSDYMTzMErDlxxR77nmlnfzzXlFNqSH/jD?=
 =?us-ascii?Q?lVcfw+yvBipEdigItQ1XXE838w2oV+KlbXJ97o35k1hJ0r3obD8WwDcfEMzj?=
 =?us-ascii?Q?09jNCR7VlftVVd+Q7MxzeUB8s0JXUYw+rDqdgJcXA2lUzz58I/lK0mUOWFZY?=
 =?us-ascii?Q?60QxW2ECoekc8S9IK7b3k7sub3zZZ2JWaUhX2IoVCb0zPYcwSowloUGjVlN+?=
 =?us-ascii?Q?HimoOdhkKoEuXQE0TYZjM+PkB6RTvNT+VEwZA6gr71omXjxRvOalNHcgFvri?=
 =?us-ascii?Q?hQuRrBq02VZQPZT2v0AwhIRdPnn+waUiEKeb14vgBDEJl3todg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SzHDgS+4r6HEHV/LksvbHM4Y/josFOxL4qAVwUkqYyPGPg5w3gc94kZSmDW3?=
 =?us-ascii?Q?b4fVw4jXwjBnXRjUQjwGSsjTogJcz/6SEZIjcVqDyDBIlucmQZdecLttVupy?=
 =?us-ascii?Q?rxqg9CN8vnZ2QNTXvVJYOpCzjEieLiXUxIY1JN4nLOnTuH5522I6wjxv5eEu?=
 =?us-ascii?Q?jBC4Z7gpz1Avk1TGw9fyubN0x6NDLbkmCm8tyZyVSnUpqxrqnJmYrhMl4PYj?=
 =?us-ascii?Q?O34OZ98aIUbZzSrt4kZ318ITT9Nu3ej97QuKVP09WdHd6lbBfGVXN34oHTwp?=
 =?us-ascii?Q?GleUrUcuIDKvOlkF+fxyQuFUTCJX3onR8sP0VgSAdF9+aVtE2W6YKat7GK/Y?=
 =?us-ascii?Q?gml0XPAsEXZQU+zDBOD1vgwTW0Ww75BABFbT9luZSuSUBS4X2y8bleyKmNEr?=
 =?us-ascii?Q?qW0XJqlp55YC9LnYcnsKNhmBDetpPkWtmn0W60DhoJNLW6kCFqeJ8HyeI0tS?=
 =?us-ascii?Q?ZZpplfYA4RjWKplTBJTFUKL3UBC9wyKvGgMqZJYCxoEA72Q7HOVU5tmq697W?=
 =?us-ascii?Q?FbxYGlTwOAqFwJjEUhxznth7n0eGsgLJKvKi2e9kyFsRyTjmjPlZd64a8XYL?=
 =?us-ascii?Q?GW5xGQN4Zh7Cec9R4i4mpqWoR69xp9mXlcNOOVme2sBgAarms9ikO5/2CQnS?=
 =?us-ascii?Q?if+Lxvg3gfAY9jTkZsbicGTrJZfmf+aodsB6WvFdmv14NfJCZ68U3xD9LdGj?=
 =?us-ascii?Q?fogUMWFIT2L1cPpE8JCriJ9iDem2XBOtzA9XECXNx70D6A1aAQ1zoSC3UytJ?=
 =?us-ascii?Q?QJz2fSNt+yP9cEQ1nYAWvk2URTONuBkVsJtKvAJEbozyv2Dn8unwUwqS3wO6?=
 =?us-ascii?Q?vXMDmMWXXEu6YRrTFIgpuVB5Uxa2007/WRyeb5EJoz9aKEfS8eec+tXG+zkP?=
 =?us-ascii?Q?IbBoaiuQv6uicvTMxm5FHxoeKIWN859hgvmmphGQMnH9D3Zkuy72tSiUtV1+?=
 =?us-ascii?Q?T/RuT54cxu6ZETJvkAZiZ+cg+ZLGNrVDDRMvaB4VoevuIMfEcZwXYOb89lAs?=
 =?us-ascii?Q?Ejjv8teutYuzja1Pwl1ROv7zXID4KabeuC8s+uU9pAQl15kz0bbDrQV7aOxU?=
 =?us-ascii?Q?7Vs8WovPOoTX+xHhaps5Sh3R3IxYmv3YG7J1X7obMiMtsBFrBQU3SALPo8wH?=
 =?us-ascii?Q?nLmHR3frq/lmaTvko1IWSIJOwcF7JFdizcdB09mcsq7H41zfd9BQGRLXJra0?=
 =?us-ascii?Q?aEopMY2rKRblrhWSd21SSjUxa281kYSAtw8yH7lbCAKfEz11OC/qj0j3ouC4?=
 =?us-ascii?Q?LEooaVOyqb1CE+3GQGseG94mlI6obH1fidBQTDvKoy02BppUShU83xCRv0Jy?=
 =?us-ascii?Q?L3KTpgq4BNPZ2PFAruYWm7rLVB2+Snnv1Ph6mSp66sDc5Xdg7o1ctxfLluIM?=
 =?us-ascii?Q?fJYMWpekJQplrgbxQznELfWBfE4uM2+0isjZfCiZGA/vW29z4MYStSmv87zT?=
 =?us-ascii?Q?PcKFRDlwyTxYCXLgi6U/B1cQAfgQy99jlZdnpCA9XTTNxfXb2LhK6fQImTrr?=
 =?us-ascii?Q?jUQZgdSDZNds+nJFuo54WpNF3pGV5ZvIYEsWlyozzIJPv/++alm8iUD1QnIn?=
 =?us-ascii?Q?mri7GLEBQb89XU+zznVmuZKAA4qJ/iyPpqN064BDM3h71kupraqRny44ZI5w?=
 =?us-ascii?Q?5HpNCOhiacRWY/kqS4gyoqk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24dcd254-428b-4c4b-4fc6-08dcb4e71592
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:39:37.3809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kf+WuqxhOad8P5aB+wKuGtz+NR/7F160Fhum98Vb34u4hD69AYtL2U7sEOTxyNvp3c+ivFYxpkex9dp851B3L/F5VrNvpBn6RYk2PBvs19Ij1+O3RjB3CsdqoLYYAFlY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9459

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sof/ipc4-pcm.c      |  6 +++---
 sound/soc/sof/ipc4-topology.c | 10 +++++-----
 sound/soc/sof/sof-audio.c     |  8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 4df2be3d39eba..52e6983acba64 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -345,7 +345,7 @@ static int sof_ipc4_chain_dma_trigger(struct snd_sof_dev *sdev,
 			msg.extension |= pipeline->msg.extension;
 	}
 
-	if (direction == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(direction)) {
 		/*
 		 * For ChainDMA the DMA ids are unique with the following mapping:
 		 * playback:  0 - (num_playback_streams - 1)
@@ -681,7 +681,7 @@ static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 			if (pipeline->use_chain_dma)
 				return 0;
 
-			if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+			if (snd_pcm_is_playback(dir)) {
 				if (sof_ipc4_copier_is_single_bitdepth(sdev,
 					available_fmt->output_pin_fmts,
 					available_fmt->num_output_formats)) {
@@ -1044,7 +1044,7 @@ static int sof_ipc4_pcm_pointer(struct snd_soc_component *component,
 	/* Wrap the dai counter at the boundary where the host counter wraps */
 	div64_u64_rem(dai_cnt, time_info->boundary, &dai_cnt);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		head_cnt = host_cnt;
 		tail_cnt = dai_cnt;
 	} else {
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 87be7f16e8c2b..ce14acb6770eb 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -511,7 +511,7 @@ static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
 	if (ret)
 		goto free_available_fmt;
 
-	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(dir)) {
 		struct snd_sof_pcm_stream *sps = &spcm->stream[dir];
 
 		sof_update_ipc_object(scomp, &sps->dsp_max_burst_size_in_ms,
@@ -1668,7 +1668,7 @@ sof_ipc4_prepare_dai_copier(struct snd_sof_dev *sdev, struct snd_sof_dai *dai,
 	 * of the RATE, CHANNELS, bit depth is static among the formats then
 	 * narrow the params to only allow that specific parameter value.
 	 */
-	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(dir)) {
 		pin_fmts = available_fmt->output_pin_fmts;
 		num_pin_fmts = available_fmt->num_output_formats;
 	} else {
@@ -1783,7 +1783,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		 * Use the input_pin_fmts to match pcm params for playback and the output_pin_fmts
 		 * for capture.
 		 */
-		if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(dir))
 			ref_params = *fe_params;
 		else
 			ref_params = *pipeline_params;
@@ -1828,7 +1828,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		 * For playback the pipeline_params needs to be used to find the
 		 * input configuration of the copier.
 		 */
-		if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(dir))
 			ref_params = *pipeline_params;
 
 		break;
@@ -2225,7 +2225,7 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	 * For playback, the SRC sink rate will be configured based on the requested output
 	 * format, which is restricted to only deal with DAI's with a single format for now.
 	 */
-	if (dir == SNDRV_PCM_STREAM_PLAYBACK && available_fmt->num_output_formats > 1) {
+	if (snd_pcm_is_playback(dir) && available_fmt->num_output_formats > 1) {
 		dev_err(sdev->dev, "Invalid number of output formats: %d for SRC %s\n",
 			available_fmt->num_output_formats, swidget->widget->name);
 		return -EINVAL;
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 9a52781bf8d8b..9ac03dc5a24d4 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -308,7 +308,7 @@ static int sof_setup_pipeline_connections(struct snd_sof_dev *sdev,
 	 * purpose of connecting a pipeline from a host to a DAI in order to receive the DAPM
 	 * events. But they are not handled by the firmware. So ignore them.
 	 */
-	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(dir)) {
 		for_each_dapm_widgets(list, i, widget) {
 			if (!widget->dobj.private)
 				continue;
@@ -623,11 +623,11 @@ sof_walk_widgets_in_order(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm,
 			continue;
 
 		/* starting widget for playback is AIF type */
-		if (dir == SNDRV_PCM_STREAM_PLAYBACK && widget->id != snd_soc_dapm_aif_in)
+		if (snd_pcm_is_playback(dir) && widget->id != snd_soc_dapm_aif_in)
 			continue;
 
 		/* starting widget for capture is DAI type */
-		if (dir == SNDRV_PCM_STREAM_CAPTURE && widget->id != snd_soc_dapm_dai_out)
+		if (snd_pcm_is_capture(dir) && widget->id != snd_soc_dapm_dai_out)
 			continue;
 
 		switch (op) {
@@ -950,7 +950,7 @@ snd_sof_find_swidget_sname(struct snd_soc_component *scomp,
 	struct snd_sof_widget *swidget;
 	enum snd_soc_dapm_type type;
 
-	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(dir))
 		type = snd_soc_dapm_aif_in;
 	else
 		type = snd_soc_dapm_aif_out;
-- 
2.43.0



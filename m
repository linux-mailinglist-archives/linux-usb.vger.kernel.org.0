Return-Path: <linux-usb+bounces-12982-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 062AC947215
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:37:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87BD71F2256A
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5C98C04;
	Mon,  5 Aug 2024 00:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NEMsNM+y"
X-Original-To: linux-usb@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010015.outbound.protection.outlook.com [52.101.228.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFBED304
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818263; cv=fail; b=qq5kxx9K1soIhhf/KSOcD79FOrtS81mfj1fWPr7f2cuUt+oEZJNTFSWg0sYmZOrWwJNKXOt2qlefOOgYSHkaM1V5j+1gEAoQRoLoK7YfIO8TCGlCsrXIqvgodOWi3XBm2tne68oW0EKpPNG9SrCY0wodsbhYFoGGFXAiiCRcftY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818263; c=relaxed/simple;
	bh=YzANhlxxRYqAXLpj7gdu/SdnFjIfvoworiPH44OC4pE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ljQ5Rffg4ldKGeuvREejKYmIKkLCcKUHbLBSY305RPLQLQ2BJ5wd+wHOGOz9ebyka3YE1IDkPDMvTKYEg0hexNYebmFPytFOWkTiUN7Q9CsP2S/6g2tayJUEDl/zxaGwnAIdBlhmGw05lJpOHyWvWvyQuObakMVZsfT8KQQBl9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NEMsNM+y; arc=fail smtp.client-ip=52.101.228.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZD1cHkGOctafzfyB+6dDPwFqrkJLqv6AG5jtY+4Mdd0SX1a/diF/HG6Kita+YPCsWWotwiD3ry056KlSjV2EyCkXbGXXrvPBA5gMbfXRIgbQqcjMnngq0tc1iqFnzdFPffPv03gYdXp7ZrBh7s3EvD5p0wbC+sSoMyBNsp55wlro79EH/UvU0A+vfAKfvEnwAznCAa5iACl/78zplKPVndf9uhqLHYfxTHYCa+4YN+D6/gE+JhJEooD9BtI/pNyjBJFbxCmWzavGuFp8CdOCocDeDtlYjVGovN+P2S+Z2ciSd1R21bhgrHaP1qXSWmnSeEtbVz16hYwy5lBfuMOlDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIxH8knu3XKO+bXVAdI10kw5MlguLpwB/Y24QVulcnI=;
 b=BZysqBHCqUDa3tqDoftZnIGNaD2eMFrb/hLHFsRu1TZkc9dhPXj7NkFl37xDSJR95YGEfGOT1So8OL7UeOSZ33lIoVoEnjiZE+YKzwrx1bIKyfEKmXmxd+q3jNG14d2wSDSqMrKjf8N0W/kM9xhmkJaHGDf16LIFwucFc97P+cFOCLLu5iI/3/NZuTA6kL3t6MUV+D2DP56Y/yrENXiNdYbDINwvawlm9Uf7hB6KIwxAGez3jvHnc3H2dQDQzDJeuHJDRi1H+Py6qBjoRqg0NDVtBwfFabIhQqxSkgIZ4JH9ix41mRdv3pNieWE1h3Bi9U2yE+n5BYe4VqAd7OQeKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIxH8knu3XKO+bXVAdI10kw5MlguLpwB/Y24QVulcnI=;
 b=NEMsNM+yaz9+i5wB4kqS8/vNKdYhHbUdvSIggic/ba/xRkggxXiqrjatpJsKiUWVyA0rkyFESCH6qbLZqWdDz2mGXF5q1QqFHsaeRAwAqCUHdL5FjJGbvuBP4Wt2Edgt/K1DH0xyxZ1WoS1Sov/MoUjv42yKRU/FGvMBfv2yNPA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6318.jpnprd01.prod.outlook.com
 (2603:1096:400:7a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:37:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:37:39 +0000
Message-ID: <87ttfzztws.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 032/113] ALSA: virtio: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:37:39 +0000
X-ClientProxiedBy: TYCP286CA0254.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: 00d772a8-c236-40c4-99ec-08dcb4e6cf7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YgZ3VAmhbPPgyLL1cx57Zo/mPePYGtZlypnkzJ59B5xJyQpc5xl+1B2myIko?=
 =?us-ascii?Q?42rOF7kvKRlq/4vte0SzOr369PUT0A70pOJYLZXFUkcKbkksz/75gfFNnhx9?=
 =?us-ascii?Q?uneM10mJmTv+UMRZsOHbuu8ULVPRyg8zZZsFcIQQOWIBZVNPJCe1d2W6oweJ?=
 =?us-ascii?Q?esO7viE329nagiOVYJDWFlFFmi+MQPRUKp11GzT7nQ+4kYSH3+TcAh6yebLo?=
 =?us-ascii?Q?MMBATDTX1M+ziWzaFmePBjEQ9gBTDS30PuOsRBj2YWmhOXOJ6kZ3KlE1acOu?=
 =?us-ascii?Q?ooUV6jKOSoAKZobOxNpzUpbebwJ2Cyhw2kgCjzDBAzvtouihembLVi2lbH2N?=
 =?us-ascii?Q?5UpfaQvvYX6i84nBcDlyd7t0pgsHvGPU4nhlHdzU5iVkQQKxYap8KzBgOHev?=
 =?us-ascii?Q?45hh9eRoqdOl6FLG9qg4AssSv4xnx3LFM+Y6SUWxjXQKhDtedHS2sMOngRmv?=
 =?us-ascii?Q?Q9ODZNJ231oRtT5hJRVoqk2nBJPhP/OUvjpzHPOgJcf4qmuZiwowVYIzr5l6?=
 =?us-ascii?Q?48q/ABchx31HM7PVhqtJvepRUVg8Gx7qgAbfErpgyZxda1V+cobGf5hR3w1i?=
 =?us-ascii?Q?N+XPuR3lg60cnDh+JER/51hSSrEBOxOCKprrtq1shIUN+7swvkD5nVEeJ6pR?=
 =?us-ascii?Q?poj602RfG0q4sTHg6fPIvHq+N78oGQPqLfRJE1hQ8s4LWdj4DWch77JPccHV?=
 =?us-ascii?Q?Sjhfi2E6av4NNwsEdSrQ7SC8yQbn9M1q5OqYZGwddJmhMg2+8MwUtpR66p8l?=
 =?us-ascii?Q?QeE8LPz2by792YPy95brBdbCKAt+ZHMTko1Jto9K38nuBP+uAxypWIPRfJe6?=
 =?us-ascii?Q?E1SCSwanR7gwdN8nu3Go8PmsAUcU1XUqAXwQUjmBFaGb4g9Z6zp+H9fiwLAU?=
 =?us-ascii?Q?vUM14O05VuaMmPDZk5EFP7NpZ7DMdCwbTM4ZEOqlvFxvhjfcl0rz1vmpQKib?=
 =?us-ascii?Q?KcxjbcLVqDE8o30aVUIkG6oBITImjqVV5R+3Nj1PsrGy6F21HB+Z+5HgHqBx?=
 =?us-ascii?Q?x0NrPOhBxhFiZVWaC9sqIeC9WJfvgNP/87b4mqbSKxnCDuZ3vRhGtJW0TsnX?=
 =?us-ascii?Q?VUr4Ktu0gNhGV2yU95G5CrcNQU8c1ixKjyyjw0UDgSqiCbhqQF49+F9gO3tN?=
 =?us-ascii?Q?c8PZWZwHvBXgJXCOCGoEuu1c/RGZsiAXChp+KNReW3LhoNQfHER6uosm1EWm?=
 =?us-ascii?Q?dm3SI7Wp2eX15lArKDk/jJxILkU2i7W9Lo4ShXsV3q3+WuaYOKJtp91ukCb3?=
 =?us-ascii?Q?34l2nQiiGKFFzV8Oi4OiymQDf+PDxZpgAShNOt/nuOpRkvw331fbicNYgwz3?=
 =?us-ascii?Q?mfprlOvCpOGXrDbAlqKWjbe9NBkw4fmT8N4I6u4h43qFs0tr4DFzC7NuI9g1?=
 =?us-ascii?Q?5mGCam1fUnjDYjkSwFpfX48LLntSJ+3hOXTHQJ7Cp5v0iCYM/A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xy/wCmR4W/O0PVrBnjEWxiWEDKm/EtOiq7gfd1o1erSzDzw7TPi+GxMkvkKH?=
 =?us-ascii?Q?kZXYjOE+dNpW0ofvqBmHPI51hyn1WcJDKFggUZK/YvYaS9hhwEYymoNuhSfn?=
 =?us-ascii?Q?/3+ZvqgTZxYP4kxWIg2c1M2UDkcGSI70DYE8TPpqgwk5qhpy4DeF8P4ylpwh?=
 =?us-ascii?Q?3+FC79EPi2j1tDi+xcu+bCe3UpvFQAxBsGWW9kNDSJwgDuq0w5ajXIJlNCz+?=
 =?us-ascii?Q?OdfUcZqXy9t9LesjUwWuLiujF6J9THFxkj9eN6kpiOrfbbdS1GddJch/DFt7?=
 =?us-ascii?Q?cxGRdidi7BI3Y5sNgC9uTXG3zE/v0wCJVsjth5C9kYiBgvBYVU4RZJzFlgAm?=
 =?us-ascii?Q?05BQB5PX07DyWGiUo9QdDh8aNeeXk+PnEhnGNPL6vhUI0p2UFt74A5G0hfZP?=
 =?us-ascii?Q?6BVaclPyrjNYQw5lc+GAfu9ZCiC1eCpPslCpATU+o2lUldTYwITGvTgMKEX/?=
 =?us-ascii?Q?Hcngn9t3IybcB7nUPd8m9A+5U7Fbp1QPPlKa0j14Ru1XZNEkAw/ZhgmCqVQq?=
 =?us-ascii?Q?uTsLuXoWGGvoUYsF7qT+UnKNjkSzI0QgcYL/epSKQywlnuYwxFF4Pg3S5QnL?=
 =?us-ascii?Q?0/JlgxOEejx7ISvRpEoB+43et9RJ+OVt8RUgwyr+prIy2hfJf5qc1CGDaf6G?=
 =?us-ascii?Q?PjvgIg3M7+bn8sqXfOJ6xiC18rTyBMTn43RcG+y3tQ7HrdhBPQkPOnXjjDwE?=
 =?us-ascii?Q?X8aBKvNpXApYkHQ2h6Ay/WZ/jQK6MgHNLBLHgbBuGB+ATD33oxUbO3fCVcQg?=
 =?us-ascii?Q?ctW65LmF6QhthqoPAFIzxSR27Jt47YKTAy7PLOuKK5jtJy+CpQTnRCfbqMXi?=
 =?us-ascii?Q?6lL+yzLJ6O7PLHYKFhsEpcsZcTVE74gZK9DpqsaH8h9ASFWChJDLmvvdWNKQ?=
 =?us-ascii?Q?5AQVlBV350kfE/ta8NY5GEJRaMeLsi1AdFKArK+KppgbnvRavWWn0KZyFn2a?=
 =?us-ascii?Q?s7VV8AWByitUUmW1gbOuQRYMcMjqyaxz6RmIQG8ATSE72OcupE1pfNjORHCc?=
 =?us-ascii?Q?yhC34itie2Jo7A+nvTgLB2aJcdBLki1DxDdsqgrJ2LfB+NMRxtN98jP3JrqM?=
 =?us-ascii?Q?JC2eVH8gYYGXCOqmSVSDwrYofMlOAGvGmY4uGJIi0poG1Gpg0xeXgWZX147k?=
 =?us-ascii?Q?ndJOQMj32t3ygR7/PpZYoYB+uM+MCjoPmH3I77MFlvqRdcsynAKjc7FnAXfx?=
 =?us-ascii?Q?PffH2OogapYUgXJ5RANYgmxmFnKnPfamXhQ5z/v0sT8fLKJmHzlWdQWi+EHn?=
 =?us-ascii?Q?1eUqBMTc5oAyDwFAkKcoao/bI68v6H/yTS3GMN6kJ7f755acJnrfnCZ5pRrA?=
 =?us-ascii?Q?Nk/wE36zJcJqSxmYMbAXvOwS7AtzebnDleibAZ8VswPsHR70Oec+y8wsafDc?=
 =?us-ascii?Q?zJD9oYugNrOz2k7xh1Qyis28J//gb9a41tcxHjfKjI6jECUCRWC92iyD/5IO?=
 =?us-ascii?Q?rAWAU1TCKTl4BwC42TWngoK3C1e5PhoToiZYPWqtSwnACZXooDjstTLsHdtV?=
 =?us-ascii?Q?BKH4jCQYOuqb/3yYPu9Nf6UN08c+lEhpAszNwXBqj2LsOMz7G/0QgEqqVa6d?=
 =?us-ascii?Q?6TOAC3bfaouOzo0byNT9fqOacz5SOr1kpUldcE6nzfe0/Lm2y15aRWKQUegj?=
 =?us-ascii?Q?+NytMVgbC/PUBDa11kfalMM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d772a8-c236-40c4-99ec-08dcb4e6cf7c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:37:39.7420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iNnEt6nP2eThHsIE6wc6Id0M2VeTFfXNc51snJybgRtAP++FPIu4yuuvkqanhO/DX5KiARirc8a2+1CbVSXWBfX0ZfWySS1R6LlJa/GVeyuoAwLcavhtR0aBU1//NNXm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6318

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/virtio/virtio_card.h    | 2 +-
 sound/virtio/virtio_pcm_msg.c | 4 ++--
 sound/virtio/virtio_pcm_ops.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/virtio/virtio_card.h b/sound/virtio/virtio_card.h
index 3ceee4e416fc7..db6d164fada99 100644
--- a/sound/virtio/virtio_card.h
+++ b/sound/virtio/virtio_card.h
@@ -107,7 +107,7 @@ virtsnd_rx_queue(struct virtio_snd *snd)
 static inline struct virtio_snd_queue *
 virtsnd_pcm_queue(struct virtio_pcm_substream *vss)
 {
-	if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(vss->direction))
 		return virtsnd_tx_queue(vss->snd);
 	else
 		return virtsnd_rx_queue(vss->snd);
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
index 8c32efaf4c529..40e113a2de73f 100644
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -230,7 +230,7 @@ int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss, unsigned long offset,
 			msg->xfer.stream_id = cpu_to_le32(vss->sid);
 			memset(&msg->status, 0, sizeof(msg->status));
 
-			if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK)
+			if (snd_pcm_is_playback(vss->direction))
 				rc = virtqueue_add_sgs(vqueue, psgs, 2, 1, msg,
 						       GFP_ATOMIC);
 			else
@@ -313,7 +313,7 @@ static void virtsnd_pcm_msg_complete(struct virtio_pcm_msg *msg,
 	 * If the capture substream returned an incorrect status, then just
 	 * increase the hw_ptr by the message size.
 	 */
-	if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK ||
+	if (snd_pcm_is_playback(vss->direction) ||
 	    written_bytes <= sizeof(msg->status))
 		vss->hw_ptr += msg->length;
 	else
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index ad12aae52fc32..5d93d50f24023 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -337,7 +337,7 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
 
 		spin_lock_irqsave(&queue->lock, flags);
 		spin_lock(&vss->lock);
-		if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(vss->direction))
 			rc = virtsnd_pcm_msg_send(vss, 0, vss->buffer_bytes);
 		if (!rc)
 			vss->xfer_enabled = true;
-- 
2.43.0



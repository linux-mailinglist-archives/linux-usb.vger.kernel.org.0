Return-Path: <linux-usb+bounces-12952-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C4B9471F7
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 255731C20943
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6277186A;
	Mon,  5 Aug 2024 00:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="i9FRwNEP"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011057.outbound.protection.outlook.com [52.101.125.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3CD1C36
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818053; cv=fail; b=MiT5r0EKHPgc7zHqbC2eAG7kM2ByD/6W9ZtQ+m2sldK0PqQNftgo3ELyTAOpmh2KA45pnlQCTyur+wDWSb+2FP8LBH8JdXxj0FmRVzZzz9/xaWo9DEUlOIcjnWm9dF7vduRaquqQbAFh8X6AFQ5l7MfZ8+P57wlMbx/QHfom8Es=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818053; c=relaxed/simple;
	bh=Wu2Hgbm+NG5sa19ycahQbJwlVy9dLO3eNLS0+2qPqpc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=n3aWHcnBqxVrfQUg1k3yY6oitQeiaSjsbSkWEo4eOMzfSKxXsmucZCE4Ibhe6hwhrsK1G3Ysm1tq0e8xnIv58U/DMIAGjlyZyouBJAAR2CVgdrEzlJ1P2b7l5zBQIdzsZYkTDzUPcNWQX6taQCJW+qIgx84l6ykNbOtG9rJBKFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=i9FRwNEP; arc=fail smtp.client-ip=52.101.125.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqaAbDJf7acbhuSY1+9Dml4Mo0xoQvof6x7X9Tl8wkzKT03j4antPFORXFHEivJEX36/HBDruJes5qO6SWW+fk++1CPx+ZfxvU1rR+y2UaT6y6n/JUw3X65LjgyGM0Uh8vha6N/ny2evNVOp5Fc/RTx923V0bo/B2fS1NnCdfdevDF3LcDLuFtaI9Yxu5TK8pUKGdCouF3bHaWNMxiS04BlANQ0qxm2fHdTW8JV1Ks+gGLEewbJtCu8nfLHTDCQgpbh+JhFxjx9t2R2a/yCOk5L6+W/RXJD8rZN0ULtMZ2N3E3ZEbY+WtHFSO/0FmAQCerSCp/GL49tuAMhiN7kCQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BlIdZU9HhCJ42PTLUQESOSSES0dzK4sxPfy7FuBfwE=;
 b=QqB49tZ8PB8GbMCH4bF7yQQW74hA/XdVzpRee4TAnxyV8/hxyo9gdgrzT11fbouKfLXvCyiBB3MSCUknTRhH3CGzHPx6Co1vpUdI+OXMhQpT9ZBwT6WNQ/9K9aKOeAlbMLym0lOajKEQvenMtLJh1eyn1amJfpRExICuh3qOUD0/8UXrbu8vprvihETgJl97OVcNlRa1Lj4N/IN+N/2T+FKL7dJDLkx8Vcl586YJxxtjPPHiJTFPcAnnXt2comHv+OkX8RAKx3Pn1Fcxr9vMTurpd7m+onCyZfXm4Wp7k2Fht/PDmwtCJ2kydzjQzHXlKWg0Byl8OPj2+xIb6SCKPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BlIdZU9HhCJ42PTLUQESOSSES0dzK4sxPfy7FuBfwE=;
 b=i9FRwNEPBlGKFI4LBrAPPQpbnt8Y16lL4gFsgA/duPY0ToaaRg+V2EFHAFX0a83QnptObhcscY14ilxPpXaCp85fjNPJj2d9pRQyJlpXY6e0q+4nEcsvHf9fhitlw+qEinJa3JyrKqs70sfWqVQK5Q48Ky4PVBFNZCtKYrT5sX4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12335.jpnprd01.prod.outlook.com
 (2603:1096:405:105::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:34:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:34:09 +0000
Message-ID: <871q333j0f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 002/113] slimbus: stream: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:34:09 +0000
X-ClientProxiedBy: TYCP286CA0316.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12335:EE_
X-MS-Office365-Filtering-Correlation-Id: 70572247-d2fc-43ec-717d-08dcb4e65216
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Upb9dvTSqwP1t5ytEcEom8x8LOE1x2A7LvaZ5Htq08HkG46IK05tVecs3+sr?=
 =?us-ascii?Q?5px2jowxkNxAgEYUYu0Jgb+vrydL968Mfut0HoS5TQHFHQKlILkUdoWut5pp?=
 =?us-ascii?Q?FDYvzCnMaZ3aSoWBshygp470rPYKEz73lq7GQjTm4P/zPfqvVrBT372LqzwL?=
 =?us-ascii?Q?t5G0z9jLMR9ahqpoDtzUsCncXKVfLU//2NzEonY2/dgQK8q7UIix/Nreo9lS?=
 =?us-ascii?Q?IVpmb3uU20z4w+XR+tTO0Mu6KN8xsfv2Sk6+3ulIso7BI9ySQyNIz9Tq/hJp?=
 =?us-ascii?Q?i3VV37Ca5J/FTtMeF9eSxGIX7HGLsnItkW0EQCiHFjfX3IkbTIGtWwfl1UXU?=
 =?us-ascii?Q?2S8VvoVQpZMi8x06QfBF8XYHssBXjdvT9J/BCHG2jcuuN8t8iBdc28LYd83x?=
 =?us-ascii?Q?b2fEowL/dI1Rx+dyjgqxZgbY8nyj7fyX/CUi9zTklfmuNJulcvwfNyhUp5Es?=
 =?us-ascii?Q?g9C1wDDXDiS38TtBRjnAcpWCtIdqg+JPqH5X2Qi9me8NS7saH5z1+kH882N9?=
 =?us-ascii?Q?Bey9H0JTj1gnDxYjDLAl82ftbILBH9rH4a8xZHCzGyFBKu3wGUn0tooUXBQp?=
 =?us-ascii?Q?QCaRISz1s8oDLiIk+kh+1gL7CfQv+mi09mRJ8rvJzkzK3n1GgcVAH8OKzgRR?=
 =?us-ascii?Q?wW8Zi0uGytIynWi6xpy+dW3gasdboZ9smoBtf7hC2+7i0L7I2aHhLMAHdc06?=
 =?us-ascii?Q?5BUbfef3pDJ0AVizaAJmrVuTZO6MDH+KpW+Da0AIo4ZrQJqx8KxBw3EUuPTc?=
 =?us-ascii?Q?4mCVapRJMMPJc0J1U5eCUDGKZksJ97bjbBWqe0Oh5C8SAbsT1yO09xR9ZKmy?=
 =?us-ascii?Q?0WJGJ06YkFwnhJKgEcAer/ZV/quTexR6QSizK2oFPsH+4gF3xXxLkLXIi8z0?=
 =?us-ascii?Q?6rgSRaUTvTuZO3mITXEaeKn6b0nZwZ1I1ecfagUqeIw/+ahGVt/61lX8qYZ2?=
 =?us-ascii?Q?oGwWE8szY1Gypo1Dc5+jGSNJbWvIcrD6xjfAMzLRhS1zZ7UZC9mUVYJKzrto?=
 =?us-ascii?Q?FefOfbAOvgdW1undpF7yhwtj627PLfKCEsmE09qmouk3YKh/lknqwjHQJ5Wn?=
 =?us-ascii?Q?FplL1EGfbMPGEa19i+O8xsAO4o5XUQXx0yI4WZuNWUJI6KO7x1/cYboVUeVz?=
 =?us-ascii?Q?vJ4XodFAFuRmKsbhSmBdvlz49heFPBm5opovthuNgrSnXdkQ5dJUwYISqgI/?=
 =?us-ascii?Q?VK6GTstjBNvQUomeJOXa4k1Kwq01cBv3TclZ9zuH5kTjfdBDx26g+mX9S4yk?=
 =?us-ascii?Q?SeXd+WPcEsy3SZrcie2zcy9hKdd1x2IT+xVb90s3GmK2jFIl+WGyT29rB5LP?=
 =?us-ascii?Q?0ZCqso/CRKYjObu+JGSi+fJYZF0LRKI9s5U2J9O9DEWPhAXkiVxkUN8akVDs?=
 =?us-ascii?Q?eq0p5l4ID2mPUgsW1/qPn80Uoh8p3hViZ9NPiLbLPf877hlFog=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?04A445JSX8/8svF9Mnu4WfW4djrcWmTHQJCE++CKuLb/jh2zI8k0Zufis4xj?=
 =?us-ascii?Q?yC8+JfbkMSVDZPrnRQSsaPW2BWSne+aSuqAVg/Ijlz23cr1O4NN+b1Mukkyu?=
 =?us-ascii?Q?vj6kLtwrXA+K8/iye/jO3+5lSOEx5jLFKCIsZOUZoY3/nicrnDhG+5OPtH5S?=
 =?us-ascii?Q?9lt1dldRzJg5xjFIUxwh2WLrEVApa+N0yCOc4ljx0lVI8bcx5B706oxNLMOI?=
 =?us-ascii?Q?pJsEiyqAFUwOq+8b6O98eMYcvDxEnF9FtDbx0SsrrqQUqh6euecawqFu2GcZ?=
 =?us-ascii?Q?aNqwz6tCZyv6SxTT17hUpZLLFvqFrcLFMNA9ghfvvus2f00g/LFojCg+EH7s?=
 =?us-ascii?Q?JbxA5GRhNdaw+jxx/bBE0fwYQzedNhvB+1UDtPGwQhIJptNvXAQKUOAkPVpv?=
 =?us-ascii?Q?TYXbilStbhtXJPjfa3LFVTh6FiVWZTQWk8UV+mFroV6dNZe6Z/b1KHySg/CP?=
 =?us-ascii?Q?4U9jRvdnOlqUqZnuAs01Ap6mMm3MvaaymQ+Czn7OTToADBFhhx8FHhtKKRMJ?=
 =?us-ascii?Q?dUuFy1fBDBnkMbnVvjaMxsU30jfhF23liGXz9A6b8AqwxF6ExDdo9+TnoH1z?=
 =?us-ascii?Q?ZAnjplGmw1lWYzrz+JTXq8LDIbpiReZG25oUdFZitln86ZKmy4DAk3IkROXW?=
 =?us-ascii?Q?iCxLLXax+nTsqv7DngvTIwKYnVRGJeO7cN0UkjUNcVuGiw/17EZc06TpJp2X?=
 =?us-ascii?Q?i90PwDkGLGVmMGVX3MQHYvtv+IncfwyLEqdQDbJ1NN/4UKXpS8N3JeuTsO1N?=
 =?us-ascii?Q?w+CiOsEXgtme2fS++jKbOkXRvc8ex6zKbzaeXjBv+1WEATOOoiRQXvxEpbiq?=
 =?us-ascii?Q?ybRoPGC9R5HBURgp502t0Gc36dYp98PoSxi3PcdA6HKQhBZ44hpCtXqqY9Zm?=
 =?us-ascii?Q?xUg3GgpiqBr4GzeZyJ/TbwYc5CajXHZ+txj5PooshDe82GmMKmcha+FixDC/?=
 =?us-ascii?Q?BplelCiFQupQh5933bIm4ZqBK+aWp//mK2rjUYQrax7Xuftf8Ur8FbLkl9HJ?=
 =?us-ascii?Q?YyHQECWbZCp9aI0sqIiLv9YPe6F8OXeqfiUZKRYsub/Whrd0Ubmi7+TQoxDH?=
 =?us-ascii?Q?6trWRAHddL6v0rZfFB6jSNGXmR8dZs9RFszDTQjjpRSawZMT2eQlqDqW9zwz?=
 =?us-ascii?Q?bojNjnOfXpbw1h380EFaumj12Lu6HSRN002iVmIQZSd0lNQODUQdE+8MoDTO?=
 =?us-ascii?Q?d9sEkEaLUbQNE/q8SJKQbuTMAcrdTEkBw6nlSo+RAxLGIOvDhRC5Cs+5vldk?=
 =?us-ascii?Q?mNPwNxE03LGx+dzCdYyvnR2T+mwJiSn2q79itIsA+9/3PXOpU5l+PN0K6/9u?=
 =?us-ascii?Q?f4MTFHh6fFf9jCuNui+fOgei8pkEkg37eNDFcQkp9ANhfEke9S3jIG0Hz4fY?=
 =?us-ascii?Q?EAKgugeQt+hVAyLMbpfQvLjnOAtuxBJ0OZtXb2b7nijI157WpaZXP8KuFBQz?=
 =?us-ascii?Q?t8z1IIN0V1WE/0QdDN6Ka6HAM8mfoA1jID1qBcHB0S7j92ZcRAMAqTXcKnaq?=
 =?us-ascii?Q?cy2FFMuYqtUhf0XLh3SG3cRwIqlN84QkDTQ0fbdlb8qbcM9mjnVY/8PF2MY/?=
 =?us-ascii?Q?oDECchmKXyeSHJUe8ZCc/+rZ5wP0w2sfszQVMo4bBmz2wwxi7UroUPhPG/ly?=
 =?us-ascii?Q?IY1ouzI65QPXqmxQrngzg1Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70572247-d2fc-43ec-717d-08dcb4e65216
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:34:09.3813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UjHHLWpfp2ZOg+0lp3hbU/2Ru/CQw9Rt4BrquEs0LdqC1bQm2QAUH+8LN3x7FxlrnhYPQzFDQ89MW6OZ+ElvFMHRVR6wA1qg/9zlmEKxdnDRIsTGD7outVRGNYIm+kMR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12335

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/slimbus/stream.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
index 863ab3075d7eb..e65a6bda2f5ba 100644
--- a/drivers/slimbus/stream.c
+++ b/drivers/slimbus/stream.c
@@ -6,6 +6,7 @@
 #include <linux/slab.h>
 #include <linux/list.h>
 #include <linux/slimbus.h>
+#include <sound/pcm.h>
 #include <uapi/sound/asound.h>
 #include "slimbus.h"
 
@@ -235,7 +236,7 @@ int slim_stream_prepare(struct slim_stream_runtime *rt,
 		 * data rate not exactly multiple of super frame,
 		 * use PUSH/PULL protocol
 		 */
-		if (cfg->direction == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(cfg->direction))
 			rt->prot = SLIM_PROTO_PUSH;
 		else
 			rt->prot = SLIM_PROTO_PULL;
@@ -256,7 +257,7 @@ int slim_stream_prepare(struct slim_stream_runtime *rt,
 		port->ch.aux_fmt = SLIM_CH_AUX_FMT_NOT_APPLICABLE;
 		port->ch.state = SLIM_CH_STATE_ALLOCATED;
 
-		if (cfg->direction == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(cfg->direction))
 			port->direction = SLIM_PORT_SINK;
 		else
 			port->direction = SLIM_PORT_SOURCE;
-- 
2.43.0



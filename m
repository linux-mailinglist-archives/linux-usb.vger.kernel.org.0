Return-Path: <linux-usb+bounces-12991-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB1694721E
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5387E1C2074F
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EF4BA5E;
	Mon,  5 Aug 2024 00:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HKl14j+f"
X-Original-To: linux-usb@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010032.outbound.protection.outlook.com [52.101.228.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB390156CE
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818317; cv=fail; b=pJMuahapwaHy3RILHqC/nq98VECN19oP0rbj/4Ei88VgDzhyYMFV7vcPDzLiw5uEIGqv4lOXEq/E4f3UiS8o7pQ7bXEAYtPtrfwEjzSjuOjxhUH3agzM/fiD7LmX4m00gtKgZ2NccGIgniNVFn1Rhtm4VBTJjdVD3rozed81wi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818317; c=relaxed/simple;
	bh=2XKVwY029ACuwzgxudgKtOh9IfCaKw5UPLRQp32xCwc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sX7FFFfcPDrwbGLFZG2zfCQqBBlQUGBIjJuenFJc35/N0JlXOS3qg9EB8rafyINLqgV0P/CvkO5PlZOHLVcnWi7Q4pkLGTwqz7fyK0zfIboqxehHPEUz9bW7pfbXEAeC3MLVwFMC+zWyPA8QEsFMAIoCDRkMqnyxjz7oKZzyd9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HKl14j+f; arc=fail smtp.client-ip=52.101.228.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iu4ila11lRul5NeqFxW2Zy2aqhQPdN93eUTZD2Yc+8iO7E6H3oSJo/PJW2uLu0JQ7CdDAn/jiNC5hyuxG3Ln+jdkh76Mzg5b07ai2fH6wEFLJ1/E+4eDLZsR/ifb1FVYcYdNSusyuAIlGtvy6ye8ET21NZ7mmM4PJkk5WH1KJwON0bODjXFI10rruIfddicXn39k6W8J9coFqiZ/uL/LgllWI9kvDhe2akEYGV3h2AGhwNd7S4IxcB69YfrNjc4x+wy4yz2FvkgNtxQ92U8Faplh8KLWCiMC9ay2GMtbiLdGfD/AJZO3SiWY1Ms/sGeRHmkRq1WgTRPX0/NxF7wKXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwWBPIrvEEzNINeAu0VYLeEdb6PeE3NTbUPzBWPw94A=;
 b=t2hNUvzTMLy1ekm3QMMkyGbpOdslrgzjU7yjiiaZJaY92UiQ4JOX2XRWIdwx7r7t1um6rMccY0x9RrpmVEUlHLiGB9EOBuqmP1Ud1tyIX7gNpQlgSSL+HlyTEPLdTqvRuIhmRrzJ9JvisAus0SeS4JKuU88678/e7u4gyjjEXtW+vPxQ9FuyZ2EocI8Pu9B3EyLKqMmx/ODrJ9ArW1tq/0VnO3VjVH+iFe4fTv5BFZjw1G4d3EiXk9gD9OPunQaSzPfR5K1w1hsMQkUQOHbLU10UOLelyV6X9Z9nuyZKx4FseWTwtTMli0f17bK3oaV/v3G47lY6P+YFpSGVzlA5ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwWBPIrvEEzNINeAu0VYLeEdb6PeE3NTbUPzBWPw94A=;
 b=HKl14j+fb6mtpduYW4BmunXDMD2+W7hsl/+H6psVGHXKLPFnzBt0pJlfuTfRsXUJKg1EjJQ62mqRKGnRxyr8gaG0BI53ruVekRhP5TbhqPO3FCrToWJwbRxct6BuR/4pYXop+I76FkpFW3YsLwlrGQ2jRrNO7CGTFatOx/NPrf4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:38:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:38:32 +0000
Message-ID: <87h6bzztvb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 041/113] ALSA: firewire: fireface: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:38:32 +0000
X-ClientProxiedBy: TYAPR01CA0109.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::25) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: a486d03f-102e-4161-ac40-08dcb4e6ef1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S+yzwpQxdf+ikIyepAdbNs2ZB+MBrP7cvplZO5ZITs1dDv5ZBKhdDuMZm1n4?=
 =?us-ascii?Q?xfug7gBL2m3OsM5qScS2OwacXMiRQnVTOIikA72/vLaxnsEswUkjpCliuXQt?=
 =?us-ascii?Q?8dBh688xmN7rHgLx9UTE+GKWrS204omHy+WXohxxAK4O5BWFXumAwEHCPhRr?=
 =?us-ascii?Q?TwHIKfOKrfF2PmuuZnJDaM4cDrbZ/5MX3glGoDoIk+1x2xj4vFaJuX0mOtyl?=
 =?us-ascii?Q?B/W/PAGXfNKj9IQKurN3Bd6ziL4d4WlSCy65weObn+umIImzJxkRBjkRWcc2?=
 =?us-ascii?Q?tKJ+q167t92Yz6lrdhkFCA3A6/CIecNXonOX+IwkowTKtCVIn5qn645BnL5x?=
 =?us-ascii?Q?ldEx+b2w/4wgP9sP/P1GAOu8iq1e3k1Mpv7UM5EFwq6T/yoQcCkVE4SS3ucK?=
 =?us-ascii?Q?qOV/ZmA+IQqiSiGrKyxddj1vB6tku9f1iqOdIxcPJhH/qspHjV8rEVzbvzL/?=
 =?us-ascii?Q?tRdocCQo9BYLlX3jmyS2bk8NwT8VMt6pesUEY/UpdckfLxwY61Yd6sKIXQYn?=
 =?us-ascii?Q?eo/EknZjMfGVulZYge55eJeeVYSLsSugfdnppvJujV++ADY1u7sXIA1oMtd4?=
 =?us-ascii?Q?Z3MKoglqVmWHD7mVe+ONJyOUgOqlTquRe2Pj+S3p56mvfCAGzDvijtQHr5Rj?=
 =?us-ascii?Q?kykZioOhlSKn+tMa2B+OMXLh/6AHNIkLSepV5p5RnGXImO/eQDoH9jzUi4XU?=
 =?us-ascii?Q?obhl18dhpD6BcDUDlr2uG/NwIiRFOsbbzqTyztle+/A19VaYgkuWCtRkyvzB?=
 =?us-ascii?Q?IYGnFYTnKKp696GOH5p48xVB9Yrd6thuUe/5ib7cI/RPRK1/bSEGLSMSLDr8?=
 =?us-ascii?Q?nhPkKFdAWm4FYUs6CbkvljvqYDac8OvpYnrL0Hv+aSf+Cx3+94mocXwQl5/s?=
 =?us-ascii?Q?e6ZDtX/gvBqQEXTtaJyVULi0j7tJTOFO7vpjWnxEQyzmnVMksgtotZq8Fv92?=
 =?us-ascii?Q?0i7QVKpWFs79YrtQTo9AiBpKPEXO4IRUgd3eIvYCNvhSCpFTtuujmHl3xaKP?=
 =?us-ascii?Q?4ckJUXFxC0ErVUGf4yjue8OOI6zq2JMQnEfAKyMhyw2bofxYxJfN2BwO+boq?=
 =?us-ascii?Q?xsvNomSSRJh4Vwd3x8ZH+rDKcs4K7Sou++N1OiF8ZYreIiVAQfZHridcuh3m?=
 =?us-ascii?Q?h0r+RAkFrVsBxqtA2oUyRwOOq7WXQhkW8ISpUDlEjNhwof+OkL8aXqrRqnjW?=
 =?us-ascii?Q?wNw/W2X3o4905utr6YmOPqoJi7UdMER3RJt+6dolKSWunjLj1wGdvSUmqGuo?=
 =?us-ascii?Q?cmudrurOYN44jBf124Ivj95+NJctTXjWF/BVtN+GBy4DfTGUbMIWhvfQbmrP?=
 =?us-ascii?Q?oJiJtYgVD364pqQxiaN+v5rwgaem602L7b/D5u+tkXEweWUHLSinwCAbjVZz?=
 =?us-ascii?Q?HpzzrNq53QsHPQ8uo8us6c4D5VkxgYk70g8IvZ+a4rJOCzggoQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bPhW7M1e5+px/mMX0VVKu0pH7FqtTROuJkYlHwjvBEC5bO5qeHClRZYtbRDs?=
 =?us-ascii?Q?u6mmwAR/0/4dnTZwq+pytVhQU4daCfYRmbMx6wNk8rsT9JKIs4uutj2tN9z1?=
 =?us-ascii?Q?8gC8bqluoHocQE9KKTf7DfMGxvX0YptikJ/5/ggR7MzMOIcwktXoNgBHYOX6?=
 =?us-ascii?Q?iYT3YlZv4thbqnXjy3fFvSuUc8VFteugHnhnPMQRzBjmGUl8PUp6QeL+kiIu?=
 =?us-ascii?Q?lmYGB5av92O87fRnhxPRXZ3mcH9AHc6xIokMVyOZ9aY9nZ5KhLfwvOwahv0L?=
 =?us-ascii?Q?l7Or8nue96haoe9K7GqzAPi8sOs/B537cZcZqDqTRBfr8myS38iaR/Ed3zHw?=
 =?us-ascii?Q?x05Aa6pklWS8bIRaFmCEKPNDOos/mSfk97M8EHDSbw0F4T0O5EXt4h64QDaa?=
 =?us-ascii?Q?7gka8L/ByYLMDbMJO8Ux199wUK4Od8Q6OkGdE7oVrysBHM8uoIdsbaYm29UZ?=
 =?us-ascii?Q?O/r812e/mALeztecka0rVVcqMKrJDprDxf5O4BJl+Y6l4GdQkO58NfgOl21c?=
 =?us-ascii?Q?3dOJEiIEi9I4dd0fUS5WOtOnUrPnLLmryQuott8b9NNdrRlQWLBg2JPVvY0L?=
 =?us-ascii?Q?2Buq5/C2E1OBtP9TJXIoHcoEI3olsddefUiDlW/zekl1nJgg9ok1NdSAJs+/?=
 =?us-ascii?Q?YG5E4CL7bBaqdK5lM7lKF3bTqQlFohyW/HmlRiagMUTQl668UmHzUkc+MF9R?=
 =?us-ascii?Q?bNIeM0f9/I+h6BpU4mSN7p8QfqD2EG0HFPCC3nHS30AG2en4y0nAbfeynT9D?=
 =?us-ascii?Q?YtWOLjvrinOG+gAKFajYGPXTbKYArL0U1gxE2lQECmAfxGSBWL30zyjCOxW2?=
 =?us-ascii?Q?hc6LFwYniCcY4654jcsdkJW2vagLA+WAldXbqI7AXt5N2rCEp2+OOEyAEAqY?=
 =?us-ascii?Q?P1sD2vFWV6UBGmWXQCWCWUnwg0F/Jw8tHmP8TYftUFgf+WjXLfaNpMm0RZXW?=
 =?us-ascii?Q?YIvpIMviTGw5/9BTzx+RbE5b5beDMBHWI6Ziea/T3YNgzsVAps3cb/5JDW6E?=
 =?us-ascii?Q?3inchoUHQy2xRK172eI5yIuLFqd/cXmQXsJBEHQKRdK6wrDK56Q9IIn4ej1N?=
 =?us-ascii?Q?bn7TvUpo6uIVx9pq+IZg6yV88ZSLJnHsJ2LWPNF7WyBkbCA32YU8WaB3x0ct?=
 =?us-ascii?Q?RlxPa9Voio2qu3UgMU54CmdMDf2YqQbBkQYV8LEVxWoYhjssx/fsLbmrRGcU?=
 =?us-ascii?Q?CBMTDNR0+hmoEnnEmb+v1rZ833uED3uAw6bU755WqLZlFtJjE5ZQIuE1CPAO?=
 =?us-ascii?Q?NFIKDcpZf0bOqlA9Vk7O9gaQBhzbI+/P1GMu0K15NmQveqpqwU9c4v1tX7LM?=
 =?us-ascii?Q?EgIPGbfokejA2cJguK8daZwuTNDE9M2vndO7iuUQRJ2HZFVrgk1HFVfo4foW?=
 =?us-ascii?Q?HRNDj3+OT8m5uYvwgy9pQEot56YkSu7+/Iy52ZT/WnD2zIpXkHb/j+/hr06R?=
 =?us-ascii?Q?1DvbbrebuA9y7P2jU8d/ZbTR/sAVop6Rd9zAOLNAS/qOQ/qXUvdgi1G8cGn7?=
 =?us-ascii?Q?8IAI5iA6GfRNLKJHFiaihVikw2SjgVgxSB1m0l9IPCJnyAdaAr9NTjGUYLv2?=
 =?us-ascii?Q?7k72KcWv/T3CRlgs6qXRceeuo2VfFZnfF/jLUjO37eY/WPEn1wGuFX+5D6WL?=
 =?us-ascii?Q?9CiGaOIlel+Dh8kZGlJBl9U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a486d03f-102e-4161-ac40-08dcb4e6ef1e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:38:32.7772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6UWD34KXrof7i4h2te2k5EThdw5WyQtr7TuDR/hIaSTEu41WUclyQG8vs54Ma2+LKYZTnyTORDTPLQ07b+Qd9wx5BSu9ue2gdMja2/bv63xqKpLZyMEm0ibpW0dXNPF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/firewire/fireface/ff-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/fireface/ff-pcm.c b/sound/firewire/fireface/ff-pcm.c
index ec915671a79b3..d17abff5bb1e0 100644
--- a/sound/firewire/fireface/ff-pcm.c
+++ b/sound/firewire/fireface/ff-pcm.c
@@ -109,7 +109,7 @@ static int pcm_init_hw_params(struct snd_ff *ff,
 	const unsigned int *pcm_channels;
 	int err;
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		runtime->hw.formats = SNDRV_PCM_FMTBIT_S32;
 		s = &ff->tx_stream;
 		pcm_channels = ff->spec->pcm_capture_channels;
-- 
2.43.0



Return-Path: <linux-usb+bounces-13061-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 293FE947279
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C7831C21749
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38343717F;
	Mon,  5 Aug 2024 00:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JpUHD15i"
X-Original-To: linux-usb@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010024.outbound.protection.outlook.com [52.101.228.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD7828DB3
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818670; cv=fail; b=ehkqf6W2/POIiaW+ZW/fFSwqp58fDbkmzJFdDdfGOnllDDgxtX7NZRBK9jjq4Ycw7U2mZ2HehpiyynxdskzZWAUqe3iOZiaD6FYz8TKdI3BWyNCYe5YKzDnrRAyBtqVkNsR5/07bKokykQ7YWd6cgaN03nYLdDBJkDwJRjq6Ze0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818670; c=relaxed/simple;
	bh=/Q3+p1MAlB1CX/9UtsEqtOHACoe94C/iSuWQLhu5yCQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ImWDwUNBLbZWvBZKAOxiv969tRU5YTqvjsmp71cMaVWKZWgTWXXE2LBe/CxSfJPreExNkIXYJ9faVugyxo5sabw5/owqYQNcdHr9bjYCuXsNySYKSZZYEcsq0Xsq1FP/CQ43h56HiCdzS7Oi2+yzfzTxa0hWGwSZJhaQe901wtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JpUHD15i; arc=fail smtp.client-ip=52.101.228.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rvoj0FsrZoIRZjBhE1HfI2yc7G7uSTk9FJa7A4ftosgBBYoh2c5McI4AHiD+vDjlwfvkdLUIKSWOoZ8ZweftMQ1e+5fwnaT7jQzXkENa03rPaN8ZjEXvdMvgTNkVPJanVjccKzMOIhl9aj62ltEcz5jVQmRCsixhL1Tr+rXsUAEWtnhJPa9TGtK2zW8zDomQnePhIZLnBiXCkrgNmnIWrcggL6Xr/XoPTGNq32Eb/jF8juFxKWtqv7jASvUxrXo6YtjpdZI5YtWnJD9cbLb6w2cb0rmtvRtoEgAE8kvZa83BOg1V3U6eC13Fk4d4wQreGzU/sQOaQxzFVWPtjKjn5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=120h7DuuGjXwnmmAsP8B3fWs19boYVzhA+ExgnVjOH8=;
 b=r8Ow7ge9itid7gnEasF7tJHK1JwHLAzEPgwH7MgMZV+J7zcNt4afu44Lt7zXb8milKLGFx5SX2BdmJ97ChUFBCiRUqnop93uUfoGXz2ZW1HaggpQ+Xmke7IGOpciMJLhj4Rv4vZzSQRCt7e3Gz+95Sl1rqkH0yw9bcXYCmJDiFA1eaWmEronMYkVRg8wa79fMAxWcnVPSTU7pEk0QUuJDLGx5nCEm6ZcWDFhGsMTucyz+/ilGmLXSxNLlTCfcL8ZlPWmNQNBR72BwoR0k5xIedzii1UcTTTJSOwRQvfVTem4U3mbdDEJQVDmfiGqVlrL0us3LmQ5IIHyOD9kGXB9PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=120h7DuuGjXwnmmAsP8B3fWs19boYVzhA+ExgnVjOH8=;
 b=JpUHD15ibwhRIy0CjNDcuU6FYroIfYtx2jpoqjLSOItz2ipmRTvWsJjC6hSiHgspeSwTR26PDR5wzSjXStPgZlaEBKjjCTq0YbMoBFLpzBHMn0zdhDTFrfpjd+7zAqwmZtMsLKw5LVIGq9jy50BOiCB0X071KqKE2tdDcYtdPk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11466.jpnprd01.prod.outlook.com
 (2603:1096:400:400::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 00:44:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:44:26 +0000
Message-ID: <87o767vlw5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 111/113] ASoC: uniphier: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:44:26 +0000
X-ClientProxiedBy: TYAPR01CA0112.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::28) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11466:EE_
X-MS-Office365-Filtering-Correlation-Id: 49eb04db-11a1-4787-bd2d-08dcb4e7c22f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ecy4WtwZp3Cb3j8yDnPtnB/yyWpfqEfcHwtt/UvIuYN4YDKH1WMydGxHjcac?=
 =?us-ascii?Q?K9J1JjXMXzoX6+jY+dm2JwU9FzapsPauU+kZzklvlid+bG7qjFNltrfq+upA?=
 =?us-ascii?Q?O0E5hlspP9DrwkqttjDYNyYGUSplqzg6pVJJE+GQwr+uSOqsHjBudPQqnN1H?=
 =?us-ascii?Q?YH1BP3nqFJAEsVho6lzRXDYOS6jZiA3koVN9GRVtccBjQrJIJnQAzl3VH5E3?=
 =?us-ascii?Q?bxECxdvHe9Td7NhE9+9aAxs+PY5IHipqVl0ELmsEsEfaoLf2pBB+2nQyfzqi?=
 =?us-ascii?Q?cGMIGtCsEnppD0mYg2yNWyrDHwZCtZZ0E2KNhhPyzwl4M6jTIpZtZJUl2foG?=
 =?us-ascii?Q?1fuPIQSPZ7LXnQN0DNyvyC+35YzHWHntC5VwwuYyYui32QRNO8CkeJXP6+3q?=
 =?us-ascii?Q?Wo/eAubfYZMgpnnHbCSWthVrxIyoOjsKozU+eF6lYa4g5NBKOr2CQtowMkA7?=
 =?us-ascii?Q?7WnpTzvM6K3oIomQcXQ6RKl4CGt63ew/3tbLPpCFZysXNGyctELnrgTHGkU4?=
 =?us-ascii?Q?kWOLkE2xigCGMReRoc+dvhPw2i2HoVX4mz0rdMyNo7pkIGPDftXg0MCIBhdi?=
 =?us-ascii?Q?f/i/NQT8d8aXZXMKp1b1wlmwzBBl54JHZn6OUOv3bmeyEgp0bGIQ7ObxuuP4?=
 =?us-ascii?Q?a+DMId3hwkfPK0m7JvRQ9THC9zhC1b2ysGozgDWZMWi0xjXtt9dZUT+Mvjr/?=
 =?us-ascii?Q?0k00//pfSJxAiqkEjW6UzbXAXxoMpcCGsoVlYCK/warOixALNSc4vB9h1yWu?=
 =?us-ascii?Q?2MGNvPWwcQ4GH/TKmTJwLh0OyNWC83X0T7oJbt3jdSQWEHDQgdZIBt9hl8Gj?=
 =?us-ascii?Q?W/2doSgJ1xvlbXgx3DCYxgObgAqSrpv8JHbL39MnpuxhqPHu680uXivp1pBc?=
 =?us-ascii?Q?Z999rb0HLyS24obpOM5b0Z8nGoJbQMyZDAWJ6eGym70DgsPwE9Yxt5eHJLbg?=
 =?us-ascii?Q?WTLXy4wdxbHpDdqUxpINxdtEIbCeKfS9u9EFiJ2kj5GFgkr1ZA6dt9JpJM0f?=
 =?us-ascii?Q?z3sxTLAKmY1PBg+drwBI5/QXGBqsIXHNdDXff9Rqb1gDlB50Ofyld6/0cHzg?=
 =?us-ascii?Q?9yzNuqAtlpe63c/c+sdvfj5LSfdTFGj4uu3nDdUHn9Je+KFU30lu/5a1e/PN?=
 =?us-ascii?Q?+NsCgmqVJ3NhPp7Ajt8ocDXbcpNrJXQwkQM7LePp42WyuBKW9q1xdpLbJiix?=
 =?us-ascii?Q?7/vocjM7ULdflf8rBxIaY2sI+NtqgGb1y102Er8phR4fTvvLSNMdypNpECA6?=
 =?us-ascii?Q?Mir0FQA29xQsm+LgS9L0CPD3IARvjayBpJOaNEWuFOH97wcsNT0xPnuO6qvE?=
 =?us-ascii?Q?5Z3pNYKONi7Eoubb49I+6uv+fqUINKz0XZZb1SnttxXdln2mH7sC4Rk7dx3g?=
 =?us-ascii?Q?3y+zxUp3bw/666byUPOSwlxpPFTSQeiVrJ9IGlFGrMYLrmAywg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GV3q764bWwjxEiBSGyMMD6rVLBpJi6Wa+kily9bfjLc37VdVpvTcSI2SFK0k?=
 =?us-ascii?Q?DfNc0OFo3BlHkF2DDpX0KqaGvGpqSAa7vO3qHcA26Ei52k+3HXv7/hnCKLKd?=
 =?us-ascii?Q?1bmHvGHmGztXWSWmi6L+frIPb753HJYVUT8I83OtqlzGT2Jqw6M3N0iEFcQx?=
 =?us-ascii?Q?nTa9W7Xz2NizaOjAmmmUho5ds65N5zJaKc1lunmmLlSEt3oOnYstf0p4my4q?=
 =?us-ascii?Q?k9hXwppZUzd6HToqr8e/2qVxlUlFh0/TlkrJyOfh5uK7u6vliLrg5EcRO+rd?=
 =?us-ascii?Q?/jpFaiNy2r37YefJkvXPk0pccHPYW5VpZUw0y9PpJY6MRjX+39nEsip+TsGT?=
 =?us-ascii?Q?OPaPqPCMjRbDK3ztDVjuhC6SqiNRPbANSAdwLPpW6uWlcdr/jVd6LibQlnzC?=
 =?us-ascii?Q?CbzXCqadz9OIxwKI/Gl28DMhstkXjbuIv+Ct+H1kDybrs+8T5KIY8Dsr8ctp?=
 =?us-ascii?Q?QmC4wbHh+H/6QNq98GRM3ZYZQl261TYDLvXfS8k2zgHKV6MbqsUsbGS9RGIh?=
 =?us-ascii?Q?KtgvlQUMvOmYNtnnq2Mx3tCuycK1FpjGli/Hbj8zieaLbMvkjZQPMsVMh1Tk?=
 =?us-ascii?Q?uxp6tZjuzeAIWwq0LYXUJKIDjkldnuZL6W04RDXT/5u2FdZYzBenrhDa5Yk1?=
 =?us-ascii?Q?rZC/x9hKvSwWD0Wt8gTzRnAuL3gV77qxFFLcYkwbvffem5wxQ56H9mO5kUJA?=
 =?us-ascii?Q?ojlAKsvjgpHBJ1hzdFGAMyA/uy94qeQSVhcNsJTRiqGjP65WcdHr0gAKDHqQ?=
 =?us-ascii?Q?qo9XzRXbuog6SM0jFovAENimhs8Om3Ms+lnE91mYQVQfegDnqlktxdA8X0bS?=
 =?us-ascii?Q?avzsVOu0fAIFokLtSwxpgoUqlCk0dh5B2xw9Ta4KuXX8+3XhqNm3Bokm3Pow?=
 =?us-ascii?Q?3RaMykdDXuJeWXbPWWgNkurpD1HHJJugxSz9bKA0LSE1L59J6h+NkinfNkly?=
 =?us-ascii?Q?NyIuPdCDYM+d8JJeWhv9Eerzcf3P9zQ9Itw4LKuV82pbs+l/cFj7WqLgAQGw?=
 =?us-ascii?Q?1Uvnq1iwhtr+rYYj9/KvN+BaLAPaPzc3XQZTemc9WHP0BKtEIiyNopq/gd39?=
 =?us-ascii?Q?pdbyyH0j9llHGuusVk+9O5hfDKFEJ3bUhN71YHyzZlCyJtwGXNDN7vr41UQK?=
 =?us-ascii?Q?aTOZogp7uqOMuQSyP/8rFa+KabRWU8RDuq8/Y6/wweHvnfMcOh4K6mVnwcBG?=
 =?us-ascii?Q?cYO3Ji44Kdjx7/mcKptQWG9lNc8I50fRoCQDxS0H1/FYQB0qGbgSaIRLFELU?=
 =?us-ascii?Q?g+IpFOefHGD8ArhAMUwsccBM340V7T4UBUx+a20+Z+Qh5u1HJtRxgR5ZqCHK?=
 =?us-ascii?Q?0sSvKMR2FZLvqMowrZ/mDV1njrcZOMzyrLQY7fDrP12m+7WD1DfY6g+1ApUG?=
 =?us-ascii?Q?mdSIcZdfVe4l2ZXk08WRmFarnWdHm7HGsPcRlKsk92Jd4nixVshYlpfOWghv?=
 =?us-ascii?Q?QOcoCYdqyYwmcAkBD42RULOTQM6fQGQAF3bzCJlQQIM1lAgfIWyqnpKRLcFF?=
 =?us-ascii?Q?1VIVZhJwXeBndtC4hZ2Wbc8Qt/ZGSGHTyGYqDwSBvzqGG6/Sim7UIJ5We+x8?=
 =?us-ascii?Q?yxyQPCJiS/ThJpD33c2D2+YZXyfTO4cms5uPUfrAXSYrQIV4hqsoHbXgN6tv?=
 =?us-ascii?Q?HtRZxK4i1Kxgh0N3ML0GQqE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49eb04db-11a1-4787-bd2d-08dcb4e7c22f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:44:26.8832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bRcLXZyZfrwfoNOIFjCrmI90wj58YdShmMK3+S7Us/+f4cxyjlNWzG05yCllzpyAzFjXl3Jkmm6j/27TWTQe39JoXt3HZZwnhSspavUFRLfRuKk9BTuTLduKOzjlzL46
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11466

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/uniphier/aio-cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/uniphier/aio-cpu.c b/sound/soc/uniphier/aio-cpu.c
index 470f129166a4c..8207e8fed2a80 100644
--- a/sound/soc/uniphier/aio-cpu.c
+++ b/sound/soc/uniphier/aio-cpu.c
@@ -64,12 +64,12 @@ static struct uniphier_aio_sub *find_volume(struct uniphier_aio_chip *chip,
 static bool match_spec(const struct uniphier_aio_spec *spec,
 		       const char *name, int dir)
 {
-	if (dir == SNDRV_PCM_STREAM_PLAYBACK &&
+	if (snd_pcm_is_playback(dir) &&
 	    spec->swm.dir != PORT_DIR_OUTPUT) {
 		return false;
 	}
 
-	if (dir == SNDRV_PCM_STREAM_CAPTURE &&
+	if (snd_pcm_is_capture(dir) &&
 	    spec->swm.dir != PORT_DIR_INPUT) {
 		return false;
 	}
-- 
2.43.0



Return-Path: <linux-usb+bounces-13037-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC8E947257
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:42:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0AA93B21D4E
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4C31CFB2;
	Mon,  5 Aug 2024 00:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Gd8HyXd2"
X-Original-To: linux-usb@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010029.outbound.protection.outlook.com [52.101.229.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847A41B974
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818566; cv=fail; b=SiP1QkXTc4lhFjN8hOb4+62353kC9Fo6nwgRClJCdNw8osufVokE9CYYPz3kQG61qwI9uGMbaG2yD8U1onbiNiBbGOwVka6jtvyrlrVJpIsT1MsBYQyVS7FNVRtfXhecgTT/OhrcZxdaMCuaRhSJbaj6j6o0mWXSt9znoY5CW8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818566; c=relaxed/simple;
	bh=+h2K+yqALq7vIcMq+uaGehr9QTfm0NFjE5FFaccqhro=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TCbTiijqnG9EJo1sBzvOV66j1m02/xZM8fa3w9wns19RP+Qic2tIBAWhJKo35O/hFNdEAYHUfJGzaMAaYjGe9h1JmATO3dH9oZxNvJqRCXKo1o+/UzlO35QY3iJP1zl19JbP5YhcCrikiaBxXRjR1Z0ph33s+tJ8j60b7d+MSks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Gd8HyXd2; arc=fail smtp.client-ip=52.101.229.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1dNOncWMNV+TbGn5rAo20b2msbrkb3lYtyIZwB1j7OQfhRA215jtwVF47YBcm3ljEbU1jsC+MjVfDz72O7zQLjWT9x95d2CVHThNld/gvD3t+X1bTcs6ILvllgppuGUuzAXDgYeLJeI7sWamFH7CNWJmnNpYRG64n6GIHC7W6lDZnRIypxM7ZWPhJ2619Cm38owqFu6UigeuPfMFQs+Lrxhc67aypFRHy7ZQ1WSi/lVsPRjb59Yo9uuUvAkaMRlcqNIrkLgb7wDH7xZyTNc/Txwi3q+A0zNFbUXqMu4+omgPSv8n+WIw0sD/3iLEPy5LmNaagVV4n7ZZPT6qKyonA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTQgYuupF9iQTgZtlY7vsEdTChxpJWfkUASiSmwE9Cs=;
 b=U//tlupapjmTZUCvGQEn661yaXY1x07SwMLZ6h1FZuZzAjJSumrh60a3qXPPXczG0RR3cYcA7N7TwXZ1Sd+jE1CTzjElU0k1zN7JovL8PqMYOyEMmACuFG3Wha4u8rnWDFUpSDLzE/cKG3fRdCvnYDE0QbR8afqe6WPfkR+F8JoIHcuJjJag95xU2BYbWVV+Zjo6ylUpxGz/eMVI8D7B7CcNK7Hzz4YyB19a7aFfu2Fv5vieWtO7Q1psM4YKqyGf3+q/MlqJkLZLYzL+/2DPTZVs818mOxcQeodO3Pqa6U480Q3umb/51UTR1S71bJUXtv8A+t14dHvvbiHiO3HcDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTQgYuupF9iQTgZtlY7vsEdTChxpJWfkUASiSmwE9Cs=;
 b=Gd8HyXd23bjZhEL8rB8pBhHo1aTIR93po2D77HgBoEKF4AiZTm0KBk7WCpl3/8q8uTT3XiUU2sYAVZ9tkgZ4L/44JxIcNHQc8iUoTfKnwhpoEecvrEdsmheHeoMoAAvXcyf7hr56a1XQjtfIBexvX2c/UkI0ABoDuyMsDVI9KZw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9302.jpnprd01.prod.outlook.com
 (2603:1096:604:1cf::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:42:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:42:42 +0000
Message-ID: <87mslrx0jh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 087/113] ASoC: codecs: peb2466: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:42:42 +0000
X-ClientProxiedBy: TYCP301CA0032.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9302:EE_
X-MS-Office365-Filtering-Correlation-Id: e94c4247-61a4-4e36-9a96-08dcb4e78401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?auRix8L033pTLxgddWdo6u2EP+DygugeAlHgL7DStx9LqSQjg+BpIfeZFDPu?=
 =?us-ascii?Q?MahIc/2v/+hHamSoW5JRN6ynCgSjXYMwMkDDB9leRQXbOLM+8vvdDGYsiZ9p?=
 =?us-ascii?Q?vBgMnoXK5Lj9Xy9+MCFZQPdE+h+Sfqqr0UJseyEX4uscg/VgfJD3H8Ec7CHt?=
 =?us-ascii?Q?3PrFIfGaAPJVXq6I1Kt7oiym3WAy0K4TgXuY6SDFi30lvHLZ0z002IZLg2An?=
 =?us-ascii?Q?3viEpo9MAAQ0KJaciPP+vq/CqJGEzPfpe2fkwzl3Lu0MetxJ63NAsr4ljGUu?=
 =?us-ascii?Q?b0HzoZRwAeoqAXVNgvzgCbxQ2SZD2hN+A+rnZw6H/Z9tyev5fypkD49UxyGq?=
 =?us-ascii?Q?VesOTNeD/yra7/MKF3RFMDO7ZUA3OQ2Kse/ya2XgbwYBUwZmUUoh+CLfLUmp?=
 =?us-ascii?Q?/ITv1wGUTEqwuD5MshG2yywWIZaJB9ceX8pPUDqrRfd/b26Yj6hq6BTkGIAj?=
 =?us-ascii?Q?eX0uSmzABCxtmfwKlIUy4TDd87Sf0gyMEqtiMOrFy+jfk3wtcO0Nd9DY1TNk?=
 =?us-ascii?Q?G98lqyRmCaKoAW77triSJ+DIv1yPbPynUP4AsKPxyyTL3sjV/wc32S6CqGrV?=
 =?us-ascii?Q?MaR2Fu7vnw6ZlTGVQkklfkkJlLk9dSn5a6EQAEYuroIDTz0OLwfeIAMUAuum?=
 =?us-ascii?Q?oFrmudwT5fkrW9jvmYiEF7omPEq5pKRUMAoe9DKdsmMBe8C0CCgiJvS0XZVl?=
 =?us-ascii?Q?16+x/1pI7IYK1/DdjO2TOweWkYcV5CECB3fbb0SvCoYXLdos36QuJNcL9B5O?=
 =?us-ascii?Q?4ur1dk3k/dK6JpaHmCCirbbZ3Y8FKdEfQ0MX2w9R+LzCmUNyL87T+OdgEKAm?=
 =?us-ascii?Q?AAhKQxI1JEi/7qqcFx6DIohHqnjlo9rfgAYWqzaWVJQd9dRXB/N8hzvauKsv?=
 =?us-ascii?Q?LPNzFRU1GAGFMunvDoOIOm0NfADLHz245+rtHBMX9sPa1Q9QeMk64VWvSwhv?=
 =?us-ascii?Q?y2mDTU8Bp21rKpx5zKt9UFWbGI6jU/JNGD64VW0tNrZO1t3wnSr2dAEzB1jU?=
 =?us-ascii?Q?KaeqznBk0KkvD5A/qYyEzS1fSqyRoF30TtMu2hSmXnHAEVC+HCCTx5MFXtMQ?=
 =?us-ascii?Q?J7wVrot+I0DyopZDSr8QsBiReDUsOXHetffNK+RRjBBf3b55UFTP2lWYR8Fd?=
 =?us-ascii?Q?TJefFWSkMR6g4N5hluINBrtvPpvM6EqFVrONxbZsRlPLd5qXVIyYbAoD8k5G?=
 =?us-ascii?Q?A7L1I/621+VjUYSTw/6EzBo9yw5VehgYxVWmShihY5W/jFr3pnCeJFWtOMMF?=
 =?us-ascii?Q?127GO56ov+KM3yDQoC0CoafT8Om9QG9PqPdTW6kBjYOJd8K5pT3q0y8eKO83?=
 =?us-ascii?Q?wZ/hHelWXaETvKAKsjOKoClj86K+3AQ60Ba+lk6d2mshvilGJhsytZfIy3Vn?=
 =?us-ascii?Q?PAIUnHAhInzg+jrV1TMASD2S2Qdb/uOG4uLiJdiuq0ZbIz9Zyw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sdjKV70YhnMhKrRjCVwd+SexJR4hJr/CUeIjquDkP1ovVeu412pSMRMMqb2A?=
 =?us-ascii?Q?bQD7yMNccqo8mRKvmYuFfy6ZcQ2oKHMLO7Pk7L85+PECrpb1ovdtUC1lvnSj?=
 =?us-ascii?Q?ifNKuGyeqqnqS7rJIlLiQApemN7/U5NQf/MEgs33ov2ItqIHE18ouZhJEcU6?=
 =?us-ascii?Q?t7irU/hGFcfMatWeDeZl2lbKl8bXCKsNHJ03EmuEC9CSnm8dM1Yv8BEQk6iV?=
 =?us-ascii?Q?BeHYMV4SvzyhW39HEDoJBXcyGDwsyJqGsQVtwMCVAMDCK2kDzVq7QokdjIUn?=
 =?us-ascii?Q?Aucs3A9mjJfLaiD+QgIufVrddFF4rIqZin/V51flN6KPp8P/BnP7ygC19zpy?=
 =?us-ascii?Q?4suaNvYrI7GxKyy5XfbSYHUiaoiE7E+xK/Wc7CUrphuqbUq+yt3ySvDpy6aV?=
 =?us-ascii?Q?tBwX3W7RA4bQo2h2P07A7WgBLWsTs6IZNpF/cuuWGbPw/Obqusc4hBQnfMv2?=
 =?us-ascii?Q?bprUO8zXn5whNHAmnKfwFy3H7h4wbNr02LSubMhSBgmPbiYfWh1lZelf9ZOq?=
 =?us-ascii?Q?1Ow7tvxXUTODIeUq5MyGgtYPxmHnFMRMoL5/lqdyvAkKaCkLHdxtYL+mXC+Y?=
 =?us-ascii?Q?cl2Ua1i/RngJWaBXlYcxSrWaGXz35Mbm4L6TQuy7bCNd3iGAzdaNmC0naEce?=
 =?us-ascii?Q?WSU/erxn3Xug55y23syjNXbtlwiUN/GUfUjcJ1j8R3zEyTOrxes/UI5qj1vO?=
 =?us-ascii?Q?tdaBVEzjiGHKNqI9dtAty+VEbXlDrdNuuRJj2tfmeOJCai22jIO1fuNVio0k?=
 =?us-ascii?Q?EcLBz2iGXqKDwthxWK5qTWDeO4/vP7v99r7Hmb9dzyFfh4399Rut2Z209VBb?=
 =?us-ascii?Q?G6WRarQ8mvlDFGIruZosPDwdSHXvux+UaUy/5K+Dkli3togfrFJHxaagVzT3?=
 =?us-ascii?Q?sZqHEGcgkMpPr2kXbtxGX3jw44atvS+piKTSpIxPky/NgS5axEkBvdROWQzX?=
 =?us-ascii?Q?rTu+4/Jcq2IGMFjrR4U70Mew9rlElS9LigjPGzKMiALESD3eC3+0F+7k33+9?=
 =?us-ascii?Q?H0vokf1RrEThxeUjuonpTo3/uWT58nX/TIafRlmYv5LS2K+UfqauFmPhz8ua?=
 =?us-ascii?Q?9QNfBsuF8wTqWCpRBWRIINpvv4VDNC3qJhdBb7kko4mkHwrUAzEEXaG6cA2v?=
 =?us-ascii?Q?M791hD4fdYQrgkzilN4GAb0JPzmY+PJhhtPreXtF+p6Cl6RAmRCaAr2kcL1B?=
 =?us-ascii?Q?qDTFskyr/ygTON6OrDv04SWMkF0a/7P2gJFj01/d19m6kBpDeSA+8KprryKO?=
 =?us-ascii?Q?7RgX0Ch5PfErF2sMp4f3pnuVIT9kYZXx48pETUY47hAnzqpcVnnUCQISQFlD?=
 =?us-ascii?Q?goltjq+kiEOyC0T3Mky1b/ZdaIzPuNpGX7A4/xvsZKi04iPSlN6iNLHXyfKP?=
 =?us-ascii?Q?PLIvzwnSgoYXxbL5K87M4qw/75PC0EEbjAdwOY/a1YikYD3DMzDSKfc4xXXC?=
 =?us-ascii?Q?06PnPrTEoNg604+ZlVVbTkAcWfFvKJH2fqK7eCYPfjqdcCNUYDFIoNS8fm1I?=
 =?us-ascii?Q?djCf3VVktHdXep5ZQyKF7M3EuGEuCb8w4E1SMbcb/YzCAZhRjco1NOe05AI9?=
 =?us-ascii?Q?6+3U4CYrA294tk7amCotCVdkU1Mz3QOUhst8OHCgY1ENejQSQckkosJTkuWG?=
 =?us-ascii?Q?DKoNRHGzXodisz6STS0tJvE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e94c4247-61a4-4e36-9a96-08dcb4e78401
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:42:42.6060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5lCCLMQP0vrhCqexZTrLx0Trdgasyw/HmnEfMy1t3Vr0fnWvYkQc5YaGbom+8euV2CMb5UALerY48I4afhhg+doTiNX4T/pXGb8hVrXDpmMVYMe5pZS2JpVsCxGde04
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9302

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/peb2466.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index 76ee7e3f4d9b9..7c5c575300671 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -796,7 +796,7 @@ static int peb2466_dai_startup(struct snd_pcm_substream *substream,
 	unsigned int max_ch;
 	int ret;
 
-	max_ch = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+	max_ch = snd_pcm_is_playback(substream) ?
 		peb2466->max_chan_playback : peb2466->max_chan_capture;
 
 	/*
-- 
2.43.0



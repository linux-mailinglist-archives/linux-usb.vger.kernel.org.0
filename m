Return-Path: <linux-usb+bounces-13053-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC51B94726E
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C35D1C21779
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D86E286A2;
	Mon,  5 Aug 2024 00:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SPJpHkMC"
X-Original-To: linux-usb@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010071.outbound.protection.outlook.com [52.101.229.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229A426AD0
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818637; cv=fail; b=EUNeVOaq1qOFY+pJHNFLfCU9GlzlHhxQEutI1TGSlIdLUjw05zVFlKf4lszuCGIF45BIuGRSnfTYg21BjIjbJ/UMUttj84Hdk7HMsFK8Fh7JO7KQVYFcp4upINmK41huJnZnfvAWQJa7fUR4kh4gO8Ez376kHU4Z6/7A0uQ7XDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818637; c=relaxed/simple;
	bh=jbhjJU1eRGO4pfqdQLBUv0YqlknRWt6ZqZVmtR6J4Xs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BW0pp02iPMjhJahXaQExKSijw0Pq0R2+8paNI8Lk367K/OCUIu7s4prGYlawvz6kbuXQ+d1Rc6A1J/zyhxuFvMySLcO/egvTHYy9P/HQyW+A0hTe+NJ8Iv0LKtMfw7H+WnvdOLPzpQox8oU43/fab2qAA3dYqqfU53MK4yYm+u8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SPJpHkMC; arc=fail smtp.client-ip=52.101.229.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rO6ITWmM3bYAHylSA1zzgJc+OSxwx16KFB14Gb+j5462jCvxe3RjHlEu/g9eBnf09ZcJHSx4PdxsYfwpAj+/5qbZ3QOBOK9Lqxv9Em+mCndl6O4TjvpbYeYEUQYeWanlJ4by1X/6ncKKXiID48r/wcZM30ucfQdg7W5yKTuvME6++61p9jbs680ptPdEaLHFv7okeQu/Dxzi+J4w+SJvQ/Etr3VRj58OnXDierJtM5MAh/YBF0zW/+hp+/ndgQzmAIdlIVTgoeLYSA3pqRTSEroKb0S0mFLjUvGpFo/ZxhFci77YjMD/XQMYpjqWODoc9tD8ohJOsE+P8L3L08v0sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBVcoA8iEZ4VqkO5VhCHEbhrj4iIS9rDvcRTadehGv0=;
 b=E7j5RILFRA3YZyHVeO1pdy/MsKOg9ZRKmjFEzlzZWnpXDZ76vso4bSzZe2Qr1QSf1/bV20bAmlmBxd3XtxilBmuWZLc2UWV8dwVkn4jZB5P04MpI+SYLrdtwt2X7AmEOtV1LDVj0zZo3dHGTx5F+drFrJ8ZuZKFucuOcw1Jbo3LtBoyRN5wiQUK+kkhA46b/PQdncjnciivfkPRS020QXNK7Gd/ZSwrrbG4d+sKjvMk5eu5J/M8CvHD0Rc39zzH+sVBg6mYcAfYNvRPqWoi4pyCwbcf8LUrScr8NpCxpuz2cNg6KBBX0Up26oHeXmRiMhmvIhC9CwtDCIeLpXLy1bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBVcoA8iEZ4VqkO5VhCHEbhrj4iIS9rDvcRTadehGv0=;
 b=SPJpHkMCBcRHqllUYX/TB2F5EB2YGwJwnVRdcgioyKZlPpsIWuIa0gDu4/Iv8XGIrqDWTgxK+mtypxlbeNxuzHTmB92rURPvJom9mCmOIJKhWyaKuqc7o1CqabxCEDVr+fFzYS/Tm12QlZNIOEDx+LZhIb/MtaCBf7DzLfL4kBQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:43:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:43:53 +0000
Message-ID: <87zfprvlx2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 103/113] ASoC: codecs: tlv320aic23: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:43:53 +0000
X-ClientProxiedBy: TYCP286CA0272.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: 642952bc-619a-4e79-9f32-08dcb4e7ae85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lOhQtCvHnPb7MI6LfguOO/S6N4biFBUqz17SYpKXHHyDC7pPxoi1ok8fMWIA?=
 =?us-ascii?Q?HJM/L5PbZx1pjt7bseVaNPQmAx3FlUBnS3D6RoOAno7UosNU+TYetzu4h8kP?=
 =?us-ascii?Q?WtWTVAUen/BHsU+ziKYWGToatChsBdjs7xAAG48Myu3xksX1XST2dYQqzX4D?=
 =?us-ascii?Q?CBXz8mZxXtTzWs5fQjNyo1yPhjevK39VxV3hGyU6TdcRiPhRxRGA8ra2eri9?=
 =?us-ascii?Q?nmfm3uTO03JNzW9qICLGmIL58+UMWShqTCnJ2TjpJaPy831DdTMyxuosiCP2?=
 =?us-ascii?Q?M4d817OWkIWDX38EAomyYgfd66ll2KH42RRKSR1a3LZHgN+AEJ6o5WN1y5ab?=
 =?us-ascii?Q?wKNrQfpkIwNKEA4Hw2v+88kQzASVpwCv6AEckihdMJC1OJphm22TSU1hoq7H?=
 =?us-ascii?Q?339j9Jc1uNAOkJ/6TBTc6rmmdX8QAt1CIQHV9OGHEhohYSFiz57/h2g4aQJy?=
 =?us-ascii?Q?i2yS/tcE+NbFtRlaFPeA+IHTprERJwxxz1qUayCrrbCYLCJBh736OmBc6Toe?=
 =?us-ascii?Q?CMG1W2ToLKEeYkJJMmMkTE2LXWN+NiP16SmS7AwArLfqA6YmtKGaCCS3bwQL?=
 =?us-ascii?Q?w7wwFcANj1b7jW7K9p3f40inGljKhZCpittaYptv5GKXGC2KQgRWSqPD9uNd?=
 =?us-ascii?Q?XDENUIuWUjpKcO7ALzvk2YuheYQPgiEx5HbPrK0eQ9duDejTSVm/mDkA8AsN?=
 =?us-ascii?Q?KptktVNlXEZRseh/D39ajDYmgFKX/Qvh5TDGDhiDrpfrAiZweTCqXI8yr6iV?=
 =?us-ascii?Q?0mu/XB7hQhOqHEBF5HPGcrUAtWtJ96Td+/owpatKYZrdFkS0/WAV4LrcAJj3?=
 =?us-ascii?Q?uUVq0bGHg+WVQ2ozk19IVoBridigW/Fiizvel6UoNIx10kcmT1k5vVDkFF9W?=
 =?us-ascii?Q?KZTl+vrUiQdXoboqUYkm9Lzj0NUDENXvHCo7d37i09ABzrqqiJxoT0FRQo7Y?=
 =?us-ascii?Q?WID6REvF8YWUXyyt+ODev1E88ffgGDApYwwaapbIGPV9LLYf+bXKVw4SNc3Y?=
 =?us-ascii?Q?kfzFdP73RbA1VCsJua6hOPgAiFLltVaAt7UD/+bpVNYb+YsaoXLUnJNp0sFf?=
 =?us-ascii?Q?HOafjenXWO/7fbgionOv0wzxZMbu7GTOfDbMtdZ7uLbD8ryd+1KYDOZKVjjZ?=
 =?us-ascii?Q?3ry0twyetb7hrIYbAUG4jgRLQXIRUk9k+vwKv8QAdgTOhw1lb8NOmjmMraSr?=
 =?us-ascii?Q?1PWCQVPYP7mhXatjoL0X2q9RMSAX5yv9QZEI3SFKAKTaKQPkjBi2+SItd4fT?=
 =?us-ascii?Q?2xH2akJSVH67DZQVV9K7Bw3vqspNkAR3mZ0qlE9KxLdI6fPnGrMBYKBjbKNZ?=
 =?us-ascii?Q?cvAIoJgJSEDvw5uFDf8a3PxO0RskGht0NMlKYDqVf8FhSTB8/F0sBeK5QbdJ?=
 =?us-ascii?Q?GxGpU5XvBg2aH2DwEXdpG86MpnfiV0ikocnQnuECV1nXqxH2KA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZJv6Rd4WYc1fdNnTDsGQBdybb7PZ4agrvK6M0zhvn17ULKi/CjsWNPc+YEnT?=
 =?us-ascii?Q?kIJsfSFSjbOT29yTzXScOZMmYrzovk1TyRFSc9RGu0gJnqFXyrqYvaNWeWq5?=
 =?us-ascii?Q?N4DVLhgfBkE1UdGNnIrq+aEcdu0L274P5FVUtp62ZupJmQ565f6x6Fd/AxJZ?=
 =?us-ascii?Q?I19fhMe4JXm/gh1qLUKvCqM4hNfQfI8TrJH+i8yRInwFiHTQSoJlI3QcJTgn?=
 =?us-ascii?Q?l6lC7sNMtKRL3gjmtRcIkP8kr5y6Zrnj10gX35XukmF0+XvRiqoK49O8o7NO?=
 =?us-ascii?Q?CZkHHf8eP5K3YPTpFfAwDclpTKwNPnJ6qNd2LhkRhX3STbwbYBCuBoBUFj7m?=
 =?us-ascii?Q?DPqTHN2YJ1E2YMBv+MY4ZRz8uYQdonzuIPYmUqgkZM3FxpuPbqFq4I2LnUcj?=
 =?us-ascii?Q?0ogG8n0tHznt8V0HPVazv6qWqKYVi+x3lCXCfftMJv3NCTnKK1pPBjhcsI9o?=
 =?us-ascii?Q?cUVf1E6NDl2PHFY376zmJgDpAHgGxa7yFUr07bIJtGH7UAg5WDLqSNSoRUIZ?=
 =?us-ascii?Q?t9bZaeiYa25Md05rbTBULZt6SmtsJzm1z7n7V5VUXbpcnrQbb3bsreUKaHNb?=
 =?us-ascii?Q?HcH6XsF+nCMhsGkzJYtAiatxbPjuydxq5dlo/acPqatVekRoXU/f6YBeg+ek?=
 =?us-ascii?Q?d+mRSnphyWz9e779bzbzBYkjzUnxHTGxqKYQfVVjO5GvqCcqRcZi25iS5Uww?=
 =?us-ascii?Q?El6047RvD4wthOjUHKt+3aKiqZJma1mxXvuzgufQn3ibd8UbcYNlFtBV/l47?=
 =?us-ascii?Q?teQpFCLB+zimxg7RRa1oBE0UFSxn3yh0kQ9YohMDNHXGPbSyO/7NRU8neRv0?=
 =?us-ascii?Q?eLOJzIBWbcTCN7huZh9Q6pOLcXXpgEFbVQa6Ei/cSt8cTIU7jkkViRwHJFv0?=
 =?us-ascii?Q?45gOCzWQQTg748aKQv8RQprfo/jGzW1AcBgrbfdTeIETjgefoA/7mKVN/Mjj?=
 =?us-ascii?Q?u4IsORkmhbBFfUjfjJVBUEhOEQAH6fYi3oocXwdAdFcis16sqEjR7k2c3dFQ?=
 =?us-ascii?Q?ddS5wS/LF2G/r+c0TfKR3Z+y73nAoQoCZeoWZdHCaIy7b4YAPN/mzGgVggdk?=
 =?us-ascii?Q?3cekK8UquuaA4opPvHJ56S91yW9g/hyeZtk3Y1/2dibbWIljYNX+t6WBa1j2?=
 =?us-ascii?Q?T6CRN1aJMZPnH2kbNlOZuSRq71EyLSJwVR7RdZnE/RldwRiLeDI8zuxMuQp2?=
 =?us-ascii?Q?G+NBdzu6HEnySsRDVPnYQm9hg4dYrSqm37NuFJvhlsnJmw6OcF0OaADylmrU?=
 =?us-ascii?Q?ueSlEQQ3BciBoE0JrL87qD1lzCtkJNd11YQ+jS+LAfu6L/H3uKea6DxpnJoe?=
 =?us-ascii?Q?lj5CI7QQ48nHLmLyAb7E+/nbwkgR4MvKJluD5+ZckiKUGiDbp46Y0Ozg3+XW?=
 =?us-ascii?Q?MrZhEEtqyK3GNIJ/oliVNFLPloWpPamqHVxJMMJsF5DNmRGEHGhV//mPHpuV?=
 =?us-ascii?Q?mC0o5YfYdRJqX3NLaBS2qepediPIFBulVJYYh1O9H8muwb4JgIaJ+f2tr9Zb?=
 =?us-ascii?Q?9MLDR+YO7tYNcsQbjGEx51tfes21FIQJ1zz0/mobyahgGpeSU6z/ol0NGfrt?=
 =?us-ascii?Q?I+EPelne0XqfCIk7krAkHvmVze0JLnWZXym7naZnggj+txlRvWBhMYDnwe2D?=
 =?us-ascii?Q?2KX9HLDeWSWBgje5afcBx7s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 642952bc-619a-4e79-9f32-08dcb4e7ae85
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:43:53.9023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ETM3EVmeYgllWNwJdzPnHIpYw+sgQFkbbvX2xbxX2DsM4/X1CoFnVnGDQrGgIuTePa8P5c+rB4vUmHX5j/Mc/0zxlNwPDpJg/Ae1STj0ISw8x3HJc0UZFhhhWDsj14+9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/tlv320aic23.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic23.c b/sound/soc/codecs/tlv320aic23.c
index c47aa4d4162dd..06dab9d9b7576 100644
--- a/sound/soc/codecs/tlv320aic23.c
+++ b/sound/soc/codecs/tlv320aic23.c
@@ -342,7 +342,7 @@ static int tlv320aic23_hw_params(struct snd_pcm_substream *substream,
 	u32 sample_rate_dac = aic23->requested_dac;
 	u32 sample_rate = params_rate(params);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		aic23->requested_dac = sample_rate_dac = sample_rate;
 		if (!sample_rate_adc)
 			sample_rate_adc = sample_rate;
@@ -398,7 +398,7 @@ static void tlv320aic23_shutdown(struct snd_pcm_substream *substream,
 		udelay(50);
 		snd_soc_component_write(component, TLV320AIC23_ACTIVE, 0x0);
 	}
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		aic23->requested_dac = 0;
 	else
 		aic23->requested_adc = 0;
-- 
2.43.0



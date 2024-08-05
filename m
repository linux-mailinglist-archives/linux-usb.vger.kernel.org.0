Return-Path: <linux-usb+bounces-12972-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FB494720B
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68DC11F21BFC
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8066138;
	Mon,  5 Aug 2024 00:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iB+GHvTk"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011024.outbound.protection.outlook.com [52.101.125.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFA94A0C
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818185; cv=fail; b=fY/6izWnlho05n+eoTiDc1wzjqxSuosPfQ2iirRw1eHMYtSO2FPtIXJUIfowjxWDRo3OsnjeEBvPOMxQqWQqFCtySPugOdwNcc0yylW5AX048QarUq+9zdG/W+oPwkv+QRbepUhZnpo1fskZYt8jZlDNnrtJaJDdqnZ+TcrvbsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818185; c=relaxed/simple;
	bh=Zf0N4JmGAnOLoh1BoriMrjrvUgifTzRyh2cB/qWe8uM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HcF3zofApJSJU0je5lClhLENy0WTGBCo2+LdpiJuUcIYx5FNlsbs1DwvkvnlLpaBrEJtEHNFNUdKsD+UKRn06vHBQ0SjExLxCvUlwaSIVf/fh+aViZEmijUIVz3lCxia9GbOIWjy2CNKVve08GAoRg4cMOj7OAC1D7Rwmf8BARA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iB+GHvTk; arc=fail smtp.client-ip=52.101.125.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lr+arYGdTWoxGijZ+xnPwu8yrarCka95CeXtqbCVdeoiyN+9Bm9+vPKTWPr+beCXTABW3h4k/K7gUTDIch01o0wjYnUBrNRyt7o7KDnAL+m6rAlHIPCtKqq/xjc/OGsGBYN8R+jJIG/7Pig6KStDWbB5t7OAxsrE5h0VbELzNO7conCEhbL7qYrFAQ85d9n+j74/SChmO3OJQSOjFo+AzdpMGEC2QBUHilKIbswaNA1ElRdqFXaZ5WJ45ZA4VPWvC3SkA1FpquBEWjRwb3yZR4ckbpzTUo//xLf6XPdne2qL8jUs55OiBCvq9gzfNpbAUAbY3EepEdX5+c3d3CsDvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9sSF6Gr9RkUcV5wPZ5OOdlEGW1/a6F1orDus/TdiZI=;
 b=WKQEn6M+PQIQ7Eqlgg35YCgYKae25auw/sAlZzfvg2jajv0qJUBH8wphQnf7gga1YqGBUMr6aa/fbOTl50X9mbXtXWFUr1YwflVpVoaW2UQNkDtAJdWgrNa3FvR4XVjEJbBkFMdxkFgPIBRa1CGhm4aX6SaRMqdZusZaKlOdrjXt3AYHqJtoY2Z4pElqbZkl++twnFzDICS1En2E7md4/Ri9efYUvobu1R8JGf2LrLWgbSDgIHrRrBQCO/f7FYAE4gNW+vSYVIDOW2R5Cj+53NcsmNcp7VC4xyBVbTaiQUbWljYE0feXf86xYKmboM7T5VixxHMKXGvcRUywSCo8zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9sSF6Gr9RkUcV5wPZ5OOdlEGW1/a6F1orDus/TdiZI=;
 b=iB+GHvTkYiwPpRxyfBluj7K7SaM1oZ3wyMXTJlUtmGJVsDVYArXwkC7/0tx+pcWT/cMJFYwHerEG7wZfGbZIFN9hlTPDSYn02/mtNfY0ds2BM/FYXxjZobXcKi7iLkEMMijhfLlmmlOPS1xP9jUJ6zKm/lTHF+WulpahDj40O40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6318.jpnprd01.prod.outlook.com
 (2603:1096:400:7a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:36:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:36:21 +0000
Message-ID: <878qxb24ca.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 022/113] ALSA: pci: emu10k1: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:36:21 +0000
X-ClientProxiedBy: TYCP301CA0015.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d434ece-4546-4605-d4d3-08dcb4e6a0e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q1VHNuFOPkXWu0LVLwrdS/7E8fHnPmKte+ykPUsGzAOwqkQ0xLuOA0ndQNv3?=
 =?us-ascii?Q?R2nRzn0NYzn7FGxarbtljLaXXtNBeN3pwmKj4FZIk0kNXvDZ1cpLIJDc//YS?=
 =?us-ascii?Q?s1M5mcbOs9fQ/B6qefsegucHZOynUFaajUTbotrKArOhoduo4ib+ObxGDusa?=
 =?us-ascii?Q?tF1AdqtuJIbmoHnR87TyxvIWnyjg7NSJqm1fVcetEevZ/iMkadx35Vz+4sGs?=
 =?us-ascii?Q?c2K4AjWi7vlakDU8wCGbSmCFmm3ad4qzcFezHsAny33Zp3X5aoiRDpQfUtiI?=
 =?us-ascii?Q?cA1sq3oHmSNZdUO6P075UYeuD93bbyM4MnQqpuWC7behjJkCbBLX+SRbJkzy?=
 =?us-ascii?Q?WsmmVSpLx8jhwUjYDzyeqOWY6BpXvl+L7d9h7QRuv7hASnWMWubwLJWWlEHl?=
 =?us-ascii?Q?RPFRNNUxVbWl9x+MZ8tsvu/c5Z0Qd7dT/9HP8A21Gpl5zDljePUsi+62mltR?=
 =?us-ascii?Q?Q3u+pZlAa/Sc25li798Yf9epJ4AlNYLbtXBuNhdCWWv6pLaMUO7kBOeWCLk+?=
 =?us-ascii?Q?df4N9Y+bTo0joMGrRjytJbIpTs7CHZWApD8rDqBKTEpQJOtULlVgCg4n5Fbd?=
 =?us-ascii?Q?OV4wetHM4pC7qcFu8k4PfM5N92+XRxWq/6Bez69O7Zb9Q4JE5y50iY0lOVYo?=
 =?us-ascii?Q?wCoNNXhiRtqgcw5/CNWKS6pjlbnZW7bRiDuKnP5Xy6IInyQDHko1ZdoYgvqM?=
 =?us-ascii?Q?/bAMEpPhwXgtHSyLw1sJ78ylI+5sJQxtK3KMcaCzEMFr0FFJ5WmDnfo7MVr9?=
 =?us-ascii?Q?Z4dusca44cLqDH4/T/GsVbcvilfb7GaE3ofFA4XX6yypc/OCqD5Hvs8dLgTF?=
 =?us-ascii?Q?GrGFQyhgaDS9DC2FRXntohTnxzgtQcKceasTFoVZs7kY8LODoaWV3Vosobn4?=
 =?us-ascii?Q?I9EarCn6KcOLCtUd0Xed082F8R/qhf1kbhjrYb6nTC0haDrnHpx+8kyxLsIn?=
 =?us-ascii?Q?3memRceBrxVpW6Tr9OtZbOZZwgWAZNdUQMRCXVMXsyVSlF6ll2cgwWrTovQ/?=
 =?us-ascii?Q?z6qr5LAhMFil4RrPiXeYpqye5hY4s+BVRbEGTlKSov6b6wZgJI23LhNSyATl?=
 =?us-ascii?Q?guhA7TY3l1JzwhhuOIxNmLrUktuE/qsmG1xgpacDaPydJqay3lgz/+x1K1Sn?=
 =?us-ascii?Q?OdkW9CtYZEJTiATAOOHvRxAesG2tGWzQLqfTuVDvPY8A+ymt0TDuqa4UoCxY?=
 =?us-ascii?Q?V/AC3cLRqBppuzZQFEZPs7CERiNLRKgvK+vvvPb01mXB2uvNs6iopfQpCdM5?=
 =?us-ascii?Q?Pd56tudwF5sP1F7ouoFRTXxOTBChmSEkbxjLOtlLt73opEUubv59wW9+vQ5n?=
 =?us-ascii?Q?5KA7Q9y0HyEWTx/UJ7bvg3nZVdOPGDSjm0rLcUp3NGF6uIB+4NAr7xxDimJB?=
 =?us-ascii?Q?TteLPAJMNDFt44I5BusIuu0pz016KhtFiMafltLzJK/JUhZcUw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?shcu+zRHWLUHebNvLxtHvClt9Ksep0ib56WO9tUQ7DoHmOegX6YeCSk/IZ71?=
 =?us-ascii?Q?+NnbydJnhwUP0hHQ3e4TDfs3OufUF1cinKu8aeRsnHgKbgeXYv/UmvtYL6E4?=
 =?us-ascii?Q?XCBbgkp7hJU7XUQB6248RZKYRDR66kwJoCsxxGCCwwzxYLoCyHr6oUYd/rQf?=
 =?us-ascii?Q?L3Juce2VF0EXost+Qr0VOVbvkp+pzdICf4DN0rnYw5TpmPuzbMqujg1F4WCr?=
 =?us-ascii?Q?GOUC46CXnXfQLO0YCp9ALVd/uzNUSeeo1muiugjQXd34nP7MJYTASD8egp31?=
 =?us-ascii?Q?ULt1bkIFagMgmKC32E7iCqnNb3e7GY0ZXCtpHwgGxoSIOEbkeWSHs5ecCxUV?=
 =?us-ascii?Q?brS/1OqyZHTYwZAzofYfaVvr8TA3rwFu9IMaaA3OWZ19KAT6whNWF6gR2K9j?=
 =?us-ascii?Q?ytUtFC3YeGG/l9SDAPGuboZHmvTSilDvsYOmi10ycB0G0MVKZf1yUmLG+Zd7?=
 =?us-ascii?Q?RHJT7eeJGx27vRSUYe1JTrT0IshCghzq+3TsjS8oXloTFizgUitzyY4589MN?=
 =?us-ascii?Q?A5osVLCp4D2aOJJr8AZBYbAiJJJfBCCtgC/pMYBUmvMrjmg276117gZ7Npjq?=
 =?us-ascii?Q?FUxlhvKTsXwS2xsUG3KOlJ5I0BD26i94sDuSrGbNrgYc+PUQH2sX38EepQ32?=
 =?us-ascii?Q?WjkfvWvV/Aqr8N/NtM9YAjC4mIR18Mvf4zBVKuZDqJljVj2Odg04P4kEvEiZ?=
 =?us-ascii?Q?1j/TJ5G+FwbCoHs7xf1TqmHHxk4Ntpx63NU88gOW5I8SZhFKmJazCqoyXpcF?=
 =?us-ascii?Q?qMTFLY00IWEh9XBMk6DA5umcf+TuymSRNKjbc16MqL/CsbMo/ZE7V3t6iF83?=
 =?us-ascii?Q?YW9FGQdiK/xl/CBedJAWs5lS0SKwd+YLiWUHFpKn2qrvdkRPuH/4vOsTKc33?=
 =?us-ascii?Q?24kufd0Kk2L+DeOKlwaRfi3AxYq5nugFQMsA45s5e5WfZAA7VvTvoT1BG6n0?=
 =?us-ascii?Q?2BqWzAl5695G0o5SW2xyZoUq6Ioxs0ohC6vtbevViX5JfxnqWNrbua99UAAr?=
 =?us-ascii?Q?DaYTz9jpQQFXvqnxCSp9wud11Y7CK8M+UMsUTy7yo9evOCfIiKxrb9iXSyvH?=
 =?us-ascii?Q?NqCPj62+I9CvGQ08MMPtW7xwB3HSCe41+EUQgM3JYwjSKiYgbSBtoxzZU+t/?=
 =?us-ascii?Q?t2M6bOlSnmus3ERRoa8ibbfvkHOLodrHH3XI83u/gE+cBYCPGmPlFqaM050+?=
 =?us-ascii?Q?eSKjPWLCDlVnbF2NLNW4U9eNNTB2hg2gyEfdQV/NMx2Q64SeJnXvDnQySA0X?=
 =?us-ascii?Q?KmOYW7ebJ6tjTQGfIA6C1IROlzps2Vz0bFNodr1kPFPB4To8UwREHBrkzXrQ?=
 =?us-ascii?Q?hwv94yCvs4rx9PFBHKo0jvU9IYBjNoRMwOQBctIXWk3DSXaVRu5r0nXJPNGd?=
 =?us-ascii?Q?jdwhfyC9IE6+6EtIm2Uzle2y26oRrwlGWOjDJ6YL9sXeR+PICDZYpyrV2aDh?=
 =?us-ascii?Q?rKhGCCOtxpk2mSwJGJ06Tp0SwthpyOHHtv6/k2f5iontIIw5wjr3RrFDr4rH?=
 =?us-ascii?Q?SERbNOeEjXBsoH5bsqw+v7K1eNZC1Xa5/cHSpiIWyNduL9k5jEt8fb++oG1+?=
 =?us-ascii?Q?2hCDKriL4rAuI+Feg5/r211VT4ioOiO7/Ww6jZXe7nlpmiWqpb/2LkgG2gFz?=
 =?us-ascii?Q?EtUMHmoLQrLhlYJ8qBQ7+vE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d434ece-4546-4605-d4d3-08dcb4e6a0e7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:36:21.5866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3oO+4PQmBOBUcgCT+mUQIoy0hZQFfH9MP+qOveooHXR9WpKdSrzEFEpxfZyjmcEe8zEXoyZe54w3dkKxfMgAZH6zHhD0JtSK0h9tvrpogpapJtP5zfmgm0brlAD619O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6318

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/pci/emu10k1/p16v.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/emu10k1/p16v.c b/sound/pci/emu10k1/p16v.c
index a9a75891f1da4..b174b392b6aee 100644
--- a/sound/pci/emu10k1/p16v.c
+++ b/sound/pci/emu10k1/p16v.c
@@ -422,7 +422,7 @@ static int snd_p16v_pcm_trigger_playback(struct snd_pcm_substream *substream,
 	}
         snd_pcm_group_for_each_entry(s, substream) {
 		if (snd_pcm_substream_chip(s) != emu ||
-		    s->stream != SNDRV_PCM_STREAM_PLAYBACK)
+		    !snd_pcm_is_playback(s))
 			continue;
 		runtime = s->runtime;
 		channel = substream->pcm->device-emu->p16v_device_offset;
-- 
2.43.0



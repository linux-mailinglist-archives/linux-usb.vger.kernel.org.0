Return-Path: <linux-usb+bounces-13035-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 285C6947255
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B2811F24765
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8961D540;
	Mon,  5 Aug 2024 00:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oP05d66g"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011045.outbound.protection.outlook.com [52.101.125.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B8D1D52D
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818557; cv=fail; b=W2iSSD5A0AQIdwnIZRCKqFjx170Pbj96SrM3vUO1ky9piSkQ5ZA/I53D1qomXBpZjQamATohBU/EL6/36wVL8K7/MCuk2dL/1o5cUUH6dNDoxglGMJSZGERZdY/tQgCrKt8hVDcQ7O/OLZYTrbJHMxnrcZdN7FMyohIrCLTPw2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818557; c=relaxed/simple;
	bh=eUF616s6zXlMAKRt36vKj8LWNVNVLsDTreD1RGWU/LU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gfoRGFW+JLGEi686kcXnz5DKRrJDoMcRjlYmVvE9Uf9BPm1M3W9bKSet9g0LoyZOIIsstubGt4PGq/Ls4ZlPUFiFkcHLMc9Z5PwMsoMdVjUqkwCAZy5afXyU/FilUo2xKJAwPOcecB4h+IepTBIRXA4jG7fwjJDdTQAjFSkmyr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oP05d66g; arc=fail smtp.client-ip=52.101.125.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4h/1pQzCGekQ/1fZk7IQFrk4czoVupRHOcpJr+/z8QzT/bUxAMCzLEt4M8rI6FRtDTpPLJ7lywdgztkabuHPZXGGcU+Ry4XjSFMPXMOaEe/daNezEWwl3aOJJ7IP3uaajqXHXOXeOfOjAv7L5oNNCgKZrwi0Hu7MFN/4Th/CmrHSg8C6JW4msQhPHN/nw59WDZepX77ItOqvkGyvYXeD5luV4VsSltIIGQyp/p43dm5aw1loSc90xP/nKn+Q1SFBo9Hf9XwySN9QjO/bdm4zfmfaLvc1DPzJcU7J+8cTRmiBs1PVWt9k7n6/NjvYRiz0/syXca4Sl8VYq1xdMFRIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SljpfhQ7BBWinue7aOjkv6qpnUwf50Sk/54Z6Keh9HU=;
 b=pIes9Y1UkXz4PgFeGp9JLstKPV6aLdrwStheGVuYkcDiGcf56fDV9G6faNIwh7q4XDHtZOfbKoWQ+TfyY/CehQkVe2jfLonNYiLS0cw4L+V1hnQWlp51lQuBcmERH3FJDkjBepTr5YhSFDYBSRXelBWXlgi7Lg8E0x09s/3P9CqTg5DvOqQTgHQRBwJjp7zjXYd7Brnui4vWCbI9Fq5hMf4fnQaf9q4sVG0VzF0/WIYby/c0Ty+FlqR9zO0rQ0/+yk1BeGgjjH9FLf2vDq2wR4N61KWXYWgvSbsWP+xn13/s2Tdu55hzMEBQIyFB4ODGj22AL6ZBBryqKOFG35sYdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SljpfhQ7BBWinue7aOjkv6qpnUwf50Sk/54Z6Keh9HU=;
 b=oP05d66gNA/rIHtfUqZW/N1xVoAp4lh0BSCCFmBFZ3oEgyySJy3sB2hMc/9ySwFLNmICVxDCCKz+4L160LXAHpqphXvYGFhkGyD/SuTNTPK2cas1tyx29ASreTzB817st0HSN6+fd8q8YeYnSL0kzcRqTOK/f9IEQ84r1PaFu4o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9302.jpnprd01.prod.outlook.com
 (2603:1096:604:1cf::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:42:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:42:33 +0000
Message-ID: <87plqnx0jr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 085/113] ASoC: codecs: mc13783: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:42:33 +0000
X-ClientProxiedBy: TYCP301CA0035.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9302:EE_
X-MS-Office365-Filtering-Correlation-Id: 78216c4e-0510-4230-4fb8-08dcb4e77e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bTIstk3gSbTeBAy0lAhSA1x42Y7pSoA0Ak/bBZHNJq8QXN4HpTxeeG7u2i3R?=
 =?us-ascii?Q?PDBr9MGCjgB0FeQJBAndDMOua9aXVyiankqz5uSNOKl1XcjZKrOwKxn8/AFi?=
 =?us-ascii?Q?CoOiPpdTzhAxrtebgI8D+Rll35dx8JHZMmB7Cm5OFfQJQiT9vEM+dzwS3bRQ?=
 =?us-ascii?Q?fytln4nq6CcGB8tHJs4KHE4NVeJ70k1LxDi1pHmB/06Ik54+VnFMZG4xNDKE?=
 =?us-ascii?Q?HnIwk6dWIab5IcNrFvlT2f7+BwqAVQ5jYcJPo8czk5NkftV+gOFeTObRDZCJ?=
 =?us-ascii?Q?nbBguprmzC5gERgzfn+wOY94EJ6BclpDixqbs6DUlqzE0VHa6JPPg4h1+WfJ?=
 =?us-ascii?Q?HR/5AACR/+uUiEzu+dIwHd090be7plo0pnWE8g68P3Ldw2rkOsWNrgILcAZf?=
 =?us-ascii?Q?+PHCzJg46lhKkYI2pVr+/iYBFZnWI9BFCOibU/NCM5ltNiycR+XVQPWAX1QX?=
 =?us-ascii?Q?G9ID+qAYG9226LnXBITvjWOAH6tFlEADMUvixaKoJ9WUBWQnReSjCvuMj+Mz?=
 =?us-ascii?Q?gL0tPsYjIG27LHpu02Kz4uNAncBnUHD+YSbxooh2L90JX6NU26ocVOApMpbB?=
 =?us-ascii?Q?RHh6A0uiw4HYzT/HFW6/gXBRjBD4VyMi6XEkkRYI98CNLkXfTzT92S/j5Lda?=
 =?us-ascii?Q?bW6icoIqjSop3k0xQK0/kXGayMwrIy5+wFF471LCZ2gPK61x3M5Jad/LfHqB?=
 =?us-ascii?Q?Jbh2xAaqccWS0mKDf4ELfCTibl3jHWwoaSFFTDalN8hqu7PkVA/eEUxxa7Xe?=
 =?us-ascii?Q?gmf4TzmPqtjE0XlrtD1L9+DrlM8FAC9wBVr3Mk3OnJOQes2Kjzo1fJ8q7Fyv?=
 =?us-ascii?Q?OSkD9Xnh2ZH2NJG8SJPzhVgIuM4k1131NOv+2FenME1CTJgT8yOwL9lghDC9?=
 =?us-ascii?Q?IdVSiLnabhQNWQr+WsLcooHD3ajYyfCNZ3q9+LasoCQhOwQHHMqwhPxLiQFr?=
 =?us-ascii?Q?W2I1dQ7LE2QvH+6KeLORbi39h/iJ/jzERKs8m+PC7wty0EoWNuF2SjkEu6lM?=
 =?us-ascii?Q?MfyjrNeWSi6lDHXcDrVbier54v9yWa6hgdQD0r1g0AopCoESc7KrwVN+KkTX?=
 =?us-ascii?Q?yLeAqTWJ3A8FkLMa+OT80/CGgLPHD9HH4iUdcpJZy9RcMNCPtDfQtSkLNcT6?=
 =?us-ascii?Q?VNegVlnAh42xSImtZ4KMf5jnzuOGPBBp5zqlYQIe/ZSv59+OkBxLWs0K1emH?=
 =?us-ascii?Q?xWLcEvDmelYibTL6Dcmk56rzCds1fTgDcRYWxfC/1TxG+8LHDGvGinV8PTxy?=
 =?us-ascii?Q?jPzWE2/7iK607nltqOVnCf/F9QOSX25Hh8oKz6jB4+aiu0icQwqbiIp4aebb?=
 =?us-ascii?Q?9hRSYfyAZvzEDXjNMEtjBL+v3D6ltNX1LkG3u0Y95DNTmpsb1/vvRnljIjoa?=
 =?us-ascii?Q?aHGr0vcanr7ZhGGRcMRN8KLcym4A+4iKzxZjWeyljxYdZi5OOQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EP5Vk0jFr7mPFuxk5z88m9Gn5s9cdhyUWxwa7wtNcS7V9u2EWRMTMBMkYV0W?=
 =?us-ascii?Q?k/Xolcs3DZLLA0IawlCsNwhHvP92GTHu/Nt2klrx1vbatdVUcLreZfHoXx26?=
 =?us-ascii?Q?RSrbYyHQ0t6/B3omIDR4aH7quPEPBhyfRVXPsfJ2cZKh4IRizgwPuv+5qfLV?=
 =?us-ascii?Q?aUH+qFYNbnWpeV//efdPefxxbkXReDkU3t2asv+uMJjPMlrTpCLT+KQnvtY3?=
 =?us-ascii?Q?UP5jdsSy0z/kDeLS+zUghmcTeQgTsL6fLV9FmHr0A4pvdhNplSiTGxBIqebM?=
 =?us-ascii?Q?ZgOB64uLJjKxCjHGge7Uv7EJVp1dOYdLXvQl0obcN9cP6Nwd7SC0+SXozkpc?=
 =?us-ascii?Q?GNpR5xsIUxVUAwduCfwFOB5iQ5Ew2ZVmyH3FXjTZ1qG3qsrNqhkrRx5/qy5E?=
 =?us-ascii?Q?fEDp5XXjKYEIHtlbG75oUwm+9+kxyMgT4NCOntmnHsnpRnpTlMuN7snO3wCd?=
 =?us-ascii?Q?1fJFnQR4XufsAI3pJRd5V7d2sZ8tKuGVnFHgxO9hiEyXhhE7xwXs6rLtJ3XI?=
 =?us-ascii?Q?Q3aiyHw6YxVyn9YXubtU038cpRHTfwMGzXIrIenxDTr14EZPtC98ckXB5GMo?=
 =?us-ascii?Q?GYqJV/iJ/89yvubCmxXd3DBTXuTGUGFjNRoiuZq6MF1wtTPSlej4Atlay36W?=
 =?us-ascii?Q?KjOU2IjVi/oVON2xZF7aEkgHhUAsoBVIbdbmopIqTSnVIjZ8TKkphm2zQaDh?=
 =?us-ascii?Q?8R3vBveVST7nIWtXYlFR8MKwVVoHWaozZsqMqFW/zp3bq0KLUyaFkcFBYSGX?=
 =?us-ascii?Q?WmAISf+Lcaub4GiuPSlF9VGp6RAzsAkbOOiQmCx95NX+Ra1wxmyqsGyIZdiC?=
 =?us-ascii?Q?+M+1XU6qwm+8anOSGZY8kuLDTjWT6fQLk7uibrUynk0QmsVnmIwHy09Gi5AU?=
 =?us-ascii?Q?wl1BJpoGq9QQuInnk9PaqferLBAqvKk0wwP7nIpH8wWht6+jzCEwZZrqKdB3?=
 =?us-ascii?Q?OmjvaU/e578fVEUJouCCfppXBoY3XgIpVu0peVYJN1Fi3R6s3sQ60d5HXhDj?=
 =?us-ascii?Q?WamCOoLNYMJJ2k3qFW8I5ePBldqC+E8C0FuwqO5/HRINJgzUwkoH5OWYHQRk?=
 =?us-ascii?Q?QyAkMZs0DWzTpExzv27Xe9bZx+sjRoKByu8KEXRjQvYJwdK9lZC2EfiyxKfb?=
 =?us-ascii?Q?VrqWx1xSk3Qbu5oXRyxF4Dhku/UfUx/xWQNmU3zp9dPuysR0TB7gt/joF1tR?=
 =?us-ascii?Q?l3OaMtO6EWsxyJJMf19VNAGW3J1X4nzNXnDlhIYRJRPPPagIpiH2iLBMJ5SM?=
 =?us-ascii?Q?OCFL67VKAeJXJ30FdTS3AfmsjwHXSrHFD3XKoinotxTpa5XxNs2LJV9umf4c?=
 =?us-ascii?Q?g1ubmGklVtQSTGTcfIUiiFwmrW/nmS48CB0nfz5YIW4rTj4bONM2DJNHDBQA?=
 =?us-ascii?Q?STAkN8aO3SjUtMcxPFQIo/t3nnEcImkaHRA6KgnOecLa4gBKntVs7V/Fsr9l?=
 =?us-ascii?Q?JoxZwmJdAPhQHYEqGIy8xrxdeWHNpQV/fUmwH8M5ULzQbJeRRm7mUOCwbFOq?=
 =?us-ascii?Q?tPHDmtllEsdKwXwdjl2eKbYoZqlSc4twKnEGRUeuR6nq0Cu35LIlgyUXI7Rv?=
 =?us-ascii?Q?PLj/SC6pLn6zzOXAVA8pCmzXzvBpgT6oOz2ULqj5meRQRZq5NVRdbaYrwRDe?=
 =?us-ascii?Q?5xunn9RRylsCvDupAg2EODg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78216c4e-0510-4230-4fb8-08dcb4e77e76
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:42:33.3027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v/zEmF/nCErEH02s8m+DBzws4D05z1S/Z09N+gF2tdF7sabRjqekae+n/25cDLWHcbEN8+c5p1ln8/YrqNBKeEx47ns/7Fvt0q2vSEpeWjOXtzu3XgRoPpneU8UXqdx5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9302

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/mc13783.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/mc13783.c b/sound/soc/codecs/mc13783.c
index 086ac97e83866..77f9215699dbd 100644
--- a/sound/soc/codecs/mc13783.c
+++ b/sound/soc/codecs/mc13783.c
@@ -138,7 +138,7 @@ static int mc13783_pcm_hw_params_sync(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
 {
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		return mc13783_pcm_hw_params_dac(substream, params, dai);
 	else
 		return mc13783_pcm_hw_params_codec(substream, params, dai);
-- 
2.43.0



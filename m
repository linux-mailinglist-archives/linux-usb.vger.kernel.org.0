Return-Path: <linux-usb+bounces-12966-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB385947205
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3774F1F21073
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B80748A;
	Mon,  5 Aug 2024 00:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pp5HFWXs"
X-Original-To: linux-usb@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010053.outbound.protection.outlook.com [52.101.228.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2593C538A
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818155; cv=fail; b=UOzc6/F0zGrhAt0ZSlZc0bixdhutIuSZVQMIIoVH9yt0CiFlx+eFOnV16hZkgY3/ciiTm7N+BjZPTDXUhXZtdZbdQqq0aFf8DPui+xwNmNytM7j7xMYgalSFOefAVLQNPtJZkKX2qkVqm0KIJ/GfhXfesp4tNVaFouHSmnIzJw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818155; c=relaxed/simple;
	bh=efROVIxXFFDrkgrp4i7G7cCHG1tkzYRmOhl8NYg1BuM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Ols/sLTz9Yen7ziIOnAfISlUz9I7XVKn2qGdBqwYIwh2ee4qqnp8qnnHMiTpslLct547r8nHgBbG/SrKCrojEo0f+rUPqvyJzC34ydMDAiGgqFEJDq1yN1lXTpFrN1wDIVs5rU3YaDryarRZndWgJfB6df3/fZ6F1h39JRXyC8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=pp5HFWXs; arc=fail smtp.client-ip=52.101.228.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i8CxDSFxHiAJuetvtGJgYh1Ds6XhHGUE849zVjcKiPs+AC+mwM3j58greumKiSJ7BaFbuRJuJIl5ELfAtRpD1QQKJIQEI5KUYsuRPZ1CDHb681EifX4u43N2Cp0pmMFeIlZ8JAwbBDffxPhSysaOUZfqCeX3lnL38PqCoIn6c/pPAHPhvzFv8BNIBYY2JCGe45l43eYJNL23ZmeXxRPV4AJtsTRnoXfzKT0EyEsKJAtkEfHRaZqMrYVE551fk+l2VnHfi7uUcmL9L8iyPxS94gWBzHUx3GeVNP/WcBWYwV8YCYj3A+Sia4yR60juxGySJgmA3oWEw1WxNvQ8fxPwVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFL9gpwDt2LsE0MEC39up1Sdk6A+Ag6xb1TieCWb9KE=;
 b=BSxTHbYHWnzDCKZNXg6c36T+Iby+Va2NJfacGfSf0t1lDkBw+LZMnL0rARmR4G9V94R1Vwd6bYwUGKG4/vWSwJyKJz+Z5zjaJXo+rxqaFcQ1lVH9PyZIQs6gugDWuYvR6nmUAIyDEtFx5A+PcmoKIl0HcikXnB1gSjNf23hCMBsq/y1MbUFxpBnrjuQ4/6bH54dGHSfKLexl8ohNTt8NyWswZpYu72ms3bg0rgURAmBgWjD66aiAbFj3ffcfRw3vCBd9oH60pbQQYdIMRvH2Fb2IRrt99ViFw3sDX2bCJb3gIjcN4CyOD2Q21Oi84fESF0CRkq/W9wpuYY4qM4lUlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFL9gpwDt2LsE0MEC39up1Sdk6A+Ag6xb1TieCWb9KE=;
 b=pp5HFWXsVzfGbZ+HtQOT2ZyR+CvqMsGoqINU41jTjTA1zZtF3g/LtLxy0+ONsusyA14COEVLHMSYkCuvAKjA1t9+qzzX4nUcglxNHwjM0zNNN5rwzJwHqwaeRnOoSI8CsbHC/rgThoHt3Wl2nQTxbilEUByATtDwQWwSAsbmIVU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6318.jpnprd01.prod.outlook.com
 (2603:1096:400:7a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:35:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:35:51 +0000
Message-ID: <87h6bz24d4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 016/113] ALSA: pci: nm256: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:35:51 +0000
X-ClientProxiedBy: TYCP301CA0028.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: ca727641-1632-45d2-e596-08dcb4e68f1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uGt/LUn7LXlCiMvgnPKfNoKUm5mTbeUFaJ9N38Y9AMUknZ0XkRCXnybIBoox?=
 =?us-ascii?Q?glHrwuOE1KKNDliOIls/UY2atwtRdOWEzLYfmP/jByVFxpHekVzhCSuwsXIQ?=
 =?us-ascii?Q?qcQH9CCj2HmC2AvQj6l46TowRmoL6x5c2MwaFNFnXguaUlQmGOxEFcEs6JJ6?=
 =?us-ascii?Q?WXB7PeUEpctVqyAT7baeUDIUpwlGbK6feCZKobmoXfXvrGVp/eV1BKnE5Kc9?=
 =?us-ascii?Q?9URRuLu9nk+L1evYjOBXRn9BMXwiMFpLYdMdXvceHI9RrgpOPwS9XiVZ+695?=
 =?us-ascii?Q?zDbpgmuvweOvq6Xm2RWIC3s1Xtx/oPrmRJoQqVterzotg4WpGuq1wbzBH3N7?=
 =?us-ascii?Q?LbRzgpRKsu5LypYEPUxaZG4aXCEc7qKgr3NRabY6GF4O5HFZz+QZaSNW9xqq?=
 =?us-ascii?Q?/4eT2TBOpgAmjJlNbcz9yPFS4II9y68ZyaVE0keJGrlPN8WoUu0F1NLJYXS0?=
 =?us-ascii?Q?eRsl/GEK3HPWo3jaoaNTHrG0WDCgZ2D2ee6efDlMCT3Nwofc0KkNih3aKjvs?=
 =?us-ascii?Q?nnXd+0mrJgCqtoFS9scyKFsRXkGKlz5njGBK0oNp3wbVHmh8LNy1glc8ioTO?=
 =?us-ascii?Q?Xpevcc4Y8JCIm1VPd1vyMZHGc9ZdvYH3yreslC7s/WpL3m3jhcpBC/qwRDjg?=
 =?us-ascii?Q?KyfD6rXgf26J8Yffkm975R7xR2Oz4V7E5U309sDt1glKWcKMpX/yUiPpFbcT?=
 =?us-ascii?Q?3bjFsd6J0/03nXx6OnUKE37QAdAQtIY7jM4UaKebfzgkaCPkMW6dVZKjZUa0?=
 =?us-ascii?Q?gDHJi7xwioInmsEQnxH1fyaVoT6/OxMzhIJjQMg+EFjVKVjdFMqd9M/ELoL7?=
 =?us-ascii?Q?85YedNNGvtB770fNGfuSMg2VisvnvugWZ+LOTLPKyBrx/vYncEiOvrz9p3rT?=
 =?us-ascii?Q?pOkoo4DiYahTBxGHy4wTrKsuVJFSUME5vTHkto7A0Ulr57TVOCtObHAK/0fn?=
 =?us-ascii?Q?3atpGe5wIYOvu8VKypsPTETYjt+rBlDeEKRV4998awZrCgF1hNigegKzUbE9?=
 =?us-ascii?Q?Vmuo9MwW8EA5MHhkX15qe1WNkVmWrn5EvDfcGh2GQ0msG+9+E6U16cT3STek?=
 =?us-ascii?Q?n6cWJ13alEABY/Ss4ZUtaW0OOaB3Gx4wqSpe+h8bbQg6fZIJw6Z7EwHyuWiU?=
 =?us-ascii?Q?bUvIrEdrDOgWDCKbGh7SmP1ELZ+75/sEiftrtxaEeoHt/Dd8hrQIJYW6FZBf?=
 =?us-ascii?Q?EfVGl8LBGKhuc1uNEsdZkay0P/bQirFj7W7NwOpORyv5SRgB5YvTR68UUJxC?=
 =?us-ascii?Q?aZJm81tDLVy6+n53g85ULyrx6HUks+ThMmm62WuGx/qyHL92SmbDi3ZT3J0w?=
 =?us-ascii?Q?MkxYOgQ3LCnG/Z2POETu2VUge82kTIokdA2FuiMmIahKsMz8R9UgKuZ6pKCK?=
 =?us-ascii?Q?pcIWXjKDEl4cm5Ck4p4z8PxfqrTioj17lF3zPGDKYmYPb3LQlg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XLCf+g5+lAhFAlhACkqEtQgMFrqKT+cLv9OIIi+P7YtVah5Xs7VUOe7uVso0?=
 =?us-ascii?Q?K4eD3K8w4vRnNQ3Gw4FwPySk4xmYHWXBx2+m1dmzash/3SeWNCCiAcraOvkN?=
 =?us-ascii?Q?I128kiwa6OrnOh/JyoFAelnkuQlZGYJ2O8aBm01B9sfBX/o0BAQSwM6JsyOZ?=
 =?us-ascii?Q?ciW4buG2dSmbFWat1bg8+thrgajbxJluj0YgDJhLBQpWZVjs0VBRMUH7XNgX?=
 =?us-ascii?Q?iOQkqBTEq4ATc1E356d/AHmgimLF0SjqAV5/rfKrVCJPdXeKLOJIQoZmVcKP?=
 =?us-ascii?Q?E9uoQzpUocHUjm3YTf277URfNGsZBwHb7HmA5wdssASPwvG9gC1z+/K1mhA+?=
 =?us-ascii?Q?T32S/QsvFU5/DeTOA5AWD+1pkX0QybO0Vya/oEHQxHcoYWYae0g+oRDs9kzu?=
 =?us-ascii?Q?XBu2fzW7bBB4P8GUI1dD0CFYiKuPxFMqow+eR5PT2VseIUVPa25mpidGQPG0?=
 =?us-ascii?Q?jfYj5VXqTFu/3msfa43hrZKNJ9hknxnB0nuNsQHlAPLEYZH/je5iVeb3Tnrw?=
 =?us-ascii?Q?kKIs29nZO38hIUZ07SiULD1ZhnIGShw8t0Gld5SvfEkPbFzd8bV0llYg1vp9?=
 =?us-ascii?Q?lX8DSUmNVQ00Jv5xmoFD88ZPFWtr/yo1fcCY3sUK2hk6aGEzDVr4rtOxqo5p?=
 =?us-ascii?Q?ONT/BK07bL981pg3yuenjLqu9I4Mg1UY41eGe+ylwXK1QZGqNlUPpaXrkyLI?=
 =?us-ascii?Q?plrQ7QejpPYTH3jHxwyq+vl+Gct7Ycl9Gr2+/OCHjU0oDH40qAI3WpLg1V0V?=
 =?us-ascii?Q?sz6rkSv6RnCZLHHYRdu/078UK8nZM3FwiVnjPOHwby6OEe8BF4m7m40LFuz0?=
 =?us-ascii?Q?CqoFCWLz6igqOkvPlMYLbCx1r49G+Oey1M8wCSW5sUN744Wf1kxY5hxnt7P5?=
 =?us-ascii?Q?WJ9xPU8g1uZBeRCGTslHUHlSVsxXsn889Rrr7W34eJm2v7vmD2I+gn5jWQjL?=
 =?us-ascii?Q?CjUo37jNEoUI5emCKhNBOkvsQCHEy6Hhpt9iJeZ1kSxBfMESjLbz9sT92hd9?=
 =?us-ascii?Q?BGWM89oLnhUwwoPTGlKtHCGYoxJE3kO7+FScVNTRJlVZd0B35nNDJh9+WwDk?=
 =?us-ascii?Q?yW341JY37HBIHim18+GBb/pHChKtbpHmwY0DLAXn8AgUjTN5Q6hOOBuwo2DV?=
 =?us-ascii?Q?u6U6oeoS2bGHJ43xMlJiupiD69vVgOLT55pHNyR61mRQ/EzCTXBNYtyUiGff?=
 =?us-ascii?Q?cY+63wsg7RphnkgtDcQ6MT88icZ88SkfXT5tXaaYkGMpkXWw4h9uJiCgMXc8?=
 =?us-ascii?Q?hxyav8cga0wwTEwy7SU9qmK5jFbF1G+MxNtic1vHIESNv7lV6Nyf88s4zNrF?=
 =?us-ascii?Q?ANr2bY+bZc3ktdcbzWwZgglP0ZZ4uyi7JfqtEZi7/Sr6QHe2fe92aNShRNyM?=
 =?us-ascii?Q?65x+AOw/adGrXT2RKmbMQr0e+ZaOc0geNPhhvxcKL79bZNuPIgrAxWhupKy1?=
 =?us-ascii?Q?i3bq5eaSSGFevqiZYWexOzMqLYrnBjDjRzcrzkRAG6QliopX6+yTtNZTN8Dh?=
 =?us-ascii?Q?RjFk+miIQIgYrgfjyq84trTRnYraIf2urglEZw4Dezg4w2wSfR73XklOaVAv?=
 =?us-ascii?Q?dtSnMAFUCpQpvPgDkaaOadd6a5+pREwqWI70JCWBwRP1X0gnNfHdBLxZ6OpA?=
 =?us-ascii?Q?K/GTwrHGWPkgL9qNaz1XBq4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca727641-1632-45d2-e596-08dcb4e68f1b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:35:51.7232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8kID6u46NKW1TqnQS7qPU+CI9FNjmVTdSmVvnau5w36PW6IKN64MeDMKp/Oxz6V0i0oHahwoHJrG/jwL98K7nKUsBIdwNK0pbv4hLYnUxGMlOwangNCd1ac5nPZRP9UD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6318

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/pci/nm256/nm256.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/pci/nm256/nm256.c b/sound/pci/nm256/nm256.c
index 11ba7d4eac2a4..4ad3734796ed6 100644
--- a/sound/pci/nm256/nm256.c
+++ b/sound/pci/nm256/nm256.c
@@ -332,7 +332,7 @@ snd_nm256_load_one_coefficient(struct nm256 *chip, int stream, u32 port, int whi
 	snd_nm256_write_buffer(chip, coefficients + offset, coeff_buf, size);
 	snd_nm256_writel(chip, port, coeff_buf);
 	/* ???  Record seems to behave differently than playback.  */
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(stream))
 		size--;
 	snd_nm256_writel(chip, port + 4, coeff_buf + size);
 }
@@ -341,11 +341,11 @@ static void
 snd_nm256_load_coefficient(struct nm256 *chip, int stream, int number)
 {
 	/* The enable register for the specified engine.  */
-	u32 poffset = (stream == SNDRV_PCM_STREAM_CAPTURE ?
+	u32 poffset = (snd_pcm_is_capture(stream) ?
 		       NM_RECORD_ENABLE_REG : NM_PLAYBACK_ENABLE_REG);
 	u32 addr = NM_COEFF_START_OFFSET;
 
-	addr += (stream == SNDRV_PCM_STREAM_CAPTURE ?
+	addr += (snd_pcm_is_capture(stream) ?
 		 NM_RECORD_REG_OFFSET : NM_PLAYBACK_REG_OFFSET);
 
 	if (snd_nm256_readb(chip, poffset) & 1) {
@@ -356,7 +356,7 @@ snd_nm256_load_coefficient(struct nm256 *chip, int stream, int number)
 
 	/* The recording engine uses coefficient values 8-15.  */
 	number &= 7;
-	if (stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(stream))
 		number += 8;
 
 	if (! chip->use_cache) {
@@ -372,7 +372,7 @@ snd_nm256_load_coefficient(struct nm256 *chip, int stream, int number)
 		u32 offset = snd_nm256_get_start_offset(number);
 		u32 end_offset = offset + coefficient_sizes[number];
 		snd_nm256_writel(chip, addr, base + offset);
-		if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(stream))
 			end_offset--;
 		snd_nm256_writel(chip, addr + 4, base + end_offset);
 	}
-- 
2.43.0



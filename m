Return-Path: <linux-usb+bounces-12977-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D962947210
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 601C5B20A24
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE4DAD5F;
	Mon,  5 Aug 2024 00:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kM70r7qo"
X-Original-To: linux-usb@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010063.outbound.protection.outlook.com [52.101.229.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5943AD59
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818225; cv=fail; b=PzY8ImyvqyrXk7duws0LfdPGwuJH9MzhpPNqli2W/FwDjBbYe+ETGAWJBJiaYiArwGl8JryEn7UYVjB9DvSMMgfPNXcuWaNV/B3y4ex/Y9Kb21pInBDfqbvD3B8QI7lfRfa6qch/yumPSedzxs54wKhyK+KYUImtFZcDiRaXcgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818225; c=relaxed/simple;
	bh=CaYz35U0BrwmCo0iOY5skcYXkbmMfwDHib/aBG/5a3E=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=p6hjZYEvbj0Xl+zl2qguTQEiIYIPs1UNou3IX4djcRHgOE4XXXehsaRw6T+CXD/8WzEphrNoRc/RtV8ctukpChoK/7RstxpMAuEuiQXfmNqKO7/HcMMKOLlCxYNRaJkmYWf0s05cyCLv/yXu8dLaIK9FHpe9zsqqjtmKjbMscVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kM70r7qo; arc=fail smtp.client-ip=52.101.229.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJDfgdsgD7IPtAApQwBHjJFfaBBcNbp71Dmf7x8uWXO44mth1DhM/53glToQ9V2AdSuB1YP1P+S7oHvKb2cIz406JaPjUTiDQVpeJR3Ea2qkX9iqgOJPXFIjso7BpHruk6TOKz+XARYJ/YilxvymtSY0NIalt8shnyB8Ql08NexWK2rBg4Xae7DhRWH5IFq5gDqa4rJ4lrTVEw14sL8vAU93G4CVGydT4yswJxRJb4sAcPGQiQMUcBlVjd88V89cMf6iZSS20RPMzQTdbwsuKJ+na9RsvGcTABMCsmiXOH+79539DJx2zrloHzRb1Z8UoY5jC8AIuEWRGRQ1Q6+7Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5aejhi9EUF5c3ufjhP9ssq/Ihfsj+f/SlWVNf6wNVA=;
 b=j29dIbrpwuamE/MrCy0SxLUok64Cxy7luLCL16SUphleCtW7BABpmGOmMla8P+bHe9xfbDyzXe4Ut3tYh5WUTxbZSmGKI1XmQ/hmrw9N03Lk+/87Kj3I/M/IPg6adkRh77SwfWLcWVUXCogi85ooZLTTRFZ1sMBWCWjDCDlM3uf3tuv725wHdRwpjvayUnsGn5sAkZ6tIKOreRW3HFEaZS5BlUb0WIDtr0k6vLMpMae3Q8g+1XUOe8R5zr8PhFcAEsohkzfq42JEdTgW7RLdUWkCK7UJ6IlVl2tKU1v0yvzry6gOQnrykDHFkGU/gMUfKttuUx351XYJiJNjTOZUpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5aejhi9EUF5c3ufjhP9ssq/Ihfsj+f/SlWVNf6wNVA=;
 b=kM70r7qoOR2xJTIfQcONaITaDv3A1jKrHAv1zrtfRcBdXXEII54zgZn9YypE7HojwGU+TBHS8yBotVIpodOOEBrhYLKVDRv4OplRdDyhJd8hCSTQu31kJONAcu+oJ1bfOayz6/W7ZfLRevILdUQpZShbVlba/7NEMDPT/feDubE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:37:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:37:01 +0000
Message-ID: <871q3324b6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 027/113] ALSA: pci: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:37:01 +0000
X-ClientProxiedBy: TYCP286CA0243.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bb0c2cb-e5eb-498b-c9da-08dcb4e6b8c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u93rzA8ZTF9hDvGeZahsw6NjeGg/eRvSX/Zrox9SxzEsEbwYhBqcnv6Jo4pN?=
 =?us-ascii?Q?bBoo4b/1l+L89bxF1RvHYxW8GCV1VFMPKK6HxImvl40k+LI1NAaXxwPPfoAF?=
 =?us-ascii?Q?pbtUUqi5pDA6Iryb+xEy79yVgiwQwC+gg92xdAgX/ARcJEhx6//MiaGT/LuH?=
 =?us-ascii?Q?x0hWs1xbXV0EEtywO7VTmBbnvjFbqRPRcCJeAmRXLIFuwCB+L4orK9QrOzgP?=
 =?us-ascii?Q?59VF7ECaXwZBvA6HH5JvNXwX6aDsTcd8S5rWaQDgY5o//QmM7bDjoLko2qHi?=
 =?us-ascii?Q?uorBgvMe7md0VAcV/rbbeZ+1R7kDOf8Ye1SSr7Ttl/XfAADSRNAb+N7dk8+z?=
 =?us-ascii?Q?A1xW3sS6JiqzopWVFuTmGK1eCodzTxPugt/klUHLXbgXuDuPtpjjM1Ya1/3o?=
 =?us-ascii?Q?IToesXDLfbvLopqbd9/fKyK0Ir/oX1kH3d6G7tbFlei17lAR6slFJdHF0pqO?=
 =?us-ascii?Q?Zlod17lKI49IOi720g82ek9kaEfTb8azf7IvQzKOTTzCcYaMGxer+ML4TOcf?=
 =?us-ascii?Q?UhHrxJ4yJocUmBuAS6rzsNeGrssLo0Gs0VTFiNAxzDNehjtSNHypEYMp55lQ?=
 =?us-ascii?Q?W5AOSAHOxUpJfioIwmKB0xZBPBGIzBW+1bt+b3slufB2fJp917B+pDgPBhj0?=
 =?us-ascii?Q?8vQnW94ar/BRG3jPF4mheUonK11fv6C6S2qcWiLoWvX09aDrt8RHRTcVnRL4?=
 =?us-ascii?Q?AHw0G2Kk5xk33F4UmYQL4TfnXKwq+WFaHC/us9KMm+ca8wEDsoMjf95tV7wP?=
 =?us-ascii?Q?mCajSdEO07Ois+KncplSc+T1zSZhHUPedD/0iyOh/k+xr6QgOX1Yg/foVbcx?=
 =?us-ascii?Q?Yy60vCenwFBAFsDC487GFNgk2F4Nu0RKdupfVuU3y6nSB/6M2C1FqCwsjg94?=
 =?us-ascii?Q?czYlz5+8kNE/398yDVHj/UT8H8qIr0sGNfdSjiOSFLqWBTrzVYZRLHEDPEe1?=
 =?us-ascii?Q?uyNK3FvmxRjeGb0ErW/Lox8VLntQENHIOKXBBSYW4sIRsk2tlmkhaTTCyQgM?=
 =?us-ascii?Q?5LIsWESUAPBxKJNsRbCcXyuttGdY0ARsGQG6lh9gobwiI9u7SQ9qtjWx5XhN?=
 =?us-ascii?Q?xWlLsjNARJVYO8kk3azmTmqwam8RY35CTgjFP8wawPk0AI9u3S0noRwvHWAS?=
 =?us-ascii?Q?ytflSqv+lwLrOhGnMOFdbOpMujfKp6jn5lHNwsosCc02LkWcBwNveNaL26v3?=
 =?us-ascii?Q?Bu8iW3HgXv4DOo/vE8+mxO/Od7qISLN69fRZBggWAhIiN8GThsyovAlLU5LP?=
 =?us-ascii?Q?EfoO/rpOJsFXU8dnIF5Sk5CV1UuMLU1q4kusVjLTCo6/Pbd8vKg7YvZX8KQl?=
 =?us-ascii?Q?x2IvQe8XIEMTL0jlnmkHptE7Gr9So0RPDyoWxQwyGIfc4yhP5FJsCta0Zr53?=
 =?us-ascii?Q?sCKfugbB4FKro9UXq9pmC9z+iRV3D05gR8QERFkGReownW/h+Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7kGw2WNobXcRY57KUbfRe2cWskazxEqm/5KQ/GVfn15xTKLYa/PxbG2NL+Gq?=
 =?us-ascii?Q?HcWbFfniSGDhDRMYCZlRvl7RSmniGj4hz8tlhwC2BKbBnsx8zAukmv82ozkg?=
 =?us-ascii?Q?ISgLix2/czkRkCl+AHPRbWqxMnviuUlLB+AkZbcsk1j+Ryuq9SyOiF84GmwX?=
 =?us-ascii?Q?IXtwqqcNmOZGv/l/htP9BYDgPWUNmYNmM4ShcTxk4gCPjec9/EgRWJnInHIo?=
 =?us-ascii?Q?PaVZF1e+EqONCnXaIWHKyjdhFWJJEyYd1TGFAuvyshb2udcz+mz2a/iukN0f?=
 =?us-ascii?Q?DfkgBqXnPLiV25N2pHYKqsaOQqT/UiqzCpWU3dQaG8OX0x1YNeknltrdjxgE?=
 =?us-ascii?Q?ju2Nn81FW459lpf7iJKRokjz/Msaa9zzxExKSUa+p4Wzb2VGCZxZf9IctpSD?=
 =?us-ascii?Q?D5ru4iymBMjYqW88nwZF6mG825nvdn5264M1v+JobGEiwdUslz+GW4LdidJM?=
 =?us-ascii?Q?fNVvzr9T3mxvwfySy7LpWJRuI7WBE4tspjKv8A1KTWGzY1VGA36tZJVlHPRi?=
 =?us-ascii?Q?JywbX+G5hGGytccyUFP84UsrrazXtblHIOhp+aDIUqK5p+0kgA5wC+/yNsCM?=
 =?us-ascii?Q?zj/2rjDt5I4FRLzL8yM+xG8rqL5gSjUTY6mtpCmNNVtUO7TR+rF7uzrvkbhF?=
 =?us-ascii?Q?8D1eq2pLHG5hmhxT/A6655zMP7AAORy4bCKyQ+PiSQj15ZxKUOjiLdODJVBu?=
 =?us-ascii?Q?tslaugwJubGz+9MIP/JwOyxI10t+iH0tvEAT1+9NtlsiNlhKLwIl6MY0kgxs?=
 =?us-ascii?Q?sM/NQoOZohFwnDQcJPZfxS15n9EeznYKScgy0/pVx6eYfs/PN1q+8Ev8NP4s?=
 =?us-ascii?Q?OENaOD5D5+2yYwPpQr5+nujTFqdZavUyTDkJKCkezcc91rDhRdl/xfYeFIkH?=
 =?us-ascii?Q?6AX56W2ds2w4ljm9HNMJz7M7VBO6hoBFxVNrz/Rk2vzg/B7l3GItmnFp+VJ4?=
 =?us-ascii?Q?/u+BiCiXweVuvodIJFSisHO09mA5aMziYZSJheix7MvgQngWgwtctyDY5K7B?=
 =?us-ascii?Q?kC29CVO9slQUcGhcQJuf5NHTPHtlXyAsluIEjJQ3kXH58NeDv0YoaGhKsHKP?=
 =?us-ascii?Q?svpySatBgFLaMgvJK/HkAz0SgRwejqA+U51seytxLFLo9mtRmxGIJS6ykrJH?=
 =?us-ascii?Q?cQjpg2QObJhcjXG+/pkIBoPjDo+ZjWaBgopwxzeOXtiE6nuySLHJwvIC8Kcq?=
 =?us-ascii?Q?afDif1p+PpluCh23gzQoA3/02Xm2LtzwAPSWOuaeDOwDUYqmbA1Cao48Qe16?=
 =?us-ascii?Q?tIxzwolid92Nk7EGFoppyD82KmWVNc8oLY7zM/Y1dbruhcrF6QfAytdU1aSp?=
 =?us-ascii?Q?W9b9G+bZLBTLu7qBDJh0ncCmWiahDqyLgrFlB7rIkfuNnozWnkXknhx0aIL9?=
 =?us-ascii?Q?ybQS6V1dXfZ4I0bOnT52SPqAiFNAT+4DRq0Tet+tjcz78McDabP+xQWCmYlk?=
 =?us-ascii?Q?P0WrRWS1YYd1wf1YecP72bWwuQlZnq3Esx1G/DIp5GiF7oH0Q83MlsWCrk6G?=
 =?us-ascii?Q?9VtQQRjCngTEKyAVuIHM1GG3wSFVwA+8uciqn119Gp/YEmsFsIlF6aa1tFL0?=
 =?us-ascii?Q?bQcQHB33Ae92jM3Qsy/pwEVqPYmxJ4U+aHmVnxRq0KMWMGscvNr/dVsyDEZX?=
 =?us-ascii?Q?0DnE5CIwFxiwFcaRwkypYDo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb0c2cb-e5eb-498b-c9da-08dcb4e6b8c9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:37:01.7843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O9gFd7BwIlUyUQgE0gPF+ZY8YOx26STLS790Ho5MF1ZwzdbqZ5K+J7/GVl/+EcwOp0PXeWOwhoFUvv/1oVQYlNF2eqjGqYfbImfN2q19n4DlGFCGtU/GAkvzf5cQRryy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/pci/intel8x0.c | 2 +-
 sound/pci/maestro3.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index dae3e15ba534d..d9a6a9477bccc 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -838,7 +838,7 @@ static int snd_intel8x0_ali_trigger(struct snd_pcm_substream *substream, int cmd
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(substream)) {
 			/* clear FIFO for synchronization of channels */
 			fifo = igetdword(chip, fiforeg[ichdev->ali_slot / 4]);
 			fifo &= ~(0xff << (ichdev->ali_slot % 4));  
diff --git a/sound/pci/maestro3.c b/sound/pci/maestro3.c
index f4d211970d7ec..28634b2d8e5bd 100644
--- a/sound/pci/maestro3.c
+++ b/sound/pci/maestro3.c
@@ -1130,7 +1130,7 @@ snd_m3_pcm_setup1(struct snd_m3 *chip, struct m3_dma *s, struct snd_pcm_substrea
 	int dsp_in_size, dsp_out_size, dsp_in_buffer, dsp_out_buffer;
 	struct snd_pcm_runtime *runtime = subs->runtime;
 
-	if (subs->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(subs)) {
 		dsp_in_size = MINISRC_IN_BUFFER_SIZE - (0x20 * 2);
 		dsp_out_size = MINISRC_OUT_BUFFER_SIZE - (0x20 * 2);
 	} else {
@@ -1416,7 +1416,7 @@ snd_m3_pcm_prepare(struct snd_pcm_substream *subs)
 
 	snd_m3_pcm_setup1(chip, s, subs);
 
-	if (subs->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(subs))
 		snd_m3_playback_setup(chip, s, subs);
 	else
 		snd_m3_capture_setup(chip, s, subs);
@@ -1724,7 +1724,7 @@ snd_m3_substream_open(struct snd_m3 *chip, struct snd_pcm_substream *subs)
 	s->substream = subs;
 
 	/* set list owners */
-	if (subs->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(subs)) {
 		s->index_list[0] = &chip->mixer_list;
 	} else
 		s->index_list[0] = &chip->adc1_list;
-- 
2.43.0



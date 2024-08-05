Return-Path: <linux-usb+bounces-13025-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53437947248
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:41:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 097BF2815AC
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B4251CF8A;
	Mon,  5 Aug 2024 00:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZH121LgU"
X-Original-To: linux-usb@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010044.outbound.protection.outlook.com [52.101.228.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68301182B5
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818484; cv=fail; b=klyUbAt9S9erGQb3AJsj3G696DjEXOR3fNbIoHb22GZu/Y+t5zijOj9FiKGYWyadnlOEs1aNc1Bg2satmZhyEM028qGslaFcak0pPfnkxgSOJEijOE5M4xEJtLByYYVMjr9IOpmmT60fp/eh2R2XmtVx9fY4G+4UPQuhpqOLqgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818484; c=relaxed/simple;
	bh=vLbdWbNGlwspP5N1a/W65gaSIU6crYYPbR9lM5Q7H1Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qXEfAknDC9i5cjOGQQV7r0m0X6sUlX/NqN+8xUXmofMfQa5cJaAVyL383tsrAvAIDuYaNepUdGTKn6hCAacv1sPTQI7q4845/QDFzZItTfhcepdeGF/TSHfrWAAI6ml/LwOVqQoVo0Kde3mMegMxDo5bytzFCYVc8h1yRAfs+i8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZH121LgU; arc=fail smtp.client-ip=52.101.228.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2BMBb4OqeMYfKpwuPhdLlawjMY7/RulXdn0AyFlk8eBSAx2Kez8lrRjvMcLfo0O9ByRRDfgYOAAsYikuptfa/jP6XLM6lNJS04ru6koDv4xpnntU9CkiU3fHdw0R2ViEctrHRMRAuUhPFLjVn0f70qHbUYQzzCHHuK3NPRX0YeECjfkIApHIIDfhBwCHykJgLfcnOvxSaTealWz3RzjrGLfUd/P0xT7WWD+DkW3T2j7SqqVJE46xlve6TNkwx/SFLlC1OwUqvVA5UxVl77U2NOMy3RW0uwP6WzpYUg+BwNqJGBjpD5g3+GE87AekKECBu7Mm2RejFuM/Jm/mKbczA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbjLp0Vj2/Wv1s0I17npIid3Ouh8zBYAZfr5SHL0c2E=;
 b=h9js3x0+9X7TiduppM55tXr0BoMvrqEGB7EeY/El8E9P31/F7wFEWgvToUFxssZcHJhWipbbGs2FJpHuAvyZAVxOQmJ0vW1hcA+rTfXyGBFmxXdZXF7KPBeVuRpJHWvD0g+KeeZrYrVyNPcG9esEXMn1qva1HMqZEr31CqfT2KdQ30Ey5P09uCFeZB3YJ8Ts5fPjfIfbAUS/XMMvSBcCEduWve+VwyVfgpwF7+AuMwNBgVWQ+LK4JRUiz1wGN0ODUa1yanVbah9zRo2njRVyH50dDnWQ6uOu/bi5GUB1jYVhjpA8WJIdXiLiFEQMhPJ3elU5RZeuqvHAXnXZt3O94Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbjLp0Vj2/Wv1s0I17npIid3Ouh8zBYAZfr5SHL0c2E=;
 b=ZH121LgUjoO/MvjFNHFYhK5LD8YhqvDdehgKP6onFbbDFA5iHsY6YBGhlPvrOzIP/sdY6D6q45wpnUJCQlP9DY8aR+4pw3QXphe20dpWILW8RQU7I0WPbkTpyQEPW5rey3INp81VOHeGGwGF5FcQeGtSIhzOsyYGzbDMwQ0grAo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8678.jpnprd01.prod.outlook.com
 (2603:1096:400:15a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 00:41:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:41:20 +0000
Message-ID: <874j7zyf68.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 075/113] ASoC: codecs: ac97: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:41:19 +0000
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8678:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bd44945-9c3b-4285-662b-08dcb4e752d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jZYbrUgwETpcYFjO6SCuVutDrS3B2Zwe6DfmRBluIoQUYhRdnd8I85zhhWON?=
 =?us-ascii?Q?fq8Fioj2iuuoDb7BOfKiyGyFO8mwkc7sFUh7TgOoAJI3t7nugnLKCnPw8TCw?=
 =?us-ascii?Q?ktahOx5iNwDd5Hq6ReFxsLIp3Msl7Pv4KaevOsxVhEtmqbPYLLlBS5OwfE11?=
 =?us-ascii?Q?Qtq6+DqGU8wbDG3wo5vHca/5QEPCXx7or3tlRpH42oHuAFiZrLiDohaLv+jI?=
 =?us-ascii?Q?yN1O7D27jRG1cZiowOnsCcEd3QZ93MZ6uI5SdLYC9q8myWtpn8APi6dGZQUV?=
 =?us-ascii?Q?vtiZqLidQNFpkmZVUmiiqBRftL7ITgdPf1X3qRiOYatIBVBd6MsQ6IQeBH81?=
 =?us-ascii?Q?Q8ZhxmTK2lougpZH7tlJTzT8c2SHlcvSldUC574hl0jqucJo6/wDz4Tcc5bG?=
 =?us-ascii?Q?necgfEHCdTjvceDZ93YpWyjNeBcQO/PdrjeS/IRRvIEF3AaGy/g67+yymEfh?=
 =?us-ascii?Q?8IXuhj9rU336Oh6nkE2lHcjggz+PUdkVTN5Bx9Y9a2WB4cnyeEmpm6UuKjOh?=
 =?us-ascii?Q?waTRRRdKfUUpgUKtxQuYO8ndDehUWsa0qZlFHyyiljL4ztLrI83ymgxHbq69?=
 =?us-ascii?Q?GXHBuszHx6AjejP7E4zUJsw3AXHEPcHlvrVB1WhQFKqogA6m6+hzY288UMuA?=
 =?us-ascii?Q?+kgyPSmO+a4HJ0Fbs/Bf2IocmoXoj0BcxKV2lud1MY/tRZE8eQ/ZRUgdNzFs?=
 =?us-ascii?Q?fVZmh/6chStJ6qDkvJxvROvhRC3Oecqh8OWxrgYdxrcJbUnpgAIJZMHK2uv1?=
 =?us-ascii?Q?NptZnE4+S9OLRHPpXGXwSV6wT0jR7Hw4/5oyIMI6baFbqQXIksbWyhNk6TOJ?=
 =?us-ascii?Q?iOiSAEz7KmqqqGvDxVdWMYONRxszLdirKpnfqwCGT6fheYHUNV5UvVmwk0nj?=
 =?us-ascii?Q?vdG0MMndis4ALsFrvUbcPILCcPSQ4kSahtURIBjJ5LKnidN5SMk0rEZwAf9U?=
 =?us-ascii?Q?VOYLEkI7B4q8lMoehWl5PQYqUktq7xfBw2kXXBVP2hHlzVGAbOQ2iOTWnXWf?=
 =?us-ascii?Q?MQ9IUxq3DzVqe2HV9quNF9udAbdvTMYOmHccV2IbcwaZ6nfHXpiMgFSI7z1u?=
 =?us-ascii?Q?5Z450cTV+q8MY5Ey02hlRUHcP2q/Hye4llUUMyVMZcN0Twyh52xS4O3otWWV?=
 =?us-ascii?Q?7PpeLY5Sv+jacGIThLwABnMlGQnSYYzA67kKsITOpKzW9mxRE6vRUiTqjBK4?=
 =?us-ascii?Q?65yUDHgD4BVzl+mtc1hpXvhRm5ng1dIQOM2ioOM/Hr86c8wPM6/O2WdUtJyi?=
 =?us-ascii?Q?njlf0n3V8XOUANUsj+MQdlT/1rUfPwlGq9GIeveftWeg0d9GyVCxORchU7OV?=
 =?us-ascii?Q?1aXOMCt+QbiBrk1vVMckxwPhmr3wY0TYjk6PvnAbaVI1zExhd9GfRCNrMK04?=
 =?us-ascii?Q?E7qjNPRffHQvKX1A7X2GkUXsvU6DFCiKZBD46p1dpCb8xmSLQg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ko6ROMSw4zUKL7chvKQH8xgYWfgua9kzKUMv5/bOupXqE3T4XhjR52ivtcGQ?=
 =?us-ascii?Q?a6MZrrIobpFm5a4t0kB2R/xnNNvqdkTFi8COHTdN0N+ww2WKccnjPXASLmsP?=
 =?us-ascii?Q?3Ud7RKWuRZv/mCrXGwBG5s1gsDpw0dxp/vNK5H7B6u2oQi1orqTvIAcA5xPQ?=
 =?us-ascii?Q?usj5TSc1ur7YJZwv/acp+0mFQQLnL6brDVt0FBKEvNleusZwsbLhjX1BKU8/?=
 =?us-ascii?Q?g8Sdf9StwifFRTXLnSLN4wCEsZUFQOzaAdBn4ppIXeZ3r9E5mzWcT0PS9zDU?=
 =?us-ascii?Q?EZa/FcJdwyZwx20VQMp5CgQTRAJGMerW0TQ6armJyvXkrI23x2cvGrOOtMTh?=
 =?us-ascii?Q?Ztu+Y8swHh7zvisn+weP5azQZ08uj3AtB7VfAlxLvgGYE/Jb2TUZiqBbrspj?=
 =?us-ascii?Q?1fmUsQfk82Z6dQRXCz8GhjOHvyCsjezZBKiFf2dRJOOvXC884SxDROUAXrVf?=
 =?us-ascii?Q?f/YPYPiRMM/3fvf0YJzmVtFaDBGlRPlDb1/fSFS4XNq5DRlT9fPN2YdwyZiu?=
 =?us-ascii?Q?V9ewkEmABJZezU/Cz+dsR9QX7eMilGGI9rEHbPfr5rIx8UF+VHd12WptbsOJ?=
 =?us-ascii?Q?PWDpq4tupkDHL1VcEbbwgsZ5/O/59d1azVRA/FRcDyv0Z4ULPqu7Xey+mtQU?=
 =?us-ascii?Q?oL+3NFKYhQtAmES/xfOoAmb9arixg7eDm4jaCcTa4eW/3I9xLspO7x+y/VDE?=
 =?us-ascii?Q?Pv8QKLPnQ88IiMjZA+ZvwiYssleGMOPG9JY2n4ys6lw2JA+y0ADOZ7wOwqqn?=
 =?us-ascii?Q?eWAsK4C8ST1cY88ORzE7GC3rtZL6HIXYi13U2nxStj+89qt8AnLQoXUtabP7?=
 =?us-ascii?Q?aS/VT7JvxVhLigmUGaIkgYElGBsyf734xmb1ItyMPk0BnLGLx1fYUb4FKQqE?=
 =?us-ascii?Q?xsPDBrzSnZkq7xZrExjv0NTpWDk+80TjDnjhGvLXD3+6KuwS6BiXRCnVdy0b?=
 =?us-ascii?Q?Fjzc03Y2I8DGSlatZKNPnQWc8q0RlD5JCECQcrV27xppJj0QwSMrU+chalQD?=
 =?us-ascii?Q?bvhKq/JqGEOMNY7Ox8FYTiMKiWeHSwnLn+mMQKBYZMTs9SF5UHLQpJn7XLZG?=
 =?us-ascii?Q?Q8tvn3WhniI80DAr/wKNGjZ7HHJqjVSQ7dqYVg4fhYPzBD7Q3WBiCW7nvSWD?=
 =?us-ascii?Q?NHn+eEj3U763KuOqzCTE2puClbMdAj4zedudRBYitJ+QSyYNZDDsMezdqkIE?=
 =?us-ascii?Q?8thFokqW3yuoXhs5AVXeSUYHnvH9l1RG7JYu5+Z/w36cUlqljH0WlqtcyCb2?=
 =?us-ascii?Q?rz+qtwRJvZhEkiEZ5TPjPdi7sqbNPdxUUV3VNa987HC5tYQhBoBz3SHvSLNE?=
 =?us-ascii?Q?QPkZcTgfN0X/4Puldc0NPAMDkxKUqPodnsvHhJ/USMkxeOFS+b54QFMX8yUp?=
 =?us-ascii?Q?O6ks16T/7qZMbZQmYPm9ETmbZ+M+qDmhSjTNWyElAZ9N2+Gnn8Xbr8QogsLi?=
 =?us-ascii?Q?JR1z6ZsnD/V9e2kwIHB9X2heBTEuLYFJPS2vkXESTc46HYXq+T1pMCxuxYae?=
 =?us-ascii?Q?7domUxoV/MtMDNlLcwnDdGFXA3hMQwzh6/GNMfm21yelp6f2Np7NM2f3TTYg?=
 =?us-ascii?Q?msxGJt1CoNGAB5N1Jz1cYascTLU25Ry2le3bmZdDxLh8kDiTq51XjN7IMhM0?=
 =?us-ascii?Q?j/34k5VeKn42PjUhHzXoOEQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd44945-9c3b-4285-662b-08dcb4e752d2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:41:20.0893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 682UdjjKku0jnmUC/GxKI91G7eVI78aOZAM1MjEanN8MgNFY6DQfkP9f81kjKsPDynRlMq//4A1zF6HTNMSoifA/r9am8v7I/IL4Og/v7C27adA2rOCuwLJ1NNnJPOgy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8678

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ac97.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/ac97.c b/sound/soc/codecs/ac97.c
index 0e013edfe63d7..aceeeae518d29 100644
--- a/sound/soc/codecs/ac97.c
+++ b/sound/soc/codecs/ac97.c
@@ -35,7 +35,7 @@ static int ac97_prepare(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct snd_ac97 *ac97 = snd_soc_component_get_drvdata(component);
 
-	int reg = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+	int reg = snd_pcm_is_playback(substream) ?
 		  AC97_PCM_FRONT_DAC_RATE : AC97_PCM_LR_ADC_RATE;
 	return snd_ac97_set_rate(ac97, reg, substream->runtime->rate);
 }
-- 
2.43.0



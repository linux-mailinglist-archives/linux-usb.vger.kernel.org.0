Return-Path: <linux-usb+bounces-13039-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA60894725A
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDF081C21388
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC331D545;
	Mon,  5 Aug 2024 00:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jgyeGJkJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011025.outbound.protection.outlook.com [52.101.125.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830B01B974
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818575; cv=fail; b=ldSvz22fvk/h6HUU6nBeR6sW7jzr64s6IJrEYzqQo3V25eEJyCe9yFfQPfG2M8ccbJIPXaD+Go/S8i+rvRlHYVHyOJKpUu0/52IaDwUtXhg940eIDgf/5pDJb0SZMnAYgEfqQByhIJd13UbfWvXCc4zJSbNfZCBrsCzDjivd3Kc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818575; c=relaxed/simple;
	bh=IllMxGKt2wecKuK0eFaf/dq9HIW3PhJOg8XNX4CM1gk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ggOXC1Eex78x9cJePr3Z8d/SqQABTiZcT4tBizbTfq5uWnEW01PXUwW8N/bKHZR7YkvEh5BgljH/FYyklPG2fTriykweCuyx5zA4VHxKhJwVeAUm+5OX3S3snnCaF48ooKB5htldGmNHYOFf2RucXu/s93vpU4IJA4Eav0xkAWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jgyeGJkJ; arc=fail smtp.client-ip=52.101.125.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBeMiBbdB2XecbUmHtey2sejN7KOY64Sb9P7VyNRMabgluH3EpL/qiLvnVodQaWWQYzTx09SDbiLA13iavhhJJ3uPAcr1G/UXcd8dJdyd3Zdu3H8DoWgg5bXpj8QhPfdmnBtb9LeWcQwlEL8RLFvCBk+qwdVdbaCNChmi1vA7R2xn9Bx2/ES4/BjoNMnhCrrf19PZTKGZJonuArQfAT4x5rBBOmy4bM9lIj+JG0jrtdngSGViPKZsyO5s65PNjGNwpTpFbU/KYXATep77Fuexh5cvqRRdIFS2dz3HddxJBOBAj/lu1IQiPiSvs55Pu5uBjwJV/j44GLjFfZGf1BS3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUKp0VYCS1HeM76ujOiPvnWWVX3BUceEP59zXs281/o=;
 b=KFSbBzrq5AQ0WYkIMu4LKxQFEY+rmHYzNSg13U7a2U0kASUIFiR43HgkayolrSTUUr00M3vDD53TYabdg4NpTLcUdPTipDbtdrUDRnMX2AvHw2sZJzm7/ffrKqwohF5mVXeIesv8zIMekOOHgoLyrBDbG6+1mJSSVnuV2/fgliYFTqkEVqzqukbJzWIkfI9yyrQI5ZYlwGhdkoJYO9hYD72GDppFVYWfYNm5vkzghFUKzSTfrKp+kFcMoQY+u3hFP2/YPnk7r03r2qU/r/Q/erZdpWfWUHy34pjyni+yLNM56riIXCdD/tX6S78T9CM/69CLOMzerVFl4lXKDVE0dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUKp0VYCS1HeM76ujOiPvnWWVX3BUceEP59zXs281/o=;
 b=jgyeGJkJqm99f3WYFPDz/wcbi3HsApDco2DUd1vzk/S1+VZ8GLrqwQInIl+MscV+4qIy2i40boAsnNZMvzUwF2YV6VxN48+p2O48weGcJRVu+d+UMm+2UtuRG2Yiv8amouXZ4hMNDExL03sYZYjv+Yba84blqvVdY8CxeBv2aTw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9302.jpnprd01.prod.outlook.com
 (2603:1096:604:1cf::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:42:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:42:51 +0000
Message-ID: <87jzgvx0j8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 089/113] ASoC: codecs: adav80x: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:42:51 +0000
X-ClientProxiedBy: TYCP286CA0143.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9302:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d5bb973-51e2-4e7b-a712-08dcb4e78950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UbV2nq6vq1TTlN829Ab1Jn5X/fhaxuOjAk8lZPOchESKfq8FCHmZIxU9o6se?=
 =?us-ascii?Q?YYXB1ECL7m8WA3EDUFRr0xZaEvtZXyQ2TwTV2HmJmw3RPnCLOV4RvHE2OToZ?=
 =?us-ascii?Q?Wudn0FJsT5LrgLOymN0tR5/mSSgqPxkvzVrc2aUgKxumlnacUYEpNtVa9NZC?=
 =?us-ascii?Q?gqew0DTzcEIIL3Ywa2Sm4RFnr8K26sOx15xRu5iRcsivzOcDsSq7Ihfy5JD4?=
 =?us-ascii?Q?bihkHsrXbhoaQMImOy6cLWqTFrs9m4QRg1ZBD6CWj9PaKyUbJHKMkGClQI89?=
 =?us-ascii?Q?q+TR7NM1dPoDIcXoT4HWbhfu9AShvGh2qSL/hWIVAOqrgV8H8MgKeguPDEMp?=
 =?us-ascii?Q?9fAfAOVkhydaILWtLyq1G5AM1O2cNDtjdJ0stSN0YxFZLunPhbRz6Xeo85CR?=
 =?us-ascii?Q?RZeM9CeTBYu7WnMvFhnLbMHUbmTwKr6PRauXzGs3u0EO94Ss/e3h/NR1UkLo?=
 =?us-ascii?Q?T2F74cTQI+qdOatmtZ2gQ+iO2vZvgHkbs8Wgk/Y8ZbHF6emJ7uegxeGOciW+?=
 =?us-ascii?Q?gc8d/K8zpL0ncPacRweYrDZ8WfeFBB5MwR5DYEyO8VLzol9EXrZUXtKw9IPn?=
 =?us-ascii?Q?fVnW64ktzrWwmQseUazimLCFwv9qnLpDu5xyFyMEbQ1JysnRLxFw7maxYAlM?=
 =?us-ascii?Q?NCzkaBHkgdLJBQYpa69j0gCAjt7L+Un5ToicnMDNpjSs7uGdVF9xyDJ38WGd?=
 =?us-ascii?Q?UL7PR/oR9InPM9TGUbgSSxq1T+g+LKObsyhb2QTi0twR7vpN0zEgw4I2BdpQ?=
 =?us-ascii?Q?/weumLoo7NaaS70OgYsYz40Ik617ifnFH8MqD9kTTRbDyVuTGJwX1/eODkfm?=
 =?us-ascii?Q?vhMlHoxD5fvBwSsT7QrTEPi7PfqQYAbvWwQGc8+wbD/jN6dV6P1uj1gzzvxs?=
 =?us-ascii?Q?UU6rmSTX+Xgefk+A0lZIl0IR7zd0coyntOABezbZg1cdmfm7G7tQb3h35stv?=
 =?us-ascii?Q?c8mJqcdwjpyTGRjS43eogg8623aGh7xn0BP9gwy9Q+HtYEli63/9VQ+85g3N?=
 =?us-ascii?Q?RjODC2V4wGKH2FNyPFWF6elpWstYu0grtPqrsK38j3MJ9Z/RTxqZ14W5weDX?=
 =?us-ascii?Q?XjqSSOu81UBGTfgeZm+0bw9LKFnoOaw+hwsGvxVPpeHdl0KCAz9cK7uuKICd?=
 =?us-ascii?Q?XGStDK/y8lkHkTpFazJr0LnLByEFujKo0zLi3X1XRvd80kUqzV29XjXAqyOU?=
 =?us-ascii?Q?GlKn66CiEL566V7M7qBU5zRZ2+asaebcOA66t0c7nY3gwfczOHaPTf5Tw6yE?=
 =?us-ascii?Q?EtME3Dvscx3G8tLu44Isw3FJO92GEti1O3gyfMuV1uPqflYTBy/4UOfAoEQ3?=
 =?us-ascii?Q?IcqVl8SBD3nrvQqGUeOyx2Z2nXHZSY36SgAMA1tAC92tO8K8d+3ZHlyTl3tm?=
 =?us-ascii?Q?GA1yXGvD1su4WKQpZbMVimP4tmuV1K7MxX01GN6rHhk4bTopOw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+BGy+1e1BeyW23APk/Gz5aocjp+SXSI21QkCgGpt2Vn1ELP02YAnROO3Zkw4?=
 =?us-ascii?Q?8APj9FLcKRQhlKkHjUw1u1M2SD4zVnTcVKbgU2emN6ZY0GJEyOcE/oSlJhVD?=
 =?us-ascii?Q?UmV4IVDwZANjqvCtjnJpJqoGHUDalhljKbP8MaO11Gtpl7dCNHrt+TUQ2yAC?=
 =?us-ascii?Q?H7bnzqCADjpZuSMFJvoqRiczl3n5jToRKjFZu29ecQf4xGYhwKKyNYuPCwp+?=
 =?us-ascii?Q?go8fbx7rq//Hz3Tyd/z4is8oIyVi7VgMCC+idYl5xsFUef7jYrnF2qgR6gMz?=
 =?us-ascii?Q?G4V0dnJC+Y0R7c7aVfHof1IFQ7uUha4EsYIvCEN9U56aD9+MMaHyGxcIbARe?=
 =?us-ascii?Q?38UI/Gq6oKGKhi9ZARjemhJlroAbPY8UnNT5ORjJ288GvGws8QpUuYQ8+SHB?=
 =?us-ascii?Q?UZ1fvXpm6ZWo8JPJopwZxSvhfz/v6heMQxxwci7YE93sf348zK7RbL2goxvW?=
 =?us-ascii?Q?d6X2ZZlF3+mdeNzZOiIQZO504UlV6cRlxpuJCGwCdVVTZo7p20ZdgSsjokP7?=
 =?us-ascii?Q?NHFiu0g7uDmpcxYMAOWgN1IiFCaCdjc0sYfg1Oh4K6wqf4NHb9baJysbTEyv?=
 =?us-ascii?Q?6DHEcAbP7BasgJ2tzLdPj4VSpYvV5qLdPJBBZioj+cCypjdkWKe3YLWFp7OR?=
 =?us-ascii?Q?YPqLS38Kr51oP5LRmIjDQWYCr9NGBEazBIBpVoT2RX1sR63m/oJoyozE9Tw/?=
 =?us-ascii?Q?Mcu4PaNdCSXvCSMjF73DTRO+muxYH70WTq8dp9+9OxHLPFtarIRzx1AZwDAF?=
 =?us-ascii?Q?ak2kZhzeJHikKVMspilYktb/kXbXNdEcHDVBZ2QbosH0g0qCk7fFvvVudb8V?=
 =?us-ascii?Q?uvH22HxIxb4onKHIdWJUubaq/QrYJ/f0nP+omPqh+SotJXLNi44T6vZbqFpj?=
 =?us-ascii?Q?EsEPdSEugiWgjSJNAI6+5PtcAEeylzzN3PLaQUslB5QaAA1J+ybHiPf4006c?=
 =?us-ascii?Q?DEhvibD5NLpIoZusreAYfNXS6VhwQ6Nw1zWbUr+Queno18pEVw1D2zq1+3uq?=
 =?us-ascii?Q?cgy3sBc568dpiZ5noYJJB7BGWVzEBPi4iH1i/nMLoOoE4BMPhURNmbggut/U?=
 =?us-ascii?Q?tZgEqscLs2uT0gnlRC9tBt1KxHfidofRoiX6H0SZlr2TpIQRvlM1CJZ4Vxe/?=
 =?us-ascii?Q?rzH2S6g0vDLuVTkVQnNHxPTgoC+SjBFgxK1AeB1phTJF9lyLt3nEfzIp9CEJ?=
 =?us-ascii?Q?qRzj8UDEnehYuHMI3YkJPgLK8thqE5eMQzFsJDHmkIfXQSUbxUr7r5QeBp9Q?=
 =?us-ascii?Q?INfGGkKNvL3Kscij5AqepztRbtfF3xPKBVbSoiaAiLLYNauYOnK5gr9UsJke?=
 =?us-ascii?Q?new5KFyHfDzFAxULQ3o2hy5v6i/L+8U8oZ6Q73Ja+6ZCLIbnICfkGE8fIdYl?=
 =?us-ascii?Q?F80xTHi9lVeQQ+rU9ayZlcWHLZvCwTKx+xESHe0+rbkQTVYSBRgVvgY4gQXo?=
 =?us-ascii?Q?z+toc8mKt01WbY7cLoOMgwviiaS6hltHmIKGLh7U3JSirvw+BhIv5XytJ4R2?=
 =?us-ascii?Q?7acv9/Ox+GdC/K0XccedyH1qV/cNW2cgROnIGW4krWmD/2abB9W7jIvDc4E/?=
 =?us-ascii?Q?ckxI2tbfLREjIZ23jwhQVJJkZh0Oxr1q6axN6SEbtGaDfNZE4ub8/ndJldgO?=
 =?us-ascii?Q?uY7nBDJveEtpTwxMy6s6DL8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5bb973-51e2-4e7b-a712-08dcb4e78950
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:42:51.5025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5nKE0LM6nCOUF+prvfFuHHsFTOOYGe2UFqoffuvB8maJYcZX1wTwgsmJCiKoMfB9J/E+KS4Fv2l6haendr7BeU2kE2ExpDRYckIMnI0SpUXQcgwKDBUn2tiEmHG6zX7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9302

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/adav80x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/adav80x.c b/sound/soc/codecs/adav80x.c
index c8c0fc9282116..21d20cb42d200 100644
--- a/sound/soc/codecs/adav80x.c
+++ b/sound/soc/codecs/adav80x.c
@@ -521,7 +521,7 @@ static int adav80x_hw_params(struct snd_pcm_substream *substream,
 	if (rate * 256 != adav80x->sysclk)
 		return -EINVAL;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		adav80x_set_playback_pcm_format(component, dai, params);
 		adav80x_set_dac_clock(component, rate);
 	} else {
-- 
2.43.0



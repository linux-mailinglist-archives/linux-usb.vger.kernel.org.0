Return-Path: <linux-usb+bounces-12958-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E348F9471FD
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1252E1C2061F
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264A93C2F;
	Mon,  5 Aug 2024 00:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cFJVjafl"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011031.outbound.protection.outlook.com [52.101.125.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C44F3FC7
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818105; cv=fail; b=l14ijdj7BQtnp0y0MSajtZiCGtHk+qm5bOt9p880Py1MVkGFOXLx2x1tIePTvTyvh3bjQy8PZl9J19GFqFt0tYf4Ph5HSKhlo+ezB9/CIJpPelB1HMYGoZ/alygaEPXqyPwNC7/28FANu0SuEmr0REBzRf4xgGUac+xrlaSor1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818105; c=relaxed/simple;
	bh=0cRBQYa7X70wjyvei3chAN4k7fTkbsPa8BYLzdNmFzk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=c4hQpWA3X7vLrrCs+ooKPxTh70CDWroDIuN7udS6Ipyhzgxvu9ytkztfykv5hyze4IrMKWYjlkRnajG+wJhmKRdouYKkZPAnc3cxyp4QoC4MLE8lNFxwIBCPmyO4ickcU6hWnBckc9LQPvff4ZxlLwTyw+6FF99Jx7rxoQPhaCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cFJVjafl; arc=fail smtp.client-ip=52.101.125.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=USQcUpxb56KN1x5mzSFogulePun0zPrfg/XaV00e8ivhrHCg5RaYHF6Q7OQu1wrJu/S59qj2y2mCIRcRTSiGfJSNE+WgI4Xme5nXR2bljYzkoXbpAMUDmceKbNioum4wPYkts9tv47tIBxDihYjlr1vsi5NeDDBEZqk/C1K06lOc8CIjiqzrFKmvVxJcQu0bquKzEa0HqP4fPTgbZ/jxrYzNu1ggCzrekqb5A/JUZNCA4a8a2kVAa30P1VU7nzOQFs7k2/2MEJv2SdAQnONFgN+v2DoYpL/p2SYZNXFOhwxJnbtfRi9r2593XSOB8MhxicpTUYTan/7v529q9yDAsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ces1U53ktVFxLwc0yyu5L4AAL0qNgQj/TlhKtcqksE=;
 b=BW19Q5y2cC4zFSjJA6P1hf4U9pqKvT++WZe+NxcEu/FXFB54K57VOLVzsTLhq88SLhKcbRzrLBymhNyDNbi9J2h1FGB0J+HMB8YqK2Jwkx7RGmsTlM4pQaZV8vfjmyrOOj0N88XemXefSnA8U+kDH6dpw4MnWkYsHSJDCAND8AK1sDswN9ol4qc704ENSypvgmfjqkJ/PdxGL+xhBXUUTRq23ZxF4juYjEQn+VnnFwd7tNYZXnfgZgfpB/LllCkIjsqWxYINJdHIpkEu+eecKMcjGaLh1SuxPnx+xDjVWFjEIKJuer0TzfxYQnrmMP9bJ849K28BGWj07pVUM52tPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ces1U53ktVFxLwc0yyu5L4AAL0qNgQj/TlhKtcqksE=;
 b=cFJVjaflIyv3nJfpRiPJ3mBXbysPd+kmEBO8sKuEzqwPsB+5GnAqkZkikdTUN9mxJwp4pUxRRDE735+ygoHtIe9PP1avDWDK+Xfjc1csdZi2sOwBoiYeKK0XpGyBtWGgVG+TiEn7WdMsDmXYwzmIt1Nf2t99iMymCs7MSEg1/4I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7994.jpnprd01.prod.outlook.com
 (2603:1096:604:163::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:35:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:35:00 +0000
Message-ID: <87sevj24en.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 008/113] usb: gadget: use for_each_pcm_streams()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:35:00 +0000
X-ClientProxiedBy: TYAPR01CA0222.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: 91f5396c-188b-431e-b376-08dcb4e6706a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?scsHlm2gPFeLcTsY6KhChba8aw0qg9y+j+afEktsyJq1lM7IZ4Ef9jTDfX/K?=
 =?us-ascii?Q?Z7e5OvE8XQwJP3xk+09GcNBIYDBiYqtfyl7XJQ10U09L6hclwCrba+glDYMv?=
 =?us-ascii?Q?WBKMBQWlkULC+D6dL/+NRVq8SNnYmlNbhQpz59NPH5EW9QWvfvyGos54PLET?=
 =?us-ascii?Q?NbiALTyscqGj7kLui6UPnNfcGfyxdaJir+DzMXuaLoJQrMwjOmmLshlakqhL?=
 =?us-ascii?Q?Q27PgOR721cybnV02w5kkioPH5kgsJvYwX+HO4lylL0WhBqslWGeqw5zmD+D?=
 =?us-ascii?Q?z93wnaA97DZzADJ/++kOa+v+JYBPPKW0fsIQPzg4SQE08kANrNIO9gzyIRwJ?=
 =?us-ascii?Q?M2HO8tkzg+E9TYq+BMeR4fupoaRg0R8jbWldrsuvti+o7rObciEACS69z6kp?=
 =?us-ascii?Q?7VEIIVFqeKhN07atMq1QxGu6nK/ZejBP0uj1KCzDqEHDj+pDAVUuG29ZP8el?=
 =?us-ascii?Q?Tr1CoBRgFX4u/Xp4+XCGWnqsrvsOyt83+PGAlhWCLoMTmDj979WGfnHxupdM?=
 =?us-ascii?Q?uotppiVMA8aECUdzzZM4n8yTuaW8WYuChsxDVw4S71+u4ns15aBDfFvQrmUX?=
 =?us-ascii?Q?6H00FcpPFOFB7NcsCRlrCGytWvL2Sj4XzHokWoV9xpVlqnQSUDzu5Lk+DjQ3?=
 =?us-ascii?Q?w9AI7yrFkIQzgNu77O0HrV/ZfIsbqjY63uajNX4sv9N4JllpyJjCyRVIwxld?=
 =?us-ascii?Q?N8OH8zn9xAWiRiey7a4OCp/xKJqYLSkZgcmIsgjOgkcL3vUzfuXgDLmxRkeE?=
 =?us-ascii?Q?t+BvK2qE0fUbz3Hhlk9e+OBCG5ozqSnSqTA5+szd8L6i7JFfAgFdsIeokAfo?=
 =?us-ascii?Q?KIEUMGO1wn0YpEq6IKcYKELydODaoB7a+TnKAqci8K64aOUPHHhS4PTyw7y8?=
 =?us-ascii?Q?PA3e4IMRKTVPf8cJUS9Ww/4eKPWet7JOWssOzLpbDauVdpDeKcsRm7LuS2n9?=
 =?us-ascii?Q?UIPbuxGdfehpcR9F9Q1DkQ0cLUu71DpyXmAb1TAlmCfCkuXGmlQxMBufDL/b?=
 =?us-ascii?Q?R/MGoqcoys2ikcAkJVrBky6RRo1tZn4undx9tm685zgzUoWpHTRMHe6CGA5N?=
 =?us-ascii?Q?tqNTODl12nMOsjqzzxRQyvFFO+zosJBWKH+lrLl43Ifau+32YeLX2mq9VgGl?=
 =?us-ascii?Q?Lp+Y5NDBMj6/5ROrmAEIsVM1KMYsIRfoSdsRjfzW2R3JSNRp62OIQkzpMMGK?=
 =?us-ascii?Q?+YJtnYQOujjTU/ccqY3KGxL0qYZQhbz+rom+mpV9vkuAQEKDK/GY01vndC3t?=
 =?us-ascii?Q?lsNT8ZS2PD8oRRXK07tMyCziKcnI/eq4HWUDMPkFzuRVSBVom1FfNX6wbHNM?=
 =?us-ascii?Q?OVGnHb2/b7YCxcmNBOHIDjrv+UBynfXGq9ktAanNXmI4b1iSgGIncGwfpBG7?=
 =?us-ascii?Q?dPfr1zLYwhn6b0FjAeBNd5pYjnVMVpBtRpM2LgX1VzpDnrALzw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cDhDGU+mcuqbgW+XUkTysuV8pkOfRi/tcisuEjd2PuO8HtiHOWAc8q7ahuA2?=
 =?us-ascii?Q?ocbATrE32JtW2rxuEgzjALE64ssctPfGnTtsbwfscnywvcySPyVITHTHst9R?=
 =?us-ascii?Q?1PNbNbsII+nvAbgbSS3kkL0i7rnPow4EImbzVsRngEv6c6K4RNNAkw6ZCI5R?=
 =?us-ascii?Q?2UDTU5cIA1WvcYuFEMLZCEgiyuDWPikhkT7dWiUmWMj6gbPgEjWOm6X/VOdn?=
 =?us-ascii?Q?Iu0D+FsII0wu75zzvGZH0AlxAzb5W6Js1MnJc3pP7Se8v/7MAOgqKpFmsrTY?=
 =?us-ascii?Q?gylGT3v47MaE+OW2pb8dB2jw7vXTkc1z+nagiqYWGRT+xJ/Wcf3fFqrqnlZg?=
 =?us-ascii?Q?qJhB8BnM2pHEcLe1js0SdlqluljYbaZ1A9vSdirfR4HT49NKXxR3lG6CpWeQ?=
 =?us-ascii?Q?81WUJFApC/CbbY0pHgtIoGXhpdjKX2u68L+hb2/c2P+tRJJeKNTXTse84+8y?=
 =?us-ascii?Q?BA6vKJlqiI3Ao3GLTzWf0URkNaDP2QiS+D4eK1YzimOxNDF65CucL09mN6F5?=
 =?us-ascii?Q?xP9udAZW0mQpDiURV1g7piGi13V5jO6OlSBPbctX+dCua8WQGI+Dimmaj4fr?=
 =?us-ascii?Q?wJwTjkf5vaJBOk525Hp9qRzzF0ulKxiltwq6s5wPaRSI4aOSTHBozIzv1QfC?=
 =?us-ascii?Q?JonKJ/HAwY2uKk3+BrRFhId7YxUWFiEmgwn2OkX+oJkJOgJQEqn4yjyW6Hsi?=
 =?us-ascii?Q?2QqgBVXVeXmHm9oSOqlgSzZ+FocxcyKxuABG/Js54riNgIiHo/tvMICx7zCS?=
 =?us-ascii?Q?hfnjGSIz04Ru35DxyEuGGxEDMiLanim2AmsHz5QIiD8ZtAYk61kEh1FTrMBk?=
 =?us-ascii?Q?XpXEYFL50pLfSxDt+TP6JQkwDIKpJyOE5u2SNVEsd+SimCaPAu4bPxuRI95k?=
 =?us-ascii?Q?X2WvLQ0unq+ju/dTkNEUQGvAzOMcNxuyJe8XETW9q6sL4cxYFtZDpsoSNyvL?=
 =?us-ascii?Q?u2/wlbsxszoauBZ4Ce+C3ZNQmIyVmJ4w5Kiq919+hWbVPThuZHL1Kb3LSadG?=
 =?us-ascii?Q?TAzlxdGGm0mgecDNjIUp0x2Vn3vYi+6C86gV8L8dOk3dctUyYKfeG/uPrD5R?=
 =?us-ascii?Q?DEqe9NpPnDYWlBHgEuAMMcqt/DzZ9PSrr0aAU5x/7XOvg1gzZ87hH3l5B6vA?=
 =?us-ascii?Q?u84CvX8J9KvA5xyqRiD/PXfxn6stuimwSJPoS8//Vbf5BltU2EjyYdUDxEPx?=
 =?us-ascii?Q?xM2yzSt7A3OZseCLb7s5XbsO0oert7QBs/jCTAIW7WbLUhybT22Juy0iqaQL?=
 =?us-ascii?Q?zHme2oj7IVzY5783MPZYdUkOXQA0yqZuusdP7SKumw9m67x2IWXAOh51WaSo?=
 =?us-ascii?Q?VKMPHBfMxrJODV2qKAKYLhzRZMFf0aMTbg/njTkwbFs5ibcFy1DtzZyY+8QJ?=
 =?us-ascii?Q?3Ve0qmYfwPCwG+HA/4MzhAQGr1VVTnUKAaqRmTPEnqeiIbuY2TNH43E+OBFj?=
 =?us-ascii?Q?ctJHp5UKn87up/RtE+vxA0cO1iUCez0/JO49mYVQpUnGDIX7T8pHpHTh27DG?=
 =?us-ascii?Q?lXEaCfvJQb+tIHWLIYVv0doaSbMnpl37ZfLXkCgN0PzD7Hja1dWY2HUaY+gb?=
 =?us-ascii?Q?yHTu69J0NPPK/mWh6AioYDBtwVwkkxRryjyeGa8auQ4oDN0ynMvwuNlNS9kR?=
 =?us-ascii?Q?vNRKVY2xhcPRO1U3BmSIzwc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f5396c-188b-431e-b376-08dcb4e6706a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:35:00.2135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXICSwgs38YGQP4AevBDgBz5GTykvSpU4LDYfOFacVkAGevAwn/LX86kj0W6Cjo/LaIMX29fwd6Hnxi7IUBY8/lzZO5ToqNHeEnTTDP3zO3qFxdp9peRbZobMTgRo0TS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7994

We have for_each_pcm_streams() macro, let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/usb/gadget/function/u_audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 89af0feb75120..40093fa1093d3 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -1290,7 +1290,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 			goto snd_fail;
 	}
 
-	for (i = 0; i <= SNDRV_PCM_STREAM_LAST; i++) {
+	for_each_pcm_streams(i) {
 		struct uac_rtd_params *prm;
 		struct uac_fu_params *fu;
 		char ctrl_name[24];
-- 
2.43.0



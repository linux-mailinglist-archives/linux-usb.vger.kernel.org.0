Return-Path: <linux-usb+bounces-12962-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A1C947201
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14DA41F211B4
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD4C3FC7;
	Mon,  5 Aug 2024 00:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ePxbwkDu"
X-Original-To: linux-usb@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010050.outbound.protection.outlook.com [52.101.228.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6401C36
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818132; cv=fail; b=G9Hlq0ze6tfutaO+lanhlIs2yuWdd5kHrsUAJAkuleDijWobwSCows7GNGTBCv36Eg5rLNl4OWpp9lPi4SXVrg4n1OCpL5qmRj4oT7sd+R6Oi2LU6BYfjT7SruXIKLBkaWwd7TeEw+YwoDH+/oKYCzdsdH/gl8DHbHqfBM4cjVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818132; c=relaxed/simple;
	bh=wAfWU8RkK6TrMQ7T6BAsuBLFYiMxEi1X8L0d9gUJ9AU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VTayKAIPTEyPMvJ7AataDow9dq2asBidl3B7fM8woqJjwONmlUbbnRuFtBCuf2H1M6WSeEcGesF2lNGfIxrpWmxfgcIWKaFrezQJZpfb0Da/dAZb1MK4Wpnmp9GuBwQR2PAJePBKBIFQmQcW+TNy3xdhjPBdE6Nq2pxDLs6DEIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ePxbwkDu; arc=fail smtp.client-ip=52.101.228.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yc7w+ix64ogXoQosvpBpcA3b6e1jvXtv7bEjWLU/sKVMCnxujaT9hFKlDs+WhBSp54mNc3oZfT470ZUa99bmYHburQ6jJNxfrCzoz4aP7gEfvoieR1PPUd+ikdHMtwQkqPfcy5xP0RaqJcwAaQA8CNUWeD5ZQlOHPzv7yaqsFTkzgcdyT0rSjCHWwT5oKBki4gjtmQ2TdKy002qtdBK/XaD0R+vpFjnWSSLtOV+7F3ve9DaouVqdJ+q+XeEsP75z+x/opblMTJ89NyghYQJMHv0k2SR+1lUGG2P+eJrnV91vmTWWml5GAtPC6JuCk35hysBlQqtvl50mbqFVhzWHvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHtKcixYAPzw/V1vmXMcbeb42Ti40TDFqqHPKnKUnXQ=;
 b=vgpCk4kYtG1x4Ws4OZBoMEV3rTGFYGhnbpn26qv/uV5s3H0yvbmBuxbBXyw01wtG68GkAJxkFIGKuJ0eM37+JxW8jdVXVa4PSJ5EN4f3rAAg/sbGpyDqPJphFHKNmX3XeJvh+4p7FHBOZBw2Pc8EUMSU5rm6we3NsvQXNP2h6NkPP1tnT6qGFcwAFVkQMRZBWQ27OMdh8IKR3iVakxj8NydygwPsLyHGx0qc8nvoXaZ5N5CyzALNbnrVqBcKReK6VN22jdalX32jhPXkN3dCgHrr+dGsXLq4IXr8v/PsNYqA13eC2x0+rKX2Yka2+mGGFr/kOfXZz/OvAr1jbDnCbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHtKcixYAPzw/V1vmXMcbeb42Ti40TDFqqHPKnKUnXQ=;
 b=ePxbwkDuYKFisR9VcDfodHMUtHiAw8DSDbhqQX4zPtFVlYAgCjnsTNLeSY0+O0uMBxajPhlifoscZpaihQH5kccgopnCRU/PyQnCRXrPT8FErQfifUGhnEj1YPI774lutvwm7VF4MEULuzwx17r9d3VPHA2cKzZarnCTLzfajFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7994.jpnprd01.prod.outlook.com
 (2603:1096:604:163::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:35:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:35:27 +0000
Message-ID: <87mslr24dt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 012/113] ALSA: xen: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:35:27 +0000
X-ClientProxiedBy: TYAPR01CA0214.jpnprd01.prod.outlook.com
 (2603:1096:404:29::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: ca25e829-ef2c-4c42-cb58-08dcb4e680c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dUH3Agndhk4BqxYICWtT4bSNbGXKoREWJHQCgx+KvPk/WDV+ZoxcMZTekFPa?=
 =?us-ascii?Q?WwuN+P282CfsTyMfuaLdeeZMwbuWw83+tSyC69dX+rdBe5xNkGqDX2hA2LpB?=
 =?us-ascii?Q?L9lktz/jftXDaTyXQaTiWXM9/qKO1di0bSs1lEYHPlMLBiW0708F0xcB52hP?=
 =?us-ascii?Q?Un5ic3V6ZiUB8KTrFUHAgLEx3m47ocqI+1aWIM6tsoh71VLvv70ZxAIsTlDE?=
 =?us-ascii?Q?YDgEuBFP9xgrCuUUjJ4cLrT3TCQOFK3bPBTEqH8JTrk1Osodt5WV5EpC6IuP?=
 =?us-ascii?Q?lZazNJRzgr5SikbkybHJ+PJ9TH/nZOySbeXcQxJNHj/m0edFB7IswQdMjr3n?=
 =?us-ascii?Q?bPzyrYHSHBw+s9yDD1rhPoyYKk1+paLD9osKFm/Rq+CY/C4v+vpi5CWbG2/0?=
 =?us-ascii?Q?tAoAx2RfsZ0mg7EI7JjsJwe7us26gQOnZ+PqrHbEHe/HMhbM1HOyabH9FQG3?=
 =?us-ascii?Q?uffeeQ2mssIqKXkc5Fu0AfXQRVEmnNgAHZvEpjaIMuJPLqMdgzno2xBDk/xl?=
 =?us-ascii?Q?Ur4iBmdQJtpx/+N6fHdirAOGl9W6s0qcfrCEiUP1xwV6nXHF1/5VELzzBz+6?=
 =?us-ascii?Q?+Lpm3u8hOgUMWd6UgUFIgY6lgWuq207ce57uuUA+DIZD78qsDvSO7luQpn1D?=
 =?us-ascii?Q?MEZbg8BIAa0Xr7k5D0f7v5SGE1JTCAMt6zZEIiy/LL7fdGCfn9goR6854p3l?=
 =?us-ascii?Q?7TrDb/ML47W9xzENI7MBWg/gLK1GYY9lJh/Tql0vcn0NW/c2R8E8zJV+6Z6r?=
 =?us-ascii?Q?BZrksgNbYpk91jIKfsXhMmsTPIz0JSeNeT0NeEHOhjy6kv8zoXTLNNaZc8C/?=
 =?us-ascii?Q?XT42+8Ik5q89mkOrBNIjsDJ5uc/X3UBnakPCp5MQJ907tPivFLCBNJHykszT?=
 =?us-ascii?Q?i6YaS/eM+ZL8jE9N9gWnvbhZbOdd3Q/JaNcd7yA6a8mZRnvkjbRdlqgH+5q0?=
 =?us-ascii?Q?Tag5VtHsU7gOiKHgqG1/SW9FVAKBNnMpOqbA57n1S6Z7LjlpZVeKBx6FlCgS?=
 =?us-ascii?Q?wefwykzqRqES/6P+QFX4mYxj/IR0jPdwUFLFY78h9vtewiuMgXqOOn78goig?=
 =?us-ascii?Q?xOiZ726KGUbBH7RgV8Cw86SJPYbnWqbASQ5UVYl4naI4CDLcuGZQ0E71JEfr?=
 =?us-ascii?Q?BXQ1qCPJ18pAHjYAsR4/Xl8OaF0Izi4rEPs3cXTNFHZCgGcBQ/C/29G/Lj5c?=
 =?us-ascii?Q?/kLp60E1Bu1WJq9mhZ++lqUVOiVLjoVPhOqm+LJh4uPgYpqOU5TGmqmzCPpt?=
 =?us-ascii?Q?yKRw3DJR++lo7mtMpSsr+6sbbKMhGtrXDDiLkWy19dLo89qtjfj4KCsVUOBd?=
 =?us-ascii?Q?c+0293Wb9N8HlMYqFlkmIvCv8Op8DME/+7z2qRspZwYAJ26gR/6VTn7Xaaxg?=
 =?us-ascii?Q?BY6f1fk9/sp7vNiwOJEuRcAVFlko96jw29EWWCuoqBhhS7KD4g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wx7hg79TRQzycSDUkjO6VwYPsZQEAHc6819eOezJNObh6bs1gbD5qiuL69fz?=
 =?us-ascii?Q?2+lUCTKeIocRWGPFf90I9WSlCXpGuB21F/0hAnWCn4juyBTRs+tU3Rpwmr1r?=
 =?us-ascii?Q?F4vzZrLYbBfrOagTO0Lgc2bzbFewLrOBm4kt7Mvzwj0zLz9jE4tCovNuRA5X?=
 =?us-ascii?Q?JBdcg7Jh9Yyo5BnAgD8E1TlWjJQJC748QxVFqXDQRjvP+QCGsauTK0R9+h8e?=
 =?us-ascii?Q?ek/ibx46zHFDr7jelOwnBPrVSbnHukQJm3owOYQJakvk7CtmdR9oxZmoQ3JX?=
 =?us-ascii?Q?f11g1ZybZP78OlPumHKVoZVkqLJ6k/QnOTqTCTIQHMsjTb1o7i+2RjGj1Z9k?=
 =?us-ascii?Q?n7GyagcvOCIcCKft4EQrn6OMt/diXQu7kJ4rhRMRJNuaSL0TwLBd/aBpA2Fn?=
 =?us-ascii?Q?i9PZ/ZDV5R/lBHWH7hXfgP6ezlBwyqvsosNRsZMCG23JU/Uu1RC3v/1ScHPh?=
 =?us-ascii?Q?8xhlYMK+TglGC+ZhSqWc3h38hqLDH/2C+aqLhNHTfkDhPgrXPAQIVL7jgaA6?=
 =?us-ascii?Q?hXf9GzewQvs8QTBe6XOLCI0kB9JhPmdv3WhT6KUPX0jzkT8dynHpx+hI7R+M?=
 =?us-ascii?Q?ZM9otrcprXQl/6FnIzTdNojtgxccVQaRm7Vzze2pUtoNPcqxQPfxqax6aVKG?=
 =?us-ascii?Q?caEZs2D161KQLZxwXYlzMV4hcK4iDbyR6hxnHJgEwchk6XU5lO+fR70c3ydd?=
 =?us-ascii?Q?PcuSdVJcsALOykFGqygphiTsMQrCaLOCAIz7Wn4KOllc2FCi2wThDLx9Dd9U?=
 =?us-ascii?Q?3qqB+nvPuxf0SniA3eal54WBD/XQj+bj5kjR98Ca9Zx2SsgyAj1iV5iPIw5t?=
 =?us-ascii?Q?u6chi0LtKXeU0sajG1J/O4DbYHYZJc5RXobhPpEhn00qSBmtt5fs8XqytA3l?=
 =?us-ascii?Q?diAyzsSJXs0N+VUxNqtRdlUvDAxSYDyi19l2Z73Na4QJDEPMmRs8doWEnN7L?=
 =?us-ascii?Q?LvavUaMDINLlNw0Donv+7SbDSGdbbSOIG3ZmFkXWWliFPP38Pbh83Xkm255Z?=
 =?us-ascii?Q?qSwMyqJ8qNpNjlKbImX3U5m1z/fG3GHcouncsCEOnoF0VQ9IslTOtbzANabo?=
 =?us-ascii?Q?qvsVk88xFuDPXGIjuEFK3+Oe/Dg755916YOv3fOeLXgqN78foN7tRhbzvMwI?=
 =?us-ascii?Q?quzl0IT7deptojFSntwxhrWq8pNhs04gaTDWG8Qz31mW9Rk3WogOaIGwcvRs?=
 =?us-ascii?Q?EYIG6hlgGYmPQVySQ1MPxU0yEIAFhne19HcDf8pbU1RrWmG7xhyKDQHaC8aF?=
 =?us-ascii?Q?VPEYpJCiNHmXWmXWT8CEDV5/X6yXbUtwWBh3akpdhSLJnfC+TbjBKDAtJ88V?=
 =?us-ascii?Q?gghNGv6cHfmwZxQ5+LFHCECFGRR6gmAn9y//G7vM8KemhoO1D1FOqpQ9HCx7?=
 =?us-ascii?Q?e8dPE+QZsSEruUfmVeHB0I4DJ2ieV97o5CCZIP6h9gY3aPiG2LsIkmSCbaK6?=
 =?us-ascii?Q?/yl7IzDze+Gqci2PEzKr3HewDigleF9dnJSqkSriAa2274X/6iVBi0knSvo2?=
 =?us-ascii?Q?ixdYvGeIIexlzHIJWssxfuKP6pIB2EyR6ychzHzCEg4/PNoqHN1d1iDkNvrJ?=
 =?us-ascii?Q?KS2NRkPueHMAWGUB75uI0UUWKsjvSlwO8Cd7m5WUxSt2P6ZSB+Y5sORBWoPI?=
 =?us-ascii?Q?e1sV5Fdbt2+ns/tF0oqa1mg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca25e829-ef2c-4c42-cb58-08dcb4e680c7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:35:27.6473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2cqhvLeBNiDwIVQkfjdN6sQ4BfXmUUra2G0pWhBO7vXxnlfc+zW/w91YHKL/STLUKxO0hImkRDh9Nz4wP1fZmOKPDkSs17kx8YOhcALeYtdZ2p27DH2MlGDBhtco/Gf+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7994

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/xen/xen_snd_front_alsa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/xen/xen_snd_front_alsa.c b/sound/xen/xen_snd_front_alsa.c
index b229eb6f70571..0f4f849bd20b3 100644
--- a/sound/xen/xen_snd_front_alsa.c
+++ b/sound/xen/xen_snd_front_alsa.c
@@ -240,7 +240,7 @@ stream_get(struct snd_pcm_substream *substream)
 			snd_pcm_substream_chip(substream);
 	struct xen_snd_front_pcm_stream_info *stream;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		stream = &pcm_instance->streams_pb[substream->number];
 	else
 		stream = &pcm_instance->streams_cap[substream->number];
-- 
2.43.0



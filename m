Return-Path: <linux-usb+bounces-12957-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0079471FC
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E104B1C20884
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F931FA3;
	Mon,  5 Aug 2024 00:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YGvOuFNV"
X-Original-To: linux-usb@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010004.outbound.protection.outlook.com [52.101.229.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C557538A
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818095; cv=fail; b=u0PxQqYT9iRizmVO+shP333s5wZsOSRso7jPSHU7V636UzJjvBL43NEDodQk0SDSNwKBwzGVPqzp61RJ7/NIq2dkKDqVOLvA0oV64p4FkoyoJxwHqvhiq3p4KbE+oQAxVZIF/zSuX1JHAPFfFg79hx0YtXRsCqSC/0TCiwmLo+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818095; c=relaxed/simple;
	bh=HTOIKyRnbGjMMvkGw/4lco2EC26MWWYNJgK6EGT4vYs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=uFZFMlRixvOQasiz7ZWYYWZHaTu69pfguVzipSxPMew9IH9a8AUN3c0Cs23Tkpu1SDo4qm7imGmlwhSAafDXt8mFqcQYFvKSpG4VGHxmwFf+rhFNlnxodJVd/1JdeIRTqIEnBgGXOovEcN3DxqDkgpFuLQ+m+6+imj56QT0wwfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YGvOuFNV; arc=fail smtp.client-ip=52.101.229.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aR7612StW2rRWB4EruJaLNnFpjKBzTLFb+s3zHx+jfReRHGj9L++YmzTHUHe+zXQ+cLfhS+E+OoYP/xGvm9LHR8Olgkf+D1ZWBLjFfm0jU1kprXLNyyic6Ez3gzZkESeyHTPGcE64569Eivdw5DBpdGJmkWq3TSP+m1fic8VbVqUU6s6bQoWr6feKpXunxfu6sw5AXs2bGikdm2WlPUhpzlBIo4Qi6XN8jY598TakXIIFsSJgzHCZlKJvHg2BfdC5jj4hLcuizB2+DGUyl+iviyuCy+GYJu4edgwLeEe4b17A8+ZVHdfb7yOSBwpeW2EuFfN/WgtxzCSQCKLNNdgiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+2Pv4qJ9iu6M9SujEAQRp7TY80S6LTXNnPMHD4yBvE=;
 b=tyPnys+TnJ41sHIYVIWPQXPH2BGr/bovvKX8DMA4WcLoJqGVQgP9zY43NnY1J0nZ1jSQ2tmByBbLWoqscH9MPOzO4mLQvVjL9vLPs3nnfDx6jKBKBijUilApC+uJ6/UZMBbplvPuWJZIye0zAQSWFDVgoEwGWPkqWdF5DaQSBHc9IfPXxIwCnmpqRmR3+VI/9nZxe3alJBGMmZIcjauX+atipl5HQvMSMThyCwDLNoqkhRDPkLa+dsFFk165xhtcAKhIjhC97uB0RQ4eh7Kme9RILWvKh1gM3d6Re9rXh7pfRB1QqjaewYIG3xnFUAVRrgd4xT/DQVOXpOCaYYNJ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+2Pv4qJ9iu6M9SujEAQRp7TY80S6LTXNnPMHD4yBvE=;
 b=YGvOuFNVIxGJQAuv3tEjwjhuOaNFKdrNXm2rOGAoJL3+4qYJu96ctKDMTUFDkeavAJvynho4+dUDflHVP3yj2Y17bE76/vUOFH/ITXEfoSgXTXuPopggXR4uJYkSdHetfGdAHRhhFwNuXJS+4M2W7UVYBlMeWNhkX6/dUZ5Y21k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7994.jpnprd01.prod.outlook.com
 (2603:1096:604:163::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:34:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:34:51 +0000
Message-ID: <87ttfz24et.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 007/113] soundwire: stream: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:34:51 +0000
X-ClientProxiedBy: TYAPR01CA0237.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::33) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: 77db58ed-f799-43d4-6768-08dcb4e66b5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UZWO1tBzTI1Xo4MCInriTFpmjwpfkjDo/KLQ+B8an/kw1jgvE9X0E3x9c3a9?=
 =?us-ascii?Q?R1iR8GITGA2kL1KHKDys2kAPrMo/GofYfCWm1pQzdK74TujHnuFpxpmE21iA?=
 =?us-ascii?Q?fmClbWXFdiHOlR94njDDMFXmVoI5SOfY9oF1lkSC4j3cMPQQ2wf3YXTBt+FP?=
 =?us-ascii?Q?bCWaVcdFxrkjgEpflzdJ9kMqt7uwOLlxCyWlU/dM4remVFP+JFtzMwIHokQn?=
 =?us-ascii?Q?9GIAbynM/qcNCDreQvEZNG6wphTbMycdrAFkOK/hCQywP6ddyk54bqmsgDRT?=
 =?us-ascii?Q?sWx78qinC4JHN6W1lGEyJcwhhDA8ok41gANh7V4MOxpdpDWbPtizV2ZkXrFr?=
 =?us-ascii?Q?2EwZ/99SdRG8dRoP63PI7RQ0cz5KZMK8kC/miNNfDP8Y0x9QF3C6F3rTf+Yt?=
 =?us-ascii?Q?+e+JEQcEHydOm84AysWeJkK7Ra6pMjQle69KoJ7m+u5L4zl219Rvg0li8JVi?=
 =?us-ascii?Q?2oOeNy5efR/Gji7j4IpAlk3qdhwq05vocrm7D42Iy7hpXu36edu1UiIjxaL+?=
 =?us-ascii?Q?xHVIvXJoFQLLSenz5wOuq7DdX+H2P00+VsuvhFWkFfqVp/ga66OsxN7iNZ7D?=
 =?us-ascii?Q?dOIybLPw2L23npejZWooA7tW99Dt3aT8FoI+SsgQpDqoYTzmP2RI12J+b60M?=
 =?us-ascii?Q?/yBE1lwcVC0VrWMLoXusO6Hvomu4HOF+EEJ7sGuB5VE1B09Aki2M5akDGetv?=
 =?us-ascii?Q?mf5bycXXZW88dy84d29zcx4jldWtJTFhmW4LF5DlETYi5JYbGXPf+GZNklJW?=
 =?us-ascii?Q?qlAgBSQFd2iuqyTWItjcb+s7SAUpW9hxKqkQk3OCo+8LNE9m7aRuHxCaqOrk?=
 =?us-ascii?Q?B1RJr22M2+F23FotPhe9OPzE0Z5EjS6Gh9zKSB+mNQNHOs6R15K8xdhFO5cj?=
 =?us-ascii?Q?8cNuAwonFVsojEB1ki27ZqIgETE7OJ/tC54BrC2kFp8Maj1vMZzOPQu49Gik?=
 =?us-ascii?Q?4sIvmj9w5fQyFX+O0Wu82e0deTxZ5GaWF+CVP4IPm2XfoHmkVzKM0k+rDeNx?=
 =?us-ascii?Q?XHjrkRyhgXo+tX9bMxUkcn8uWLHveqY003jcPfmCOJdRp3+HrEu1YYdLlqFf?=
 =?us-ascii?Q?jjaAQLo7qQX/wmwNawQiOjMh/9iTNf0ikPTW0CPF+1Yr9x1gSQ980XFxWIqe?=
 =?us-ascii?Q?emmUUt+Iq+siPIzkJJHSwIHPqymPUgfNpkwUJbZwzbem9kPNAjWTyzOaILx5?=
 =?us-ascii?Q?RIiBJCZ7r9UZ/6gzGCM04x9J6B3clGWHJfRCB3TPJbx8aORiFMXwrEFgS66v?=
 =?us-ascii?Q?HuA5njSqeuVf9P9Jbouo2Ey0o7tDTm9tHiJxmBHtLWWITExpo1QDlFpEeQM+?=
 =?us-ascii?Q?z3QbOTmcrYYycxjotnte171y5zfAPY373rL4eHaW4Sxm01oMiyHlbUfTqzGY?=
 =?us-ascii?Q?Ul8TpKGYoP+yp8YAtVZuDZUPMekpOwtkX5ct8hmzUTXoJpUtgA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bV4Zujx7ALCtwBZ0Mgez+W8zn/AOET2udXpv4V1NkTB72Ehl3OdiXaHresoO?=
 =?us-ascii?Q?8fJ7OBZtkct3/Um/O/RoGW+qFqibJrEbrSOU6iyWF02cZZw1ra+l4imTg/kB?=
 =?us-ascii?Q?vKlVOObr9tmypjfa+lggt/t08i+u5DeDKGWZoezR0Jq5Denc8RrNV/cXeuBB?=
 =?us-ascii?Q?wF9YRV9hwjlNZnYJRXeyTWZBQkZK6Oepbh9scaN3kk3hmtYKpdR/V4KQkALK?=
 =?us-ascii?Q?s1hsFINfiNm6Xm0X8/u/sEmpYNfD3pHbNrFt3UYhTBHFf/ga0U2dBT4M5O4S?=
 =?us-ascii?Q?jwMCtoDqhMOxuzNezbIn04m4Rhb+ypA3fiWKRxZVTd96YzNsAXr+Ia3ne34r?=
 =?us-ascii?Q?Jq5SCwhNDkU16euQ9afw+KLsAbtPesOuSIMG6v5qiHp7ySmc3PT2ESmEMC32?=
 =?us-ascii?Q?rwQetjy5KQhIxSrZ5Q7TP++Efxzmm1AUso5EFvBCNvh/QeW791mNATfrCC2r?=
 =?us-ascii?Q?rqxzIi6JvUOxk5+AEVoFpFPUSVIQ7ALRZeW6DDasSGeX+gJGBbNVprPlu/Vy?=
 =?us-ascii?Q?LmHhg7JKN5lQ25T2blH5l9b+jXHkcuy0SkttLZsQzC1CGkybb2iYikbvKmn/?=
 =?us-ascii?Q?eSFyjLt4oLzm607GHcGKgxj1OdiXzfOYbB1axy3J5HbudzkE5YvawfV0Uvcl?=
 =?us-ascii?Q?7b1nI/GxovFsh4Rqek0kkLZAuj+JvzeR14s/harnxuUi7Vs4WzKVNPRUIY4F?=
 =?us-ascii?Q?TbfNVDLdfBS9F3aIqWPIUT1zU/fLe9P1Z9VAkQ/12jdaqSc30S/HXCnKNTiZ?=
 =?us-ascii?Q?6rK8+hcNMIv0gascs1JeDbJH0yE0OXOPETUHpTK0KZE7hqKR9k1Ko54NqIJK?=
 =?us-ascii?Q?u158QL0FfoQR4rm4EImXzvyVbsSsIFjCZqXRRbcyf8wgYvcq9+Jb2b/Vt3Oo?=
 =?us-ascii?Q?H3JEqWDFk6S2OKj6kZJupyeCpm+63ZrX/qm+k1GOb+3QnZDoy2ePGQI8sMh+?=
 =?us-ascii?Q?kDiM0Uf8Cess8xHDmiKvwUuWtEFKjEsu6Lu7meaX4zyLA0hOo7ZP2qjvgRWb?=
 =?us-ascii?Q?LjgFt+WEzXcAmY2pBzEE20NsEmZbfJl9BmB2EFSvIrcfOt7aDd6jFjB9KZd2?=
 =?us-ascii?Q?ORn68oyMQNSpYt9JEVt9A31rj9DvXIR7Lw3f9uHn7OPw9ohVNltPqq5ZGJ7l?=
 =?us-ascii?Q?Q8Xcu9ZvAx3+0X+UkOF04Wb3Yfm85vSidc1bhAimwXhQwvZoArtR7rCp6Q1l?=
 =?us-ascii?Q?FHwgqXZjO3NbR2dJpUsmeTHQ4uDGmsTPpQ7HvHeINGR539DZRBOHkYVZssKC?=
 =?us-ascii?Q?DKzydakORIAhddKd//SdnftXT7TpX5VQwqzU+Xh+8rfiIp3Kybv4F0Z0CMrM?=
 =?us-ascii?Q?NVwRc50Imvv5sRr9bwx2tFpe/ltCqA+SwAWUIWNiOlyIi9hYV44043xg3+5a?=
 =?us-ascii?Q?vOZnLNjTk64s/v3pWe2cuq11E3YAe4L8zv2Evi0vHwmmjDBTWVFCKfmb/ZRs?=
 =?us-ascii?Q?25tblV817B4l8Kh4YmXADNKicP8jHDBZmsNaKXON/6ddxsiE9XhuTx5Blqs5?=
 =?us-ascii?Q?ywWn8Jo5Af1p0CesvA/dHQ6eZiXqe4VmsqfsOSdjF20cvZqQpYMbtP9itT4w?=
 =?us-ascii?Q?XwhufTX7eKz7t29JEp8jErDr75mlnjFfc+yodDboO7QgpBpOLMar34y6KbWw?=
 =?us-ascii?Q?4c/wXxGZhJ28PInZshDPV2c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77db58ed-f799-43d4-6768-08dcb4e66b5e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:34:51.7320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LUkDo73Lay8TbSxlZlizE5J1nI1dCO6lK9wqlOhERANwbFEKQjqOGSgJv+zpeuDbigTBrU4uNZYxgwxDp/d521ZqYeHLSveqq+nmixLxSudajQi15xNrsjWTBjeMFCzm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7994

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/soundwire/stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 7aa4900dcf317..d471506327579 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1781,7 +1781,7 @@ int sdw_startup_stream(void *sdw_substream)
 	char *name;
 	int ret;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		name = kasprintf(GFP_KERNEL, "%s-Playback", substream->name);
 	else
 		name = kasprintf(GFP_KERNEL, "%s-Capture", substream->name);
-- 
2.43.0



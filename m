Return-Path: <linux-usb+bounces-21241-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CED1A4B6AF
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 04:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A69C13AA082
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 03:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386481DE4CE;
	Mon,  3 Mar 2025 03:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M/too4sg"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93581DC9B5;
	Mon,  3 Mar 2025 03:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740972757; cv=fail; b=a5A3lO1oaSZkJS6kb2B+S1yiXlzdfvJPlcpd4A1Yw3YutM5psKZ7kKkJwTuW2Vr22OYeykuTRRHZ0Zb6qyQrl29Q+HpJmxm6E36SngN4b5+btywnGsMBNI9VGcnxt3TkE20lPnvAI9r0viIY9L2oDt+bOQBxqrv5jH2OBiH13zE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740972757; c=relaxed/simple;
	bh=QnJ7P2QmMQ6h9diEnhtkacpgc/ZrC2WjKRCz2udpWIk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=J9Xz0fTPUnha5Xakazx4d0p2ko4KaQQdjkKrAKOfZZZlYfjKTys3Jm9ZjBAFIsfPy0J4g18zBKW4lPIhFHEVenWDfGpvh864y2fe4V3YtknWMiBI0juYxhHl50SLowyy2c2+huw5QYoJT8dxY6tQ16Srf86WJcjFvVpH5gpRdfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M/too4sg; arc=fail smtp.client-ip=40.107.22.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9UJHk5Lgbd87vMHkpuYqUt90GHBZo1dLZCbz5dpzAa01frOEfuMlCg4uR1zk8oIkcDoWmkNsJLhhOKsbutSQEz8rWPjCUlQOwG7xqh9d3O2aAUAffCNtq06uKy7sIB5rr022nH3V+MmlwzWANvxxcVLfOVWKVjuk7J3yguY4dlw6TS5E3jsR1WasEQlCSXSRJ/rZucAUAUT/AMnamS4Pnq0wcPS7hKZQkUB3Ba30VF0JnNSAo8E86V4Gtr/MZcKtxgtVfuDbAimS+0swP5g4fWlYuRH5YeEGu5kQNNrM9ZlCoy2/mKG16yS2StWA3g+iaAGV28LRGievNGHZZ3P9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LE+OWrQw0SKm8fMS047m7v04qN6PrLvllHqeF31dp8E=;
 b=TwfSXW4bngZEtmJJ2UoWccV43/dvIMgyUb1VTX6Is7s+EHeO4BjqgEthTO+DJxhL9IytBI3uUHwsTLDvFq2wkurE/Dv77O6cxM9F9gxlzJ/W/MZHcgFO3H6EU27Qk5CaggHJKQfOxxCp60Vd1zd/fXXYLwAuPobXGTjEbAYgupymt6YgyOtLRZe/GCxb7EVHSzUtwZwuSyPXlitIR8qjj3kgAcbDIyNCx9rOQcYpe9e5m3hMRySWB1YR8dHePjO++N6DUNMkRkrOAkJtvN1j8tgTFEhcWOHx42gFPeZ7NO+F3L9R7F5c/lJPDkAhyNAUf6/nDRImZ52NXLy4zl+f2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LE+OWrQw0SKm8fMS047m7v04qN6PrLvllHqeF31dp8E=;
 b=M/too4sg8DPgLMTInzHHusKbkS52PeZlUG6uI3ftHbZ7MSopMLTKdRMPDlVfIdm7exL4ccqN5oZzl3QjrwaLY3g+255pyDTh85a0EENwDWpqoQmRZDaKTdwMHRp4PUnAg6rgFzEXIloFHgDOJd0Lip//j1W5evEf8g1hp6902AS/EEjnrlNIc2yn/z50IWXBSfp/+16zksZmPM2rQWai+qblyTNR0/xMKZuQq+e4/hf1vEyrcoD9bbIULfihu9HbN9Ml+qU0PAL9T+n5HFZo0DK55DV33UrGG4yc7WASXOfjSeSr8H1MOTd3h/6EMCjI2qsMIdx5wv3Rwl6w0VQ6Ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by VI1PR04MB10026.eurprd04.prod.outlook.com (2603:10a6:800:1df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 03:32:32 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 03:32:32 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peter.chen@kernel.org
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v4 0/6] add USB2.0 support for i.MX95-19x19 EVK board
Date: Mon,  3 Mar 2025 11:33:38 +0800
Message-Id: <20250303033344.1251076-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096::24) To
 PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|VI1PR04MB10026:EE_
X-MS-Office365-Filtering-Correlation-Id: 408f4d0d-ae99-49f6-9ba7-08dd5a040891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yc4AMqfyA2xgDk3IQIJ2UoT/Tz0oTSyY+QyGVgd+TO6lG3kuVIdIXQAM7xqO?=
 =?us-ascii?Q?Qx3Rqqzi4k+4cW8hPXVv2L6vtvMbyd5+v4AZW2t55z5VVGzw+W15k2OUlXh7?=
 =?us-ascii?Q?OoOCwcroZmy/g2yJu0lu3jEVMSFxjAIH67ReSO9CZcUNHfPw7Dr1ouH8VCbU?=
 =?us-ascii?Q?Swiz9e2Jkl3AsCosYjR5Smx0l2v9Va5Cflb0iT37bAG6VtIzR7xPllwqrbfv?=
 =?us-ascii?Q?U13xUtpULraDMExMvfsMsDj1ko8nKRIX5B8o65sJGjpBNidVNY4r1U6RQarp?=
 =?us-ascii?Q?kAB1YwZuP/CvTZBpdAL00Zo8fE2CfhR5FuitaRpxTziW4hmNO9UaVUencAmn?=
 =?us-ascii?Q?fZAhp+TpgCX59e75sm/aCc1ZjbvTDqRKEeD26aIgdw5tYs8zDiI3iPLh3JWe?=
 =?us-ascii?Q?d5GtXnDmPFR2+GxjBhdkkxeVXLbmuVzGeKaCr4sMInqsCC1e2y2IPsu4GRIp?=
 =?us-ascii?Q?mFmd48BHCNPUBxicvKPr1DwDA597V61RL2KTIm3eSwHqTfzZjddwDJ3m5brw?=
 =?us-ascii?Q?QJyrnrFDjahd9gJonKGbuMxg8ygxqosllKbDbfifMRB6E6SRFu9kqbpwzKTC?=
 =?us-ascii?Q?CH7ERZnjOOoZfn7p7DtkIuvR6JnLZepUZnyTcjayJKgl+LaUW1rjGrmbW+uG?=
 =?us-ascii?Q?oTnmqKbLwQLOV5zCSRy1N4oMhophBe0au2zzA2jusNzwtR9BIf2Qponog+7E?=
 =?us-ascii?Q?NmEHGO1su+Rr2WrNCnAA50rLUx6zbC9AnON0QLfQaUKHgSuoFUAlKgXz9ofY?=
 =?us-ascii?Q?R9onGH6z6W2bO8EDoMwnQhU/u4Nd+ObL2C+URZWtRb2GzVJvLfxKNnn3kp7p?=
 =?us-ascii?Q?bK1o/4RujKi96xV4dwDqQeMEnVl9otERm0V/DxfZ1d2NvoRT/GIpqJM7ITo9?=
 =?us-ascii?Q?4AlZCWRZRYzmPPb+T+1AicsfiiZ8l9ms2v+vbHkga/02VcEyS3YKB8eK+aPB?=
 =?us-ascii?Q?BV+mruJWcnVB94JCkcG3TOq8+j8Y146HWa30vR9K5GoYZNVc6XuijDhzlmVC?=
 =?us-ascii?Q?9+5I2iT7l1AV5Hq1PJfZlKMxLbEoAZZi2QuXaeoqTk9F/xtOHkWyhWrbhr8s?=
 =?us-ascii?Q?bY4Wp3IlFcNScsjwZfhLaNkXJQVA7xZr/TVwsYxVB7Qts7rMlFUT/HGLwbqe?=
 =?us-ascii?Q?VUpl0p5FK2qUlsZEb8qw/lsSIO5GYa5HjV/tTF0oGwzkl4l3w2M6IwyN2xQg?=
 =?us-ascii?Q?BjlJGOSW2MOd7olBUXa2N6U1BpkcPlsVXuwqv2Hb9ReIykSahzZHxTKgqNEB?=
 =?us-ascii?Q?n6yjveTCkZ+oqp+cygus4O8RnCqDB8bK+LQ1vcgQxV1FIwxKQocxVk9lv6St?=
 =?us-ascii?Q?TsXmDmIuvxF+9RoUF9JmuZESZLw+YiLM1Al2NgvZ9X0gLvT3vDWGsXStQj3Z?=
 =?us-ascii?Q?cQcR7gTXnMuT5LiPIM03vMOrkG2V02ZPI4m0HxnxnvZoN13bozlfAWEBCevN?=
 =?us-ascii?Q?WqZc7sDcSM757jTpegNNsRRtklTM3uRi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EVljpXJawwnP3kvkPvdlyc704KfV9QlNj+bY+A271Sbo2Tq+pNyYv3nRlmhK?=
 =?us-ascii?Q?C0I3Fs1LW1pM5DowLL4boPwB2l29M5J8ki62bXZ5W9DSNvUTlBAT3XhS0ynT?=
 =?us-ascii?Q?OkJTwEeoG3uvH6ym2tZlvjY0MESWUFeGpXgyiNvfL9MvW66QR0fWxrWuLrep?=
 =?us-ascii?Q?cpcASDVP7RhUe51Xyl+IUfzUsw/afHYBfYq8rxXGYxWIPVFf2wvNSDwT+Ksr?=
 =?us-ascii?Q?q/bKnvChuD/3ninco9YD59vEpvZgdySX1Xq3aTplug5rB+/AiNRmQJFuzvrO?=
 =?us-ascii?Q?wxF5btvFsJbrhpMndYxwebnrOnb1qNPYsmCXoF/F25vagwyZlYUJJnnZL3YL?=
 =?us-ascii?Q?cplnttTcK3v2HxO5S96Pb9vo8Uk6xh6T+wx3OFVp0W7S/7Z+qZdixuzQ4f0Z?=
 =?us-ascii?Q?TDw2qe8cjwzvuDeUL0cBzqmfcrvgloTBjEEIlvShVKt6mVoqse7Hq1G1/wnD?=
 =?us-ascii?Q?oVcRLDAJN33tu0xvQyMkyMxrHswMvyVEAv34wUkn4M0dgadvXXtkZBx00Pa8?=
 =?us-ascii?Q?G7g9hf1buST2eDvoq6PAw/8oY6egR9DcxjQ4GWUryeIqGqfNy7xp14FOIzcY?=
 =?us-ascii?Q?HNIW1XL/4mQv8ggWs4E6Tj1/76TMqPclIQOg79V7pQeoxbLQn8hfJueZu483?=
 =?us-ascii?Q?L68xVDlOyHMvOOMtRv9uRNBAi9Yv6uN5zgD5EoZQzmrumsFW7x1S5KdGcMy1?=
 =?us-ascii?Q?UqlndanA8cq0LKHHHRoBJj+84fG4PkaQZKv26FjOIxxeR/S7JG+4oUdNdUTI?=
 =?us-ascii?Q?u/O/rY6R1b/6Ldwj0uabWEcBkQ6H+FYZvOb+ektuRQG4j3HyX/sIJ8RIXGZ3?=
 =?us-ascii?Q?jP6jcAYwFt2l9BpdUx/LtkkxR5DmCCvm0jwmQe6GtXi+tzRCVlu8D52CoFij?=
 =?us-ascii?Q?sADWE++279OWG91RaSW4VYZtC9PrtXbyd7a/grGY9CWk/nx/RsSBwdZ9bnEk?=
 =?us-ascii?Q?Ab2NMAt3RXeqqLmLfU9F3XNWnhtZl8YOKf8Arne0xkh5C9BHgFFijBwKGzpc?=
 =?us-ascii?Q?pg5pqx3vLG8RYnLIINUyK/8+4FvO/WckehTFQOngeLprJkxRGvziTFtqjnD1?=
 =?us-ascii?Q?f04h2UCiAHRlOv/rj/0AV4GBMKo/coBsjoVK4xL5m7dbI/yWN1Emp+uVP1sp?=
 =?us-ascii?Q?uJGzixKmoAWIvZ5woqWb4IXtkapdOj/KowS5+dpdZGaBDB/+2GSM4Ejjamne?=
 =?us-ascii?Q?tlY+v3AWDqorqvv/NNA/Ygenzy3SakV55+iEAfXdDzcpdtCyW9cxjIiSdRrM?=
 =?us-ascii?Q?ozSUWE8tfhTDRW2NCjkNlYaGWyeySxyKm4xxt9+Y+XT7BuVGWrhzgbcSiGg0?=
 =?us-ascii?Q?ZAPJoaldFs6ypTaDqSUDNuziyaEpDr8nb5LomY7dhkh84df+5h04Je21OHoy?=
 =?us-ascii?Q?YdVFrzAAxtGxZAJX8LVG1wV6iTJnO7hVG+/TVeiRB0mNi5Wc0uJv6SHRxgfJ?=
 =?us-ascii?Q?VHpYp8xUuCoevF5sM5sy+4G1cv6IyYr50WrfhdXtLwQWYMPzYB32+Sies/Cj?=
 =?us-ascii?Q?Vn0LeNrchzmMolB1l3o6XkcJT9fcwYHOq7zzzrj2xlHp7D+huM/S9DU6EsXY?=
 =?us-ascii?Q?jBl77Y5AxE4VeUyATkrC61mMNnh+z8p2RVnIoHSL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 408f4d0d-ae99-49f6-9ba7-08dd5a040891
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 03:32:32.8125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nrmbUdk+xVQonG7oBsdw2dhlqk1Wkt12LP6FZ1c41N8TiTfpaoMRipc/j2axUiQkTIQKztp4lXrLgmdSkhTBwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10026

The i.MX95-19x19 EVK board features a USB 2.0 Type-A port, with this
series primarily introducing USB 2.0 support. In the i.MX95 architecture,
the USB wake-up handling mechanism is integrated within the HSIO block
control module, utilizing a dedicated wake-up interrupt. Therefore, we
also implemented corresponding wake-up logic code to properly manage this
functionality.

For detailed changes can refer to patch commit log.

v4:
 - add blkctl NULL checking
 - warning if wakeup setting is missing for imx95
 - add Tb tag 

v3:
 - fix possible build break
 - remove usbmisc_imx95_init()
 - add Rb tag in some patches

v2:
 - apply some suggestions
 - improve wakeup interrupt handling
 - add Rb tag in some patches

Xu Yang (6):
  dt-bindings: usb: chipidea: Add i.MX95 compatible string
    'fsl,imx95-usb'
  dt-bindings: usb: usbmisc-imx: add support for i.MX95 platform
  usb: chipidea: imx: add wakeup interrupt handling
  usb: chipidea: imx: add HSIO Block Control wakeup setting
  arm64: dts: imx95: add USB2.0 nodes
  arm64: dts: imx95-19x19-evk: enable USB2.0 node

 .../bindings/usb/chipidea,usb2-common.yaml    |  3 +
 .../bindings/usb/chipidea,usb2-imx.yaml       | 24 +++++-
 .../devicetree/bindings/usb/fsl,usbmisc.yaml  | 23 +++++-
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 16 ++++
 arch/arm64/boot/dts/freescale/imx95.dtsi      | 30 ++++++++
 drivers/usb/chipidea/ci_hdrc_imx.c            | 35 +++++++++
 drivers/usb/chipidea/usbmisc_imx.c            | 77 +++++++++++++++++++
 7 files changed, 206 insertions(+), 2 deletions(-)

-- 
2.34.1



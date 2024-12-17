Return-Path: <linux-usb+bounces-18573-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 186B79F46F0
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 10:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EA6A7A03CE
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 09:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595A81DE8B9;
	Tue, 17 Dec 2024 09:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fay9ijVm"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011022.outbound.protection.outlook.com [52.101.70.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C173D1DDA35
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 09:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734426719; cv=fail; b=kmUHqU9701yV51tWI+mg5BqZ5IzqXX3KU+UTVyZYk+xBHVZt4aULIjkybQIhYrL9EPOxB1PZOUk8se9XJ4f+BZhSQnDm0WKzmp1U5M0MchoR0YyDUBArCg2x7eCHkvkdkNGNRwFpKzQ3+bnHBkCm3BU2fUyZMmwyJuK4QBCmXNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734426719; c=relaxed/simple;
	bh=3zk3VitVabxl2UmoEjNUlEIX9XlHXaWHXVN3kjvGTtM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=F/SFddJ/B9IdG9YmMnttIwr3rut7h2c/D/V/CD7RXiMFPEg+T7TMx5Qg6Orh6FuKL9WUEPG7ePmggTjXluu1njDMuV/quCMJBM42OsHjXxdl1oi4/VPdwm6OXlZtO5noInNxw74h0V8gTLcOJzPzyhbmEHS2LN2jKitDe8Jyaa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fay9ijVm; arc=fail smtp.client-ip=52.101.70.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKOBSnpI78k98725pvLLDAY1Sb3kcgXfoXC3/ACTvxZPIs9huT+zXhlS4kk0f6hlDJuVjjmn0hko4KU1vBhkyC0KK7TYo+2A6jBedeBCB8qbqnAc0Gj3pwecGG3kHyfaB3c/59NIZ2xyCWbqmlH5whfmS9RutTdOOD7xPPCXH3lbLJFVTXLBO2Q9sP3UIT/JczvQdxWh7d+d384m/kaRAnpuLxNOET6TO+ZuNZHaVNuBdEduvBwyQ9kESAbDKQUJMbaKJUPj4S62E0jh2pz4qeICA3U8UaKebcMpfzS1WV/mN+AxQPU9RwdeIAEhylKLlfnHEu2I3hOOO1c7oIFgsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CuHn30tckrHqiTGGNrq8d/cvCZXDx5NmVuUEq/TvyP4=;
 b=KvwqJkvb6VObvmniuZBIxdEnnHXuWGnoS3jookZUM7OcSpd4TAEVDDaaOXJOzm0bNuVe4NZSqne+e51Iel3yOjJo2KfLB0zOYjS4ZQ68iXxsCe7AqLa3j2yD6ipXPVtfN0coTeN5n5pDosG+uk2JQO6VN9hQNix7YVMMBCP1JjjSb0OTqSJPB1woIwZqj9PDEUbTwMXOKy7RoZsM3tP8r2MRg9VKGWiGtIkjnC8jXv2P11drgSRKNdlv0X5bJ3Bh0p4vARbye9pDIongDv+dOYsD2b44s5S55L2YePC+7OPs2Z1+ifOKWJjr+3c1M+CwugXQYANBglzbKrNqYAl45g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CuHn30tckrHqiTGGNrq8d/cvCZXDx5NmVuUEq/TvyP4=;
 b=fay9ijVmSiTkxt7DPuHG2/TaaUh7RURaiOn8XdRP7nlKG6SdHq6RAjeB7Tz/uxRjHr6Ij1Qu+oYFTKSAecNh1CV+IItVUYFb5vlMoCphW6V2ZDV0GyTCX4t6z8yHLd6Q+8pnGYil2kQq8jcbppsYlEQVPN4a95c/fUOGnHs4yow/C1vtFsA+YXn3K1ovGw44asffZV/bHIaVxenurFH28laod8ajkZldfZp98KaDTxGrlRIsGcx8Ls/jGI2JylDCw1jhRzrzXMsWHG6s0GwjwO5CA1byPLm2z1vxI7isQidhQnN4mmhEj0tyaqX34f6BAwW9sA0Peq2ZmSRxL2zEoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU2PR04MB8888.eurprd04.prod.outlook.com (2603:10a6:10:2e3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 09:11:54 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 09:11:54 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	andre.draszik@linaro.org,
	rdbabiera@google.com,
	m.felsch@pengutronix.de,
	dan.carpenter@linaro.org,
	emanuele.ghidoli@toradex.com,
	parth.pancholi@toradex.com,
	francesco.dolcini@toradex.com,
	u.kleine-koenig@baylibre.com
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v3 1/2] usb: typec: tcpci: fix NULL pointer issue on shared irq case
Date: Tue, 17 Dec 2024 17:12:07 +0800
Message-Id: <20241217091208.2416971-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::26)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU2PR04MB8888:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c27e12d-ef43-4011-78c6-08dd1e7ad9d0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?PyZmobOX1vHz9pLak2kp3pGIsYBuxBAkRUTtw2ygjorAclXN5eMtKGffo3Fn?=
 =?us-ascii?Q?Ujr9zgi3nwkvxsUYuRzmGbN3/0CrTz8LSZIQqi3YtEf85O9bFeVNFXYpw116?=
 =?us-ascii?Q?ihgdxUMEoX/HrrZvNsnyhu75/0XuB7yAxR8slqJUy7E+QQ4Z8pAG2J79P0Qu?=
 =?us-ascii?Q?QdkiM/Zd3QLluwslWMicmRZqTGNlgT0RebJZySKBckWYBIybWaKrNrtdEGUI?=
 =?us-ascii?Q?DDrTKh9Wu2oGAyqB02p4xbnhEZH7N9VUBXjU/hQZWuxuoQG2do0AQtky12F6?=
 =?us-ascii?Q?pufcri0h6SPf7S8046DDCfdTiDMSiZ1eEjHw7m7aEOb6vldLqJ3SVd9Q0xqp?=
 =?us-ascii?Q?IiS0PkS5z+k2GilbMEl/voA7Ef6lrhQos6cpO3EMF6Ve59fbWCC3C8m9b3ct?=
 =?us-ascii?Q?1YS1SP70jgSvRiiotKzJLY5WC/RegDB3tzsfcoxHjlY2FZNrw8IqxHsi6aMe?=
 =?us-ascii?Q?+KUuBdZAufpOCz3OeXZJZplHvOUW5/l3QaOahHVM2167K0bqPepRO5zgcrXy?=
 =?us-ascii?Q?RjatOrz3wB0fpdXVL+NrGOqB77PDCsvS5Ro3IrlSo433FhO5Z9LVfVfCMCBi?=
 =?us-ascii?Q?KAs68LgNewBW8dQ74HsC05mgqHhJ/HEmgpw4kFPzotI2TH5DeP04oNC0A6p2?=
 =?us-ascii?Q?Pkc8sbY8FbqiJt5qFIomDIAozhzv+2nC4pXt9clZy0Xq2Gb4aafPctgZX/80?=
 =?us-ascii?Q?sY/7soOZTORT+ixyBozI3oSMtGiHZ+ZZWdaSaxqOEpCQ3H9/i0CCJaMUTGCM?=
 =?us-ascii?Q?4SlGaX00o8KkbpZrk7/5lw4SclQmyjw6OMuNejkGi+FSfiXxvjfqGOkW/QpE?=
 =?us-ascii?Q?YN1lBttkRdnstMhgA/OgL/mRfZbxAEqKqF810RMiC7fF9CnDXrerOvzm7ZN/?=
 =?us-ascii?Q?3kqEoTvyVLLRnQj/yjXU3teHixTkHlWPSpq1K1NEniW6Io+LVkFY7XoDMyDW?=
 =?us-ascii?Q?ARkFJAaA0Zw60uTU9MUy24QONVxSgygmvG6Ly3SX1OBgf7QSS5b4sQxGL54i?=
 =?us-ascii?Q?Yo/+lj3JTo8ucXzA/aBWEhSgEtWeLF8eUt6eiMnqRJxL1Ysj+2xc3XB7IhDV?=
 =?us-ascii?Q?PWH83KVtJ2A9LOCPPDzXaA+y7UiWQbm7fuS+NlRN8o2n8OKRb2xhFZ3CPbWj?=
 =?us-ascii?Q?obKgdxc1h27jt6rnjv5q0IJ2hM5ZwR4bZDydTJKbGrSoLY0v4kmm6jtHjACX?=
 =?us-ascii?Q?yj8xqYq75AFziCwyuiCXlstIKqmNXJ/Cdlr+6NPA+l6CVemN1l6n9KG8hE0n?=
 =?us-ascii?Q?RbKn4vPHGkh+mvKALrVEiiPQGKQwHB1B4O6Vcp2LU5iRMRGPKleyMEjG79wY?=
 =?us-ascii?Q?8ufiozOHoKIzoMsUnjtmYulojXBLJ/i3MZTw5lJ3kQCAAOIytYbykG78fq0x?=
 =?us-ascii?Q?F2nrBsDvYpLbvhYxulGYjhSbTK3R7jNoRgpcRuBj21OCV2b5QotRrcAySJtk?=
 =?us-ascii?Q?Hu8mVsCEfOK99NufAJRMdiQ4IaeowamoIrXLAOdkK3Xc9QWNEAw9vw=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?YwGhzF252adsCF6bytNkvRT+LWs7J9wVyZ5SO2NtIwUfUwRloP0pZ83VKLwP?=
 =?us-ascii?Q?WprgNo0wFv9132EddCOhGOQx4RI5A7xgNGomG+oJUuENIoMUKTuUIxTUqBUk?=
 =?us-ascii?Q?U3wo7LVKUgMo/UcgEMWFRGgrYN88awVjvpu4RmM/m2WPnk2ustrZkdGLZe5S?=
 =?us-ascii?Q?asOan4IsXef4QpI1HjXpr462tDkPtjsEMScubNapBraDkSwboQ5BksRkLu5G?=
 =?us-ascii?Q?eIxxl/9yGieD6LWZ52hloQtUxmNjasPzkFOopyYyoZQb489BlYUWyA+vxjfx?=
 =?us-ascii?Q?tFXlL/3T9ZI2Ug/PZU1hSlK9qOcmFwzceVe4j93rZ/K5zG8w4Y08JRjJIoOf?=
 =?us-ascii?Q?KmYzImGUIBSQkfuWINJLj7/SO2zUEGLfTsTNFWrcuOqUEq/5UMkZiMJulnFZ?=
 =?us-ascii?Q?e1GeRXG7J2xvdtJKhDE1AmQzHyPy/6W0r0+noIpFRnfM//W0v7cQiYEkqUS4?=
 =?us-ascii?Q?FTwsHuzNj8PkJkH7HaCITMBpDY88IhqtLwTR9iLJb+AyzlFA8oC7zRWeKtOg?=
 =?us-ascii?Q?B3uX69Xvn8h98nRDNnwRjB63hXNEGZWHAuUDvA3i4rOg9irdjHESZoWsdhtI?=
 =?us-ascii?Q?+p56Iwa8jnLHenwGuS0/6JmCXMqma36MEiu6u2GcnV8706yQx8trGsjgAu/j?=
 =?us-ascii?Q?GhQenVoYqOaM5m6tqg78vfWEoAUyhcw/FvXoMJqXHDFAZ0g/Lh9kISkMfWcs?=
 =?us-ascii?Q?4brkYwcdeC5hz+4nzkPFw0AbEwhBedSLlBa13fLy14PrItCufcWZ8kNtQR/y?=
 =?us-ascii?Q?ijDXpcEeBo4ZkE8Lqm5kTrW9ptJCbO5SZwCf0bk9hFWZzSZy64eLs0WtERCV?=
 =?us-ascii?Q?x4Fv6+VhypwBgvgJS5qLHRqrSY0Wv//w6VD0KOWfvJ+fkXHAARMJ3HBE9WsL?=
 =?us-ascii?Q?B6H2+0iVxRqHFIKaTCXPNI36k7ihosrPLmn9ULZtTc3m4aG3Aliqvt2QpvYY?=
 =?us-ascii?Q?m2V2zpVR9WyxHiY94qgAhARecoTyLkL0ePyF3YlPZac4Cm/EnO3YTK68EUdw?=
 =?us-ascii?Q?6gbpPW9p+OrrL0FzzbSNKNWSUQ7O3fVq98wNOxWlFT5O6f+zxb3Tz3lHc+Mu?=
 =?us-ascii?Q?vThCHxnBuI6GqBtCRJ2uq6o/f7ZzEIf5yCs0+pfXEeQ0h5Dkq2cx+mV1foHi?=
 =?us-ascii?Q?CBvd9kGmEVKgE3OpYfm1SnI2Vr1hIavysPdjl7VJicsrEVuoULC9HE3WYqXY?=
 =?us-ascii?Q?Z5MK2tPa93bnAPQQgqq4StjvQQJI+11mNIOyPDzwhA1PrKZZA2evoRwe8mEP?=
 =?us-ascii?Q?MAPnjwEAh0P3aXwkeHIIF+PCgdAVYfqe7/ycJE2N0vU5ugbh5P4yG2IbxeXM?=
 =?us-ascii?Q?usyAhaTLf4Mq9f6pK87oiOKktVZuAfOMmdSX5T8Lm4oq5Euik443ZyGccJYH?=
 =?us-ascii?Q?KlvLFPMWc8QG6Dlz6Grg93wdGy3MMKv11mtEX8YHekgHFLWVaBHreKzIubSs?=
 =?us-ascii?Q?2GgttToKOBoaNUXtQfnpEpTN9b7+1oOBGu0wusWC7cnedR9O9iXmWofUNV+r?=
 =?us-ascii?Q?eM3QtawnQnZ7d8pm9fAyU78beq1prtV4FxdWEzyDfez1wCyPAGmwZdaMyoCq?=
 =?us-ascii?Q?xcOOhAdzgoALwPnmknzXto7dlTtAAuWi9ohiEiRZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c27e12d-ef43-4011-78c6-08dd1e7ad9d0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 09:11:54.8037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kp2yFzIly1jmVzZeTLbOMmDws/FkzYYcZPxP8A9ExspF74LCRC5kLuCBq5UYTa5Of8gJbovVNQO3Z5a9Ez44Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8888

The tcpci_irq() may meet below NULL pointer dereference issue:

[    2.641851] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
[    2.641951] status 0x1, 0x37f
[    2.650659] Mem abort info:
[    2.656490]   ESR = 0x0000000096000004
[    2.660230]   EC = 0x25: DABT (current EL), IL = 32 bits
[    2.665532]   SET = 0, FnV = 0
[    2.668579]   EA = 0, S1PTW = 0
[    2.671715]   FSC = 0x04: level 0 translation fault
[    2.676584] Data abort info:
[    2.679459]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    2.684936]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    2.689980]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    2.695284] [0000000000000010] user address but active_mm is swapper
[    2.701632] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
[    2.707883] Modules linked in:
[    2.710936] CPU: 1 UID: 0 PID: 87 Comm: irq/111-2-0051 Not tainted 6.12.0-rc6-06316-g7f63786ad3d1-dirty #4
[    2.720570] Hardware name: NXP i.MX93 11X11 EVK board (DT)
[    2.726040] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    2.732989] pc : tcpci_irq+0x38/0x318
[    2.736647] lr : _tcpci_irq+0x14/0x20
[    2.740295] sp : ffff80008324bd30
[    2.743597] x29: ffff80008324bd70 x28: ffff800080107894 x27: ffff800082198f70
[    2.750721] x26: ffff0000050e6680 x25: ffff000004d172ac x24: ffff0000050f0000
[    2.757845] x23: ffff000004d17200 x22: 0000000000000001 x21: ffff0000050f0000
[    2.764969] x20: ffff000004d17200 x19: 0000000000000000 x18: 0000000000000001
[    2.772093] x17: 0000000000000000 x16: ffff80008183d8a0 x15: ffff00007fbab040
[    2.779217] x14: ffff00007fb918c0 x13: 0000000000000000 x12: 000000000000017a
[    2.786341] x11: 0000000000000001 x10: 0000000000000a90 x9 : ffff80008324bd00
[    2.793465] x8 : ffff0000050f0af0 x7 : ffff00007fbaa840 x6 : 0000000000000031
[    2.800589] x5 : 000000000000017a x4 : 0000000000000002 x3 : 0000000000000002
[    2.807713] x2 : ffff80008324bd3a x1 : 0000000000000010 x0 : 0000000000000000
[    2.814838] Call trace:
[    2.817273]  tcpci_irq+0x38/0x318
[    2.820583]  _tcpci_irq+0x14/0x20
[    2.823885]  irq_thread_fn+0x2c/0xa8
[    2.827456]  irq_thread+0x16c/0x2f4
[    2.830940]  kthread+0x110/0x114
[    2.834164]  ret_from_fork+0x10/0x20
[    2.837738] Code: f9426420 f9001fe0 d2800000 52800201 (f9400a60)

This may happen on shared irq case. Such as two Type-C ports share one
irq. After the first port finished tcpci_register_port(), it may trigger
interrupt. However, if the interrupt comes by chance the 2nd port finishes
devm_request_threaded_irq(), the 2nd port interrupt handler may be run at
first. Then the above issue may happen.

  devm_request_threaded_irq()
				<-- port1 irq comes
  disable_irq(client->irq);
  tcpci_register_port()

This will restore the logic to the state before commit (77e85107a771 "usb:
typec: tcpci: support edge irq").

Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 = no changes
Changes in v2:
 - no changes
---
 drivers/usb/typec/tcpm/tcpci.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 2f15734a5043..db42f4bf3632 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -923,22 +923,20 @@ static int tcpci_probe(struct i2c_client *client)
 
 	chip->data.set_orientation = err;
 
+	chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
+	if (IS_ERR(chip->tcpci))
+		return PTR_ERR(chip->tcpci);
+
 	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
 					_tcpci_irq,
 					IRQF_SHARED | IRQF_ONESHOT,
 					dev_name(&client->dev), chip);
-	if (err < 0)
+	if (err < 0) {
+		tcpci_unregister_port(chip->tcpci);
 		return err;
+	}
 
-	/*
-	 * Disable irq while registering port. If irq is configured as an edge
-	 * irq this allow to keep track and process the irq as soon as it is enabled.
-	 */
-	disable_irq(client->irq);
-	chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
-	enable_irq(client->irq);
-
-	return PTR_ERR_OR_ZERO(chip->tcpci);
+	return 0;
 }
 
 static void tcpci_remove(struct i2c_client *client)
-- 
2.34.1



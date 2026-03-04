Return-Path: <linux-usb+bounces-33973-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMlGN8kdqGnyoAAAu9opvQ
	(envelope-from <linux-usb+bounces-33973-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 12:55:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FB41FF616
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 12:55:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 97BF3301C14E
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 11:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9408D31F991;
	Wed,  4 Mar 2026 11:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bho1ST/g"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011006.outbound.protection.outlook.com [52.101.65.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DAF3AE1B7;
	Wed,  4 Mar 2026 11:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772625346; cv=fail; b=YuWuvUYWrOL+gmt7UWVuCNF1k4O+QBwwg90aDc0cWvwB2cTSFqOwtEi0IfhsHBqoZi2UqgaIiXQPyyQlOZM1/CBtzD8dRa3BqVtrM35se3HzxeKrdssK+oHRqhQeTeOYNPw2kb3lyj0Oq0M5+wFeWqWNRkW7oW8K/4sYZx+GOnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772625346; c=relaxed/simple;
	bh=qGQLylbYElkbG1hln8AiPADwh6qQFFbhgoCzB+qofKs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=AyaY5O3C2kg2byRcCOwiRPMBczyMPSwK3K1xMTgmMkGl7zuw+3NBVKJgNtrmJKduUffgNeciYjs79ISCSCLKn41E0Ca9nsOEGBqVwyoUlKyqN7EFcS+mFnE0CrGjFijNMp0npS4UuzQOiuP001bafWryZIE248BtZJAnWz/5Mvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bho1ST/g; arc=fail smtp.client-ip=52.101.65.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZBKOTcfQ+HYU6ckl0dGs487oBi9JccbqIM/PLuv+w4fe6991FLEr97wWa+b+vN/KXupqzJ3661PMU4DnvpDKc4mj8rvvFxPbcCQvqSzBrRrFQvGwEyBTnIRS4LFjSH/1BVYWONGcf1MiDxfggedTcGydBsHUq/E4oaVxdRCtfWu27kZPjPc48oA8FNgcYxPnipcyTu4pC9Rq2Qm/j2e9kS5Jx5gooZGRtyyfa0ZDOARfwJFRIfd0HO8wtdzoKaccVadL/Hb8rCy8DyKx+g6+CREq8PIHSFvin1Kqk7OsOrPz3TYrOzf3v9bo7Y0U0gXIjIOag1HYQ/Pb7zo7vKaFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQ2rED/PBYO7lwcje3bFoLjX/Q3r7IDOyG9FkUT1I1I=;
 b=Zh4COs50bP2MQlKH/+8+lZsT+MIdbwB71Nx931wnRddtGCQgSLnaFk9WEl4CMxoZIRFVOrKxeKETtb29T4dyif2TCc+Mp0UFIaXuEWHyZ3jGcZPMQS7H+lDmG9Wr0Gws4oCec4Z973gLJHMUqcGCmevruxCTjnKCSxXCdQxJ9Sjbi3LaAPt3RId3B3AAOuiuK6cy4P/6G8zqVyMjKVj4a/UlKhJ2JfXKICAVgmCP8uHtcfVt4HOguI6JSq+95ypr5l2vTV4Ej6Sy5pZ7JsTzl3jVtVjGtvhJCU1gWS6qT93GH0qsbLMWqKwt8BlLOcbQWxq1FPhU4++jKXHup8M8bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQ2rED/PBYO7lwcje3bFoLjX/Q3r7IDOyG9FkUT1I1I=;
 b=bho1ST/g4bjUr5NOqbqL3RvphKC8VzK1x1PlZZqicS+5tXFRRBEk1uPpgCSkGovoy0mi5zNPp1HYRgQVt+cFU3f/3pXeY0fqRcYyajTlF1Sa08BEx9oMtIyh4CJUuZcRKgea1b6Cz0GnYzYb5QFn5Cn4CbxmMfq5rTdKJY62bhkWHXbk7Q+kaDYH4bGTstbIzDVBFPXUya/YdETr6BmowI9EBIZEs/6lR+4gM6fnloPzdX4hNB6xwyEJwHKDLuCXpIHMYBGT+fUqSzmlyaPcDetz6DualKgOB0GtnGjQTHNCzqrO/z1q6XP7y3k1O4BOIltOlclpmRn93pSBgwml1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by GV2PR04MB12339.eurprd04.prod.outlook.com (2603:10a6:150:309::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 11:55:39 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 11:55:39 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu,
	tglx@kernel.org,
	mingo@kernel.org,
	claudiu.beznea.uj@bp.renesas.com,
	kees@kernel.org,
	bigeasy@linutronix.de,
	ulf.hansson@linaro.org,
	rafael.j.wysocki@intel.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH] usb: hcd: queue wakeup_work to system_freezable_wq workqueue
Date: Wed,  4 Mar 2026 19:57:29 +0800
Message-Id: <20260304115729.857136-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0263.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::11) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|GV2PR04MB12339:EE_
X-MS-Office365-Filtering-Correlation-Id: 15d97c09-ddcf-4ffb-5ed6-08de79e4f426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	IxpkWtXtHEyq6JJkzQlC4bm8dFVm9PeKZUAeCjXQb5+TiYQ13mbabylK9g/X3dfZDNoLADz0vQg8iKMKYXsxeH9pW4TcltRzwrUp4atsQP8IVqsyp6yZhDTy5msAcZ88xmQtrxjLkTNZrvKMTX6IgbI83FYIU1QrV3Dq1MW5yw9CPsTet2xngDJwl4qZE2BGebUqEN1IjNbPaSkec6g/W7VOWuYGFpYrnA1CxaZy/H2JrVBasvbpBKTNDxI8NtfE07fQkaQ8WtyHFDzhKuG1yoKocuOyNgb0/X1lkCwMTt5fTkGGGAwSg4GMe//DOhqQor5Jm2QFfczIvGO5/C1El/VCZiZCLLZqT18+ZtqlRE4K4GGgBsGQNkkwUEFEP5YYTC6g9hUpt+YFnoOC3VWEacWdHuyLszW13QLybugk7LuCAAo1xfkWiWnQhMmNvQiu9Xp2wn2YG3XyJb2lQSgIWgQPK2MqQAq0jN/uFIflEWGhCZHiguR4IGQdCPiva7B3QhVXC9KWwU91HEzk0tAvCuku3/ZstgK1enXs+pvXm5FW/Cw0n0Oy8+p9mWb4aFZ8VQvDw2jugpmpy8uKzzfcIroFwhKe1pA7fRrDZLgn6COSDNbtdiROJpXVTe4cB4SpSgMlrasX16q8YXiHuHfUd8E+Pjs+Aagu4stTsfMKr5f2/pNNYSLzXFmVCI4Qdh1bVlO6VDq/LP7dCuzCdi1jpPNHlbF/t7JBPXuOl2BfZaoDR+t/P+lEmgnb9YXAth1od5Ti1LR3asF62QCNS0l879QvTfbPfiM2loyOgiZO4Us=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+5owr+sCfu2yMk5N0vMTgQdWVojhI+uwIMcEdI+XI75h7uD7Zk7inKbjJy4M?=
 =?us-ascii?Q?/cGJp9mF5QMk1VS5i3j7xpQj6hI/30qjQQyABFPphK99Aoulj7dg1slFvraJ?=
 =?us-ascii?Q?sKb28CmqUSxu7/V69rmn2il8fxXS8huw8ohUhllCRkxM3oCcxuTNAEP6Njeh?=
 =?us-ascii?Q?ikVeFEn0Ivy+SIXHINbGZVuYF9svLdZjp+vMlcjbYmpCOY4B72hNn9N0WGpl?=
 =?us-ascii?Q?+gLbtOZRgrIqc9ppCtT19/tZNk7vRtlsdTLl+lCsU+sH/cplo5pWrjkKN5ey?=
 =?us-ascii?Q?eOPbAZpBRc2oizx+FTv4vNzT8hV2nAoB81PWTvcqwuLkB8K3HWG9kZ3r5YmV?=
 =?us-ascii?Q?WesxSf082Ytt6DuD/KrhsIFBH1+ajkbTFFcxlI98wEXBBYwt1Nr8753jMVad?=
 =?us-ascii?Q?nEji5DCk5ZWOuDCirZ9KOD+WrqGE5syHAJiGi8YMpeJxLD6jC84gzU2SFKNW?=
 =?us-ascii?Q?l1R2zpR3kolGU0sN+Wgzz27ZKZ03qSLaeWPxQpf8r6lA1OwNiLAIT+gWnuRH?=
 =?us-ascii?Q?nrNkwsHvtBxZgYUvj62PDIzcGowI/THzTPpOBWcpt9nujE0BeQxHetp2/N2S?=
 =?us-ascii?Q?29Uq8dD+cqf469i5/0ekZoE1C050cdxbDYAl8yjlVKo7Zl6daVa7D8afm4Mp?=
 =?us-ascii?Q?fsXSl8OrDzzNoyx8avhOgKjcoQYEYMyYP1xY1QsxSQpJxUy7LiE8o52hnsmB?=
 =?us-ascii?Q?5sKRt0fu6kPTcdkXvO+H7CLb/kRa3gZRaBBC16Om1q21cf91luWG28PM5srJ?=
 =?us-ascii?Q?jVes6EkO3LCw4bbARzWjQwAyU9l6aE8T1eK9bxUD+3sfsorqVhO+tE0W+tj0?=
 =?us-ascii?Q?bt112PwLTXbJJnme5IDaZvLMgA45S0DajY4P5rLNbLbZ4jQVptuAEKUW/GFX?=
 =?us-ascii?Q?3Uct3oG6KiaeDzmFVoql18TAvf9k17jB+eSOCNihb7BzvJj+oZUi/zxlj6Aj?=
 =?us-ascii?Q?wborMdSXXZfMP+ucyqBoOn/1bLsavfPn5W/DuA9mlsoN3/3xmiivtmOrbTOo?=
 =?us-ascii?Q?SoaBTL+PC3v39ilfiYVzVbcDSh7/8rIaAydu9vV3Z7Hi8AUY5O8yLOe1746L?=
 =?us-ascii?Q?JtJxAnXXsKByRfYB/yVSK/0UT/1fW7BzTSG8mlKYgBhYhfT1V53baPkcwTUO?=
 =?us-ascii?Q?TDGZxBgrA5CKsFveworIzJSaPlyPa5+AAkiu4UU4enTbeaPVGM9Pdd3Kx7cJ?=
 =?us-ascii?Q?5Sgk8V1P2uLAY/opSBUWK0hqcCQG1EGfssAgPfdpFHwBDz95ML5FLAFNeeRH?=
 =?us-ascii?Q?hjjrh5QLFS2fdpPZiPxG/Os0judxhTqnuBleRN/P88bwLNdZ3fKHBmoLjJLR?=
 =?us-ascii?Q?STQ/OyWyUB4+kJ9NywvfnfrGzFGEqn0iHUnBAwdjgM0MOdvajQKn0kF+Bw+V?=
 =?us-ascii?Q?0MdHWGCcCXPWwj2VlYvqAHu4sGBtb7N9g0C9wveDSrACRZJkbIAnx5PJ/gkV?=
 =?us-ascii?Q?JUrXhiSpC8kyLZhi2pHL3wQ9w+gXMMQlUuNqxd8XpAucYqzNOrim4alAYPrU?=
 =?us-ascii?Q?8i/93UyTU7eDrZOFVrt6DTcbWThAoqGpEYTJ1ifODTrITpjTovlzLj5Oy6z9?=
 =?us-ascii?Q?CXOFZg65nB3GqfBEDRO+cEcieutaqGNN08+PylZGQAA5KPHs2aTHBZMTeG9N?=
 =?us-ascii?Q?e/M1vSE9OKvviJlBpvc0jlN7lBloF4cmO8k5djTJZL1SWsQxElVgX1aJ/+ZQ?=
 =?us-ascii?Q?bT0yjy0fZWRLGttxTrj6ibSOZtFNjPIb8FHOamYAEc5gBomkfLL5RAFxc44O?=
 =?us-ascii?Q?AdC50ALr9A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d97c09-ddcf-4ffb-5ed6-08de79e4f426
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:55:39.0356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bFl1AIrxltstMqB3/QvdEcj/sUH1GL/1s7VV1HfsbrqIIYeQmAjJG7j1HSsRqOrQF0by6J4xNY34RTW321JsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12339
X-Rspamd-Queue-Id: 87FB41FF616
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33973-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

After commit 4fb352df14de ("PM: sleep: Do not flag runtime PM workqueue
as freezable"), pm_wq workqueue will be unfreezable during system pm. This
brings issue as below:

[  344.255749] ------------[ cut here ]------------
[  344.277740] URB 000000004aae4ad1 submitted while active
[  344.282996] WARNING: drivers/usb/core/urb.c:379 at usb_submit_urb+0x5a4/0x5e0, CPU#2: kworker/u16:14/964
[  344.292477] Modules linked in:
[  344.295532] CPU: 2 UID: 0 PID: 964 Comm: kworker/u16:14 Not tainted 7.0.0-rc2-next-20260303-00006-gf03fe0b53b39-dirty #100 PREEMPT
[  344.307341] Hardware name: NXP i.MX943 EVK board (DT)
[  344.312386] Workqueue: async async_run_entry_fn
[  344.316919] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  344.323862] pc : usb_submit_urb+0x5a4/0x5e0
[  344.328046] lr : usb_submit_urb+0x5a4/0x5e0
[  344.332217] sp : ffff800083283b30
[  344.335528] x29: ffff800083283b30 x28: ffff000082631000 x27: 0000000000000000
[  344.342661] x26: 0000000000000003 x25: 0000000000000c00 x24: 0000000000000000
[  344.349793] x23: 0000000000000004 x22: 0000000000000010 x21: 0000000000000000
[  344.356917] x20: 0000000000000002 x19: ffff00008253ce40 x18: ffff000089e4eec0
[  344.364050] x17: 000000040044ffff x16: 000005d9d87f6289 x15: 0000000000000000
[  344.371174] x14: ffff000089e4eec0 x13: 6576697463612065 x12: 6c69687720646574
[  344.378298] x11: 0000000000000058 x10: 0000000000000001 x9 : 0000000000000001
[  344.385431] x8 : 0000000000000000 x7 : 0000005028dd0800 x6 : 0000000000000002
[  344.392563] x5 : ffffc48f74e9daf8 x4 : 0000000000000000 x3 : 0000000000000000
[  344.399696] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000089e4ee40
[  344.406835] Call trace:
[  344.409280]  usb_submit_urb+0x5a4/0x5e0 (P)
[  344.413456]  hub_activate+0x268/0x878
[  344.417116]  hub_resume+0x5c/0x10c
[  344.420522]  usb_resume_interface.isra.0+0xa8/0x110
[  344.425393]  usb_resume_both+0x10c/0x1e0
[  344.429310]  usb_resume+0x1c/0x70
[  344.432621]  usb_dev_resume+0x14/0x20
[  344.436278]  dpm_run_callback.isra.0+0x38/0xf8
[  344.440715]  device_resume+0xec/0x1e8
[  344.444373]  async_resume+0x20/0x38
[  344.447848]  async_run_entry_fn+0x34/0xe0
[  344.451852]  process_one_work+0x150/0x290
[  344.455856]  worker_thread+0x18c/0x300
[  344.459600]  kthread+0x118/0x124
[  344.462824]  ret_from_fork+0x10/0x20

The reason is if the host controller resume routine xhci_resume() call
usb_hcd_resume_root_hub(), wakeup_work will be queued and run immediately.
Then usb_autoresume_device() will be called and usb device will exit
runtime suspended state (if it was suspended before). For a hub device,
hub_resume()/hub_reset_resume() will be called accordingly.

After the host controller device system resume is finished, the root hub
usb device "usb1" will do system resume too. Then hub_resume() will be
called again.

Above sequence will cause hub->urb to be submitted twice. To avoid this
issue, restore the previous behavior by queuing wakeup_work to
system_freezable_wq workqueue.

Fixes: 4fb352df14de ("PM: sleep: Do not flag runtime PM workqueue as freezable")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/core/hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index dee842ea6931..89221f1ce769 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -2403,7 +2403,7 @@ void usb_hcd_resume_root_hub (struct usb_hcd *hcd)
 	if (hcd->rh_registered) {
 		pm_wakeup_event(&hcd->self.root_hub->dev, 0);
 		set_bit(HCD_FLAG_WAKEUP_PENDING, &hcd->flags);
-		queue_work(pm_wq, &hcd->wakeup_work);
+		queue_work(system_freezable_wq, &hcd->wakeup_work);
 	}
 	spin_unlock_irqrestore (&hcd_root_hub_lock, flags);
 }
-- 
2.34.1



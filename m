Return-Path: <linux-usb+bounces-18389-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC66A9ECACB
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 12:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C96F41888DE8
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 11:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FB1211A0F;
	Wed, 11 Dec 2024 10:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="j7CkdQPT"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2072.outbound.protection.outlook.com [40.107.22.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEDA1A8410
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 10:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733914789; cv=fail; b=emM7iTK6S/QhN+wJ8+VjW4Qd66ZF2wpFhWyUORyDpzoFIP/FqdAJ0rQIx1sQn5T9z60KVYInzkVpxxIY2EqsfyaocyqkXJMbCJZuJ0eznL+27xPCRyMLr417cqxvJvlFPUf9OkE+CWR82mk3nLCY7xXoYEOvOL3b79jJ5QLnASU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733914789; c=relaxed/simple;
	bh=BTGd4cnPW7zAMOhlYz/LdV9oqv0Wy8e7Pc5LmpR520U=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=FiMdR4FKejhkRmrUoTkULZTDP3kigGV2VZ/2OtqgJIFJl7c85Zlz+VLBbo9W4zR675yfTyvi7xCcTvjAfmRSgtEeG9Kx+Qqe4HP5DTaVVFVXzk9iFCt0BcLH23kB1ZfB5N1Okr0OXSbLE8U7Lbgyz9BlEgy4prRuIS4rsx/ckXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=j7CkdQPT; arc=fail smtp.client-ip=40.107.22.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qO+QEGYLcegEepGHP4pZn2cmM2jKhf7bgpu5NLqv0vt7ToDO65dJIy8lN5upt2FmSh3K+izefW1ay2VlIDxcJBbQ31SDDw1G8UsyWFCW+vsSrXd9SMXSS4Wkl3+K2YsTlEE0ZQs8rm/OjFOQ4ICZ4ciDjuVbQtxg5rZ3QlWZ+DYS4TJNCqx6Iq3U4d8cLG9pR3KB4M6mKSQMLzFbkSHubXkC/GoGzK8hk9duG05R2tQGjkgNRQWHyNRUARacrXHnkDEJ4vEEnVymmyaoIRyqppmLh6hyaDzIk53WWICLD5UJjS+8C1JFACLkrdCxgAgdbXZGMzPhUnngNfULhmdQhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HM6spzWHN/y54ks57lm5ewBWFPq9MrUsAiH+jhwn7NY=;
 b=LMNhp+rnqE9fZFHEZpLpiHETJcGo965DUXDMbaU+rlwrqQskpFoxALE3jrzeCACTsGS53CYt042OfqEg6CQlvKdM8UJUaZ52A7UKCbcPrhDD65GdaZM5wcMbu188kPiQBxNs8DzG6cADfXo6cBfaE4obSZMPRVJda2i4WU1vs8ekid9kEzs2ny2COdAyEWCJmKwOucjET1VVT05JmG8mWjo9Bk3mxCwkWDdl6cpd2dLXsPJPJ5b1QSKBOWWlJJ35P6g1KJpzh8q9TrL0GtWipSh6rLkOvJPn4mBGs8f3D6Iupey8Y8ID4uqGcCFyM2y4/C1UfssiI7n7Ux8iYuf6Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HM6spzWHN/y54ks57lm5ewBWFPq9MrUsAiH+jhwn7NY=;
 b=j7CkdQPTKUHSlDCr4x8oFF7mazwLz5Fi8tnNvvJw7+wZoHA2K0e6eiTwNsb8tFADc2BMAc5KNI9AlCicasw/Ioih4KoPQ6rR+LpU+NlXTb3Y378RRdht8vNXebKFqQci9DN9kpDZv0lYH9yo5QLD0YOnBHvpnZnpiBq9lhCA73jZ8eSRTTm6jCnf53/cw8bfKfsBTex+vXwNILaiKtDdRZQRApsGQz2XLEEVvbClalKcNScPDkwzq+xt/8ob/5IatT9YyTQ84OVYKBWXEbww9zC27+vQUU3rywN5V/xEYmvDKyhKL3FGr3fzAkJJznTbzsQ+cDdh9Z4VD03hlxuxFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB10151.eurprd04.prod.outlook.com (2603:10a6:150:1b7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 10:59:43 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 10:59:43 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	andre.draszik@linaro.org,
	rdbabiera@google.com,
	m.felsch@pengutronix.de,
	dan.carpenter@linaro.org,
	emanuele.ghidoli@toradex.com,
	parth.pancholi@toradex.com,
	francesco.dolcini@toradex.com
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH] usb: typec: tcpci: fix NULL pointer issue on shared irq case
Date: Wed, 11 Dec 2024 18:59:53 +0800
Message-Id: <20241211105953.1205343-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0153.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::33) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB10151:EE_
X-MS-Office365-Filtering-Correlation-Id: 51bb74a9-cad7-44bf-795d-08dd19d2eb35
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|366016|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?lEshSTEU92cJaoyMkYq3yTnLiTBZh5nwatk0T8hTnWXERG+nz5tEV5Bpz4yK?=
 =?us-ascii?Q?V2FJbnkgDHvY7I3g6zaVgXl+ondnCicZy/1KolzJykTdmHCO2CL1/3+bbUTY?=
 =?us-ascii?Q?V4oivrpI8JuRng0BeUgbphBHMZ4iluOTmL8eoCc5w17O2k+aCQ7iBJCDA7ZL?=
 =?us-ascii?Q?syxQkuYcY1ITDrgfLoDSU1yF1qEuYal7jaAYt6JxZcq1NFwB2j/ypUjRrLf4?=
 =?us-ascii?Q?zZT2K0uze8+HbVLTdnzvKpp/bWChGRYX7SDLFqu4xogOl5NswTozvK0u/Sxz?=
 =?us-ascii?Q?M+7W7yzF/zPN5bLYpNU5Wj+g4cyRjS2P/wIth2ewQlMzvdgfxo1dxeE/Dux/?=
 =?us-ascii?Q?qZwY+qdWxsZgB2beUHGdFsIIgE3cEGIKrjYo2zOj9PQtrin9KUCBnbVWlmoF?=
 =?us-ascii?Q?fFHtsogyqkv9HGV6vvg1WvymRtIvA8OjAPwIZgnGm6QmlmKQLdbYjurZRVhf?=
 =?us-ascii?Q?h/3O5Ew0U6OmATGv0UWa1y8107KWwnSS+c1rkSzvhNrJGlzOKk4GEIWgyEp2?=
 =?us-ascii?Q?f8+bWsuwVVVNoMKserDzVpvBx+JwNHrVCWigqcWlkffkMxjRIFkewljTIHcs?=
 =?us-ascii?Q?xjAt3cs1tmYuqTMyIBJZiuFKdebn25eBA85YiuilV562THl6AuERTs9kP7y0?=
 =?us-ascii?Q?x1ZDXrOwZe/3CYbYNvhvgaa7JorYcMiZIb90IFTKCLDTVSvwZDoemRis3HWz?=
 =?us-ascii?Q?IKgDvgEk0gCDAY/27IFHtOj1b7VigQIe/aefqePA4HKg3CmEWAV6MBYqaxdm?=
 =?us-ascii?Q?FWt8qKstA6lBVYM7zS8N31Alq/5C8w5Q5KO7SUY5trzIwObD4lCWhWJNv813?=
 =?us-ascii?Q?hV0m+uy78WnNq5QP2+T+Zj+ysQIeWaysUVy/gPyywRePZ6cy3mCTkFU8M/nP?=
 =?us-ascii?Q?TNKESGqiwKFkbo2lIrDUexnnLFUoCDsOPgB/Rz41GZ62e/2dSRGTCLv16e9u?=
 =?us-ascii?Q?bEOCU5aViaOwX9O0IMrWCdcFPKb377n5ZVBuTORU8R26esWiiQwr9WKiAIc5?=
 =?us-ascii?Q?Mzq8I5aadPHJ8Ubh8d356lpJzAYsQtjYrEwbgRrc/7xXHrbtw8Q8me1ucwIw?=
 =?us-ascii?Q?yN0X/HWMmhq9kREvKEE1ny9q96bd+0wkPIp4HqPJMWYw0L+jaqXM2VAXC+Pn?=
 =?us-ascii?Q?OL/lO6cpg/xCUD3nXzaJkywKhyAub3oVmeBRR8EfwYBE43Sb02o/+hRcrWEj?=
 =?us-ascii?Q?0neXgczE4M4XAsjfCLXkgbNpKkI40giliCGB9Ld6wFrrMU2f5zRdv9XqmYY7?=
 =?us-ascii?Q?+J72+W2fOixpiKeCMKf1q6mXRFYWAg3dsiuK0oqWS1sNV5XCjQaJEf6nMyg2?=
 =?us-ascii?Q?Opw73pbsb6kfkZWzDz3NfDKrnefyGKD7c8xGBYTiwwTuW4QDQy7ArWhNcFLi?=
 =?us-ascii?Q?n0uOaSsSgCTKOJRNBlphbxPHPnyohxEur84Cg+eUq1XDp4+Rcw=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?x4Fx1j4S4ORN2xBnDVqKu3cFhqW1vF2eor0vrEbWTF2MwoH/3HrsX0FNmbU+?=
 =?us-ascii?Q?Azz2/eStF6YRMXgajClh1BrzgQX3pjr25RwQGee+YUjvEB3186K1COVQod5P?=
 =?us-ascii?Q?DBoeNBcOm7S/MPdU8uryUq9FdbHQfX+Wiu5lou5WVny8mUrZAnASUefVQM0F?=
 =?us-ascii?Q?uOkTgRigheVNNQMqWe10c/CYOOMpxfTpVQpARL6LzEOP8p6jhAX7tFhPPqOP?=
 =?us-ascii?Q?JrPA/haI5ON65iMG6M/Fi71tirUvhN7/CrjgxTlbw+sdWMyTWZlIYrUGs54G?=
 =?us-ascii?Q?Ya13JmdHmTW9xI8Sn/jBtL+tfuI/X3J9kmCGRZJPHAx3NjqIzYEJ/uOzsss0?=
 =?us-ascii?Q?hMGBa0jMA4kz5sXbl4+gu6MOmYIf8DSD7lJ6TwLXEDQ+/NKmuXjycts86zcg?=
 =?us-ascii?Q?LqtFBZtPBQrQ8yGRvQA1IFzZaY0PArmCfhaEW8FeK5nReag5jgIKYX5+Ings?=
 =?us-ascii?Q?w2tsVEt0DHkfZNHD4TcTpeUgaGUnhqaS/3UyaLMFcbyJHjnwpZDuErjAMsIF?=
 =?us-ascii?Q?gMIEZ6Uwkr5GKE+bh+9q6FNKffvjUPaLtWvxPF6PJGntYw77HMzQ+TzTIxNH?=
 =?us-ascii?Q?Tnrio4460zJbvFSnqnG6gINGeDGHJv1zBgjGQwo9rJaAS+L5gEylHcsILw/H?=
 =?us-ascii?Q?DpsK8Yboq+CsHx3XNoV93mDXZJngXF9i3YUZcNJjugCgryZ2hBj72rUQBGvS?=
 =?us-ascii?Q?OlOg7JDBf65Hk0kbEO9It6a8KAKa+AYpiQcIoY0JqG1ICu9Ujz0C5PripWMm?=
 =?us-ascii?Q?VVEac3zJZeXAXDobeiVzDz/1uIQmlpoVbmDDkTtzClhtIIlsgXEWMPDIAtdT?=
 =?us-ascii?Q?wT+LYk0LlDrO8a4f7WI2WhORQ7HsbHFUuWNNqGw8Kjbf8KOHP0lnDEYDO/eo?=
 =?us-ascii?Q?g2KQ3V9aN20IzvOa+pLKtB3ZSmqBHrmJ5so6nNHiB4Js0AsRj8Tr6ANndlHI?=
 =?us-ascii?Q?j1okqB7X2BV9wnD2WKd96XWoA+67m/YP3QtG3whsle2bEIxZVb3xPewIv7fR?=
 =?us-ascii?Q?xmTLWPWkEx5KGxmELgjaT3HBCNAo5+26JhtOsXdBtwGVleXIQ5l5/nNv5CrQ?=
 =?us-ascii?Q?CrfOUqq0SrAvfVPzWAZhX6wZ8WqtcMAfRnwZb033cu/7Rbl76ukWXEgJVWBe?=
 =?us-ascii?Q?llrlIt19LJVxauW7n+4TR//2VKBjpZnHHU1R0Xlu0bANf9lfYumXcP6Eao+n?=
 =?us-ascii?Q?OgMansn0rAQZm7u5i3zWF3r47qtwQmgQo0xnd1/ALSgH7a43wvnYzcBynpXp?=
 =?us-ascii?Q?2kMsCzRRXZCi6ASdjVNdXJw9lBXBRGX5hcisgOMConGefNeIBnCWyWy1zjIY?=
 =?us-ascii?Q?VplFQZtd7+Tbr34RnBOmHTmZEOrHPhRfkSoJMWMyWchqH1Mo6+usQjLoBUHJ?=
 =?us-ascii?Q?r5HgzNzLteEwwRbV/T/AZNUQXFVZhXe/HSl64iSFq1cfxKfaXOGXvD6QN8fa?=
 =?us-ascii?Q?V1AjA1KengshJi8Lz5X2hzGY4ChjT5gdyc7SP2f+vvl0zFZgjq6OvXC39RCt?=
 =?us-ascii?Q?COypab01Ggzuoe3qlPSwPea6FD7u6VZyWmGGuLVUfBL1ewRfGS0NevlvNWLs?=
 =?us-ascii?Q?kIfQpM0wBROH10tzIWdwKRUrDL5bN7ML+6cvO1FY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51bb74a9-cad7-44bf-795d-08dd19d2eb35
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 10:59:43.8502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSef2MKUn4jAS646KQHXGtNCgdxGqabq25XQyOKVspAnYHGP3hjxoO36cCoWgEUH/kqBwqqlCNrNd8n0SL0qxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10151

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



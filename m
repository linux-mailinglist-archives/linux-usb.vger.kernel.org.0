Return-Path: <linux-usb+bounces-37492-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DFDOa/nBmpIowIAu9opvQ
	(envelope-from <linux-usb+bounces-37492-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:30:23 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4390D54C6F8
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7A3432227FD
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 09:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5627642EEC3;
	Fri, 15 May 2026 09:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="KR8t1dSg"
X-Original-To: linux-usb@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012020.outbound.protection.outlook.com [40.107.75.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5962242B74A;
	Fri, 15 May 2026 09:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836102; cv=fail; b=GUO7TnhXzos9QBaILl3/n7s+uBKtRcMTaWtobRuNdAtM/F35boEQs9y2SIyNg5kAecPd16+nGs8wtjhCLd/LYPliwqBZGMR//88fRq4/+uPx2+CYLHkV0KVZNc3iBUaWWCcWYY7sq4Wcc9fAsBGRg+PQqDy7Ctdb7nw8dSvyFSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836102; c=relaxed/simple;
	bh=Gy1SOlLSbOwoBFPRsJn+RKuOWu59QMcPoZD+rKTJ7BQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mV5o82qm32iuEK/tsVD8IdRD43aRkyD18iykTt4puIKqUV2UXlEoXHw+UOQp0uVqdq8j/6rC/KyXQH25bGv46K14CSd4XjEaAmRAlCBs5h1Frrtvk5/QEKfbdfSqoLP5FWMitb3lWiB5xDwG7VzEVFcLVfe4N+QOCcKsSTtKR64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=KR8t1dSg; arc=fail smtp.client-ip=40.107.75.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4xJYB8jzRZcZQ5eKuOllq5nouwd49XJ5rAiU8ksPoOWb5wRA0KFHvsBvFcj/u+p7eNtPWk3hwdVhbNp3LC6/xN5hLYw4xlaXB/V5LbrpnbuKtE508o+sY6hSdzek8cbkaRuzhH5tHHESclhk+ryQesxWIIOxCmiGYsj/0Pvp0BJkD94v2lisM8gUimkUEcsQL4YF1bx80KsSaCSdb19uKAI2TcARutg0H5+/jrJedYo5ei9U6ZV0t7J7SQzw9bYY4RsDCJ+peCUlsRWEiodheSJDLYv593J0L2ganrhTNtyTigBQZZpnCxjcTLpmq2cFhvbBNpIXgxRiVk1zk+Wlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wn6+kZpBvApa76aF1EFsaijzAYLOxmcpDaT2wr/dlKo=;
 b=XTj1/24cVofvjJNUWM17XYTrWU7ExqvXCLD7kP78vNQYuWOw7hGm1CDFwvdEDTrs+m50wvSHroGDD/0VtAMnF9R32TJ88aiJdpXAL3DqZqZd2PG7UyqoKJ/7GCv1w2EOq8Q5gcVtytbit4sNT5q1ZE2JRmMYA3CQi/cPskEGdm+iNZe0F5VmRTHwaJHnNkERMZNgIlzoagoID5YDqEJMhiUVPnQvr+rUEpBnjQMgl9Al62TrJI3TpwlRgc+3yUgTNhoHZY/jnZptf8lj5DqdqOZCxq6Ungyt5iHViIHOGY9w5Xr8WtSVR+5Z93SdB5xZqWTKx26yiVAwB5ztlVnppA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wn6+kZpBvApa76aF1EFsaijzAYLOxmcpDaT2wr/dlKo=;
 b=KR8t1dSglmmsdO7bHafM8VjJkp47Fp0UMOVl8OLBLy4WK4uP5ApsXn+wVBlK5KTPURX6G33v5CKL4cAviSs3QYfnDmP94X81uJHHT0j0GJP3ews9YweIKryoHDG9TjLJyVosQT6gjOSgK+WWCc+zSjzoywMkVyTLjMDYIdenr4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by TYUPR01MB5082.apcprd01.prod.exchangelabs.com
 (2603:1096:400:35b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 15 May
 2026 09:08:12 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.21.0025.012; Fri, 15 May 2026
 09:08:12 +0000
Date: Fri, 15 May 2026 17:08:09 +0800
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/4] usb: serial: mxuport: add sysfs control for UART
 FIFO
Message-ID: <agbieSXDX1wUkE4K@moxa-ThinkCentre-M90t>
References: <20260324035041.352190-1-crescentcy.hsieh@moxa.com>
 <20260324035041.352190-5-crescentcy.hsieh@moxa.com>
 <afy2yeDTHiVFkPmy@hovoldconsulting.com>
 <agMO03V9xppAtWjf@moxa-ThinkCentre-M90t>
 <agQ0RRpE27ComUnV@hovoldconsulting.com>
 <2026051321-apply-charting-150e@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026051321-apply-charting-150e@gregkh>
X-ClientProxiedBy: TPYP295CA0015.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::10) To PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|TYUPR01MB5082:EE_
X-MS-Office365-Filtering-Correlation-Id: 99796b4a-a1da-48ac-f261-08deb2617db2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|56012099003|18002099003|22082099003|4143699003|38350700014;
X-Microsoft-Antispam-Message-Info:
	H1UH+gwwppxOabQNe9qkbwAe2M7zJ5bKJF284BhzJP3erzQUctRYqiyIxrbvrqxQEBQI96UqleSgPaIzS8ePHs1sLWhKvPvtJRrm3+d5APRKwjvfEe0b82UJ5Psmd0oit9x9XrCIiMCaAkAEzDuYPk62mDSblCmEH/h6yPi+JlvSejrt+xeaHicrzUhIfYZ594OhlUV1gFsuvO8gTOnHLRK1avUbtAIa5grHGHrbnUxdTocBJvmNO0FsHyuOuEMddJiscVpdVL/RAdREEfuLeKzOWjyb/6Q2h7nKnVEJ6QGA1G0EpvEnuaPvm0GYwkauzKGWjNVCnJ6VE3SJ2dSwSZzzmJaTXoEqMctjkXoBBKX/twk2g2mjq9TpRcZr5Wtv4CQJoXzma9bd27XqVIqa+PtkiwP6jBWWWeYtjq3/S2qnYBiJzM7dm/1cU2gpco9bi7ApSGbMp6wlPMYrwZX93hPjWuUX2styd/ai7jrwjmO+d5ZEkUGCEcRgLvJyVjIG36ZbfKGpWgIE26nURcs+JxHRAgZ88cLDC3BI27oafRmkiyPV/5tMEBwK32etartyGRnYPazpYVOsDf8WR5W3pEJC3KlvFtWgLIspsRM13Qp9HaJQQ9iKNEsSIvV6M3cklGA/ZY7u1QqmW68t9KONcFxAYloXtuxke2NM/bt8l5ExEqetCdYtWyPISvutASzm2GFjY4Z2zTKbiDVkMSDHUfGEtEkt6ag4v8cm4wt1Bd9j2522CFOc3P89jw57jfuY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003)(4143699003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7gkTiZ5thAnAiiOuQENAns+DO2KaNGwboG9zhnCERikzPI92qXF1kwRZfpth?=
 =?us-ascii?Q?b0S3bVZk1/jW9PVqDkOuVU5ry2CLTKaYOdewokKkylOVjdYUYZ5gKAXfqbRz?=
 =?us-ascii?Q?eHq74IEt53uoCpDzVRZyxsjc6JdXMjzgwWiL1TF2QRH2TIthPICObY83FbD+?=
 =?us-ascii?Q?NaQ7NB9iH9MlWRJTACpre8So2+ux+TOTWn/z9SqjM9SGR7GQ2DMlMvfg7l9o?=
 =?us-ascii?Q?m/HwGyJPFc/r5PpZtIv3VTFo8Gxe6k5vcK3mM7FdzpFZgYZqgenA6UIkT0zn?=
 =?us-ascii?Q?mS7+zKCPEXPlOiCh0veaUrD0R7Vw2BMjX4L7IaZfSZhVvCJa18jaKcY2Y4N3?=
 =?us-ascii?Q?T5KXAwyxVAmZvyDKwSeHaZuhW/RCdwhKxCAvZAlAz5lnqsohIqfHOS+hj/Vi?=
 =?us-ascii?Q?eO7ZOFsHgnKxvmCo/dyRppOEGheng1CZSrzWGAMYvcQJNJo0Gf3ZEOLj/80y?=
 =?us-ascii?Q?/VUdr5w3yuxlfycKyqmUgO77y0I1Dsnl09522/n30qsw+ZWE/nvZkrCj5GhZ?=
 =?us-ascii?Q?hpbBd9bPwioWmce8yeMgI+VXMkZh8UmPE0hU78T98i9Vf7aLQGIFX79fqZDE?=
 =?us-ascii?Q?Sdi0x75WxYhBS7c0VRsIVCB6Liu54qf1LLICUPrSx7E5B9OpfmfxZSajm0LR?=
 =?us-ascii?Q?SmjsyFtv2dEubWLbyNhioPSAFefIGXPiv7p0aOOpOa8TGpoYciMDtD8MJ/w8?=
 =?us-ascii?Q?GGJ4CA993zID2R32WssJh+nIp0fhHL3DSYgCEfG9HDDPkMXXKPqMKi3f5//v?=
 =?us-ascii?Q?KPUqN6uCavY1fxl91j+T0qjpGPMjFOcK2edwmXcUzZm8QE99Cv7LJoeCvVY5?=
 =?us-ascii?Q?vmenmA/DVaOidv4VPZQT3276GZlgqyeaK+hxxq5gGbkcrjCiMAH4+UORtwzM?=
 =?us-ascii?Q?l4Iyc+0HOWRek/AcafbToZvZM7lreggNI4vWhOWr2RPA2vRSahX1oS0Fakpt?=
 =?us-ascii?Q?QmQEt6+Obod4vtWrazuUqSdmTVgZLxI3nW6GJQWjQ/vwduOSFj7cxAVEsETU?=
 =?us-ascii?Q?5xQ5x6JTNqHd/UTjxCYBmVcQf5PFV+IsJEsbFkeOPAdK1K1isdDSAMyIYllI?=
 =?us-ascii?Q?XH2X7gvmYsjPKSl1xYRzw4kJYOo4Vq8Bbisr6INcoyQsIfwzwoRifZnblAWn?=
 =?us-ascii?Q?pRuuXMjkVEIOnYP4of+8U75nsqa6JSweT64aA/YTeq1sV/WhUWfteeFbbzHt?=
 =?us-ascii?Q?r/wk7Bmk6YwtmVIiXBr1t89koP7umXbOcVRSbc1r6EMxHGq/oPhW7JbUb/zZ?=
 =?us-ascii?Q?7qCmj8cOolU6aalts0HgxY5W70aOnyapVhes9tJKoF7nKsYYMOtRKE1fihpg?=
 =?us-ascii?Q?Tz+zRAb4SpDeg1OR+g5okdL0p0lNwUQmHBQq6b/45dE/gtW0Lvpd+IItmM6w?=
 =?us-ascii?Q?qNQw3t4bnvotzoQzHGpxJmRR5Kl6/23NyeRSN9erAMs2p4gsug39y53Hrjgs?=
 =?us-ascii?Q?kRVIy2SLXBgRTftDXpHWeeKMv6VBOlWoQHjLxgGJzH1ALBIgspSpmALO6+PQ?=
 =?us-ascii?Q?uZF+HwWVGKOlvTTHLFLjYfYlYNV3Nyr0oSzg0uRADdlEIOufk57a4GnyD1Rc?=
 =?us-ascii?Q?LRmUKg2rgOW5wy5t+kC/YM/Ep4Bx3/1G0aiGw4KHOBSCYJ36GfaG1DEP2cmI?=
 =?us-ascii?Q?TP08RrXA79DQs7uvNvxtV/1b6wlb25kSUkvqZfkqLwnwzr4VPilLGXYdy3fd?=
 =?us-ascii?Q?MaixKWodC7L1dd0dHtK60UfnxB5jGiE61cQu9HXV418UP2UP232kzu0ItTza?=
 =?us-ascii?Q?5vCGRkzEyujKfw3hGjpBlE7bylHd6qo=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99796b4a-a1da-48ac-f261-08deb2617db2
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 09:08:12.6172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /H6ZAOG1fC0O4hRNe3IdIlZgds+J7mdISMGMZJLzShRCtkXjeKDeyyk1ZX98BekAHPVRBWxn+KGTGVRFDZAjN3yOi3TATcZ+GOpMkoopfLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR01MB5082
X-Rspamd-Queue-Id: 4390D54C6F8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[moxa.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[moxa.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[moxa.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37492-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[crescentcy.hsieh@moxa.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Greg and Johan,

I agree that USB-to-serial cannot provide deterministic latency.
However, the embedded UART used by Moxa UPort has a 512-byte FIFO, so
its FIFO/trigger configuration still has a measurable effect on the
typical latency on this hardware.

RQ_VENDOR_SET_FIFO_DISABLE is a historical name. On the current
firmware, it does not literally turn the UART FIFO on or off, but
adjusts the UART RX/TX trigger levels instead. Its semantics are close
to the trigger-level control I am currently working on for the PCI
serial cards [1].

In a 1-byte loopback latency test under the same wiring and host setup,
with 10,000 samples for each configuration, I measured the following
results (in us):

       | Enable | Disable |
--------------------------|
Min    |    637 |     210 |
Median |    764 |     235 |
P95    |    811 |     238 |
P99    |    820 |     260 |
Max    |  4,214 |   3,807 |
Avg    |    744 |     235 |
--------------------------|

So while this does not make USB deterministic, it does show that this
setting has a significant effect on the typical latency on this hardware
and also matters for compatibility with some legacy serial equipment.

[1]
https://lore.kernel.org/all/20260504084900.22380-16-crescentcy.hsieh@moxa.com

---
Sincerely,
Crescent Hsieh


Return-Path: <linux-usb+bounces-35515-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WN2uKoVJxWl39AQAu9opvQ
	(envelope-from <linux-usb+bounces-35515-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 15:58:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CBC337279
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 15:58:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 211A1308873A
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 14:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05FA3FF88F;
	Thu, 26 Mar 2026 14:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oppo.com header.i=@oppo.com header.b="BM9i06Dc"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023080.outbound.protection.outlook.com [52.101.127.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28263FEB2D;
	Thu, 26 Mar 2026 14:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774536560; cv=fail; b=McDFYt6hZSYyuTzPS5AtNv5Gg9Hw8k5CbZyMKNFflqs/SCDIHBug3XwmIjW0YFGSHsFgvHhwiQzB/U3ELWM5B9kvOgUh/ZC1QTpzaEgYK83p9v9ACvGbEFcbaK5JSN/zyuEHg/kH9pl63uTILjZy7knBPHOQKRFztmWVid8WmHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774536560; c=relaxed/simple;
	bh=YMsJREqlRvqdUNqBXjOIMjeChIU1NlD3k5dcGyaBWAU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g7e0it2SpJKWDtTwjn9iscQLquefYZjl4BkkI6dsNob9JtO/JKv/cO+HLcMpsaZx5Pte4j8GKjdeTftHEWga+mRxqtGlSBdLANJRxgrlqWysatKYoDLwbrzTpMxsditmS0/EXWtE/nb5m3DhDFJMyTfikSMTuiUfwrxHZtiSY0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oppo.com; spf=pass smtp.mailfrom=oppo.com; dkim=pass (1024-bit key) header.d=oppo.com header.i=@oppo.com header.b=BM9i06Dc; arc=fail smtp.client-ip=52.101.127.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oppo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oppo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q/R1Y31IgT+dwHn9SvXyimtBs9cY+MncCoWF34MPj4i15c0pOug/tOOTchJZ6NtrGitlefHjD2SDpZ0UOXLoX5iZKY04cxFkk2Urd+IR2oGyIyj7guoLzE+ovbGgmdtb5bvk67IQy0/Vr3NMKgyAKBsLPaMWhDeBbdaNteVR2XV92l+fUFpG1jEqbO7Py0uUXlyXemLrkfxcG71zcgPN6KESLA8473dKNqacD1j140Ca4K2qWI+0ySszalt9XV/io4SInFNpu07Nw7mR/W2KDH+absdz11Zwgw+jM/PPVJw6tF0MXfp860OBLcOMt2gH+MV4Dz11hx4aW7xvrqnSBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMsJREqlRvqdUNqBXjOIMjeChIU1NlD3k5dcGyaBWAU=;
 b=f7pnZuoZMlwI45bPCC1ZIbkesG6vF2CAHegdIJct3yWwywsV++JrFsbBGUbx1mTknOihydQxGJr9f2iIyZ5JRFHQTwnNRzIdkOxh28dqQ4uHzcq+FqBWAVcOxu2UP9SleMzjLLuxRBOA1j6TO96fAqVlmgG5ZJNeAEb8EaUj/OcElBIHrcUJOWX1z3WvRNxY4cB+9tPaEykRHwGm//gGoHnTAV81d/1pdhMEDz/qKEWDF872DfSdIyyFjHnFuE7j4e6y+/maZncTFuGQffBmAoK2PfQdGMPUlzLhpHDjP6dLeSUHkVOXQYBO4j7/f08kTE4fs6VXgnMXc+jywxr5Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 58.252.5.68) smtp.rcpttodomain=google.com smtp.mailfrom=oppo.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=oppo.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMsJREqlRvqdUNqBXjOIMjeChIU1NlD3k5dcGyaBWAU=;
 b=BM9i06Dc06CQt7EWw7seWzB8MPWoxzz1T87JyE1nFro4iql896Jx2DwbJs5aAl1dBF7Ikwz1rnPozLfeYOKc32Z7FlFrmS/v2RLKMyqsBVQVferTGo77SxT80TbHHUMAddN13e4fb9/TqHseo+3K9QerQ4MaGbF759XMN/3TTzo=
Received: from SI2PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::13) by SEYPR02MB9088.apcprd02.prod.outlook.com
 (2603:1096:101:303::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 14:49:10 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:4:191:cafe::14) by SI2PR01CA0001.outlook.office365.com
 (2603:1096:4:191::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.33 via Frontend Transport; Thu,
 26 Mar 2026 14:49:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 58.252.5.68)
 smtp.mailfrom=oppo.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=oppo.com;
Received-SPF: Pass (protection.outlook.com: domain of oppo.com designates
 58.252.5.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=58.252.5.68; helo=mail.oppo.com; pr=C
Received: from mail.oppo.com (58.252.5.68) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 14:49:09 +0000
Received: from PH80250894.adc.com (172.16.40.117) by mailappw31.adc.com
 (172.16.56.198) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 26 Mar
 2026 22:49:08 +0800
From: hailong <hailong.liu@oppo.com>
To: <guanyulin@google.com>
CC: <amardeep.rai@intel.com>, <andriy.shevchenko@linux.intel.com>,
	<arnd@arndb.de>, <broonie@kernel.org>, <eadavis@qq.com>,
	<gregkh@linuxfoundation.org>, <hannelotta@gmail.com>,
	<linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <mathias.nyman@intel.com>, <nkapron@google.com>,
	<perex@perex.cz>, <quic_wcheng@quicinc.com>, <sakari.ailus@linux.intel.com>,
	<stern@rowland.harvard.edu>, <tiwai@suse.com>,
	<wesley.cheng@oss.qualcomm.com>, <xiaopei01@kylinos.cn>, <xu.yang_2@nxp.com>,
	<hailong.liu@oppo.com>
Subject: Re [PATCH v3 0/2] usb: offload: Decouple interrupter lifecycle and refactor usage tracking
Date: Thu, 26 Mar 2026 22:48:48 +0800
Message-ID: <20260326144848.1016104-1-hailong.liu@oppo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324203851.4091193-1-guanyulin@google.com>
References: <20260324203851.4091193-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mailappw30.adc.com (172.16.56.197) To mailappw31.adc.com
 (172.16.56.198)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|SEYPR02MB9088:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d2167a9-b2f0-4fbe-c7d4-08de8b46d6d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	78DPaUg5hYueN3jZmroSI1Jv/3BPQWi0pRGO3dzw1k+Qz3xDDPFp04NC3bUef8aWKKzeyqH1v1Nx9VmIsjLIqKGDDy/hmnOsynfPaiyThO1kn26/TeScrWA6FNDflu/9fu2V6GqbL1HCXrS3pC/WHqWGAe0S+xVl3HJS/lIK0di2uVned/ELvqB+DmBiB+ZehC+tZDFu9bpC5tgj+pHHWlKzs5jXzXVgObMPGGQk0fDp8PBG+KG0sdSlOhj9ckOSTLtZW6gK56UNXL3yTFsRciO/rJadEQnfszbwApsXsbEwl3IIRZXJk56PKQ3tb8X2izknqvgehYArygbKpf0yRnT19gKj5HLtx50Jl2T4UmRFYXd3fqlX047Ps7Q0BcSVfNrgxi1VMKhw8FgOdgDbqbJd4Aa86LOmvl1uoXicaXIOb97TGFDPchIzEhpfCupID6vWHZGoHVt8MvCZXvW2gXyn8SuCmdZhEZ9KAFgx1HpOvN+LvPMmNym7ZUinAtEqHm/Qs78EScVMqoMwmHj36/iBkZz/wBFEz05Lp4B3Z98yWFvFse57ifEj3nc3iC96rxbXwKeLst9gDOZaRAJQLBiiwWy0cwA7VGvH8Qk/CFKa8UXBAqxPRo8LI6KIdDcU2Alr0umWkLm4f2asXylcC2MybCeUcAgQdXzNQ/q0YIo2CvmnQQfRn0wWlwwk3ghywhyC/xivP2B+k4x5Qhs50BvnJiiv+PE9SU2k4Nu/Q06CUVgCn50fThR8Gn56fjK7RO8a7OhdI9x3CpOtVKrl2w==
X-Forefront-Antispam-Report:
	CIP:58.252.5.68;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.oppo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6E1Jw21EsWnwGmM/tGtKQJ9oUzRIX0C3gBg7GJj2wmu1eArqzK3QgnqGwAHgLGGodw0j0NVKiq4v2y9TbK5orV6oZFY798EUWJhuLbeO9R6gdxdnZRWXXIX49oT8pOzPU7RHOhkHdeotbnT9KHOZSqW6Lqpv8ETix5Lt6dewEAsjAzSZsvnqk/O3RsBVpEJiCUyfb+Fblr2p4xsBp6uk+JCyy0Q3CZ9tD+Rp/UBG5xwXgbzUw8/MFU2VUmF0N4NXXRf2yEeXUg7AQ0mkIqsRrOYz1xNeVdbtWo3nSxcx7emyYMbsufa0gS741Fyj7ndbQHlBIWrTFcGl81mdCBbtQp7bPovVsWzkKOIYEIy1PyyW7H1+Z9RvWcyldVOsQqMBYGRa1uRCH+SshWfDLiRNQtu955prG8ZgdmA3OPRK6+D7G+25tMkrwLKyK2dbxwtr
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 14:49:09.9197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d2167a9-b2f0-4fbe-c7d4-08de8b46d6d0
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f1905eb1-c353-41c5-9516-62b4a54b5ee6;Ip=[58.252.5.68];Helo=[mail.oppo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB9088
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oppo.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[oppo.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,linux.intel.com,arndb.de,kernel.org,qq.com,linuxfoundation.org,gmail.com,vger.kernel.org,google.com,perex.cz,quicinc.com,rowland.harvard.edu,suse.com,oss.qualcomm.com,kylinos.cn,nxp.com,oppo.com];
	TAGGED_FROM(0.00)[bounces-35515-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hailong.liu@oppo.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[oppo.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 04CBC337279
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,
We, OPPO kernel team, have thoroughly verified this patch on our devices.
The test results confirm that it effectively resolves a critical headset
hot-plugging issue and the subsequent system deadlock.

Impact:
This issue is currently a blocker for our upcoming product shipping.
We have observed a high reproduction rate on our latest platforms,
and this patch is essential for our production stability.

Test Environment:
Devices: OPPO devices based on SM8850 and SM8845 platforms.
OS/Kernel: Android 16.0 / Linux Kernel 6.12.

Background:
High reproduction rate (typically within 10 cycles) before
applying this patch.

Original Reproduction Path (Verified fixed):
Open music player and enable USB exclusive mode.
Connect a Type-C digital headset and start playback.
Repeatedly plug/unplug the headset.

Observation:
Within 10 cycles, the headset icon would persist after
unplugging, followed by no audio upon reconnection and a system deadlock.

Stress Test Results with This Patch (Phone A & B):
Test Case 1: USB Exclusive Mode Hot-plug
Steps: Enable USB exclusive mode -> Play music -> Plug/unplug 100 cycles.
Result: PASS. Audio functions normally; no deadlock observed.

Test Case 2: Standard Mode Hot-plug
Steps: Disable USB exclusive mode -> Play music -> Plug/unplug 100 cycles.
Result: PASS. Audio and system stability remain normal.

Test Case 3: Mixed Accessory Switching (Headset/Charger)
Steps: Play music -> Unplug headset -> Plug in charger -> Unplug charger
-> Re-plug headset. Repeated for 30 cycles.
Result: PASS. No issues observed.

The patch looks solid and is critical for our project. We hope these
results help expedite the upstreaming process.

Free to add
Tested-by: hailong.liu@oppo.com


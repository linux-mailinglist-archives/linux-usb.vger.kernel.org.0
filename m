Return-Path: <linux-usb+bounces-32817-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCKsIPvSeGmNtQEAu9opvQ
	(envelope-from <linux-usb+bounces-32817-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 16:00:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3967D9632A
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 16:00:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B280A304BC07
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 14:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D0E35B63F;
	Tue, 27 Jan 2026 14:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="gf8JuuEJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020117.outbound.protection.outlook.com [52.101.84.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C188035D617;
	Tue, 27 Jan 2026 14:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524953; cv=fail; b=cQ3/AYAcS0k1iMEhdNxaKBB19Zp0WTI31hBozACA7oWcGT/7+7cv4IwRSi4nHMwItKZrXio2PcERDO09xvV/Uq+/hNOjjVnQwA7Auf66iVBjxr22oXbsR7bpfeV7vTspd0Z46x21uYOxyE+Nyjbb50ZX9J2WwfVL1TkILjPw5wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524953; c=relaxed/simple;
	bh=bsywDA+dnJVor/97ZSVFxQt6+vMKK55EHUerSULjiRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=RCdCJTFS36LYZH0kFv6+CB8TuZE4iiM8+X04wpYVvXctGf0EfEcvRAUzVOvJBONs7rDwls6i8x/CTGmn4grZx95TV3bJXxz+lZngvpikKtWaTuaAMxq5K3kmyt6VdhEYQQ7QaUiy+ImeYz1ZW3gGhk3EGGbs5dJpme6zTVsLh+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=gf8JuuEJ; arc=fail smtp.client-ip=52.101.84.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QRUIPciRqDqT599UkcoCP33Yy+XIkWrA28ARz2SYQKRaX3QMV/u6LG6tSC0xkcraBs8dC+Sboz3f80ZLFr8vEj/7PAYe/hJSjjSzs/t+alTwCbLQ++YW6W1bs05CXqd1FEXJoaER1BO5/NHyYm6+W3LVzmud8T2yctGgNYFbhbcYe8hbzLp1sq7RxDuPSsY24tYtiIEKEbRtVQa4AWtCR33f6a6RYjswXXfnkphw4y2alKnKKsRkTtAACFViCbsLUDsGWMot7iSmjEAxS9daaKC9ygNt6el55uC+HfVU3u8GaGKxVLrV2EUQGzBu713dzsWkeJgLs6nK2Xweznvu3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CB8YqtQ4khvmEpPN5Bw/SZBTI6NI9Pgn91PpG4cxajw=;
 b=ql5UQ0oCdNAdYKF+zGHj18CBw/Q15mS5oQGLcTBinANWBg//a+ZFrKYUdgKslMcsY13ODgR5I2pYdW75KyG31fTmFhcfkF05osW7XiCDJ7UFnDaUCUGXJPHBZt00NDpPRkYuru5sA5pTngXaXC0tDGQnFVkzFuexpcoE9n656GDAJ/AySjF5XiwAoa8JMuEalRgeTdExCaFuxBcSKhF78vAroaUofpGI2db3CqQ1thVQBMu5SYdqGWv44vto2ZCNDsE3zTIkvMmiTVH4IB0sV8r4CYTz86TAyk08gbLAYs3nNC4L8TE01Wo39Ptf7+Pf36V4KH6kFBl24r9k9ZrtdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CB8YqtQ4khvmEpPN5Bw/SZBTI6NI9Pgn91PpG4cxajw=;
 b=gf8JuuEJgJixiwCIAGILpMnVV68V/m9A4Gu7vErxVj1p6FdR3zb6P1OT3NqkoxfQ/06NhpG3BTXpsv+tapKTpM8tz7v4hdbDVMM//LdLtKs9QrvdhWS18/jiJbt25Y+99MqpPQuGi6Bu7lYEyRWoNpVnZMTwkJeKCDJQZ2q62QNWgzDvPz6nqk+S2xcn/NO2oxSHIgGyqPkm3OOb1AbAtlegypTO3u9MIS0YuaD4EWUBbLuBXVRbFLvsRdx4NHqFyrRxeb82wYiiN76rZOZaLHR3+YWvqksALUqfqpcgE5YxFwTSHBJ3SFi2AUJtw87WyEbVobdPZlp28VZWUBuqjQ==
Received: from CWLP265CA0435.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d7::8)
 by DB9P195MB1419.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:327::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 14:42:24 +0000
Received: from AM2PEPF0001C712.eurprd05.prod.outlook.com
 (2603:10a6:400:1d7:cafe::85) by CWLP265CA0435.outlook.office365.com
 (2603:10a6:400:1d7::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Tue,
 27 Jan 2026 14:42:25 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AM2PEPF0001C712.mail.protection.outlook.com (10.167.16.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 14:42:24 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 27 Jan
 2026 15:42:23 +0100
From: Jan Remmet <j.remmet@phytec.de>
Date: Tue, 27 Jan 2026 15:42:15 +0100
Subject: [PATCH v2] usb: typec: hd3ss3220: Check if regulator needs to be
 switched
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260127-wip-jremmet-hd3ss3220_vbus_split-v2-1-f615d4e88634@phytec.de>
X-B4-Tracking: v=1; b=H4sIAMbOeGkC/5WOyw6CMBBFf8V0bQ0dCIIr/8MQwmOwYwRqp1QJ4
 d+tuHDt8pzFPXcRjJaQxWm3CIuemMYhAOx3otHVcEVJbWABEaSRglQ+ycibxb5HJ3UbM8cAUen
 riUs2d3IyT9IsguSYY5aLMGMsdvTaEpfiyxYfUyi5n9TEbrTzdsOrj/2j6JVUsoYulDtVJRWej
 Z4dNocWRbGu6xtAcGHm5QAAAA==
X-Change-ID: 20260126-wip-jremmet-hd3ss3220_vbus_split-946802479e89
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Krishna Kurapati
	<krishna.kurapati@oss.qualcomm.com>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<upstream@lists.phytec.de>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C712:EE_|DB9P195MB1419:EE_
X-MS-Office365-Filtering-Correlation-Id: 641fca1e-aea3-4406-9cb0-08de5db248f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eUh3elh2KzdtY000NUx3UG95K01XakJLL0RPV3BZdXpKZE5heDNzL2tnK1JV?=
 =?utf-8?B?cHBLakVJRUJGR3FEZnNzZmtpcm5ZOG43aWJCYkRLSXFleVgvdnlwV3FGanlq?=
 =?utf-8?B?cHhOdHdiK3ltSXhyeW5JdGN0eFBSZXF1QUVNUm43a0VmNXJpdHo0OHdLaUVj?=
 =?utf-8?B?Z28vaENYWEVIUXNCb3Y0WGVPL3p5OGV6akgxa3kzMEE3S01taFpJN3N5Y3BM?=
 =?utf-8?B?NFRaQ25NUDF3R2VvcHN6TFlJUUlDbnU1ek9FOHJUUGZvdkQwU050U1I1ekN5?=
 =?utf-8?B?eTNCUzhSMGVtMXBSNy9XQ01SbkUvTEFiTXYrR1U3Y3ZNSCtUcGRia2dUQVpr?=
 =?utf-8?B?ZHhHVlJuQVR3aXVDM21oYXE3dnhueXlVVGF5cXdvaGRXUjF4UjhIS1c4RXlE?=
 =?utf-8?B?VmFwSUhWVDJMWU04MUNxUFp2V1RQWmRZY1JiZ211MmFLUkpCTFBLRXFRUVlY?=
 =?utf-8?B?Zjl4TEtwdlVqTXBRcm4rbHlDUVp3NE4rbVF0SEZBTUhYYXIvZFpidEkrQy9R?=
 =?utf-8?B?SzQrcnpBMUJ3WHdHMis5UnhnbW9YWXhZK1RVUlpOOVlRTjBvOEt3Z3N5L1Jz?=
 =?utf-8?B?aG5jcnJuU0lidG5ReTJDR2lZOE9WU0I4TkdNWDJ1eXpvRHFNSkIzc2VJOUk1?=
 =?utf-8?B?WWRtbFFGUFlIdlBiYzU0UHRqeGJ0RDl2VkNKTkdZM2V5bWZQNm5QS2hwQlhI?=
 =?utf-8?B?UUhRV2Z2UDQxNkFPeVJYeEhzWTZvUzliRWd5bFNjb2prQk5kVzIvZWpscjVl?=
 =?utf-8?B?WnRDZ2FaaWtwbk9ZSE5aQ09Qak5lUmVxY1BDVk4rREZldjl5VG9QT0ExUGFR?=
 =?utf-8?B?R254V3dIOVh0QmJiS3V4SnJYVVY5Mlg4MGFaTjZja2VqRTVLVHFZdmNiak9h?=
 =?utf-8?B?Q21HMG9hcmpPUlpmWXcwUS9TRm80VUVkSFVuWGRxSDFUWmo5TDRIczdnMjQw?=
 =?utf-8?B?TmJPMzVGMDdKN3h5cTdqbWxvbTJid0NHVFFLTkRmZ3ZxMmJLMFdGSlAxT204?=
 =?utf-8?B?NzBDTDgwMjNKM3NsdU5rK2V5V1VWQnFLN0I5V2w3VWx5ZDlTcFpiWDViRDZ5?=
 =?utf-8?B?ditlZDJUeHpYU3dDNU1hbzhPcXdScERlV1o4UjF5ZEdhbFJuK3hGL3c1Uk5i?=
 =?utf-8?B?MTNyQ1Z2d2Z1R1BKTGV4a3dTNlBaRVBVQ3hqR0ZjL1RJYSt3czZoZzl3ZVJp?=
 =?utf-8?B?aXhPMFdzK3Jhd0orOStVbHJWaEExMGc5VnNhNU1XcFV6cTJUeVByUkh0ZGV4?=
 =?utf-8?B?YmYvQWNzelVRL1NxZG5ZUnUwbzl5ellOUFJtSWtBRWhzcU9KVXd3MHRMTjJs?=
 =?utf-8?B?eU11RENkN1hTTnhrWmZCU2U1WWZ3dEV6Y3poMHlxcFE4VEZlL3B0V3JpbnNO?=
 =?utf-8?B?OHNyeUtOMFpYS014eVh3SFhiVThKOWR6QjdKRjBBUU9VcmozUVliekZtNDR5?=
 =?utf-8?B?OHFTemVRUjBYaHZWOG1hRzNkbXRvVEZUc1Ywc2RlSENYaC9mZ2lyZzdqcHI5?=
 =?utf-8?B?K25zeFJncFVFN1VmU3BmN2J5UE5mdngvRVI2WFRUNzBiaCtHZjhycmw4UTJR?=
 =?utf-8?B?SVdLaWRUNlU1ZGY3MlJJRmdHRFpMT0lGM1hSblpqSzQyeUhtQ1dYYUk2UVpo?=
 =?utf-8?B?a2RGL1pmY2RYbUcxNkx5a0Y2RXE2eEM5dFY0S3I1aUdMSVBrQUluZ2xWNWVK?=
 =?utf-8?B?K0VzYkRZelNjc3E0cDN0Q2NxRVhHb2FjcHQ2SHVYT0V3Z2lqUy9jNnpxYlk2?=
 =?utf-8?B?b2pZVW8wWmNKMU9uK3lUOUx3TXMrSVFIdW94UGQvbGF5bWwweG5za1hjWGVt?=
 =?utf-8?B?dGNNMFdUT3RPY2ErM3c1Rk1HdkxId0VoVk1na1RNMlNPa1QyQ1ZYK3ZCWHZt?=
 =?utf-8?B?SG1xa2hnWEt3aHJzN0JHMU00dVp1UzFlUEYzVWNDS1dyblVLUVJza1ZFbkRu?=
 =?utf-8?B?ZXRwZ3VjREM3djFNdVNBMHB5ek9UOGJJckxaWjNxOWtDancxdXhZSVh4K2ty?=
 =?utf-8?B?T3NlMjh2aTRRTU9wdUZSd3QreXpQald5VEdhVUdsM1ZmbU9BWUlQZ21NOWln?=
 =?utf-8?B?bllHNnRiNTY4anFhWDFGYitkMjE0eTZZQUM2a2xOVDEvNlB5ZEk1Q3BEbUNZ?=
 =?utf-8?B?czY0ZTFHOHFray8vSFZPN2RueFRLdXpjd2IzaWhmOGhRV1pDSkVpNHpVdGxQ?=
 =?utf-8?B?VlJrNUNVY0JrYWVxbVQzUkhPUkpTc05qN0RRRGZmT01iNjlia3FDeGNKazFs?=
 =?utf-8?B?TmpNYUFGR3p0MDBMejhBS2t5Vm5nPT0=?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 14:42:24.2561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 641fca1e-aea3-4406-9cb0-08de5db248f8
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB1419
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[phytec.de,quarantine];
	R_DKIM_ALLOW(-0.20)[phytec.de:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32817-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[phytec.de:email,phytec.de:dkim,phytec.de:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[phytec.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[j.remmet@phytec.de,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3967D9632A
X-Rspamd-Action: no action

Check regulator state as peripheral and detach can disable vbus.
Without this check we will try to disable the regulator twice if
we disconnect host and then connect as device.

Fixes: 7e7025811579 ("usb: typec: hd3ss3220: Check if regulator needs to be switched")

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
This is a fixup from
- Link to v1: https://lore.kernel.org/r/20260115-wip-jremmet-hd3ss3220_vbus-v1-1-b7d9adfbe346@phytec.de
To
- Link to v2: https://lore.kernel.org/r/20260123-wip-jremmet-hd3ss3220_vbus-v2-1-bcad313ce92b@phytec.de
---
Changes in v2:
- added Fixes tag for the patch applied on usb-next
- Link to v1: https://lore.kernel.org/r/20260126-wip-jremmet-hd3ss3220_vbus_split-v1-1-b2f946f1a4ae@phytec.de
---
 drivers/usb/typec/hd3ss3220.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index a7c54aa8635f70d6979d98c95f80d4dac277fef2..3e39b800e6b5f4d0cbba957c0dd66c18f781ff38 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -208,6 +208,9 @@ static void hd3ss3220_regulator_control(struct hd3ss3220 *hd3ss3220, bool on)
 {
 	int ret;
 
+	if (regulator_is_enabled(hd3ss3220->vbus) == on)
+		return;
+
 	if (on)
 		ret = regulator_enable(hd3ss3220->vbus);
 	else

---
base-commit: 8acc379b664ec987dcc7eca25a5f5c4a9a4eb9c4
change-id: 20260126-wip-jremmet-hd3ss3220_vbus_split-946802479e89

Best regards,
-- 
Jan Remmet <j.remmet@phytec.de>



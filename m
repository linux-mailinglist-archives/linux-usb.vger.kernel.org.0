Return-Path: <linux-usb+bounces-32829-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKipNPjceGnbtgEAu9opvQ
	(envelope-from <linux-usb+bounces-32829-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 16:42:48 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 643E196F05
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 16:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3292730214DA
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 15:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1953033C0;
	Tue, 27 Jan 2026 15:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="R0gkJ1Cq"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021073.outbound.protection.outlook.com [52.101.65.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666DB2264A9;
	Tue, 27 Jan 2026 15:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528256; cv=fail; b=nF4KHkq4S8GdGDeB5z+cnuQOa5N2bHQPL/eC4M7j8p3RP3CfemM7lx7hmOX3H+yOyi/gZLii2xGknn9mskUmbP9YCT17M9wjEhZ0/Qk49NkNoi9EPw0GCD6Ljt6WmCjOowZT3bhI2O/JC/cK1VlOQAwIsLBIaaVBMZUkUuUY2cs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528256; c=relaxed/simple;
	bh=lFiR4nvrN2EtNcNGrlSMfjONsYiF7M+/jmgcl4kpA6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=iRG8HmRZJO4OaO1KOBPv730k+cdCXoaDpCiajtneyAfwKja9prfsD/0fr2z61jxYODGd5MyIvPwJqAcH3PHOeQBWBvZKw21Z7PHNDdQBfa/Vp28g5lT3404nI/P2TNAk+Lss5UQE4TKrJxas6ETYX8eTP+i7miMz4A1IeMncxHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=R0gkJ1Cq; arc=fail smtp.client-ip=52.101.65.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hlc/6NTPaT4bX+6GozS3CunNp778Cr/oVYGpxVL0Flz+RLB9KNDcCRC41NjUcpO5Cxyzfx7VuOujwy6bn1KEIljnjvz43fMjNvFPCV3tjA1fvgsltOZyhvTysUcCCBCu2SLbKBLpkbAgJWeYyAD/SOJJxefeLOQRfH1xmSHwXKMVgxS+rbN0CCF8GFn4ueRrq+VBc9kq1aFNCZ+Nbw0+HwdUZBUIt27hHz7EQnmoykjHYqm7jA9lwzwxEtiiwpr4+Iqf/jI3ZsFnMuN3H6TzNvYqiPbCeWoxQqRciAUWpDLAEeZwXkm40j8Wemvu37L1a/QqnnvkWA9TAdVL0n49tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8OkAnPrY5yRFYm06THM7Nzui96muj9kjOw/fVXr7Zw=;
 b=nLt41S3avuEDDaTAq7bcadF3zajIjb02ayU2SmeYJxVSVmK6gAEF+sWTVchwfu3STKjli8SLnB5Vc5sYiTqHuUVJx8EtocJyRq1eN0eBlwEUDIBAOJJe4fyRjUSM/yCeIOUzro4DSK82mWe1hx8VlXeAMGT3Q2/TTfhcElbfzbVGoiUDBIZ7DKgOjXkUCqoBucbJUbrrmgiqx51ULQwuT5oCEunkgQ7txIXmPQJA+Me6RP6ofD5Fur9EThT8NdNAFWTIxZoFl8VjVs/A/RSdHEtfTkU0gKllfw9cLWWGML2IbcS4MhU+Y+ZAjUwN2h/onc/OrktO0cX2LGDn8Ffhqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8OkAnPrY5yRFYm06THM7Nzui96muj9kjOw/fVXr7Zw=;
 b=R0gkJ1Cq+vC8VtyHwrNhPZQs75P05enrZlp2B774C/Ff1Fi654l7SHlz5uqk365hJkI78O/cddlg9s6rx2CgEfde9R9ajCG6+pfI9zi+UiMjlG2hwgTuTA8pYy6nZ6AuZtRocgrxveTEfCwpjt83q81LCg6Nzat3iUnWSK+/cMWB1iwxXcz6n97cYJZTMiNj0RksWCv10364pdN1z2kM1I2Ragcx6yHrZTzrY+uRJM3pFS/g4Zmo4eBI+d8CLdUGNJLakP0//5ufsbgWIXso/0iSgX+I6p5ZZn/kLp/moHGmmi1vmRkctJtYSi3RsU/pkSyGLhm2Hnw6VM2TCZ5onA==
Received: from AM8P191CA0008.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::13)
 by DU7PPF2541BF4ED.EURP195.PROD.OUTLOOK.COM (2603:10a6:18:3::bc9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 15:37:30 +0000
Received: from AM2PEPF0001C715.eurprd05.prod.outlook.com
 (2603:10a6:20b:21a:cafe::a2) by AM8P191CA0008.outlook.office365.com
 (2603:10a6:20b:21a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Tue,
 27 Jan 2026 15:37:25 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AM2PEPF0001C715.mail.protection.outlook.com (10.167.16.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 15:37:30 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 27 Jan
 2026 16:37:30 +0100
From: Jan Remmet <j.remmet@phytec.de>
Date: Tue, 27 Jan 2026 16:37:16 +0100
Subject: [PATCH v3] usb: typec: hd3ss3220: Check if regulator needs to be
 switched
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260127-wip-jremmet-hd3ss3220_vbus_split-v3-1-009772f38265@phytec.de>
X-B4-Tracking: v=1; b=H4sIAKvbeGkC/5WOyw6CMBQFf4V0bQ291AKu/A9jCI+L1AjUtlQJ4
 d8tuJClLucsZs5EDGqJhhyDiWh00si+8xDtAlI2eXdFKivPBEIQIQNBn1LRm8a2RUubKjImAgg
 zVwwmM+ouLU25SELgcYpJSrxGaazla02cLx/W+Bh8yX7HRhrb63G94diy/lF0jDJaQO3LNct5j
 ifVjBbLfYVkkTvYCuMfhOCFtWCHimOSiIhvhfM8vwFpfeNMNgEAAA==
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
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C715:EE_|DU7PPF2541BF4ED:EE_
X-MS-Office365-Filtering-Correlation-Id: e72ff4f2-f477-4df8-f87a-08de5db9fbc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3BReXJjaVhpd05yQ3VGNlRYNi9kT1lSYUI3MFczeXlNeUE2K0s4Ritkb3Vm?=
 =?utf-8?B?MVdIekVVOG1ONmpZTFZoeDVOa3hQbzhTSmNmbmg0SlducjU5RUJTMEY3T05J?=
 =?utf-8?B?VGlUZkR0NHR2d0dKdkc5OWFRTElzemh4aW96SGFzWkVmbzlYT1ZwZzV1TmJL?=
 =?utf-8?B?UmllRzNXbHFQWWlrMUJDY2JxTjhoY2tRWkFWTkRlUzUwMXdLQWdZK3JJTFd0?=
 =?utf-8?B?WTRaQVo5dlV4ZWcvWitnL3BBOHRXY2FtNlhieTBEYWQ2bVpUSDJoTTdkSGY5?=
 =?utf-8?B?ZkFCTGluYWdoVEZ6NVkrZUxidjlBVWlGcUNTU1BoUkJzbFJrUHJwaDNHcjV3?=
 =?utf-8?B?L25BK2Y1YS9SaHp6OXVEQlg0ak0rUHIwWndsOWhNdXA0OU1xa1dOSElNN3N4?=
 =?utf-8?B?VHZxNmdkZnAxODlMbmo1WlF1Zy82ZGo4RTJhc0JlNmdmdmxQeSthU1lZVzJS?=
 =?utf-8?B?alRzRDFQWktTMERaM3VYbEFnMndqSTNrMlRpTXAvZkJqNU9JSmpaVExmM0Ns?=
 =?utf-8?B?YmZkNm9mYnc3YUMyYzluOHV0K2YyMXQ0N0JweHlmdFhEMy9qWlJTbVg2UjNK?=
 =?utf-8?B?aVpOTFNhWmNBMlhnQ1NQQ3dSV3JnR2ZCNWZBcjdUYkZwY0tpaXBXU3ZaVGtQ?=
 =?utf-8?B?MmFhNTdmdzNqNERMM3dyWWlCdEI1ZTlpS3JqM3RSODR0dEVNNUdrdGRTMjhm?=
 =?utf-8?B?cVBURjdEZWJVZ3RVdEZYbGI5K2JSaWtldWl1QzJkbE53clpyd1FDallVblRY?=
 =?utf-8?B?Mk9FZnk2Y1dlNW5iNGJJd09jMzh0eWlPYTdiOFVrV1ZISytwTkZ0RFFxcEIv?=
 =?utf-8?B?MGRjMDdkUnJDY2FQM3kybHhnK0M3S0FZQnVWN2Y1QVgyZGtuMTBLbWVYOUNG?=
 =?utf-8?B?QXVaUlNVT0JNZ05pWVhOZU04Z1V4dnpucUpoV2RWTDlUc21tV2NmZ0VTUlBQ?=
 =?utf-8?B?UXlCWkdBSHlpRmhvQjc5azF5aU5hcEd6dXpMQVhLWW1TTUpnSkZ6N29vbFNr?=
 =?utf-8?B?VlUzUzQ1UDU2Ni96S1FSdWRWckhpSW5EV3dPYkZ6aldKRjhxUkpDWGg0c1kv?=
 =?utf-8?B?VTZNK2t3V1RmVlcrUmVyRGZaa0FidnYxUE5udWVrbXgxbHZIbHVXVG1jdm83?=
 =?utf-8?B?RXZ0STd1cjljeGtzWUF5MW8yeVpRRHpOaW9OTUNmeVdRMXRpSFFJWitvSWli?=
 =?utf-8?B?UXU0SWdvRjFnVFVmTlc5RWI3bDN0dzJwTkFJUCtwZWhYU0ZSenY5N29IOTlH?=
 =?utf-8?B?YjFVMk4vdUNCbklTcWMxVkNxUklkMUthRjhBZit6T3VFa0FUNFRMTnJxMG5w?=
 =?utf-8?B?d1Zub3hDZGtVKzNEVkhEV2tHdndFbVZMOE5udWVzRWZCWGpkSE5mVzZMK041?=
 =?utf-8?B?L0NvOW1oOWh5RUFJbmhONlNkb1RyalphblFqOG4vUmxLVHlKWFN2bWF0aTNS?=
 =?utf-8?B?UlN3TG1LemZrMUt1MVJhUHE5czlSR0xkKzhpdTZsV1pXU1NWUmEyTWFqNjlD?=
 =?utf-8?B?ekc0ZXNEZWdXZmhwdnVnMkJ1aUFxdFRLYVNLeDU3M0JtamJNbzhKcVlqc3Zo?=
 =?utf-8?B?ekZjU3BiZngxNHY1MXFzUjFNbUxwd0tFa215aGdLVlVSZ0VFYmF6clZTck81?=
 =?utf-8?B?eWNMVjgyb2ZoUGptNDYzWGxRa3M4MERleERXSllVWEE1bXFZb0NFTGl2a3pT?=
 =?utf-8?B?eFNGYTluZ1IzbUxncjBIeHNhV3hmS1FTdHhLSnVIdU9Sdyt0ai9PK3JaT2ww?=
 =?utf-8?B?R00zVTZ2MUUyRVRoRmhEcmRVVk0xcHl6VmhxT1FZQkdWNzdLS08xSzRvOWtX?=
 =?utf-8?B?V2NSNnRNWFRxQ0ZMTEtjeEIxZ2d1Y0NwNmVIVGJod3hpMGxYUFZ2QzZzbHM3?=
 =?utf-8?B?UDVwSnFucWNpa1BSdVBkZTVRYlhUVmVEZHVsYzVJYjN1NmlrK1JFU0paTXd4?=
 =?utf-8?B?aCtETU9ZenNHYXVkUFAxQ3JyWHF0TFFXd0dkWThUYzg0N3ZjemF6R2ZWMXRD?=
 =?utf-8?B?QUxFNXhDcGxlbmsrTGRUMjhESGlRUXhaK2tWWURUclR1K3dqc3JDemlnQjB3?=
 =?utf-8?B?WXN0bGgrQUlnUlhYSU5EMVpvL3ZRUjFzTVJCYTVjaDZaV3VPSHp3Q0FYTWQ3?=
 =?utf-8?B?RGRYZWVOWTJQY2RWQW5pYmFnRlByZVhaR1RmMkFmR05HU1JEL3B4OGhRL1Q5?=
 =?utf-8?B?Sko3Y2o4NGZEdXV3aGRWNkJFdXBZdVNLblhlUHJDUzVLcTUwbHpEUVd0OEVS?=
 =?utf-8?B?TUwreXpEd0NxOUx6a0NMeG5KTk5RPT0=?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 15:37:30.6829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e72ff4f2-f477-4df8-f87a-08de5db9fbc0
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPF2541BF4ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[phytec.de,quarantine];
	R_DKIM_ALLOW(-0.20)[phytec.de:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32829-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[phytec.de:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[j.remmet@phytec.de,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 643E196F05
X-Rspamd-Action: no action

Check regulator state as peripheral and detach can disable vbus.
Without this check we will try to disable the regulator twice if
we disconnect host and then connect as device.

Fixes: 27fbc19e52b9 ("usb: typec: hd3ss3220: Enable VBUS based on role state")

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
This is a fixup from
- Link to v1: https://lore.kernel.org/r/20260115-wip-jremmet-hd3ss3220_vbus-v1-1-b7d9adfbe346@phytec.de
To
- Link to v2: https://lore.kernel.org/r/20260123-wip-jremmet-hd3ss3220_vbus-v2-1-bcad313ce92b@phytec.de
---
Changes in v3:
- Fixed the fixme reference, sorry again...
- Link to v2: https://lore.kernel.org/r/20260127-wip-jremmet-hd3ss3220_vbus_split-v2-1-f615d4e88634@phytec.de

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



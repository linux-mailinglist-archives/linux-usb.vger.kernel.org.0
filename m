Return-Path: <linux-usb+bounces-32722-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMnJFuRYd2lneQEAu9opvQ
	(envelope-from <linux-usb+bounces-32722-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 13:07:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 059DD8800D
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 13:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97149301475D
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 12:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FCE5334C03;
	Mon, 26 Jan 2026 12:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="OxDRTCKH"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020093.outbound.protection.outlook.com [52.101.84.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C57E334C04;
	Mon, 26 Jan 2026 12:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769429212; cv=fail; b=PeFRrsxer0HNrQ1qoAjnsYcnoFQg1ZmLI4NJ7EHWmzJDsfSM2Xv3WNscLDpNJUf23JJHAFihK57RHG83ONsjrDxkomqNtTstIK7DJU7g3NapghHWJgNVcNdyHNMx2uD0CGxGLrjvA7V2YTpaJHDS1oitIrdr9uWZvakeLg2oQ7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769429212; c=relaxed/simple;
	bh=jlpgFQ3SO4wFqiMh+s9qE+8W5sh0g3nyx+Cam/3r6JU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=MRKakuK9FPnbrQpEprySn8regQ26dedR43cVHyvAO2XSWfwlcLqLyPpwcqpD+35xj61/1oA+Qixed3kqCqOuX5XpG/3vt9NWMj3FELtryOekNEfeGly7+8PHYTd2rF7e056Ab+a1igDuqoRVOfmhNdcxUQFEk55ndceiwhJKvNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=OxDRTCKH; arc=fail smtp.client-ip=52.101.84.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x28wsQrvTx51cKPEQIJa79mg5VI8xwGHElrInFcEEWo403f3cRtadj+7ReUTvQW7celP92uLACQFnNiQzMFL4UceLptwPLHprPTKrA3XO3RUQOmIUaAExecW1CQsz7MVjge02M1B0v3KgFQeKpdebyrZ+GgKE/ur4PVi1BE+Ftq17Ocuep/t2Q+gg81w3wLDUThZUH1uL2LdtqGzmDNY+dfQdQ/TioOoUTa68oNF7CtszCuMF7Z5Kk6C2ovUEahAixj7y7iQYHNFPwh8WnP3sgE+vJHhJWu/sDO6fnbFpJhmdeDPAd+tnuP0v533rrV3854PFiAoDad51mYJmRip2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TspfMXlWk6pN3yZefWU5BPTxCyWS94GxYurhPd2GVs=;
 b=u32O3w6+0kq8xuaoIeWAbTtj6BZb8khwvqXrbma9I1ef2yAZFoebW5JZq69vi5RGUB2gicU+biP8mfQwQgvQ7zzVxCstbZbQCvP2WrNMbH1hnuYkAyfmaIDVRcjixuZVN5FgKNPyfLDzG9fRuIaXLDiDWsFwTwS5ue3R0NobgPAN/j260KNgt7zowOtVeEwrY+SoJOlDKFeF54Qfoszv4Oe7y8UUaLY4LGujgJCE1MzFQlapTiv7BdVjk94bC/n6gRcadL6TCQetfdKMdQxIwqGCJB6VUN36wuU3fPP/azUgWrDDMd8dKmxajvSO99Jk1uTTTS8jbPwT3oRQqSu5vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TspfMXlWk6pN3yZefWU5BPTxCyWS94GxYurhPd2GVs=;
 b=OxDRTCKHkZiELjZh9zV7YmIxoCtoykICUYKvj0GysaNN9PDwflV48DWzR+KTebtvdmICJDtX5l/n2mo2eYSWtMRuSkGDyY/TKlg4JHbP+KRGZ5eldg/hskG3DZO2SNZROQmhUrr5dTYHKNb3fouLkzY843GHFrrwaaoRDkPV6E7X3nZ9dH9lZkS+NOanQRC0dfBBedoU21FFK5jDk0+a1uSmQV9aw9gRYv51myluXT7JNz9NF3L3ma6+ckYiEZBbbG7XyV047J7bIviKPNPZq5R4emk8Ihg6ZTt3jbCleLxKHFrLsORgj1vRPdrcWJmgONYbKM30BOwkj0zRsWD9Cg==
Received: from DB9PR05CA0002.eurprd05.prod.outlook.com (2603:10a6:10:1da::7)
 by AS8P195MB1798.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:52e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 12:06:44 +0000
Received: from DB5PEPF00014B91.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::1d) by DB9PR05CA0002.outlook.office365.com
 (2603:10a6:10:1da::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.15 via Frontend Transport; Mon,
 26 Jan 2026 12:06:39 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB5PEPF00014B91.mail.protection.outlook.com (10.167.8.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 12:06:43 +0000
Received: from llp-jremmet.phytec.de (172.25.32.88) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 26 Jan
 2026 13:06:43 +0100
From: Jan Remmet <j.remmet@phytec.de>
Date: Mon, 26 Jan 2026 13:06:36 +0100
Subject: [PATCH] usb: typec: hd3ss3220: Check if regulator needs to be
 switched
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260126-wip-jremmet-hd3ss3220_vbus_split-v1-1-b2f946f1a4ae@phytec.de>
X-B4-Tracking: v=1; b=H4sIAMxYd2kC/y3NQQ6CQAyF4auQrm0yFDIyXsUYolKlRnBsBzQh3
 N2Juvze4v0LGKuwwa5YQHkWk8eYUW4KOPfH8cooXTaQI+9K8viSiDflYeCEfVeZVUSunU+TtRb
 vkjDUvnFUbwM3AfJNVL7I+5vYH35Wfk65lP7jun4Agnq4DocAAAA=
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B91:EE_|AS8P195MB1798:EE_
X-MS-Office365-Filtering-Correlation-Id: 38dab00d-454e-4714-3913-08de5cd35f36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SUxtRDlNa1hFZWkvTU5VT0JBR3R5UFZOU2NIemdRSnIvSll5TzY1TzJnZmJR?=
 =?utf-8?B?YXFsQjNrbnhRYmhRMmNwR0ZpeFBGOHFleXIwL3ljVVpZR0pWMGMxOG5QdWdM?=
 =?utf-8?B?eFIzdklCaXVaL0UvVjZPMFI4OXpUNHNWNVNjWnkrZ2pPbjFTY1c3bGtRaEtn?=
 =?utf-8?B?aVZvK2NVeWw5VnZ6ZjhrMWhZUXRiT09WT1pzcU5EUEpYZkdrNlI0Z2g3Vi9J?=
 =?utf-8?B?M2toMS9MMk9IWW1JalpFb3BqN294Nzl6QkEvZ2JQdFBCZ2NHMFRMemtPUzdI?=
 =?utf-8?B?U05oZlJ5a2p3R1IrcThGOHNGZUVnVVNldXVOcjB5V1lHckV4R00vWkxiYXdJ?=
 =?utf-8?B?YmlNeS96N2JIdENzdUpxOUZTeXU4aUhWTjhNdVlTWGtnNEFELzF2QjlEZlNC?=
 =?utf-8?B?MmNmNk1GSnE5QS9LZnhGL1doN2txc0FiL0ZsZHJuU3B2emFxcG5iMEFQbTF0?=
 =?utf-8?B?ZWk2Z052ZHdLZnNCV1RIei9oMUJXSDlwUHB6eUNiQWw4b2N4NVBYelVQQk95?=
 =?utf-8?B?MFlGUTNNUXp0QmQwUk5kYzhnMEZPYksxN2ZwT3oydFBpYlprOVRwVzhnYnVl?=
 =?utf-8?B?YnNFVE9iVHZkOXNNNHhJUkN0Vi9mQXhhUDQwSlFmSWd5Y2RTdGJQWC9XWkFM?=
 =?utf-8?B?emRlaDYzT0VvTDYzZHduQkQ5aXduc3BiOXNGWTFQSVoyRUh6MDI5RDdvR1hZ?=
 =?utf-8?B?MmhLank4Q3VmOG5KYWxMY045Slg5b2tEYXhQSlNKZEFHWm1BaU10d0tOeXhE?=
 =?utf-8?B?Z3dtVWpRbnpHWUdUdTllR01peUxsdlNaU0pjc0RKR3k5KzczcjQ5QTIwNkVl?=
 =?utf-8?B?NytxUytRZ1NsNTVKU3B5UDZVZnh6VitWbUJqK09rS0tKQ2JwMk9XQzJWOGM4?=
 =?utf-8?B?ZnhEdmhOa01QVm81UnhZWUJtbTFSZlZwSUh0YkJhYjhWbVhxdEdtSzZ2c3Y2?=
 =?utf-8?B?N0VpZFIxV3NIeHR5ZTJJUHVpTVBVTERXejhqL2N4NG1uL0VRMTc1cUd3VkZo?=
 =?utf-8?B?ZnZ6TWpBTTZpWlQ0K1YydDhIT3kzZk82cnRXcEE0ejNxU2h3a1NKbnc0bG5y?=
 =?utf-8?B?T1VzckxSQ1ZhQjl4bVVCS25OWnh1amZpalhoV20yUFZ2dHQrbERrNTduRGtl?=
 =?utf-8?B?cS9sQXpGTnV4bGMwQ2JiRHBJZEpSQWlnaERVelJncFZVNTR2NGdwVlJmbzBp?=
 =?utf-8?B?OTNoRWp3dHJMOURKZ241TDVBNFYrRTEzcTc5RldPWDRQWldrWFJKTG5TWGxE?=
 =?utf-8?B?bU1nRG9DcDU3clpqd21xV2VlU3A1elJBeXczYzN5V1MwZ1lVMnNuZ3hMck5S?=
 =?utf-8?B?N0JxNTdKUlkrWUoxZUo0NWRlVmlJMFRXTGhHK21KbDBZOWtPcEg5dDlheDRZ?=
 =?utf-8?B?aHlXQ040Y0lsVWVkZ1lVM0NEY0lZamtBR0tjdjZ2YWp6dVVuOTJwT3N3SWVG?=
 =?utf-8?B?Y1FiMHVXR1hzRXFtaWxlYytlT09lRE9oUmpqNWNlTVcxSzFGTDJUM1ZQZ1dK?=
 =?utf-8?B?c0NjRjEvVGMxQ2wxdGswanVKYXIxZ2hmSDhpeURzenhkV0hBeTlwTHMzOUh4?=
 =?utf-8?B?RXFhMVo0R0U2UmRyZjlXR1BJL3A2Ujl1dDZ5eXNLVy9FOTFvQ1NlZ1l3a1Vi?=
 =?utf-8?B?U1ZmSWhTU1RyR3BlRFlhVE9QaEV6NzkwYTEybVZvd004VmdJeGlrVGMvMm92?=
 =?utf-8?B?TEEzejNucVp1ZHNHSDlIajdZNFQ3SWM1RGY2WEN0em1ab2VvcDBIeEF4UVVO?=
 =?utf-8?B?SEZyOVdIMVZuYUhhanYxSzlGaWFFc0J6ZE8waTRMQU14WW5RcDVaQ0QycFcz?=
 =?utf-8?B?dGtzeS93ZWI0VTJCeGR2MEp2eEZJV1hTTTMvUmU5UWlVQ0lUUkZNaW1tR2xB?=
 =?utf-8?B?NldhN0RCQ0J6YUF2TmQ2OXVvN3pQU0w0Z1NpM1MrRlk3VCt1aERoaUt3UHpS?=
 =?utf-8?B?eVA3V1FNSytwQ3ZEQW56QURZdzRRTlY1Y3U4OExxdVV4aElIQlhBQjlndVJM?=
 =?utf-8?B?VHZjN0RpeFhWQzBhTnpvY3MyaTQ3OWRJTC9ZczQ2VDRWeU9ETTd3MjAxTkNW?=
 =?utf-8?B?Z0NuVnI1L3dkOVhkR0owR3d0OWZrQWNQRmhzWndvOTRrai9BMmt0eU0vS0x6?=
 =?utf-8?B?WkhILzdBMFNWdUJMOEVhNTB0TkFhdTZrdUNYelcwZ0g2ZVBhWTRFVytrQWRR?=
 =?utf-8?B?eGxwZmJzMGMyQ0svQ2ErVFdWZC9KK0FQWS9tRzE4ZUZSV3l6TFZrVXQvVkpK?=
 =?utf-8?B?RmZKMDArRnUxV3dnUm5oZklqUjRBPT0=?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 12:06:43.7813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38dab00d-454e-4714-3913-08de5cd35f36
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB1798
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[phytec.de,quarantine];
	R_DKIM_ALLOW(-0.20)[phytec.de:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32722-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[phytec.de:email,phytec.de:dkim,phytec.de:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[phytec.de:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[j.remmet@phytec.de,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 059DD8800D
X-Rspamd-Action: no action

Check regulator state as peripheral and detach can disable vbus.
Without this check we will try to disable the regulator twice if
we disconnect host and then connect as device.

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
This is a fixup from
- Link to v1: https://lore.kernel.org/r/20260115-wip-jremmet-hd3ss3220_vbus-v1-1-b7d9adfbe346@phytec.de
To
- Link to v2: https://lore.kernel.org/r/20260123-wip-jremmet-hd3ss3220_vbus-v2-1-bcad313ce92b@phytec.de
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



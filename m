Return-Path: <linux-usb+bounces-32652-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mItmDGuLc2l0xAAAu9opvQ
	(envelope-from <linux-usb+bounces-32652-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 15:53:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9D277458
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 15:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C49803020865
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 14:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D85732C945;
	Fri, 23 Jan 2026 14:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="IK4mDAtd"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021142.outbound.protection.outlook.com [52.101.65.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC4F30DD36;
	Fri, 23 Jan 2026 14:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769179998; cv=fail; b=mryBGPDKNghm9UJBN9kuxj+26N7qPd/1Z6fsE5WA13y5ehOmuGgP/hMjyj03tubGW/2vJ+8uQ3RDuWRgJDtL1U3VoXGAg5xRYrB7Os4grYZYiNscs0DvFem5h0pVCInUrL4y358MXt8IwojKXJNSvAYxHE6xi+b+kTBrG0xXR1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769179998; c=relaxed/simple;
	bh=9G4v+an2EDxTr9P//Z3/yqsUHvuA5PS7H3wn1TS6vQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=FJbvWujQCo3lzxBgwlWnkdKxneKNT8Y/xMrSsBYo0u+dF43++V2K5EZUAfcYuzLHLoBuv9rBToLA46cuRxPapzVIVvs8kplZ2y60RjhaIjGplHmUhaXIDR3Pa0hBfAwvUCdQpThjV/fS6fyxK7/RclgyvZT1MEMjsILjVc81LiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=IK4mDAtd; arc=fail smtp.client-ip=52.101.65.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xstGv0i5KPJ3ZYmuO44vcYsbhVqe6qJU4C+67IFscmxZ1IeN42gZK9+emgCxetSpgp9Ca/wa0gh7lhqbMOLhd/oBs37PfUgEXfxsOw9MOQhI83Vtdzhrby+Mf/weO3WiXlkFUNVuZTi0k5761fHFSZUR5lx2URcd8sel5H/1GXTIZ2um5mTZyAHVHWFijw3AHSLLFuyjY7oyO1IyBobvoXABrbYejd1Nxr7gtmtcQVTYM7q4j+dfh67abKTX02n/+WjSFyRJtB3vMkM4QbH8zpBw/0o4NfMmRlhZ1S7usRK39e1wXfW4BdpBnHHVkXBigE4uFBvnYfCBZqnW168PUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVV46MBqgnBvMOURZxYe01ZGhhSucwVH9CZ/38d7bD4=;
 b=Ujj1FesacZM+Hpcp6QYUjRJmSmglGhSXBhViGcDUHMZMSVmljAA8upeL9BWuI+uCvPP5ZvPpGhk1yn+QqpbtLcuIjdh7/hVZpRr//w93QmrzHj4nlIGT2nN/uV/2atoCuQjDBVIUDadaEHW0hv/gfodMyxpGFCLoE0OG16zcWSdpKblgJ3aJ6vxHcvtMaVM/jMVbzZjemTVF3ssVfvBlsFhdOCp216TXeobcMRaUDZuxsKgrTRnEfPhQzOcpYQuWnxbyzojhREq9I0JJ9+CMsNE5DBN0nbUOexg25dH5qgMk5Yzn3UZHjbWCDO3VUJtS2GUUs3YfocAUQ+DVV9Ns2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVV46MBqgnBvMOURZxYe01ZGhhSucwVH9CZ/38d7bD4=;
 b=IK4mDAtdIRVZyv7R408tepY6ESsjhEb0DaHL0HAlPoCl3DLfyv21ts39bYNrmct+vBJWxhocXhMic/NB74y5ZWlpgIDa703bJkvSVk5+KA9T/4AOoLzhocaSVoRlMZQNH+PDr0UeoJ1Y2DaKR+zMF1iYFx7GdwjQ0/jqYzTaKwcjgAkQ0fTyUzFUdEuLO8fHy82dfIjke9xS8vKn7+uASPcAMI2uJrvKwjTy2fLnD3SkwdS4yBKYBla4/JFyKRT4XtoTxWtoPoap+8YpdKx/5omJePrDpnX2++IoIMBvxDa1n7bG2hiJkx+H562S9fVXE56z8MgxzxwwDGNj/3zblQ==
Received: from AS4P191CA0007.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::7)
 by DU0P195MB1589.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:340::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 14:53:06 +0000
Received: from AMS0EPF0000019D.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::e7) by AS4P191CA0007.outlook.office365.com
 (2603:10a6:20b:5d5::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 14:53:00 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF0000019D.mail.protection.outlook.com (10.167.16.249) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 14:53:04 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 23 Jan
 2026 15:53:04 +0100
From: Jan Remmet <j.remmet@phytec.de>
Date: Fri, 23 Jan 2026 15:52:37 +0100
Subject: [PATCH v2] usb: typec: hd3ss3220: Enable VBUS based on role state
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-wip-jremmet-hd3ss3220_vbus-v2-1-bcad313ce92b@phytec.de>
X-B4-Tracking: v=1; b=H4sIADSLc2kC/43NTQ6CMBCG4auQWTuGtgjiynsYYko72DHhJy1WC
 eHuVk7g8vkW77dCIM8U4JKt4Cly4HFIkIcMjNPDg5BtMshclrkQJ3zzhE9PfU8zOqtCUFLm99i
 +AlZKdlVxrgttDKTA5Knjzx6/NcmOwzz6Zf+K4rf+lY0CBbaVrbXtWlJFeZ3cMpM5WoJm27Yvx
 lRGF8QAAAA=
X-Change-ID: 20260115-wip-jremmet-hd3ss3220_vbus-732f74894acc
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
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019D:EE_|DU0P195MB1589:EE_
X-MS-Office365-Filtering-Correlation-Id: d1e494df-ee42-4df6-0f48-08de5a8f1d38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0RKeDhjZHpwcjQxbUhmNEVEOEFKYlZ5Z0pFUytFS3dZdlFTMmxIazZGelU4?=
 =?utf-8?B?ME44TTdaQlI3WE1jY1ovRVNieThMWWZ2aXROdVlLbmVLaHk0NHc0NFRUbWZM?=
 =?utf-8?B?eVFsMGVSTXJVcHJIQ1RBTzVqSWNaT3Vubmd6SGp3R3lHbnE3ZHkwMHkrRU04?=
 =?utf-8?B?eFg2ZmdOc2VvcjdONUcwUEppTmhvMGg5U3oySlpIb1Q1a0Ywc0hoRjZKL04r?=
 =?utf-8?B?M3YwOFRPTzhJQzIwZnh1STJ4L1EzMTYrQjdpSHI0S1pzcFZELzRnQ3NWWUdu?=
 =?utf-8?B?ZlRMUzRnMXZvY0pxaWZsWC9TdmVmam11cTZHbDBSUCtYUWx3UEt1d0lpM05r?=
 =?utf-8?B?azJxaFl6RVg4aXl6RU9pVlRvODFrbllKK3dTQW9oUXF3bnJiV1diL3BtUnZP?=
 =?utf-8?B?Y2VacDFjWmlZWWYyc282eWd6QmhldEtQcVU1VGFtNEVEVjlicmxjT1ZJUkNw?=
 =?utf-8?B?NHlOYzZNR01SSlplbGlFSGJOU0hhOW9FdEtpMUY1aFlqRGJzdG1ucEpUYzdt?=
 =?utf-8?B?aTIvc1VaV2pGQjVnM0MxSEJKb28vdHNBaGplNDdicUptUU13UU10ekFUWWpW?=
 =?utf-8?B?NHQvaWpsQWQzTzU4Z0pucWZJQTAwbGJBMXgzZXVwWHNGV3BMd1dpNDFGTGY2?=
 =?utf-8?B?YytyeVZqREIxcDRCemYrdzh2NUVnU0hhNHJLYnUrRmVLbkxwM3Ezei8yZWND?=
 =?utf-8?B?RUU0OXNacmU4cVN5YmRrcUFjR3NMTlVVQVk2Z2wrM0ZESTdSbi91ZzZIVjFC?=
 =?utf-8?B?MFNlb1F4U3NBQ2FHMjlsRmswbmRmOEpKcHUwNU9IelpVeU1odU5nREVmYys0?=
 =?utf-8?B?SFQvakNYSVNYT2FWT2RhV0Z1UjBOK2N0c2ZLWUp1ZThrUkMwNGxEYUNaNTFI?=
 =?utf-8?B?ZUJWZkl0b2xLNXg0M0ZaT1RNaS9mb01xdHh2Y00vY0VwdzNjeHhRTVN5RFpR?=
 =?utf-8?B?RkRGTUN6RUpxemc4L3FPMXJxOGFKVjRMZ1BTd2R5NE94YUhsYm9TSERod0pY?=
 =?utf-8?B?N01iZktCbEdaNFNTU3BjMEI2SXdTV0M3YjJ3dVhjeXdBeEp0YUUzaDlxTXZH?=
 =?utf-8?B?WGY1eStHUEhkT09lb21nTU1id2FlbEtlWG5QdC96S2Rua0lJcEU4Tk1hUHZi?=
 =?utf-8?B?QURLMElxcDhSeExOTDRFY3Fnc21OMFROd1RVNmNlYkN3OUNVNmpnajV1NlIv?=
 =?utf-8?B?MnFmSk1wc3lTOWh3T1dlWUNvS3RISmtsUkh6aXRoN2pQQkdzeFlNQVJZcFh0?=
 =?utf-8?B?M2I3dkhtVkpTeEp1RDAwdEFZSTE2bnZsQnFvcEh0MzBUMk53TUFpR1YzUTRt?=
 =?utf-8?B?T3F2QUdqVnVadEdjOGQ5M0RCekdOajlBaHo0R2xxZHlFQkpjMHJrSXM2UjNZ?=
 =?utf-8?B?Vm5VdjNlZWpkaDYxYzJ5a1VSRmNSUWp0Uk1YazJnTzMwQ2ljVHRYRzk0NDkw?=
 =?utf-8?B?WWlMQzFuQWp3NHNhWXpqQzhiWkdDb082bjJoNUUvTXhTOTFRUmw1aVdJS3VG?=
 =?utf-8?B?MHVTMy9KWHZtb1h6OFhxdk5wQlVsMU9wcis3bGZRN0R5RDFCbThGZDJtZzZP?=
 =?utf-8?B?azllV2FKZ2JUZXJ4aFYxWXVmY3ROT2VEb3MwWTQyczZNU3dCRGY5cjVySG1P?=
 =?utf-8?B?emlxQ001TkVRODF1NXFGcmRZZkswaDhpRHVPNjRhRkNZUDdtUVpUcHRzWmxV?=
 =?utf-8?B?aERTUEx6bUJLS2FJYWM3MVBWTXlZc295ZUQwRzhGRXBIRWVHaFl3MEJnQ2JQ?=
 =?utf-8?B?M05OV3RaQmcrWXJrZy9sZG91M1JkU2VWVXNBRDBsTFgyYlNob3o4dUVKeHQv?=
 =?utf-8?B?V0xqQ1ovU2crSDk5Z3NISkE0a3NmOTlwRDJ3eHlWeU1DRSt4SGNXNW9LSmp3?=
 =?utf-8?B?WURYRjdFRUFKNW9pZDBtUTlKL1M0bkhOMDkrQnJrM3U1ekFyYU1QRkpjVytE?=
 =?utf-8?B?bms3WFF2Zlh5SjU1SElZZVFpakhmdmlhV0lESEZKbFNQV0JGbkhyTHdEVE01?=
 =?utf-8?B?STJDOTBKL2JQdWxlMisvd0RNZlZzMlNaeVp2TkVXSGpJM0xwbndIbm9lbGM1?=
 =?utf-8?B?UDRiREVIdGphc0Y3enloQzJuN0lUa2g2eE5Db2ZVVnNKL2p2dDduUnFBWU9z?=
 =?utf-8?B?OUdObjFrcUlldDlOWGE4Y3RvQU93dnNiRXUwaURsQmEzNEtCN3I2eHllN2g1?=
 =?utf-8?B?NTlaTHhWOXp1bXlZL1lyV2R0MEx6M0RXRjhCYXRpYjJlOStTTkZSYXg1bTNV?=
 =?utf-8?Q?GkmehbVu1OU4qTP5zkIjGYW3+KUWUO+lPzdKAknxNU=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 14:53:04.9779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e494df-ee42-4df6-0f48-08de5a8f1d38
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB1589
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[phytec.de,quarantine];
	R_DKIM_ALLOW(-0.20)[phytec.de:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32652-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2A9D277458
X-Rspamd-Action: no action

For systems where the ID pin isn't available as gpio use the ATTACHED_STATE
register instead to control vbus.

From the datasheet:
"This is an additional method to communicate attach other
than the ID pin. These bits can be read by the application to
determine what was attached."

Use this method if id-gpios property is not set, but the connector node
has vbus-supply defined.

Check regulator state as peripheral and detach can disable vbus.

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
Changes in v2:
- Added check if regulator is already disabled. As detach and
  peripheral mode cause an interrupt.
- Link to v1: https://lore.kernel.org/r/20260115-wip-jremmet-hd3ss3220_vbus-v1-1-b7d9adfbe346@phytec.de
---
 drivers/usb/typec/hd3ss3220.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 3876f4faead679e6c04062ab2bcf2ae928913a0a..3e39b800e6b5f4d0cbba957c0dd66c18f781ff38 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -204,6 +204,23 @@ static const struct typec_operations hd3ss3220_ops = {
 	.port_type_set = hd3ss3220_port_type_set,
 };
 
+static void hd3ss3220_regulator_control(struct hd3ss3220 *hd3ss3220, bool on)
+{
+	int ret;
+
+	if (regulator_is_enabled(hd3ss3220->vbus) == on)
+		return;
+
+	if (on)
+		ret = regulator_enable(hd3ss3220->vbus);
+	else
+		ret = regulator_disable(hd3ss3220->vbus);
+
+	if (ret)
+		dev_err(hd3ss3220->dev,
+			"vbus regulator %s failed: %d\n", on ? "disable" : "enable", ret);
+}
+
 static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
 {
 	enum usb_role role_state = hd3ss3220_get_attached_state(hd3ss3220);
@@ -221,6 +238,9 @@ static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
 		break;
 	}
 
+	if (hd3ss3220->vbus && !hd3ss3220->id_gpiod)
+		hd3ss3220_regulator_control(hd3ss3220, role_state == USB_ROLE_HOST);
+
 	hd3ss3220->role_state = role_state;
 }
 
@@ -330,18 +350,10 @@ static const struct regmap_config config = {
 static irqreturn_t hd3ss3220_id_isr(int irq, void *dev_id)
 {
 	struct hd3ss3220 *hd3ss3220 = dev_id;
-	int ret;
 	int id;
 
 	id = gpiod_get_value_cansleep(hd3ss3220->id_gpiod);
-	if (!id)
-		ret = regulator_enable(hd3ss3220->vbus);
-	else
-		ret = regulator_disable(hd3ss3220->vbus);
-
-	if (ret)
-		dev_err(hd3ss3220->dev,
-			"vbus regulator %s failed: %d\n", id ? "disable" : "enable", ret);
+	hd3ss3220_regulator_control(hd3ss3220, !id);
 
 	return IRQ_HANDLED;
 }

---
base-commit: 944aacb68baf7624ab8d277d0ebf07f025ca137c
change-id: 20260115-wip-jremmet-hd3ss3220_vbus-732f74894acc

Best regards,
-- 
Jan Remmet <j.remmet@phytec.de>



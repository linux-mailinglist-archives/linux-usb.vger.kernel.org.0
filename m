Return-Path: <linux-usb+bounces-33131-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJzPHLmnhWnUEgQAu9opvQ
	(envelope-from <linux-usb+bounces-33131-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 09:35:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CFEFB915
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 09:35:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2A89301573C
	for <lists+linux-usb@lfdr.de>; Fri,  6 Feb 2026 08:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2FA33B6FD;
	Fri,  6 Feb 2026 08:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="ZqHfbFt8"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020092.outbound.protection.outlook.com [52.101.84.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F2917736;
	Fri,  6 Feb 2026 08:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770366894; cv=fail; b=fd0F42SK0mrHeT23TWBEk8iNDxe4c4FpJWX0O9gNq+n8ShFjXbx6rZ8Bxx8LGbRhlropOsiUvc+754cvWcYFnhTYtP3tObFXyc75/CpMmp81aUVXMYR4bx2R6crP4Uii3QztcqC/j7eecFiwH21AXp0Gg0wngYHHYjj4dbjrATQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770366894; c=relaxed/simple;
	bh=+uHBhZxRzanBQSSgDeF3e3iwRjju7SGnA8feRtHkd9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=e1DxkDanRk9hBYlDwyiT47GjA3Xoo4M+K0DtVWlaSNtNSh6keIN6eBdoD5hoiHdWlrfbHBBonkn/4NDcmeKJK0fhEIyfu2BmOMZbAQBYvSm5wYEl1l/Y48kx90vbbg8y5y2To1Equ/7vRETad66XrPLBh5EQdTsl20IV99iWqh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=ZqHfbFt8; arc=fail smtp.client-ip=52.101.84.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2UvXUYO97TPqn3JwX10mkb562HUfpApsYjCW2QuCIpdSTEhNJh7XOG59le3oiIMhb7vMX6ssfJzfYko3CyZnxjsDRYniOsI6GTgwPV0GyNj/kBJeVzg94T96y0KMugUJ4509JOezATknUVQ0/yPev06ZDLaMU8yNre3AxDvRToD2RgA726APdYaeAAAqpZ2atZUPjCnScvV8zp7sDoBtCjS3aTIjUiHxfKXHlGKAZp1NTZuwjwGC0siZe2Ln8GHnClc9l8MSx/gfcUz/yprIAJdJxPr+HYbbaR3GcScoLSxPSbpVhyS3mkxgTgoGD/eEaEatJtmmlkRLZwb+NeAow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjeFmrVaC1jtVXnLrLk38sCcSnpU3Owf9rJxQvThpmo=;
 b=igcnavUcbWu2MQDZsX1DXDm3993TURwI6uPtsbCxffL/XepTKz8FvT+X8/OoZrSzraLEJ8BWAD9WCkDERXFSs/7MO5u/FdF5KzS3UGEbClwn1BlAL8W0w8ynyfUW/iRKiSbE3jDqfRmoJy+KaZWXH8PdZCe7ECmUPzSM8L/ajs8AZBlb5SID25pKA1Y2RDQQe9T5NlRW/+ZAwcwXwTLFRY09W0uPt0xAHzc+8C56tvNn0jOLZyhQ2YNJCClJBlz2LoCnuH2/mIulKiLxiLLFwtaXqfn5asAcbiT3k/rTJ6+uVTWP8oe1tUG0AdbQsleG1U+l0lPGn7tXfP3fMPik6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjeFmrVaC1jtVXnLrLk38sCcSnpU3Owf9rJxQvThpmo=;
 b=ZqHfbFt8/hAkvlUAK/EgWN7m3yMU3SOA9KlEn8pkNGFiUnhbAeOz8FQ4g38ofEpL74rjZzmdlBO8zbQmCvptWbng9m3KK/KweDXE7ozhecEwLhRFQYhACRY7V1ImnHNF2w764BKy8w1bGyglO5Z2EiPfsXNKdDqW7nNL008KV5ZlGM/411NZYH0dwmhbuwy21c1Dd1KspwQ39WJYacA49f9MeB25dhcwx/CRXfdLfvnrq3CBG/u7n8a63FV4XOSV/GFE1nw7wIEn+BHNRaZH/y+Fe3qaOXQYYtbY6KTUa2ERxI3rXyrpf1SHSE8A1aGwntbq/sXvnu5hbiOipWRgyw==
Received: from DUZPR01CA0161.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::18) by AS2P195MB2405.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:64b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 6 Feb
 2026 08:34:47 +0000
Received: from DB5PEPF00014B96.eurprd02.prod.outlook.com
 (2603:10a6:10:4bd:cafe::91) by DUZPR01CA0161.outlook.office365.com
 (2603:10a6:10:4bd::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 08:34:45 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB5PEPF00014B96.mail.protection.outlook.com (10.167.8.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 08:34:47 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 6 Feb
 2026 09:34:46 +0100
From: Jan Remmet <j.remmet@phytec.de>
Date: Fri, 6 Feb 2026 09:34:31 +0100
Subject: [PATCH v4] usb: typec: hd3ss3220: Check if regulator needs to be
 switched
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260206-wip-jremmet-hd3ss3220_vbus_split-v4-1-ee5b4e402187@phytec.de>
X-B4-Tracking: v=1; b=H4sIAJanhWkC/5XOyw7CIBCF4VcxrMXAQCl15XsY0/QyWIyXCog2T
 d9d1IXGlS7PLL5/RuLRWfRkORuJw2i9PR3TkPMZabrquEVq27QJMFCMg6JX29Odw8MBA+1a4b0
 AYGWsL770/d4GWkilGci8QF2QxPQOjb09E+vNazs8X1IpvI+d9eHkhucbkT+ufxQjp5zWYFLZ8
 EpWuOq7IWCzaJE88AifYP4DCAk0imetRK2VkN+g+BcUCWSsyHMwQoPKPsFpmu55z0qohwEAAA=
 =
X-Change-ID: 20260126-wip-jremmet-hd3ss3220_vbus_split-946802479e89
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Krishna Kurapati
	<krishna.kurapati@oss.qualcomm.com>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<upstream@lists.phytec.de>, Heikki Krogerus <heikki.krogerus@linu.intel.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B96:EE_|AS2P195MB2405:EE_
X-MS-Office365-Filtering-Correlation-Id: 072dca38-281a-4d7c-2691-08de655a9644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjhYMWdoTzlheXpHRXF1RFdQRHVlRm1OSyswdHdEdmpzZlBvUUZhaE43TXBL?=
 =?utf-8?B?VU96VUlyK0tseEpjQnpRS0tDdVBsMVdGam4xUXhlSmxxdGNBNlVFM1ZiQjIz?=
 =?utf-8?B?UUEwRDFWd1pCYjhGRUhYZi9iRmxVQTNsSDB4VmY1MmZ1L29NVGNQRjhqekRz?=
 =?utf-8?B?V01WQUg1eVFlRGU2OXhzdHMrSG1uajJnRjFLM0dzRVRJbnlzSEw4aGZHbmxO?=
 =?utf-8?B?aFVsbjA0WERMVjBxMUhnd2EvSm5TaWhPN1ZlZGtVT3pKR2sxZHlXTng4UU9U?=
 =?utf-8?B?ZHNYWFZqT1o5bzJrMTF0ZkM0eE5LbEZXdjFBTFIwdHhaYU1ZM0FHUUc5NEJE?=
 =?utf-8?B?bFhTNHBJcUdUdmVEYjIxUjE1SFpzWkVISkVUSnlYbUx4aTFWTTgyN3lQaE1i?=
 =?utf-8?B?czRjcDFZekhUdk1QMlltWC9TSWV0K0dibUczR3dnM25YOHpWM0tzeTlLUW4z?=
 =?utf-8?B?NU0zQ05xNm5Wc2NSZVpWL2FxbUFWWTMvSjZwVktkdTB1ZTRsZTlBbXFIMW5k?=
 =?utf-8?B?SWZCSWM0V1pWeVQwSGZNd1J5UFFZbS9CcklGMm1EY2hQRkRxbThRa0pPY3Uy?=
 =?utf-8?B?dXVTUXpzRUNKVnVuR292NXNzWVJXN3htb2pNbm8vWjJKb3ExZTF1d3hrT2hq?=
 =?utf-8?B?QU9IR0huekdEWEkwSlFRcXJzUWErWTE1TkZjcDQzcExreUx2M2RYSnNrK25T?=
 =?utf-8?B?cTZscS83K2txb1VtQ0lxRGZvQ25QQllKaXdhemRITStUYWRFVkIrTHRQY05T?=
 =?utf-8?B?bDJpUUkrMnRhc2xtSzdhWlRadllOeTI3SVJXcmtPTDhVZmdlMzltZ3hZQW9i?=
 =?utf-8?B?ckZvSmdaUTZRQW0yWXJSSzVRcXcwYjU2NWQxM2JTTHhLTzFaQU5ORzdGU2Rv?=
 =?utf-8?B?aXpPK3FsM3JUZlJFanB1T05obTlML3JoSlVMdXp2emVzaDdoVDlnY2tNMk01?=
 =?utf-8?B?bUY4WTRsVWJOZWkxLzR2WkV6RjRtOHpUQXBmOTgrSVA1VEMwa3Nnd2MycHhi?=
 =?utf-8?B?Ri9BMXgyc1hyTXVzbCtiVjMrV21hSkhhMkp3NlJnUXM1SElnZnFETDhPTnlM?=
 =?utf-8?B?MlBmWDdCZjFnVnpmL2hsbGdpdHVWV1RqZml0SGE3TE56b3BHOWJpZDFwQXlj?=
 =?utf-8?B?QUR6MHZoN0t1c0x6RzlHS2JPd1RWWGNqbjFqTDlybGRTTjkxSFVBWUwzNjJK?=
 =?utf-8?B?Z21pM2J6Z0N2UmNKRGpwM0kwMk1oZkk3bnZ6ck56emswbnYrWGc2MDZJYjJ2?=
 =?utf-8?B?WURjVmZWRmR6YnZ5a3RQMHZkcnUyaXkvTjlqWE43cWE5MVVLTm93Y3h4NCtL?=
 =?utf-8?B?TXVxek1MbGNmbUdkeUg3SHg1SFdEL2xob0I5QktDQVJPdkpEN2tMQ21LSmJN?=
 =?utf-8?B?eUxRZU85SGMvR05tbWZ0MmV6VEc1YlB4RTFnOExaMDg1VkJjQ0x2a3ZsUFBG?=
 =?utf-8?B?RFNkQ2lqcXlRdW44amNUbHFzZ0xsaXBxcG5sVWgwYk1jTE9tNERqVmttaEU3?=
 =?utf-8?B?ZGJFNWtQUlZ3RjVtejR0ZjJXZGIxa0hqdlZhV0s1VSs2Y2I1b2VLZk9LMkJJ?=
 =?utf-8?B?cnFBN1p4YlZQUXVZazVXOUpvU0VQL2Z6TEdKbUNqZGkwdU9EcXVnMWEzSjhC?=
 =?utf-8?B?dUt5NEJDWm84eWp3ZHZjM0VabkJRY0Jzc3RqVnJqbng5QUpmSlc3ZjFSUExv?=
 =?utf-8?B?UFlnNWZzNEtDOWJKOG84QVEwRGpZTlQxaDdqdTNKUWR1MlF6M1IzOHZIdklu?=
 =?utf-8?B?ZEh3dXpQdDhxU3pOWVlYNFRRMWs4TytGUytGdmh0SFhkY0dSTzQ1ZEYvYWFl?=
 =?utf-8?B?L1NTMEsvb0NOejMyLzNFSWZRNFZCaURCSHZCTE5HOVg4bmRJTE9jTHVBdThE?=
 =?utf-8?B?RGdMemh1bk9FWmhvazRQOFBONUI1SjFuNnRvbmw5bnpNQi9lNXZ6NS9NWU5z?=
 =?utf-8?B?cTR3UDUxK1JKek1rNGRxUDlVUnJVQU1BUWNHT1pYVUhlQlZBcC8rdVZDT2tI?=
 =?utf-8?B?VW5Mc3JpZmVWYVZ6dlNUQXZENHlNMEF3OWt0ZExVR0lxZmszVGNKdnArQmV2?=
 =?utf-8?B?djBROGZybFpTMzJCREhBS08zL2xxektKY1AxbmlnZGNUeEo2dkdoNmRpOWMz?=
 =?utf-8?B?MXRXaXM3ZUo0QVFXOTZ1L08rOGhsRHA0YjdIcWN6YnRpWWFTWnpidzNmcWpG?=
 =?utf-8?B?cFZvQXhCc3lYdHJnNStxNDdvRTcvVFZQc3ArblZGcFcvVnJCYklSdytxL3pi?=
 =?utf-8?Q?UnMfStFNlxf78IUBibZhWt7InMcvx5nublZyuNMym4=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X6gbXtYzvaT61IN8OMRVRDdtLgKKvVCLbM1nQbrU2r8bJVC2Z//pOCDfbcQJaV8c9I4U4zpnAZdn9/0rVrhLiFKIVKFNFpjNIl0fxfAjE7kv++Nja+j1+/gfxNrP9ULHDk3Q7dEATiaUDQdU6EsxqCgOrj5yczUCELfYmT1Zv3sIXAVsw6inp9IGA9LSA8U/EKlvw9wTbKw8WFYKsrZFmKu9MeeSDsbBiNWXrAQKqSNC0B4awWT1TP7SlxswT/gcYvhd1SaLY+eH+YV3qJYRsjFcieg52+jMISvWREHo94Dx2QbQQhtIAdVBkAMSJtyCGUHeYSXb4uQRcuUyKYYjghXnE+sa7ctzW+O/HHgF8zMfKmQYmKGaxWGUEu1ikgcFSs7tgBhkq9SCjG63GOcnvhDxq9B4cFQDereWox16++3CGKHilZ5ZttxA7zv63T3x
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 08:34:47.5001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 072dca38-281a-4d7c-2691-08de655a9644
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P195MB2405
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[phytec.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[phytec.de:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33131-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[phytec.de:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[phytec.de:email,phytec.de:dkim,phytec.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[j.remmet@phytec.de,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D7CFEFB915
X-Rspamd-Action: no action

Check regulator state as peripheral and detach can disable vbus.
Without this check we will try to disable the regulator twice if
we disconnect host and then connect as device.

Fixes: 27fbc19e52b9 ("usb: typec: hd3ss3220: Enable VBUS based on role state")
Signed-off-by: Jan Remmet <j.remmet@phytec.de>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linu.intel.com>
---
This is a fixup from
- Link to v1: https://lore.kernel.org/r/20260115-wip-jremmet-hd3ss3220_vbus-v1-1-b7d9adfbe346@phytec.de
To
- Link to v2: https://lore.kernel.org/r/20260123-wip-jremmet-hd3ss3220_vbus-v2-1-bcad313ce92b@phytec.de
---
Changes in v4:
- Removed superfluous empty line between Fixes and Signed-off-by
- Link to v3: https://lore.kernel.org/r/20260127-wip-jremmet-hd3ss3220_vbus_split-v3-1-009772f38265@phytec.de

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



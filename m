Return-Path: <linux-usb+bounces-34382-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMmrKbDSr2kfcgIAu9opvQ
	(envelope-from <linux-usb+bounces-34382-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 09:13:36 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B245224715F
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 09:13:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CDA103026D86
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 08:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E15C83ED136;
	Tue, 10 Mar 2026 08:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="V0u/TL+N"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010027.outbound.protection.outlook.com [52.101.69.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CFF3EDABA;
	Tue, 10 Mar 2026 08:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130348; cv=fail; b=lOIzChIvpykrN9EX/vMP0pLlDLtqSdNQ5SIyubnpgtmMQMhflFF7VqwI9B8Xu+Cxcois+bSyl9G4vuqapi/E2R9tMUOVt73CqYexoTuafygKll+EevrHdx3FFWJa65MCouOA2HttipbnBQWQMMf9iKoQ3h7fNZUlN2jN41o4i/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130348; c=relaxed/simple;
	bh=vOoaq2GKwXNM/YnyRn/RJbkl5oKSJq4MnVutslqhdXg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=T5zV+uJWa8CpI+rI/iZ3mpP9xu9idX4S0OpvQHjsAnEHyHr9WIyJVsASd8X2ltbrl7M3UPDpHO28yCN4hIIyMP1dz1U7M41NQak+R/HPiBSM3TxIZKCed1ajlir+VatGD1Kue7X7oCfqntovbYvwNnbal2IfT6YUg++8YI1s5Fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=V0u/TL+N; arc=fail smtp.client-ip=52.101.69.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOOCZWrAO2T9RD+pkt9Y2bc0PSrBdseDKVen82WIAW2LOWqu0bsmQcf6flWdBh9G5Uj+T+/dcq+ZF4MWRFvDwghBTJzbR0S3N5QOJrcIOyhnNdHlezjpoUYW2pltZI4wIb4ABsvO1Duommg5oNL8+lspBlvxiy63aOCGSqn16yKxLYf17Si4Xow02B/k7ZNDGAEk4BmXgU58ibOmPbnhPZkoCNZVGe6lKUxD5xEQNcNe9Zv3YNStIDkfPYjnPC4gLH1BmYs7MSkNASZAGZxIU5vvG5PZynnKUC/dijaoCZyBCOk9dDdsMPCbWoFbTr7jgF6pLYqmEA2jB//3DO+CWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSpohVPb6ieIR7wIyUpGYyU0Y5MJPz2CCQs/aainBHc=;
 b=v71lHtktXIM9wquV+sbw1YzgGabftH6b+qVT6X1+ksNMW/t/KPZixHYuAgqu54HeEGRCY14n7/U9/27qKVDc1mXg474hEjjYVjTTcVYXh9ou4LTHVe3nK67o5OGqkrMGEPpYndHd4W5IGZzSQtDDliVD6SPDrS9N1uPMGGKkYvvCfSLTTMJ0oRlEHFirtlv0m+FchQOBsvKm2AZ33SwX7wYso8vgOy17kxIv/nhNCxzLQCM4IGr2fxlONqTI4nQQuOaCagpD8oNpi2GTIJLaElE/SEFwpjtFWenA8RwuVvkGmrqr1rT/vAFNm5gVwlUKHOHZetUSULWL4tlGgLQVhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSpohVPb6ieIR7wIyUpGYyU0Y5MJPz2CCQs/aainBHc=;
 b=V0u/TL+NRhZsA6WkrMIE4p6tT1bSiMsM0rIx7J3WRwOCXI+HbJZACCjMhhClsww+srp68veF3H0vZjX+hL0TNV2E7IlaIv/FOf/TR8hfi9Gk8coD9xHQGl6LYa5+4orBledqmSKXnMrcNId2PF0l0pnpV2OcI5Jpuyt2X/Tyv8/Vw9SGccNJ7jgnpdb/X6ZzXkSezrCFSOZKSBEZJzPDSDdGWo1vng+YWxcL9B2c5e4TvknGmh0Yf4kL1u41BAMoKneGZ1QK5ocvLDEFOIab7G2pmTdwxXUcX6utLJggvexUQ9CjiDY5uERDOWvgNvLy5Yzp7h9KMajXFRH/iFNgcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAXPR04MB9471.eurprd04.prod.outlook.com (2603:10a6:102:2b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Tue, 10 Mar
 2026 08:12:21 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 08:12:20 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Tue, 10 Mar 2026 16:13:57 +0800
Subject: [PATCH 2/2] usb: typec: tcpci: support setting orientation via
 GPIO
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-support-setting-orientation-use-gpio-v1-2-da31dc6cd641@nxp.com>
References: <20260310-support-setting-orientation-use-gpio-v1-0-da31dc6cd641@nxp.com>
In-Reply-To: <20260310-support-setting-orientation-use-gpio-v1-0-da31dc6cd641@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Li Jun <jun.li@nxp.com>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773130459; l=2422;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=vOoaq2GKwXNM/YnyRn/RJbkl5oKSJq4MnVutslqhdXg=;
 b=PZIQ2CA8y1IqSTpQqbpWGnC3c5rYzVNKD/X0u79QnhLp06e7RWLBbGbX8Xa3/xuAUzDZFIxSx
 bm1u5VrjQQODtrrzMwCQk5Fn6+3Is2kB1mZHY/C61dEjyi2MVH2kgbI
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: MA5PR01CA0139.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::12) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAXPR04MB9471:EE_
X-MS-Office365-Filtering-Correlation-Id: 02bfcd0f-4693-48d2-3775-08de7e7cc0bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	//fNAqlwGHlZdY81iyvpz6QE9l9cyeUx0XzsS+MINhCUUlq4O5GM2Ia81RH5g0xvi0KZPAGM96l+g4VN2cSexQ9Em6EOAujrc1nydIDZ2YH9bQdXRe95Qb84oDAXlHZvNGEB73ejYLS6UciCzjDJdaav+eMMQvLhOM63Qdv0oWjRg+9SOofkub63Qd92oiMHuMpX0HHYHKxiN8zBGVuFBSXUDTHfW29L8JLU02IzythlnjdSPJxyqlexoVQLR+ZwzRV5D0TabC69HZK+YLFAkHTKtcFQ+J3mFHGBQ2Zas/XsSChnHtXAmOfaJcjCkffOGb6As76MVSwRcz+cLDFPpgc8PMeJaQ7z0DY7Y+D9w4exmifpb35eq4gz4BIMJ+GegW+UW6k+LeMsNpkBSHPeb20E72NbWJ46ZJHLZcBXAhGT+iO+HUGrdPpKcRctXAfcpwoL5JzpSrAK4g4mwgxvMWN6CSp8sHq88M2TjVwQYhBCy78QSChGHybeg7kdefbevr7uSG2rYWORn7ilJubplOEcMky8HGzqwTAeLJMCkscGKt1RCqKCWeLMYx9RgS4LxAq6SNFSizPzXzeC680VZJhR5pQzDDxcg6RFO9knLt0CoquQwD6YA1FBxDBhpv1qZKnJ4vPJY7A2HmPpcZFIiF6jOLMEbhMVJ52oaYo1HykeNHcKjTYu5vdqYckIzzgpGI9xJaUcE3/5qjjozyYRqbKapL1CJ/YX5cQqt4OgesNdvU2f7SyDJqk9HgY3urhQo7aX4qMJFA9cNgmjaPN+EWUOCueQ9lpQi9yRdXulemM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2NqcFFocTh4RURFRWNCWVlFNGF1WlhtVEpWU0FCdExUQUNvQTd6S0Zsa1d3?=
 =?utf-8?B?RjRmeWwvWXoxVkoxbnhGdnNITWlQTkhZWGlGZ2VrS2dSZXpGL29oMjc5OTEz?=
 =?utf-8?B?bkMxUmE4VFl1L242enJTaTdTdktaNXl0L29NWlJqY2pTcm9Xa1hxRWdNNUhw?=
 =?utf-8?B?TjhlcDRZclNhTmRnRnBkNW9jMUFoYkcvQmdPQ1J6cGdISnBoTmYrUS9YalI3?=
 =?utf-8?B?QmNxTDhLUVBrRHJ6dWk1Rjh4ZGp2U25VRmhueGsxeE1ZUzRuNnFibHFFV0Nx?=
 =?utf-8?B?bWxrSkFLZEVCV0pFQ3ZEbEthRlNTay9JNDdXWWdqK1BwRlBvYTNlWitKN1RI?=
 =?utf-8?B?djl5L2tQS2J1YWxUdC8zWnY5cE1oOU92NG8yUjRuSU1zZktpNm5XVVovQktm?=
 =?utf-8?B?emk4MGhUYzgycnRiMzRjeUdvUTFyL2hsT2Jta2ZYaERMRmRZUTNMMmRsdjNt?=
 =?utf-8?B?b0xUK2ExVWZ4M3IrQStjMVdqbTdmaUovMUw4NEZTVE5lUEtGSVNNTDJ2MGpJ?=
 =?utf-8?B?Y3ZiRzd4TTBPNjB5QkVPTG1QM1ExTlMvZ2RYZmE5STdNS3BDN01IVUVSOHYr?=
 =?utf-8?B?ekQ0dWViNUxlSlpkTGRoWXR6RzdjNnZDRlBFaGJPY3JnQU91RmJHYTlteGdL?=
 =?utf-8?B?T1Rma05lR0E2T2QzdU9lZExIdzJaS0hhWEhMQlFwZm1hQ1k1VVpTU2lIVUtU?=
 =?utf-8?B?a2gvemIwc3hkUnI3dnI4UnRGUTRRVk54bnRNUStpQjBzdG9qVkZ1dTU0WVFZ?=
 =?utf-8?B?QlNXMXpESmlGZElJL2RlcEJlZG9VN1NXS0VTLzJ2ZkRsTVFjb0tPMDJFcE9x?=
 =?utf-8?B?UzlCUnlFNDNyMlhjbjdjazZORkUyV1o5cnBuOVdyckRqZUFaTjc5Z0ozZk9O?=
 =?utf-8?B?RkxYVVExa3BDYkl2RjI1S1dueWN4U0MxY1kxQXdxd2JhNlJaa0d5c3dNbm5E?=
 =?utf-8?B?M2g1WktWd08vNjZ1eTVSNXVEL1kxK3EwSlVLVmlVcE04d1ZHOFRoUlJlVzB3?=
 =?utf-8?B?NU5NdDNCVmVpOWwwVHc2RXJ3QWFIQmduMmNRZWlzVnQ1YzYyVXdjMkZScFho?=
 =?utf-8?B?eWN2TEVhZWxueFV2LzkyMi9sN2dCc2FnNHhpQjg3bldzYTcyOWNhYXR4Wm1B?=
 =?utf-8?B?NkZnM1VtVFdoU3VMa2NCUEt4R3dmZUVVRnBNUzhCcklVYXJFSU9HUHZnQjYv?=
 =?utf-8?B?enNHVFZPN3IwY2w2RXhSNzNjMms0Q0k1QjA5bCtoL3BMTXpQMjhWSFVnbXVu?=
 =?utf-8?B?MENaZG1rK3c4bkZyNlY1anUxSUxZSHdnQytPVzdnV1ptaEZiak5KL0E4NFRI?=
 =?utf-8?B?UVE2Vy9keElmQmkvUnFNM0FaRDVaRmtXVGlkczlBVExBczFrNlZiQUtiWXZz?=
 =?utf-8?B?dnBVb0F2bUdvb2k4bDBPL1RXWFNuYTc0Zys1dUFWb2VtYi9FWlZTVUNGSUY5?=
 =?utf-8?B?bFY2STRUMTVyT203bkFEZW1JdFc1K0ZPVkdXU0ZHaDcwSkdYVGUvbFNld2RY?=
 =?utf-8?B?UjJDT3Fldms5eld3YUpESjczWTZxbW5udWk3UmVGeDZza09ZZjFjM0FuWnhE?=
 =?utf-8?B?TVQyNFFzWjlCRDFJd3BONjlKOGx0amVBbFpsN3lGcVJlNDV5YmhBUFR6bkwv?=
 =?utf-8?B?MS8xT3ZjMVFJN1RKQVlkbzRwWFJRcTFGZms1R0RzZUZGcDZWTEJJL2ZFQndq?=
 =?utf-8?B?NVl2a2tkTkovdm55Z1ZydUovUVZsa0llWW5sNkt5OW1hOU9qMTZxL254a3VS?=
 =?utf-8?B?ZDZOSFRYR2dFSTR4bTR2ajZIZ1g5MTJSOHlZQmZlLytneWVpY0tHbXplZXVk?=
 =?utf-8?B?ZndwTVJMczdkOEpDdW9lTnBaYzNUMWJNMHZXYjRtNVN6b2l6YVpsVDhWanFo?=
 =?utf-8?B?WC9xNGZ2S3c3QVMwSXljaE9LNE1XeWUvL1NiK0thVzM5bjV2STR0bWNWQStw?=
 =?utf-8?B?ZHpPWWZ6MFRyZTU3L2VkZDd0YXFIK00wN3RMWTVxU2dCb2dKYmhYaHpWVmhx?=
 =?utf-8?B?MitEOU5jTFZKWCtlZkFKanNocm9CeXBKdWdSeHJUa3poNElMa0Z6cENrQUVT?=
 =?utf-8?B?RjBBVTM2dzdvc0NDMWlOYmtRa05xbjF4dGVpMDFIalFIeEVjdTRyRkdtWVdN?=
 =?utf-8?B?T2hJQzVCdUF4cUdvVXVFTjJIclFvb2JOM1JjU05jQlJMK1pHY2JZdUJ4aG4w?=
 =?utf-8?B?MXpKYzR0bGJSMWJnZHd3bXkyWmZOY1ZhOTdiRjhIUEhPNmJzaDhzZnBtUVcv?=
 =?utf-8?B?RkhoRHZKb3ZGcXJnY3VUZ0JqUXdoemdjQnlxS2RwWU5Udi9PelI4Q1dXekR4?=
 =?utf-8?B?RVFQa090dEZXZ0FRc0ppVFdnNEZuOXg2RGJ1cmhRaXkwRHBwQkhSdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02bfcd0f-4693-48d2-3775-08de7e7cc0bc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 08:12:20.9318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mO4miDfpboY6e+Fu/xOnj9UhDsaVt/py3n+avCtGSi6TrwMVxqGrXVfyC0xoAZIcNxWZ4NmWLWjhn+JK7wSnQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9471
X-Rspamd-Queue-Id: B245224715F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-34382-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

If the chip indicates its "Connection Orientation" standard output control
in STANDARD_OUTPUT_CAPABILITIES register, it can do the thing by
programming CONFIG_STANDARD_OUTPUT register. Due to the optional feature,
the chip which not present this capability currently doesn't have a way to
correctly set the data path. This add the support to set orientation via
a simple GPIO.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 2a951c585e92..079b7d574253 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -7,6 +7,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/i2c.h>
@@ -42,6 +43,7 @@ struct tcpci {
 
 	struct tcpc_dev tcpc;
 	struct tcpci_data *data;
+	struct gpio_desc *orientation_gpio;
 };
 
 struct tcpci_chip {
@@ -328,6 +330,10 @@ static int tcpci_set_orientation(struct tcpc_dev *tcpc,
 		break;
 	}
 
+	if (tcpci->orientation_gpio)
+		gpiod_set_value_cansleep(tcpci->orientation_gpio,
+					 orientation == TYPEC_ORIENTATION_NORMAL ? 0 : 1);
+
 	return regmap_update_bits(tcpci->regmap, TCPC_CONFIG_STD_OUTPUT,
 				  TCPC_CONFIG_STD_OUTPUT_ORIENTATION_MASK, reg);
 }
@@ -903,6 +909,7 @@ EXPORT_SYMBOL_GPL(tcpci_unregister_port);
 static int tcpci_probe(struct i2c_client *client)
 {
 	struct tcpci_chip *chip;
+	struct gpio_desc *orient_gpio = NULL;
 	int err;
 	u16 val = 0;
 
@@ -931,12 +938,23 @@ static int tcpci_probe(struct i2c_client *client)
 	if (err < 0)
 		return err;
 
+	if (err == 0) {
+		orient_gpio = devm_gpiod_get_optional(&client->dev, "orientation",
+						      GPIOD_OUT_LOW);
+		if (IS_ERR(orient_gpio))
+			return dev_err_probe(&client->dev, PTR_ERR(orient_gpio),
+					"unable to acquire orientation gpio\n");
+		err = !!orient_gpio;
+	}
+
 	chip->data.set_orientation = err;
 
 	chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
 	if (IS_ERR(chip->tcpci))
 		return PTR_ERR(chip->tcpci);
 
+	chip->tcpci->orientation_gpio = orient_gpio;
+
 	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
 					_tcpci_irq,
 					IRQF_SHARED | IRQF_ONESHOT,

-- 
2.34.1



Return-Path: <linux-usb+bounces-34850-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cK0UNwzQt2n0VgEAu9opvQ
	(envelope-from <linux-usb+bounces-34850-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 10:40:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA4229729F
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 10:40:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45C50301B157
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 09:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD7138A737;
	Mon, 16 Mar 2026 09:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FCz8TI+V"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012009.outbound.protection.outlook.com [52.101.66.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C00946C;
	Mon, 16 Mar 2026 09:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654018; cv=fail; b=XBQWIan6+LIxJhNvatapoAgzMoaTMR/BTXpy4uuLZowo+qK0qcKRVVXyIL5r+6Dywgrr9NF8QXE3ymXKx6QNxDbXqRdsDJdQ0s7Q1xDxMkfNCClqAep5GHBjMV6Kg4Zlqys/TArqxVRVh7iOb4/kXfCVJDUXk1SEvgnAsbL4FWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654018; c=relaxed/simple;
	bh=8JevPjnGqTev/Oq6ALrQ3WGRHfcd1Xd8gQ3ACcqu80o=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=WHRtcHQ8QX7EbJd0sqfPhdNrZ0OPZli+MtnUymlll7vtwbzGy6XdM27P6ihwX/d6Ut48V6Rdvbd+IUMNGuUGGACl0sPtnfTcSCJedA4Md9oZ1dg+cBalWq9Af/DFwynfgOmV2uWKPQmvn2IVj9jWhb8yGn26qjxESoIyviGUQ38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FCz8TI+V; arc=fail smtp.client-ip=52.101.66.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+EDaRz5CIE5YThiQopxtsSL6Tx+QculQmnownbUxKXAjI3Y0UaClTTYJ7v9/3R+gqq4IRh+IobP2G7Di5b3KURROoOVtYgpOH6Ub3DLN8fA9Fm5yQ93x53hpqjdSXtIYmEVRa/g7d50pQU5iMt1HweMyckf7rA6K0t+pSSFKOL8VNxREBqk5Bt+mqLfFMmxOoupCgGfsoPn58JpEmgmCZuSnx44bkRx8ZsCMRF8lGZV1ERwGOu2vB786fpURzZTvWThHCPIxiSGirS++5gAnUraC/nl6ZLHBoZSmOYBfo2N8BLMtt1NPxUM5rh7LAG2IFUpp7lwH1gZwypugDUuyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HAvfDhX3UZWX1lnNahA6icJCl5vE4pQ+m66cN1VFjU8=;
 b=CDHprpE0QZmBFzutbcXG5ThnY1SFapRTYsHx7WMlt9Zno5s5aUEgpf5ae12khugLeAe9HyapTw4lay8qsl9UG4+rHKR6waSbD9jAWvpXuFgXBaX51sVpI+4EMyxKvWgNUC1QEVLmVtTS2gLezsb6dSvd5Z9NzZXdgClrRXFBrXc8cKTaJia4rC9eD/6iq7HnAJxQiOw7V+f3nflDDUFCcJaxv63E6aTM2e1vRupEqaXDUlGy/rydRIUXV5xkYUM+13Fs0j5dQgPU9Vq0UmdFfTWhFaMbzPALYT6FhR8rJsv8mSGmtw8m/O0o+uJVMEoKJFyLgIBTp7wTswppJVyYIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAvfDhX3UZWX1lnNahA6icJCl5vE4pQ+m66cN1VFjU8=;
 b=FCz8TI+V+rkZWGHXV/XIoCJHlguLzcJlP2ex+FgQn0tSmA0fBpIFeUq8SHTPmp++32LNGCp/b6mf+92PY/jdv9VdRvHsmKQr6f9N/waUWr/MTYjU2KFPgJ9ojHHvixldYsWxM42OaJSuZqUmimkR2ks85Lxw8cBjKJPie5boM3LF30GOzbC1gDVMFMBnA6bX0Z337OGpMD6XBRXC8YaTu4/kOVwOc+5gmd3gxbyOyS3QVkb1LD/ARtWuBWRK6RN69QyuGqY64NlVVL8y26DniF30kALGwre9QYXvDtfIN5LWo/yG/4FIglSkTpXpRvuHbabbKJOjQY1gKExVYmHHwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM9PR04MB8131.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Mon, 16 Mar
 2026 09:40:12 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 09:39:58 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Subject: [PATCH v3 0/2] usb: typec: tcpci: support setting orientation via
 GPIO
Date: Mon, 16 Mar 2026 17:41:54 +0800
Message-Id: <20260316-support-setting-orientation-use-gpio-v3-0-0e6622b00dd9@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGLQt2kC/5WNsQ7CIBRFf6Vh9hl4tE1w8j+MAwJtGQQClNQ0/
 XdpFx11PDe556wkmWhNIpdmJdEUm6x3FfipIWqSbjRgdWWCFHvKGYU0h+BjhmRytm4EX+8uy1x
 /MCcDY7AeOtGiFpI+EA2pqhDNYJcjc7tXnmzKPr6OamH7+megMKCgJWda9Ur3Lbu6JZyVf5JdX
 /BbiT8qsSo7oTrkkoqB4Ue5bdsb8TilOSkBAAA=
X-Change-ID: 20260310-support-setting-orientation-use-gpio-5942d9a0b22e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Li Jun <jun.li@nxp.com>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773654143; l=1134;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=8JevPjnGqTev/Oq6ALrQ3WGRHfcd1Xd8gQ3ACcqu80o=;
 b=htAidZhKgH05Hb9Z7jnQubof+mXs2xOFNw3figz9CcBBjMUtjteH4QcM+kraykXh5o/g3rHmE
 qJive6JkthjCKKsf55UcySzm8CKbENQ9AqOL+ukgiKosUWJ+GWB3OtI
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI2PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:195::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM9PR04MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c5169e0-2680-4d36-ed18-08de833ffced
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Pdx79DtV9lakvPMXxcCmJkDqV3/fJtbuFcDgFw4QLW0WTGu69XuiPxqylCwPEb8PJRU84LYxzfPY68QODlhSGZf3Obm5h43ezjQ895qGfdsNUJ6ZmnqH+jL/wUv9jYp9yloiVoblaViVmTu0YkKb+XmOZJLFM8V3Re+ElptVGAT8DSSXHn/4aT6BVSv7QiE0UY0uk4pIjoFl65n2HVllR6KdEJ3rpsq7sFtS2VvLg8ro3GzCWluwDqHIdffwKHK9WD/hftfLBWGnws82pjiusVHzJlgJl28i/15BATKTjfRfh9QnSjPyyZGLmVdzElBVzgHaL460sklm51f4VQB93MQyizkrHvNgUrUv+gogb2g4whlb6+of9pvQLpVTkCb5T8NdED9cXuV+BNrfSHyobgQsnxPe8U+vvl/FsRkddGadO+Ny449YM2dMbhpWxLU6EsMkZk1YALY0EWkTiJtWSiHjdn8zWi41MZv1WB7woDRi49RKK41OOW8l7r6cKwiPZolilhrDpBuv//iieTjune7tXAXT7WvhuUcYtOsnrtCHm5qRr/FJLlxrSR0SDPRJILADKf6Si32BvxJqpMhC0AhqZtliyghA8+FdH0vqhf8dyd0OaZRttMipFfYqt1bC8H+kbu4X1Yzsogn4oXzC3F7kOTqgQO72Mj0V530hJOYFsxTpdaHbFaQgjDMPTFsFb2ZR+fNYHpGzbNM9MxY2Ygm4f49TFg27z2psCv8Nw43MXeLwOZcVsRQPQBAZm035+DVbZmkGA5u0/X+wWut3wjKoMKIU6mJpwZC/9MV+Um0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFRRV2RZNVZ4RXZrWjQ4ejYySTZuMnFHTXhGd0F2L0VaZDBxVkZDVDMxYXh0?=
 =?utf-8?B?T09BeDV5SGMwVzRONlVWaVJaVXJoTTc5dmdWak9DV3cvYnJvMlBKbEFYNStz?=
 =?utf-8?B?ZFZYOTVzUmdabFhHWlBIN29YY0JCUUpRRTBQU0JQZXhER2lxd240SHgrZHVl?=
 =?utf-8?B?M0VVQkpkdWtrbG5hYk9HaDhUaUxPUlJpM1FwckQ4VythcVB1TzAwbWZNL1gw?=
 =?utf-8?B?aGNTUDk2UStNRFNtOVJXZzJ0c3lScFZnTnFJSFBCeXpDODRJN3psR1hiYlFP?=
 =?utf-8?B?eW1Bam81blo5akxqNTErdTJocXllU0w0WFlKSmJNNUdIYlJxbm1GVEZHcms2?=
 =?utf-8?B?dFIwYjdLdWU2ajZzWGpvYm9HclRQVSs5VEg4T0tEVHpDOTB0MVRXRVNnZ3Bs?=
 =?utf-8?B?M2dqSmY4ZHhTV1d4ci80M1pPcXZVWTZiaEFZc2tabGo4T1FZWWp2SjdtNERI?=
 =?utf-8?B?cEdJQ2FBanN1Q3F4dVYxNnlhZW44MWFsNXlDVi9YUGY1ZmxWdWw0ell0T3pQ?=
 =?utf-8?B?TGFhUXgwYU9Pb2lNUHlpN0JVM2EyWEJkV3haRm5LZWlITno5V0xlWWxLTXEz?=
 =?utf-8?B?ZDhoYStBVWlUNEtzbWQzcWpsbEsySkdIaHhITTBPQitnVkQ4MjJiblY1RTVK?=
 =?utf-8?B?UUtha0tUTWxOUHhsbHFHMHVoTThUWnBvZkw0Sk9wWm43YmtENzMybUUxcEQr?=
 =?utf-8?B?UlVQbVFoYnVQQS9nWXZVRDBSaEtnWjdzbGg4c2ZKZUFjZDV5WWtRcFJLRlhP?=
 =?utf-8?B?ZitKMWxEVzdLK1lVYWJKekxGMXIzblA4Y0hsQjVLejVUcnRPVlEwdFl4WmRt?=
 =?utf-8?B?VXVvcGVwWUNJL1paMzZVWWJUMVFzNUk2dGE5cFFwdDhkK2NWVDgvQitJMWFu?=
 =?utf-8?B?ODlyeVFVOE9kK0oreW45Wk5lNWZmUHBlcElkcGtiTGdYZGNPK2dtZ2I3akdC?=
 =?utf-8?B?TjB6c3phUGprMEp6N3h3YXBNN2o5U0txZVpwN2F4d0p5Znk2QkJyc0xadVNR?=
 =?utf-8?B?UHdzTS9IR1FjNjh0c0hxMkpMaTNLQXQ5ak9BMzM4MDdNVUxwQ0QxUWN4VkdH?=
 =?utf-8?B?QWZoUHJYUTZkVkpRT013emthU3hGQVpEZlNyd2I3WWNoV3JRTnVBdlg0NGFK?=
 =?utf-8?B?d2FzcDlqS091Zy9BMmZuQUhXYXRyWDhubmlZekYvNXMyWlVMUGpMQXJsYjdV?=
 =?utf-8?B?TnYwK0h2U1RReWxCdE84VVE4RTE1QUd6c2NEcmlsS2RvcTNxVFNRNHovUk13?=
 =?utf-8?B?a3N1azI2cjVSRmdDdlpiMUVEWTRuNUk5RVovaXZXak50U2l3Q2o3Q3o2eHI5?=
 =?utf-8?B?eWdUWSswejlwWWoyZEVWRVBtTFhqWFhacDVBUkJmK1U0azVVb3dKbVRaVi9Y?=
 =?utf-8?B?dmFEWk5EcVJ5ZkVvejEwNHVqMDdWTjNDSGF5N0c4aU40a0RURVhrV0FlcFRy?=
 =?utf-8?B?WXJ5WHdHR294OXZnekVmNVlsV3hYcXFkaEJwdEdjanZvb2dkaDlnM1U4eUln?=
 =?utf-8?B?YlU4NE4rOGJXOE5BeXNKQktKRmtPSWVSOGEzd3QyaFVUYVk5NlNqRi9MODRx?=
 =?utf-8?B?Qmt3ZjdZTmd0ejc4SFVuOVk5MU0yMlk1ajVkb2VhSy9PTEEra2J6TlhsRmdt?=
 =?utf-8?B?ODNTTFNwckdCQzBHS3pBVzlUSmMwUjJzNnVBVEFiREFqMGNyRFRLdDEzTE5P?=
 =?utf-8?B?ZFBZSVQyVWY3YzhXeDFnckcxRncrMlhYdFRiTnYxZFNrOUJDVGcxOU13SU5z?=
 =?utf-8?B?VUcrMkQrdHpGSkYxMzRmd1JJVHB4NTd0NFl6ME03RCswYXA1UmtCekpKTGpw?=
 =?utf-8?B?VXNXWk1nVlBvVTcvMndFYjh2bjR5RzVxcWpQVzBLaUFIVmQ5Y1VVdEhkL3dN?=
 =?utf-8?B?YnQreDB4S0VKSW5xbmJaemprVWJZTEt6VVFxUVZTSkZPSm9wMUhncWFpRkda?=
 =?utf-8?B?TDBZOU1wR0Q4bGtNdllpYVVFeXR6Z3ZmYVprMDdtamVKUFRCTFF3MHZ4VHRT?=
 =?utf-8?B?aVZqUG1VUGRsSWdYTytmcVZRK1gxMEx0SnlMakJHVk5Md1JzRzJxQ1J0RWYw?=
 =?utf-8?B?dHBoSGdJNXZqVlg4V1pDalFjY3J4eFNPWGFOeG8rbnlBTmNaNkpTVEMzMFE4?=
 =?utf-8?B?UEJzVEJsR013YWZQbGRwaEtSYVlFdlU5MU1ja0ptZkJoQ1lkRk9TZk9aTWhM?=
 =?utf-8?B?eWV2QWNPWU5YNVNVOFJoKzJLWW1RNnNlUzhpRXNQSDcvcXU1Z3l6UDNlNHZv?=
 =?utf-8?B?dTFRWnVydklmVlIyQSs0ZTMranBmbTdVZGNaNFFBL3p6clNMUXhKamlZK3NJ?=
 =?utf-8?B?NVRsNmlZL05RUVJxd3RQK25IeUhsNlo3VE1hY2pIM0ZRaGRWdXVXUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c5169e0-2680-4d36-ed18-08de833ffced
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 09:39:58.3842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fd7f6gyWRvLlqh6qcueoLvbBSpJe5saY2lahNbi8Cd3JO9GrNBE7n9P9BVKOZtcZYJ6JmKT2PB6fCHqnz7GtMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8131
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-34850-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 5EA4229729F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patchset will add support to set orientation via a simple GPIO in
case the tcpci compatible chip doesn't present "Connection Orientation"
standard output capability.

---
Changes in v3:
- use "err = !!orient_gpio"
- Link to v2: https://lore.kernel.org/r/20260312-support-setting-orientation-use-gpio-v2-0-59c523a09f12@nxp.com

Changes in v2:
- rename the property as orientation-gpios
- add maxItems to the property and modify description
- improve tcpci_set_orientation()
- Link to v1: https://lore.kernel.org/r/20260310-support-setting-orientation-use-gpio-v1-0-da31dc6cd641@nxp.com

---
Xu Yang (2):
      dt-bindings: usb: nxp,ptn5110: add optional orientation-gpios property
      usb: typec: tcpci: support setting orientation via GPIO

 Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml |  4 ++++
 drivers/usb/typec/tcpm/tcpci.c                         | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)
---
base-commit: 322a81d35ecdf9997c3bbf676e3547d75f38935a
change-id: 20260310-support-setting-orientation-use-gpio-5942d9a0b22e

Best regards,
-- 
Xu Yang <xu.yang_2@nxp.com>



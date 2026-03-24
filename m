Return-Path: <linux-usb+bounces-35358-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yI/mIG0KwmmOZAQAu9opvQ
	(envelope-from <linux-usb+bounces-35358-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 04:52:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4CF301DD3
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 04:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A2F23300D550
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 03:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82EC23A255F;
	Tue, 24 Mar 2026 03:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="JTi3v/Rq"
X-Original-To: linux-usb@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012004.outbound.protection.outlook.com [40.107.75.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C375C37CD5D;
	Tue, 24 Mar 2026 03:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774324272; cv=fail; b=IHguGZGCWF+s5xxHeEOT6aV6dDfzfvBluHY4NzftAqWoqRTfpZ79lxChnEQARzyqQvD/uZ6eybnxAPCmxoyWOBW7wQ01tSfMOyFYZUu59X7uaazuwBfqq0rEwyHGdwk/xfPQCJISHL1ZvbIjrqKjZM9nFkr6FO8TTbUoE4zNwYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774324272; c=relaxed/simple;
	bh=owClyWCPqiFNAkLiN4l6qENu23w/Ey5bqfOrbTRNDzc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CMvq5nNXlxwcRg1OpCTz4YOEST1MLvo4FOWpunxegmE1MwuYCxTZkydoDEF/RaGP8i8HPCS4dXW1k3DD0vBxXyWWhhPC8cTHWofwuDFc6VwUMAwQUk2XJOBI5vifk8U/Z1Z/epToEDwwvQxAd/YJ67sFYbwRWUDjAMLMAwkljbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=JTi3v/Rq; arc=fail smtp.client-ip=40.107.75.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=toKCsYPcHcPFF2R2IIMIKAZx1jAguID+SxSHegKqibcrW1rdHOG89EIEvr2nBaWqtcoTCO2VpVOmtN+HsPw0z9mB1j5/mdHtgnXGU0ETA+J6u+a/I/anp0zvJGQ/hwmU0b+7VbCyHfSfIlm+dFaGRJearGyS2/U8WkMUnwk3yIrzSsi3VDrzuyZZ9vhz4rVUyClm6mqidD9EZjqBNDE9LZqWb/V5iYoAcYmDVmswBUo2Za96/VqwpDFGbn3z8CnhXZYTiSApVscArMcj39Y8q5Mq8K079gPlKgvoQ/uzXWt4slH6xt2vzdzYS31mRxcJK0YQJ0qKrgMhnEqjbH2Uug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSVeC5/Wwu4GoNiledJRBcljkOOmAPV2euB/2px9Lig=;
 b=tFK8NUiHO+DWXu9gtzSS+uMQDxytQTBnespWCOMUTB/NFlmcmNd/FI8tLl98GQy0JBCrPxp3pTu2IP8sZyDGRAGsGMjIhVtx4J+tX/ev8mpRHp0iMu+vZAZ453R6Z7LRi8InAlcJE56nw9IwpxL24xWfqopInpuXDSRS9rNI+KI6BmLeD6IY3i3Te6o3Wqw+CMCNoXPOGONWI6NkpNM2He2FMylzXL29HVnYQIXIDjMC+1NK/KGRDIc11Vl6reM0NMGW6MSX5TwdEgmPbEieSu6d2wtS5lDq6dMAXpQntv1v0QG+lTEpbaAlgJw8TjDKF5v0kRUV0uZ4AC7t//LpWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSVeC5/Wwu4GoNiledJRBcljkOOmAPV2euB/2px9Lig=;
 b=JTi3v/Rqc/DVHm2RgaWozpo+nNQHlUcnSoM/1frIjhRmOM8Um31iHtVI7Q1WsRpylsL9bjavu/PGi4+TYES456SsUoKqJLm3TUvXqIrL/BfybO/qnykIpf5C7dBmPy5YBI3oIuLhQfyoHuyTjXaG+SC1KOP1ZgaVL4e10nUdU5g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by TY0PR0101MB4844.apcprd01.prod.exchangelabs.com
 (2603:1096:400:275::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 03:50:55 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.20.9723.018; Tue, 24 Mar 2026
 03:51:07 +0000
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Crescent Hsieh <crescentcy.hsieh@moxa.com>
Subject: [PATCH v1 0/4] usb: serial: mxuport: extend MXU50U support and runtime controls
Date: Tue, 24 Mar 2026 11:50:37 +0800
Message-ID: <20260324035041.352190-1-crescentcy.hsieh@moxa.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0023.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::7)
 To PUZPR01MB5405.apcprd01.prod.exchangelabs.com (2603:1096:301:115::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|TY0PR0101MB4844:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f70bf86-77cf-4b02-4906-08de89589436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ID65YyR7yu+liRKNAHul2FcO1roIAwo9bl7Idp7MCHVBBwuLNJHow3D/ELry/B4GQHFVWtx1rAbt/WbpfRi1MjfQxxdrrR0wVrVF3gu1aQfKQ9dg7zFEjXXuPkXh7Pe0hGJ94OuJXFgi0gO+35/dnXQ22BA2qb7kxpcqceXARyOYnNjXNyJqFcJSBk4IhsgpuFfFQ07QeXJJYwxq65CzjFRP4LOfxQQrEKAX0yOcIziohDdLt8lBmiHz2MEcqgKZO8McuBnrUQGZroEwjaGE4ue1fOEEde/wq6UaRExy+8wc08twqplIuqXKZyE3eHfTiCroCSmupGedzRaN6vDF/I+J9XYD7JNn+G4+yKAtt31mh1I3nBU4h5wSzQjqNTxJJvJ4DPHc6BVJZwVdjolSz6igg+obnT/V3JIKdhYCP2OXi4oLfylQjK+ovflcickc+1oXGTmMzuKoWXWYpQPJNLIaPm1zyC6aziTXm5lniMDw9BbSqEq9pc+yc1yWFwzFK76H93ZIM0TicacOHilzvihFl1+XUhwNNe29iIiFQ5HEerSELuAA2LuKK4U1ybM+S9ZSYf1rD54zg9cH+Y17X4X5/B7aYmttqRvLIklUNh26+Lk2mlKJltVgDOM0g0ZcvLvhjiwP+gpR+GsUXTa6bwWgcxnSz9P8A2AdJmQBq6zME0j8bom/h9DHE9ROLHu94AQteizgDoq3VsZlfZHK21n+OarB/SVsawd6AJBU/bcruqZRsGdLf4Yag6ONT3DqsL/XzVzm6S+pOPA5BsW7SwpiJvvh0msXBB9IpNo1km0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O4QZhd5q9SiV66f0RpQgRC69U9RM7xXIIx+cRQPKeLuogtA3TbG8QP/lNOkA?=
 =?us-ascii?Q?CO73cQQLoTOYGmNr6uvCcfaNie3FdDukb4X7B7viRMtVKNcKk5HCYOsAULB5?=
 =?us-ascii?Q?px57NYCNdEq/vHvKUWR8UAyqk8j65sKqjsJuWGB3ke6ZoWDHZYhnoS0QL3jH?=
 =?us-ascii?Q?mvKJ5WUME7xy9dYdybN3yJget39l+r52QGwb6LbndvdBxKnTfG64wxtw9UY0?=
 =?us-ascii?Q?XH1uk3jT2uUJQB6rDj4BQO7HcztkoNXu4eBnhK29zZLpfzykRzz10nKP4vVg?=
 =?us-ascii?Q?xqsMjkOlCrTBjnBzZTCMACRdUpfkUaN46UwJvmYmDBjIn8oWPcrEN0LPNZrE?=
 =?us-ascii?Q?di7gA2Vh61N6n+v0PwIWiT1bw89RNUV6xxyBm/F4AYDLWxaZQKJyPA0UlGC5?=
 =?us-ascii?Q?IhP11LaZkZpisMSopAz+XzEH1VhRtQ4OtXBLFo3aCX5BAyneiWhuKQ7saGJS?=
 =?us-ascii?Q?2sbSul2frgHiw8jLRSlecKetS9qnjkWcaGTpw73pR8Pu0Kqfqt3UFzIz7L2J?=
 =?us-ascii?Q?TP5gcta8Uwgcxx5m/38VuzpEwQ+xJ2zz4LMyPZON3FXvz9Lo2K7giDSZxWLr?=
 =?us-ascii?Q?AkINsOJ5D/M9kx7i33hxsRDBY4+QxrVI4Ei0DiSonlbyaXpv56RNJ0GAKk57?=
 =?us-ascii?Q?eqDmwNPaBXJyLqzo+chyas3qNtPQhg+wVuuQTx1SMweFu2OE/GkRew2lja8M?=
 =?us-ascii?Q?mZcnoR+8MMZUCXP2gdAJJTrst8lHlfgAx96Q0KIjBKPHc1DPpRE9h5mdERdi?=
 =?us-ascii?Q?W2dl9D874ojOzSkj9OQg5Q+P8UeyCK+7hAyzc+TmpdD2ScovbLFw7a/voEb5?=
 =?us-ascii?Q?kbq6lYz+Gg4YjU4AM8YFUf6QAN5XWfz+3Z33P9Q5yEwbiiZMNctXaROCp08P?=
 =?us-ascii?Q?2Ffw6x70z7dal1mo7RjiDPapGFRtOyzsANYd80cWHc/lPEEF6/enPuIYfJ7f?=
 =?us-ascii?Q?ZDSRwkTzCzXbjmltMN7KXVg9jHd1RNPYwCdk0V5UxSfQHeEJiDHgz86jU3Gl?=
 =?us-ascii?Q?ig9C3/QCozNnEO6FRg8tkf1OlQ/18hcsBcw90dIkFMmzi7+A1gpDKIiOIx4B?=
 =?us-ascii?Q?aYZk5x9cjYQ1xw2w7itfw/zfh9iATWroq7gb9GGVdk96nk71aXgnSoxi6U16?=
 =?us-ascii?Q?CWzKanU98W3Z2I3tSWyY7uYMH72CR9VhdFxchDjGaOCjRskEwivhzADQjs0r?=
 =?us-ascii?Q?gY/KRTpve5KUMSRmbxTxwZrNMuix5gNFUX3NZ44YXZawMfwETAEVfo1khjLS?=
 =?us-ascii?Q?panFJM3Uof7kw5m5+TmcmIxmU3p1Q1tUKjo9cVeeYwjEJ55Fizvu/PgNeqmj?=
 =?us-ascii?Q?3WpEeJV7ujxWtEUsBSnluoSXkM8nj8rI50OifigCyvzPwRt3PzkWJiJ80g2f?=
 =?us-ascii?Q?1Eg8206/EDoS8tz0oA1LbOVWfiiFPXVGMqqpdgzAohcnr1kg+ZGkgEzoiyrK?=
 =?us-ascii?Q?fIKPWcY3rlClzgxKj/NBjBu/+76XQ8Oxd8KyffL4YPajI5QKBpPyg5dzkxj5?=
 =?us-ascii?Q?wQk9P0/6q0B9EO32LjiqpP/TYxb71J9DMqew4obWIVki7fcuN48z5h2r2BvD?=
 =?us-ascii?Q?sQTX5e3Zl/AalX09J//y4h8aDNZwdcLmdQZ4EKOEWYzkjMze9i3Zr2ibWlD3?=
 =?us-ascii?Q?/5LJTorQvf5AyOO94TBZWSrQLLGGcyxef7GeyDBUpog2xmB5mq6IV8oMiLds?=
 =?us-ascii?Q?ItXrDOyxSdPS8xH2xNMkG91LkxDWiAdRLkIJhKMFaqi0u76VxqEuzUf7VANM?=
 =?us-ascii?Q?jNh0mwqRRL3r8Ahf7/SIP+ieATcPDsQ=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f70bf86-77cf-4b02-4906-08de89589436
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 03:51:07.2754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Waf03lXv95DUUWHu1olzWDDa9cf/nHt/dFOT71ESz6GKBO+JzMUb4weG1oInkquL7BaOrxH1JLoPJjOIFqO7uoa7PUDlJxq7yRm9EV+yfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR0101MB4844
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[moxa.com,quarantine];
	R_DKIM_ALLOW(-0.20)[moxa.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35358-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[crescentcy.hsieh@moxa.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[moxa.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,moxa.com:dkim,moxa.com:mid]
X-Rspamd-Queue-Id: 8A4CF301DD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series extends the mxuport driver for additional MXU50U-based devices
and adds runtime configuration support for interface mode and UART FIFO
control.

The first patch adds support for additional 3-, 5-, 6-, and 7-port MXU50U
devices and updates the firmware selection logic accordingly.

The second patch implements TX flow control based on the device SEND_NEXT
event so the driver stops queueing bulk-out data once the device buffer is
full and resumes when the device is ready again.

The third patch adds serial interface mode configuration through
TIOCSRS485/TIOCGRS485, allowing userspace to switch between RS232, RS422,
2-wire RS485, and 4-wire RS485 modes.

The final patch adds a per-port sysfs attribute for controlling the UART
FIFO state at runtime.

Together these changes improve hardware coverage and expose the runtime
controls supported by the device firmware.

Crescent Hsieh (4):
  usb: serial: mxuport: add support for more MXU50U UART devices
  usb: serial: mxuport: handle SEND_NEXT tx flow control
  usb: serial: mxuport: support serial interface mode configuration
  usb: serial: mxuport: add sysfs control for UART FIFO

 drivers/usb/serial/mxuport.c | 319 +++++++++++++++++++++++++++++++++--
 1 file changed, 305 insertions(+), 14 deletions(-)

-- 
2.43.0


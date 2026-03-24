Return-Path: <linux-usb+bounces-35362-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kO6dJGMLwmmOZAQAu9opvQ
	(envelope-from <linux-usb+bounces-35362-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 04:56:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA862301E4C
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 04:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1A0B313C226
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 03:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F563A2566;
	Tue, 24 Mar 2026 03:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="fPDB4kXU"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013050.outbound.protection.outlook.com [52.101.127.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AF13A256C;
	Tue, 24 Mar 2026 03:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774324300; cv=fail; b=ApiBUNRfrxE+qJSmo24iWNQ1WIIwerEAiEWtJl5Icmn8ksameVNRtFxYWbiHH20louLZIiK/xevb6cm/smaeGCHoSjcsDVqRe0SZkZhpwo4QeS/Jtggquyj8cKejd1sbJ0HLno54Vm7JqIDEGAJvos1aM+G9iMbpmqFouuBYYg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774324300; c=relaxed/simple;
	bh=UNwJQJ8CiBvgl6LPs9rD5KFtOezLWp6yxfSx82+GJK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rT7CCYcgSDE1MT7DwEAeBU93y947Xz0MCpDmc8YiDer5sa8hPCBGZSVfWDlOPKLzAMt8ekvKzXE9GV83Mx46xiY1q7yw6Bpdr47m1OEP9bY692pbk+0Tly3kRP0FnP1H7K0NQowlItCzMlwALJT3TyciILuSJibgnrs4OlZOUNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=fPDB4kXU; arc=fail smtp.client-ip=52.101.127.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DSuk3KKtLIruZ37zLhuQ3tbZPWqxt7aZJPauRQnhSV6B3XLTNV+dpLSdPEOeDB+9ohJAzIgrufuLiTdL8YBuGvZpOnZHfSYZ8tVE0xu4nN4I+LXtU9R1yDp3CN/IAmEmegRlIlsn3trSKgvpiHAI6qFeAenhDjDBBQLG9OT/DETtrTRPD5Ja6z6CmjWtVbg0Imcsh6ANmg9k3kEPg/mW1kV6DdN+Dug28KS4xeF0ilsYzWWXXmJlxa2QMp9p8OZDvxOU0ZFVD74dVTaN15kob/9BrPJbfktHdzYVth/wHWcg3qzBml7B8p5XJsK54QdybcJvXDL6mNlpzhYn7/LtHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmmXVStQEAbSs1RbYxlmBIxmD4cMQKNbpNNDaIAzv78=;
 b=nCaayVsPxpnavbZNpKDKQVsjiX6NFTyi0qvgaHQ2Pg8WTJwm7VdRQ0gmeGQzbsTt4/Urp1IOGp+Nv7dnxQU14X8Hc3zGHw1+qMTCzGo9FYJHl8NbKNCTbGh0s6FHJkaJlEvbUWGSlces9uBU8XjmVa07NR4hB1ApxfSoWI3ec+r8MUjTzNsy/J8AXU+BAMhYzykzCBF786XECYAm4YVYj5k3q8Y4n3TuV7PZoqlZsuv3JN2TT1wWD7Rg9Pf+4zoYMgAunoyVhBypKjubybBdLI5UQ5s800LpXkgJDnXvej/hmtZdcVqaE9TbuLDm/UPkOaUpqfQ54umGZzKJ+6R8HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmmXVStQEAbSs1RbYxlmBIxmD4cMQKNbpNNDaIAzv78=;
 b=fPDB4kXU+KRrSRDibuXIPWJSvf+EnBA8IMCzDMAAVX88idp5/BR0ikkFjMRG8fYMc+3R+i76AZBawGsMMPDd3DX1CiFQYWaKbCMRLhZ2O9V03hIzcws4bdytMJyqv1qLCV7X1Zz7dO8Na+XgYkuRu4mhYPeZT3O1c4ENBUyDgIQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by KL1PR01MB5323.apcprd01.prod.exchangelabs.com
 (2603:1096:820:d2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 03:51:08 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.20.9723.018; Tue, 24 Mar 2026
 03:51:36 +0000
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Crescent Hsieh <crescentcy.hsieh@moxa.com>
Subject: [PATCH v1 4/4] usb: serial: mxuport: add sysfs control for UART FIFO
Date: Tue, 24 Mar 2026 11:50:41 +0800
Message-ID: <20260324035041.352190-5-crescentcy.hsieh@moxa.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324035041.352190-1-crescentcy.hsieh@moxa.com>
References: <20260324035041.352190-1-crescentcy.hsieh@moxa.com>
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
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|KL1PR01MB5323:EE_
X-MS-Office365-Filtering-Correlation-Id: 55329a1f-0ca0-4e5a-bf9f-08de8958a5a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|22082099003|56012099003|18092099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	xbqkRQuvgfJzLrNZ/GyzgqgwqDw5zhZEywPRRH5Wh7nDmXDo3G2NEwxd9Dvbdg9w2Yh9igKBftb1VqcX3vnJrBE7mrT9th044AHtLrPp8N+B4galVxWOB1Vs/M3kwxAeAw+Crrd53bWjj1Rs6rVFpDlg8H5ZeQiZ93UnsCT9m0BmF6ugQQK3ObriTv1L6jhFQyVicuZkxlhy0Zw08iFTTa15+1BVw/yC0wmly5KThzTZAOJacRfQtrM89ROHrUmxf9KJK1VtN1TluaYXe0V9nbRXHkKK50ZASen3uuAIGH0C5CAdC2YgnUn9AKI5vi6YuIMRgGvHt//ElK4/vRHCjOUPbP5o76/5IY7RdSCphqO5GpWsaN9wMtpfNSmbOKIZlxWX7z7XYqN/CJKuod9dvHxYpNZzBPriyOhxDw2ZZpoR7MNHdoXxWZSB4KwnXgzSzW2+/ldBM/eXb6JR+8xBhloXdPFUnYRQjAUvkyJyiXM1J6TdXSbWm3Eiu/c8PiFeB1g3WgCJihwvSgjQZIfJDdcQzi7Jpar91SEigvvSm4Y04fqblsAjZAkyLscSpZsmBS0257WhVGElgptEME5gvbbHjXZYfCY6H6V+Hx6Isj30RQq+FB7MHR3o/YE6F/wwYlYeWL3ppEwQI0ll+0zT7Zrsrz+uCJ/eUig29/j33WGcFNiyJldOqnu+DMrR8LwaVxP8KBbYPOYiEKZjmCHY70IIwuisbfBFvPbuQ/Q1QPTq8TbfwTGJcNTCKWu6iiVFaXmdTDBrucUfXDiM2xQJJYAoLcOAdRUDj/LFXE7rv+w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(22082099003)(56012099003)(18092099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AAbOQhvuh5OVijF2mKIFk/Vsq1IRbCD/n2OREsMZR6mEpBCRZ+SY269rZ4W0?=
 =?us-ascii?Q?fx0fUuZsudSilJ7O5nYqiO+4a2xaazP1gZdpsZObk3xPOnoVdgjT2dq8UcXF?=
 =?us-ascii?Q?xPalL6Hkvg6WyslhM5JlqL0UAWnmbvFwNEBFHlxJJs1pCnOrSic+XsP7CzSh?=
 =?us-ascii?Q?uZXO/QFMJ/TYs3Ek7keUNaQkQHN1uP85goTXbr4rkn7yKotuKxwkCucEMlxz?=
 =?us-ascii?Q?JkgpysDejYxDZE5UwX5U7ThxTnaRL4ioouBpocMJOZF10KU9nPfNdS/ktqOi?=
 =?us-ascii?Q?2lUixyU/g/m7Er+dKTFgnwy/4eYRxsZemjMAMlEKUB6Pq/cZV7I9uZPVdDWc?=
 =?us-ascii?Q?M27ctKYC28z3NlZ/ZRIjNMLSFpiRbBhHmjvG5mQ6PGyigj/UGoro9pGe76ep?=
 =?us-ascii?Q?a9ksU4CU5JFnBJsBKrl+IpMUZwPxA0pKMmqyDiwLkKioez34ScSdSqHiASMf?=
 =?us-ascii?Q?yTx3sJJX9fJ/+65ng+hB3BPAbsxL+CSXnuoGWpXnJsEVoys+O4kibdnaVxOd?=
 =?us-ascii?Q?Y9IvxqqQSTeGE8hsNGCl6FqdciwaVRAvdxcL4aKROJvcitdJzMukUVGLDitC?=
 =?us-ascii?Q?zopkRXnwmpbZJoMZhUjtFGJUzOKL0Eey1pzd5cmKGmijyEF+HrKXeVmbe1xU?=
 =?us-ascii?Q?M/fcLd65/IcXS+qUvsmmHlhOY0nmHMxI9kOgqIBenDDjV2J521ntv6G6XkTg?=
 =?us-ascii?Q?mX/cT1o1JC12Y0Rb0OIqv+fktyRD0mMKXqumM/f4QTmucTHrGbz3bNGBnf6F?=
 =?us-ascii?Q?HKi4nq7YOo3VNoR3RB7miL6r8D32he6BGez+3CvQtMYFA+DNmUp5fkGGO4FH?=
 =?us-ascii?Q?Go0hm4GuDM0OOJECHTuS0XN/W4mfsNFFSK4qOx1Ag2DrY+Z5FUAop1OiDruK?=
 =?us-ascii?Q?S2CldsMBqQsS9hkbfiPxPZ1TF0Q+nC/6GNaDXlXgTqOBIEq4ytb+bktc68zU?=
 =?us-ascii?Q?yXCDMzAzPGHPuJNQP9FJKO8QgNuDVgVAHyTta+a8DtMCx9vM9Nvc6zeFpOf1?=
 =?us-ascii?Q?OjZdHGr8sI2mCMG5iJJvUuJp6krOXwkTE1VZqVcvW3vXBkzoRswCwRxY/k1K?=
 =?us-ascii?Q?1orWoHQWVt9g415AQRO1Gz54skQ1hGBi7lPKZVqLh3ByL6fXn0Cm2EvATxFh?=
 =?us-ascii?Q?zox2ERt7ZgTFEmqs3UIGm+6JikV0zw/lC/ihmza2hS2LRNucXRaTVEeRTxZn?=
 =?us-ascii?Q?A806EZ6BjXd8qyWJMqE2yG5BLM5Lx3uTvdRGB/HnWTV8ezLkYpXIMP2FBQdG?=
 =?us-ascii?Q?/POENhnMtTFpZ9QPiVe4sEr5pwcLuVt9q1021PdHdojENl7fy84oTfHLzCx7?=
 =?us-ascii?Q?oNTJMPKQhenKY1FTeg4fWafLcOvr2R8SB/MIGqNFNS2nLweYdfoQDCZAoFjZ?=
 =?us-ascii?Q?jEgpITZx3qhEy9tt8QmjwAvwjpLTtkJTZS3fYdoR6ZaNTepFsC70srOS39KI?=
 =?us-ascii?Q?f2LJFcGjn47pBFQx560cUkrCUXgeWZlNQ1hXj3X//LL/K+cJ8329ThTNTOa0?=
 =?us-ascii?Q?w12pvZVRTWi+qDLQ7riwTjKqoirJyYQGrJ9ZB/nxUckvtpwW8Up5amAZAHKM?=
 =?us-ascii?Q?DvjW/JrMtUagXvkzW71roy2bvzU3/RvSmAxrr3sHHk6ES7Q+TGh1/czGyoIj?=
 =?us-ascii?Q?/WPcwf7rIurE/alXLTon8rd32ozMNF7fiBzGYWo6JqjGNg0A3SLvJMomLHAm?=
 =?us-ascii?Q?xDb0Ku/kFr8C2/5lsyig0Aj9bOzCUxaIL3QiZEw3zzMSz7IRSe/VvTUKKA1k?=
 =?us-ascii?Q?d/8/poLoywOU5YPvl+QbSQwYZ5vgE/s=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55329a1f-0ca0-4e5a-bf9f-08de8958a5a0
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 03:51:36.3486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pk02/6igB4EUsSqHWZgF+7+iQcZm/eT12HU6hEEIJ8e4m8wtrHwRO/ToX6ytT/jF46NbeTMrGO706LsUmzDYC8GsIi0Pai4QVqY8RRU+B0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR01MB5323
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[moxa.com,quarantine];
	R_DKIM_ALLOW(-0.20)[moxa.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35362-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[moxa.com:dkim,moxa.com:email,moxa.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EA862301E4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a per-port sysfs attribute, uart_fifo, to allow userspace to enable
or disable the UART FIFO at runtime.

Map the requested state to the RQ_VENDOR_SET_FIFO_DISABLE vendor command
and track the current FIFO setting in the per-port private data.

Initialize the FIFO state during port probe and remove the sysfs
attribute when the port is released.

Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>
---
 drivers/usb/serial/mxuport.c | 75 ++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
index 9a8bb4f02da3..24b86d1a31d4 100644
--- a/drivers/usb/serial/mxuport.c
+++ b/drivers/usb/serial/mxuport.c
@@ -183,6 +183,7 @@ struct mxuport_port {
 	u32 hold_reason;
 	u8 mcr_state;		/* Last MCR state */
 	u8 msr_state;		/* Last MSR state */
+	bool fifo_enabled;
 	struct serial_rs485 rs485;
 	struct mutex mutex;	/* Protects mcr_state */
 	spinlock_t spinlock;	/* Protects msr_state */
@@ -1242,6 +1243,68 @@ static int mxuport_probe(struct usb_serial *serial,
 	return err;
 }
 
+static ssize_t uart_fifo_show(struct device *dev, struct device_attribute *attr,
+			      char *buf)
+{
+	struct usb_serial_port *port = to_usb_serial_port(dev);
+	struct mxuport_port *mxport = usb_get_serial_port_data(port);
+
+	if (mxport->fifo_enabled)
+		return sysfs_emit(buf, "enabled\n");
+
+	return sysfs_emit(buf, "disabled\n");
+}
+
+static ssize_t uart_fifo_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t count)
+{
+	struct usb_serial_port *port = to_usb_serial_port(dev);
+	struct mxuport_port *mxport = usb_get_serial_port_data(port);
+	struct usb_serial *serial = port->serial;
+	bool state;
+	int ret;
+
+	if (!count)
+		return -EINVAL;
+
+	ret = kstrtobool(buf, &state);
+	if (ret < 0)
+		return ret;
+
+	if (state == 1) {
+		ret = mxuport_send_ctrl_urb(serial, RQ_VENDOR_SET_FIFO_DISABLE,
+					    0, port->port_number);
+		if (ret)
+			return ret;
+
+		mxport->fifo_enabled = true;
+	} else if (state == 0) {
+		ret = mxuport_send_ctrl_urb(serial, RQ_VENDOR_SET_FIFO_DISABLE,
+					    1, port->port_number);
+		if (ret)
+			return ret;
+
+		mxport->fifo_enabled = false;
+	} else {
+		return -EINVAL;
+	}
+
+	return count;
+}
+static DEVICE_ATTR_RW(uart_fifo);
+
+static int mxuport_create_sysfs_attrs(struct usb_serial_port *port)
+{
+	return device_create_file(&port->dev, &dev_attr_uart_fifo);
+}
+
+static int mxuport_remove_sysfs_attrs(struct usb_serial_port *port)
+{
+	device_remove_file(&port->dev, &dev_attr_uart_fifo);
+
+	return 0;
+}
 
 static int mxuport_port_probe(struct usb_serial_port *port)
 {
@@ -1266,18 +1329,29 @@ static int mxuport_port_probe(struct usb_serial_port *port)
 	if (err)
 		return err;
 
+	mxport->fifo_enabled = true;
+
 	/* Set transmission mode (Hi-Performance) */
 	err = mxuport_send_ctrl_urb(serial, RQ_VENDOR_SET_HIGH_PERFOR,
 				    0, port->port_number);
 	if (err)
 		return err;
 
+	err = mxuport_create_sysfs_attrs(port);
+	if (err)
+		return err;
+
 	/* Set interface (RS-232) */
 	return mxuport_send_ctrl_urb(serial, RQ_VENDOR_SET_INTERFACE,
 				     MX_INT_RS232,
 				     port->port_number);
 }
 
+static void mxuport_port_remove(struct usb_serial_port *port)
+{
+	mxuport_remove_sysfs_attrs(port);
+}
+
 static int mxuport_attach(struct usb_serial *serial)
 {
 	struct usb_serial_port *port0 = serial->port[0];
@@ -1501,6 +1575,7 @@ static struct usb_serial_driver mxuport_device = {
 	.num_bulk_out		= 1,
 	.probe			= mxuport_probe,
 	.port_probe		= mxuport_port_probe,
+	.port_remove		= mxuport_port_remove,
 	.attach			= mxuport_attach,
 	.release		= mxuport_release,
 	.calc_num_ports		= mxuport_calc_num_ports,
-- 
2.43.0



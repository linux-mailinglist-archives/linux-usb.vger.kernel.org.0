Return-Path: <linux-usb+bounces-35361-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKXBLzwLwmmOZAQAu9opvQ
	(envelope-from <linux-usb+bounces-35361-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 04:55:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A317301E37
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 04:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97C5E3131B85
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 03:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F013A3803;
	Tue, 24 Mar 2026 03:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="Zh27qy78"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012022.outbound.protection.outlook.com [52.101.126.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC7C3A1D02;
	Tue, 24 Mar 2026 03:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774324293; cv=fail; b=HBz+lYblurzppfcNHyTJxmrcK0b2328dUsGD9PPYPng6V2lDseO2rS1IX8ZJIrw1x0iGr5ispr1oA5zkO9UQKuHU3sLuDfLE9Wo4KT1XgVBU/lgrKrFVt064qG8HejQAlSKPSe29c3zR+jc0yympBARfrwWLqDzjr9YZEONjKjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774324293; c=relaxed/simple;
	bh=tH+iXs8NSBMtleqRJjNWX0PSlg5sao7AvpDgdeIJR38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G7v8iT5eZb5kV+NwHSQkC4lgPeWHIPuhHgbFnMUDEweq5eHqO2kncOUhYEVc8gyUhUqzXdK8hyhSGrFk251TSdZyclnqAfUxiUTZ5nf7aSc0xiLjZBcSCciBNUXGmOyGqbzQnThowKd9KlxP3+cuwcx6ZqQUdoFHC5wNn9RHxng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=Zh27qy78; arc=fail smtp.client-ip=52.101.126.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0vfBSUhXarnfxkFSfikXeuoW5c7wJvIY+OQZ38NoCktGhX0Q5DdDbaRa6MYk2enesJDKrRXw5NHSt67kqY4HFoidX0xc0sgMl4xtx/m/4q9v8PaPyKCG3FZAhhk56mFTnqSKFeMWXcwmXT1VY7pGJMEvy2uh8hLRpOU9lmhJ9HxzAXVQklvnxIgyupboa+SukL0IigK8oo4hc9RdkrCASEkmEk4ugEliyVddWMROefG37bWrlmbnyyz6oSIRTVvNt3HZhPJH1RhNzEtfhzw7qbz8xXJmBJkxA28cEgKHOGCE3gJMc3vlksMS28FZEQIWkjafArC9L3ULUQyQoCtGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m12oXJTDdhr0xx2a8llJiuAkple/3mPJux5zm1WOubE=;
 b=SqGxnydghDk5gqJJD+Gpkt0z70toUZGG+dlSOt+6pUhTKSZ+fYRgd/MrU7QuDi6Q4csf12g8wDLlOqsAxQQdsoeOkFf+QOdL/24QUriFjLsv454Dm/Aa+VETe0nea2hPwVpTUhg3Y9RiZWpDTqzgzpBa/LR1Nl+iedye8P7O/XCRgw1EF5hLGlH6aeS/MNLdrXUu63s00wfhpti4+Y88BFTR1FVH6XT2UzfmSwrR0/JxPznMAL3n0kh8hAc1WrBrKXRT1Mvxeq0GqHOMzPHWVjj6q2xbOVP3ivLh4iIOLGCLN+lx7WGcSDRV6jIPxwbqZZeW+X6kPk0bu6z8p1ChFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m12oXJTDdhr0xx2a8llJiuAkple/3mPJux5zm1WOubE=;
 b=Zh27qy78/GgypTZIb20LF6+ebHYWH4HB5Ak/bpkWJagfklAbMV+DzAs2JDJg9Mg8oBC7uX5BoatsXY1jrV7PkS9CL35Sf/ZOJxQJggKoIYqINYJbMttVyYm44Q3hN72OyBcg7Np/kj2j7F92cM7gktUtrZj7spMCDgidLUL5fYo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by KL1PR01MB5323.apcprd01.prod.exchangelabs.com
 (2603:1096:820:d2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 03:51:01 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.20.9723.018; Tue, 24 Mar 2026
 03:51:28 +0000
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Crescent Hsieh <crescentcy.hsieh@moxa.com>
Subject: [PATCH v1 3/4] usb: serial: mxuport: support serial interface mode configuration
Date: Tue, 24 Mar 2026 11:50:40 +0800
Message-ID: <20260324035041.352190-4-crescentcy.hsieh@moxa.com>
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
X-MS-Office365-Filtering-Correlation-Id: 29967731-669e-46d0-04bd-08de8958a0ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8g9nizIK1SBV1YPf8gsK2B5PalLCGLWVLH1sHCqsZFGBa3yyRzxfKomhIHe376uSwuM2kzOPus+0gSwPqEnUVAPuX0IFvqA05X2xxVojCwUQ3h7inAqq2zYs2NC4UT9vriJ2JKCxF18sIp3gDlryhhMHRWO88mf/oI7Sv3GLHSnbGB+D+lxNa+xOFxfyPwwLeBbx8xwmVZLfK3rdSu5FFmmSl/u+zJ/BaonUxWeLB3o7PE89i7lPBsg1hBre5YG2ym8ZwNsvMioRCeKd+xGYhCjEW8JKR0YWJesUXHn7T09/3q1TFGuXQCDhTc3827ZrZcjNOZgr5Xd4zyk/90EnX1DhS45XA9Mxj6xdO+V9CbgrpzQq+Ncd+YcVCRDj83MqPWHrN2l0Fa6H/IwiKd9FUgjdiYqu7iZpJxoEh1xcz66L/P1uKu6LC24HIYjTBAUFQIzgWl510F9qniiAKKV4fmUUJhIMeOQ6qOLcpWXee8nF25cCeYmtLC8cLF2ZSP01g4GktxwnnaSaNAMFq1EGk1llhCSTGyZFpxvXWU3qy4ky+6mBYD6QiyYm7Y4fdR+PbTPKawTeROSwZJn7WenpRtRrBO4dnBtk9TM4PrMPlshq9PxR1v8LbaWpTG6OBFL5n/bcdWAo81K0+yAWWe2ZqAKwspnqHSrI+02hPjrI9OeewkK/t9n4+oHL4/vsDp3CIsPACBnXaX7KnWIHAQx1z492z8MXe85kOYN/NbXLkn35kJNt48lEI+y4LUCiKZ890lBLc7wI0dqmZuP6zaIIcAgHauz3MGm6/+LnyTobAIY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KBFq5xTbXVBASXmTM4N+pYEJCzgqBygd7p7okI+VVPPl6xKC2kv0jde6NkB8?=
 =?us-ascii?Q?D8EAsYPv3x2xkMvC1i59IA0Zfr2TWyK08W7RphT22ekvanCQn7PeidWeuJPi?=
 =?us-ascii?Q?Be105e4CKlHONnGJKTPq7PwQ33WcPCDtOr9XFXcAZLlVHdLwpIra1zRXktNx?=
 =?us-ascii?Q?OR+sHO8ahFZfJstlWX8XVLNj34xlowNS81iEiVcejMikZVcm/eWYVw7X3p8G?=
 =?us-ascii?Q?efxFs7ksC9jr6A3szoG6LPhhS1xCkpBOp+WSYfAfx0+/Osm+WmkUkkr5hqY3?=
 =?us-ascii?Q?UVMcOFJKp9Sj83s/8PgIim5DlhvHEt1Gf9xF8GccovwUQkyJWfZbrx0PUG78?=
 =?us-ascii?Q?yUMCO5UgyCsQn3fmB61j04yyA96g+L0lMbSuYu9aG065t86KCUCQDasktuqq?=
 =?us-ascii?Q?nKDh6eVR5gCiQoMiRAI2xyf8u1CynZEDcAYNoMyrx5/WERPVLjAASEZ2twnM?=
 =?us-ascii?Q?C+NqsUpMPmq0apk2t5/1+4/r26IqIxQNGKLQddYg+0a0t1N3RV99punt1Q3T?=
 =?us-ascii?Q?20pQUYGPW70gCv0hyIsgbC+DPLZ3YyYNLIHCuTFwGptyDEDPGzl3s99fmnDF?=
 =?us-ascii?Q?Ox4VxLf9XqRsikrYrM83GoC0zKIv+J+28Sn1RQ7cd6VcLAJ9HIu2ILo8/nb0?=
 =?us-ascii?Q?6+9IgldgVCR0m+yzZx58e6mPF3qwWA0gJZJHY2/9zIM91tPFnGhJAlUM7E06?=
 =?us-ascii?Q?gsqTi44Nl0oCLg4sCMBf9ztKNVzMlvBnromzmLR+uCPaR51OCXC0Nb/HTbPd?=
 =?us-ascii?Q?SKWa08uz0fCOix+hCqzFs024l2gunujayXm0btRPuojlt3wm2iKkKLVHa7s4?=
 =?us-ascii?Q?mIFnqwUIpoZl3SNddhxCangqlG+aw6q0DQL061QqpznznU2DgvAGwbbVxV+1?=
 =?us-ascii?Q?NMn75PRpQdBwmWP3STTN2YHVYkSRqGqLfw06aZnKS/7FyM5FVU+nlTNUfC8Z?=
 =?us-ascii?Q?s5dIh7gMNCJj3T+ictJInOXOElaU7WNtTSAw1qyDzB40yht7eKjngKXRdKh2?=
 =?us-ascii?Q?k+TQHzn8KG65i5qQSJgptRoE0GdRFgyuJX4xO+v9Cgho2esVaUyD38EdbD+e?=
 =?us-ascii?Q?5iy9CfgkapM4N0SzKBBoUR1Hepbp5x3E3abIbTg1Fvp6vpQH9rZ2afu304ii?=
 =?us-ascii?Q?5kL3hBm7oOdYE3hvIJmFCRIwXaBPk1dfUTNLYoIEykB+GhKjkoE42KRElinZ?=
 =?us-ascii?Q?42FxDJisPAQDildCx85oGN4sUCW6pT5YeAnxb98Q9+RTRPfHrqFJm6vGeCmd?=
 =?us-ascii?Q?pCH6BCVJi/UB1UGvQL90Bi18mu+OfKUndEM0VsrFd7M7sWR6MJYvEAC05rlA?=
 =?us-ascii?Q?Ma7nOCXTSQjh16rjR/X8bKexhQ336jo4Hf+QL/XVbA298QT1LNXIdwCSCrbt?=
 =?us-ascii?Q?j7BBbfsru8fMxLlaEpU+wveaxFXVTm0Yijqd8LT3qlvwTmc+7i27+yGmX9oy?=
 =?us-ascii?Q?okgvunbveuQ1inIQdX/kXL5DBGhB/fuGu8bD5TvSV/U/1CdPMXatFYYevhnH?=
 =?us-ascii?Q?m80wFtYsAaty9M07W9zvXojAg4QxnFDue/wk59I9U3HOROQv6oVeE/QnlEPD?=
 =?us-ascii?Q?3R0VYwP0NMWyyMmY9Z5lNsdBdCVyDtDzSJONYLsiQsTubD1txr7wWOnXy14v?=
 =?us-ascii?Q?Ev7TlAKzmGfI4nxEKH8GrLZ10O4wgJx3bcXzzEUrhwOrLrnyZflxyB3ovcGs?=
 =?us-ascii?Q?QWbMmYm8XBvwdIaas6BK8wvD+F1BLtJ7Nly8IxgAfJlkkMr1IhgWSSiZoFT/?=
 =?us-ascii?Q?gVqdIgYe/wg//nF9q/nRruYD404HnMw=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29967731-669e-46d0-04bd-08de8958a0ea
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 03:51:28.4297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QMDCaxRjvvjAc6ACupVnOzRVfIgFNW5ahcFS6Xzg7ElLTlKTofpNIduCSM1VlTnJmz8tLwvbzBbC72Q0vjR9xIOEBn/6sY2DzH9p1OWvhCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR01MB5323
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[moxa.com,quarantine];
	R_DKIM_ALLOW(-0.20)[moxa.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35361-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[moxa.com:dkim,moxa.com:email,moxa.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2A317301E37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for configuring the serial interface mode through
TIOCSRS485 and TIOCGRS485 using struct serial_rs485.

Sanitize the requested RS-485 settings and map them to the device
interface modes before issuing the vendor command to the firmware.

This allows userspace to switch between RS232, RS422, 2-wire RS485,
and 4-wire RS485, and to query the current per-port configuration.

Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>
---
 drivers/usb/serial/mxuport.c | 86 ++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
index 4d29a431cefd..9a8bb4f02da3 100644
--- a/drivers/usb/serial/mxuport.c
+++ b/drivers/usb/serial/mxuport.c
@@ -183,6 +183,7 @@ struct mxuport_port {
 	u32 hold_reason;
 	u8 mcr_state;		/* Last MCR state */
 	u8 msr_state;		/* Last MSR state */
+	struct serial_rs485 rs485;
 	struct mutex mutex;	/* Protects mcr_state */
 	spinlock_t spinlock;	/* Protects msr_state */
 };
@@ -1348,6 +1349,90 @@ static int mxuport_open(struct tty_struct *tty, struct usb_serial_port *port)
 	return err;
 }
 
+static void mxuport_sanitize_serial_rs485(struct serial_rs485 *rs485)
+{
+	if (!(rs485->flags & SER_RS485_ENABLED)) {
+		memset(rs485, 0, sizeof(*rs485));
+		return;
+	}
+	if (rs485->flags & SER_RS485_MODE_RS422) {
+		rs485->flags &= (SER_RS485_ENABLED | SER_RS485_MODE_RS422);
+		return;
+	}
+	rs485->flags &= (SER_RS485_ENABLED | SER_RS485_RX_DURING_TX);
+
+	memset(rs485->padding, 0, sizeof(rs485->padding));
+}
+
+static int mxuport_rs485_config(struct usb_serial_port *port,
+				struct serial_rs485 *rs485)
+{
+	struct usb_serial *serial = port->serial;
+	u16 mode = MX_INT_RS232;
+
+	if (rs485->flags & SER_RS485_ENABLED) {
+		if (rs485->flags & SER_RS485_MODE_RS422)
+			mode = MX_INT_RS422;
+		else if (rs485->flags & SER_RS485_RX_DURING_TX)
+			mode = MX_INT_4W_RS485;
+		else
+			mode = MX_INT_2W_RS485;
+	}
+
+	return mxuport_send_ctrl_urb(serial, RQ_VENDOR_SET_INTERFACE, mode,
+				     port->port_number);
+}
+
+static int mxuport_get_rs485_config(struct usb_serial_port *port,
+				    struct serial_rs485 __user *rs485)
+{
+	struct mxuport_port *mxport = usb_get_serial_port_data(port);
+
+	if (copy_to_user(rs485, &mxport->rs485, sizeof(mxport->rs485)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int mxuport_set_rs485_config(struct usb_serial_port *port,
+				    struct serial_rs485 __user *rs485_user)
+{
+	struct mxuport_port *mxport = usb_get_serial_port_data(port);
+	struct serial_rs485 rs485;
+	int ret;
+
+	if (copy_from_user(&rs485, rs485_user, sizeof(*rs485_user)))
+		return -EFAULT;
+
+	mxuport_sanitize_serial_rs485(&rs485);
+
+	ret = mxuport_rs485_config(port, &rs485);
+	if (!ret)
+		mxport->rs485 = rs485;
+
+	if (copy_to_user(rs485_user, &mxport->rs485, sizeof(mxport->rs485)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int mxuport_ioctl(struct tty_struct *tty,
+			 unsigned int cmd,
+			 unsigned long arg)
+{
+	struct usb_serial_port *port = tty->driver_data;
+	void __user *uarg = (void __user *)arg;
+
+	switch (cmd) {
+	case TIOCGRS485:
+		return mxuport_get_rs485_config(port, uarg);
+	case TIOCSRS485:
+		return mxuport_set_rs485_config(port, uarg);
+	}
+
+	return -ENOIOCTLCMD;
+}
+
 static void mxuport_close(struct usb_serial_port *port)
 {
 	struct usb_serial *serial = port->serial;
@@ -1421,6 +1506,7 @@ static struct usb_serial_driver mxuport_device = {
 	.calc_num_ports		= mxuport_calc_num_ports,
 	.open			= mxuport_open,
 	.close			= mxuport_close,
+	.ioctl			= mxuport_ioctl,
 	.set_termios		= mxuport_set_termios,
 	.break_ctl		= mxuport_break_ctl,
 	.tx_empty		= mxuport_tx_empty,
-- 
2.43.0



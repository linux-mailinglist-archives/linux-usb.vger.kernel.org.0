Return-Path: <linux-usb+bounces-35360-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFyBARYLwmmOZAQAu9opvQ
	(envelope-from <linux-usb+bounces-35360-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 04:55:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BD6301E21
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 04:55:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A268E3125A5F
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 03:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81D53A1E80;
	Tue, 24 Mar 2026 03:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="e7NFHAsx"
X-Original-To: linux-usb@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012014.outbound.protection.outlook.com [40.107.75.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B86B3A1A54;
	Tue, 24 Mar 2026 03:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774324287; cv=fail; b=ULI4kqOoNYHgY9DRhoQPOjg4y25pqyJiAajuzDea6RGbi4SCECkRtJTaAe5kIlyw6vy0mHC1u5KNEtzzJARSjvYrArYw0iT1IS89qbA3Y8H8C8qrTnE8dW/wB9k4kzfWAS6gurO6A3ZNw5Xa+5JoZcOJ77W97M5DZAlSRov4DBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774324287; c=relaxed/simple;
	bh=p3ewzcSN0wU2GeNfoUMZzCBAdSMpmfjOc7ed5a2atNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=duvGt6X+hXjxk2Ele3bDvJSJnRSrabHBwKPjK0e4de/SnHmNoJoenQywFIXTMvT39jIGj/zILtrwBeDPOtedzoBWgsFFysCRz5sjDh15LIjW045cgQMdA22cbpOBJxs7bYCG21i0dFGOTgpvXqva9cz5fjOiO8jHhTSCGTiL8So=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=e7NFHAsx; arc=fail smtp.client-ip=40.107.75.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8v3RRC8jpe5aMpB/dGNvDnfclnWyjHvHEpQibcBH+FuIxL6fEOyuxkh0ZLUCLEJ2kdsBFRhtqw1Udk7HDhzswxvytZRORGOLWx1CTDnb7BIIMSrk2WigE+xm88oWPoSw9nlpfQPfwAjFtosZwUgCcF/MBt5cUolQCsF6VTrul7Y0ruzrJzqBeQGmrSXNEQ6Xtce2MyBUFAu2Zk1H7/sOoc7VVINmXuLi8rSxNUy+OgqMirG82UCqtewnAW+EwnvoAmgPiKGMPFpS8W7PnmM/SVOXP3c7RE8L4twFYHmeQuK1RSvsx9lC/GhuoI/JjcHSH7Px2eOefYs0Op9HnJoYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmVtBAcoFdBF4Vr4ipD1EMULifLmippSbH52ZfcZ+/A=;
 b=XRsOEOdQ2MdQI0yAhq6PXwFQEOji7B4Z2Mcz3XCzbd/1whhxx7GtzJ1LNo8zMO60indliQru2xasfuNalAxu/3AVFvR27+HhDVgENgtTKV2u2coA9/Ji+AZ1IBcqamif80NjoiG/aNJkKhCPYUvCLwcmqzNnRklbF+DNNwtigBSmzqJ86sPEN31PLjoL5i28LHYZonJXPBBb7ufkJ4NyR6ZV+fiR/rd3PvZYXqaqOSSdvCmXD8JS3pJx17lxZiHcucOTFrRLiTeAbKz+Q4G2mFYOkb+BujbYWGaLHhIhckTjdu+tEqWF1FFeNBouGVIhvmQWL5Bqo/IbBp8OU+Ueow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmVtBAcoFdBF4Vr4ipD1EMULifLmippSbH52ZfcZ+/A=;
 b=e7NFHAsx3dhU+L+/dJ8OSI6aNX5HlmXocHGy21OENMhD6EUBJ0kPx91A0j03zHVqhTVRzU6qTDqb1DuBAXVllUacotc68VHQEJvanTGUEpyBa/KpY4RjYwULMx/t6/9gh4PCvBhbC6/RdCf6sgR0yRbVHXKACdqWsQiPTq6L0LI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by TY0PR0101MB4844.apcprd01.prod.exchangelabs.com
 (2603:1096:400:275::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 03:51:11 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.20.9723.018; Tue, 24 Mar 2026
 03:51:23 +0000
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Crescent Hsieh <crescentcy.hsieh@moxa.com>
Subject: [PATCH v1 2/4] usb: serial: mxuport: handle SEND_NEXT tx flow control
Date: Tue, 24 Mar 2026 11:50:39 +0800
Message-ID: <20260324035041.352190-3-crescentcy.hsieh@moxa.com>
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
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|TY0PR0101MB4844:EE_
X-MS-Office365-Filtering-Correlation-Id: eb941d8f-dc75-4584-a961-08de89589dac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	+Xq2oLYcoQNlwcYkLPWnj+yNQCEfz7PrpYc1Lh6kfFAq+IUb0um2KCm9x8uTaDp5mg8hWOklSB6YjXg9Bow8sy69cn1GPcxh+51ZMG9oWVwdYJZKzMNvhL9XTddXHA2wgPEat2UqxrGvfSqIBRd6ODiMAmLsr2AhBGbv5XADQSNb/Tb7QDeajfHuzbiMt1CPhUuaq2tJ+YhAnHHOFQStjZxtkk5l8pkD9zUjlwkjh8u4mgpjkaaHeeqbDAP8AQLThY9S3IsYlTzZMHizVu07CldD+IjjQ5Hc8jn28y0JPtyP/1UDgKPma4goNyHDi0J/Oilz3nk0lY00LixsE3UVNX3Ng5mDU8+Sf6SnSIw5d91f75OMVgqliYTw8LhfzEsmMj7HZlTEgcGeGJtuVCRs68yXSCQqA51abpnkpVDtXvEwl7XQztbzcqrYR+WuhvvBfTQpczWOoWF2iTIMKnV3YenIXCvI0YmyBc8gQqy52CYayYe4M87QxXCoQW9m095pKgtcV2Z/I6VtyxzkQi3DkqZi8V32XDNG9xpTkyKwTMW7+VnylNbCXDgTJoafFAThinWxkSn87HAwK0uEG1R9XIc+hj9useMMdnxE6No0gTDGMpviI1XKKYtm7KSQoKXMW5pUEhju8y4nx9kBZ5S/mHgTNwZS/Hr4PcKJknTnYV1+liAfAOKAX77N5B4RH7aGPJOKNnUQU/DoMxOILUmo9w/seTwa+Uw4fAsKD7jErBnxgsv1B7F9EFBGO3Ytc8idE0LGn3T2cQQpWk+PCS2w6U1GZJ5swVjTjeXAc5FeC5k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?huIBGuR/1m4/wfqopHF0FTjNK3dZTz+ku70K+996pfkf3pXj4kwk8l/Dt1Ne?=
 =?us-ascii?Q?N4O2qAU4VdWwRuqDPZ26WAHItwYZcOLaErEF5BIls8+kj/lh1S3yE7yEi/VT?=
 =?us-ascii?Q?B1QtDRKkvVi2JnRjGo6P4NziPPUiNxjT4Z99P6hwkWWrPmh/gSJ9H6G59kWF?=
 =?us-ascii?Q?K0OYr8BOjPLAlwynUxec4ltW5ygoJ4CutgEIog+ZB41Kp4gFm2FoxUn6g4G6?=
 =?us-ascii?Q?Q9qOYZY/rCeLjglp5f+Qi2LtIuPsXBb/jAr1r/Y5xTSzXo0ZiSW4bW9VJVN8?=
 =?us-ascii?Q?L4HrkAiZ03sy5/jScpNDx8mc83uV9Apd9JWX+fVl0u7YPuhPQTX4PwrWPD1x?=
 =?us-ascii?Q?51JedCnOlElMoKRuyVJe6KVcQY53DAo4GDqiRAOf4LMtLIPM890Ew7A0pTQI?=
 =?us-ascii?Q?qkPHHCyhBnYH2BOZjIMsZt/IXmqE2e8Li45q3FsOP7M+cZ8UDewxt3BxBJwq?=
 =?us-ascii?Q?Jeb364EjGTxN52zSrLkof3DceYwEOqeTArTb0ZiaAw0rzBnE8XZI5ITWDWLX?=
 =?us-ascii?Q?JlnGJIGOfE1Z5pOqS6BPUnnQuBhPaurrP116VTX7hJOFYM3XWMA7j8xyMFL1?=
 =?us-ascii?Q?XU/KCIpSTAq6Wbs2fd6bbpusGJYolHWEmtEUkwKOFlvwF5m+RQKcXjZAMsfO?=
 =?us-ascii?Q?mu499ekaQKo+cgrSo76oGm1DBvg3bxap3ef19qPZ9UkK2e9cR3RHhaQ5YTHm?=
 =?us-ascii?Q?wnq4p2SkEVYRS+bAp2NjBZiJXtXfIQE1VIag1eszj1vSaqNphncQyzgzPFZ3?=
 =?us-ascii?Q?kVCnazl9A5LiQp3Iwzd/IHGf7blv7W18/KieU8ym57zOyjdfs1d6rbRv6Rcr?=
 =?us-ascii?Q?a5yjWyAOGCRP5uWw0R/bV8gCOTDq6qXMdaw7MhT+bpI46mqvC65aSZ7/9lNP?=
 =?us-ascii?Q?feYlp7vbKTZXCyNzR1zeUIL8yN3hSm92s9fTVEy82XZOWhyoSTu3Xx8f4o22?=
 =?us-ascii?Q?a6vvFyDB2301ZZ0tfcQlvtxa+bqmgo1Lx2XRhpzr0ih27Q0igA4Gk/cJgEFe?=
 =?us-ascii?Q?8Td4UJ4/oyZixl0T27VnAeSiqRgHNOc0og34KQo8sraUNpRmAntX2i7cpQt4?=
 =?us-ascii?Q?1Mxtka62K60NfSk55+rIKJGwxoN8zSKjwH/C+XjgddzTPLlFJ5Uvf00oe+wz?=
 =?us-ascii?Q?/ha167g02eXVsaK7sajiKHW2Xw0o2uQMQVv52xdeb/1BAylwYOzFyZ7Q4UWI?=
 =?us-ascii?Q?YxrUVIVql06HnxwENm9uR4v+51rmGcE3anWofJBQwa4tdAxYjADU7hWk0FK+?=
 =?us-ascii?Q?xblOIQ2ihoxmUR/yJjm/QBsTLO4wpRBO4b+da2wWfttDruTns+OwQUQMMGSA?=
 =?us-ascii?Q?YMqLWEMZqJ5vO7cgP1sLwZJPqFtUw0kLfcjabdB7iT/HUzYNxu7C5sdK8RlB?=
 =?us-ascii?Q?385wdVywFoI1o+/rrD76ChWGHzFZ1f6T14+DKZI1YYAo0c40IskVE3te+M1F?=
 =?us-ascii?Q?eqp+uKnY04sKCccUa7K9VqQTb7OZUUDJTI5ZbCy4j/5HmF0+8BOR3aETlLwi?=
 =?us-ascii?Q?sGTLTOrD6rHa773EdSHOvw6hSvyqPad2vZF40Nt7bSSmHOAjhQJNupZ7wSgP?=
 =?us-ascii?Q?ta7eSgBQ2yJqrE388239jAJBopxzVkzknVme5BLfRrexuOp9Z/yCv4U4/buu?=
 =?us-ascii?Q?SEWkVnvZdQuOXSYKgyuBdv0zLO3uIlG2iMBvMX+PgNizTsniuBEw3DTKqwQG?=
 =?us-ascii?Q?BNmii39+VSPGbX32GHeluto4w+nW02SHrdLLjBKl9lJw5XwEXtEcQTT+BCc8?=
 =?us-ascii?Q?pP0v11dh7asvnALhY0eliJMLQ4P8TkU=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb941d8f-dc75-4584-a961-08de89589dac
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 03:51:22.9985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2YqZ549BEkbriugRkJ4wl0TExP96lb6uM+7k8Q6TS8x/p+0JyfDIoVS0dUwoQtbx1rPXTY61FMdG4esGhExN5PMPzlh/vuqxpcrBhk94X2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR0101MB4844
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
	TAGGED_FROM(0.00)[bounces-35360-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: 68BD6301E21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Track the transmitted payload size per port and stop queueing more data
once a bulk-out transfer reaches the device buffer threshold.

Resume transmission when the device reports UPORT_EVENT_SEND_NEXT, and
reset the TX flow-control state when the port is opened.

This prevents the driver from queueing more TX data until the device
reports that it is ready to accept the next transfer.

Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>
---
 drivers/usb/serial/mxuport.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
index 034b506322c2..4d29a431cefd 100644
--- a/drivers/usb/serial/mxuport.c
+++ b/drivers/usb/serial/mxuport.c
@@ -179,6 +179,8 @@
 
 /* This structure holds all of the local port information */
 struct mxuport_port {
+	u32 sent_payload;
+	u32 hold_reason;
 	u8 mcr_state;		/* Last MCR state */
 	u8 msr_state;		/* Last MSR state */
 	struct mutex mutex;	/* Protects mcr_state */
@@ -250,9 +252,13 @@ MODULE_DEVICE_TABLE(usb, mxuport_idtable);
 static int mxuport_prepare_write_buffer(struct usb_serial_port *port,
 					void *dest, size_t size)
 {
+	struct mxuport_port *mxport = usb_get_serial_port_data(port);
 	u8 *buf = dest;
 	int count;
 
+	if (mxport->hold_reason & MX_WAIT_FOR_SEND_NEXT)
+		return 0;
+
 	count = kfifo_out_locked(&port->write_fifo, buf + HEADER_SIZE,
 				 size - HEADER_SIZE,
 				 &port->lock);
@@ -263,6 +269,13 @@ static int mxuport_prepare_write_buffer(struct usb_serial_port *port,
 	dev_dbg(&port->dev, "%s - size %zd count %d\n", __func__,
 		size, count);
 
+	mxport->sent_payload += count;
+
+	if (mxport->sent_payload >= port->bulk_out_size) {
+		mxport->hold_reason |= MX_WAIT_FOR_SEND_NEXT;
+		buf[0] |= 0x80;
+	}
+
 	return count + HEADER_SIZE;
 }
 
@@ -484,6 +497,9 @@ static void mxuport_lsr_event(struct usb_serial_port *port, u8 buf[4])
 static void mxuport_process_read_urb_event(struct usb_serial_port *port,
 					   u8 buf[4], u32 event)
 {
+	struct mxuport_port *mxport = usb_get_serial_port_data(port);
+	unsigned long flags;
+
 	dev_dbg(&port->dev, "%s - receive event : %04x\n", __func__, event);
 
 	switch (event) {
@@ -492,6 +508,13 @@ static void mxuport_process_read_urb_event(struct usb_serial_port *port,
 		 * Sent as part of the flow control on device buffers.
 		 * Not currently used.
 		 */
+		if (mxport->hold_reason & MX_WAIT_FOR_SEND_NEXT) {
+			spin_lock_irqsave(&mxport->spinlock, flags);
+			mxport->hold_reason &= ~MX_WAIT_FOR_SEND_NEXT;
+			mxport->sent_payload = 0;
+			usb_serial_generic_write_start(port, GFP_ATOMIC);
+			spin_unlock_irqrestore(&mxport->spinlock, flags);
+		}
 		break;
 	case UPORT_EVENT_MSR:
 		mxuport_msr_event(port, buf);
@@ -1318,6 +1341,9 @@ static int mxuport_open(struct tty_struct *tty, struct usb_serial_port *port)
 	 * returns.
 	 */
 	mxport->msr_state = 0;
+	mxport->sent_payload = 0;
+	mxport->hold_reason = 0;
+	kfifo_reset(&port->write_fifo);
 
 	return err;
 }
-- 
2.43.0



Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31DB446EB5A
	for <lists+linux-usb@lfdr.de>; Thu,  9 Dec 2021 16:33:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235583AbhLIPhI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Dec 2021 10:37:08 -0500
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:55022 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235464AbhLIPhI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Dec 2021 10:37:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1639064013;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=TU9wBEVUTkFv33X4xCVj8Ur0dG8AefLXkRrjzUKrd8g=;
        b=bGcdETQb+OeCn1065BACyNmO2yGB3JmHVdqTSlTWRN2/25eJYrez+Th0U+GAi71Xrr88Iz
        l0EsUWmD7eBnSKM+SLJQPv7a7B9BugDdPe5kymGWqDhmQXwwHmEJtAcmLzUsifQcp1LO0k
        0wP+g9H+A1G40J3u1JcOnvChJ/zAQ+k=
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2057.outbound.protection.outlook.com [104.47.8.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-reCzyUSZP5KH5Tlni_6UBg-1; Thu, 09 Dec 2021 16:33:32 +0100
X-MC-Unique: reCzyUSZP5KH5Tlni_6UBg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hIk1pXg4jHoYwUrHfseioHc9DAijORTxuJYuCn8LtXJ38uD9UEhVF3e6xQZsatswYR+vMP07OcS0LN3JXkYnz6qQQr/ZV/xwWXlLEOC2+17OHy+oqhhf5b6vfulQ4fCDodXO13dBfH5hAVHMK5HVwMvN8W06LLcMigZBSxT1gZZimjrUxCS7QGd0DanM+H55kD8ly55wXqpkWW/f/fmKz1HZF+Qh6b3Qn8HYZhch4h89sNgT0+QMQWIb3wqGxlBhsahLDS/0U/HoTA2GfukI4xcBAOZE/3fTk3L2BhRRo2ITgAEzXA7saWRIpOr2WXZGbvfnYVbHr9z+MDi9R0Getg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TU9wBEVUTkFv33X4xCVj8Ur0dG8AefLXkRrjzUKrd8g=;
 b=ab5yL8azNS/7RW4+jLnwbphwIvY5acUWXursrIuZ0JLXGcKLPdj63/n/fHWtg3SplJH/VTy7NXyDOH3PHSMe7tW8jWzZwvLV+PetNi2KEQkhcnb4ZBaoCJGme1t2pWCm21rV9PrKu2+NdxcvBvztZ/FHi+YO9g43eOPuh13apIMyLy8oBbF80cg3mBCLZlh611qQN43HJXio34pXVmmRNVvfNtMHNn8N17RwbJqGCPH1oYv4NaIAGMjnDvIxSbt+Iksxn70POX59L6wnLHfYO/kQefBdHFY6tWodsPxAKz2P19MQTCtskQLpdC192fh18Ev3RXc4fh8J8D2OUuWP+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DB7PR04MB5402.eurprd04.prod.outlook.com (2603:10a6:10:8f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Thu, 9 Dec
 2021 15:33:31 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::e9d6:1be9:d046:af1]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::e9d6:1be9:d046:af1%7]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 15:33:31 +0000
To:     linux-usb@vger.kernel.org
From:   Oliver Neukum <oneukum@suse.com>
Subject: [RFC]How else could a malicious device sabotage endpoints for usbnet
Message-ID: <ad1ee829-401a-d051-1da8-f9e01caa7b85@suse.com>
Date:   Thu, 9 Dec 2021 16:33:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Content-Type: multipart/mixed;
 boundary="------------F42D27503ECBBB97BB7DD20E"
Content-Language: en-US
X-ClientProxiedBy: AM5PR0701CA0016.eurprd07.prod.outlook.com
 (2603:10a6:203:51::26) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
Received: from localhost.localdomain (2001:a61:3b82:1901:9d6b:5ffd:1b6b:2163) by AM5PR0701CA0016.eurprd07.prod.outlook.com (2603:10a6:203:51::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.24 via Frontend Transport; Thu, 9 Dec 2021 15:33:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aeefc571-c5b0-4478-0cc1-08d9bb2940ec
X-MS-TrafficTypeDiagnostic: DB7PR04MB5402:EE_
X-Microsoft-Antispam-PRVS: <DB7PR04MB540213B22B6CDC69577BC6C5C7709@DB7PR04MB5402.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BJ1rw/KmXw9EWW5xaeWzS6+EtchsYqGLDytN7acGoo2mA5m3LpAQHn3/z16rqFXMLnyTzDIlnXXg9bwosVkYj13jLMjaKntVmSdrrkb+2FESNHTWju3+rZGim7nGaKBpm3xCIy7tPvRm436tZzfDattZccxZ0S4LWjprIFsJ567vBx9gn1RC6EQC/szUaZHTFwbYuSudKDCRzrXWhkdrf+yEk0Cs44kex/kkB8+2Tjdt0bsMPFzAYm2xFqZlSf1NKN4qhoeMLXdWbxmjbPg5M005Eaq3wLpe9537X8mv6ld2audOIgNAiF3bJr1mlXv6qJg7G2K/6vvnrTSr6qnpzBy+5O1xRD9hOcP/ZdGU4PhzP0ymYXIcRIT+z0Ca7JC/6a1TJZ7HcnWEcifPAnws7YHYCddsi7t9X9200F5ymW75AaIUdBHSoWoylToCOtKfV52XTqDJSAQUgcJsSUhXhwnvlBOYSgOymvq5V7uWO+F3vW97En3+bIoA8SmsSfPh6qGijdfuwta3QJ0iXZqQ3uOr8Derjol/kNKtauDq6QHJdOLH4o+RstauXs0Jdh6WLmaRVilFHFOLymKzdDTljSAW9k+nCBMo/dY11B32anjPQFaMQ8pJUX6Ef5zVlml5fureNZDYpRzbixsFtmaOLY0VT5qj2PEuA6fuSLmlJ9wnZ98WnZJUdtpnQzxt0fN+zqPffbsDVTLxPGR8vjPeywt9b6Hi8FbNGGrnaAiRgcGBz3C5aY60FQlV539pRFkHd5CDAsH1YNPEJ47rV1XUnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(31696002)(33964004)(564344004)(6916009)(31686004)(86362001)(2616005)(6506007)(66946007)(186003)(235185007)(8676002)(6512007)(508600001)(38100700002)(66556008)(66476007)(6486002)(8936002)(2906002)(5660300002)(316002)(43740500002)(45980500001)(554374003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUhvN1ArMHdlLzZoZnM0U0U3ZmxiZlFjZElLR1lad0h2eDJiemFjRElXS0ln?=
 =?utf-8?B?TjJFdVVCc2xzTmthdVloTkk2SGpibW9MOHAwSU1DS2NTMVNyNXdGVXZlbUdr?=
 =?utf-8?B?SHdlWE9xdERqTFI0SkFFSklmR2dxaVJMajhSTndLQ3YxM25HL25HTG14SWtn?=
 =?utf-8?B?dEhRTjRPVHNrVnNZZDc0Y3dYS3hkQldNeGhTa3BjY1puNUFKMHlGZ1lOOUlW?=
 =?utf-8?B?eGxiMFYybnNnTXppaUMvNHBzNlBjeHhjOC9mNDdMUDZFR3FNQjEzeng4V0Rz?=
 =?utf-8?B?RDcwa3U3TkxBaHVuTzZhaEVFSE9GMi9zc0NWcXI5TDJNS0pWWmkzVWs4bmlD?=
 =?utf-8?B?YlNRQUNEUnFSTTZxbjBGU2Raek5KdFpVUUYrM2VoS1JwTStPbi9kVW1YejJN?=
 =?utf-8?B?eCt5QUZLK2dJNjRCN0JTZkwwdUtDM3BabmgxWE1FTWZVdVpGMEdDYjVIbTZm?=
 =?utf-8?B?aytUbHFrQUdYV3ZkcTA5ckhVdGhsMzZRaUJMOWwwNDZqV1o5SVFKT3RUUU5T?=
 =?utf-8?B?eExmY3AyMEI0bXIxbExtODluaUJ5cS9raWwyOXNkRE55U1NSSHN4bTllUkZ2?=
 =?utf-8?B?cXR3QTFiRTdPc3Q3blRFLzRsakVRNUNDZnhzaFZjNXlFd3k3Y284Z3pLNlZN?=
 =?utf-8?B?eVhmVHE4L3pIUGYxMlV1OFp5b011Mi9qbHEwK0tUNnlXTldydGFUT3VmL3Zy?=
 =?utf-8?B?UkRuUFg5TDR6b04xMWN3NUNJNldUb014MUxkMmI4S3BXNVFyWVdYTW5FTE9T?=
 =?utf-8?B?cmhBSENnemtpdTlCZVQvSFhEOEJsV2l0a01Fc3NNNmgreDQrSW5oR3pDMEpG?=
 =?utf-8?B?bTJVT0ROYzJGTWhybFlVT2pySEY4V3pycjRHT1FWTUZXZE1qVksvWjAwbFA2?=
 =?utf-8?B?bHY2ejJpSUJBUjBLMFc0N2hXeFN4QVhPZHNQWWVpSEZOQmdCc2RyaHg4dVVC?=
 =?utf-8?B?YUpERldraEdrQUxGTTBNQytudnE5d2M2ckt4czh5RklFYzRaYzE0SkxtV2pF?=
 =?utf-8?B?cHF1ZHc1RjVNVUVPeW16VVoxVUdmakdHWVdobS9mcDJkb3lYSkdJYXlXUmRw?=
 =?utf-8?B?enFuUnVScWU3QWZYbnNBZHFNZ2Vmc05mZ3JWRlNPb3NrWkkvSWlidHhxTEUy?=
 =?utf-8?B?V0RDb0twbnFkOGltYTE1QzlrZTd2elB6anNQUFV0S2dOYm83QlJWQ3ZuSVRP?=
 =?utf-8?B?T0dqOHpLTW5rcDJqZ0owS1hmREVLRlRjaUgzbjNDYTlST0FWYmw3WW9pZURY?=
 =?utf-8?B?TWpIRzEwTkxWbzdvdUcrQmVRZi9WSzlzaUtFK2dwWXVPYzF4aU00MlhQdFZ1?=
 =?utf-8?B?V21XUDZpMUJ6Q3Q4ckZaZ2VpZWZQOFV1a1N6c3h6OCtKd01PQlU2NXV0Z2Ex?=
 =?utf-8?B?Njc4aERickxpWXErbFJod2FJekpHV1UvUithZTN6UElqQnFDSzlZTEl4Ykln?=
 =?utf-8?B?QVhTWWRRdENqbU1MZi9WV0tHMmtvd1ZQQ3BHb0xFcnFxMFY1cUs0RmdLTnVQ?=
 =?utf-8?B?RTFxdDNwaUVkMGVaUXFiWEhOSk9rOTJRWkIvVkxtOG1jbnZXbFRIUHRiNkZJ?=
 =?utf-8?B?T3pYKzJ5cWljYWIvMVAzYW5oVlAyTU8wdzlyVVdkMzFTVkRTdytpbTJuK3Bv?=
 =?utf-8?B?QjRiRjRGckN0eDRIRlBuOU1ncGFvekVUTXJFZUVDUVBnaWJ0ekI5Q2xpczNq?=
 =?utf-8?B?eTd6eWErY3d3MVpHQnpLZUV6YWVHWW5uUXNGcTl3WEt4NWJ3Zm1wcndnclAv?=
 =?utf-8?B?UFE5QndpTlU3dzFGODZVdWpDRzRmWGgzSGhlc3RvNUhudUFTTUFOSE9icmFa?=
 =?utf-8?B?cVh1NFYwNEs4bWk4NnpGWWd1WTN2L0tNUmNjVlFaUmtRTEhKUG9Ea1JSdDlT?=
 =?utf-8?B?YUhPOXV5UHhIL29XL2ZlVmhKb2VubXlselFzaTNXbExZd3hOUXJrQlZKQ3VH?=
 =?utf-8?B?SE94Q1JPaDExVVFJSHBGczdKOUg3UDlwbS9tUTdqNTEvZENEemtmQ2VpZkZw?=
 =?utf-8?B?NDhYTWZ2V0V5NXNPbnprdjZYS2JSUDJLTjBrckFmeTMwWU8xT00xOHZnUnM0?=
 =?utf-8?B?cVE3VFR1ZmYzWjN5b2RteTcvYlg2OEpUdkR0N0grNUN4dWxORlFVd2d2UzhE?=
 =?utf-8?B?cVllbXdVR2lGcDZ0SGx6Y25acjczTmFicGVVVGY4NGFLbkpjcVErZzdrSFJC?=
 =?utf-8?B?d3B5dldMam1lMklwOWVzaWtXNThIeFlnRldaUUl5MHBaLzdRSUJQNTdBSGx2?=
 =?utf-8?Q?xOp+zabBDdIOh0vrZfeuivbjut5zqswppFToCknm9Q=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeefc571-c5b0-4478-0cc1-08d9bb2940ec
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 15:33:30.9309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fqoVwEYD3m/Bp/YiIkz4fqLNKf6vzCFM+8BDgvwhHRP2FTeb/D5qZokz8z/Oyq+bAUB43HlMfqvaXPeM3F4YyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5402
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--------------F42D27503ECBBB97BB7DD20E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi,

I have checked for type, direction and number of endpoints.
But I keep thinking that I have overlooked a way to make broken
endpoint descriptors. Any suggestions?

    Regards
        Oliver


--------------F42D27503ECBBB97BB7DD20E
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usbnet-sanity-check-for-endpoint-types.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-usbnet-sanity-check-for-endpoint-types.patch"

From 853e421630f82fb3b7005ad0b294c091a064ac39 Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Thu, 18 Nov 2021 18:15:03 +0100
Subject: [PATCH] usbnet: sanity check for endpoint types

A malicious device can pretend to be a device with a known
configuration of endpoints yet present endpoints of the wrong type
or too few or none at all.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/net/usb/usbnet.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 9a6450f796dc..b1f93810a6f3 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -91,6 +91,31 @@ static const char * const usbnet_event_names[] = {
 	[EVENT_NO_IP_ALIGN]	   = "EVENT_NO_IP_ALIGN",
 };
 
+bool usbnet_validate_endpoints(struct usbnet *dev, struct usb_interface *intf, const struct driver_info *info)
+{
+	struct usb_host_interface *alt = intf->cur_altsetting;
+	struct usb_host_endpoint *e;
+	int num_endpoints = alt->desc.bNumEndpoints;
+
+	if (info->in > num_endpoints)
+		return false;
+	e = alt->endpoint + info->in;
+	if (!e)
+		return false;
+	if (!usb_endpoint_is_bulk_in(&e->desc))
+		return false;
+
+	if (info->out > num_endpoints)
+		return false;
+	e = alt->endpoint + info->out;
+	if (!e)
+		return false;
+	if (!usb_endpoint_is_bulk_out(&e->desc))
+		return false;
+
+	return true;
+}
+
 /* handles CDC Ethernet and many other network "bulk data" interfaces */
 int usbnet_get_endpoints(struct usbnet *dev, struct usb_interface *intf)
 {
@@ -1772,6 +1797,8 @@ usbnet_probe (struct usb_interface *udev, const struct usb_device_id *prod)
 	} else if (!info->in || !info->out)
 		status = usbnet_get_endpoints (dev, udev);
 	else {
+		if (!usbnet_validate_endpoints(dev, udev, info))
+			goto out3;
 		dev->in = usb_rcvbulkpipe (xdev, info->in);
 		dev->out = usb_sndbulkpipe (xdev, info->out);
 		if (!(info->flags & FLAG_NO_SETINT))
-- 
2.26.2


--------------F42D27503ECBBB97BB7DD20E--


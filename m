Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7DE45DB52
	for <lists+linux-usb@lfdr.de>; Thu, 25 Nov 2021 14:39:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348505AbhKYNm0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Nov 2021 08:42:26 -0500
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:30426 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345435AbhKYNkY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Nov 2021 08:40:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1637847431;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fNo3YWpW2c563kOARm5PjIPIueQ6JJcH8UrrKQ87xaY=;
        b=Ss30sxuFyaKBAE/ioxnlSJd3htcoIZixt4LoPOE3RI7eAA3g8j0JI66GFElZqtJp9rtarZ
        S+5cIGmBUEQEXVCkhaJ75GYKdZ4sd6HAeh1GJEZ6bSPGGg/cDbGiFyMHBgXUo6JDl5RKw+
        r8bGr+bTv2IcqPGfiHQz+V1pR/hHlD4=
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-3DeljtpTNbeygDyR8PPnzA-1; Thu, 25 Nov 2021 14:37:09 +0100
X-MC-Unique: 3DeljtpTNbeygDyR8PPnzA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wp9/1Rn1lIE6hM7LizwVbJslTm8x1BiTNgs3zoerHvZVZO4Jf4uyhMCUhIdQmtuuASaJlvbrFpKjuQYKpjpjBupIKgIzJAVT9z/HvZZm3LWxgJsbcEI74KGDRihGCJ7Xx194W+48hewkC5g7jmkMEN5z0jpJBerfB9/gtmtE2U0S31wri2CA0beDP2uI9AkO2Jok8GbivgzD3v3ycAtTjApQQ1vPNvPKhfbFP6BW2zziI4kCkSWD+AHOKgUyu0Vh77rvnLAHAZesJXFLR1A2xRwHzp2qzTPfscuiGOo1qASJnMo4GdZ1kvYwh20Uh/8vWIsvhxpTma0mgOCyEg8/3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNo3YWpW2c563kOARm5PjIPIueQ6JJcH8UrrKQ87xaY=;
 b=ZnNsrv/tqsm/YLggSExPQpsU35JCWuGqzF1s0urutcaBdUI/oitEXe6GJ2IJ6OkAqWvTd1jESA3OR1TGq0qpV0k6eaVpADPk/32eVoddK/btUGTenGq8s2TY1klt494pQ7x9kQyvV7MFwvZPcNtcAnTJncKQ7BiTy6YfPW9JxrxQQ5mzSLZ5BhlrrDwCxO/mRe6BaMge+Ar6jlvUjR74j5yKAYMipVe4zg8T6U0YIE81cyW3inc8So2Xpv5yjadS819DtO3hRaPSpctl+Bc/zvtkPbXwTenvkG2jH8TBorscUl2EZyEwCXywlA+uSyiVFQAMzU0HwnnOIeAhfwMVtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DB8PR04MB7019.eurprd04.prod.outlook.com (2603:10a6:10:12b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Thu, 25 Nov
 2021 13:37:08 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::e9d6:1be9:d046:af1]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::e9d6:1be9:d046:af1%7]) with mapi id 15.20.4734.022; Thu, 25 Nov 2021
 13:37:08 +0000
From:   Oliver Neukum <oneukum@suse.com>
Subject: Re: [syzbot] WARNING in usbnet_start_xmit/usb_submit_urb
To:     syzbot <syzbot+63ee658b9a100ffadbe2@syzkaller.appspotmail.com>,
        kuba@kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
References: <000000000000a56e9105d0cec021@google.com>
Message-ID: <8b395185-b18c-caf9-0418-78e96797b474@suse.com>
Date:   Thu, 25 Nov 2021 14:37:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <000000000000a56e9105d0cec021@google.com>
Content-Type: multipart/mixed;
 boundary="------------A17BA6B9593651BEE9AA1B58"
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0291.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::15) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
Received: from localhost.localdomain (2001:a61:425:1e01:37df:5ff4:225f:85e0) by AS9PR06CA0291.eurprd06.prod.outlook.com (2603:10a6:20b:45a::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend Transport; Thu, 25 Nov 2021 13:37:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0011fdc6-cac0-411e-ac40-08d9b018ad0e
X-MS-TrafficTypeDiagnostic: DB8PR04MB7019:
X-Microsoft-Antispam-PRVS: <DB8PR04MB7019184F6F30A81EC5A3426CC7629@DB8PR04MB7019.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iIyB8ifZilsAx4xx5pfrt7DnyHewS5GAFJ1SgvPJwiNmuP/cn9YdKigzbYk/AiAp6gYSerM6vJAY4KgqpHV+zT38G70JRwS8KlUmElKerdVxOoJ4xKm38trnXf2hpSsqgdu+1m2H/U0MtaLkKYHkO4X44dRitEbQQW/GYs629is4VsAhqr583H0SB/6aMY3WhLksGrdpDEalyQtedSCoVwmS68AO5Bewh4fCqHR66k8JPrDe6g9JhTqquGYQBusenuJAHONEHoF6G4u63w31q2cTafVeBHv67rvb6gmn5jyehxYCyPzv4Lg3ZD2nnFlYKD+Kg/3+W5zmNLKT4XJvaLCKHxkVRiCPsBSrpN4bYtvaQ0TxGdKyh+73WT32fjvQ5Z7iajRdxR5RJipBVVycKYWx8xL+XhVCHOp+/0L7mFRhmzy3PbKPqSHxhRaE3bloSCbsq8AHtaC36904siMnV3n3y+oGLQVIjOgkathUflGRcFAlt+czAMDgzrTccSL6SW4o/zsfu2/GdYAXCR7x4ffdYMQtFJL1DJPqTUJF0iPdAm3sGWgCnYtomEOPgBgiST0MvLNH5fhckp2PD3TlGEY6gDedEPpHL4RdwUSI6bRG1VEN3i9rJPHsgb4kAvsMWK/AtDyCi6piKVQXJtzHsdLdP0rx5N4zbxxSFZhKqK3PSy40LEZvE2i9x7DKrowu3rBVffdXgXd+WPMH6YaqrMb5hObh6TRewmhkksO2Hxf2neEpQ04tWZPEaW75ehiW8Gs9CoXDK7Ey3ppUs+J+TEAGoOgryko/YcBL20LhLqUuSVXEaOBSXalsbUYI+QumrYMGluPaiHfXoD36a99LziAq4glZ4Pbmx6//TE9/s2PHCbxSrfw6G1icaCy0LYkk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(31696002)(966005)(6486002)(316002)(508600001)(31686004)(86362001)(66946007)(8676002)(38100700002)(53546011)(66556008)(6506007)(66476007)(235185007)(6512007)(36756003)(2906002)(186003)(2616005)(8936002)(33964004)(99710200001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z29rck5DazdPNlNkbmMwUktPQVlhdDFwbzRhV1Q0MnA4V25oVjE1YytkM1dC?=
 =?utf-8?B?aWFMdnpwZFpmS0VQSSs1UVI0WDF3b1JqaXdaNWFxZy9MaEtvOXdXOXp6emdt?=
 =?utf-8?B?WmJkdnRLNXFDcDVRa1RXc09QeHZyM0s2ZGI2MlZnRGxxZEU1VnlnR2YyQUhG?=
 =?utf-8?B?Ynd3S3NGaUcrbTdNTXZndzZnMlc5YzJkUnNzMWdmNHl2Zk55MHd1TjhZK3hi?=
 =?utf-8?B?cXVrNGp4Wjh5Wm0zeEpvM0Rhem9zOHcrdGxXMThVTklXZmlqMjRGTW9ZVzZ4?=
 =?utf-8?B?aXhEbFZFaVdzTmE2ZTRwSE1HRGxvUzJlK0MzOHl6aE40cmFkTWlrSnFteE9Y?=
 =?utf-8?B?eEE4NGZJMEZ6ZURnUEZrRVI0c3JWaFczVFpnUjVOUk1tcUtlQk9SUEZtQzRQ?=
 =?utf-8?B?dldKSCtwUTBvbFhhbWhLLzZ0cGxlVG43NC91SzQxWmNJNzBFc2hjVUN6Q01D?=
 =?utf-8?B?TjVPM0hYWlNVMDdwSm1DWi9EblZRaDBqT0RtVDZsa0hFWG1JblBReUhWamFJ?=
 =?utf-8?B?dEZ5dllJT1QyV0RkZEZBTWJrdFd0N001eHNxTmhiNkJ3ajlIVVE1UmJIN3pn?=
 =?utf-8?B?WXkzbmdacW9WQnpVSkN5SG5VTnMzTTBFOFBZaDBoKzhicG1yY0FsWklOZmtK?=
 =?utf-8?B?ZWo2cG5RWVJqM0wwaWgzSGpEbDF4TWphV0ZSWWtzV1VDTHdoa0JlMkJiMEND?=
 =?utf-8?B?dnNIV28weVg5Ymg4QTRRdDFGUWZNRFJCVDZLWFE3UjBkdENrdEQzckkwYWJy?=
 =?utf-8?B?L3BzVTV6N2d5dFhCbXg1Zm1ybVRXVDdyL21RWmlQT3BQSVJ6WStydEdIUEJZ?=
 =?utf-8?B?YTZWNjFyRXFETmQyN0dMbkZUM0kwT3pFRVRiWGZyS2d3YkUwTUFTd0hOdk1B?=
 =?utf-8?B?bUxMa00rR29vQW8rcWNaY1FHS0o3U0s2Y0Z0VWdPZWhSNDFFL2wrZlB4MXZz?=
 =?utf-8?B?Z0pTZEpHYmZGbWlqVUg1YkJUanZKQWNMaElDTm1aRmxsN2s4SEN6L09DWnRh?=
 =?utf-8?B?Y2V4ZU5GYkRVUFJnRnJiVzQ4Q1czYXNJYzJkdEI1YXo4UnZObmRpMHYzWGZE?=
 =?utf-8?B?VDNPbVBKOW1wSWhtdVFsUEI2UjFYZWtFN3dOVE1MMG02UEFNNzlNM0ZVNnpY?=
 =?utf-8?B?SlRrR2pRdWQvdU9UcEE0OWh6Zy82a1BLK2w3UEZ2a2dPdzJuOXdNUGM0all1?=
 =?utf-8?B?RTNwaWhCTnZZeWdNS2N6OXp0OTc3emZTQ2dEWDNFRTFjUGx0b2tpeld3WXAz?=
 =?utf-8?B?YWxuaFZnVDArUUJQakRWaGY2YytsWThEdFNkdGhpaXA2ZCs2Rmw1YmQyN0NG?=
 =?utf-8?B?b1QzS1F4OVk2c05CTWFZdzUwNGgxOTQ0QTMvV3ZlanArb1ZtR1YwaFZZdzZu?=
 =?utf-8?B?L0UrSTdPKzBva2FRRks2WEtrdG5QQ2YyT3V4Y1lYaUh4d2tZQWFsKy8vaCtr?=
 =?utf-8?B?aDh5eDl5aWQxaEZuOHVXTmQ0WlZHWkFsZFhJNUhPZFdCT2lYVWJBcHd3ejNr?=
 =?utf-8?B?TzRCZzlXUm9Wczk4RlJmRXhtWUxLRUU4SEd4TEVTaWxRWE1CckZodDROMkhr?=
 =?utf-8?B?U21NelZpa0h6c1pERThUcXJkcVA4ZjgxelBIMllMMGRqeDNXeWRnWG92Rm9t?=
 =?utf-8?B?eUF0K1BTZUFPUk10ZFl6T1dDS1BnODl6c1cvZnpyTjFwWXFOZDBqanVtQXZU?=
 =?utf-8?B?VzZzL00zRkFXVDZNWVo1OHR1RlRReHRPbXVySERqOXE2L2ZpY3BkTUdJTm9u?=
 =?utf-8?B?cGZnVkRuaGlxa2wrMzRpejJnS0FzYStieVhJRnVxVUpDaUY0ZFo3ZTFhclpM?=
 =?utf-8?B?QkNVdkw1NkpyRFBNb2d6YWtPaHkrS1FYbFMrZEZ6WVBHSmRteUtkK2Y0enlx?=
 =?utf-8?B?RncrcUdtSVBJL0Z3VXhtNGZJc0M3Y2E2OUcxQzNNL1hiSzV4MUF6aHY5eXlJ?=
 =?utf-8?B?Z251SFEyWWE1WG1LRWw0K1dMcmpCbGgyV1RDSi9BR2gxZFcyVUwyT0R2SzVP?=
 =?utf-8?B?SUVMOXNUT1YzZlpMcFZoNnZEQ0pkK3ZMblZ0M012blYrbGdQNFBWMW5JUUlO?=
 =?utf-8?B?eFR4Q0xkbURJTEUxVnFESVIyME9oanlpTG5IaHdZUGwwL2xYanBTcTVpSElP?=
 =?utf-8?B?T2NheXdJbjZZWFVjNXA4cjRoUW9BSUNJMUhUbGNMWFkydWEwQmxFaEFkSkw1?=
 =?utf-8?B?dmpYeml1NEd6N2NCQ0QzbnBTOHhpbW5jOTFWZVdLb1hlQ3RqcXRPem9KeFFO?=
 =?utf-8?Q?mD2VYyFOJMWL3PUO/p1MBOBQSNCb2MvVK9RdojmyaQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0011fdc6-cac0-411e-ac40-08d9b018ad0e
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 13:37:08.1657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NhzsUOHsEDw6HDgeihmKU5jxI+pAVvuLDhuVweE+ediKR8Wwla3Wc2gfjDvC4H5S8Vw2+AA+vVCZ7SuGdUxVWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7019
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--------------A17BA6B9593651BEE9AA1B58
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


On 15.11.21 08:28, syzbot wrote:
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    048ff8629e11 Merge tag 'usb-5.16-rc1' of git://git.kernel...
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> console output: https://syzkaller.appspot.com/x/log.txt?x=1480ade1b00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d6b387bc5d3e50f3
> dashboard link: https://syzkaller.appspot.com/bug?extid=63ee658b9a100ffadbe2
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1313cb7cb00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16a2f676b00000
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+63ee658b9a100ffadbe2@syzkaller.appspotmail.com
>

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
048ff8629e11





--------------A17BA6B9593651BEE9AA1B58
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usbnet-sanity-check-for-endpoint-types.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-usbnet-sanity-check-for-endpoint-types.patch"

From 3b37ae884eb41dd5db62946a5c289f86b46195bc Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Thu, 18 Nov 2021 18:15:03 +0100
Subject: [PATCH] usbnet: sanity check for endpoint types

A malicious device can pretend to be a device with a known
configuration of endpoints yet present endpoints of the wrong type.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/net/usb/usbnet.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 9a6450f796dc..9aa4dc00f64b 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -91,6 +91,26 @@ static const char * const usbnet_event_names[] = {
 	[EVENT_NO_IP_ALIGN]	   = "EVENT_NO_IP_ALIGN",
 };
 
+bool usbnet_validate_endpoints(struct usbnet *dev, struct usb_interface *intf, const struct driver_info *info)
+{
+	struct usb_host_interface *alt = intf->cur_altsetting;
+	struct usb_host_endpoint *e;
+
+	e = alt->endpoint + info->in;
+	if (!e)
+		return false;
+	if (!usb_endpoint_is_bulk_in(&e->desc))
+		return false;
+
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
@@ -1772,6 +1792,8 @@ usbnet_probe (struct usb_interface *udev, const struct usb_device_id *prod)
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


--------------A17BA6B9593651BEE9AA1B58--


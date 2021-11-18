Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C25445615D
	for <lists+linux-usb@lfdr.de>; Thu, 18 Nov 2021 18:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234090AbhKRRX5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Nov 2021 12:23:57 -0500
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:24468 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234082AbhKRRXz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Nov 2021 12:23:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1637256053;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=j4YZkDstgPG4AjNeUvgxTnFrWpYXZkFADzyfAUz2PWc=;
        b=akjcCpj3DrXh43ek7Q2M+OtGFQ1amjvWoPRX6wBzGyde3JTD6FRDA6yIazB0KncdyF4udQ
        7IZsZIG6lBWebc+3UybFil0rkeykkiWYb6GB7y7/mhwtCJ+JFO0AsKPJm8Sd8RnlBF3XQi
        1USFLaAeYWOvqjrjbRHwgmB195wz6Zo=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-YpsuYt82PqeVMBDRmJELCw-1; Thu, 18 Nov 2021 18:20:52 +0100
X-MC-Unique: YpsuYt82PqeVMBDRmJELCw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUKgUd4pv9yVg1EH8Yx8+co8DeXuti3sNgPrZPli8KL17zMtjqSoaReJotlgCgkSEHVz/QHdBV5QwYMaB+z5KXFcLqS1GaSKySvJ1Oxxp3E+kjXy1pP1W6/DIALxQcnzd0e8yFrz/D93tdxhYs6n5X/ypcHpVIjLZOZjkdP3dFjMptzUPjNzh2Bcgo/n90HuHVGNZctfnJ4UTN6YTkHz7AB2Y0u9CSV1t+9NULlK2zBigjXhKmxlH3qtLM3xvmQ8yu6JtKMhi8hwjR9OxxfV3q9Lk5nkUtOYJoX4Ds13WR7TQc7z6+pkO5WBUMyb/k5/KtpVvPaZ7TaT62DjzkTZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4YZkDstgPG4AjNeUvgxTnFrWpYXZkFADzyfAUz2PWc=;
 b=jf/R/DZbM9Z/m/TXPbRjhLN/cNYYxDNoCjhfVkorclhqlYGGiH8n06AYdRIO3qgmuFQ6+ga2zvmv7rcgQDX1LYxxbKwwyB7NdrEbEw2DAJVKCZ7MklL9KrM+y+ncp0ZCWoj37Sn5TtcJRHpWX2daXHqSiwoYkzKYyBNSdXBg/bRFojUeS3RJe3c6lMOmZoRv1WLMDxEVhNqPjhk9ypVoFVtNwAZL/pJRAL6FwvHs6LFxecV7Vni17iVxirJb/rJmWFUARLRhe9Zg7zqQdN5vkYT/hAOfUjzkM1ROtldtdNJHl29KEOiWO1CenNAujP9zdcdvlRGQtImLTYzCXz+UiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DB6PR0402MB2823.eurprd04.prod.outlook.com (2603:10a6:4:95::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 17:20:51 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::498c:7447:2e17:4a42]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::498c:7447:2e17:4a42%4]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 17:20:51 +0000
From:   Oliver Neukum <oneukum@suse.com>
Subject: Re: [syzbot] WARNING in usbnet_start_xmit/usb_submit_urb
To:     syzbot <syzbot+63ee658b9a100ffadbe2@syzkaller.appspotmail.com>,
        kuba@kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
References: <000000000000a56e9105d0cec021@google.com>
Message-ID: <208f1478-42b2-9db2-4a81-dc8f64bbabbc@suse.com>
Date:   Thu, 18 Nov 2021 18:20:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <000000000000a56e9105d0cec021@google.com>
Content-Type: multipart/mixed;
 boundary="------------620591C5615B64A9B1A4DB0B"
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0278.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::18) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
Received: from localhost.localdomain (2001:a61:425:1e01:b634:a5b7:1231:908b) by AS9PR06CA0278.eurprd06.prod.outlook.com (2603:10a6:20b:45a::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend Transport; Thu, 18 Nov 2021 17:20:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ade0263c-3a3e-4c90-e8a3-08d9aab7c4cd
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2823:
X-Microsoft-Antispam-PRVS: <DB6PR0402MB2823BD408012A877A28D596CC79B9@DB6PR0402MB2823.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9sM/IYEWiSh52d/N9+Bd+SA9ebhwV5javrLIywvPFdU8UW+TiBFEy4yXo5/w8oFaFpEdY1tFs55kcThBekxt3O30B76p776v4Aqmh5TW+iPSrDNK1qDZgVJ6rLwnG9rpca4k4Hz6lzYIk2yyUKfEWgSi5ZO+eVfYp5tTzhsDHXmnZ9G+sK2RTkezI7nc27QKfnJ20VgItQFlI/7Bo6A2QtRlxf4aOcvydkqky/nbZ0LCTje2PJVjDXRG21tKDmo5B9rjdiJfXwIAxvhmhWzZOYWpC19dBdkx1456ldU0johBnPL7f1qEV/32n9f2YWjfuvZek9nlRogq3lct2+Ko733w9Z72jfEGURIZ7oYeonECw+X303gtuK2ygaVh/MHojLRAAvE6VbAanu51sDASG6Vm6tg6qNTbCkYIl6mEsSlqo1wwhBhiYLDBd08r563eV+BOYpfeDcxXio4KGsPnIabqJKzUu6A/iGOOPuQgit/lmbeS4adndsqzhgKMZBrMTtWldOTUjypRnffL5aaL/Qmus6wUKtcMcmkYU1RKULxJOHkbjqUmoLEKscPECn2PI/5HNwPeg7QbqmOWqQIw0mQ0dmsvoqUlz7u70JDFZvYK39DM6GOML+7nddr2HGekUnVHUvkVpwyDPxU4urnQwSHikbPbOT5cyj9MnTm2ScMZPsZrImNNXEH2RaZ/IoGui5hPPki7cj4X8dyGD4mhWhDAawrlbCploWxXvNomyCOWPzqcMEdlAebYUi3QCq1TDJW5t/YHvHhkuXVXS3tz+gQzdLjrv2bXmS5KJqm+sBWpzPaME18kUeDonXxFMWcnUGa0sk234R1DIIcGAMjZsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(6512007)(36756003)(86362001)(53546011)(5660300002)(2616005)(33964004)(186003)(66556008)(66946007)(6506007)(508600001)(66476007)(966005)(31696002)(31686004)(8936002)(316002)(235185007)(8676002)(38100700002)(2906002)(99710200001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?by9FanFrUCtSdWtkL1VGbDBDbHJNd21DTVJTNDNPOTY4byttc3BpQ2JjcHA5?=
 =?utf-8?B?RVQ1dTRDZXh5VXR4VEFrb1JaM0ZtRWpMSFZ5VEJSYURwOExKSGQ2Tzh6NlNx?=
 =?utf-8?B?RmEydVhHWkkxQnRwNW5QN29vSm1WS25Oc1BCdjNKemNIblExY2UvMUhYTDI3?=
 =?utf-8?B?ek5mOTdRZGkwWW1Vc0VPUnVzc2hOYWtSY3pOcHNBMmhOQWczRGc4ckt4OGZy?=
 =?utf-8?B?ZGF4U0Noakl2NGpGYjBOYVNVdURIbHBlV0NvYysxeElHYzNnRllTUGlIZERE?=
 =?utf-8?B?UUpMeEhueGFjRjdKUTM5MXpKWkIvbUt3WWpsdkt2c3A2dzlTcmtwSlFXL0NH?=
 =?utf-8?B?M2Q3OFZkajhkVllIMmVFeWhYb0I5NGxmS2NFMGhybDJsVTZYNHFaYk1vZ0J0?=
 =?utf-8?B?U1RBMXdDdHNvQXFMQ0RGNXdDK012MDcrdHQ4ZVcwbGYrMW80dENZQ0p3SFh2?=
 =?utf-8?B?dUE3dTAyVlY2THFQQmNYYkswT1V6T3dabGZOSDI0dVVOaXBPa2JCdFZ1MkV1?=
 =?utf-8?B?ZEtmbTgrM1FjckkzeUQzVFlOZGZSTFBZTFVJV1dTdmxDc2ZBcVYzUGRwNTk2?=
 =?utf-8?B?aTgxTEs0ZU5Bb0xNZWlpOUVsdTBoTG9OaE5CMHQ3aFcra3AzSHlGc2hrdFJB?=
 =?utf-8?B?WERDdzhreTVVa3phdGRDb1l0RnpEemdXVVFXdFNhLzNGUGdVdldoZGVVMlAy?=
 =?utf-8?B?dnlvOTN4elZuWXgwdElUbkVxSTR4WGZrTXBKZTk2VzhwL0IxR0s0VFlDcVNE?=
 =?utf-8?B?RlRTbXpaOGs2NERobG84RGhwWnM0UURnVlhZeTRVWHhtV3VVVytFN0EwdVZm?=
 =?utf-8?B?OXJraG9FMWhudHdSemRRdmFua2JFZXJuYy9TOUtmamNjemxFSmoyN2J5Tk5W?=
 =?utf-8?B?WGszakJ2Y1IzOGltWVFDVjZQMmNRSnM1cytUZUo5Wi9oV0lXQTVsZUhldFJM?=
 =?utf-8?B?TjNIYTlKTVUyMTNSRnF6OExGLzI4MUoxWWFqQ3c5ZThtRWFZRFNTdHFXZUIw?=
 =?utf-8?B?bWhXQjJZQ3FybG84SkJhTmhIQlkwdzQzMTJjWUVjMEZTUWc1TUF0TjdNQlRB?=
 =?utf-8?B?QjN3czhPNEhDczRFU1MzMmpWWURFcTh4VWxDcE16UGlnRzJHL1VjKzZSUWEz?=
 =?utf-8?B?YXNoRVhVUm5BWGdNVmVzU25ZcFgyQzhVRnM2aDRSTDJaZHpGd3czR2ZncGlK?=
 =?utf-8?B?M1BjWEdmWDk1YkMxV1RQVzNZWXhIYWgrSVE4b1RHWXJqeWx2U0ZwbkxWNi92?=
 =?utf-8?B?dm13emREeGppRlppY0VvelhzcjF2Ly82N2JCOWY2SVJkSDRMdmxLTlZ2ZUVr?=
 =?utf-8?B?K2h5U2lMblhVYUt3V3pBOE9Vcm5PWVF2czZhcm1RMU1zU01EQnBNNlNRQ2NG?=
 =?utf-8?B?ZnFESmk2d29rVXJtckN3VzljaW5ZRUF0dm9UYUI1aDAyWFRVM00yRjIxcE5T?=
 =?utf-8?B?NnBoeTZTckhGSHZQMjRmbmhMSnR0S0kwYXZFR3Nnd29adHlUY25iUnY1UkZl?=
 =?utf-8?B?U0NvVTBTZzl0d3l6MnE3TFRTa1FpZzNxK3dMck5Yd1pYRHJzbm5vVG9NZVBy?=
 =?utf-8?B?STRveWlBenU3ZTVXT3A1UjA3ZloxTVdteURNYWlITTFjMzBNSjhpMXgyWHJ2?=
 =?utf-8?B?b3lhSW5IQTNGVEFVZ1VnTExJYmJBRTUvNjhsRTVablp3MVNkUjEwaUp0QkN3?=
 =?utf-8?B?Y0FRajNDT1lFTHM3dUFLUDJJTGpCSGp3ejZabjF3MUI4SzY5Q2xzR2Z0dGY2?=
 =?utf-8?B?V0p2aWdRNEdDb2Y1WUwzVWxlVkdyN01FWmMrMzlJSHA0ZjdETjVkMk1pUGhY?=
 =?utf-8?B?aVNlS3FaN0J0TTVNcmpiRjJzNXFiVk02Q0hRNzFwclRSYU05elZ5T2dydXdE?=
 =?utf-8?B?bTVGVFdmK05BS1JER0YyQTVta2VVZTF5M05DWmxQUmlXbTVWUmZjSDlMRlhz?=
 =?utf-8?B?cTZoU3p5NFJWeVVTR3djVEV2TllZVEZxYXdmTXJOaHlTaDd5THVld1MyNTVM?=
 =?utf-8?B?QUUybkdzcnZsUVVLWEwzRXU0TFJORFAyYTF3QmJTbDRxcW1hUit0ZVhYMU1w?=
 =?utf-8?B?dXJiQUlPc0lITUVMU2ViK3JiQU1hV1I2YVdTMForUWVlV0xxV1hMNzJIdStp?=
 =?utf-8?B?bnFZamEvL1VybUp4dGpualByNzdzeFhtS2ZKWnFWY3FkK05UM2txekFsbFVW?=
 =?utf-8?B?WVhCRVhJKzRWbWJDY1RLVjlXNEg5ZGgzUmFNSnZPdGl2NE03MUhJQmpibURQ?=
 =?utf-8?Q?H23RKtH+vuswiALAJrfSf4gSwpSqSPDocEMcFMfqs4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ade0263c-3a3e-4c90-e8a3-08d9aab7c4cd
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 17:20:51.0579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pyo7f7+hNo4xVQDkY6bkAd5CFFlH3MK51UrHL3J1c8rsrCDfKmYV3Uv2b5PqIFHHkhjFITVqf65BBMx+LcjiMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2823
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--------------620591C5615B64A9B1A4DB0B
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

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  048ff8629e11



--------------620591C5615B64A9B1A4DB0B
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usbnet-sanity-check-for-endpoint-types.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-usbnet-sanity-check-for-endpoint-types.patch"

From 2f7c84e39b74ae581bf7d01dbc69d820d09da20a Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Thu, 18 Nov 2021 18:15:03 +0100
Subject: [PATCH] usbnet: sanity check for endpoint types

A malicious device can pretend to be a device with a known
configuration of endpoints yet present endpoints of the wrong type.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/net/usb/usbnet.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 9a6450f796dc..aaa897e6ba29 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -1772,6 +1772,11 @@ usbnet_probe (struct usb_interface *udev, const struct usb_device_id *prod)
 	} else if (!info->in || !info->out)
 		status = usbnet_get_endpoints (dev, udev);
 	else {
+		/*sanity checks */
+		if (!usb_endpoint_is_bulk_in(&udev->cur_altsetting->endpoint[info->in].desc))
+			goto out3;
+		if (!usb_endpoint_is_bulk_out(&udev->cur_altsetting->endpoint[info->out].desc))
+			goto out3;
 		dev->in = usb_rcvbulkpipe (xdev, info->in);
 		dev->out = usb_sndbulkpipe (xdev, info->out);
 		if (!(info->flags & FLAG_NO_SETINT))
-- 
2.26.2


--------------620591C5615B64A9B1A4DB0B--


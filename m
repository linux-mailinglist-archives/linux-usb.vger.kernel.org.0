Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39249382A83
	for <lists+linux-usb@lfdr.de>; Mon, 17 May 2021 13:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236614AbhEQLGO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 17 May 2021 07:06:14 -0400
Received: from rtits2.realtek.com ([211.75.126.72]:57668 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236514AbhEQLGL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 May 2021 07:06:11 -0400
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 14HB4haC6010511, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36502.realtek.com.tw[172.21.6.25])
        by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 14HB4haC6010511
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 17 May 2021 19:04:43 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXH36502.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 17 May 2021 19:04:42 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 17 May 2021 19:04:42 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::1d8:ba7d:61ca:bd74]) by
 RTEXMBS04.realtek.com.tw ([fe80::1d8:ba7d:61ca:bd74%5]) with mapi id
 15.01.2106.013; Mon, 17 May 2021 19:04:42 +0800
From:   Hayes Wang <hayeswang@realtek.com>
To:     Du Cheng <ducheng2@gmail.com>
CC:     "David S. Miller" <davem@davemloft.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "syzbot+95afd23673f5dd295c57@syzkaller.appspotmail.com" 
        <syzbot+95afd23673f5dd295c57@syzkaller.appspotmail.com>
Subject: RE: [PATCH] net:usb:r8152: remove WARN_ON_ONCE() in rtl_vendor_mode()
Thread-Topic: [PATCH] net:usb:r8152: remove WARN_ON_ONCE() in
 rtl_vendor_mode()
Thread-Index: AQHXSZYnijfEKrk9KEGSw4IP26CYjqrnhPYw
Date:   Mon, 17 May 2021 11:04:42 +0000
Message-ID: <d43447c09d4e4f65b2357e7d779401a5@realtek.com>
References: <20210515142513.183623-1-ducheng2@gmail.com>
In-Reply-To: <20210515142513.183623-1-ducheng2@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.177.203]
x-kse-serverinfo: RTEXMBS06.realtek.com.tw, 9
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2021/5/17_=3F=3F_09:55:00?=
x-kse-attachment-filter-triggered-rules: Clean
x-kse-attachment-filter-triggered-filters: Clean
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36502.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 05/17/2021 10:49:00
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 10
X-KSE-AntiSpam-Info: Lua profiles 163686 [May 17 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: hayeswang@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 445 445 d5f7ae5578b0f01c45f955a2a751ac25953290c9
X-KSE-AntiSpam-Info: {Headers: Prob_stat_susp_url_only, url2}
X-KSE-AntiSpam-Info: {Tracking_one_url, url3}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: 127.0.0.199:7.1.2;realtek.com:7.1.1;syzkaller.appspot.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: Rate: 10
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 05/17/2021 10:51:00
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Du Cheng <ducheng2@gmail.com>
> Sent: Saturday, May 15, 2021 10:25 PM
[...]
> If from the userland, a dummy_udc (a virtual USB device for
> debugging/device emulation) is configured to have a
> VENDOR_ID/PRODUCT_ID
> combination that is supported by rtl8152 driver, and kernel tries to
> match this dummy device with rtl8152 driver by probing, the
> rtl8152_probe() function will cause WARN_ON_ONCE() in rtl_vendor_mode().
> This causes kernel panic if panic_on_warn is set.
> 
> More specifically, this WARN_ON_ONCE() is triggered when the rtl8152
> driver detects (and trys to switch on) the vendor specific USB
> configuration, which is an expected behavior for supported USB devices.
> Rtl8152 should also anticipate dummy_udc which can have arbitrary
> configurations and interfaces.
> 
> Remove this WARN_ON_ONCE() so that rtl8152 is able to handle (or
> gracefully refuse) an unsupported USB device during probing.
> 
> Bug reported by syzbot:
> https://syzkaller.appspot.com/bug?id=912c9c373656996801b4de61f1e3cb326f
> e940aa
> 
> VENDOR_ID/PRODUCT_ID in question:
> REALTEK_USB_DEVICE(VENDOR_ID_MICROSOFT, 0x0927)
> 
> Reported-by: syzbot+95afd23673f5dd295c57@syzkaller.appspotmail.com
> Signed-off-by: Du Cheng <ducheng2@gmail.com>

Acked-by: Hayes Wang <hayeswang@realtek.com>


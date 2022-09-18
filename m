Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA115BBDC5
	for <lists+linux-usb@lfdr.de>; Sun, 18 Sep 2022 14:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbiIRMZs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 18 Sep 2022 08:25:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiIRMZr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 18 Sep 2022 08:25:47 -0400
Received: from m15113.mail.126.com (m15113.mail.126.com [220.181.15.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4F1DD1ADA2
        for <linux-usb@vger.kernel.org>; Sun, 18 Sep 2022 05:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:Mime-Version:Message-ID; bh=PkJPa
        9WOdyQBc9ZrZ8P8Y1l7eXQzAhXJH7x55lA0BXM=; b=PsiSnXlmKMKH0z58wWIKI
        Guo2anFj/ZkkIHLuJe9wX6TCH+Vh3CpqPZtqhIEGlIGvVB5aL8ajONIphuXeUseG
        ZhdCWKtBh2Vt/ZPnQDpZVCltz6HNp5KslM9DaCDit7LSIDRK+TSaELeub09yupa8
        7PvcfMA0szAbo1soDZey4U=
Received: from 0V5ZS2WE6VIK6H0 (unknown [117.143.49.40])
        by smtp3 (Coremail) with SMTP id DcmowACHj8c4DidjbKoyBw--.16335S2;
        Sun, 18 Sep 2022 20:25:29 +0800 (CST)
Date:   Sun, 18 Sep 2022 20:25:30 +0800
From:   "zhongling0719@126.com" <zhongling0719@126.com>
To:     "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
Cc:     "Greg KH" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Re: [PATCH v6 2/3] usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS
References: <1663210188-5485-1-git-send-email-zenghongling@kylinos.cn>, 
        <YyN9u7EaXIKgLUmO@rowland.harvard.edu>, 
        <2fcdca5a-2deb-66ca-fd1d-c3ba719b19af@126.com>, 
        <YySwhOccJFjfx/Tu@rowland.harvard.edu>
X-Priority: 3
X-GUID: 632D1702-2BC1-4442-9D7E-538D1495ECA7
X-Has-Attach: no
X-Mailer: Foxmail 7.2.16.188[cn]
Mime-Version: 1.0
Message-ID: <202209182024288331579@126.com>
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: base64
X-CM-TRANSID: DcmowACHj8c4DidjbKoyBw--.16335S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Xr1UKr4DCFW8Gw1UGrykXwb_yoW8JryDpF
        Zxt3sI9F4qyryavF4DJayIgFy7X3s5Jw4fJrn7Jw109FZ09F95Kr1agw1xurWDWa43Jr15
        ArW8Jr15Gw4DtFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRniSQUUUUU=
X-Originating-IP: [117.143.49.40]
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/1tbiYBqA0FpEJABYRwAAsP
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SSBjaGVja2VkIHRoYXQgdGhlIGRldmljZSBtYW5hZ2VyIHdhcyBub3QgbG9hZCB0aGUgdWFzIGRy
aXZlciwgQW5kIHRoaXMgbG93ZXIgd3JpdGUgc3BlZWQgZm9yIHdpbjEwIGRvZXNuJ3Qgc2VlbSB0
byB1c2UgdWFzIHByb3RvY29sIGZvciB0aGlzIGRldmljZS4KCgp6aG9uZ2xpbmcwNzE5QDEyNi5j
b20KwqAKRnJvbTrCoEFsYW4gU3Rlcm4KRGF0ZTrCoDIwMjItMDktMTfCoDAxOjIxClRvOsKgbmFu
YQpDQzrCoGdyZWdraDsgVVNCIG1haWxpbmcgbGlzdApTdWJqZWN0OsKgUmU6IFtQQVRDSCB2NiAy
LzNdIHVzYi1zdG9yYWdlOiBBZGQgSGlrc2VtaSBVU0IzLUZXIHRvIElHTk9SRV9VQVMKT24gRnJp
LCBTZXAgMTYsIDIwMjIgYXQgMDI6NTU6NTVQTSArMDgwMCwgbmFuYSB3cm90ZToKPiBIaToKPgo+
wqDCoMKgwqAgb2ssSSBoYXZlIHVwYXRlZCB0byB2Ny4KPgo+wqDCoMKgwqAgU29ycnkgLCBUaGUg
aW5mb3JtYXRpb24gaW4gdGhlIHByZXZpb3VzIGFuc3dlcnMgYWJvdXQgdGhpbmtwbHVzKDB4MTdl
ZiwKPiAweDM4OTkpIGNvbWVzIGZyb20gdGhlIHRlc3Rlciwgd2hpY2ggaXMgc29tZXdoYXQgY29u
ZnVzZWQuCj4KPsKgwqDCoMKgIEkganVzdCBnZXQgdGhlIGRldmljZSBmcm9tIG90aGVyIGRlcGFy
dG1lbnQgYW5kIHRoZSBkZXRhaWxlZCB0ZXN0IGRhdGEKPiBhcmUgYXMgZm9sbG93czoKPgo+Cj4g
VGVzdCB0aGUgdGhpbmtwbHVzKDB4MTdlZiwgMHgzODk5KSBzcGVlZCBieSBnbm9tZS1kaXNrLXV0
aWxpdHkgdG9vbC4KPgo+IGxpbnV4KGxvYWQgdWFzKe+8msKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGxpbnV4KG5vdCBsb2FkIHVhcyk6Cj4KPiByZWFk77yaIDM5NC4yIE1CL3PCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVhZDrCoCAzODIuMiBNQi9zCj4KPgo+IHdyaXRl
OsKgIDM3Ny40IE1CL3PCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3cml0ZTrCoCAz
NDcuOCBNQi9zCj4KPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Cj4gd2luMTAobG93ZXIgdGhh
biBsaW51eCxidXQgbW9yZSBzdGFibGUpOgo+Cj4gcmVhZCA6IDM4OC4xIE1CL3MKPgo+IHdyaXRl
OiAzMjDCoMKgIE1CL3MKPgo+Cj4gVGhlIG1haW4gcGVyZm9ybWFuY2UgZGlmZmVyZW5jZXMgaXMg
d3JpdGUgc3BlZWQuYnV0IGxvYWQgdWFzIGNhbiBjYXVzZSBlcnJvcgo+IGFmdGVyIGxvbmcgcnVu
LCBub3QgZ29vZCBjb21wYXRpYmxlIHdpdGggdWFzLCBTbyB0d28gYm9zc2VzIGNhbgo+IGNvbnNp
ZGVyYXRpb24gZm9yIHRoZSB0aGlyZCBwYXRjaCBpcyBpdCBmZWFzaWJsZS4KwqAKSXMgdGhlcmUg
YW55IHdheSBmb3IgeW91IHRvIHRlbGwgd2hpY2ggcHJvdG9jb2wgV2luZG93cyB1c2VzCih1c2It
c3RvcmFnZSBvciBVQVMpPwrCoApBbGFuIFN0ZXJu


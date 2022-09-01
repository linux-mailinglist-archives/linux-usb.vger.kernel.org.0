Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99CB35A9B78
	for <lists+linux-usb@lfdr.de>; Thu,  1 Sep 2022 17:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233225AbiIAPWo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Sep 2022 11:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232489AbiIAPWm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Sep 2022 11:22:42 -0400
Received: from m15112.mail.126.com (m15112.mail.126.com [220.181.15.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2E5F4647E2
        for <linux-usb@vger.kernel.org>; Thu,  1 Sep 2022 08:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:Mime-Version:Message-ID; bh=75xdU
        LdG1ZT4GjfSYpVZMHEZfafkztB6bCGEKzl4Ck4=; b=jLmKorTTDzPoPpAc4kBsG
        hVuEyjuy/j+OjwH1F/ZjWFJPhXciw1iE7v3XYheTtOpvHKp7dlOBciAmigpomlQh
        meByncbZzu/6USBYw+THnGJFpy5D+2T7D2UDtRbnvl657HGBwAkkPNUU6Di/IgyK
        cczn32dXJdOL+JaABqFJn8=
Received: from 0V5ZS2WE6VIK6H0 (unknown [120.204.148.63])
        by smtp2 (Coremail) with SMTP id DMmowADnJrP1zRBjb+NiAg--.28175S2;
        Thu, 01 Sep 2022 23:21:26 +0800 (CST)
Date:   Thu, 1 Sep 2022 23:21:28 +0800
From:   "zhongling0719@126.com" <zhongling0719@126.com>
To:     gregkh <gregkh@linuxfoundation.org>
Cc:     zenghongling <zenghongling@kylinos.cn>,
        stern <stern@rowland.harvard.edu>,
        linux-usb <linux-usb@vger.kernel.org>,
        usb-storage <usb-storage@lists.one-eyed-alien.net>
Subject: Re: Re: [PATCH v4] uas: add no-uas quirk for Thinkplus and Hiksemi usb-storage
References: <1662015653-12976-1-git-send-email-zenghongling@kylinos.cn>, 
        <YxBvNEn0jEEd0lXV@kroah.com>, 
        <2022090120371974113815@126.com>, 
        <YxCtyOUkRlIqcC4d@kroah.com>, 
        <2022090121570194160929@126.com>, 
        <YxDCdQ885wdyr8wG@kroah.com>
X-Priority: 3
X-GUID: 5597AAF0-0B69-4EEC-BC04-736015EB9E8B
X-Has-Attach: no
X-Mailer: Foxmail 7.2.16.188[cn]
Mime-Version: 1.0
Message-ID: <2022090123202674417144@126.com>
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: base64
X-CM-TRANSID: DMmowADnJrP1zRBjb+NiAg--.28175S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFy7AF1kKF4kXr45tw4fXwb_yoWktFc_uw
        srAay09w1kCa17Cr12kFsrGrWYqayqgw4fXFyfGr4IkryFvFn8WaykK34xZrWrZws5Gr95
        Ja4YvrW8Ww1j9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRMhFx7UUUUU==
X-Originating-IP: [120.204.148.63]
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/1tbiuR1v0FpD+bgnvwABsa
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

c29ycnksIEZhbGxpbmcgYmFjayB0byBVU0IgbWFzcyBzdG9yYWdlIGNhbiBzb2x2ZSB0aGlzIHBy
b2JsZW0sIHNvIGlnbm9yZSBVQVMKZnVuY3Rpb24gb2YgdGhlIGNoaXBzLiBJIGRvbid0IGludmVz
dGlnYXRpb27CoGZvciB3aW5kb3dzIHN5c3RlbS7CoAoKClRoYW5rcyEKCnpob25nbGluZzA3MTlA
MTI2LmNvbQrCoApGcm9tOsKgZ3JlZ2toCkRhdGU6wqAyMDIyLTA5LTAxwqAyMjozMgpUbzrCoHpo
b25nbGluZzA3MTlAMTI2LmNvbQpDQzrCoHplbmdob25nbGluZzsgc3Rlcm47IGxpbnV4LXVzYjsg
dXNiLXN0b3JhZ2UKU3ViamVjdDrCoFJlOiBSZTogW1BBVENIIHY0XSB1YXM6IGFkZCBuby11YXMg
cXVpcmsgZm9yIFRoaW5rcGx1cyBhbmQgSGlrc2VtaSB1c2Itc3RvcmFnZQpBOiBodHRwOi8vZW4u
d2lraXBlZGlhLm9yZy93aWtpL1RvcF9wb3N0ClE6IFdlcmUgZG8gSSBmaW5kIGluZm8gYWJvdXQg
dGhpcyB0aGluZyBjYWxsZWQgdG9wLXBvc3Rpbmc/CkE6IEJlY2F1c2UgaXQgbWVzc2VzIHVwIHRo
ZSBvcmRlciBpbiB3aGljaCBwZW9wbGUgbm9ybWFsbHkgcmVhZCB0ZXh0LgpROiBXaHkgaXMgdG9w
LXBvc3Rpbmcgc3VjaCBhIGJhZCB0aGluZz8KQTogVG9wLXBvc3RpbmcuClE6IFdoYXQgaXMgdGhl
IG1vc3QgYW5ub3lpbmcgdGhpbmcgaW4gZS1tYWlsPwrCoApBOiBOby4KUTogU2hvdWxkIEkgaW5j
bHVkZSBxdW90YXRpb25zIGFmdGVyIG15IHJlcGx5PwrCoApodHRwOi8vZGFyaW5nZmlyZWJhbGwu
bmV0LzIwMDcvMDcvb25fdG9wCsKgCk9uIFRodSwgU2VwIDAxLCAyMDIyIGF0IDA5OjU4OjAzUE0g
KzA4MDAsIHpob25nbGluZzA3MTlAMTI2LmNvbSB3cm90ZToKPiBTb21lIFVBU1AgY2FwYWJsZSBV
U0ItdG8tU0FUQSBicmlkZ2UgY29udHJvbGxlcnMgYXJlIG5vdCBjb21wYXRpYmxlLHRoaXMgcHJv
YmxlbSBoYXMgYWx3YXlzIGV4aXN0ZWQuCsKgCldoYXQgcHJvYmxlbSBpcyB0aGlzIGV4YWN0bHk/
wqAgV2h5IGlzIHRoaXMgZmFpbGluZyBvbiBvbmx5IExpbnV4PwrCoAo+IHlvdSBjYW4gcmVmZXIg
dG8gb3RoZXIgYXV0aGVyIHN1Ym1pdCB0aGUgc2ltaWxhciBwYXRjaC4KwqAKV2hhdCBvdGhlciBh
dXRob3IgYW5kIG90aGVyIHBhdGNoPwrCoAo+wqB0aGlzIHBhdGNoIGlzIGZpeGVkIG5vIHNwZWVk
LG5vdCBzbG93IHNwZWVkLgrCoApJIGRvIG5vdCB1bmRlcnN0YW5kLCBzb3JyeS4KwqAKdGhhbmtz
LArCoApncmVnIGstaA==


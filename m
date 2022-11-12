Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2C66267BE
	for <lists+linux-usb@lfdr.de>; Sat, 12 Nov 2022 08:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233223AbiKLHqq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 12 Nov 2022 02:46:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbiKLHqo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 12 Nov 2022 02:46:44 -0500
Received: from m15111.mail.126.com (m15111.mail.126.com [220.181.15.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0E8D710C6
        for <linux-usb@vger.kernel.org>; Fri, 11 Nov 2022 23:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:Mime-Version:Message-ID; bh=xMaPZ
        zTmWmjAKVmcKLkpNgUBCX5ThbhZg5LW8J88JT8=; b=L3vi+kYAX1u42RSoCLMGt
        EOJtfw9f9tAZ+pNAbld5jQpU2c12mczcCkA6Tf6kdZf9G4fWp+5iKl7kOySiIa1R
        tnYDJULd3l49Amea9X3sb+NkcnVZYSB4D2b64ASJ/F3J5kA2o2pgnkCGEUtMjBzC
        WuahhpkG/LEU0eWiOw8eco=
Received: from 0V5ZS2WE6VIK6H0 (unknown [117.136.119.120])
        by smtp1 (Coremail) with SMTP id C8mowACXiHwbT29jKw_sEA--.57354S2;
        Sat, 12 Nov 2022 15:45:33 +0800 (CST)
Date:   Sat, 12 Nov 2022 15:45:36 +0800
From:   "zhongling0719@126.com" <zhongling0719@126.com>
To:     "Greg KH" <gregkh@linuxfoundation.org>,
        "Juhyung Park" <qkrwngud825@gmail.com>
Cc:     "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "usb-storage@lists.one-eyed-alien.net" 
        <usb-storage@lists.one-eyed-alien.net>
Subject: Re: Re: [PATCH v6 2/3] usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS
References: <1663210188-5485-1-git-send-email-zenghongling@kylinos.cn>, 
        <fa0556e5-e154-a4e6-6b18-4996a01d2f10@gmail.com>, 
        <Y2uDnUQKCDGzioJN@kroah.com>
X-Priority: 3
X-GUID: E7E7C3A1-8A68-457C-AAC2-05F896A69D96
X-Has-Attach: no
X-Mailer: Foxmail 7.2.16.188[cn]
Mime-Version: 1.0
Message-ID: <2022111215445443712314@126.com>
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: base64
X-CM-TRANSID: C8mowACXiHwbT29jKw_sEA--.57354S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur1xur47WFWUXr15Ww1rWFg_yoW8Wr1xpF
        WDtFWYyrs5Kr1rArykAw4xZrWrXws3G3yxGr93A348Zrn8uFn2qr4xtFWUuF9IqryxK3Wa
        9ayqgry0gws8Cw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziS1vfUUUUU=
X-Originating-IP: [117.136.119.120]
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/1tbiqB630FpD+8MpNwAAsu
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        RCVD_IN_VALIDITY_RPBL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGk6CsKgIFRoaXMgZXJyb3Igbm90IGhhcHBlbmQgb24gYWxsIFJUTDkyMTAsVGhlIHVhcyBibGFj
a2xpc3Qgb25seSBmb3Igb24gc2FsZSBkZXZpY2UoMHgwYmRhLCAweDkyMTApLsKgCgpUaGFua3Mh
Cgp6aG9uZ2xpbmcwNzE5QDEyNi5jb20KwqAKRnJvbTrCoEdyZWcgS0gKRGF0ZTrCoDIwMjItMTEt
MDnCoDE4OjQwClRvOsKgSnVoeXVuZyBQYXJrCkNDOsKgSG9uZ2xpbmcgWmVuZzsgc3Rlcm47IGxp
bnV4LXVzYjsgdXNiLXN0b3JhZ2U7IHpob25nbGluZzA3MTkKU3ViamVjdDrCoFJlOiBbUEFUQ0gg
djYgMi8zXSB1c2Itc3RvcmFnZTogQWRkIEhpa3NlbWkgVVNCMy1GVyB0byBJR05PUkVfVUFTCk9u
IE1vbiwgT2N0IDMxLCAyMDIyIGF0IDAzOjE3OjQ4UE0gKzA5MDAsIEp1aHl1bmcgUGFyayB3cm90
ZToKPiBIaSwKPgo+IEknbSBzcGVha2luZyBmcm9tIG15IG93biBleHBlcmllbmNlIGJ1dCBSVEw5
MjEwIGlzIGFyZ3VhYmx5IHRoZSBtb3N0Cj4gcmVsaWFibGUgTlZNZS10by1VU0IgY29udmVydGVy
IGF2YWlsYWJsZS4KPgo+IENvbXBhcmVkIHRvIHNvbHV0aW9ucyBmcm9tIEpNaWNyb24gKG11bHRp
cGxlIHJldmlzaW9ucykgYW5kIEFTTWVkaWEsIFJUTDkyMTAKPiBnYXZlIHRoZSBsb3dlc3QgcG93
ZXIgY29uc3VtcHRpb24gKGZyb20gaW1wbGVtZW50aW5nIHByb3BlciBwb3dlciBtYW5hZ2VtZW50
Cj4gY29tbWFuZHMpIGFuZCB0aGUgbGVhc3QgaGVhZGFjaGUuCj4KPiBJIHBlcnNvbmFsbHkgb3du
IG11bHRpcGxlIGVuY2xvc3VyZXMgYW5kIG5vdCBvbmUgZ2F2ZSBhIHNpbmdsZSBVQVMgZXJyb3IK
PiBmcm9tIG11bHRpcGxlIHBsYXRmb3JtcyAoQW5kcm9pZCwgSW50ZWwsIEFNRCkgZm9yIHllYXJz
LCBidXQgd2l0aCB0aGlzCj4gY29tbWl0IG5vdywgaXQgZWZmZWN0aXZlbHkgZGlzYWJsZXMgVUFT
IGZvciBhbGwgUlRMOTIxMCBlbmNsb3N1cmVzLgo+Cj4gV291bGQgaXQgYmUgcG9zc2libGUgdG8g
YXBwbHkgdGhpcyBxdWlyayBvbmx5IHRvIGEgc3BlY2lmaWMgZmlybXdhcmUKPiAocmFuZ2UpPyBS
VEw5MjEwIGhhdmUgYSBsb3Qgb2YgcG9zc2libGUgZmlybXdhcmUgY29tYmluYXRpb25zOiBodHRw
czovL3d3dy5zdGF0aW9uLWRyaXZlcnMuY29tL2luZGV4LnBocC9lbi9jb21wb25lbnQvcmVtb3Np
dG9yeS9Ecml2ZXJzL1JlYWx0ZWsvTlZNZS1VU0ItMy4xL2xhbmcsZW4tZ2IvCj4KPiBSVEw5MjEw
IHdhcyBhdmFpbGFibGUgc2luY2UgMjAxOSBhbmQgdGhlIGZhY3QgdGhhdCB0aGlzIHF1aXJrIGNh
bWUgdXAgdGhpcwo+IGxhdGUgbGVhZHMgbWUgdG8gYmVsaWV2ZSB0aGF0IHRoaXMgaXMgbm90IGEg
d2lkZXNwcmVhZCBpc3N1ZSBhbmQgaXQnbGwgYmUgYQo+IHNoYW1lIGlmIGFsbCBvZiBSVEw5MjEw
cyBhcmUgYmxhY2tsaXN0ZWQgZnJvbSBVQVMgd2l0aCBMaW51eCBmcm9tIG5vdyBvbiA6KAo+Cj4g
SWYgYW55IGFkZGl0aW9uYWwgaW5mb3JtYXRpb24gaXMgcmVxdWlyZWQsIHBsZWFzZSBsZXQgbWUg
a25vdy4KwqAKQ2FuIHlvdSBzZW5kIGEgcmV2ZXJ0IG9mIHRoaXMgY29tbWl0IHNvIHRoYXQgd2Ug
Y2FuIGZpeCB0aGlzIHVwPwrCoAp0aGFua3MsCsKgCmdyZWcgay1o


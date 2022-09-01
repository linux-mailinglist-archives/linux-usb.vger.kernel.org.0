Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 657D25A9702
	for <lists+linux-usb@lfdr.de>; Thu,  1 Sep 2022 14:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233108AbiIAMit (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Sep 2022 08:38:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232950AbiIAMis (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Sep 2022 08:38:48 -0400
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2DB1EE08
        for <linux-usb@vger.kernel.org>; Thu,  1 Sep 2022 05:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:Mime-Version:Message-ID; bh=pIfXM
        BcqeTwM5Cl6NIkSU0B894yF2vZYdWYFJXTtuHI=; b=OS83m3HiR6mxto+PE9f2P
        D9RfyLwlMIlSk4QkntfXtw7zd6vGEGYGO+HG6Q8076Y/v1v4jWJJCrcuH+rGLGcF
        /RFnR0KzrKQWjfCiLSpwiKv0ulr2+LDQr/nlSnG5nkh86/yarAwhWc8MJzCr5xUZ
        t98E7/rgTHMpxE5SK175xo=
Received: from 0V5ZS2WE6VIK6H0 (unknown [120.204.148.63])
        by smtp7 (Coremail) with SMTP id DsmowACXn5O6pxBj8lFaAg--.27689S2;
        Thu, 01 Sep 2022 20:38:19 +0800 (CST)
Date:   Thu, 1 Sep 2022 20:38:21 +0800
From:   "zhongling0719@126.com" <zhongling0719@126.com>
To:     gregkh <gregkh@linuxfoundation.org>,
        zenghongling <zenghongling@kylinos.cn>
Cc:     stern <stern@rowland.harvard.edu>,
        linux-usb <linux-usb@vger.kernel.org>,
        usb-storage <usb-storage@lists.one-eyed-alien.net>
Subject: Re: Re: [PATCH v4] uas: add no-uas quirk for Thinkplus and Hiksemi usb-storage
References: <1662015653-12976-1-git-send-email-zenghongling@kylinos.cn>, 
        <YxBvNEn0jEEd0lXV@kroah.com>
X-Priority: 3
X-GUID: A6C69BC2-342E-46FF-9931-90B9DC68F696
X-Has-Attach: no
X-Mailer: Foxmail 7.2.16.188[cn]
Mime-Version: 1.0
Message-ID: <2022090120371974113815@126.com>
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: base64
X-CM-TRANSID: DsmowACXn5O6pxBj8lFaAg--.27689S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF1kCr1kWr18KFykJw4UCFg_yoW8Kr1kpF
        Z5Krs7Kr4kGw1Sk3WDZr1Iy3yFvr95AFWUJr9rC34Uua13Za4IqrZ7tayvgr17Gr17XFyY
        9rn8tw1qkFyqvaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi3fHUUUUUU=
X-Originating-IP: [120.204.148.63]
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/1tbiuRxv0FpD+bcZ0QAAsF
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGk6CsKgIMKgU29ycnkgYWdhaW4sIFRoZSBsYXN0IGVtYWlsIHdhcyB3cm9uZywgZml4ZWQgbXkg
ZW1haWwgdG8gbm90IHNlbmQgaHRtbCBlbWFpbCBhbmQgcmVzcG9uZCBhZ2Fpbi7CoArCoCDCoFRo
ZSBkcml2ZXJzIG1hbnVmYWN0dXJlcnMgYWR2ZXJ0aXNlZCBoaWdoIHNwZWVkIHN1cHBvcnQgcGxh
dGZvcm0gaXMgV2luZG93cyxNYWNPU1gsIG5vdCBpbmNsdWRlIGxpbnV4IDQuOSAsIHRoaXMgYnVn
IHdpbGwgYWZmZWN0IHRoZSB1c2Vyc8KgCm5vcm1hbCB1c2UsIHJ1biBpb3pvbmUgaXMganVzdCBv
bmUgb2YgdGhlIGJlaGF2aW9ycyB0aGF0IHRyaWdnZXIgVUFTIGNyYXNoICxXZSB3aWxsIGhhbmRs
ZSB0aGF0IHNsb3cgaXNzdWUuCgpUaGFua3MhCgp6aG9uZ2xpbmcwNzE5QDEyNi5jb20KwqAKRnJv
bTrCoEdyZWcgS0gKRGF0ZTrCoDIwMjItMDktMDHCoDE2OjM3ClRvOsKgemVuZ2hvbmdsaW5nCkND
OsKgc3Rlcm47IGxpbnV4LXVzYjsgdXNiLXN0b3JhZ2U7IHpob25nbGluZzA3MTkKU3ViamVjdDrC
oFJlOiBbUEFUQ0ggdjRdIHVhczogYWRkIG5vLXVhcyBxdWlyayBmb3IgVGhpbmtwbHVzIGFuZCBI
aWtzZW1pIHVzYi1zdG9yYWdlCk9uIFRodSwgU2VwIDAxLCAyMDIyIGF0IDAzOjAwOjUzUE0gKzA4
MDAsIHplbmdob25nbGluZyB3cm90ZToKPiBVQVM6aWYgaWdub3JlIHVhcyBmZWF0dXJlIGZvciB0
aGVzZSBkcml2ZXJzIGNhbiBmaXggdGhlIG5vdCB3b3JraW5nIGFuZAo+IG91dHB1dCBlcnJvciBt
ZXNzYWdlIGJ1Zy4KPgo+IFRoZSBVQVMgbW9kZSBvZiBUaGlua3BsdXMgYW5kIEhpa3NlbWkgaXMg
cmVwb3J0ZWQgdG8gZmFpbCB0byB3b3JrIG9uCj4gc2V2ZXJhbCBwbGF0Zm9ybXMgd2l0aCB0aGUg
Zm9sbG93aW5nIGVycm9yIG1lc3NhZ2UsSSB0ZXN0ZWQgdGhlc2UgVVNCCj4gZGlza3Mgb24gb3Ro
ZXIgYXJjaGl0ZWN0dXJlIHBsYXRmb3JtcyBhcyBhcm0vbG9vbmdzb24gZm9yIGRpZmZlcmVudCB4
SENJCj4gY29udHJvbGxlcix0aGUgc2FtZSBlcnJvciBvY2N1cnJlZDoKPgo+IFvCoMKgIDM5Ljcw
MjQzOV0geGhjaV9oY2QgMDAwMDowYzowMC4zOiBFUlJPUiBUcmFuc2ZlciBldmVudCBmb3IgZGlz
YWJsZWQKPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbmRwb2ludCBvciBpbmNvcnJl
Y3Qgc3RyZWFtIHJpbmcKPiBbwqDCoCAzOS43MDI0NDJdIHhoY2lfaGNkIDAwMDA6MGM6MDAuMzog
QDAwMDAwMDAyNmM2MWY4MTAgMDAwMDAwMDAgMDAwMDAwMDAKPsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAxYjAwMDAwMCAwNTAzODAwMAo+Cj4gW8KgIDU5Mi40OTAzNjldWyAxXSB4aGNp
X2hjZCAwMDAwOjBjOjAwLjM6IEFzc3VtaW5nIGhvc3QgaXMgZHlpbmcsIGhhbHRpbmcgaG9zdC4K
PiBbwqAgNTkyLjUxODQ0Ml1bIDJdIHNkIDg6MDowOjA6IFtzZGFdIHRhZyMxNyB1YXNfZWhfYWJv
cnRfaGFuZGxlciAwIHVhcy10YWcgMTgKPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGluZmxpZ2h0OiBDTUQKPiBbwqAgNTkyLjUyNzU3NV1bIDJdIHNkIDg6MDowOjA6IFtz
ZGFdIHRhZyMxNyBDREI6IFdyaXRlKDEwKSAyYSAwMCAwMyA2ZiA4OCAwMCAwMAo+wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMDQgMDAgMDAKPiBbwqAgNTkyLjUzNjMzMF1b
IDJdIHNkIDg6MDowOjA6IFtzZGFdIHRhZyMwIHVhc19laF9hYm9ydF9oYW5kbGVyIDAgdWFzLXRh
ZyAxCj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbmZsaWdodDogQ01E
Cj4gW8KgIDU5Mi41NDUyNjZdWyAyXSBzZCA4OjA6MDowOiBbc2RhXSB0YWcjMCBDREI6IFdyaXRl
KDEwKSAyYSAwMCAwNyA0NCAxYSA4OCAwMAo+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgMDAgMDggMDAKPgo+IEFuZCB3aGVuIHJ1bm5pbmcgaW96b25lIHdpbGwgZGlzY29u
bmVjdCBmcm9tIHRoZSBVU0IgY29udHJvbGxlciwgdGhlbiBhZnRlcgo+IHJlLWNvbm5lY3Rpbmcg
dGhlIGRldmljZSB3aWxsIGJlIG9mZmxpbmVkIGFuZCBub3Qgd29ya2luZyBhdCBhbGwuCj4KPiBX
ZSBjaGFuZ2VkIGEgbG90IG9mIFVTQiBkZXZpY2VzIGFuZCBjb250YWN0IHJlbGV2YW50IG1hbnVm
YWN0dXJlcnMgdG8KPiBjb25maXJtIHRoZSBVU0IgZGlzayBpcyBvay4KwqAKSSBkbyBub3QgdW5k
ZXJzdGFuZCB3aHkgdGhlcmUgYXJlIGZhaWx1cmVzIG9uIExpbnV4LCB5ZXQgbm90IG9uIG90aGVy
Cm9wZXJhdGluZyBzeXN0ZW1zLsKgIElmIHlvdSBydW4gaW96b25lIG9uIE9TLVgsIGRvZXMgdGhl
IHNhbWUgZXJyb3JzCmhhcHBlbj/CoCBIb3cgYWJvdXQgYSBzdG9yYWdlIHN0cmVzcy10ZXN0IG9u
IFdpbmRvd3M/wqAgV2h5IGlzIExpbnV4IGdvaW5nCnRvIGhhdmUgdG8gbWFrZSB0aGVzZSBkZXZp
Y2VzIGdvIHZlcnkgdmVyeSBzbG93IGFuZCB3aGF0IHdpbGwgaGFwcGVuIHRvCnRoZSB1c2VycyB0
aGF0IG5vdyBjYW4gbm90IG9wZXJhdGUgdGhlaXIgZGV2aWNlcyBhdCB0aGUgYWR2ZXJ0aXNlZApz
cGVlZHM/wqAgV2hvIHdpbGwgaGFuZGxlIHRoYXQgc3VwcG9ydCBpc3N1ZT8KwqAKdGhhbmtzLArC
oApncmVnIGstaA==


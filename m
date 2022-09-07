Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BC195B101D
	for <lists+linux-usb@lfdr.de>; Thu,  8 Sep 2022 01:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbiIGXAO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Sep 2022 19:00:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbiIGXAM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Sep 2022 19:00:12 -0400
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9C5B4A2ABA
        for <linux-usb@vger.kernel.org>; Wed,  7 Sep 2022 16:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:Mime-Version:Message-ID; bh=DAR5o
        uwdYixObZ7shUGeErkhJF/4X71+KfPQMKkpomE=; b=H5l27itb5C9K134A8D1w8
        JjxbX7jcbXgZnL8h0Joi6Z+FN92UO5DBjjOywrQu6duSmplnNzKV8X09ldCFxQI1
        WBxLh7hjNa2LDsi0nWe9W9ejQtTrZvzhivPwrYGE9qiMeVcrpv3nN0ixvPgHoHQN
        y0R/WEk7cN92GC8lYypsJ8=
Received: from 0V5ZS2WE6VIK6H0 (unknown [117.143.49.84])
        by smtp7 (Coremail) with SMTP id DsmowAAnVZg8IhljK0OZBA--.22197S2;
        Thu, 08 Sep 2022 06:59:08 +0800 (CST)
Date:   Thu, 8 Sep 2022 06:59:09 +0800
From:   "zhongling0719@126.com" <zhongling0719@126.com>
To:     "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "zenghongling@kylinos.cn" <zenghongling@kylinos.cn>
Cc:     "Greg KH" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "usb-storage@lists.one-eyed-alien.net" 
        <usb-storage@lists.one-eyed-alien.net>
Subject: Re: Re: [PATCH v2 1/3] uas: add no-uas quirk for Hiksemi usb_disk
References: <1662519246-18397-1-git-send-email-zenghongling@kylinos.cn>, 
        <YxjRna/qihbKPEge@rowland.harvard.edu>
X-Priority: 3
X-GUID: BECF0879-3842-4256-A201-6D298EE7D6CD
X-Has-Attach: no
X-Mailer: Foxmail 7.2.16.188[cn]
Mime-Version: 1.0
Message-ID: <2022090806580941868521@126.com>
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: base64
X-CM-TRANSID: DsmowAAnVZg8IhljK0OZBA--.22197S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw45Gw4rZr1UZF18tF4rAFb_yoW8tr43pa
        4v9rs3CrWkGF1Iy3Z7Zr4UCryrXa95JrW8K342kw4DXF4rZa4qqrZxAr4kWryxJr47GF4F
        vF4qvr4UGF4DC3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U01v-UUUUU=
X-Originating-IP: [117.143.49.84]
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/1tbiJB110FpEFka7ugAAsT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

U29ycnksIE15IGdpdCBzZW5kLWVtYWlsIHN1ZGRseSBjYW4ndCBzZW5kIHBhdGNoLApJIHdpbGwg
Zml4IHRoaXMgcHJvYmxlbSBhcyBzb29uIGFzIHBvc3NpYmxlIGFuZCBzZW5kIGl0IHRvIHlvdQoK
VGhhbmtzIQoKemhvbmdsaW5nMDcxOUAxMjYuY29tCsKgCkZyb206wqBBbGFuIFN0ZXJuCkRhdGU6
wqAyMDIyLTA5LTA4wqAwMToxNQpUbzrCoEhvbmdsaW5nIFplbmcKQ0M6wqBncmVna2g7IGxpbnV4
LXVzYjsgdXNiLXN0b3JhZ2U7IHpob25nbGluZzA3MTkKU3ViamVjdDrCoFJlOiBbUEFUQ0ggdjIg
MS8zXSB1YXM6IGFkZCBuby11YXMgcXVpcmsgZm9yIEhpa3NlbWkgdXNiX2Rpc2sKT24gV2VkLCBT
ZXAgMDcsIDIwMjIgYXQgMTA6NTQ6MDZBTSArMDgwMCwgSG9uZ2xpbmcgWmVuZyB3cm90ZToKPiBU
aGUgVUFTIG1vZGUgb2YgSGlrc2VtaSBpcyByZXBvcnRlZCB0byBmYWlsIHRvIHdvcmsgb24gc2V2
ZXJhbCBwbGF0Zm9ybXMKPiB3aXRoIHRoZSBmb2xsb3dpbmcgZXJyb3IgbWVzc2FnZSwgdGhlbiBh
ZnRlciByZS1jb25uZWN0aW5nIHRoZSBkZXZpY2Ugd2lsbAo+IGJlIG9mZmxpbmVkIGFuZCBub3Qg
d29ya2luZyBhdCBhbGwuCj4KPiBbwqAgNTkyLjUxODQ0Ml1bIDJdIHNkIDg6MDowOjA6IFtzZGFd
IHRhZyMxNyB1YXNfZWhfYWJvcnRfaGFuZGxlciAwIHVhcy10YWcgMTgKPsKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGluZmxpZ2h0OiBDTUQKPiBbwqAgNTkyLjUyNzU3NV1b
IDJdIHNkIDg6MDowOjA6IFtzZGFdIHRhZyMxNyBDREI6IFdyaXRlKDEwKSAyYSAwMCAwMyA2ZiA4
OCAwMCAwMAo+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMDQgMDAgMDAK
PiBbwqAgNTkyLjUzNjMzMF1bIDJdIHNkIDg6MDowOjA6IFtzZGFdIHRhZyMwIHVhc19laF9hYm9y
dF9oYW5kbGVyIDAgdWFzLXRhZyAxCj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpbmZsaWdodDogQ01ECj4gW8KgIDU5Mi41NDUyNjZdWyAyXSBzZCA4OjA6MDowOiBbc2Rh
XSB0YWcjMCBDREI6IFdyaXRlKDEwKSAyYSAwMCAwNyA0NCAxYSA4OCAwMAo+wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMDAgMDggMDAKPgo+IFRoZXNlIGRpc2tzIGhhdmUg
YSBicm9rZW4gdWFzIGltcGxlbWVudGF0aW9uLCB0aGUgdGFnIGZpZWxkIG9mIHRoZSBzdGF0dXMK
PiBpdS1zIGlzIG5vdCBzZXQgcHJvcGVybHksc28gd2UgbmVlZCB0byBmYWxsLWJhY2sgdG8gdXNi
LXN0b3JhZ2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBIb25nbGluZyBaZW5nIDx6ZW5naG9uZ2xpbmdA
a3lsaW5vcy5jbj4KPiAtLS0KPiBjaGFuZ2UgZm9yIHYxCj7CoCAtQ2hhbmdlIHRoZSBlbWFpbCBy
ZWFsIG5hbWUKPgo+IENoYW5nZSBmb3IgdjIKPsKgIC1DaGFuZ2Ugc3BlbGxpbmcgZXJyb3IKPgo+
IC0tLQo+wqAgZHJpdmVycy91c2Ivc3RvcmFnZS91bnVzdWFsX3Vhcy5oIHwgNyArKysrKysrCj7C
oCAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy91c2Ivc3RvcmFnZS91bnVzdWFsX3Vhcy5oIGIvZHJpdmVycy91c2Ivc3RvcmFnZS91bnVzdWFs
X3Vhcy5oCj4gaW5kZXggY2RmZjdkYy4uYTZiZjg3YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Vz
Yi9zdG9yYWdlL3VudXN1YWxfdWFzLmgKPiArKysgYi9kcml2ZXJzL3VzYi9zdG9yYWdlL3VudXN1
YWxfdWFzLmgKPiBAQCAtNjIsNiArNjIsMTMgQEAgVU5VU1VBTF9ERVYoMHgwNTlmLCAweDEwNjEs
IDB4MDAwMCwgMHg5OTk5LAo+wqAgVVNCX1NDX0RFVklDRSwgVVNCX1BSX0RFVklDRSwgTlVMTCwK
PsKgIFVTX0ZMX0lHTk9SRV9VQVMpLAo+wqAKPiArLyogUmVwb3J0ZWQtYnk6IEhvbmdsaW5nIFpl
bmcgPHplbmdob25nbGluZ0BreWxpbm9zLmNuPiAqLwo+ICtVTlVTVUFMX0RFVigweDA5MGMsIDB4
MjAwMCwgMHgwMDAwLCAweDk5OTksCj4gKwkiSGlrc2VtaSIsCj4gKwkiRXh0ZXJuYWwgSEREIiwK
PiArCVVTQl9TQ19ERVZJQ0UsIFVTQl9QUl9ERVZJQ0UsIE5VTEwsCj4gKwlVU19GTF9JR05PUkVf
VUFTKSwKPiArCj7CoCAvKgo+wqDCoCAqIEFwcmljb3JuIFVTQjMgZG9uZ2xlIHNvbWV0aW1lcyBy
ZXR1cm5zICJVU0JTVVNCU1VTQlMiIGluIHJlc3BvbnNlIHRvIFNDU0kKPsKgwqAgKiBjb21tYW5k
cyBpbiBVQVMgbW9kZS7CoCBPYnNlcnZlZCB3aXRoIHRoZSAxLjI4IGZpcm13YXJlOyBhcmUgdGhl
cmUgb3RoZXJzPwrCoApBY2tlZC1ieTogQWxhbiBTdGVybiA8c3Rlcm5Acm93bGFuZC5oYXJ2YXJk
LmVkdT4KwqAKSSBkaWRuJ3QgcmVjZWl2ZSB2MiBvZiB0aGUgMi8zIHBhdGNoLsKgIERpZCB5b3Ug
Zm9yZ2V0IHRvIHNlbmQgaXQ/CsKgCkFsYW4gU3Rlcm4=


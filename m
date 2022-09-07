Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F31585B100E
	for <lists+linux-usb@lfdr.de>; Thu,  8 Sep 2022 00:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbiIGW5B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Sep 2022 18:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbiIGW5A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Sep 2022 18:57:00 -0400
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 021668C44A
        for <linux-usb@vger.kernel.org>; Wed,  7 Sep 2022 15:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:Mime-Version:Message-ID; bh=wQ5g1
        zoJWQRyPU7la42Bk0s7FxvSMaCmSIM9itjcQBE=; b=m2qLDFLPNvtSsvFrMa3PA
        qPnBJZ4ggJTdCRdRtq0Doh/8utfK2jJ7TrPhVOIdL4JaT/egRY5iawIsev4vtaUs
        B1IHsE9pHjLt22Ee8xJVQhpfQywiD9gco244pZzOIjHtc83IYrakQvspSVTDi+Gr
        ZlNcxN2tEUFWKuGAc1Yyi0=
Received: from 0V5ZS2WE6VIK6H0 (unknown [117.143.49.84])
        by smtp7 (Coremail) with SMTP id DsmowACn9pJ3IRljpfKYBA--.12003S2;
        Thu, 08 Sep 2022 06:55:53 +0800 (CST)
Date:   Thu, 8 Sep 2022 06:55:54 +0800
From:   "zhongling0719@126.com" <zhongling0719@126.com>
To:     "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "zenghongling@kylinos.cn" <zenghongling@kylinos.cn>
Cc:     "Greg KH" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "usb-storage@lists.one-eyed-alien.net" 
        <usb-storage@lists.one-eyed-alien.net>
Subject: Re: Re: [PATCH v2 3/3] uas: ignore UAS for Thinkplus chips
References: <1662519268-18488-1-git-send-email-zenghongling@kylinos.cn>, 
        <YxjRSW5XTwqrTzJF@rowland.harvard.edu>
X-Priority: 3
X-GUID: CFE3A395-8844-46FF-9E1E-E4055B220CC4
X-Has-Attach: no
X-Mailer: Foxmail 7.2.16.188[cn]
Mime-Version: 1.0
Message-ID: <2022090806545281343718@126.com>
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: base64
X-CM-TRANSID: DsmowACn9pJ3IRljpfKYBA--.12003S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAw48Xry8tFyUuw1UGry7GFg_yoW5XFW7p3
        4DKF95Cr4vkFyIvF1xAw47AryFqwsYyFW5GrZIkw4UZa1ruayjqF1Dtr48ury7Jr47Wa1j
        9r4qvF1UKF4DCaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi89N3UUUUU=
X-Originating-IP: [117.143.49.84]
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/1tbiYBp10FpEI5ymjAAAsU
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

WWVzLEkgaW52ZXN0aWdhdGUgdGhlIHRoaW5rcGx1cyAoUEFUQ0ggMyllcnJvciBub3QgY2F1c2Vk
IGJ5IFhIQ0kgY29udHJvbGxlciBvciBiYWQgZGlzay4KSGlrc2VtaSBhY3R1YWxseSBoYXMgdGhl
IHNhbWUgZXJyb3IgbWVzc2dhZ2Ugb3V0cHV0IHdpdGggdGhpbmtwbHVzLCBVc2VsZXNzIGRlZXBl
ciBhY3Rpb25zIHRyaWdnZXIgVUFTIGNyYXNoIG9mIHRoaW5rcGx1cy4KRmFsbGluZyBiYWNrIHRv
IFVTQiBtYXNzIHN0b3JhZ2XCoGNhbiBzb2x2ZSB0aGUgdGhpbmtwbHVzIHByb2JsZW0sV2UgaGF2
ZSBtZXJnZWQgdG8gb3VyIG93biBtYWluIGxpbmUuCgp6aG9uZ2xpbmcwNzE5QDEyNi5jb20KwqAK
RnJvbTrCoEFsYW4gU3Rlcm4KRGF0ZTrCoDIwMjItMDktMDjCoDAxOjEzClRvOsKgSG9uZ2xpbmcg
WmVuZwpDQzrCoGdyZWdraDsgbGludXgtdXNiOyB1c2Itc3RvcmFnZTsgemhvbmdsaW5nMDcxOQpT
dWJqZWN0OsKgUmU6IFtQQVRDSCB2MiAzLzNdIHVhczogaWdub3JlIFVBUyBmb3IgVGhpbmtwbHVz
IGNoaXBzCk9uIFdlZCwgU2VwIDA3LCAyMDIyIGF0IDEwOjU0OjI4QU0gKzA4MDAsIEhvbmdsaW5n
IFplbmcgd3JvdGU6Cj4gVGhlIFVBUyBtb2RlIG9mIFRoaW5rcGx1cyBpcyByZXBvcnRlZCB0byBm
YWlsIHRvIHdvcmsgb24KPiBzZXZlcmFsIHBsYXRmb3JtcyB3aXRoIHRoZSBmb2xsb3dpbmcgZXJy
b3IgbWVzc2FnZToKPgo+IFvCoMKgIDM5LjcwMjQzOV0geGhjaV9oY2QgMDAwMDowYzowMC4zOiBF
UlJPUiBUcmFuc2ZlciBldmVudCBmb3IgZGlzYWJsZWQKPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBlbmRwb2ludCBvciBpbmNvcnJlY3Qgc3RyZWFtIHJpbmcKPiBbwqDCoCAzOS43MDI0
NDJdIHhoY2lfaGNkIDAwMDA6MGM6MDAuMzogQDAwMDAwMDAyNmM2MWY4MTAgMDAwMDAwMDAgMDAw
MDAwMDAKPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxYjAwMDAwMCAwNTAzODAwMAo+
Cj4gRmFsbGluZyBiYWNrIHRvIFVTQiBtYXNzIHN0b3JhZ2UgY2FuIHNvbHZlIHRoaXMgcHJvYmxl
bSwgc28gaWdub3JlIFVBUwo+IGZ1bmN0aW9uIG9mIHRoaXMgY2hpcC4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEhvbmdsaW5nIFplbmcgPHplbmdob25nbGluZ0BreWxpbm9zLmNuPgo+IC0tLQo+IENoYW5n
ZSBmb3IgdjEKPsKgIC0gQ2hhbmdlIHRoZSBlbWFpbCByZWFsIG5hbWUgYW5kIHRoZSBjb2RlIHdv
cm5nIHBsYWNlLgo+Cj4gQ2hhbmdlIGZvciB2Mgo+wqAgLUNoYW5nZSBzcGVsbGluZyBlcnJvci4K
wqAKUmVzdWJtaXR0aW5nIHRoZSBwYXRjaCB3aXRoIGEgZmV3IG1pbm9yIGNoYW5nZXMgd29uJ3Qg
aGVscCBpdCBnZXQKYWNjZXB0ZWQuwqAgRmlyc3QgeW91IGhhdmUgdG8gYW5zd2VyIHRoZSBxdWVz
dGlvbnMgSSBhc2tlZC4KwqAKSW4gcGFydGljdWxhcjogVGhlIGVycm9yIG1lc3NhZ2VzIHlvdSBs
aXN0IGFib3ZlIGFyZSB2ZXJ5IGRpZmZlcmVudCBmcm9tCnRoZSBlcnJvcnMgaW4geW91ciBmaXJz
dCB0d28gcGF0Y2hlcy7CoCBUaG9zZSB3ZXJlIGxpa2U6CsKgClvCoCA1OTIuNTE4NDQyXVsgMl0g
c2QgODowOjA6MDogW3NkYV0gdGFnIzE3IHVhc19laF9hYm9ydF9oYW5kbGVyIDAgdWFzLXRhZyAx
OArCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW5mbGlnaHQ6IENNRApbwqAg
NTkyLjUyNzU3NV1bIDJdIHNkIDg6MDowOjA6IFtzZGFdIHRhZyMxNyBDREI6IFdyaXRlKDEwKSAy
YSAwMCAwMyA2ZiA4OCAwMCAwMArCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
MDQgMDAgMDAKwqAKWW91IGNhbiBzZWUgaG93IGRpZmZlcmVudCB0aGV5IGFyZSBmcm9tIHRoZSBt
ZXNzYWdlcyBhYm92ZS7CoCBUaGlzIG1lYW5zCnRoYXQgdGhleSBhcmUgY2F1c2VkIGJ5IGEgZGlm
ZmVyZW50IGtpbmQgb2YgYnVnIC0tIGFuZCB0aGF0IG1lYW5zIHRoaXMKcHJvYmxlbSBwcm9iYWJs
eSByZXF1aXJlcyBhIGRpZmZlcmVudCBraW5kIG9mIGZpeCBmcm9tIHRoZSBvdGhlciB0d28uCsKg
CllvdSBuZWVkIHRvIGludmVzdGlnYXRlIGFuZCBnZXQgYSBiZXR0ZXIgaWRlYSBvZiB3aGF0J3Mg
Z29pbmcgd3Jvbmcgd2l0aAp0aGUgVGhpbmtwbHVzIGJlZm9yZSB5b3UgcHJvcG9zZSBhIGZpeC4K
wqAKQWxhbiBTdGVybgrCoAo+IC0tLQo+wqAgZHJpdmVycy91c2Ivc3RvcmFnZS91bnVzdWFsX3Vh
cy5oIHwgNyArKysrKysrCj7CoCAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy91c2Ivc3RvcmFnZS91bnVzdWFsX3Vhcy5oIGIvZHJpdmVycy91
c2Ivc3RvcmFnZS91bnVzdWFsX3Vhcy5oCj4gaW5kZXggOGExOGQ1OC4uMTU2ZTg5YyAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL3VzYi9zdG9yYWdlL3VudXN1YWxfdWFzLmgKPiArKysgYi9kcml2ZXJz
L3VzYi9zdG9yYWdlL3VudXN1YWxfdWFzLmgKPiBAQCAtMTk4LDYgKzE5OCwxMyBAQCBVTlVTVUFM
X0RFVigweDE1NGIsIDB4ZjAwZCwgMHgwMDAwLCAweDk5OTksCj7CoCBVU0JfU0NfREVWSUNFLCBV
U0JfUFJfREVWSUNFLCBOVUxMLAo+wqAgVVNfRkxfTk9fQVRBXzFYKSwKPsKgCj4gKy8qIFJlcG9y
dGVkLWJ5OiBIb25nbGluZyBaZW5nIDx6ZW5naG9uZ2xpbmdAa3lsaW5vcy5jbj4gKi8KPiArVU5V
U1VBTF9ERVYoMHgxN2VmLCAweDM4OTksIDB4MDAwMCwgMHg5OTk5LAo+ICsJIlRoaW5rcGx1cyIs
Cj4gKwkiRXh0ZXJuYWwgSEREIiwKPiArCVVTQl9TQ19ERVZJQ0UsIFVTQl9QUl9ERVZJQ0UsIE5V
TEwsCj4gKwlVU19GTF9JR05PUkVfVUFTKSwKPiArCj7CoCAvKiBSZXBvcnRlZC1ieTogSGFucyBk
ZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4gKi8KPsKgIFVOVVNVQUxfREVWKDB4MjEwOSwg
MHgwNzExLCAweDAwMDAsIDB4OTk5OSwKPsKgICJWSUEiLAo+IC0tCj4gMi4xLjAKPg==


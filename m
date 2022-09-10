Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF77F5B437B
	for <lists+linux-usb@lfdr.de>; Sat, 10 Sep 2022 03:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbiIJBEX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Sep 2022 21:04:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiIJBEW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Sep 2022 21:04:22 -0400
Received: from m15112.mail.126.com (m15112.mail.126.com [220.181.15.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 932039E68E
        for <linux-usb@vger.kernel.org>; Fri,  9 Sep 2022 18:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:Mime-Version:Message-ID; bh=TfJi2
        5Z7TnRKUh4yF3zy+OLkAzt/e6EWRrTbx5Ko17Y=; b=kX2h5vH3FiCS3ql3xJXPs
        lqcL9iq1UVS8EHmz0P1M9bB5Y+PFYf1Gy64OoG2wazCUR0XrC5tZGuBf3frmk67S
        +Fpj0VybgVkv+TvySps/ysWl5tDPS4SabTR/oFTi/lcCt72T8GlMiD0D6mZVOWng
        ikT/pobG/bKYEpNQaoDpbc=
Received: from 0V5ZS2WE6VIK6H0 (unknown [117.143.49.84])
        by smtp2 (Coremail) with SMTP id DMmowACnrrqB4htj5_cLBQ--.28515S2;
        Sat, 10 Sep 2022 09:04:02 +0800 (CST)
Date:   Sat, 10 Sep 2022 09:04:04 +0800
From:   "zhongling0719@126.com" <zhongling0719@126.com>
To:     "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
Cc:     "zenghongling@kylinos.cn" <zenghongling@kylinos.cn>,
        "Greg KH" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "usb-storage@lists.one-eyed-alien.net" 
        <usb-storage@lists.one-eyed-alien.net>
Subject: Re: Re: [PATCH v4 3/3] uas: ignore UAS for Thinkplus chips
References: <1662720530-32313-1-git-send-email-zenghongling@kylinos.cn>, 
        <YxsucjOnUkb8NxKo@rowland.harvard.edu>, 
        <202209092121245768249@126.com>, 
        <YxuDzEdZX1zrIwOQ@rowland.harvard.edu>
X-Priority: 3
X-GUID: 0C8E818A-4AB4-4711-A9B6-31B417E79DC9
X-Has-Attach: no
X-Mailer: Foxmail 7.2.16.188[cn]
Mime-Version: 1.0
Message-ID: <2022091009030319446573@126.com>
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: base64
X-CM-TRANSID: DMmowACnrrqB4htj5_cLBQ--.28515S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFWDKrW3GF4UKr45Gw1kAFb_yoW5KF13pa
        s8tF98Crs5KF1IvFnrtw47AFyYqanYyFW5Kr9IywnrZw4FkFnrtrn8Jr48u347ur48Ww40
        vFWqqFW7Kw4DWaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi-6pPUUUUU=
X-Originating-IP: [117.143.49.84]
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/1tbiYB540FpEI7R41QABsz
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SSB0ZXN0ZWQgbWFueSBvdGhlciBQSUQvVklEIG9mIHRoaW5rcGx1cyBvbiBsaW51eCBpcyBvaywg
T25seSB0aGUoMHgxN2VmLCAweDM4OTkpIMKgb3V0cHV0IGVycm9yIG1lc3NnYWdlIG9mIHVhcyBp
biBkbWVzZyAsCm5vdCBjYW4ndCB3b3JrICwgTGF0ZXIgSSBmb3VuZCBpdCBhZmZlY3RlZCB0aGUg
cGVyZm9ybWFuY2UsVGhlIGRpc2sgc3BlZWQgaXMgwqBsb3dlciDCoHRoYW4gdXNlIHVzYi1zdG9y
YWdlLiDCoApXaW4xMCAncyBzcGVlZCBpcyBsb3dlciB0aGFuIHdpbjcuIMKgc28gc2F5IG5vdCBn
b29kIG9uIHdpbjEwLsKgCgoKPkkgd291bGQgZ3Vlc3MgdGhhdCBXaW5kb3dzIDcgZG9lc24ndCB1
c2UgVUFTIGJ1dCBXaW5kb3dzIDEwIGRvZXMuIMKgSXQncwo+c3VycHJpc2luZyB0aGF0IHRoZXNl
IGRldmljZXMgY2FuIGJlIHNvbGQgbm93YWRheXMgaWYgdGhleSBkb24ndCB3b3JrCj53aXRoIFdp
bmRvd3MgMTAgLS0gd2hvIHdvdWxkIGJ1eSB0aGVtPwoKCj5CdXQgYWdhaW4sIEkgZmluZCBpdCB2
ZXJ5IHZlcnkgaGFyZCB0byBiZWxpZXZlIHRoZXkgZG8gbm90IHdvcmsgcHJvcGVybHkKPm9uIFdp
bmRvd3MgMTAvMTEvT1NYIGFzIHdlbGwgYXMgV2luZG93cyAxMCBoYXMgYmVlbiBvdXQgZm9yIGEg
dmVyeSBsb25nCj50aW1lIG5vdyBhbmQgbm8gb25lIHdvdWxkIGFjY2VwdCBzdWNoIHBvb3IgcGVy
Zm9ybWFuY2Ugb24gdGhvc2UgZGV2aWNlcy4KCnpob25nbGluZzA3MTlAMTI2LmNvbQrCoApGcm9t
OsKgc3Rlcm5Acm93bGFuZC5oYXJ2YXJkLmVkdQpEYXRlOsKgMjAyMi0wOS0xMMKgMDI6MTkKVG86
wqB6aG9uZ2xpbmcwNzE5QDEyNi5jb20KQ0M6wqB6ZW5naG9uZ2xpbmdAa3lsaW5vcy5jbjsgR3Jl
ZyBLSDsgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsgdXNiLXN0b3JhZ2VAbGlzdHMub25lLWV5
ZWQtYWxpZW4ubmV0ClN1YmplY3Q6wqBSZTogUmU6IFtQQVRDSCB2NCAzLzNdIHVhczogaWdub3Jl
IFVBUyBmb3IgVGhpbmtwbHVzIGNoaXBzCk9uIEZyaSwgU2VwIDA5LCAyMDIyIGF0IDA5OjIyOjI1
UE0gKzA4MDAsIHpob25nbGluZzA3MTlAMTI2LmNvbSB3cm90ZToKPiBTb3JyeSAsIEkgdGVzdGVk
IGl0IHdvcmsgd2VsbCBvbiBXaW43LCBub3QgZ29vZCBvbiBXaW4xMC7CoArCoApJIHdvdWxkIGd1
ZXNzIHRoYXQgV2luZG93cyA3IGRvZXNuJ3QgdXNlIFVBUyBidXQgV2luZG93cyAxMCBkb2VzLsKg
IEl0J3MKc3VycHJpc2luZyB0aGF0IHRoZXNlIGRldmljZXMgY2FuIGJlIHNvbGQgbm93YWRheXMg
aWYgdGhleSBkb24ndCB3b3JrCndpdGggV2luZG93cyAxMCAtLSB3aG8gd291bGQgYnV5IHRoZW0/
CsKgCj4gSSBkb24ndCBoYXZlIE1hYyBPU1ggc3lzdGVtLiBXZSBhbHdheXMgd29yayBvbiBsaW51
eMKgZW52aXJvbm1lbnQuCj4gTmVlZCBJIHJlc2VuZCB0aGUgdmVyc2lvbiBWNSBmb3IgcGF0Y2gg
MyDCoGNhbmNlbCAiYWNrZWQgYnkiID8KwqAKR3JlZywgZG8geW91IGhhdmUgYW4gb3Bpbmlvbj/C
oCBJIGRvbid0IGZlZWwgdmVyeSBzdHJvbmdseSBhYm91dCB0aGlzLgrCoApBbGFuIFN0ZXJuCsKg
Cj4gVGhhbmtzIQo+Cj4gemhvbmdsaW5nMDcxOUAxMjYuY29tCj4gwqAKPiBGcm9tOsKgQWxhbiBT
dGVybgo+IERhdGU6wqAyMDIyLTA5LTA5wqAyMDoxNQo+IFRvOsKgSG9uZ2xpbmcgWmVuZwo+IEND
OsKgZ3JlZ2toOyBsaW51eC11c2I7IHVzYi1zdG9yYWdlOyB6aG9uZ2xpbmcwNzE5Cj4gU3ViamVj
dDrCoFJlOiBbUEFUQ0ggdjQgMy8zXSB1YXM6IGlnbm9yZSBVQVMgZm9yIFRoaW5rcGx1cyBjaGlw
cwo+IE9uIEZyaSwgU2VwIDA5LCAyMDIyIGF0IDA2OjQ4OjUwUE0gKzA4MDAsIEhvbmdsaW5nIFpl
bmcgd3JvdGU6Cj4gPiBUaGUgVUFTIG1vZGUgb2YgVGhpbmtwbHVzIGlzIHJlcG9ydGVkIHRvIGZh
aWwgdG8gd29yayBvbgo+ID4gc2V2ZXJhbCBwbGF0Zm9ybXMgd2l0aCB0aGUgZm9sbG93aW5nIGVy
cm9yIG1lc3NhZ2U6Cj4gPgo+ID4gW8KgwqAgMzkuNzAyNDM5XSB4aGNpX2hjZCAwMDAwOjBjOjAw
LjM6IEVSUk9SIFRyYW5zZmVyIGV2ZW50IGZvciBkaXNhYmxlZAo+ID7CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZW5kcG9pbnQgb3IgaW5jb3JyZWN0IHN0cmVhbSByaW5nCj4gPiBbwqDC
oCAzOS43MDI0NDJdIHhoY2lfaGNkIDAwMDA6MGM6MDAuMzogQDAwMDAwMDAyNmM2MWY4MTAgMDAw
MDAwMDAgMDAwMDAwMDAKPiA+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDFiMDAwMDAw
IDA1MDM4MDAwCj4gPgo+ID4gRmFsbGluZyBiYWNrIHRvIFVTQiBtYXNzIHN0b3JhZ2UgY2FuIHNv
bHZlIHRoaXMgcHJvYmxlbSwgc28gaWdub3JlIFVBUwo+ID4gZnVuY3Rpb24gb2YgdGhpcyBjaGlw
Lgo+ID4KPiA+IEFja2VkLWJ5OiBBbGFuIFN0ZXJuIDxzdGVybkByb3dsYW5kLmhhcnZhcmQuZWR1
Pgo+IMKgCj4gSSBuZXZlciBzZW50IHlvdSBhbiBBY2tlZC1ieTogZm9yIHRoaXMgcGF0Y2guwqAg
SW4gZmFjdCwgSSBhc2tlZCB5b3UKPiBxdWVzdGlvbnMgYWJvdXQgaXQgd2hpY2ggeW91IGhhdmVu
J3QgeWV0IGFuc3dlcmVkLgo+IMKgCj4gU3BlY2lmaWNhbGx5OiBIb3cgZG8gV2luZG93cyBhbmQg
TWFjIE9TWCB3b3JrIHdpdGggdGhpcyBkcml2ZT8KPiDCoAo+IEFsYW4gU3Rlcm4KPiDCoAo+ID4g
U2lnbmVkLW9mZi1ieTogSG9uZ2xpbmcgWmVuZyA8emVuZ2hvbmdsaW5nQGt5bGlub3MuY24+Cj4g
PiAtLS0KPiA+IENoYW5nZSBmb3IgdjEKPiA+wqAgLSBDaGFuZ2UgdGhlIGVtYWlsIHJlYWwgbmFt
ZSBhbmQgdGhlIGNvZGUgd29ybmcgcGxhY2UuCj4gPgo+ID4gQ2hhbmdlIGZvciB2Mgo+ID7CoCAt
Q2hhbmdlIHNwZWxsaW5nIGVycm9yLgo+ID4KPiA+IENoYW5nZSBmb3IgdjMKPiA+wqAgLUFkZCBh
Y2tlZC1ieQo+ID4KPiA+IENoYW5nZSBmb3IgdjQKPiA+wqAgLUZpeCB2ZXJzaW9uIGVycm9yCj4g
PiAtLS0KPiA+wqAgZHJpdmVycy91c2Ivc3RvcmFnZS91bnVzdWFsX3Vhcy5oIHwgNyArKysrKysr
Cj4gPsKgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy91c2Ivc3RvcmFnZS91bnVzdWFsX3Vhcy5oIGIvZHJpdmVycy91c2Ivc3RvcmFn
ZS91bnVzdWFsX3Vhcy5oCj4gPiBpbmRleCA4YTE4ZDU4Li4xNTZlODljIDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy91c2Ivc3RvcmFnZS91bnVzdWFsX3Vhcy5oCj4gPiArKysgYi9kcml2ZXJzL3Vz
Yi9zdG9yYWdlL3VudXN1YWxfdWFzLmgKPiA+IEBAIC0xOTgsNiArMTk4LDEzIEBAIFVOVVNVQUxf
REVWKDB4MTU0YiwgMHhmMDBkLCAweDAwMDAsIDB4OTk5OSwKPiA+wqAgVVNCX1NDX0RFVklDRSwg
VVNCX1BSX0RFVklDRSwgTlVMTCwKPiA+wqAgVVNfRkxfTk9fQVRBXzFYKSwKPiA+wqAKPiA+ICsv
KiBSZXBvcnRlZC1ieTogSG9uZ2xpbmcgWmVuZyA8emVuZ2hvbmdsaW5nQGt5bGlub3MuY24+ICov
Cj4gPiArVU5VU1VBTF9ERVYoMHgxN2VmLCAweDM4OTksIDB4MDAwMCwgMHg5OTk5LAo+ID4gKwki
VGhpbmtwbHVzIiwKPiA+ICsJIkV4dGVybmFsIEhERCIsCj4gPiArCVVTQl9TQ19ERVZJQ0UsIFVT
Ql9QUl9ERVZJQ0UsIE5VTEwsCj4gPiArCVVTX0ZMX0lHTk9SRV9VQVMpLAo+ID4gKwo+ID7CoCAv
KiBSZXBvcnRlZC1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4gKi8KPiA+
wqAgVU5VU1VBTF9ERVYoMHgyMTA5LCAweDA3MTEsIDB4MDAwMCwgMHg5OTk5LAo+ID7CoCAiVklB
IiwKPiA+IC0tCj4gPiAyLjEuMAo+ID4=


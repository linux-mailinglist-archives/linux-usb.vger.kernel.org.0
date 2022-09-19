Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08AFB5BC12D
	for <lists+linux-usb@lfdr.de>; Mon, 19 Sep 2022 03:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbiISB7v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 18 Sep 2022 21:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbiISB7r (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 18 Sep 2022 21:59:47 -0400
Received: from m1564.mail.126.com (m1564.mail.126.com [220.181.15.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 109655599
        for <linux-usb@vger.kernel.org>; Sun, 18 Sep 2022 18:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=pOPtu
        v5cMaHVMFYzyTchkFfq5TJm1dnNFIAHVQioDlI=; b=k4bQJ3pgUYOSzAR0YvZOc
        Mr5c6pEvp6ylxErsGRmlLfkPbxSicAA1UT1MCNbjlO7MY2vq6qeIvB27Sk0tWce7
        7IplxZGZY6rPKFoV78ge4c+QjUzWHRcjhQiy84EVrhQZGzMA8qgkx1ntf0UY0UxA
        fJkrrSUG+yonmgt6CKfwis=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr64
 (Coremail) ; Mon, 19 Sep 2022 09:59:17 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date:   Mon, 19 Sep 2022 09:59:17 +0800 (CST)
From:   "Liang He" <windhl@126.com>
To:     "Alan Stern" <stern@rowland.harvard.edu>
Cc:     johan@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: Re:Re: Re: [PATCH] USB: serial: console: Fix potential
 use-after-free in usb_console_setup()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <YySYD5URgLg3XPLs@rowland.harvard.edu>
References: <20220916073552.4093048-1-windhl@126.com>
 <YySQYi1S7GSDw7hQ@rowland.harvard.edu>
 <4b825ec3.7ceb.18346e2fa14.Coremail.windhl@126.com>
 <YySYD5URgLg3XPLs@rowland.harvard.edu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <7e842e47.16c8.1835378a0be.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: QMqowAB3f3P3zCdjvpJyAA--.1057W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuBKBF2JVlcDADQABsS
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

CkF0IDIwMjItMDktMTYgMjM6MzY6NDcsICJBbGFuIFN0ZXJuIiA8c3Rlcm5Acm93bGFuZC5oYXJ2
YXJkLmVkdT4gd3JvdGU6Cj5PbiBGcmksIFNlcCAxNiwgMjAyMiBhdCAxMToyMDoyM1BNICswODAw
LCBMaWFuZyBIZSB3cm90ZToKPj4gCj4+IAo+PiBBdCAyMDIyLTA5LTE2IDIzOjA0OjAyLCAiQWxh
biBTdGVybiIgPHN0ZXJuQHJvd2xhbmQuaGFydmFyZC5lZHU+IHdyb3RlOgo+PiA+T24gRnJpLCBT
ZXAgMTYsIDIwMjIgYXQgMDM6MzU6NTJQTSArMDgwMCwgTGlhbmcgSGUgd3JvdGU6Cj4+ID4+IElu
IHVzYl9jb25zb2xlX3NldHVwKCksIGlmIHdlIGdvdG8gZXJyb3JfZ2V0X2ludGVyZmFjZSBhbmQg
dGhlCj4+ID4+IHVzYl9zZXJpYWxfcHV0KCkgbWF5IGZpbmFsbHkgY2FsbCBrZnJlZShzZXJpYWwp
LiBIb3dldmVyLCB0aGUgbmV4dAo+PiA+PiBsaW5lIHdpbGwgY2FsbCAnbXV0ZXhfdW5sb2NrKCZz
ZXJpYWwtPmRpc2NfbXV0ZXgpJyB3aGljaCBjYW4gY2F1c2UKPj4gPj4gYSBwb3RlbnRpYWwgVUFG
IGJ1Zy4KPj4gPgo+PiA+V2h5IG5vdCBqdXN0IG1vdmUgdGhlIG11dGV4X3VubG9jaygpIGNhbGwg
dXAgb25lIGxpbmUsIGJlZm9yZSB0aGUgCj4+ID51c2Jfc2VyaWFsX3B1dCgpPwo+PiA+Cj4+ID4+
IEZpeGVzOiA3YmQwMzJkYzI3OTMgKCJVU0Igc2VyaWFsOiB1cGRhdGUgdGhlIGNvbnNvbGUgZHJp
dmVyIikKPj4gPj4gU2lnbmVkLW9mZi1ieTogTGlhbmcgSGUgPHdpbmRobEAxMjYuY29tPgo+PiA+
PiAtLS0KPj4gPj4gCj4+ID4+ICBJIGRvbid0IGtub3cgaWYgdGhlIHJlZmNvdW50IGNhbiBiZSB6
ZXJvIGhlcmUsIHNvIGlmIGl0IGNhbm5vdCBiZSB6ZXJvLAo+PiA+PiB0aGlzIGNvZGUgaXMgc2Fm
ZSBhbmQgcGxlYXNlIGlnbm9yZSBteSBwYXRjaC4KPj4gPj4gCj4+ID4+ICBkcml2ZXJzL3VzYi9z
ZXJpYWwvY29uc29sZS5jIHwgNSArKystLQo+PiA+PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4gPj4gCj4+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3VzYi9zZXJpYWwvY29uc29sZS5jIGIvZHJpdmVycy91c2Ivc2VyaWFsL2NvbnNvbGUuYwo+PiA+
PiBpbmRleCBiOTdhYTQwY2E0ZDEuLjIxYWMyZGQ2YmFjYSAxMDA2NDQKPj4gPj4gLS0tIGEvZHJp
dmVycy91c2Ivc2VyaWFsL2NvbnNvbGUuYwo+PiA+PiArKysgYi9kcml2ZXJzL3VzYi9zZXJpYWwv
Y29uc29sZS5jCj4+ID4+IEBAIC02Miw2ICs2Miw3IEBAIHN0YXRpYyBpbnQgdXNiX2NvbnNvbGVf
c2V0dXAoc3RydWN0IGNvbnNvbGUgKmNvLCBjaGFyICpvcHRpb25zKQo+PiA+PiAgCWludCBjZmxh
ZyA9IENSRUFEIHwgSFVQQ0wgfCBDTE9DQUw7Cj4+ID4+ICAJY2hhciAqczsKPj4gPj4gIAlzdHJ1
Y3QgdXNiX3NlcmlhbCAqc2VyaWFsOwo+PiA+PiArCXN0cnVjdCBtdXRleCAqc19tdXRleDsKPj4g
Pj4gIAlzdHJ1Y3QgdXNiX3NlcmlhbF9wb3J0ICpwb3J0Owo+PiA+PiAgCWludCByZXR2YWw7Cj4+
ID4+ICAJc3RydWN0IHR0eV9zdHJ1Y3QgKnR0eSA9IE5VTEw7Cj4+ID4+IEBAIC0xMTYsNyArMTE3
LDcgQEAgc3RhdGljIGludCB1c2JfY29uc29sZV9zZXR1cChzdHJ1Y3QgY29uc29sZSAqY28sIGNo
YXIgKm9wdGlvbnMpCj4+ID4+ICAJCXJldHVybiAtRU5PREVWOwo+PiA+PiAgCX0KPj4gPj4gIAlz
ZXJpYWwgPSBwb3J0LT5zZXJpYWw7Cj4+ID4+IC0KPj4gPj4gKwlzX211dGV4ID0gJnNlcmlhbC0+
ZGlzY19tdXRleDsKPj4gPj4gIAlyZXR2YWwgPSB1c2JfYXV0b3BtX2dldF9pbnRlcmZhY2Uoc2Vy
aWFsLT5pbnRlcmZhY2UpOwo+PiA+PiAgCWlmIChyZXR2YWwpCj4+ID4+ICAJCWdvdG8gZXJyb3Jf
Z2V0X2ludGVyZmFjZTsKPj4gPj4gQEAgLTE5MCw3ICsxOTEsNyBAQCBzdGF0aWMgaW50IHVzYl9j
b25zb2xlX3NldHVwKHN0cnVjdCBjb25zb2xlICpjbywgY2hhciAqb3B0aW9ucykKPj4gPj4gIAl1
c2JfYXV0b3BtX3B1dF9pbnRlcmZhY2Uoc2VyaWFsLT5pbnRlcmZhY2UpOwo+PiA+PiAgIGVycm9y
X2dldF9pbnRlcmZhY2U6Cj4+ID4+ICAJdXNiX3NlcmlhbF9wdXQoc2VyaWFsKTsKPj4gPj4gLQlt
dXRleF91bmxvY2soJnNlcmlhbC0+ZGlzY19tdXRleCk7Cj4+ID4+ICsJbXV0ZXhfdW5sb2NrKHNf
bXV0ZXgpOwo+PiA+Cj4+ID5JZiB0aGUgb2xkIGNvZGUgd2FzIHVuc2FmZSB0aGVuIHNvIGlzIHRo
aXMsIGJlY2F1c2Ugc19tdXRleCBwb2ludHMgdG8gYSAKPj4gPm11dGV4IHRoYXQgaXMgZW1iZWRk
ZWQgd2l0aGluIHRoZSBzZXJpYWwgc3RydWN0dXJlLiAgSWYgdGhlIHN0cnVjdHVyZSAKPj4gPndh
cyBkZWFsbG9jYXRlZCBieSB1c2Jfc2VyaWFsX3B1dCgpIHRoZW4gc28gd2FzIHRoZSBtdXRleC4K
Pj4gPgo+PiA+QWxhbiBTdGVybgo+PiA+Cj4+ID4+ICAJcmV0dXJuIHJldHZhbDsKPj4gPj4gIH0K
Pj4gPj4gIAo+PiA+PiAtLSAKPj4gPj4gMi4yNS4xCj4+ID4+IAo+PiAKPj4gSGksIEFsYW4gU3Rl
cm4sCj4+IAo+PiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3IGFuZCB0aGlzIHBhdGNoIGlzIGluZGVl
ZCB3cm9uZyEKPj4gCj4+IEJ1dCBJIGFtIG5vdCBzdXJlIGlmIHdlIGNhbiBzYWZlbHkgbW92ZSB0
aGUgdXNiX3NlcmlhbF9wdXQoKQo+PiBvdXQgb2YgbXV0ZXhfdW5sb2NrKCkuCj4+IAo+PiBJZiBp
dCBpcyBzYWZlLCBJIGNhbiBnaXZlIGEgbmV3IHZlcnNpb24gb2YgcGF0Y2ggdmVyeSBzb29uLgo+
PiAKPj4gQ2FuIHlvdSBoZWxwIG1lIGNvbmZpcm0gaWYgaXQgaXMgc2FmZT8KPgo+SSBjYW5ub3Qu
ICBZb3UgbmVlZCB0byBhc2sgSm9oYW4gKHRoZSBVU0Itc2VyaWFsIG1haW50YWluZXIpLgo+Cj5B
bGFuIFN0ZXJuCgpTdGlsbCB0aGFua3MhCgpBbmQgZnJvbSBhIHJlY2VudCBzaW1pbGFyIGNvbW1p
dCwgSSB0aGluayB3ZSBjYW4gbW92ZSBtdXRleF91bmxvY2sgYWJvdmUgdGhlIHVzYl9zZXJpYWxf
cHV0KCk6CgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90
b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9oPXY2LjAtcmM1JmlkPTZjNTNiNDVjNzFiNDkyMGI1
ZTYyZjBlYTgwNzlhMWRhMzgyYjk0MzQKCkpvaGFuLCBwbGVhc2UgY29uZmlybSBpZiB0aGlzIGNh
biBiZSBhY2NlcHRlZC4KClRoYW5rcywKCkxpYW5nCgoK

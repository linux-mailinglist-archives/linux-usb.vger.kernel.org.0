Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED955BB019
	for <lists+linux-usb@lfdr.de>; Fri, 16 Sep 2022 17:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiIPPVl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Sep 2022 11:21:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231341AbiIPPVk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Sep 2022 11:21:40 -0400
Received: from m1564.mail.126.com (m1564.mail.126.com [220.181.15.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8E4898E4DB
        for <linux-usb@vger.kernel.org>; Fri, 16 Sep 2022 08:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=gJXov
        iKbVGVfiIhSnJcpFIUzcvkw9o18UjADNR7CGSs=; b=KuANHkCHhLT6cVTxuN5rz
        CMtabJFWspsNNaCh259tx/Ooi+cTXMXp7Z2/015GC0+0AZhJ+cTKCscDwu0az2LC
        QOCsLQUoZy9Kfe7cWLiO9wzOehGIjJCYg5QcdmnOrtzhOWVy/UHCYX/ktOWEnvUJ
        cae2BQ254cH9yN/QAHJVTc=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr64
 (Coremail) ; Fri, 16 Sep 2022 23:20:23 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date:   Fri, 16 Sep 2022 23:20:23 +0800 (CST)
From:   "Liang He" <windhl@126.com>
To:     "Alan Stern" <stern@rowland.harvard.edu>
Cc:     johan@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: Re:Re: [PATCH] USB: serial: console: Fix potential use-after-free
 in usb_console_setup()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <YySQYi1S7GSDw7hQ@rowland.harvard.edu>
References: <20220916073552.4093048-1-windhl@126.com>
 <YySQYi1S7GSDw7hQ@rowland.harvard.edu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <4b825ec3.7ceb.18346e2fa14.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: QMqowAAnL3M4lCRjFdVxAA--.53233W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7QJ+F1pEAuku2QACsG
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

CgpBdCAyMDIyLTA5LTE2IDIzOjA0OjAyLCAiQWxhbiBTdGVybiIgPHN0ZXJuQHJvd2xhbmQuaGFy
dmFyZC5lZHU+IHdyb3RlOgo+T24gRnJpLCBTZXAgMTYsIDIwMjIgYXQgMDM6MzU6NTJQTSArMDgw
MCwgTGlhbmcgSGUgd3JvdGU6Cj4+IEluIHVzYl9jb25zb2xlX3NldHVwKCksIGlmIHdlIGdvdG8g
ZXJyb3JfZ2V0X2ludGVyZmFjZSBhbmQgdGhlCj4+IHVzYl9zZXJpYWxfcHV0KCkgbWF5IGZpbmFs
bHkgY2FsbCBrZnJlZShzZXJpYWwpLiBIb3dldmVyLCB0aGUgbmV4dAo+PiBsaW5lIHdpbGwgY2Fs
bCAnbXV0ZXhfdW5sb2NrKCZzZXJpYWwtPmRpc2NfbXV0ZXgpJyB3aGljaCBjYW4gY2F1c2UKPj4g
YSBwb3RlbnRpYWwgVUFGIGJ1Zy4KPgo+V2h5IG5vdCBqdXN0IG1vdmUgdGhlIG11dGV4X3VubG9j
aygpIGNhbGwgdXAgb25lIGxpbmUsIGJlZm9yZSB0aGUgCj51c2Jfc2VyaWFsX3B1dCgpPwo+Cj4+
IEZpeGVzOiA3YmQwMzJkYzI3OTMgKCJVU0Igc2VyaWFsOiB1cGRhdGUgdGhlIGNvbnNvbGUgZHJp
dmVyIikKPj4gU2lnbmVkLW9mZi1ieTogTGlhbmcgSGUgPHdpbmRobEAxMjYuY29tPgo+PiAtLS0K
Pj4gCj4+ICBJIGRvbid0IGtub3cgaWYgdGhlIHJlZmNvdW50IGNhbiBiZSB6ZXJvIGhlcmUsIHNv
IGlmIGl0IGNhbm5vdCBiZSB6ZXJvLAo+PiB0aGlzIGNvZGUgaXMgc2FmZSBhbmQgcGxlYXNlIGln
bm9yZSBteSBwYXRjaC4KPj4gCj4+ICBkcml2ZXJzL3VzYi9zZXJpYWwvY29uc29sZS5jIHwgNSAr
KystLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
Pj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9zZXJpYWwvY29uc29sZS5jIGIvZHJpdmVy
cy91c2Ivc2VyaWFsL2NvbnNvbGUuYwo+PiBpbmRleCBiOTdhYTQwY2E0ZDEuLjIxYWMyZGQ2YmFj
YSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy91c2Ivc2VyaWFsL2NvbnNvbGUuYwo+PiArKysgYi9k
cml2ZXJzL3VzYi9zZXJpYWwvY29uc29sZS5jCj4+IEBAIC02Miw2ICs2Miw3IEBAIHN0YXRpYyBp
bnQgdXNiX2NvbnNvbGVfc2V0dXAoc3RydWN0IGNvbnNvbGUgKmNvLCBjaGFyICpvcHRpb25zKQo+
PiAgCWludCBjZmxhZyA9IENSRUFEIHwgSFVQQ0wgfCBDTE9DQUw7Cj4+ICAJY2hhciAqczsKPj4g
IAlzdHJ1Y3QgdXNiX3NlcmlhbCAqc2VyaWFsOwo+PiArCXN0cnVjdCBtdXRleCAqc19tdXRleDsK
Pj4gIAlzdHJ1Y3QgdXNiX3NlcmlhbF9wb3J0ICpwb3J0Owo+PiAgCWludCByZXR2YWw7Cj4+ICAJ
c3RydWN0IHR0eV9zdHJ1Y3QgKnR0eSA9IE5VTEw7Cj4+IEBAIC0xMTYsNyArMTE3LDcgQEAgc3Rh
dGljIGludCB1c2JfY29uc29sZV9zZXR1cChzdHJ1Y3QgY29uc29sZSAqY28sIGNoYXIgKm9wdGlv
bnMpCj4+ICAJCXJldHVybiAtRU5PREVWOwo+PiAgCX0KPj4gIAlzZXJpYWwgPSBwb3J0LT5zZXJp
YWw7Cj4+IC0KPj4gKwlzX211dGV4ID0gJnNlcmlhbC0+ZGlzY19tdXRleDsKPj4gIAlyZXR2YWwg
PSB1c2JfYXV0b3BtX2dldF9pbnRlcmZhY2Uoc2VyaWFsLT5pbnRlcmZhY2UpOwo+PiAgCWlmIChy
ZXR2YWwpCj4+ICAJCWdvdG8gZXJyb3JfZ2V0X2ludGVyZmFjZTsKPj4gQEAgLTE5MCw3ICsxOTEs
NyBAQCBzdGF0aWMgaW50IHVzYl9jb25zb2xlX3NldHVwKHN0cnVjdCBjb25zb2xlICpjbywgY2hh
ciAqb3B0aW9ucykKPj4gIAl1c2JfYXV0b3BtX3B1dF9pbnRlcmZhY2Uoc2VyaWFsLT5pbnRlcmZh
Y2UpOwo+PiAgIGVycm9yX2dldF9pbnRlcmZhY2U6Cj4+ICAJdXNiX3NlcmlhbF9wdXQoc2VyaWFs
KTsKPj4gLQltdXRleF91bmxvY2soJnNlcmlhbC0+ZGlzY19tdXRleCk7Cj4+ICsJbXV0ZXhfdW5s
b2NrKHNfbXV0ZXgpOwo+Cj5JZiB0aGUgb2xkIGNvZGUgd2FzIHVuc2FmZSB0aGVuIHNvIGlzIHRo
aXMsIGJlY2F1c2Ugc19tdXRleCBwb2ludHMgdG8gYSAKPm11dGV4IHRoYXQgaXMgZW1iZWRkZWQg
d2l0aGluIHRoZSBzZXJpYWwgc3RydWN0dXJlLiAgSWYgdGhlIHN0cnVjdHVyZSAKPndhcyBkZWFs
bG9jYXRlZCBieSB1c2Jfc2VyaWFsX3B1dCgpIHRoZW4gc28gd2FzIHRoZSBtdXRleC4KPgo+QWxh
biBTdGVybgo+Cj4+ICAJcmV0dXJuIHJldHZhbDsKPj4gIH0KPj4gIAo+PiAtLSAKPj4gMi4yNS4x
Cj4+IAoKSGksIEFsYW4gU3Rlcm4sCgpUaGFua3MgZm9yIHlvdXIgcmV2aWV3IGFuZCB0aGlzIHBh
dGNoIGlzIGluZGVlZCB3cm9uZyEKCkJ1dCBJIGFtIG5vdCBzdXJlIGlmIHdlIGNhbiBzYWZlbHkg
bW92ZSB0aGUgdXNiX3NlcmlhbF9wdXQoKQpvdXQgb2YgbXV0ZXhfdW5sb2NrKCkuCgpJZiBpdCBp
cyBzYWZlLCBJIGNhbiBnaXZlIGEgbmV3IHZlcnNpb24gb2YgcGF0Y2ggdmVyeSBzb29uLgoKQ2Fu
IHlvdSBoZWxwIG1lIGNvbmZpcm0gaWYgaXQgaXMgc2FmZT8KClRoYW5rcyBhZ2FpbiwKCkxpYW5n


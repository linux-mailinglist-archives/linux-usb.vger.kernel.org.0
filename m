Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7F764FB36F
	for <lists+linux-usb@lfdr.de>; Mon, 11 Apr 2022 08:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243805AbiDKGG3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Apr 2022 02:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbiDKGG2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Apr 2022 02:06:28 -0400
Received: from zju.edu.cn (spam.zju.edu.cn [61.164.42.155])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D34B02AE0
        for <linux-usb@vger.kernel.org>; Sun, 10 Apr 2022 23:04:12 -0700 (PDT)
Received: by ajax-webmail-mail-app2 (Coremail) ; Mon, 11 Apr 2022 14:04:07
 +0800 (GMT+08:00)
X-Originating-IP: [222.205.8.117]
Date:   Mon, 11 Apr 2022 14:04:07 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   "Lin Ma" <linma@zju.edu.cn>
To:     "Alan Stern" <stern@rowland.harvard.edu>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net, mdharm-usb@one-eyed-alien.net
Subject: Re: [PATCH v0] USB: storage: karma: fix rio_karma_init return
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2022 www.mailtech.cn zju.edu.cn
In-Reply-To: <Yk73B5jKKMoYFCoj@rowland.harvard.edu>
References: <20220406100259.6483-1-linma@zju.edu.cn>
 <Yk2tR4iEr5/T6o+h@rowland.harvard.edu>
 <18ed9d8e.3c7eb.1800193253f.Coremail.linma@zju.edu.cn>
 <Yk73B5jKKMoYFCoj@rowland.harvard.edu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <62bedbe9.4ec5.1801738e9ce.Coremail.linma@zju.edu.cn>
X-Coremail-Locale: en_US
X-CM-TRANSID: by_KCgAHXxXXxFNiWquDAQ--.33860W
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/1tbiAwIRElNG3GSM3AACs9
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGVsbG8gQWxhbiwKClNvcnJ5IGZvciB0aGUgZGVsYXkuIEkndmUgc2VudCBhbm90aGVyIHZlcnNp
b24gb2YgdGhpcyBwYXRjaC4KCj4gCj4gVGhhdCBpc24ndCB0cnVlLiAgTG9vayBhZ2FpbiBhdCB0
aGUgY29kZToKPiAKPiA+IC8qCj4gPiAgKiBKdXN0IGJlZm9yZSB3ZSBzdGFydCBvdXIgY29udHJv
bCB0aHJlYWQsIGluaXRpYWxpemUKPiA+ICAqIHRoZSBkZXZpY2UgaWYgaXQgbmVlZHMgaW5pdGlh
bGl6YXRpb24KPiA+ICAqLwo+ID4gIGlmICh1cy0+dW51c3VhbF9kZXYtPmluaXRGdW5jdGlvbikg
ewo+ID4gICAgICBwID0gdXMtPnVudXN1YWxfZGV2LT5pbml0RnVuY3Rpb24odXMpOwo+ID4gICAg
ICBpZiAocCkKPiA+ICAgICAgICAgIHJldHVybiBwOwo+IAo+IElmIHAgaXNuJ3QgemVybyB0aGVu
IHRoaXMgZnVuY3Rpb24gdXNlcyBwIGFzIGl0cyByZXR1cm4gdmFsdWUuICBUaHVzIGl0IAo+IGRv
ZXMgbW9yZSB3aXRoIHAgdGhhbiBqdXN0IGNoZWNrIHdoZXRoZXIgaXQgaXMgemVyby4KPiAKClll
YWgsIHlvdSBhcmUgcmlnaHQuIFdlbGwgd2hhdCBJIG1lYW4gYWJvdXQgdGhlICJiYWQgdGhpbmci
IGlzIHRoYXQgc29tZXRoaW5nIHdyb25nIGJ1dCB0aGUgdXNiIGNvcmUgY29udGludWUgdG8gaW5z
dGFsbCB0aGlzIGRyaXZlciwganVzdCBsaWtlIHdoYXQgdGhlIGthcmFtIGRyaXZlciBpcyBkb2lu
Zy4KCj4gPiAgfQo+ID4gCj4gPiBJIHdpbGwgdGhlbiBzZW5kIHBhdGNoZXMgdG8gbWFrZSBzdXJl
IGFsbCBpbml0RnVuY3Rpb24gZm9sbG93IHRoZSBzdGFuZGFyZC4KPiA+IAo+ID4gPiAKPiA+ID4g
QW5kIGRvbid0IGZvcmdldCB0aGUgZXJyb3IgY29kZSBmb3Igd2hlbiB0aGUgcmlvX2thcm1hX3Nl
bmRfY29tbWFuZCgpIAo+ID4gPiBjYWxsIGZhaWxzLiAgSW4gdGhhdCBjYXNlIHRoZSByZXR1cm4g
dmFsdWUgc2hvdWxkIGJlIC1FSU8uCj4gPiA+IAo+ID4gCj4gPiBPa2F5LCB3aWxsIGFkZCB0aGlz
IGluIG5leHQgdmVyc2lvbiBvZiB0aGlzIHBhdGNoLgo+ID4gCj4gPiA+IAo+ID4gPiBTaG91bGRu
J3QgdGhpcyBhbHNvIGJlIG1hcmtlZCBmb3IgdGhlIHN0YWJsZSBrZXJuZWxzPwo+ID4gPiAKPiA+
IAo+ID4gU29ycnksIEkgZGlkbid0IGdldCBpdCwgZG8geW91IG1lYW4gYWRkIGFub3RoZXIgdGFn
IGxpa2UgIkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnIj8KPiA+IE9yIEkganVzdCBuZWVkIHRv
IENDIHRoZSBtYWlsIHRvIHN0YWJsZSBtYWlsIGxpc3Q/Cj4gCj4gSSBtZWFuIGFkZCBhbm90aGVy
IHRhZy4gIFNlZSB0aGUgZGVzY3JpcHRpb24gb2YgT3B0aW9uIDEgaW4gCj4gRG9jdW1lbnRhdGlv
bi9wcm9jZXNzL3N0YWJsZS1rZXJuZWwtcnVsZXMucnN0Lgo+IAoKQ29vbCwgaGF2ZSBhZGRlZCB0
aGlzIG9uZS4KTGluazogaHR0cHM6Ly9tYXJjLmluZm8vP2w9bGludXgtdXNiJm09MTY0OTY1Njk1
MjI4MzE0Jnc9MgoKVGhhbmtzCkxpbiBNYQoKPiBBbGFuIFN0ZXJuCj4gCj4gPiAKPiA+IFJlZ2Fy
ZHMKPiA+IExpbgo=

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5AF350E38D
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 16:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239283AbiDYOsO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 10:48:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235491AbiDYOsN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 10:48:13 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DB64C5D
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 07:45:07 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id BA1B560007;
        Mon, 25 Apr 2022 14:45:04 +0000 (UTC)
Message-ID: <560fd2754f549c904300327f0a609085015f37f4.camel@hadess.net>
Subject: Re: [RFC v1] USB: core: add USBDEVFS_REVOKE ioctl
From:   Bastien Nocera <hadess@hadess.net>
To:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Date:   Mon, 25 Apr 2022 16:45:04 +0200
In-Reply-To: <903b294f-8407-3438-54a9-3c96e361be41@suse.com>
References: <20220425132315.924477-1-hadess@hadess.net>
         <903b294f-8407-3438-54a9-3c96e361be41@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gTW9uLCAyMDIyLTA0LTI1IGF0IDE1OjQ5ICswMjAwLCBPbGl2ZXIgTmV1a3VtIHdyb3RlOgo+
IAo+IAo+IE9uIDI1LjA0LjIyIDE1OjIzLCBCYXN0aWVuIE5vY2VyYSB3cm90ZToKPiA+IMKgc3Ry
dWN0IHVzYl9tZW1vcnkgewo+ID4gQEAgLTIzNyw2ICsyMzgsOSBAQCBzdGF0aWMgaW50IHVzYmRl
dl9tbWFwKHN0cnVjdCBmaWxlICpmaWxlLAo+ID4gc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEp
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgZG1hX2FkZHJfdCBkbWFfaGFuZGxlOwo+ID4gwqDCoMKgwqDC
oMKgwqDCoGludCByZXQ7Cj4gPiDCoAo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKCFjb25uZWN0ZWQo
cHMpIHx8IHBzLT5yZXZva2VkKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
dHVybiAtRU5PREVWOwo+ID4gKwo+IFRoaXMgbGFja3MgbG9ja2luZy4KCkFkZGVkIGxvY2tpbmcu
Cgo+ID4gwqAKPiA+ICtzdGF0aWMgaW50IHVzYmRldl9yZXZva2Uoc3RydWN0IHVzYl9kZXZfc3Rh
dGUgKnBzKQo+ID4gK3sKPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCB1c2JfZGV2aWNlICpkZXYg
PSBwcy0+ZGV2Owo+ID4gK8KgwqDCoMKgwqDCoMKgdW5zaWduZWQgaW50IGlmbnVtOwo+ID4gK8Kg
wqDCoMKgwqDCoMKgc3RydWN0IGFzeW5jICphczsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoGlm
IChwcy0+cmV2b2tlZCkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4g
LUVOT0RFVjsKPiA+ICvCoMKgwqDCoMKgwqDCoHBzLT5yZXZva2VkID0gdHJ1ZTsKPiA+ICsKPiA+
ICvCoMKgwqDCoMKgwqDCoHVzYl9sb2NrX2RldmljZShkZXYpOwo+IEFuZCBoZXJlIHlvdSBsb2Nr
IHRoZSBkZXZpY2UgYSBzZWNvbmQgdGltZS4gVGhhdCBpcyBhIGJhZCBpZGVhLgoKSSd2ZSByZW1v
dmVkIHRoZSBsb2NraW5nIGluIHRoaXMgZnVuY3Rpb24uCgo+ID4gK8KgwqDCoMKgwqDCoMKgZm9y
IChpZm51bSA9IDA7IHBzLT5pZmNsYWltZWQgJiYgaWZudW0gPCA4KnNpemVvZihwcy0KPiA+ID5p
ZmNsYWltZWQpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBpZm51bSsrKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHRl
c3RfYml0KGlmbnVtLCAmcHMtPmlmY2xhaW1lZCkpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlbGVhc2VpbnRmKHBzLCBpZm51bSk7Cj4gPiArwqDC
oMKgwqDCoMKgwqB9Cj4gPiArwqDCoMKgwqDCoMKgwqBkZXN0cm95X2FsbF9hc3luYyhwcyk7Cj4g
PiArwqDCoMKgwqDCoMKgwqB1c2JfdW5sb2NrX2RldmljZShkZXYpOwo+ID4gKwo+ID4gK8KgwqDC
oMKgwqDCoMKgYXMgPSBhc3luY19nZXRjb21wbGV0ZWQocHMpOwo+ID4gK8KgwqDCoMKgwqDCoMKg
d2hpbGUgKGFzKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZnJlZV9hc3lu
Yyhhcyk7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYXMgPSBhc3luY19nZXRj
b21wbGV0ZWQocHMpOwo+ID4gK8KgwqDCoMKgwqDCoMKgfQo+ID4gKwo+ID4gK8KgwqDCoMKgwqDC
oMKgcmV0dXJuIDA7Cj4gPiArfQo+IEdldHRpbmcgeW91ciBmaWxlIGRlc2NyaXB0b3IgcmV2b2tl
ZCBzaG91bGQgd2FrZSB5b3UgdXAKPiBmcm9tIHBvbGwoKSwgc2hvdWxkbid0IGl0PwoKQWRkZWQg
YSB3YWtldXAuCgo+IAo+ID4gKwo+ID4gwqAvKgo+ID4gwqAgKiBOT1RFOsKgIEFsbCByZXF1ZXN0
cyBoZXJlIHRoYXQgaGF2ZSBpbnRlcmZhY2UgbnVtYmVycyBhcwo+ID4gcGFyYW1ldGVycwo+ID4g
wqAgKiBhcmUgYXNzdW1pbmcgdGhhdCBzb21laG93IHRoZSBjb25maWd1cmF0aW9uIGhhcyBiZWVu
IHByZXZlbnRlZAo+ID4gZnJvbQo+ID4gQEAgLTI2MTksNyArMjY2MCw3IEBAIHN0YXRpYyBsb25n
IHVzYmRldl9kb19pb2N0bChzdHJ1Y3QgZmlsZQo+ID4gKmZpbGUsIHVuc2lnbmVkIGludCBjbWQs
Cj4gPiDCoCNlbmRpZgo+ID4gwqDCoMKgwqDCoMKgwqDCoH0KPiA+IMKgCj4gPiAtwqDCoMKgwqDC
oMKgwqBpZiAoIWNvbm5lY3RlZChwcykpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghY29ubmVj
dGVkKHBzKSB8fCBwcy0+cmV2b2tlZCkgewo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqB1c2JfdW5sb2NrX2RldmljZShkZXYpOwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqByZXR1cm4gLUVOT0RFVjsKPiA+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gPiBAQCAtMjc3
OSw2ICsyODIwLDExIEBAIHN0YXRpYyBsb25nIHVzYmRldl9kb19pb2N0bChzdHJ1Y3QgZmlsZQo+
ID4gKmZpbGUsIHVuc2lnbmVkIGludCBjbWQsCj4gPiDCoMKgwqDCoMKgwqDCoMKgY2FzZSBVU0JE
RVZGU19XQUlUX0ZPUl9SRVNVTUU6Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHJldCA9IHByb2Nfd2FpdF9mb3JfcmVzdW1lKHBzKTsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgYnJlYWs7Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIFVTQkRFVkZTX1JFVk9L
RToKPiBZb3UgYXJlIHN0aWxsIGluIHVzYl9sb2NrX2RldmljZSgpCgpOb3RlZC4KCj4gCj4gwqDC
oMKgIFJlZ2FyZHMKPiDCoMKgwqAgwqDCoMKgIE9saXZlcgo+IAoKSSdsbCBwb3N0IHRob3NlIGNo
YW5nZXMgaW4gdjIsIHRoYW5rcy4K


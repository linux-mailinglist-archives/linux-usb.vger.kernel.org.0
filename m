Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B93C6C68DE
	for <lists+linux-usb@lfdr.de>; Thu, 23 Mar 2023 13:52:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231620AbjCWMwr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Mar 2023 08:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231263AbjCWMwr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Mar 2023 08:52:47 -0400
Received: from voltaic.bi-co.net (voltaic.bi-co.net [134.119.3.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF8381C318
        for <linux-usb@vger.kernel.org>; Thu, 23 Mar 2023 05:52:45 -0700 (PDT)
Received: from [192.168.0.36] (ip-037-201-145-251.um10.pools.vodafone-ip.de [37.201.145.251])
        by voltaic.bi-co.net (Postfix) with ESMTPSA id 74EB820E97;
        Thu, 23 Mar 2023 13:52:43 +0100 (CET)
Message-ID: <646eb1bb5218b9ce5df21e89081b09b84dbd46fd.camel@bi-co.net>
Subject: Re: Cypress CDC ACM serial port not working correctly with
 autosuspend
From:   Michael =?ISO-8859-1?Q?La=DF?= <bevan@bi-co.net>
To:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Date:   Thu, 23 Mar 2023 13:52:43 +0100
In-Reply-To: <e977c0e1-4604-47cc-9c53-619bc897d418@suse.com>
References: <8be9b56c6becd0981d1cd9c13742df6ba2975b56.camel@bi-co.net>
         <0db2a0a4-6ed4-fe06-217a-cb564f1d4a8c@suse.com>
         <bde43a1913cf55e580e77ac0e059fff3c26dc093.camel@bi-co.net>
         <2f98290f-995b-89ff-8ba2-1463fcf78297@suse.com>
         <9a1381abe0e2b605786bc9c3b2daa3f7bdc3b64c.camel@bi-co.net>
         <e977c0e1-4604-47cc-9c53-619bc897d418@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4 
MIME-Version: 1.0
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksCgpBbSBEb25uZXJzdGFnLCBkZW0gMjMuMDMuMjAyMyB1bSAxMDo1MSArMDEwMCBzY2hyaWVi
IE9saXZlciBOZXVrdW06Cj4gT24gMTguMDMuMjMgMTM6MDksIE1pY2hhZWwgTGHDnyB3cm90ZToK
PiA+IMKgwqAgLS0+IG5vIG1vcmUgY29tbXVuaWNhdGlvbgo+IAo+IEp1c3QgdG8gYmUgY2xlYXIs
IHRoZSBkZXZpY2UgaXMgZ2VuZXJhdGluZyBkYXRhLCBpc24ndCBpdD8KPiBTbyB5b3Ugd291bGQg
aGF2ZSBleHBlY3RlZCBkYXRhIGZyb20gYSBzdXNwZW5kZWQgZGV2aWNlPwoKWWVzLCB0aGUgcmVt
b3RlIGRldmljZSBpcyBwcm9ncmFtbWVkIHRvIHByaW50ICJIZWxsbyBXb3JsZCIgZXZlcnkgdGhy
ZWUKc2Vjb25kcy4gTm90aGluZyBzaG91bGQgaGF2ZSBzdG9wcGVkIGl0IGZyb20gZG9pbmcgdGhh
dC4KCj4gQWNjb3JkaW5nIHRvIHlvdXIgZWFybGllciByZXBvcnQsIHRoZSBkZXZpY2UgZG9lcyBz
dXBwb3J0Cj4gcmVtb3RlIHdha2V1cDoKPiAKPiBCdXMgMDA2IERldmljZSAwMTA6IElEIDA0YjQ6
MDAwOCBDeXByZXNzIFNlbWljb25kdWN0b3IgQ29ycC4gQ0RDIEFDTQo+IHNlcmlhbCBwb3J0Cj4g
RGV2aWNlIERlc2NyaXB0b3I6Cj4gwqDCoCBiTGVuZ3RowqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDE4Cj4gwqDCoCBiRGVzY3JpcHRvclR5cGXCoMKgwqDCoMKgwqDCoMKgIDEKPiDCoMKg
IGJjZFVTQsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMi4wMAo+IMKgwqAgYkRldmljZUNs
YXNzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAyIENvbW11bmljYXRpb25zCj4gwqDCoCBiRGV2aWNl
U3ViQ2xhc3PCoMKgwqDCoMKgwqDCoMKgIDAKPiDCoMKgIGJEZXZpY2VQcm90b2NvbMKgwqDCoMKg
wqDCoMKgwqAgMAo+IMKgwqAgYk1heFBhY2tldFNpemUwwqDCoMKgwqDCoMKgwqDCoCA4Cj4gwqDC
oCBpZFZlbmRvcsKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MDRiNCBDeXByZXNzIFNlbWljb25kdWN0
b3IgQ29ycC4KPiDCoMKgIGlkUHJvZHVjdMKgwqDCoMKgwqDCoMKgwqDCoCAweDAwMDggQ0RDIEFD
TSBzZXJpYWwgcG9ydAo+IMKgwqAgYmNkRGV2aWNlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAwLjAw
Cj4gwqDCoCBpTWFudWZhY3R1cmVywqDCoMKgwqDCoMKgwqDCoMKgwqAgMSAyMDEyIEN5cHJlc3Mg
U2VtaWNvbmR1Y3Rvcgo+IMKgwqAgaVByb2R1Y3TCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgMiBDeXByZXNzLVVTQjJVQVJULVZlcjEuMEcKPiDCoMKgIGlTZXJpYWzCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCA0IDgyNzIxMUMyMDkxQgo+IMKgwqAgYk51bUNvbmZpZ3VyYXRp
b25zwqDCoMKgwqDCoCAxCj4gwqDCoCBDb25maWd1cmF0aW9uIERlc2NyaXB0b3I6Cj4gwqDCoMKg
wqAgYkxlbmd0aMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDkKPiDCoMKgwqDCoCBi
RGVzY3JpcHRvclR5cGXCoMKgwqDCoMKgwqDCoMKgIDIKPiDCoMKgwqDCoCB3VG90YWxMZW5ndGjC
oMKgwqDCoMKgwqAgMHgwMDQzCj4gwqDCoMKgwqAgYk51bUludGVyZmFjZXPCoMKgwqDCoMKgwqDC
oMKgwqAgMgo+IMKgwqDCoMKgIGJDb25maWd1cmF0aW9uVmFsdWXCoMKgwqDCoCAxCj4gwqDCoMKg
wqAgaUNvbmZpZ3VyYXRpb27CoMKgwqDCoMKgwqDCoMKgwqAgMyBVU0ItVUFSVCBDb25maWd1cmF0
aW9uCj4gwqDCoMKgwqAgYm1BdHRyaWJ1dGVzwqDCoMKgwqDCoMKgwqDCoCAweGEwCj4gwqDCoMKg
wqDCoMKgIChCdXMgUG93ZXJlZCkKPiDCoMKgwqDCoMKgwqAgUmVtb3RlIFdha2V1cAo+IAo+IEFz
IGZhciBhcyBJIGNhbiB0ZWxsLCB5b3VyIGRldmljZSBpcyBzaW1wbHkgYnJva2VuIGFuZCBkb2Vz
IG5vdAo+IHRyaWdnZXIKPiBhIHJlbW90ZSB3YWtldXAgd2hlbiBpdCBzaG91bGQuIEl0IHdpbGwg
bmVlZCBhIGtlcm5lbCBxdWlyay4KClRoYXQncyBteSBpbXByZXNzaW9uIGFzIHdlbGwuIEkgaGFk
IGEgbG9vayBhdCB0aGUgYXZhaWxhYmxlIFVTQiBkZXZpY2UKcXVpcmtzLiBXb3VsZCBVU0JfUVVJ
UktfUkVTRVRfUkVTVU1FIGJlIHRoZSBjb3JyZWN0IG9uZSBpbiB0aGlzIGNhc2U/wqAKQm9vdGlu
ZyB3aXRoICJ1c2Jjb3JlLnF1aXJrcz0wNGI0OjAwMDg6YiIgZml4ZXMgdGhlIGlzc3VlIGJlY2F1
c2UKYXV0b3N1c3BlbmQgaXMgZGlzYWJsZWQgd2hlbiB0aGlzIHF1aXJrIGlzIHNldC4gVGhlIGRl
c2NyaXB0aW9uIG9mIHRoYXQKcXVpcmsgKCJkZXZpY2UgY2FuJ3QgcmVzdW1lIGNvcnJlY3RseSBz
byByZXNldCBpdCBpbnN0ZWFkIikgZG9lcwpob3dldmVyIG5vdCByZWFsbHkgbWF0Y2ggdGhlIGlz
c3VlIGF0IGhhbmQgYW5kIHN1Z2dlc3RzIHRoYXQgdGhlIGRldmljZQp3b3VsZCBzdGlsbCBiZSBw
dXQgdG8gc2xlZXAgYnV0IHJlc2V0IG9uIGV2ZXJ5IHdha2V1cC4gSXMgdGhlcmUgYQpiZXR0ZXIg
Zml0dGluZyBxdWlyayBhdmFpbGFibGU/CgpCZXN0IHJlZ2FyZHMsCk1pY2hhZWwK


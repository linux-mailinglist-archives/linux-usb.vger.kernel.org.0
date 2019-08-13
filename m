Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFE1C8B825
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2019 14:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727144AbfHMMNv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Aug 2019 08:13:51 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34839 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbfHMMNv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Aug 2019 08:13:51 -0400
Received: by mail-wm1-f66.google.com with SMTP id l2so1256006wmg.0
        for <linux-usb@vger.kernel.org>; Tue, 13 Aug 2019 05:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y0vfxQIzHBN9/H8MH+w55vyAnQYOVUSLg7VW2CSCSQI=;
        b=gBR8lEhke/jNvz3P1WvjKavtomt5NU4Chd8gj7veT8jn/AWlR3HVBAMnUkxBnkK8ol
         P0DqUBIEJqahNEQAgqC5m8ZJxnoTR2UZgGkZiOSZ3R1T2KM8bXMHQVFmGUR7YMOSN82T
         UA+zBOwlJF5MdTc203RvlTn7XklonYagrD40b9jeWMYKk67bs5wiDueRQUhkPnYjge4L
         4q9KBEBoNyuZTbSwUkxmuyP3jmL0fkta1GmpOcOdyLNl/k9xhaTcqeXzPa+NIn8ZzrdE
         zQSlvXSDqrvQf6iVSwos7J62hSwyapK25g0bFZSeUcTSW9bP+S3qbeq9h4UeriNU8ujj
         Bodg==
X-Gm-Message-State: APjAAAVFk1OLXAnAepyR4tsrLuSGvTFQ8N7NgNfFIJodLywdqDOycAr7
        t4Xue/mDq88p+NG+40dcFYaYE5SGUBM=
X-Google-Smtp-Source: APXvYqzljE5kZRzDyrl63RmmXs9cjPpjSWQMFkW0OF00rvU1uz+mbB/BhzYNrairbKprfayBxnWh8A==
X-Received: by 2002:a1c:a909:: with SMTP id s9mr2834274wme.20.1565698427091;
        Tue, 13 Aug 2019 05:13:47 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id f23sm1006043wmj.37.2019.08.13.05.13.46
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Aug 2019 05:13:46 -0700 (PDT)
Subject: Re: [PATCH] usb: typec: fusb302: Call fusb302_debugfs_init earlier
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
References: <20190813101524.80673-1-hdegoede@redhat.com>
 <20190813105216.GD4691@kuha.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <18993917-794a-dbd7-db6f-eec2f02f3ab1@redhat.com>
Date:   Tue, 13 Aug 2019 14:13:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813105216.GD4691@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: base64
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgSGVpa2tpLA0KDQpPbiAxMy0wOC0xOSAxMjo1MiwgSGVpa2tpIEtyb2dlcnVzIHdyb3Rl
Og0KPiBIaSBIYW5zLA0KPiANCj4gT24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMTI6MTU6MjRQ
TSArMDIwMCwgSGFucyBkZSBHb2VkZSB3cm90ZToNCj4+IHRjcG1fcmVnaXN0ZXJfcG9ydCgp
IHdpbGwgY2FsbCBzb21lIG9mIHRoZSBmdXNiMzAyIGNvZGUncyBjYWxsYmFja3MNCj4+IHdp
Y2ggaW4gdHVybiB3aWxsIGNhbGwgZnVzYjMwMl9sb2coKS4gU28gd2UgbmVlZCB0byBjYWxs
DQo+PiBmdXNiMzAyX2RlYnVnZnNfaW5pdCgpIGJlZm9yZSB3ZSBjYWxsIHRjcG1fcmVnaXN0
ZXJfcG9ydCgpLg0KPj4NCj4+IFRoaXMgZml4ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nLCB3
aGljaCB3YXMgY2F1c2VkIGJ5IHRoZSBsb2didWZmZXJfbG9jaw0KPj4gbm90IHlldCBiZWlu
ZyBpbml0aWFsaXplZCAod2hpY2ggaXMgZG9uZSBieSBmdXNiMzAyX2RlYnVnZnNfaW5pdCk6
DQo+Pg0KPj4gICBERUJVR19MT0NLU19XQVJOX09OKGxvY2stPm1hZ2ljICE9IGxvY2spDQo+
PiAgIFdBUk5JTkc6IENQVTogMCBQSUQ6IDEzMDYgYXQga2VybmVsL2xvY2tpbmcvbXV0ZXgu
Yzo5MTIgX19tdXRleF9sb2NrKzB4OTc4LzB4OWEwDQo+PiAgIE1vZHVsZXMgbGlua2VkIGlu
OiBmdXNiMzAyKCspIHRjcG0gcGkzdXNiMzA1MzIgdHlwZWMgYnEyNDE5MF9jaGFyZ2VyIHNu
ZF9zb2Nfc3N0X2NodF9ic3dfcnQ1NjQ1IG1laV9oZGNwIGR3YzMgaW50ZWxfcmFwbF9tc3Ig
dWRjX2NvcmUgdWxwaSBncGlvX2tleXMgaW50ZWxfcG93ZXJjbGFtcCBjb3JldGVtcCBrdm1f
aW50ZWwgYnJjbWZtYWMga3ZtIGJyY211dGlsIGpveWRldiBjZmc4MDIxMSB3ZGF0X3dkdCBp
cnFieXBhc3MgcGNzcGtyIGludGVsX2NzdGF0ZSBleHRjb25faW50ZWxfY2h0X3djIGkyY19j
aHRfd2MoRSkgc25kX2ludGVsX3NzdF9hY3BpIHNuZF9pbnRlbF9zc3RfY29yZSBzbmRfc29j
X3J0NTY0NSBzbmRfc29jX3NzdF9hdG9tX2hpZmkyX3BsYXRmb3JtIHNuZF9zb2NfYWNwaV9p
bnRlbF9tYXRjaCBzbmRfc29jX3JsNjIzMSBzbmRfc29jX2FjcGkgaW50ZWxfeGhjaV91c2Jf
cm9sZV9zd2l0Y2ggcm9sZXMgaGNpX3VhcnQgc25kX3NvY19jb3JlIGJ0cWNhIG1laV90eGUg
YnRydGwgcHJvY2Vzc29yX3RoZXJtYWxfZGV2aWNlIG1laSBzbmRfaGRtaV9scGVfYXVkaW8g
bHBjX2ljaCBzbmRfY29tcHJlc3MgYnRiY20gaW50ZWxfcmFwbF9jb21tb24gYWM5N19idXMg
ZHdjM19wY2kgc25kX3BjbV9kbWFlbmdpbmUgaW50ZWxfc29jX2R0c19pb3NmIGJ0aW50ZWwg
c25kX3NlcSBibHVldG9vdGggc25kX3NlcV9kZXZpY2Ugc25kX3BjbSBpbnRlbF9jaHRfaW50
MzNmZV9tdXNiIHNuZF90aW1lciBpbnRlbF9jaHRfaW50MzNmZV90eXBlYyBpbnRlbF9oaWQg
aW50ZWxfY2h0X2ludDMzZmVfY29tbW9uIHNwYXJzZV9rZXltYXAgc25kIGVjZGhfZ2VuZXJp
YyBnb29kaXggcmZraWxsIHNvdW5kY29yZSBlY2Mgc3BpX3B4YTJ4eF9wbGF0Zm9ybSBtYXgx
NzA0Ml9iYXR0ZXJ5IGR3X2RtYWMgaW50MzQwNl90aGVybWFsIGRwdGZfcG93ZXIgYWNwaV9w
YWQgc29jX2J1dHRvbl9hcnJheSBpbnQzNDAwX3RoZXJtYWwgaW50MzQwM190aGVybWFsDQo+
PiAgICBncGRfcG9ja2V0X2ZhbiBpbnRlbF9pbnQwMDAyX3ZncGlvIGludDM0MHhfdGhlcm1h
bF96b25lIGFjcGlfdGhlcm1hbF9yZWwgZG1fY3J5cHQgbW1jX2Jsb2NrIGk5MTUgY3JjdDEw
ZGlmX3BjbG11bCBjcmMzMl9wY2xtdWwgY3JjMzJjX2ludGVsIGdoYXNoX2NsbXVsbmlfaW50
ZWwgaTJjX2FsZ29fYml0IGRybV9rbXNfaGVscGVyIGRybSB2aWRlbyBzZGhjaV9hY3BpIHNk
aGNpIG1tY19jb3JlIHB3bV9scHNzX3BsYXRmb3JtIHB3bV9scHNzIGkyY19kZXYNCj4+ICAg
Q1BVOiAwIFBJRDogMTMwNiBDb21tOiBzeXN0ZW1kLXVkZXZkIFRhaW50ZWQ6IEcgICAgICAg
ICAgICBFICAgICA1LjMuMC1yYzQrICM4Mw0KPj4gICBIYXJkd2FyZSBuYW1lOiBEZWZhdWx0
IHN0cmluZyBEZWZhdWx0IHN0cmluZy9EZWZhdWx0IHN0cmluZywgQklPUyA1LjExIDA2LzI4
LzIwMTcNCj4+ICAgUklQOiAwMDEwOl9fbXV0ZXhfbG9jaysweDk3OC8weDlhMA0KPj4gICBD
b2RlOiBjMCAwZiA4NCAyNiBmNyBmZiBmZiA0NCA4YiAwNSAyNCAyNSBjOCAwMCA0NSA4NSBj
MCAwZiA4NSAxNiBmNyBmZiBmZiA0OCBjNyBjNiBkYSA1NSAyZiBhZSA0OCBjNyBjNyA5OCA4
YyAyZCBhZSBlOCBhMCBmOSA1YyBmZiA8MGY+IDBiIGU5IGZjIGY2IGZmIGZmIDRjIDg5IGYw
IDRkIDg5IGZlIDQ5IDg5IGM3IGU5IGNmIGZhIGZmIGZmIGU4DQo+PiAgIFJTUDogMDAxODpm
ZmZmYjdhOGMwNTIzODAwIEVGTEFHUzogMDAwMTAyODYNCj4+ICAgUkFYOiAwMDAwMDAwMDAw
MDAwMDAwIFJCWDogMDAwMDAwMDAwMDAwMDAwMCBSQ1g6IDAwMDAwMDAwMDAwMDAwMDANCj4+
ICAgUkRYOiAwMDAwMDAwMDAwMDAwMDAyIFJTSTogMDAwMDAwMDAwMDAwMDAwMSBSREk6IDAw
MDAwMDAwMDAwMDAyNDYNCj4+ICAgUkJQOiBmZmZmYjdhOGMwNTIzOGMwIFIwODogMDAwMDAw
MDAwMDAwMDAwMCBSMDk6IDAwMDAwMDAwMDAwMDAwMDANCj4+ICAgUjEwOiBmZmZmYjdhOGMw
NTIzNjQ4IFIxMTogMDAwMDAwMDAwMDAwMDAzMCBSMTI6IDAwMDAwMDAwMDAwMDAwMDANCj4+
ICAgUjEzOiBmZmZmYjdhOGMwNTIzOTkwIFIxNDogZmZmZjliZjIyZjcwYzAyOCBSMTU6IGZm
ZmY5YmYyMmY3MGMzNjANCj4+ICAgRlM6ICAwMDAwN2YzOWNhMjM0OTQwKDAwMDApIEdTOmZm
ZmY5YmYyMzc0MDAwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMA0KPj4gICBDUzog
IDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzDQo+PiAgIENS
MjogMDAwMDdmMWYxMDg0ODFhMCBDUjM6IDAwMDAwMDAyNzFmMjgwMDAgQ1I0OiAwMDAwMDAw
MDAwMTAwNmYwDQo+PiAgIENhbGwgVHJhY2U6DQo+PiAgICA/IGZpbmRfaGVsZF9sb2NrKzB4
MzkvMHg5MA0KPj4gICAgPyBfZnVzYjMwMl9sb2crMHg4MS8weDFkMCBbZnVzYjMwMl0NCj4+
ICAgID8gdnNucHJpbnRmKzB4M2FhLzB4NGYwDQo+PiAgICA/IF9mdXNiMzAyX2xvZysweDgx
LzB4MWQwIFtmdXNiMzAyXQ0KPj4gICAgX2Z1c2IzMDJfbG9nKzB4ODEvMHgxZDAgW2Z1c2Iz
MDJdDQo+PiAgIC4uLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhk
ZWdvZWRlQHJlZGhhdC5jb20+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy91c2IvdHlwZWMvdGNw
bS9mdXNiMzAyLmMgfCAzICsrLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL3R5
cGVjL3RjcG0vZnVzYjMwMi5jIGIvZHJpdmVycy91c2IvdHlwZWMvdGNwbS9mdXNiMzAyLmMN
Cj4+IGluZGV4IGNjZmM3ZTkxZTdhMy4uMDRjNzZiOWQwMDY1IDEwMDY0NA0KPj4gLS0tIGEv
ZHJpdmVycy91c2IvdHlwZWMvdGNwbS9mdXNiMzAyLmMNCj4+ICsrKyBiL2RyaXZlcnMvdXNi
L3R5cGVjL3RjcG0vZnVzYjMwMi5jDQo+PiBAQCAtMTc1OSw2ICsxNzU5LDcgQEAgc3RhdGlj
IGludCBmdXNiMzAyX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsDQo+PiAgIAlJ
TklUX1dPUksoJmNoaXAtPmlycV93b3JrLCBmdXNiMzAyX2lycV93b3JrKTsNCj4+ICAgCUlO
SVRfREVMQVlFRF9XT1JLKCZjaGlwLT5iY19sdmxfaGFuZGxlciwgZnVzYjMwMl9iY19sdmxf
aGFuZGxlcl93b3JrKTsNCj4+ICAgCWluaXRfdGNwY19kZXYoJmNoaXAtPnRjcGNfZGV2KTsN
Cj4+ICsJZnVzYjMwMl9kZWJ1Z2ZzX2luaXQoY2hpcCk7DQo+PiAgIA0KPj4gICAJaWYgKGNs
aWVudC0+aXJxKSB7DQo+PiAgIAkJY2hpcC0+Z3Bpb19pbnRfbl9pcnEgPSBjbGllbnQtPmly
cTsNCj4+IEBAIC0xNzg0LDcgKzE3ODUsNiBAQCBzdGF0aWMgaW50IGZ1c2IzMDJfcHJvYmUo
c3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwNCj4+ICAgCQlnb3RvIHRjcG1fdW5yZWdpc3Rl
cl9wb3J0Ow0KPj4gICAJfQ0KPj4gICAJZW5hYmxlX2lycV93YWtlKGNoaXAtPmdwaW9faW50
X25faXJxKTsNCj4+IC0JZnVzYjMwMl9kZWJ1Z2ZzX2luaXQoY2hpcCk7DQo+PiAgIAlpMmNf
c2V0X2NsaWVudGRhdGEoY2xpZW50LCBjaGlwKTsNCj4gDQo+IFRoYXQgbGVhdmVzIHRoZSBy
b290ZGlyIHZhcmlhYmxlIHBvaW50aW5nIHRvIHNvbWV0aGluZyBhZ2FpbiBmb3INCj4gZXhh
bXBsZSBpZiBhIGZhaWx1cmUgaGFwcGVucyAobGlrZSAtRVBST0JFX0FHQUlOKSBkdXJpbmcg
cHJvYmUgKHRoZQ0KPiAiZnVzYjMwMiIgZGlyZWN0b3J5IGlzIHJlbW92ZWQsIGJ1dCB0aGUg
cm9vdGRpciBzdGF0aWMgdmFyaWFibGUgc3RpbGwNCj4gcG9pbnRzIHRvIHNvbWV0aGluZyku
DQo+IA0KPiBMZXQncyBqdXN0IGNyZWF0ZSB0aGF0IHJvb3RkaXIgZGlyZWN0b3J5IGR1cmlu
ZyBkcml2ZXIgaW5pdC4gSSBkb24ndA0KPiByZWFsbHkgdW5kZXJzdGFuZCB3aHkgc2hvdWxk
IHdlIG9ubHkgY3JlYXRlIGl0IHdoZW4vaWYgdGhlIGZpcnN0DQo+IGluc3RhbmNlIG9mIGZ1
c2IzMDIgaXMgcmVnaXN0ZXJlZC4gSSB0aGluayBzb21ldGhpbmcgbGlrZSB0aGlzIHdvdWxk
DQo+IHdvcms6DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvdHlwZWMvdGNwbS9m
dXNiMzAyLmMgYi9kcml2ZXJzL3VzYi90eXBlYy90Y3BtL2Z1c2IzMDIuYw0KPiBpbmRleCBj
NTI0MDg4MjQ2ZWUuLjdhOTUwYTZlNWYwZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2Iv
dHlwZWMvdGNwbS9mdXNiMzAyLmMNCj4gKysrIGIvZHJpdmVycy91c2IvdHlwZWMvdGNwbS9m
dXNiMzAyLmMNCj4gQEAgLTIxMiw5ICsyMTIsNiBAQCBzdGF0aWMgc3RydWN0IGRlbnRyeSAq
cm9vdGRpcjsNCj4gICBzdGF0aWMgdm9pZCBmdXNiMzAyX2RlYnVnZnNfaW5pdChzdHJ1Y3Qg
ZnVzYjMwMl9jaGlwICpjaGlwKQ0KPiAgIHsNCj4gICAgICAgICAgbXV0ZXhfaW5pdCgmY2hp
cC0+bG9nYnVmZmVyX2xvY2spOw0KPiAtICAgICAgIGlmICghcm9vdGRpcikNCj4gLSAgICAg
ICAgICAgICAgIHJvb3RkaXIgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoImZ1c2IzMDIiLCBOVUxM
KTsNCj4gLQ0KPiAgICAgICAgICBjaGlwLT5kZW50cnkgPSBkZWJ1Z2ZzX2NyZWF0ZV9maWxl
KGRldl9uYW1lKGNoaXAtPmRldiksDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgU19JRlJFRyB8IDA0NDQsIHJvb3RkaXIsDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2hpcCwgJmZ1c2IzMDJfZGVidWdf
Zm9wcyk7DQo+IEBAIC0yMjMsNyArMjIwLDYgQEAgc3RhdGljIHZvaWQgZnVzYjMwMl9kZWJ1
Z2ZzX2luaXQoc3RydWN0IGZ1c2IzMDJfY2hpcCAqY2hpcCkNCj4gICBzdGF0aWMgdm9pZCBm
dXNiMzAyX2RlYnVnZnNfZXhpdChzdHJ1Y3QgZnVzYjMwMl9jaGlwICpjaGlwKQ0KPiAgIHsN
Cj4gICAgICAgICAgZGVidWdmc19yZW1vdmUoY2hpcC0+ZGVudHJ5KTsNCj4gLSAgICAgICBk
ZWJ1Z2ZzX3JlbW92ZShyb290ZGlyKTsNCj4gICB9DQo+ICAgDQo+ICAgI2Vsc2UNCj4gQEAg
LTE4NjMsNyArMTg1OSwyNCBAQCBzdGF0aWMgc3RydWN0IGkyY19kcml2ZXIgZnVzYjMwMl9k
cml2ZXIgPSB7DQo+ICAgICAgICAgIC5yZW1vdmUgPSBmdXNiMzAyX3JlbW92ZSwNCj4gICAg
ICAgICAgLmlkX3RhYmxlID0gZnVzYjMwMl9pMmNfZGV2aWNlX2lkLA0KPiAgIH07DQo+IC1t
b2R1bGVfaTJjX2RyaXZlcihmdXNiMzAyX2RyaXZlcik7DQo+ICsNCj4gK3N0YXRpYyBpbnQg
X19pbml0IGZ1c2IzMDJfaW5pdCh2b2lkKQ0KPiArew0KPiArICAgICAgIHJvb3RkaXIgPSBk
ZWJ1Z2ZzX2NyZWF0ZV9kaXIoImZ1c2IzMDIiLCBOVUxMKTsNCj4gKyAgICAgICBpZiAoSVNf
RVJSKHJvb3RkaXIpKQ0KPiArICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIocm9vdGRp
cik7DQo+ICsNCj4gKyAgICAgICByZXR1cm4gaTJjX2FkZF9kcml2ZXIoJmZ1c2IzMDJfZHJp
dmVyKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIHZvaWQgX19leGl0IGZ1c2IzMDJfZXhpdCh2
b2lkKQ0KPiArew0KPiArICAgICAgIGkyY19kZWxfZHJpdmVyKCZmdXNiMzAyX2RyaXZlcik7
DQo+ICsgICAgICAgZGVidWdmc19yZW1vdmUocm9vdGRpcik7DQo+ICt9DQo+ICsNCj4gK21v
ZHVsZV9pbml0KGZ1c2IzMDJfaW5pdCk7DQo+ICttb2R1bGVfZXhpdChmdXNiMzAyX2V4aXQp
Ow0KPiAgIA0KPiAgIE1PRFVMRV9BVVRIT1IoIll1ZXlhbyBaaHUgPHl1ZXlhby56aHVAZ21h
aWwuY29tPiIpOw0KPiAgIE1PRFVMRV9ERVNDUklQVElPTigiRmFpcmNoaWxkIEZVU0IzMDIg
VHlwZS1DIENoaXAgRHJpdmVyIik7DQo+IA0KPiANCj4gSWYgaXQncyBPSywgY291bGQgeW91
IGluY2x1ZGUgdGhhdCBpbnRvIHRoaXMgcGF0Y2g/DQoNCkkgYWdyZWUgdGhhdCB3ZSBzaG91
bGQgZG8gc29tZXRoaW5nIGFib3V0IHRoZSByb290ZGlyIGxlYWthZ2UNCm9uIHJtbW9kOyBh
bmQgeW91ciBwYXRjaCBzZWVtcyBsaWtlIGEgZ29vZCBzb2x1dGlvbjsgYW5kIEkgY2FuDQp0
ZXN0IHlvdXIgcGF0Y2ggaWYgeW91IHdhbnQuDQoNCkJ1dCB0aGUgcm9vdGRpciBsZWFrYWdl
IGlzIGEgcHJlLWV4aXN0aW5nIHByb2JsZW0sIGV2ZW4gd2l0aG91dA0KbXkgcGF0Y2ggdG8g
Y2FsbCBmdXNiMzAyX2RlYnVnZnNfaW5pdCBlYXJsaWVyLCB3ZSB3b3VsZCBzdGlsbCBsZWFr
DQppdCBhZnRlciBhIHJtbW9kLCBhc3N1bWluZyBwcm9iZSgpIGhhcyBzdWNjZWVkZWQgYXQg
bGVhc3Qgb25jZS4NCg0KQXMgZm9yIC1FUFJPQkVfREVGRVIsIHRoZW4gZXZlbnR1YWxseSBw
cm9iZSBzaG91bGQgc3VjY2VlZCBhbmQNCnRoZSAiaWYgKCFyb290ZGlyKSIgaW46DQoNCiAg
ICAgICAgaWYgKCFyb290ZGlyKQ0KICAgICAgICAgICAgICAgIHJvb3RkaXIgPSBkZWJ1Z2Zz
X2NyZWF0ZV9kaXIoImZ1c2IzMDIiLCBOVUxMKTsNCg0KRW5zdXJlcyB0aGF0IHdlIG9ubHkg
ZG8gaXQgb25jZSwgc28gdGhlIG9ubHkgY2hhbmdlIHRvIHRoZSByb290ZGlyDQpsZWFrIG15
IHBhdGNoIG1ha2VzIGlzIHRoYXQgaXQgZ2V0cyBsZWFrZWQgb24gcm1tb2QgZXZlbiBpZg0K
cHJvYmUoKSBuZXZlciBzdWNjZWVkZWQuDQoNCkFzIHNhaWQgSSBhZ3JlZSB0aGF0IHdlIHNo
b3VsZCBkbyBzb21ldGhpbmcgYWJvdXQgaXQ7IGFuZCB5b3VyDQpzdWdnZXN0aW9uIHNlZW1z
IGxpa2UgYSBnb29kIHNvbHV0aW9uLCBidXQgaXQgc2VlbXMgbGlrZSBhbg0KYWxtb3N0IG9y
dGhvZ29uYWwgcHJvYmxlbSwgc28gSU1ITyB0aGlzIHNob3VsZCBiZSBmaXhlZCBpbiBhDQpz
ZXBhcmF0ZSBwYXRjaCwgbm90IHNxdWFzaGVkIGludG8gdGhlDQoiQ2FsbCBmdXNiMzAyX2Rl
YnVnZnNfaW5pdCBlYXJsaWVyIiBwYXRjaC4NCg0KRG8geW91IHdhbnQgbWUgdG8gdHVybiB5
b3VyIFBPQyBjb2RlIGludG8gYSBwcm9wZXIgcGF0Y2ggd2l0aA0KeW91IGFzIGF1dGhvciBh
bmQgeW91ciBTLW8tYiBhZGRlZCAod2l0aCB5b3VyIHBlcm1pc3Npb24pIGFuZA0KdGhhdCBJ
IHRoZW4gdGVzdCBpdCBhbmQgYWRkIG15IFRlc3RlZC1ieT8NCg0KUmVnYXJkcywNCg0KSGFu
cw0K

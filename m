Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BED7C3A3D48
	for <lists+linux-usb@lfdr.de>; Fri, 11 Jun 2021 09:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231474AbhFKHgs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Jun 2021 03:36:48 -0400
Received: from shasxm03.verisilicon.com ([101.89.135.44]:53537 "EHLO
        shasxm03.verisilicon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbhFKHgs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Jun 2021 03:36:48 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
        c=simple/simple; t=1623396890; h=from:subject:to:date:message-id;
        bh=PR4kZJStfNK93Fq7/zlyeLTR9DmtzKXZIBJGqADe/R4=;
        b=UCiF72MTHdz+fmltPiJrvQZimbS2goVSzc0eqecL8R+ffvtVIn83T5Qwn6iL/9PIN31/G3FJR9Z
        TRCUDMOxYtMKvAzqwuaUgHXUYxUZXNUjmKfg+MtgNx5HUlt2Y1U6olZ+pecVu0j+KoES+ih4Pbf6d
        Cp62GuTCPJOosMNgufE=
Received: from SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda]) by
 SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa%14]) with mapi id
 14.03.0408.000; Fri, 11 Jun 2021 15:34:49 +0800
From:   "Fang, Yuan" <Yuan.Fang@verisilicon.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Yuan Fang <fangyuanseu@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXSBkcml2ZXJzL3VzYi9kd2MzOiBTZXQgUEhZIHJlYWR5?=
 =?gb2312?Q?_after_soft_reset_done?=
Thread-Topic: [PATCH] drivers/usb/dwc3: Set PHY ready after soft reset done
Thread-Index: AQHXXpH16kk4ndlpHUqkheri6gWwB6sN4rUAgACGpMA=
Date:   Fri, 11 Jun 2021 07:34:48 +0000
Message-ID: <678AD2A4F5F78445B722FED0965FE327776E40AB@SHASXM06.verisilicon.com>
References: <20210611071805.9169-1-yuan.fang@verisilicon.com>
 <YMMP9KuZs3RD3xzC@kroah.com>
In-Reply-To: <YMMP9KuZs3RD3xzC@kroah.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.13.120]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--6.389100-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQpIaSBNYWludGFpbmVyLA0KDQogVGhhbmtzIHNvIG11Y2ggZm9yIHRoZSBxdWljayByZXBseS4N
CiBJIHdvdWxkIGxpa2UgdG8gYmFjayBwb3J0ZWQgdG8gb2xkZXIga2VybmVscywgYnV0IEkgY2Fu
IG5vdA0KIGZpZ3VyZSBvdXQgdG8gd2hpY2ggdmVyc2lvbiBpcyBzdWl0YWJsZSwgSSBjYW4gaGF2
ZSBhIGNoZWNrIGxhdGVyDQogQnV0IG1lcmdlIGludG8gdGhlIG5ldyByZWxlYXNlIHZlcnNpb24g
aXMgYWxzbyBhY2NlcHRhYmxlIGFzIEkgdGhpbmsuDQogVGhhbmtzIGFnYWluLg0KDQpCLlINCll1
YW4gRmFuZw0KDQotLS0tLdPKvP7Urbz+LS0tLS0NCreivP7IyzogR3JlZyBLSCBbbWFpbHRvOmdy
ZWdraEBsaW51eGZvdW5kYXRpb24ub3JnXSANCreiy83KsbzkOiAyMDIxxOo21MIxMcjVIDE1OjI2
DQrK1bz+yMs6IFl1YW4gRmFuZw0Ks63LzTogbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsgYmFs
YmlAa2VybmVsLm9yZzsgRmFuZywgWXVhbg0K1vfM4jogUmU6IFtQQVRDSF0gZHJpdmVycy91c2Iv
ZHdjMzogU2V0IFBIWSByZWFkeSBhZnRlciBzb2Z0IHJlc2V0IGRvbmUNCg0KT24gRnJpLCBKdW4g
MTEsIDIwMjEgYXQgMDM6MTg6MDVQTSArMDgwMCwgWXVhbiBGYW5nIHdyb3RlOg0KPiBJdCdzIG1v
cmUgc2FmZSB0byBzZXQgUEhZIHJlYWR5IGFmdGVyIHNvZnQgcmVzZXQgZG9uZQ0KPiANCj4gTGV0
J3MgY29uc2lkZXIgYSB0ZXN0IGNhc2UgbGlrZSB0aGlzOg0KPiBJIGhhdmUgYSB1c2IgUEhZIHdo
aWNoIGRvbid0IG5lZWQgU1cgaW5pdGlhbCBiZWZvcmUgYWNjZXNzIGl0LCBCdXQgaSANCj4gaGF2
ZSBhIHdyb25nIFBIWSBjbG9jayBkZWZhdWx0IHNldHRpbmcgaW4gUEhZIHJlZ2lzdGVyIHdoaWNo
IG1lYW5zIFBIWSANCj4gaXMgbm90IHJlYWR5IGluIGZhY3QuDQo+IGluIGR3YzNfY29yZV9pbml0
LCBkd2MzX2NvcmVfZ2V0X3BoeSB3aWxsIHJldHVybiAwIGRlc3BpdGUgdXNiIGdldCANCj4gUEhZ
cyB3aXRoIHJldHVybiAtRU5PREVWLCBhbmQgc2V0IHBoeXNfcmVhZHk9dHJ1ZSBidXQgYXQgdGhp
cyBwb2ludCwgDQo+IHdlIGNhbiBub3Qgc2F5IHBoeXMgaXMgcmVhZHkgb3IgYXQgbGVhc3QgaXQg
bm90IHNhZmUgdG8gZG8gdGhhdC4NCj4gdGhlbiwgZ28gb24gd2l0aCBkd2MzX2NvcmVfc29mdF9y
ZXNldCxkd2MzIHJlc2V0IGNvcmUgYW5kIFBIWSwgYXMgDQo+IHBoeS0+aW5pdCBpcyBOVUxMIGlu
IHRoaXMgY2FzZSwgc28sIHVzYl9waHlfaW5pdCBkbyBub3RoaW5nIGFuZCBnbyBvbiANCj4gd2l0
aCBhIHdoaWxlIGxvb3Agd2hpY2ggY29zdCAxMDAwKg0KPiAyMCBtcywgYW5kIHJldHVybiB3aXRo
IC1FVElNRURPVVQNCj4gY2hlY2sgcGh5c19yZWFkeSBpcyBzZXQgdG8gVFJVRSBidXQgYWN0dWFs
bHkgbm90Lg0KPiBNb3ZlIHBoeXNfcmVhZHkgYWZ0ZXIgc29mdCByZXNldCBkb25lIGlzIG1vcmUg
cmVhc29uYWJsZSBhbmQgZG9uJ3Qgc2VlIA0KPiBzaWRlLWVmZmVjdCB5ZXQuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBZdWFuIEZhbmcgPHl1YW4uZmFuZ0B2ZXJpc2lsaWNvbi5jb20+DQoNCldoYXQg
Y29tbWl0IGRvZXMgdGhpcyAiZml4Ij8gIFNob3VsZCBpdCBhbHNvIGJlIGJhY2twb3J0ZWQgdG8g
b2xkZXIga2VybmVscz8gIElmIHNvLCBob3cgZmFyIGJhY2s/DQoNCnRoYW5rcywNCg0KZ3JlZyBr
LWgNCg==

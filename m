Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5140F3A2AE8
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jun 2021 13:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbhFJMAs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Jun 2021 08:00:48 -0400
Received: from shasxm03.verisilicon.com ([101.89.135.44]:28011 "EHLO
        shasxm03.verisilicon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbhFJMAr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Jun 2021 08:00:47 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
        c=simple/simple; t=1623326331; h=from:subject:to:date:message-id;
        bh=1M8L9cIbRy+rPZePI7jfHttXaHOADYFK+hNX/FaOgQY=;
        b=bFA7TpzTtq8s1ZPbjQLlGexqMOBJtqzS85sr+UCJeHEIZ1h/eQTfGxBlYMbvi5SsRFeKngPje7B
        VsPJeES0xzAYV3zeYmpoPLvV7V6mpPbJ9IQpK8Bjd/4ac1at7eDvSR7ht6X5nIIMSPoirDRNGMTh5
        uB3G/gspCwPhxGjByFs=
Received: from SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda]) by
 SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa%14]) with mapi id
 14.03.0408.000; Thu, 10 Jun 2021 19:58:50 +0800
From:   "Fang, Yuan" <Yuan.Fang@verisilicon.com>
To:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXSBkcml2ZXIvdXNiL2R3YzM6IEFkZCBlcnJvciBoYW5k?=
 =?gb2312?Q?le_for_dwc3_get_usb_phy?=
Thread-Topic: [PATCH] driver/usb/dwc3: Add error handle for dwc3 get usb phy
Thread-Index: AQHXXe0SWPqqqpQ5Lkm/Jco7AP/84KsMmrKAgACHLqA=
Date:   Thu, 10 Jun 2021 11:58:50 +0000
Message-ID: <678AD2A4F5F78445B722FED0965FE327776E4011@SHASXM06.verisilicon.com>
References: <20210610113745.7710-1-yuan.fang@verisilicon.com>
 <87bl8e0wnc.fsf@kernel.org>
In-Reply-To: <87bl8e0wnc.fsf@kernel.org>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.13.120]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--9.958700-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCiBJIGFncmVlIHdpdGggeW91IHRoYXQgc29tZSBwbGF0Zm9ybXMgZG9uJ3QgcmVxdWly
ZSBhIFBIWSBkcml2ZXIuDQogQnV0IGluIHRoZSBjYXNlIEkgbWVudGlvbmVkLCBpbiB0aGUgcGxh
dGZvcm1zIHRoYXQgZG8gbmVlZCBhIFBIWSBkcml2ZXIgYW5kIFBIWSBkcml2ZXIgaXMgbm90IGJy
aW5nIHVwIHN1Y2Nlc3NmdWxseSwgdGhlIGRyaXZlciBjb2RlIHJpZ2h0IG5vdyB3aWxsIHJldHVy
biAwIA0KYW5kIGdvIG9uIHNldCB0aGUgZHdjLT5waHlzX3JlYWR5PXR1cmUsIHdoaWNoIGxvb2tz
IG9kZCBpbiB0aGlzIGNhc2UsIHJpZ2h0Pw0KDQpCLlINCll1YW4gRmFuZw0KDQotLS0tLdPKvP7U
rbz+LS0tLS0NCreivP7IyzogRmVsaXBlIEJhbGJpIFttYWlsdG86YmFsYmlAa2VybmVsLm9yZ10g
DQq3osvNyrG85DogMjAyMcTqNtTCMTDI1SAxOTo0Nw0KytW8/sjLOiBZdWFuIEZhbmc7IGxpbnV4
LXVzYkB2Z2VyLmtlcm5lbC5vcmcNCrOty806IEZhbmcsIFl1YW4NCtb3zOI6IFJlOiBbUEFUQ0hd
IGRyaXZlci91c2IvZHdjMzogQWRkIGVycm9yIGhhbmRsZSBmb3IgZHdjMyBnZXQgdXNiIHBoeQ0K
DQoNCkhpLA0KDQpZdWFuIEZhbmcgPGZhbmd5dWFuc2V1QGdtYWlsLmNvbT4gd3JpdGVzOg0KDQo+
IEFkZCBlcnJvciBoYW5kbGUgZm9yIGR3YzMgY29yZSBnZXQgdXNiIHBoeSwgYmVjYXVzZSB3aXRo
b3V0IGVycm9yIA0KPiBoYW5kbGUgd2lsbCBsZWFkIHRvIGJ1Zy4NCj4NCj4gY29uc2lkZXIgY2Fz
ZSBsaWtlIHRoaXMsIHdoZW4gYm90aCBkd2MtPnVzYjJfcGh5L3VzYjNfcGh5IGFuZCANCj4gZHdj
LT51c2IyX2dlbmVyaWNfcGh5L3VzYjNfZ2VuZXJpY19waHkgZG8gbm90IGV4aXN0IGN1cnJlbnQg
ZHJpdmVyIA0KPiBjb2RlIHNldCB0aGVtIGFsbCB0byBOVUxMIGFuZCByZXR1cm4gMCB0byBjYWxs
ZXIgd2hpY2ggbWVhbnMgdXNiIHBoeSANCj4gaXMgcmVhZHkuDQoNCml0J3MgdW5jbGVhciB3aGF0
IHRoZSBwcm9ibGVtIGlzLiBDYXJlIHRvIGRlc2NyaWJlIHdoYXQncyBoYXBwZW5pbmc/DQoNCj4g
U2lnbmVkLW9mZi1ieTogWXVhbiBGYW5nIDx5dWFuLmZhbmdAdmVyaXNpbGljb24uY29tPg0KPiAt
LS0NCj4gSGkgbWFpbnRhaW5lciwNCj4NCj4gICAgSSBmaW5kIHRoaXMgaXNzdWUgd2hlbiBpIHRy
eSB0byBhZGQgYSBuZXcgdXNiIHBoeSBkcml2ZXIgZm9yDQo+ICAgIGR3YzMgdXNiIGNvcmUsIHRo
aXMgaXNzdWUgbG9va3MgbGlrZSBhIGJ1ZywgcGxlYXNlIGtpbmRseSBoYXZlDQo+ICAgIGEgcmV2
aWV3LCBtYW55IHRoYW5rcy4NCj4NCj4gQmVzdCByZWdhcmRzLA0KPiBZdWFuIEZhbmcNCj4NCj4g
IGRyaXZlcnMvdXNiL2R3YzMvY29yZS5jIHwgMSArDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jIGIvZHJp
dmVycy91c2IvZHdjMy9jb3JlLmMgaW5kZXggDQo+IGI2ZTUzZDgyMTJjZC4uNGQ1MjdkMzEzYTRj
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiArKysgYi9kcml2ZXJz
L3VzYi9kd2MzL2NvcmUuYw0KPiBAQCAtMTE4NCw2ICsxMTg0LDcgQEAgc3RhdGljIGludCBkd2Mz
X2NvcmVfZ2V0X3BoeShzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiAgCQlyZXQgPSBQVFJfRVJSKGR3Yy0+
dXNiM19nZW5lcmljX3BoeSk7DQo+ICAJCWlmIChyZXQgPT0gLUVOT1NZUyB8fCByZXQgPT0gLUVO
T0RFVikgew0KPiAgCQkJZHdjLT51c2IzX2dlbmVyaWNfcGh5ID0gTlVMTDsNCj4gKwkJCXJldHVy
biBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAibm8gdXNiIHBoeSBkZXZpY2VcbiIpOw0KDQpubywg
dGhpcyBpcyBpbmNvcnJlY3QuIFNvbWUgcGxhdGZvcm1zIGRvbid0IHJlcXVpcmUgYSBQSFkgZHJp
dmVyIGF0IGFsbCBiZWNhdXNlIHRoZXJlJ3Mgbm8gU1cgY29udHJvbCBmb3IgdGhlIFBIWS4NCg0K
TW9yZW92ZXIsIGdlbmVyaWMgUEhZIGZyYW1ld29yayBwcm90ZWN0cyBhZ2FpbnN0IE5VTEwgcGh5
LiBJIGRvbid0IHNlZSB3aGF0IHRoZSBwcm9ibGVtIHlvdSdyZSByZWZlcnJpbmcgdG8gaXMgaGVy
ZS4NCg0KLS0NCmJhbGJpDQo=

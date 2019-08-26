Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 790BA9CAE9
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2019 09:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729948AbfHZHqp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Aug 2019 03:46:45 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:23716 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727563AbfHZHqp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Aug 2019 03:46:45 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7Q7kWoi002013;
        Mon, 26 Aug 2019 09:46:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=6sShueCxhVAm0IHwOmzn20YFNKvT2fsxwkDbU72np3U=;
 b=BVO7YMUzoTFrWknfkLeGeLyAV1DX2WXI0b7bEDy3jxnOuhA1C6+UMk2L7JKZLueJG7Wi
 5qhS0MCrCkMS5hJLyk2Xt+LvKot28NvDWm8nlv0LhUdIGn034EnZmZiJkTDxA4lpOKjP
 +a3eVzIqFDzkHFi9Wac3IIMSe4NNzASz1Yty9s/uy1lC+JtiAHaO2mLpkiICkm3vY2tz
 A37F59HMkU9Or/iHkiQVTmxu5VEb95xjq60r4635NsglQM2DTkf7kpy8uqZ+2GVi8ta5
 sEd1ihGTqx+Y5Iim1jMAk57KWfGU0DaM2L2gBMqdqJihgUbvMIHb1EW/+/f8JFf+p/C3 aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2uju0vjb71-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Mon, 26 Aug 2019 09:46:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 871D334;
        Mon, 26 Aug 2019 07:46:29 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ED5522BC751;
        Mon, 26 Aug 2019 09:46:28 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 26 Aug
 2019 09:46:28 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 26 Aug 2019 09:46:28 +0200
From:   Patrice CHOTARD <patrice.chotard@st.com>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 1/2] usb: dwc3: st: Add of_node_put() before return in
 probe function
Thread-Topic: [PATCH 1/2] usb: dwc3: st: Add of_node_put() before return in
 probe function
Thread-Index: AQHVVl8ynhbpV4BP5EGbALZJZzELgqcM9ncA
Date:   Mon, 26 Aug 2019 07:46:28 +0000
Message-ID: <7e0bcd72-0de0-bc04-03e0-f850d6457e7e@st.com>
References: <20190819072436.31402-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190819072436.31402-1-nishkadg.linux@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-Type: text/plain; charset="utf-8"
Content-ID: <81B2C70FC6D0824388F811E47B7F0599@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-26_04:,,
 signatures=0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgTmlzaGthDQoNCk9uIDgvMTkvMTkgOToyNCBBTSwgTmlzaGthIERhc2d1cHRhIHdyb3RlOg0K
PiBUaGUgbG9jYWwgdmFyaWFibGUgY2hpbGQgaW4gdGhlIGZ1bmN0aW9uIHN0X2R3YzNfcHJvYmUg
dGFrZXMgdGhlIHJldHVybg0KPiB2YWx1ZSBvZiBvZl9nZXRfY2hpbGRfYnlfbmFtZSwgd2hpY2gg
Z2V0cyBhIG5vZGUgYW5kIGRvZXMgbm90IHB1dCBpdC4gSWYNCj4gdGhlIGZ1bmN0aW9uIHJldHVy
bnMgd2l0aG91dCByZWxlYXNpbmcgY2hpbGQsIHRoaXMgY291bGQgY2F1c2UgYSBtZW1vcnkNCj4g
ZXJyb3IuIEhlbmNlIHB1dCBjaGlsZCBhcyBzb29uIGFzIHRoZXJlIGlzIG5vIG1vcmUgdXNlIGZv
ciBpdC4gQWxzbw0KPiBjcmVhdGUgYSBuZXcgbGFiZWwsIGVycl9ub2RlX3B1dCwganVzdCBiZWZv
cmUgbGFiZWwgdW5kb19zb2Z0cmVzZXQ7IHNvDQo+IHRoYXQgZXJyX25vZGVfcHV0IHB1dHMgY2hp
bGQuIEluIGJldHdlZW4gaW5pdGlhbGlzYXRpb24gb2YgY2hpbGQgYW5kIGl0cw0KPiBmaXJzdCBw
dXQsIG1vZGlmeSBhbGwgc3RhdGVtZW50cyB0aGF0IGdvIHRvIHVuZG9fc29mdHJlc2V0IHRvIG5v
dyBnbyB0bw0KPiBlcnJfbm9kZV9wdXQgaW5zdGVhZCwgZnJvbSB3aGVyZSB0aGV5IGNhbiBmYWxs
IHRocm91Z2ggdG8NCj4gdW5kb19zb2Z0cmVzZXQuDQo+IElzc3VlIGZvdW5kIHdpdGggQ29jY2lu
ZWxsZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogTmlzaGthIERhc2d1cHRhIDxuaXNoa2FkZy5saW51
eEBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLXN0LmMgfCA5ICsr
KysrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1zdC5jIGIvZHJpdmVy
cy91c2IvZHdjMy9kd2MzLXN0LmMNCj4gaW5kZXggMTYwODEzODNjNDAxLi42ZjUyYzc0OWNkNTgg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1zdC5jDQo+ICsrKyBiL2RyaXZl
cnMvdXNiL2R3YzMvZHdjMy1zdC5jDQo+IEBAIC0yNTUsMjQgKzI1NSwyNSBAQCBzdGF0aWMgaW50
IHN0X2R3YzNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlpZiAoIWNo
aWxkKSB7DQo+ICAJCWRldl9lcnIoJnBkZXYtPmRldiwgImZhaWxlZCB0byBmaW5kIGR3YzMgY29y
ZSBub2RlXG4iKTsNCj4gIAkJcmV0ID0gLUVOT0RFVjsNCj4gLQkJZ290byB1bmRvX3NvZnRyZXNl
dDsNCj4gKwkJZ290byBlcnJfbm9kZV9wdXQ7DQo+ICAJfQ0KPiAgDQo+ICAJLyogQWxsb2NhdGUg
YW5kIGluaXRpYWxpemUgdGhlIGNvcmUgKi8NCj4gIAlyZXQgPSBvZl9wbGF0Zm9ybV9wb3B1bGF0
ZShub2RlLCBOVUxMLCBOVUxMLCBkZXYpOw0KPiAgCWlmIChyZXQpIHsNCj4gIAkJZGV2X2Vycihk
ZXYsICJmYWlsZWQgdG8gYWRkIGR3YzMgY29yZVxuIik7DQo+IC0JCWdvdG8gdW5kb19zb2Z0cmVz
ZXQ7DQo+ICsJCWdvdG8gZXJyX25vZGVfcHV0Ow0KPiAgCX0NCj4gIA0KPiAgCWNoaWxkX3BkZXYg
PSBvZl9maW5kX2RldmljZV9ieV9ub2RlKGNoaWxkKTsNCj4gIAlpZiAoIWNoaWxkX3BkZXYpIHsN
Cj4gIAkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gZmluZCBkd2MzIGNvcmUgZGV2aWNlXG4iKTsN
Cj4gIAkJcmV0ID0gLUVOT0RFVjsNCj4gLQkJZ290byB1bmRvX3NvZnRyZXNldDsNCj4gKwkJZ290
byBlcnJfbm9kZV9wdXQ7DQo+ICAJfQ0KPiAgDQo+ICAJZHdjM19kYXRhLT5kcl9tb2RlID0gdXNi
X2dldF9kcl9tb2RlKCZjaGlsZF9wZGV2LT5kZXYpOw0KPiArCW9mX25vZGVfcHV0KGNoaWxkKTsN
Cj4gIA0KPiAgCS8qDQo+ICAJICogQ29uZmlndXJlIHRoZSBVU0IgcG9ydCBhcyBkZXZpY2Ugb3Ig
aG9zdCBhY2NvcmRpbmcgdG8gdGhlIHN0YXRpYw0KPiBAQCAtMjkyLDYgKzI5Myw4IEBAIHN0YXRp
YyBpbnQgc3RfZHdjM19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCXBs
YXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGR3YzNfZGF0YSk7DQo+ICAJcmV0dXJuIDA7DQo+ICAN
Cj4gK2Vycl9ub2RlX3B1dDoNCj4gKwlvZl9ub2RlX3B1dChjaGlsZCk7DQo+ICB1bmRvX3NvZnRy
ZXNldDoNCj4gIAlyZXNldF9jb250cm9sX2Fzc2VydChkd2MzX2RhdGEtPnJzdGNfcnN0KTsNCj4g
IHVuZG9fcG93ZXJkb3duOg0KDQoNClJldmlld2VkLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJp
Y2UuY2hvdGFyZEBzdC5jb20+DQoNClRoYW5rcw0K

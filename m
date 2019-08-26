Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C52E9CAEE
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2019 09:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730053AbfHZHrg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Aug 2019 03:47:36 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:37655 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727563AbfHZHrf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Aug 2019 03:47:35 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7Q7ka48002048;
        Mon, 26 Aug 2019 09:47:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=pjPt/wZUKKdcA3IPhuUT413dZh6eiRrEoP/4kZe4Ikc=;
 b=g1kMLSUFmT/qnZL1clioCba2m8dozgufu6XfYbFLqCchwyeFHTKdC9jXtLax3QM56D7U
 dRxMqz8pf2O+ImchRaYe9+o+53Sqpsm3TPz/L9QwKmSgZyolLVQ0v3dnYmCAJkr5dPTO
 40eICx4FSEAJYk2ybYOiB7Xi0jY2YWDxgtM35zrx54sRldMRW/wyvKjShvE+TLFCB9Ec
 iJJDtwSLRQ1H4NJT/hE/zpwx+lsPxcDgAbI0YbshAfx0HJ7LBBxFgXx2yrySoR0MMODT
 uxUBHu31TqVTXSRVCWGxID0KAHq0VbikvgwzkrQDOwK/bmT8zIWp7SVj2CNnfIfHE1cn aQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2uju0vjbbx-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Mon, 26 Aug 2019 09:47:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BB5E434;
        Mon, 26 Aug 2019 07:47:26 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AF20E2BDA80;
        Mon, 26 Aug 2019 09:47:26 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 26 Aug
 2019 09:47:26 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 26 Aug 2019 09:47:26 +0200
From:   Patrice CHOTARD <patrice.chotard@st.com>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/2] usb: dwc3: st: Add of_dev_put() in probe function
Thread-Topic: [PATCH 2/2] usb: dwc3: st: Add of_dev_put() in probe function
Thread-Index: AQHVVl8y3EVLt/XZlECFHm3GgO+g6KcM9riA
Date:   Mon, 26 Aug 2019 07:47:26 +0000
Message-ID: <472a33d8-3ae1-fec6-b05c-8cd01fb911e6@st.com>
References: <20190819072436.31402-1-nishkadg.linux@gmail.com>
 <20190819072436.31402-2-nishkadg.linux@gmail.com>
In-Reply-To: <20190819072436.31402-2-nishkadg.linux@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-Type: text/plain; charset="utf-8"
Content-ID: <22ABE70ED879DD429DA52A6B97BA8409@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-26_04:,,
 signatures=0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQpPbiA4LzE5LzE5IDk6MjQgQU0sIE5pc2hrYSBEYXNndXB0YSB3cm90ZToNCj4gSW4gZnVuY3Rp
b24gc3RfZHdjM19wcm9iZSwgdmFyaWFibGUgY2hpbGRfcGRldiB0YWtlcyB0aGUgdmFsdWUgcmV0
dXJuZWQNCj4gYnkgb2ZfZmluZF9kZXZpY2VfYnlfbm9kZSwgd2hpY2ggZ2V0cyBhIGRldmljZSBw
b2ludGVyIGJ1dCBkb2VzIG5vdCBwdXQNCj4gaXQuIElmIGNoaWxkX3BkZXYgaXMgbm90IHB1dCBi
ZWZvcmUgdGhlIHByb2JlIGZ1bmN0aW9uIHJldHVybnMsIGl0IG1heQ0KPiBjYXVzZSBhIHJlZmVy
ZW5jZSBsZWFrLiBIZW5jZSBwdXQgY2hpbGRfcGRldiBhZnRlciBpdHMgbGFzdCB1c2FnZS4NCj4g
SXNzdWUgZm91bmQgd2l0aCBDb2NjaW5lbGxlLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBOaXNoa2Eg
RGFzZ3VwdGEgPG5pc2hrYWRnLmxpbnV4QGdtYWlsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3Vz
Yi9kd2MzL2R3YzMtc3QuYyB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
DQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtc3QuYyBiL2RyaXZlcnMv
dXNiL2R3YzMvZHdjMy1zdC5jDQo+IGluZGV4IDZmNTJjNzQ5Y2Q1OC4uYzY4MjQyMGYyNWNhIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtc3QuYw0KPiArKysgYi9kcml2ZXJz
L3VzYi9kd2MzL2R3YzMtc3QuYw0KPiBAQCAtMjc0LDYgKzI3NCw3IEBAIHN0YXRpYyBpbnQgc3Rf
ZHdjM19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgDQo+ICAJZHdjM19k
YXRhLT5kcl9tb2RlID0gdXNiX2dldF9kcl9tb2RlKCZjaGlsZF9wZGV2LT5kZXYpOw0KPiAgCW9m
X25vZGVfcHV0KGNoaWxkKTsNCj4gKwlvZl9kZXZfcHV0KGNoaWxkX3BkZXYpOw0KPiAgDQo+ICAJ
LyoNCj4gIAkgKiBDb25maWd1cmUgdGhlIFVTQiBwb3J0IGFzIGRldmljZSBvciBob3N0IGFjY29y
ZGluZyB0byB0aGUgc3RhdGljDQoNClJldmlld2VkLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJp
Y2UuY2hvdGFyZEBzdC5jb20+DQoNClRoYW5rcw0K

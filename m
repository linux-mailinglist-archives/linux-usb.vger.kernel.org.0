Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCAAD22E585
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jul 2020 07:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgG0Fp3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jul 2020 01:45:29 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:56774 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726006AbgG0Fp3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jul 2020 01:45:29 -0400
X-UUID: a8299178c77348dfbe4de4e2d09f766a-20200727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=e/sEqJZASG76mo3qY3F3qjBq37p1m4x0IZJEOdmV2gM=;
        b=sIgh52v2+AXtWrAxPWXPFA702PjSTjKKf4+9iKWiFfZyZg4KS4TbkujjLNN2eg8lBgSx7/ony21ddgQJc2Bkxn3xCoeOuFJfxbAZaAaiCBLFOCe5iXf/Ak/DKPQnvybc5ODBJE5gZJyUG+zLnE3GvViEZwixfCGmXxkZnAQVzcg=;
X-UUID: a8299178c77348dfbe4de4e2d09f766a-20200727
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1641004709; Mon, 27 Jul 2020 13:43:56 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 27 Jul
 2020 13:43:54 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jul 2020 13:43:53 +0800
Message-ID: <1595828558.23885.90.camel@mhfsdcap03>
Subject: Re: [RESEND PATCH] usb: common: usb-conn-gpio: Register optional
 charger
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, <od@zcrc.me>,
        USB <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Mon, 27 Jul 2020 13:42:38 +0800
In-Reply-To: <FPN2EQ.RC89XKRQDKRN3@crapouillou.net>
References: <20200621224807.882184-1-paul@crapouillou.net>
         <CAHp75VcfhDncqP_hSVvRNc_vY0fOYaoxm-tiCm2G92Xrisb9hA@mail.gmail.com>
         <FPN2EQ.RC89XKRQDKRN3@crapouillou.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 261650F315D21659A669601C321C14A852E23FBA7F0B25CD073047E472AD71F82000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gU3VuLCAyMDIwLTA3LTI2IGF0IDEyOjI3ICswMjAwLCBQYXVsIENlcmN1ZWlsIHdyb3RlOg0K
PiANCj4gTGUgZGltLiAyNiBqdWlsLiAyMDIwIMOgIDEzOjE0LCBBbmR5IFNoZXZjaGVua28gDQo+
IDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPiBhIMOpY3JpdCA6DQo+ID4gT24gTW9uLCBKdW4g
MjIsIDIwMjAgYXQgMTo1MSBBTSBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4g
DQo+ID4gd3JvdGU6DQo+ID4+IA0KPiA+PiAgUmVnaXN0ZXIgYSBwb3dlciBzdXBwbHkgY2hhcmdl
ciwgaWYgdGhlIEtjb25maWcgb3B0aW9uDQo+ID4+ICBVU0JfQ09OTl9HUElPX0NIQVJHRVIgaXMg
c2V0LCB3aG9zZSBvbmxpbmUgc3RhdGUgZGVwZW5kcyBvbiB3aGV0aGVyDQo+ID4+ICB0aGUgVVNC
IHJvbGUgaXMgc2V0IHRvIGRldmljZSBvciBub3QuDQo+ID4+IA0KPiA+PiAgVGhpcyBpcyB1c2Vm
dWwgd2hlbiB0aGUgVVNCIHJvbGUgaXMgdGhlIG9ubHkgd2F5IHRvIGtub3cgaWYgdGhlIA0KPiA+
PiBkZXZpY2UNCj4gPj4gIGlzIGNoYXJnaW5nIGZyb20gVVNCLiBUaGUgQVBJIGlzIHRoZSBzdGFu
ZGFyZCBwb3dlciBzdXBwbHkgY2hhcmdlciANCj4gPj4gQVBJLA0KPiA+PiAgeW91IGdldCBhIC9z
eXMvY2xhc3MvcG93ZXJfc3VwcGx5L3h4eC9vbmxpbmUgbm9kZSB3aGljaCB0ZWxscyB5b3UgDQo+
ID4+IHRoZQ0KPiA+PiAgc3RhdGUgb2YgdGhlIGNoYXJnZXIuDQo+ID4+IA0KPiA+PiAgVGhlIHNv
bGUgcHVycG9zZSBvZiB0aGlzIGlzIHRvIGdpdmUgdXNlcnNwYWNlIGFwcGxpY2F0aW9ucyBhIHdh
eSB0bw0KPiA+PiAga25vdyB3aGV0aGVyIG9yIG5vdCB0aGUgY2hhcmdlciBpcyBwbHVnZ2VkLg0K
PiA+IA0KPiA+IEknbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQgdGhlIHB1cnBvc2Ugb2YgdGhpcyAo
dGhpcmQ/KSB3YXkgdG8gZGV0ZWN0DQo+ID4gVVNCIGNoYXJnZXIgYW5kIG5vdGlmeSB1c2VyIHNw
YWNlIGFib3V0Lg0KPiA+IFdoeSBpcyBleHRjb24gbm90IGdvb2QgZW5vdWdoPw0KPiANCj4gV2Ug
Y2FuJ3QgaGF2ZSBleHRjb24gYW5kIFVTQiByb2xlIGRldGVjdGlvbiBhdCB0aGUgc2FtZSB0aW1l
Lg0KPiANCj4gLVBhdWwNCj4gDQo+ID4+ICBTaWduZWQtb2ZmLWJ5OiBQYXVsIENlcmN1ZWlsIDxw
YXVsQGNyYXBvdWlsbG91Lm5ldD4NCj4gPj4gIC0tLQ0KPiA+PiAgIGRyaXZlcnMvdXNiL2NvbW1v
bi9LY29uZmlnICAgICAgICAgfCAxMSArKysrKysrDQo+ID4+ICAgZHJpdmVycy91c2IvY29tbW9u
L3VzYi1jb25uLWdwaW8uYyB8IDQ3IA0KPiA+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysNCj4gPj4gICAyIGZpbGVzIGNoYW5nZWQsIDU4IGluc2VydGlvbnMoKykNCj4gPj4gDQo+ID4+
ICBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvY29tbW9uL0tjb25maWcgYi9kcml2ZXJzL3VzYi9j
b21tb24vS2NvbmZpZw0KPiA+PiAgaW5kZXggZDYxMTQ3N2FhZTQxLi41NDA1YWU5NmM2OGYgMTAw
NjQ0DQo+ID4+ICAtLS0gYS9kcml2ZXJzL3VzYi9jb21tb24vS2NvbmZpZw0KPiA+PiAgKysrIGIv
ZHJpdmVycy91c2IvY29tbW9uL0tjb25maWcNCj4gPj4gIEBAIC00OSwzICs0OSwxNCBAQCBjb25m
aWcgVVNCX0NPTk5fR1BJTw0KPiA+PiANCj4gPj4gICAgICAgICAgICBUbyBjb21waWxlIHRoZSBk
cml2ZXIgYXMgYSBtb2R1bGUsIGNob29zZSBNIGhlcmU6IHRoZSANCj4gPj4gbW9kdWxlIHdpbGwN
Cj4gPj4gICAgICAgICAgICBiZSBjYWxsZWQgdXNiLWNvbm4tZ3Bpby5rbw0KPiA+PiAgKw0KPiA+
PiAgK2lmIFVTQl9DT05OX0dQSU8NCj4gPj4gICsNCj4gPj4gICtjb25maWcgVVNCX0NPTk5fR1BJ
T19DSEFSR0VSDQo+ID4+ICArICAgICAgIGJvb2wgIlVTQiBjaGFyZ2VyIHN1cHBvcnQiDQo+ID4+
ICArICAgICAgIHNlbGVjdCBQT1dFUl9TVVBQTFkNCj4gPj4gICsgICAgICAgaGVscA0KPiA+PiAg
KyAgICAgICAgIFJlZ2lzdGVyIGEgY2hhcmdlciB3aXRoIHRoZSBwb3dlciBzdXBwbHkgc3Vic3lz
dGVtLiBUaGlzIA0KPiA+PiB3aWxsIGFsbG93DQo+ID4+ICArICAgICAgICAgdXNlcnNwYWNlIHRv
IGtub3cgd2hldGhlciBvciBub3QgdGhlIGRldmljZSBpcyBjaGFyZ2luZyANCj4gPj4gZnJvbSBV
U0IuDQo+ID4+ICArDQo+ID4+ICArZW5kaWYNCj4gPj4gIGRpZmYgLS1naXQgYS9kcml2ZXJzL3Vz
Yi9jb21tb24vdXNiLWNvbm4tZ3Bpby5jIA0KPiA+PiBiL2RyaXZlcnMvdXNiL2NvbW1vbi91c2It
Y29ubi1ncGlvLmMNCj4gPj4gIGluZGV4IGVkMjA0Y2JiNjNlYS4uMTI5ZDQ4ZGIyODBiIDEwMDY0
NA0KPiA+PiAgLS0tIGEvZHJpdmVycy91c2IvY29tbW9uL3VzYi1jb25uLWdwaW8uYw0KPiA+PiAg
KysrIGIvZHJpdmVycy91c2IvY29tbW9uL3VzYi1jb25uLWdwaW8uYw0KPiA+PiAgQEAgLTE3LDYg
KzE3LDcgQEANCj4gPj4gICAjaW5jbHVkZSA8bGludXgvb2YuaD4NCj4gPj4gICAjaW5jbHVkZSA8
bGludXgvcGluY3RybC9jb25zdW1lci5oPg0KPiA+PiAgICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9y
bV9kZXZpY2UuaD4NCj4gPj4gICsjaW5jbHVkZSA8bGludXgvcG93ZXJfc3VwcGx5Lmg+DQo+ID4+
ICAgI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPg0KPiA+PiAgICNpbmNsdWRl
IDxsaW51eC91c2Ivcm9sZS5oPg0KPiA+PiANCj4gPj4gIEBAIC0zOCw2ICszOSw5IEBAIHN0cnVj
dCB1c2JfY29ubl9pbmZvIHsNCj4gPj4gICAgICAgICAgc3RydWN0IGdwaW9fZGVzYyAqdmJ1c19n
cGlvZDsNCj4gPj4gICAgICAgICAgaW50IGlkX2lycTsNCj4gPj4gICAgICAgICAgaW50IHZidXNf
aXJxOw0KPiA+PiAgKw0KPiA+PiAgKyAgICAgICBzdHJ1Y3QgcG93ZXJfc3VwcGx5X2Rlc2MgZGVz
YzsNCj4gPj4gICsgICAgICAgc3RydWN0IHBvd2VyX3N1cHBseSAqY2hhcmdlcjsNCj4gPj4gICB9
Ow0KPiA+PiANCj4gPj4gICAvKioNCj4gPj4gIEBAIC05OCw2ICsxMDIsOCBAQCBzdGF0aWMgdm9p
ZCB1c2JfY29ubl9kZXRlY3RfY2FibGUoc3RydWN0IA0KPiA+PiB3b3JrX3N0cnVjdCAqd29yaykN
Cj4gPj4gICAgICAgICAgICAgICAgICByZXQgPSByZWd1bGF0b3JfZW5hYmxlKGluZm8tPnZidXMp
Ow0KPiA+PiAgICAgICAgICAgICAgICAgIGlmIChyZXQpDQo+ID4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICBkZXZfZXJyKGluZm8tPmRldiwgImVuYWJsZSB2YnVzIHJlZ3VsYXRvciANCj4gPj4g
ZmFpbGVkXG4iKTsNCj4gPj4gICsgICAgICAgfSBlbHNlIGlmIChJU19FTkFCTEVEKENPTkZJR19V
U0JfQ09OTl9HUElPX0NIQVJHRVIpKSB7DQo+ID4+ICArICAgICAgICAgICAgICAgcG93ZXJfc3Vw
cGx5X2NoYW5nZWQoaW5mby0+Y2hhcmdlcik7DQo+ID4+ICAgICAgICAgIH0NCj4gPj4gDQo+ID4+
ICAgICAgICAgIGluZm8tPmxhc3Rfcm9sZSA9IHJvbGU7DQo+ID4+ICBAQCAtMTIxLDEwICsxMjcs
MzUgQEAgc3RhdGljIGlycXJldHVybl90IHVzYl9jb25uX2lzcihpbnQgaXJxLCB2b2lkIA0KPiA+
PiAqZGV2X2lkKQ0KPiA+PiAgICAgICAgICByZXR1cm4gSVJRX0hBTkRMRUQ7DQo+ID4+ICAgfQ0K
PiA+PiANCj4gPj4gICtzdGF0aWMgZW51bSBwb3dlcl9zdXBwbHlfcHJvcGVydHkgdXNiX2NoYXJn
ZXJfcHJvcGVydGllc1tdID0gew0KPiA+PiAgKyAgICAgICBQT1dFUl9TVVBQTFlfUFJPUF9PTkxJ
TkUsDQo+ID4+ICArfTsNCj4gPj4gICsNCj4gPj4gICtzdGF0aWMgaW50IHVzYl9jaGFyZ2VyX2dl
dF9wcm9wZXJ0eShzdHJ1Y3QgcG93ZXJfc3VwcGx5ICpwc3ksDQo+ID4+ICArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBlbnVtIHBvd2VyX3N1cHBseV9wcm9wZXJ0eSBwc3AsDQo+
ID4+ICArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bmlvbiBwb3dlcl9zdXBw
bHlfcHJvcHZhbCAqdmFsKQ0KPiA+PiAgK3sNCj4gPj4gICsgICAgICAgc3RydWN0IHVzYl9jb25u
X2luZm8gKmluZm8gPSBwb3dlcl9zdXBwbHlfZ2V0X2RydmRhdGEocHN5KTsNCj4gPj4gICsNCj4g
Pj4gICsgICAgICAgc3dpdGNoIChwc3ApIHsNCj4gPj4gICsgICAgICAgY2FzZSBQT1dFUl9TVVBQ
TFlfUFJPUF9PTkxJTkU6DQo+ID4+ICArICAgICAgICAgICAgICAgdmFsLT5pbnR2YWwgPSBpbmZv
LT5sYXN0X3JvbGUgPT0gVVNCX1JPTEVfREVWSUNFOw0KV2hhdCB3aWxsIGhhcHBlbiBpZiB5b3Ug
bm90IGNoYW5nZSBpbmZvLT5sYXN0X3JvbGUgaGVyZT8NCkkgcHJlZmVyIGl0J3Mgb25seSBjaGFu
Z2VkIGJ5IHVzYl9jb25uX2lzcigpLCBpZiBpdCdzIGNoYW5nZWQgYnkgb3RoZXINCmRyaXZlcnMs
IGZvciBleGFtcGxlLCB0aHJvdWdoIHBvd2VyX3N1cHBseV9nZXRfcHJvcGVydHkoKSwgbWF5IHNr
aXAgcm9sZQ0Kc3dpdGNoLg0KDQo+ID4+ICArICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4+ICAr
ICAgICAgIGRlZmF1bHQ6DQo+ID4+ICArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+
ID4+ICArICAgICAgIH0NCj4gPj4gICsNCj4gPj4gICsgICAgICAgcmV0dXJuIDA7DQo+ID4+ICAr
fQ0KPiA+PiAgKw0KPiA+PiAgIHN0YXRpYyBpbnQgdXNiX2Nvbm5fcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikNCj4gPj4gICB7DQo+ID4+ICAgICAgICAgIHN0cnVjdCBkZXZpY2Ug
KmRldiA9ICZwZGV2LT5kZXY7DQo+ID4+ICArICAgICAgIHN0cnVjdCBwb3dlcl9zdXBwbHlfZGVz
YyAqZGVzYzsNCj4gPj4gICAgICAgICAgc3RydWN0IHVzYl9jb25uX2luZm8gKmluZm87DQo+ID4+
ICArICAgICAgIHN0cnVjdCBwb3dlcl9zdXBwbHlfY29uZmlnIGNmZyA9IHsNCj4gPj4gICsgICAg
ICAgICAgICAgICAub2Zfbm9kZSA9IGRldi0+b2Zfbm9kZSwNCj4gPj4gICsgICAgICAgfTsNCj4g
Pj4gICAgICAgICAgaW50IHJldCA9IDA7DQo+ID4+IA0KPiA+PiAgICAgICAgICBpbmZvID0gZGV2
bV9remFsbG9jKGRldiwgc2l6ZW9mKCppbmZvKSwgR0ZQX0tFUk5FTCk7DQo+ID4+ICBAQCAtMjAz
LDYgKzIzNCwyMiBAQCBzdGF0aWMgaW50IHVzYl9jb25uX3Byb2JlKHN0cnVjdCANCj4gPj4gcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+PiAgICAgICAgICAgICAgICAgIH0NCj4gPj4gICAgICAg
ICAgfQ0KPiA+PiANCj4gPj4gICsgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX1VTQl9DT05O
X0dQSU9fQ0hBUkdFUikpIHsNCj4gPj4gICsgICAgICAgICAgICAgICBkZXNjID0gJmluZm8tPmRl
c2M7DQo+ID4+ICArICAgICAgICAgICAgICAgZGVzYy0+bmFtZSA9ICJ1c2ItY2hhcmdlciI7DQo+
ID4+ICArICAgICAgICAgICAgICAgZGVzYy0+cHJvcGVydGllcyA9IHVzYl9jaGFyZ2VyX3Byb3Bl
cnRpZXM7DQo+ID4+ICArICAgICAgICAgICAgICAgZGVzYy0+bnVtX3Byb3BlcnRpZXMgPSANCj4g
Pj4gQVJSQVlfU0laRSh1c2JfY2hhcmdlcl9wcm9wZXJ0aWVzKTsNCj4gPj4gICsgICAgICAgICAg
ICAgICBkZXNjLT5nZXRfcHJvcGVydHkgPSB1c2JfY2hhcmdlcl9nZXRfcHJvcGVydHk7DQo+ID4+
ICArICAgICAgICAgICAgICAgZGVzYy0+dHlwZSA9IFBPV0VSX1NVUFBMWV9UWVBFX1VTQjsNCj4g
Pj4gICsgICAgICAgICAgICAgICBjZmcuZHJ2X2RhdGEgPSBpbmZvOw0KPiA+PiAgKw0KPiA+PiAg
KyAgICAgICAgICAgICAgIGluZm8tPmNoYXJnZXIgPSBkZXZtX3Bvd2VyX3N1cHBseV9yZWdpc3Rl
cihkZXYsIA0KPiA+PiBkZXNjLCAmY2ZnKTsNCj4gPj4gICsgICAgICAgICAgICAgICBpZiAoSVNf
RVJSKGluZm8tPmNoYXJnZXIpKSB7DQo+ID4+ICArICAgICAgICAgICAgICAgICAgICAgICBkZXZf
ZXJyKGRldiwgIlVuYWJsZSB0byByZWdpc3RlciANCj4gPj4gY2hhcmdlclxuIik7DQo+ID4+ICAr
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihpbmZvLT5jaGFyZ2VyKTsNCj4g
Pj4gICsgICAgICAgICAgICAgICB9DQo+ID4+ICArICAgICAgIH0NCj4gPj4gICsNCj4gPj4gICAg
ICAgICAgcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgaW5mbyk7DQo+ID4+IA0KPiA+PiAgICAg
ICAgICAvKiBQZXJmb3JtIGluaXRpYWwgZGV0ZWN0aW9uICovDQo+ID4+ICAtLQ0KPiA+PiAgMi4y
Ny4wDQo+ID4+IA0KPiA+IA0KPiA+IA0KPiA+IC0tDQo+ID4gV2l0aCBCZXN0IFJlZ2FyZHMsDQo+
ID4gQW5keSBTaGV2Y2hlbmtvDQo+IA0KPiANCg0K


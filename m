Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 840243D563B
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jul 2021 11:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbhGZIbk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Jul 2021 04:31:40 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:27158 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231926AbhGZIbg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Jul 2021 04:31:36 -0400
IronPort-SDR: hY4Nr+fdcGwDNuAPBQP+9MMz02k8GBvP9g7VsN64Y/soRdsgsqQn/H6VpIxuaWejsAhoXKjRsL
 TKgo424WuTbh8nEotq2tUl80vAnfMomxI+fDG3fWkbdlHI1tjhg6dbf4q2wyAEH6GiGmbp4syb
 NxubHk8ZTlSuQ3afjC8j2y48aVxRaL28ZvuEEn8X6JVI1I8wlXSgA5/21CU8SQBGgD9jIjjwQO
 ya0CBPNv0GwuuJdrJwB2d9TIrTsc0ZcBuDCOAcPuARL/njuIfGlQp1F/LbMBhy731JJJ0A+r8s
 rGC/xbLlWAHBzlpd3v02nRQh
X-IronPort-AV: E=Sophos;i="5.84,270,1620720000"; 
   d="scan'208,223";a="63906605"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 26 Jul 2021 01:11:55 -0800
IronPort-SDR: k5Tj2v0mfGKVcOPa+2BsfYUVP1vq95WnTmgKbMqLhA7typpbos89LgyOj9GwscvtOpPhrVLw2I
 KUV4QtxL5329ybMGS47KF89uFaD4RPCXB8xuhkFGexNNht3NxymvHQfcaFV3fNaAINwhS+Kos6
 MB1e7fqDRy/ogqsv5C/ZVm6uiQqQ4KvPX3rfSAl/vyNprHgJEn4865uxFTGqlwwV339snG1/vY
 XYb9nKpMDXmromdXSPtkF5O9swuYx5wUJmevDFGqe/tYJLydPyE6D8jK8bSEcYjLbydR8GqpM0
 ciU=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     "Greg KH (gregkh@linuxfoundation.org)" <gregkh@linuxfoundation.org>
CC:     USB list <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH for 4.14] xhci: add xhci_get_virt_ep() helper
Thread-Topic: [PATCH for 4.14] xhci: add xhci_get_virt_ep() helper
Thread-Index: AdeB/MZwIKb/vqPQSfySS+0zMoOZhg==
Date:   Mon, 26 Jul 2021 09:11:30 +0000
Message-ID: <3c42fbd4599a4a3e8b065418592973d9@SVR-IES-MBX-03.mgc.mentorg.com>
Accept-Language: de-DE, en-IE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RnJvbSA4MDRkMmRiNDljOGRiOTRmZjQ2NTJmMTM4MjZhMmM3NGRhYzMzOTQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogTWF0aGlhcyBOeW1hbiA8bWF0aGlhcy5ueW1hbkBsaW51eC5p
bnRlbC5jb20+DQpEYXRlOiBGcmksIDI5IEphbiAyMDIxIDE1OjAwOjIyICswMjAwDQpTdWJqZWN0
OiBbUEFUQ0hdIHhoY2k6IGFkZCB4aGNpX2dldF92aXJ0X2VwKCkgaGVscGVyDQoNCltjb21taXQg
YjFhZGM0MmQ0NDBkZjMyMzMyNTVlMzEzYTQ1YWI3ZTliMmI3NDA5NiB1cHN0cmVhbV0NCg0KSW4g
c2V2ZXJhbCBldmVudCBoYW5kbGVycyB3ZSBuZWVkIHRvIGZpbmQgdGhlIHJpZ2h0IGVuZHBvaW50
DQpzdHJ1Y3R1cmUgZnJvbSBzbG90X2lkIGFuZCBlcF9pbmRleCBpbiB0aGUgZXZlbnQuDQoNCkFk
ZCBhIGhlbHBlciBmb3IgdGhpcywgY2hlY2sgdGhhdCBzbG90X2lkIGFuZCBlcF9pbmRleCBhcmUg
dmFsaWQuDQoNClNpZ25lZC1vZmYtYnk6IE1hdGhpYXMgTnltYW4gPG1hdGhpYXMubnltYW5AbGlu
dXguaW50ZWwuY29tPg0KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIxMDEyOTEz
MDA0NC4yMDY4NTUtNi1tYXRoaWFzLm55bWFuQGxpbnV4LmludGVsLmNvbQ0KU2lnbmVkLW9mZi1i
eTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4NClNpZ25l
ZC1vZmYtYnk6IENhcnN0ZW4gU2NobWlkIDxjYXJzdGVuX3NjaG1pZEBtZW50b3IuY29tPg0KLS0t
DQpSYXRpb25hbGU6DQpGcm9tIG1haWwgdGhyZWFkICIgUG9zc2libGUgcmFjZSBpbiA0LjE0IHho
Y2kgc3RhY2siDQpTZWFyY2hlZCBmb3IgZml4IHRoYXQgTWF0aGlhcyBOeW1hbiBtZW50aW9uZWQu
DQpGaXggZGlkbid0IGFwcGx5IG9uIDQuMTQgZGlyZWN0bHksIG5lZWRlZCBzb21lIHNtYWxsIGFk
YXB0aW9uLg0KUmVzdWx0IHByb3ZpZGVkIGhlcmUuDQpAR3JlZzogUGF0Y2ggaXMgZm9yIDQuMTQs
IG5vdCB0ZXN0ZWQgaWYgYXBwbGllcyBvbiBvdGhlciBrZXJuZWxzLg0KLS0tDQogZHJpdmVycy91
c2IvaG9zdC94aGNpLXJpbmcuYyB8IDU4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLQ0KIGRyaXZlcnMvdXNiL2hvc3QveGhjaS5oICAgICAgfCAgMyArLQ0KIDIgZmlsZXMgY2hh
bmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3VzYi9ob3N0L3hoY2ktcmluZy5jIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLXJpbmcu
Yw0KaW5kZXggOTgyOGMxZWZmOWE1Li5jZTVkZWFjOTM0MTggMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L3VzYi9ob3N0L3hoY2ktcmluZy5jDQorKysgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcmluZy5j
DQpAQCAtNDQ0LDYgKzQ0NCwyNiBAQCBzdGF0aWMgdm9pZCByaW5nX2Rvb3JiZWxsX2Zvcl9hY3Rp
dmVfcmluZ3Moc3RydWN0IHhoY2lfaGNkICp4aGNpLA0KIH0NCiB9DQoNCitzdGF0aWMgc3RydWN0
IHhoY2lfdmlydF9lcCAqeGhjaV9nZXRfdmlydF9lcChzdHJ1Y3QgeGhjaV9oY2QgKnhoY2ksDQor
ICAgICB1bnNpZ25lZCBpbnQgc2xvdF9pZCwNCisgICAgIHVuc2lnbmVkIGludCBlcF9pbmRleCkN
Cit7DQoraWYgKHNsb3RfaWQgPT0gMCB8fCBzbG90X2lkID49IE1BWF9IQ19TTE9UUykgew0KK3ho
Y2lfd2Fybih4aGNpLCAiSW52YWxpZCBzbG90X2lkICV1XG4iLCBzbG90X2lkKTsNCityZXR1cm4g
TlVMTDsNCit9DQoraWYgKGVwX2luZGV4ID49IEVQX0NUWF9QRVJfREVWKSB7DQoreGhjaV93YXJu
KHhoY2ksICJJbnZhbGlkIGVuZHBvaW50IGluZGV4ICV1XG4iLCBlcF9pbmRleCk7DQorcmV0dXJu
IE5VTEw7DQorfQ0KK2lmICgheGhjaS0+ZGV2c1tzbG90X2lkXSkgew0KK3hoY2lfd2Fybih4aGNp
LCAiTm8geGhjaSB2aXJ0IGRldmljZSBmb3Igc2xvdF9pZCAldVxuIiwgc2xvdF9pZCk7DQorcmV0
dXJuIE5VTEw7DQorfQ0KKw0KK3JldHVybiAmeGhjaS0+ZGV2c1tzbG90X2lkXS0+ZXBzW2VwX2lu
ZGV4XTsNCit9DQorDQogLyogR2V0IHRoZSByaWdodCByaW5nIGZvciB0aGUgZ2l2ZW4gc2xvdF9p
ZCwgZXBfaW5kZXggYW5kIHN0cmVhbV9pZC4NCiAgKiBJZiB0aGUgZW5kcG9pbnQgc3VwcG9ydHMg
c3RyZWFtcywgYm91bmRhcnkgY2hlY2sgdGhlIFVSQidzIHN0cmVhbSBJRC4NCiAgKiBJZiB0aGUg
ZW5kcG9pbnQgZG9lc24ndCBzdXBwb3J0IHN0cmVhbXMsIHJldHVybiB0aGUgc2luZ3VsYXIgZW5k
cG9pbnQgcmluZy4NCkBAIC00NTQsNyArNDc0LDEwIEBAIHN0cnVjdCB4aGNpX3JpbmcgKnhoY2lf
dHJpYWRfdG9fdHJhbnNmZXJfcmluZyhzdHJ1Y3QgeGhjaV9oY2QgKnhoY2ksDQogew0KIHN0cnVj
dCB4aGNpX3ZpcnRfZXAgKmVwOw0KDQotZXAgPSAmeGhjaS0+ZGV2c1tzbG90X2lkXS0+ZXBzW2Vw
X2luZGV4XTsNCitlcCA9IHhoY2lfZ2V0X3ZpcnRfZXAoeGhjaSwgc2xvdF9pZCwgZXBfaW5kZXgp
Ow0KK2lmICghZXApDQorcmV0dXJuIE5VTEw7DQorDQogLyogQ29tbW9uIGNhc2U6IG5vIHN0cmVh
bXMgKi8NCiBpZiAoIShlcC0+ZXBfc3RhdGUgJiBFUF9IQVNfU1RSRUFNUykpDQogcmV0dXJuIGVw
LT5yaW5nOw0KQEAgLTcyNCwxMSArNzQ3LDE0IEBAIHN0YXRpYyB2b2lkIHhoY2lfaGFuZGxlX2Nt
ZF9zdG9wX2VwKHN0cnVjdCB4aGNpX2hjZCAqeGhjaSwgaW50IHNsb3RfaWQsDQogbWVtc2V0KCZk
ZXFfc3RhdGUsIDAsIHNpemVvZihkZXFfc3RhdGUpKTsNCiBlcF9pbmRleCA9IFRSQl9UT19FUF9J
TkRFWChsZTMyX3RvX2NwdSh0cmItPmdlbmVyaWMuZmllbGRbM10pKTsNCg0KK2VwID0geGhjaV9n
ZXRfdmlydF9lcCh4aGNpLCBzbG90X2lkLCBlcF9pbmRleCk7DQoraWYgKCFlcCkNCityZXR1cm47
DQorDQogdmRldiA9IHhoY2ktPmRldnNbc2xvdF9pZF07DQogZXBfY3R4ID0geGhjaV9nZXRfZXBf
Y3R4KHhoY2ksIHZkZXYtPm91dF9jdHgsIGVwX2luZGV4KTsNCiB0cmFjZV94aGNpX2hhbmRsZV9j
bWRfc3RvcF9lcChlcF9jdHgpOw0KDQotZXAgPSAmeGhjaS0+ZGV2c1tzbG90X2lkXS0+ZXBzW2Vw
X2luZGV4XTsNCiBsYXN0X3VubGlua2VkX3RkID0gbGlzdF9sYXN0X2VudHJ5KCZlcC0+Y2FuY2Vs
bGVkX3RkX2xpc3QsDQogc3RydWN0IHhoY2lfdGQsIGNhbmNlbGxlZF90ZF9saXN0KTsNCg0KQEAg
LTEwNTIsOSArMTA3OCwxMSBAQCBzdGF0aWMgdm9pZCB4aGNpX2hhbmRsZV9jbWRfc2V0X2RlcShz
dHJ1Y3QgeGhjaV9oY2QgKnhoY2ksIGludCBzbG90X2lkLA0KDQogZXBfaW5kZXggPSBUUkJfVE9f
RVBfSU5ERVgobGUzMl90b19jcHUodHJiLT5nZW5lcmljLmZpZWxkWzNdKSk7DQogc3RyZWFtX2lk
ID0gVFJCX1RPX1NUUkVBTV9JRChsZTMyX3RvX2NwdSh0cmItPmdlbmVyaWMuZmllbGRbMl0pKTsN
Ci1kZXYgPSB4aGNpLT5kZXZzW3Nsb3RfaWRdOw0KLWVwID0gJmRldi0+ZXBzW2VwX2luZGV4XTsN
CitlcCA9IHhoY2lfZ2V0X3ZpcnRfZXAoeGhjaSwgc2xvdF9pZCwgZXBfaW5kZXgpOw0KK2lmICgh
ZXApDQorcmV0dXJuOw0KDQorZGV2ID0geGhjaS0+ZGV2c1tzbG90X2lkXTsNCiBlcF9yaW5nID0g
eGhjaV9zdHJlYW1faWRfdG9fcmluZyhkZXYsIGVwX2luZGV4LCBzdHJlYW1faWQpOw0KIGlmICgh
ZXBfcmluZykgew0KIHhoY2lfd2Fybih4aGNpLCAiV0FSTiBTZXQgVFIgZGVxIHB0ciBjb21tYW5k
IGZvciBmcmVlZCBzdHJlYW0gSUQgJXVcbiIsDQpAQCAtMTEyNyw5ICsxMTU1LDkgQEAgc3RhdGlj
IHZvaWQgeGhjaV9oYW5kbGVfY21kX3NldF9kZXEoc3RydWN0IHhoY2lfaGNkICp4aGNpLCBpbnQg
c2xvdF9pZCwNCiB9DQoNCiBjbGVhbnVwOg0KLWRldi0+ZXBzW2VwX2luZGV4XS5lcF9zdGF0ZSAm
PSB+U0VUX0RFUV9QRU5ESU5HOw0KLWRldi0+ZXBzW2VwX2luZGV4XS5xdWV1ZWRfZGVxX3NlZyA9
IE5VTEw7DQotZGV2LT5lcHNbZXBfaW5kZXhdLnF1ZXVlZF9kZXFfcHRyID0gTlVMTDsNCitlcC0+
ZXBfc3RhdGUgJj0gflNFVF9ERVFfUEVORElORzsNCitlcC0+cXVldWVkX2RlcV9zZWcgPSBOVUxM
Ow0KK2VwLT5xdWV1ZWRfZGVxX3B0ciA9IE5VTEw7DQogLyogUmVzdGFydCBhbnkgcmluZ3Mgd2l0
aCBwZW5kaW5nIFVSQnMgKi8NCiByaW5nX2Rvb3JiZWxsX2Zvcl9hY3RpdmVfcmluZ3MoeGhjaSwg
c2xvdF9pZCwgZXBfaW5kZXgpOw0KIH0NCkBAIC0xMTM4LDEwICsxMTY2LDE1IEBAIHN0YXRpYyB2
b2lkIHhoY2lfaGFuZGxlX2NtZF9yZXNldF9lcChzdHJ1Y3QgeGhjaV9oY2QgKnhoY2ksIGludCBz
bG90X2lkLA0KIHVuaW9uIHhoY2lfdHJiICp0cmIsIHUzMiBjbWRfY29tcF9jb2RlKQ0KIHsNCiBz
dHJ1Y3QgeGhjaV92aXJ0X2RldmljZSAqdmRldjsNCitzdHJ1Y3QgeGhjaV92aXJ0X2VwICplcDsN
CiBzdHJ1Y3QgeGhjaV9lcF9jdHggKmVwX2N0eDsNCiB1bnNpZ25lZCBpbnQgZXBfaW5kZXg7DQoN
CiBlcF9pbmRleCA9IFRSQl9UT19FUF9JTkRFWChsZTMyX3RvX2NwdSh0cmItPmdlbmVyaWMuZmll
bGRbM10pKTsNCitlcCA9IHhoY2lfZ2V0X3ZpcnRfZXAoeGhjaSwgc2xvdF9pZCwgZXBfaW5kZXgp
Ow0KK2lmICghZXApDQorcmV0dXJuOw0KKw0KIHZkZXYgPSB4aGNpLT5kZXZzW3Nsb3RfaWRdOw0K
IGVwX2N0eCA9IHhoY2lfZ2V0X2VwX2N0eCh4aGNpLCB2ZGV2LT5vdXRfY3R4LCBlcF9pbmRleCk7
DQogdHJhY2VfeGhjaV9oYW5kbGVfY21kX3Jlc2V0X2VwKGVwX2N0eCk7DQpAQCAtMTE3MSw3ICsx
MjA0LDcgQEAgc3RhdGljIHZvaWQgeGhjaV9oYW5kbGVfY21kX3Jlc2V0X2VwKHN0cnVjdCB4aGNp
X2hjZCAqeGhjaSwgaW50IHNsb3RfaWQsDQogeGhjaV9yaW5nX2NtZF9kYih4aGNpKTsNCiB9IGVs
c2Ugew0KIC8qIENsZWFyIG91ciBpbnRlcm5hbCBoYWx0ZWQgc3RhdGUgKi8NCi14aGNpLT5kZXZz
W3Nsb3RfaWRdLT5lcHNbZXBfaW5kZXhdLmVwX3N0YXRlICY9IH5FUF9IQUxURUQ7DQorZXAtPmVw
X3N0YXRlICY9IH5FUF9IQUxURUQ7DQogfQ0KIH0NCg0KQEAgLTIzNDcsMTQgKzIzODAsMTMgQEAg
c3RhdGljIGludCBoYW5kbGVfdHhfZXZlbnQoc3RydWN0IHhoY2lfaGNkICp4aGNpLA0KIHRyYl9j
b21wX2NvZGUgPSBHRVRfQ09NUF9DT0RFKGxlMzJfdG9fY3B1KGV2ZW50LT50cmFuc2Zlcl9sZW4p
KTsNCiBlcF90cmJfZG1hID0gbGU2NF90b19jcHUoZXZlbnQtPmJ1ZmZlcik7DQoNCi14ZGV2ID0g
eGhjaS0+ZGV2c1tzbG90X2lkXTsNCi1pZiAoIXhkZXYpIHsNCi14aGNpX2Vycih4aGNpLCAiRVJS
T1IgVHJhbnNmZXIgZXZlbnQgcG9pbnRlZCB0byBiYWQgc2xvdCAldVxuIiwNCi0gc2xvdF9pZCk7
DQorZXAgPSB4aGNpX2dldF92aXJ0X2VwKHhoY2ksIHNsb3RfaWQsIGVwX2luZGV4KTsNCitpZiAo
IWVwKSB7DQoreGhjaV9lcnIoeGhjaSwgIkVSUk9SIEludmFsaWQgVHJhbnNmZXIgZXZlbnRcbiIp
Ow0KIGdvdG8gZXJyX291dDsNCiB9DQoNCi1lcCA9ICZ4ZGV2LT5lcHNbZXBfaW5kZXhdOw0KK3hk
ZXYgPSB4aGNpLT5kZXZzW3Nsb3RfaWRdOw0KIGVwX3JpbmcgPSB4aGNpX2RtYV90b190cmFuc2Zl
cl9yaW5nKGVwLCBlcF90cmJfZG1hKTsNCiBlcF9jdHggPSB4aGNpX2dldF9lcF9jdHgoeGhjaSwg
eGRldi0+b3V0X2N0eCwgZXBfaW5kZXgpOw0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9z
dC94aGNpLmggYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2kuaA0KaW5kZXggNzIzY2IzMWY1OTJiLi4y
YjgxOGRkMTJhOGQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2kuaA0KKysrIGIv
ZHJpdmVycy91c2IvaG9zdC94aGNpLmgNCkBAIC05OTEsNiArOTkxLDcgQEAgc3RydWN0IHhoY2lf
aW50ZXJ2YWxfYndfdGFibGUgew0KIHVuc2lnbmVkIGludHNzX2J3X291dDsNCiB9Ow0KDQorI2Rl
ZmluZSBFUF9DVFhfUEVSX0RFVjMxDQoNCiBzdHJ1Y3QgeGhjaV92aXJ0X2RldmljZSB7DQogc3Ry
dWN0IHVzYl9kZXZpY2UqdWRldjsNCkBAIC0xMDA1LDcgKzEwMDYsNyBAQCBzdHJ1Y3QgeGhjaV92
aXJ0X2RldmljZSB7DQogc3RydWN0IHhoY2lfY29udGFpbmVyX2N0eCAgICAgICAqb3V0X2N0eDsN
CiAvKiBVc2VkIGZvciBhZGRyZXNzaW5nIGRldmljZXMgYW5kIGNvbmZpZ3VyYXRpb24gY2hhbmdl
cyAqLw0KIHN0cnVjdCB4aGNpX2NvbnRhaW5lcl9jdHggICAgICAgKmluX2N0eDsNCi1zdHJ1Y3Qg
eGhjaV92aXJ0X2VwZXBzWzMxXTsNCitzdHJ1Y3QgeGhjaV92aXJ0X2VwZXBzW0VQX0NUWF9QRVJf
REVWXTsNCiB1OGZha2VfcG9ydDsNCiB1OHJlYWxfcG9ydDsNCiBzdHJ1Y3QgeGhjaV9pbnRlcnZh
bF9id190YWJsZSpid190YWJsZTsNCi0tDQoyLjE3LjENCi0tLS0tLS0tLS0tLS0tLS0tDQpTaWVt
ZW5zIEVsZWN0cm9uaWMgRGVzaWduIEF1dG9tYXRpb24gR21iSDsgQW5zY2hyaWZ0OiBBcm51bGZz
dHJhw59lIDIwMSwgODA2MzQgTcO8bmNoZW47IEdlc2VsbHNjaGFmdCBtaXQgYmVzY2hyw6Rua3Rl
ciBIYWZ0dW5nOyBHZXNjaMOkZnRzZsO8aHJlcjogVGhvbWFzIEhldXJ1bmcsIEZyYW5rIFRow7xy
YXVmOyBTaXR6IGRlciBHZXNlbGxzY2hhZnQ6IE3DvG5jaGVuOyBSZWdpc3RlcmdlcmljaHQgTcO8
bmNoZW4sIEhSQiAxMDY5NTUNCg==

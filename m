Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1B7F5CE3E
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 13:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbfGBLRx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 07:17:53 -0400
Received: from smtp-fw-33001.amazon.com ([207.171.190.10]:57131 "EHLO
        smtp-fw-33001.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbfGBLRw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jul 2019 07:17:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1562066272; x=1593602272;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=Wzh+87SNrNniE5cY+Yyj2+/o/B2FALZLIME/Qh4E8Cw=;
  b=Z6+J+I9kkWnf7kpf7dRWAMmmOqfQLoYtT3z5ovmJnchjFjowaBGVHuuT
   Mzq5WNIYVGB/GzwzUHIjffudpqrLkuODYN0TGxuB5/j2g2VFzlVb60MoL
   mmdZakJg+8KkYhDTwsqq+Nxut7XKp0T3Wv4MS6H+WwWt2NsGHSOWVPtYC
   0=;
X-IronPort-AV: E=Sophos;i="5.62,443,1554768000"; 
   d="scan'208";a="808906684"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.47.22.38])
  by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP; 02 Jul 2019 11:17:48 +0000
Received: from EX13MTAUWB001.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
        by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (Postfix) with ESMTPS id 3D1A7A1E2D;
        Tue,  2 Jul 2019 11:17:48 +0000 (UTC)
Received: from EX13D21UWB001.ant.amazon.com (10.43.161.108) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 2 Jul 2019 11:17:47 +0000
Received: from EX13D21UWB003.ant.amazon.com (10.43.161.212) by
 EX13D21UWB001.ant.amazon.com (10.43.161.108) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 2 Jul 2019 11:17:47 +0000
Received: from EX13D21UWB003.ant.amazon.com ([10.43.161.212]) by
 EX13D21UWB003.ant.amazon.com ([10.43.161.212]) with mapi id 15.00.1367.000;
 Tue, 2 Jul 2019 11:17:47 +0000
From:   "Herrenschmidt, Benjamin" <benh@amazon.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "joel@jms.id.au" <joel@jms.id.au>
Subject: [PATCH 1/2] usb: gadget: aspeed: Don't set port enable change bit on
 reset
Thread-Topic: [PATCH 1/2] usb: gadget: aspeed: Don't set port enable change
 bit on reset
Thread-Index: AQHVMMfH4Yzjd51Wsk6frikY23zeEg==
Date:   Tue, 2 Jul 2019 11:17:47 +0000
Message-ID: <e4d9881ac8f05550ba52a2a9d8682efd91a514ab.camel@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.161.197]
Content-Type: text/plain; charset="utf-8"
Content-ID: <F9C8FEC71C95844FB1507041D5CF44DD@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

VGhpcyBiaXQgc2hvdWxkIGJlIG9ubHkgc2V0IHdoZW4gdGhlIHBvcnQgZW5hYmxlIGdvZXMgZG93
biwgZm9yDQpleGFtcGxlLCBvbiBlcnJvcnMuIE5vdCB3aGVuIGl0IGdldHMgc2V0IGFmdGVyIGEg
cG9ydCByZXNldC4gTWFjT1MNCnNlZW1zIHNlbnNpdGl2ZSB0byB0aGlzIGFuZCBmYWlscyBlbnVt
ZXJhdGlvbi4NCg0KU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gSGVycmVuc2NobWlkdCA8YmVuaEBr
ZXJuZWwuY3Jhc2hpbmcub3JnPg0KLS0tDQogZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9hc3BlZWQt
dmh1Yi9odWIuYyB8IDkgKysrKysrKystDQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9h
c3BlZWQtdmh1Yi9odWIuYyBiL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvYXNwZWVkLXZodWIvaHVi
LmMNCmluZGV4IDdjMDQwZjU2MTAwZS4uMDc1NTExNWZkOTBkIDEwMDY0NA0KLS0tIGEvZHJpdmVy
cy91c2IvZ2FkZ2V0L3VkYy9hc3BlZWQtdmh1Yi9odWIuYw0KKysrIGIvZHJpdmVycy91c2IvZ2Fk
Z2V0L3VkYy9hc3BlZWQtdmh1Yi9odWIuYw0KQEAgLTQ0OSw4ICs0NDksMTUgQEAgc3RhdGljIHZv
aWQgYXN0X3ZodWJfY2hhbmdlX3BvcnRfc3RhdChzdHJ1Y3QgYXN0X3ZodWIgKnZodWIsDQogCQkg
ICAgICAgVVNCX1BPUlRfU1RBVF9DX09WRVJDVVJSRU5UIHwNCiAJCSAgICAgICBVU0JfUE9SVF9T
VEFUX0NfUkVTRVQgfA0KIAkJICAgICAgIFVTQl9QT1JUX1NUQVRfQ19MMTsNCi0JCXAtPmNoYW5n
ZSB8PSBjaGc7DQogDQorCQkvKg0KKwkJICogV2Ugb25seSBzZXQgVVNCX1BPUlRfU1RBVF9DX0VO
QUJMRSBpZiB3ZSBhcmUgZGlzYWJsaW5nDQorCQkgKiB0aGUgcG9ydCBhcyBwZXIgVVNCIHNwZWMs
IG90aGVyd2lzZSBNYWNPUyBnZXRzIHVwc2V0DQorCQkgKi8NCisJCWlmIChwLT5zdGF0dXMgJiBV
U0JfUE9SVF9TVEFUX0VOQUJMRSkNCisJCQljaGcgJj0gflVTQl9QT1JUX1NUQVRfQ19FTkFCTEU7
DQorDQorCQlwLT5jaGFuZ2UgPSBjaGc7DQogCQlhc3Rfdmh1Yl91cGRhdGVfaHViX2VwMSh2aHVi
LCBwb3J0KTsNCiAJfQ0KIH0NCg0K

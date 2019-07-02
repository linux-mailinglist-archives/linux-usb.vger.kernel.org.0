Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC0B5CE3F
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 13:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbfGBLRz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 07:17:55 -0400
Received: from smtp-fw-2101.amazon.com ([72.21.196.25]:14133 "EHLO
        smtp-fw-2101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbfGBLRy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jul 2019 07:17:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1562066274; x=1593602274;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=7ssLmKGs1dDn3qdpfL6RS3bthYJfX2BKBfaNuABlUwo=;
  b=eusJQZh/5i+OTPPKJpcDCn4G70BYsQr/k/EM2qsF5qeq+TasxOmVMQMw
   YJ0+pM8+MnV35eQYuVdWEMBHTGwLSftt5xbazmSCQT/2KLiX4y6vcvlQm
   3zdv+Mqck3NT61AKTNHR9VHgT76mKtN53gM8v+C10zS50Yjtt2aSJtxNg
   M=;
X-IronPort-AV: E=Sophos;i="5.62,443,1554768000"; 
   d="scan'208";a="740046882"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-2a-8549039f.us-west-2.amazon.com) ([10.124.125.2])
  by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP; 02 Jul 2019 11:17:52 +0000
Received: from EX13MTAUWB001.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
        by email-inbound-relay-2a-8549039f.us-west-2.amazon.com (Postfix) with ESMTPS id CC595A19A6;
        Tue,  2 Jul 2019 11:17:51 +0000 (UTC)
Received: from EX13D21UWB003.ant.amazon.com (10.43.161.212) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 2 Jul 2019 11:17:51 +0000
Received: from EX13D21UWB003.ant.amazon.com (10.43.161.212) by
 EX13D21UWB003.ant.amazon.com (10.43.161.212) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 2 Jul 2019 11:17:51 +0000
Received: from EX13D21UWB003.ant.amazon.com ([10.43.161.212]) by
 EX13D21UWB003.ant.amazon.com ([10.43.161.212]) with mapi id 15.00.1367.000;
 Tue, 2 Jul 2019 11:17:51 +0000
From:   "Herrenschmidt, Benjamin" <benh@amazon.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "joel@jms.id.au" <joel@jms.id.au>
Subject: [PATCH 2/2] usb: gadget: aspeed: Cleanup EP0 state on port reset
Thread-Topic: [PATCH 2/2] usb: gadget: aspeed: Cleanup EP0 state on port reset
Thread-Index: AQHVMMfJaRy0T3ztuk2KHh7qVf1qhg==
Date:   Tue, 2 Jul 2019 11:17:51 +0000
Message-ID: <f625807b7f5bc7cee330dbb12b13447798eaf87c.camel@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.161.197]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4C5F35A23184C4A8895567B18E9F6C7@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T3RoZXJ3aXNlLCB3ZSBjYW4gaGF2ZSBhIHN0YWxlIHN0YXRlIGFmdGVyIGEgZGlzY29ubmVjdCBh
bmQgcmVjb25uZWN0DQpjYXVzaW5nIGVycm9ycyBvbiB0aGUgZmlyc3QgU0VUVVAgcGFja2V0IHRv
IHRoZSBkZXZpY2UuDQoNClNpZ25lZC1vZmYtYnk6IEJlbmphbWluIEhlcnJlbnNjaG1pZHQgPGJl
bmhAa2VybmVsLmNyYXNoaW5nLm9yZz4NCi0tLQ0KIGRyaXZlcnMvdXNiL2dhZGdldC91ZGMvYXNw
ZWVkLXZodWIvZGV2LmMgIHwgMyArKysNCiBkcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2FzcGVlZC12
aHViL2VwMC5jICB8IDkgKysrKysrKysrDQogZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9hc3BlZWQt
dmh1Yi92aHViLmggfCAxICsNCiAzIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykNCg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvYXNwZWVkLXZodWIvZGV2LmMgYi9k
cml2ZXJzL3VzYi9nYWRnZXQvdWRjL2FzcGVlZC12aHViL2Rldi5jDQppbmRleCA2YjFiMTZiMTdk
N2QuLjY3OGJiZGJkMDk3MSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvYXNw
ZWVkLXZodWIvZGV2LmMNCisrKyBiL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvYXNwZWVkLXZodWIv
ZGV2LmMNCkBAIC01NSw2ICs1NSw5IEBAIHN0YXRpYyB2b2lkIGFzdF92aHViX2Rldl9lbmFibGUo
c3RydWN0IGFzdF92aHViX2RldiAqZCkNCiAJaWYgKGQtPmVuYWJsZWQpDQogCQlyZXR1cm47DQog
DQorCS8qIENsZWFudXAgRVAwIHN0YXRlICovDQorCWFzdF92aHViX3Jlc2V0X2VwMChkKTsNCisN
CiAJLyogRW5hYmxlIGRldmljZSBhbmQgaXRzIEVQMCBpbnRlcnJ1cHRzICovDQogCXJlZyA9IFZI
VUJfREVWX0VOX0VOQUJMRV9QT1JUIHwNCiAJCVZIVUJfREVWX0VOX0VQMF9JTl9BQ0tfSVJRRU4g
fA0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvYXNwZWVkLXZodWIvZXAwLmMg
Yi9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2FzcGVlZC12aHViL2VwMC5jDQppbmRleCBlMjkyN2Zi
MDgzY2YuLjUwNTRjNjM0M2VhZCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMv
YXNwZWVkLXZodWIvZXAwLmMNCisrKyBiL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvYXNwZWVkLXZo
dWIvZXAwLmMNCkBAIC00NTksNiArNDU5LDE1IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNiX2Vw
X29wcyBhc3Rfdmh1Yl9lcDBfb3BzID0gew0KIAkuZnJlZV9yZXF1ZXN0CT0gYXN0X3ZodWJfZnJl
ZV9yZXF1ZXN0LA0KIH07DQogDQordm9pZCBhc3Rfdmh1Yl9yZXNldF9lcDAoc3RydWN0IGFzdF92
aHViX2RldiAqZGV2KQ0KK3sNCisJc3RydWN0IGFzdF92aHViX2VwICplcCA9ICZkZXYtPmVwMDsN
CisNCisJYXN0X3ZodWJfbnVrZShlcCwgLUVJTyk7DQorICAgICAgICBlcC0+ZXAwLnN0YXRlID0g
ZXAwX3N0YXRlX3Rva2VuOw0KK30NCisNCisNCiB2b2lkIGFzdF92aHViX2luaXRfZXAwKHN0cnVj
dCBhc3Rfdmh1YiAqdmh1Yiwgc3RydWN0IGFzdF92aHViX2VwICplcCwNCiAJCSAgICAgICBzdHJ1
Y3QgYXN0X3ZodWJfZGV2ICpkZXYpDQogew0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdl
dC91ZGMvYXNwZWVkLXZodWIvdmh1Yi5oIGIvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9hc3BlZWQt
dmh1Yi92aHViLmgNCmluZGV4IDRlZDAzZDMzYTVhOS4uMmU3ZWYzODdmNGYwIDEwMDY0NA0KLS0t
IGEvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9hc3BlZWQtdmh1Yi92aHViLmgNCisrKyBiL2RyaXZl
cnMvdXNiL2dhZGdldC91ZGMvYXNwZWVkLXZodWIvdmh1Yi5oDQpAQCAtNTA3LDYgKzUwNyw3IEBA
IHZvaWQgYXN0X3ZodWJfaW5pdF9odyhzdHJ1Y3QgYXN0X3ZodWIgKnZodWIpOw0KIC8qIGVwMC5j
ICovDQogdm9pZCBhc3Rfdmh1Yl9lcDBfaGFuZGxlX2FjayhzdHJ1Y3QgYXN0X3ZodWJfZXAgKmVw
LCBib29sIGluX2Fjayk7DQogdm9pZCBhc3Rfdmh1Yl9lcDBfaGFuZGxlX3NldHVwKHN0cnVjdCBh
c3Rfdmh1Yl9lcCAqZXApOw0KK3ZvaWQgYXN0X3ZodWJfcmVzZXRfZXAwKHN0cnVjdCBhc3Rfdmh1
Yl9kZXYgKmRldik7DQogdm9pZCBhc3Rfdmh1Yl9pbml0X2VwMChzdHJ1Y3QgYXN0X3ZodWIgKnZo
dWIsIHN0cnVjdCBhc3Rfdmh1Yl9lcCAqZXAsDQogCQkgICAgICAgc3RydWN0IGFzdF92aHViX2Rl
diAqZGV2KTsNCiBpbnQgYXN0X3ZodWJfcmVwbHkoc3RydWN0IGFzdF92aHViX2VwICplcCwgY2hh
ciAqcHRyLCBpbnQgbGVuKTsNCg0K

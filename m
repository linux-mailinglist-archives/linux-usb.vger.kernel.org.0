Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3798D0A7
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2019 12:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfHNKW5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Aug 2019 06:22:57 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:42520 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725888AbfHNKW5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Aug 2019 06:22:57 -0400
IronPort-SDR: J2a6EK0ZYl4l+ZhpfwrGpvTj/A+EmlTtLyzoJqDUE2x3gAhMm4Gt+sZ1bEryQC/P4XeS/g0/r4
 FeK4pbtD4LKqoJQzpIDWWKLD7yGpNDiGyDNOo4TOBAUwU31AaoWPq+wc3W1QN0+vjVo2c6RE7Z
 sGdgsPnvhxoDmznutyYhLvpYZAHJuxzmxIalLZIyrSvM3BKtfaIoRdKt5P97mBbzks6wYmMpqa
 ElER3jWsUZwsYs+aMSn6aZB2dmT/3SbXIixTaQZOZ6E1nTLRm2ZDkrmztXc0PhFAL2SCPIsv6B
 8OU=
X-IronPort-AV: E=Sophos;i="5.64,384,1559548800"; 
   d="scan'208";a="40442356"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 14 Aug 2019 02:22:56 -0800
IronPort-SDR: taJKW8HxyzgydnFxVtFT9vZvRBs9kRYDY88SjlKFExN1WUMEqCzh7rkcaLmzxPLoWuOAXWVvwW
 8lDDH8zAqIy3vwZccJGLBqSjSrK8AkGcZ3svL4lEAT+jMCc2vGQGsEaIoa3VF3WlX5j2IPQwVv
 usfk0SscJ+WdGnS4rWoufTPI0Zwa4x+FA0Et1kD5BgVb3u13Olm7UEY4Tmt3HLmNncdliNYDun
 wcGuyH0ZP3Ep5BDvxO8zX90941OQxQ+JTxWJapDGQeek3jjD6mmMBvVkt9kzD+eqTcE5IG98JL
 0Xo=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     Oliver Neukum <oneukum@suse.com>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: AW: Strange behaviour of D-Link DUB-1312 USB 3.0 Adapters
Thread-Topic: Strange behaviour of D-Link DUB-1312 USB 3.0 Adapters
Thread-Index: AdVSeH/taFnFr9I1T4OXjPctlrQ3Ev//86kA///uBTD//8ARIA==
Date:   Wed, 14 Aug 2019 10:22:51 +0000
Message-ID: <b3b7161ab7f34301aedfd5e5ba3d41a7@SVR-IES-MBX-03.mgc.mentorg.com>
References: <db0e8930ea94408ca7a38192ddfd203f@SVR-IES-MBX-03.mgc.mentorg.com>
 <1565771508.25764.3.camel@suse.com>
 <f5e22fea4e1c4baeb2fc98d324ad9060@SVR-IES-MBX-03.mgc.mentorg.com>
In-Reply-To: <f5e22fea4e1c4baeb2fc98d324ad9060@SVR-IES-MBX-03.mgc.mentorg.com>
Accept-Language: de-DE, en-IE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Pj4+IFBsdWdnaW5nIHRoZW0gaW50byB0aGUgc2FtZSBwb3J0ICghKSBvbiBteSBkZXZpY2Ugb25l
IG9mIHRoZW0gaXMNCj4+PiByZWNvZ25pemVkIGFzIFN1cGVyU3BlZWQsIHRoZSBvdGhlciBhcyBo
aWdoIHNwZWVkID8/Pw0KPj4+ICh3b3JraW5nIG9uIDQuMTQuMTI5IExUUykNCj4+Pg0KPj4+IEZy
b20gZG1lc2csIHRoZSAiZmF1bHR5IiBvbmU6DQo+Pj4gWyAgNTMwLjU4NTg3MV0gdXNiIDEtMjog
bmV3IGhpZ2gtc3BlZWQgVVNCIGRldmljZSBudW1iZXIgNCB1c2luZw0KPj4+IHhoY2lfaGNkICAg
PDw8PDw8PDw8IEhVSCA/Pz8/DQo+Pj4NCj4+IFhIQ0kgaXMgbm90IGxpa2UgRUhDSS4gSXQgbmVl
ZHMgbm8gY29tcGFuaW9uIGNvbnRyb2xsZXIsIGFzIGl0IHNlcnZlcw0KPj4gYWxsIHNwZWVkcy4N
Cj4+DQo+PiBUaGlzIGlzIG9uIGEgbG93ZXIgbGF5ZXIgdGhhbiBheDg4MTc5LiBUaGlzIGNvbWVz
IGZyb20geGhjaV9oY2QuDQo+PiBJcyB0aGlzIGEgcmVncmVzc2lvbj8NCj4+DQo+IEkgZG9uJ3Qg
dGhpbmsgaXRzIGEgcmVncmVzc2lvbi4NCj4NCkkgY2FuIHNlZSB0aGUgc2FtZSBvbiBhIDQuMTQu
MTAyLg0KDQpOZXh0IG9ic2VydmF0aW9uOg0KQWZ0ZXIgc29tZSAtIGxvbmcgLSB0aW1lICg+IDE1
IG1pbnV0ZXMpIGEgaGFuZ2luZyBwaW5nDQpzYXlzOg0KcGluZzogc2VuZHRvOiBOZXR3b3JrIGlz
IHVucmVhY2hhYmxlDQoNCkFmdGVyIHRoaXMsIHdpdGhvdXQgZG9pbmcgYW55dGhpbmcsIGkgY2Fu
IHN0YXJ0IHBpbmcgYWdhaW4NCmFuZCBpdCB3b3JrczoNCg0KJDp+IyBwaW5nIDEzNC44Ni41Ni44
MA0KUElORyAxMzQuODYuNTYuODAgKDEzNC44Ni41Ni44MCk6IDU2IGRhdGEgYnl0ZXMNCnBpbmc6
IHNlbmR0bzogTmV0d29yayBpcyB1bnJlYWNoYWJsZQ0KJDp+IyBwaW5nIDEzNC44Ni41Ni44MA0K
UElORyAxMzQuODYuNTYuODAgKDEzNC44Ni41Ni44MCk6IDU2IGRhdGEgYnl0ZXMNCjY0IGJ5dGVz
IGZyb20gMTM0Ljg2LjU2LjgwOiBzZXE9MCB0dGw9NjMgdGltZT0zLjIwNiBtcw0KNjQgYnl0ZXMg
ZnJvbSAxMzQuODYuNTYuODA6IHNlcT0xIHR0bD02MyB0aW1lPTAuNjYyIG1zDQoNCkxvb2tzIGxp
a2UgYSBoaWdoZXIgcmF0ZSBvZiB0cmFuc2ZlcnMgY2F1c2VzIGEgc3RhbGwgb3IgcmV0cmllcw0K
b3Igd2hhdGV2ZXIgLSBidXQgd2l0aG91dCBhbnkgbWVzc2FnZSBpJ20gbG9zdC4NCkkgY2FuIHJl
cHJvZHVjZSB0aGlzIDEwMCUuDQoNClNvbWVvbmUgdGhlcmUgd2hvIGhhcyBhbnkgYWR2aWNlIHdo
YXQgaSBjYW4gZG8gdG8NCnRyYWNrIHRoaXMgZG93bj8NCg0KQmVzdCByZWdhcmRzDQpDYXJzdGVu
DQo=

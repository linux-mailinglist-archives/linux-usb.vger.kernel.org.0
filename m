Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62B1E8CE29
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2019 10:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbfHNIRO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 14 Aug 2019 04:17:14 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:59298 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbfHNIRO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Aug 2019 04:17:14 -0400
IronPort-SDR: Hdg0FpHOtHKyHfN6raeTPdZEvYArMmDZUS0hKNceBYUqG3LJmytBaOZJBvuJevKSfnxhR1W4o2
 dX8iQ2OOXC4H20Q7oCsAAWppusU5AslQP0adKRcJ7s0VQtCiEGiWbWBL2O1yG10UXgM/vMBT6n
 u4CtI8GxmaR5WmlK4Iz5rRYpqsW+iECFfLYuyak4MIyWAfcPyKzxjWeG39DJmqDkJAPyQM4H9F
 vs7YHwbiIwwmJW8t7fEd7Kp4AYDMDO9JPvWWr0ZioDvUxpXA4PUrMmme0dLwjoPNVxzmA+yzEe
 W3Q=
X-IronPort-AV: E=Sophos;i="5.64,384,1559548800"; 
   d="scan'208";a="40418792"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 14 Aug 2019 00:17:13 -0800
IronPort-SDR: M89bSmRJkiF32Cge8V4COSD9Evv5/XqG1ft0xL+P5cM57KRe9+iWb4Nmf0LRe7VDYa6Ua5EFOZ
 OvFXNPnliJIrpfEbH7B6B04cZnOx72o3Et+/x+rPRM4ahovNLIxO694vjkUuUoyhUIpjtZ7ghU
 cmqkqheLPsmS90rzzH5/M6v1J7mSieQrorXXFPHDS1nXFHt4d+QuBuZWv6aHZ3SCjW+HZ2Np9J
 HNa6g7xSC7+AVXEnrafA2Imr9W68qA++CrmrmiGK9tEuHUqOIdMBHrS0dSD5biaIe06XPIH22h
 TPU=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     "f.fainelli@gmail.com" <f.fainelli@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Strange behaviour of D-Link DUB-1312 USB 3.0 Adapters
Thread-Topic: Strange behaviour of D-Link DUB-1312 USB 3.0 Adapters
Thread-Index: AdVSeH/taFnFr9I1T4OXjPctlrQ3Eg==
Date:   Wed, 14 Aug 2019 08:17:08 +0000
Message-ID: <db0e8930ea94408ca7a38192ddfd203f@SVR-IES-MBX-03.mgc.mentorg.com>
Accept-Language: de-DE, en-IE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[Resend - had mailer errors ]

Hi Florian,

today i have seen a strange behaviour of two D-Link DUB-1312 adapters (same Revision A1).
Plugging them into the same port (!) on my device one of them is recognized as SuperSpeed, the other as high speed ???
(working on 4.14.129 LTS)

From dmesg, the "faulty" one:
[  530.585871] usb 1-2: new high-speed USB device number 4 using xhci_hcd   <<<<<<<<< HUH ????
[  530.718872] usb 1-2: New USB device found, idVendor=2001, idProduct=4a00
[  530.718880] usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[  530.718885] usb 1-2: Product: D-Link DUB-1312
[  530.718889] usb 1-2: Manufacturer: D-Link Elec. Corp.
[  530.718893] usb 1-2: SerialNumber: 000000000024B9
[  531.055104] ax88179_178a 1-2:1.0 eth0: register 'ax88179_178a' at usb-0000:00:15.0-2, D-Link DUB-1312 USB 3.0 to Gigabit Ethernet Adapter, f4:8c:eb:4b:49:4e
[ 1151.424860] usb 1-2: USB disconnect, device number 4

And here comes the "good" one:
[ 1151.425110] ax88179_178a 1-2:1.0 eth0: unregister 'ax88179_178a' usb-0000:00:15.0-2, D-Link DUB-1312 USB 3.0 to Gigabit Ethernet Adapter
[ 1157.886447] usb 2-2: new SuperSpeed USB device number 4 using xhci_hcd <<<<<<<<<<< FINE !!!!
[ 1157.905885] usb 2-2: New USB device found, idVendor=2001, idProduct=4a00
[ 1157.905893] usb 2-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[ 1157.905898] usb 2-2: Product: D-Link DUB-1312
[ 1157.905902] usb 2-2: Manufacturer: D-Link Elec. Corp.
[ 1157.905906] usb 2-2: SerialNumber: 00000000000AF2
[ 1158.246076] ax88179_178a 2-2:1.0 eth0: register 'ax88179_178a' at usb-0000:00:15.0-2, D-Link DUB-1312 USB 3.0 to Gigabit Ethernet Adapter, 40:9b:cd:73:f1:f3

As you can see, same Vendor and Product ID.
(And really: it is the same connector i plugged it in!)

I had a look at the driver code of ax88179, but that one didn't change much in the past up to v5.2.
Nothing that explains what i can see here.

What can i do to dig deeper why this happens?

Best regards
Carsten

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1C5637167E
	for <lists+linux-usb@lfdr.de>; Mon,  3 May 2021 16:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234254AbhECOQ3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 May 2021 10:16:29 -0400
Received: from smaract.com ([82.165.73.54]:47775 "EHLO smaract.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234225AbhECOQ1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 3 May 2021 10:16:27 -0400
Received: from mx1.smaract.de (leasedline-static-091-249-161-134.ewe-ip-backbone.de [91.249.161.134])
        by smaract.com (Postfix) with ESMTPSA id 5DA08A08C0;
        Mon,  3 May 2021 14:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smaract.com;
        s=default; t=1620051333;
        bh=JZPZ6g1PSKUGp2/46kbrl7+rvS82zYvVrBXhZbp0GCs=; l=3455;
        h=From:To:Subject;
        b=SyKROVCrF7QuBoWnzDXdt8A3LLQM8y/sVy3v0UldJf/j2X13B2xTHniSEzGaDTx4+
         kpyWSYExwOYn+FxoTTB5lHP7ZBM5PzHDxkJa3VxF/qVe++AOVR9AT9DpnTrSBZRWC/
         1VbyMO2aB8zpTGti1Iz0uT4Xid4+0sm7HiVjduUc=
Authentication-Results: smaract.com;
        spf=pass (sender IP is 91.249.161.134) smtp.mailfrom=vonohr@smaract.com smtp.helo=mx1.smaract.de
Received-SPF: pass (smaract.com: connection is authenticated)
From:   Sebastian von Ohr <vonohr@smaract.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Thinh Nguyen <thinhn@synopsys.com>
Subject: RE: [BUG REPORT] usb: dwc3: Timeouts with USB 2.0 LPM active
Thread-Topic: [BUG REPORT] usb: dwc3: Timeouts with USB 2.0 LPM active
Thread-Index: AddAFrAj4smXgfxIQouaD3WoM/CLQ///+CEA///Z5yA=
Date:   Mon, 3 May 2021 14:15:32 +0000
Message-ID: <3d2305a43c1f4e3dad2e29286f42982d@smaract.com>
References: <c9b5559a05f5459d92e3c704772edb46@smaract.com>
 <87eeenj56b.fsf@kernel.org>
In-Reply-To: <87eeenj56b.fsf@kernel.org>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-PPP-Message-ID: <162005133346.62724.12962940027138025662@smaract.com>
X-PPP-Vhost: mario.smaract.com
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks for your super-fast reply!

> From: Felipe Balbi [mailto:balbi@kernel.org]
> Sent: Monday, May 3, 2021 3:52 PM
> It's like the host is trying to go down to lower LPM states every 100ms:
>=20
>      irq/13-dwc3-236     [000] d..1    71.363262: dwc3_event: event (0000=
0401): WakeUp [U0]
>      irq/13-dwc3-236     [000] d..1    71.363315: dwc3_event: event (0000=
0401): WakeUp [U0]
>      irq/13-dwc3-236     [000] d..1    71.363423: dwc3_event: event (0000=
6084): ep1out: Transfer In Progress [0] (SIm)

How do you arrive at 100ms? These wakeups are around 50 microseconds apart.

> > Is the USB 2.0 LPM extension even supposed to work with the dwc3 contro=
ller? I
>=20
> yes, it should be supported :-)

I've spent some time looking at the code and I don't understand how the dev=
ice=20
is supposed to wake up the host once it's able to receive new data again. T=
he=20
closest thing I could find is the __dwc3_gadget_wakeup function which is ca=
lled=20
by dwc3_send_gadget_ep_cmd. But I don't understand the condition there. The=
=20
wakeup is only executed for DWC3_DEPCMD_STARTTRANSFER, but I understand bul=
k=20
transfers are only started once the endpoint is configured and then only=20
DWC3_DEPCMD_UPDATETRANSFER is used.

> could you share a dump of your descriptors? It could be that the wake-up
> latencies are incorrect which tricks the host into trying to go down to
> lower LPM states too frequently.

Bus 001 Device 003: ID 3386:0001 =20
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.10
  bDeviceClass            0 (Defined at Interface level)
  bDeviceSubClass         0=20
  bDeviceProtocol         0=20
  bMaxPacketSize0        64
  idVendor           0x3386=20
  idProduct          0x0001=20
  bcdDevice            5.12
  iManufacturer           1 SmarAct
  iProduct                2 SmarAct Sensor
  iSerial                 3 PSC-00000038
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength           32
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          4 SmarAct Config 1
    bmAttributes         0xc0
      Self Powered
    MaxPower                2mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0=20
      bInterfaceProtocol      0=20
      iInterface              5 SmarAct Sensor
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               1
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength           22
  bNumDeviceCaps          2
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x0000010e
      Link Power Management (LPM) Supported
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000f
      Device can operate at Low Speed (1Mbps)
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   1
      Lowest fully-functional device speed is Full Speed (12Mbps)
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat         511 micro seconds
Device Status:     0x0001
  Self Powered


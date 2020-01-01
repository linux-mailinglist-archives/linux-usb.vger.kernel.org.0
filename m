Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9C8C12E01B
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jan 2020 19:36:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727287AbgAASgM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jan 2020 13:36:12 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:43716 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727170AbgAASgM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jan 2020 13:36:12 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCB1B516;
        Wed,  1 Jan 2020 19:36:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1577903768;
        bh=chqUqwDtLunnd+wz6qvJw9UEW7Ody/Ki8uaEE0QCUI8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B/+/2Y57bPbAgqozASIw77lxaDEcLV1OetJgwp0JFg64zVpbKQ8sXpf23S3lzQXA/
         mzJkiH8u7rpAATnOjGYwOf/7sx6Dg86jhyYovZpQrcF5tPFyJeGva6J7DUi5AUonan
         Sh4sGe2XcWEzSlTzuMQ27VqXadxNQFafmf51pXjU=
Date:   Wed, 1 Jan 2020 20:35:59 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Roger Whittaker <Roger.Whittaker@suse.com>
Cc:     Takashi Iwai <tiwai@suse.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-usb@vger.kernel.org
Subject: Re: Certain cameras no longer working with uvcvideo on recent
 (openSUSE) kernels
Message-ID: <20200101183559.GA15498@pendragon.ideasonboard.com>
References: <20200101144709.GA8389@suse.com>
 <20200101172449.GF6226@pendragon.ideasonboard.com>
 <20200101175220.GA18140@suse.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline
In-Reply-To: <20200101175220.GA18140@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Roger,

(CCin'g Alan Stern and linux-usb)

On Wed, Jan 01, 2020 at 05:52:27PM +0000, Roger Whittaker wrote:
> On Wed, Jan 01, 2020 at 07:24:49PM +0200, Laurent Pinchart wrote:
> 
> > The last message is worse. Could you send me the output of lsusb -v (you
> > can restrict it to the camera with -d), if possible running as root, for
> > both the working and non-working kernels ?
> 
> Thanks very much for your reply.
> 
> The lsusb outputs are attached - they are in fact identical to each
> other.
> 
> Also attached, the dmesg lines when replugging the camera on both
> kernels.

Thank you for the information.

I had missed the following message:

[  470.351700] usb 1-1.4.3.1: config 1 interface 2 altsetting 0 endpoint 0x82 has wMaxPacketSize 0, skipping

This seems to be the culprit, and it points to the USB core. One
interface is ignored due to its wMaxPacketSize value, and the uvcvideo
driver then fails to find it.

The wMaxPacketSize check was added in

commit d482c7bb0541d19dea8bff437a9f3c5563b5b2d2
Author: Alan Stern <stern@rowland.harvard.edu>
Date:   Mon Oct 28 10:52:35 2019 -0400

    USB: Skip endpoints with 0 maxpacket length

    Endpoints with a maxpacket length of 0 are probably useless.  They
    can't transfer any data, and it's not at all unlikely that an HCD will
    crash or hang when trying to handle an URB for such an endpoint.

    Currently the USB core does not check for endpoints having a maxpacket
    value of 0.  This patch adds a check, printing a warning and skipping
    over any endpoints it catches.

    Now, the USB spec does not rule out endpoints having maxpacket = 0.
    But since they wouldn't have any practical use, there doesn't seem to
    be any good reason for us to accept them.

    Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

    Link: https://lore.kernel.org/r/Pine.LNX.4.44L0.1910281050420.1485-100000@iolanthe.rowland.org
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

The commit was merged in v5.4 and backported to v5.3.11 in
47aaab6377204cdbcd16f52a23c584f994fd0d15.

For reference for Alan and linux-usb, the issue being discussed is
described in https://bugzilla.suse.com/show_bug.cgi?id=1159811. The
above commit seems to cause a regression with several cameras. I've
attached to this e-mail the lsusb output provided by Roger.

-- 
Regards,

Laurent Pinchart

--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="lsusb-with-5.3.9-1-default"


Bus 001 Device 010: ID 1778:0214  
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x1778 
  idProduct          0x0214 
  bcdDevice            7.07
  iManufacturer           1 IPEVO Inc.
  iProduct                2 IPEVO Point 2 View
  iSerial                 0 
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0299
    bNumInterfaces          3
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 
      iInterface              0 
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.10
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength      64
         Report Descriptors: 
           ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x85  EP 5 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval              10
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         1
      bInterfaceCount         2
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0 
      iFunction               2 IPEVO Point 2 View
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0 
      iInterface              2 IPEVO Point 2 View
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.00
        wTotalLength       0x0050
        dwClockFrequency        6.000000MHz
        bInCollection           1
        baInterfaceNr( 0)       2
      VideoControl Interface Descriptor:
        bLength                18
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Camera Sensor
        bAssocTerminal          0
        iTerminal               0 
        wObjectiveFocalLengthMin      0
        wObjectiveFocalLengthMax      0
        wOcularFocalLength            0
        bControlSize                  3
        bmControls           0x000200a2
          Auto-Exposure Mode
          Focus (Absolute)
          Iris (Absolute)
          Focus, Auto
      VideoControl Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
      Warning: Descriptor too short
        bUnitID                 3
        bSourceID               1
        wMaxMultiplier          0
        bControlSize            2
        bmControls     0x0000147f
          Brightness
          Contrast
          Hue
          Saturation
          Sharpness
          Gamma
          White Balance Temperature
          Power Line Frequency
          White Balance Temperature, Auto
        iProcessing             0 
        bmVideoStandards     0x1d
          None
          PAL - 625/50
          SECAM - 625/50
          NTSC - 625/50
      VideoControl Interface Descriptor:
        bLength                29
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 4
        guidExtensionCode         {5a215226-3289-4156-894a-5c557cdf9664}
        bNumControl             4
        bNrPins                 1
        baSourceID( 0)          3
        bControlSize            4
        bmControls( 0)       0xff
        bmControls( 1)       0xff
        bmControls( 2)       0xff
        bmControls( 3)       0xff
        iExtension              0 
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             2
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               4
        iTerminal               0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval               9
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
        INTERFACE CLASS:  0f 24 01 02 ea 01 82 00 02 02 01 00 01 00 00
        INTERFACE CLASS:  1b 24 04 01 07 59 55 59 32 00 00 10 00 80 00 00 aa 00 38 9b 71 10 01 00 00 00 00
        INTERFACE CLASS:  1e 24 05 01 00 80 02 e0 01 00 00 0d 2f 00 00 0d 2f 00 60 09 00 15 16 05 00 01 15 16 05 00
        INTERFACE CLASS:  1e 24 05 02 00 40 01 f0 00 c0 00 03 4b c0 00 03 4b 00 58 02 00 15 16 05 00 01 15 16 05 00
        INTERFACE CLASS:  1e 24 05 03 00 20 03 58 02 70 00 14 99 70 00 14 99 00 a6 0e 00 9a 5b 06 00 01 9a 5b 06 00
        INTERFACE CLASS:  1e 24 05 04 00 00 04 00 03 00 00 16 80 00 00 16 80 00 00 18 00 2a 2c 0a 00 01 2a 2c 0a 00
        INTERFACE CLASS:  1e 24 05 05 00 00 05 00 04 00 00 12 c0 00 00 12 c0 00 00 28 00 d0 12 13 00 01 d0 12 13 00
        INTERFACE CLASS:  1e 24 05 06 00 40 06 b0 04 00 00 0e a6 00 00 0e a6 00 98 3a 00 a0 25 26 00 01 a0 25 26 00
        INTERFACE CLASS:  1e 24 05 01 00 80 02 e0 01 00 00 0d 2f 00 00 0d 2f 00 60 09 00 15 16 05 00 01 15 16 05 00
        INTERFACE CLASS:  0b 24 03 00 01 80 02 e0 01 01 00
        INTERFACE CLASS:  0b 24 06 02 07 00 01 00 00 00 00
        INTERFACE CLASS:  1e 24 07 01 00 80 02 e0 01 00 00 0d 2f 00 00 0d 2f 00 60 09 00 0e 64 03 00 01 0e 64 03 00
        INTERFACE CLASS:  1e 24 07 02 00 40 01 f0 00 c0 00 03 4b c0 00 03 4b 00 58 02 00 0e 64 03 00 01 0e 64 03 00
        INTERFACE CLASS:  1e 24 07 03 00 20 03 58 02 70 00 14 99 70 00 14 99 00 a6 0e 00 0e 64 03 00 01 0e 64 03 00
        INTERFACE CLASS:  1e 24 07 04 00 00 04 00 03 00 00 16 80 00 00 16 80 00 00 18 00 15 16 05 00 01 15 16 05 00
        INTERFACE CLASS:  1e 24 07 05 00 00 05 00 04 00 00 12 c0 00 00 12 c0 00 00 28 00 2a 2c 0a 00 01 2a 2c 0a 00
        INTERFACE CLASS:  1e 24 07 06 00 40 06 b0 04 00 00 0e a6 00 00 0e a6 00 98 3a 00 d0 12 13 00 01 d0 12 13 00
        INTERFACE CLASS:  1e 24 07 01 00 80 02 e0 01 00 00 0d 2f 00 00 0d 2f 00 60 09 00 0e 64 03 00 01 0e 64 03 00
        INTERFACE CLASS:  06 24 0d 00 00 00
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x13fc  3x 1020 bytes
        bInterval               1
Device Qualifier (for other device speed):
  bLength                10
  bDescriptorType         6
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  bNumConfigurations      1
Device Status:     0x0000
  (Bus Powered)

--SLDf9lqlvOQaIe6s--

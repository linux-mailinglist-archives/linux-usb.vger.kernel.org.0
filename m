Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D60C771AC6
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2019 16:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390628AbfGWOuQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jul 2019 10:50:16 -0400
Received: from muru.com ([72.249.23.125]:55714 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388341AbfGWOuQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Jul 2019 10:50:16 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 89D5C808C;
        Tue, 23 Jul 2019 14:50:39 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
        Dan Williams <dan.j.williams@intel.com>,
        Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>,
        Tony Lingren <tony@atomide.com>
Subject: [PATCH] USB: serial: option: Add Motorola modem UARTs
Date:   Tue, 23 Jul 2019 07:49:56 -0700
Message-Id: <20190723144956.55753-1-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Motorola Mapphone devices such as Droid 4 there are five USB ports
that do not use the same layout as Gobi 1K/2K/etc devices listed in
qcserial.c. So we should use qcaux.c or option.c as noted by
Dan Williams <dan.j.williams@intel.com>.

As the Motorola USB serial ports have an interrupt endpoint as shown
with lsusb -v, we should use option.c instead of qcaux.c as pointed out
by Johan Hovold <johan@kernel.org>.

The ff/ff/ff interfaces seem to always be UARTs on Motorola devices.
For the other interfaces, class 0x0a (CDC Data) should not in general
be added as they are typically part of a multi-interface function as
noted earlier by Bjørn Mork <bjorn@mork.no>.

However, looking at the Motorola mapphone kernel code, the mdm6600 0x0a
class is only used for flashing the modem firmware, and there are no
other interfaces. So I've added that too with more details below as it
works just fine.

The ttyUSB ports on Droid 4 are:

ttyUSB0 DIAG, CQDM-capable
ttyUSB1 MUX or NMEA, no response
ttyUSB2 MUX or NMEA, no response
ttyUSB3 TCMD
ttyUSB4 AT-capable

The ttyUSB0 is detected as QCDM capable by ModemManager. I think
it's only used for debugging with ModemManager --debug for sending
custom AT commands though. ModemManager already can manage data
connection using the USB QMI ports that are already handled by the
qmi_wwan.c driver.

To enable the MUX or NMEA ports, it seems that something needs to be
done additionally to enable them, maybe via the DIAG or TCMD port.
It might be just a NVRAM setting somewhere, but I have no idea what
NVRAM settings may need changing for that.

The TCMD port seems to be a Motorola custom protocol for testing
the modem and to configure it's NVRAM and seems to work just fine
based on a quick test with a minimal tcmdrw tool I wrote.

The voice modem AT-capable port seems to provide only partial
support, and no PM support compared to the TS 27.010 based UART
wired directly to the modem.

The UARTs added with this change are the same product IDs as the
Motorola Mapphone Android Linux kernel mdm6600_id_table. I don't
have any mdm9600 based devices, so I have only tested these on
mdm6600 based droid 4.

Then for the class 0x0a (CDC Data) mode, the Motorola Mapphone Android
Linux kernel driver moto_flashqsc.c just seems to change the
port->bulk_out_size to 8K from the default. And is only used for
flashing the modem firmware it seems.

I've verified that flashing the modem with signed firmware works just
fine with the option driver after manually toggling the GPIO pins, so
I've added droid 4 modem flashing mode to the option driver. I've not
added the other devices listed in moto_flashqsc.c in case they really
need different port->bulk_out_size. Those can be added as they get
tested to work for flashing the modem.

After this patch the output of /sys/kernel/debug/usb/devices has
the following for normal 22b8:2a70 mode including the related qmi_wwan
interfaces:

T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=12   MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=22b8 ProdID=2a70 Rev= 0.00
S:  Manufacturer=Motorola, Incorporated
S:  Product=Flash MZ600
C:* #Ifs= 9 Cfg#= 1 Atr=e0 MxPwr=500mA
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
E:  Ad=81(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
E:  Ad=01(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
E:  Ad=82(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
E:  Ad=83(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
E:  Ad=03(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
E:  Ad=84(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
E:  Ad=04(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
E:  Ad=85(I) Atr=03(Int.) MxPS=  64 Ivl=5ms
E:  Ad=86(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
E:  Ad=05(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
I:* If#= 5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=fb Prot=ff Driver=qmi_wwan
E:  Ad=87(I) Atr=03(Int.) MxPS=  64 Ivl=5ms
E:  Ad=88(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
E:  Ad=06(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
I:* If#= 6 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=fb Prot=ff Driver=qmi_wwan
E:  Ad=89(I) Atr=03(Int.) MxPS=  64 Ivl=5ms
E:  Ad=8a(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
E:  Ad=07(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
I:* If#= 7 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=fb Prot=ff Driver=qmi_wwan
E:  Ad=8b(I) Atr=03(Int.) MxPS=  64 Ivl=5ms
E:  Ad=8c(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
E:  Ad=08(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
I:* If#= 8 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=fb Prot=ff Driver=qmi_wwan
E:  Ad=8d(I) Atr=03(Int.) MxPS=  64 Ivl=5ms
E:  Ad=8e(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
E:  Ad=09(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms

In 22b8:900e "qc_dload" mode the device shows up as:

T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=12   MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=22b8 ProdID=900e Rev= 0.00
S:  Manufacturer=Motorola, Incorporated
S:  Product=Flash MZ600
C:* #Ifs= 1 Cfg#= 1 Atr=e0 MxPwr=500mA
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
E:  Ad=81(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
E:  Ad=01(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms

And in 22b8:4281 "ram_downloader" mode the device shows up as:

T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=12   MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=22b8 ProdID=4281 Rev= 0.00
S:  Manufacturer=Motorola, Incorporated
S:  Product=Flash MZ600
C:* #Ifs= 1 Cfg#= 1 Atr=e0 MxPwr=500mA
I:* If#= 0 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=fc Driver=option
E:  Ad=81(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
E:  Ad=01(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms

Cc: Bjørn Mork <bjorn@mork.no>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Marcel Partap <mpartap@gmx.net>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Michael Scott <hashcode0f@gmail.com>
Cc: NeKit <nekit1000@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Tested-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Tony Lingren <tony@atomide.com>
---
 drivers/usb/serial/option.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -83,6 +83,12 @@ static void option_instat_callback(struct urb *urb);
 #define HUAWEI_PRODUCT_K4605			0x14C6
 #define HUAWEI_PRODUCT_E173S6			0x1C07
 
+#define MOTOROLA_VENDOR_ID			0x22b8
+#define MOTOROLA_PRODUCT_MDM6600		0x2a70
+#define MOTOROLA_PRODUCT_MDM9600		0x2e0a
+#define MOTOROLA_PRODUCT_MDM_RAM_DL		0x4281
+#define MOTOROLA_PRODUCT_MDM_QC_DL		0x900e
+
 #define QUANTA_VENDOR_ID			0x0408
 #define QUANTA_PRODUCT_Q101			0xEA02
 #define QUANTA_PRODUCT_Q111			0xEA03
@@ -968,6 +974,10 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x7B) },
 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x7C) },
 
+	{ USB_DEVICE_AND_INTERFACE_INFO(MOTOROLA_VENDOR_ID, MOTOROLA_PRODUCT_MDM6600, 0xff, 0xff, 0xff) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(MOTOROLA_VENDOR_ID, MOTOROLA_PRODUCT_MDM9600, 0xff, 0xff, 0xff) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(MOTOROLA_VENDOR_ID, MOTOROLA_PRODUCT_MDM_RAM_DL, 0x0a, 0x00, 0xfc) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(MOTOROLA_VENDOR_ID, MOTOROLA_PRODUCT_MDM_QC_DL, 0xff, 0xff, 0xff) },
 
 	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_V640) },
 	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_V620) },
-- 
2.21.0

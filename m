Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 820A96EF76
	for <lists+linux-usb@lfdr.de>; Sat, 20 Jul 2019 15:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbfGTNX1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 20 Jul 2019 09:23:27 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.215]:56417 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725834AbfGTNX1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 20 Jul 2019 09:23:27 -0400
Received: from [67.219.246.196] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-c.us-east-1.aws.symcld.net id 12/F0-11074-DC5133D5; Sat, 20 Jul 2019 13:23:25 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsUyLfyHiO5ZUeN
  Yg7mHWC0WLWtldmD0+LxJLoAxijUzLym/IoE1Y8bqPuaCHv6Kv2sqGhj/8XQxcnEICcxllNjb
  u5IFwvnNKLF071Mgh5NDWMBZYsf1iUxdjBwcbAJmEpv/SoKERQTUJdb9n8gOYjMLWEusaXwDZ
  jMJKElsPrCUDcRmEVCVmPNlHyNIK69AvETvG2OQMKeArcStw7PAyoUEbCTmL78OtklUQE5i5e
  UWVhCbV0BQ4uTMJywgrcwCmhLrd+lDbJKX2P52DjNEq5bEprlbwMZICARLzD7wl3UCo+AsJN2
  zELpnIelewMi8itEsqSgzPaMkNzEzR9fQwEDX0NBI10zXyMhcL7FKN1mvtFg3NbG4RNdQL7G8
  WK+4Mjc5J0UvL7VkEyMwkFMK2B7vYHw1843eIUZJDiYlUd4IV6NYIb6k/JTKjMTijPii0pzU4
  kOMMhwcShK8icDYEBIsSk1PrUjLzAFGFUxagoNHSYT3jQhQmre4IDG3ODMdInWKUZdjwdYli5
  iFWPLy81KlxHmNQYoEQIoySvPgRsAi/BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd5LIFN
  4MvNK4Da9AjqCCeiIx3pGIEeUJCKkpBqY1q8tF/x0+HvbhZzfTze1R4R1W0RJL8+Jy9ZLebPp
  VuSeI21a/93E/j9pDyqasPBb2ItbPBv+3fXS+8meo7oycPVf38t5+zWynglu567o4v/+eY+E/
  1IVv31t/FOu9j2YPYsnLotB8ODG+3OyPJ89u2zy0nOvilexrtQrv+tTTnOc5VWx36l7OKCG73
  Yd/xvNX0urf/JOkOS2NxN3bN98dmszw221tzeZj3S9ex/CZc/RO7ckzWnPSTFjt6I3mbXyP24
  mNbJ0frF3uLymWX52umropJddrX5tB4Ov/RMVz9rnwvBe9/us7tNlWyz/7nlp+P1onUbfjZrL
  v5LuzuF567OhaOuFA9t3V78K+eb/W4mlOCPRUIu5qDgRAK83KexrAwAA
X-Env-Sender: yokamoto@allied-telesis.co.jp
X-Msg-Ref: server-44.tower-404.messagelabs.com!1563629004!211269!1
X-Originating-IP: [150.87.248.20]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1358 invoked from network); 20 Jul 2019 13:23:24 -0000
Received: from abricot-inet.allied-telesis.co.jp (HELO TKY-DS01.at.lc) (150.87.248.20)
  by server-44.tower-404.messagelabs.com with SMTP; 20 Jul 2019 13:23:24 -0000
Received: from swim-manx.rd.allied-telesis.co.jp ([150.87.21.50]) by TKY-DS01.at.lc with Microsoft SMTPSVC(8.0.9200.16384);
         Sat, 20 Jul 2019 22:23:23 +0900
Received: from yokamoto-pc.rd.allied-telesis.co.jp by swim-manx.rd.allied-telesis.co.jp
 (AlliedTelesis SMTPRS 1.3 pl 1 ++E6B86F8C687C6288D9B5559052954DC9) with ESMTP id <B0004502046@swim-manx.rd.allied-telesis.co.jp>;
 Sat, 20 Jul 2019 22:23:22 +0900
Subject: [PATCH v3] USB: serial: option: Add support for ZTE MF871A
From:   Yoshiaki Okamoto <yokamoto@allied-telesis.co.jp>
To:     larsm17@gmail.com, johan@kernel.org
Cc:     hyamamo@allied-telesis.co.jp, linux-usb@vger.kernel.org
Date:   Sat, 20 Jul 2019 22:23:18 +0900
Message-ID: <156362896395.30109.15607667410549474761.stgit@yokamoto-pc.rd.allied-telesis.co.jp>
In-Reply-To: <1dde5abb-2399-6bb7-531b-c88e5f0b4fae@gmail.com>
References: <1dde5abb-2399-6bb7-531b-c88e5f0b4fae@gmail.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 20 Jul 2019 13:23:23.0862 (UTC) FILETIME=[4E99DF60:01D53EFE]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds support for MF871A USB modem (aka Speed USB STICK U03)
to option driver. This modem is manufactured by ZTE corporation, and
sold by KDDI.

Interface layout:
0: AT
1: MODEM

usb-devices output:
T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  9 Spd=480 MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=19d2 ProdID=1481 Rev=52.87
S:  Manufacturer=ZTE,Incorporated
S:  Product=ZTE Technologies MSM
S:  SerialNumber=1234567890ABCDEF
C:  #Ifs= 2 Cfg#= 1 Atr=80 MxPwr=500mA
I:  If#= 0 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
I:  If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option

Co-developed-by: Hiroyuki Yamamoto <hyamamo@allied-telesis.co.jp>
Signed-off-by: Hiroyuki Yamamoto <hyamamo@allied-telesis.co.jp>
Signed-off-by: Yoshiaki Okamoto <yokamoto@allied-telesis.co.jp>
---

Changes in v3:
- Change used macro to USB_DEVICE_AND_INTERFACE_INFO.

Changes in v2:
- Add Co-developed-by tag.
- Move away product-id define and add short comment after the entry.

 drivers/usb/serial/option.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index a0aaf0635359..071e62164478 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1548,6 +1548,7 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1428, 0xff, 0xff, 0xff),  /* Telewell TW-LTE 4G v2 */
 	  .driver_info = RSVD(2) },
 	{ USB_DEVICE_INTERFACE_CLASS(ZTE_VENDOR_ID, 0x1476, 0xff) },	/* GosunCn ZTE WeLink ME3630 (ECM/NCM mode) */
+	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1481, 0xff, 0x00, 0x00) }, /* ZTE MF871A */
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1533, 0xff, 0xff, 0xff) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1534, 0xff, 0xff, 0xff) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1535, 0xff, 0xff, 0xff) },


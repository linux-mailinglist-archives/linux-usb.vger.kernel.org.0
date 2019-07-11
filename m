Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B68F65219
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jul 2019 08:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbfGKGx3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Jul 2019 02:53:29 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.208]:45620 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728124AbfGKGx2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Jul 2019 02:53:28 -0400
Received: from [67.219.251.52] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-c.us-west-2.aws.symcld.net id 00/A1-15262-6ECD62D5; Thu, 11 Jul 2019 06:53:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRWlGSWpSXmKPExsUyLfyHiO7TO2q
  xBoe3GVssWtbK7MDo8XmTXABjFGtmXlJ+RQJrxvaTb9kKbvBXHDrSxNTAeJC3i5GLQ0hgLqPE
  k18d7BDOb0aJlQ/eATmcHMICDhJzdrcD2RwcbAJmEpv/SoKERQREJF6ee8gMYjMLWEusaXwDV
  s4koCSx+cBSNhCbRUBVYsPVqWwgrbwCcRK3N7qAhEUF5CRWXm5hBbF5BQQlTs58wgJSwiygKb
  F+lz7ERHmJ7W/ngE0XEtCS2DR3C9h0CYFgiaW3ZzBOYOSfhaR7FkL3LCTdCxiZVzFaJBVlpme
  U5CZm5ugaGhjoGhoa6RoaW+oaGpnpJVbpJuuVFuuWpxaX6BrpJZYX6xVX5ibnpOjlpZZsYgSG
  Z0pBd90OxsWz3ugdYpTkYFIS5ZU9qRYrxJeUn1KZkVicEV9UmpNafIhRhoNDSYJX7iZQTrAoN
  T21Ii0zBxgrMGkJDh4lEV43kDRvcUFibnFmOkTqFKOilDgv3y2ghABIIqM0D64NFp+XGGWlhH
  kZGRgYhHgKUotyM0tQ5V8xinMwKgnzloCM58nMK4Gb/gpoMRPQYlU/sMUliQgpqQamLdf/SN5
  7d2/F2eb8P2WvWAymLbjccX6pf/el5xp/9x4ODs3pedTXevyrS5OyjdJpKR/Hp7IBRXf7kmZv
  C5x+rdj93MZbv3y+y/5p2nFUvXX2xsnGzg+9elWZz/4O0ngZmWVxcFFSKwcrT0PMgprFwHS3c
  K7eUX/VQxIimV4nfq/9Z7m81loid8asEyy8AZe+Tdq4adGL0BfzHrm+PfT4Te6sZx+MX7yd8Z
  rjUVpF0VPOzD2L77/aO3W3zP8Lq3aKuf7vM/lasM//zA5vlzbZXpsdF4VzVz/8ciOj9ewt9up
  6jfWGEmzPb3fsiTy08+uO+WfvSrZMLGMufZt61sI61D/fvPXu4ZvH3ssEPal0e6LEUpyRaKjF
  XFScCADzy9+kSgMAAA==
X-Env-Sender: yokamoto@allied-telesis.co.jp
X-Msg-Ref: server-22.tower-364.messagelabs.com!1562828004!1467984!1
X-Originating-IP: [150.87.248.20]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23084 invoked from network); 11 Jul 2019 06:53:25 -0000
Received: from abricot-inet.allied-telesis.co.jp (HELO TKY-DS01.at.lc) (150.87.248.20)
  by server-22.tower-364.messagelabs.com with SMTP; 11 Jul 2019 06:53:25 -0000
Received: from swim-manx.rd.allied-telesis.co.jp ([150.87.21.50]) by TKY-DS01.at.lc with Microsoft SMTPSVC(8.0.9200.16384);
         Thu, 11 Jul 2019 15:53:24 +0900
Received: from yokamoto-pc.rd.allied-telesis.co.jp by swim-manx.rd.allied-telesis.co.jp
 (AlliedTelesis SMTPRS 1.3 pl 1 ++E6B86F8C687C6288D9B5559052954DC9) with ESMTP id <B0004497151@swim-manx.rd.allied-telesis.co.jp>;
 Thu, 11 Jul 2019 15:53:22 +0900
Subject: [PATCH] USB: serial: option: Add support for ZTE MF871A
From:   Yoshiaki Okamoto <yokamoto@allied-telesis.co.jp>
To:     johan@kernel.org
Cc:     hyamamo@allied-telesis.co.jp, linux-usb@vger.kernel.org
Date:   Thu, 11 Jul 2019 15:53:24 +0900
Message-ID: <156282800460.29653.5486306531486471871.stgit@yokamoto-pc.rd.allied-telesis.co.jp>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 11 Jul 2019 06:53:24.0571 (UTC) FILETIME=[55D1AAB0:01D537B5]
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

Signed-off-by: Yoshiaki Okamoto <yokamoto@allied-telesis.co.jp>
Signed-off-by: Hiroyuki Yamamoto <hyamamo@allied-telesis.co.jp>
---
 drivers/usb/serial/option.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index a0aaf0635359..e11ae2092229 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -308,6 +308,7 @@ static void option_instat_callback(struct urb *urb);
 #define ZTE_PRODUCT_ME3620_MBIM			0x0426
 #define ZTE_PRODUCT_ME3620_X			0x1432
 #define ZTE_PRODUCT_ME3620_L			0x1433
+#define ZTE_PRODUCT_MF871A			0x1481
 #define ZTE_PRODUCT_AC2726			0xfff1
 #define ZTE_PRODUCT_MG880			0xfffd
 #define ZTE_PRODUCT_CDMA_TECH			0xfffe
@@ -1548,6 +1549,7 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1428, 0xff, 0xff, 0xff),  /* Telewell TW-LTE 4G v2 */
 	  .driver_info = RSVD(2) },
 	{ USB_DEVICE_INTERFACE_CLASS(ZTE_VENDOR_ID, 0x1476, 0xff) },	/* GosunCn ZTE WeLink ME3630 (ECM/NCM mode) */
+	{ USB_DEVICE_INTERFACE_CLASS(ZTE_VENDOR_ID, ZTE_PRODUCT_MF871A, 0xff) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1533, 0xff, 0xff, 0xff) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1534, 0xff, 0xff, 0xff) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1535, 0xff, 0xff, 0xff) },


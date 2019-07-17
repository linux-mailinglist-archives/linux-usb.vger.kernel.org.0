Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93C696B60C
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2019 07:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbfGQFkZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Jul 2019 01:40:25 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.213]:53787 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725799AbfGQFkZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Jul 2019 01:40:25 -0400
Received: from [67.219.246.196] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-c.us-east-1.aws.symcld.net id C2/E3-10285-7C4BE2D5; Wed, 17 Jul 2019 05:40:23 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsUyLfyHiO6xLXq
  xBm/vGlksWtbK7MDo8XmTXABjFGtmXlJ+RQJrxurLS9gLtvNVzD2yir2BcStPFyMXh5DAXEaJ
  1g/r2SCc34wS8z8uY+5i5OQQFnCWOPb3IZDNwcEmYCax+a8kSFhEQETi5bmHYCXMAtYSaxrfs
  IPYTAJKEpsPLGUDsVkEVCVath0Ds3kF4iTO3ZoFVs8poCcx/e4iMFtIQFdi0oRPTCC2qICcxM
  rLLawQ9YISJ2c+YQFZyyygKbF+lz7EKnmJ7W/nQLVqSWyauwVsrYRAsMTjB3PZJzAKzkLSPQu
  hexaS7gWMzKsYzZKKMtMzSnITM3N0DQ0MdA0NjXTNdI2MzPUSq3ST9UqLdVMTi0t0DfUSy4v1
  iitzk3NS9PJSSzYxAoM5pYDt8Q7GVzPf6B1ilORgUhLlvc+uFyvEl5SfUpmRWJwRX1Sak1p8i
  FGGg0NJgrdhM1BOsCg1PbUiLTMHGFkwaQkOHiUR3rubgNK8xQWJucWZ6RCpU4yKUuK8iiB9Ai
  CJjNI8uDZYNF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMy7AmQKT2ZeCdz0V0CLmYAWT7E
  EW1ySiJCSamDa5KJzSiPtPnuqi979m28dsgS6bLpeuJ3mnVKg9H9qXduLRf/rSt0Ltpv9L/YL
  vmkjXxfl6fn+z7mva+7lKB6xbjhV6rNz+6Yj4Z1/YvfaqQe0Jly3fX101Z+cmIynq4ULz1sGv
  us4yjhrZynb1TLeQIMZv11MbwV8ymV2i5QInjBlL1/z4Z/HJn9wbu66dvdT+Db1ELsXqcc+Vy
  vz1VT8//PukKJTzstFu97WvYvaxuK2X/pKeP9cm33udyTMxJk8tSZP3cXxfLP8WtXzS/vuS2s
  G95yNYZlYdSLgZd/m80WHZmntn9A4bZGVCF96uP+cD5tjz8hPzPh37/727uSA4gl8J7fc/LqI
  w4/58PHJSizFGYmGWsxFxYkA8hJsBmEDAAA=
X-Env-Sender: yokamoto@allied-telesis.co.jp
X-Msg-Ref: server-9.tower-404.messagelabs.com!1563342021!92595!1
X-Originating-IP: [150.87.248.20]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27278 invoked from network); 17 Jul 2019 05:40:22 -0000
Received: from abricot-inet.allied-telesis.co.jp (HELO TKY-DS01.at.lc) (150.87.248.20)
  by server-9.tower-404.messagelabs.com with SMTP; 17 Jul 2019 05:40:22 -0000
Received: from swim-manx.rd.allied-telesis.co.jp ([150.87.21.50]) by TKY-DS01.at.lc with Microsoft SMTPSVC(8.0.9200.16384);
         Wed, 17 Jul 2019 14:40:21 +0900
Received: from yokamoto-pc.rd.allied-telesis.co.jp by swim-manx.rd.allied-telesis.co.jp
 (AlliedTelesis SMTPRS 1.3 pl 1 ++E6B86F8C687C6288D9B5559052954DC9) with ESMTP id <B0004499500@swim-manx.rd.allied-telesis.co.jp>;
 Wed, 17 Jul 2019 14:40:21 +0900
Subject: [PATCH v2] USB: serial: option: Add support for ZTE MF871A
From:   Yoshiaki Okamoto <yokamoto@allied-telesis.co.jp>
To:     johan@kernel.org
Cc:     hyamamo@allied-telesis.co.jp, linux-usb@vger.kernel.org
Date:   Wed, 17 Jul 2019 14:40:16 +0900
Message-ID: <156334196350.13827.8927178214233271211.stgit@yokamoto-pc.rd.allied-telesis.co.jp>
In-Reply-To: <20190716090553.GA3522@localhost>
References: <20190716090553.GA3522@localhost>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 17 Jul 2019 05:40:21.0545 (UTC) FILETIME=[1FCF7990:01D53C62]
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

Changes in v2:
- Add Co-developed-by tag.
- Move away product-id define and add short comment after the entry.

 drivers/usb/serial/option.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index a0aaf0635359..3188b3cb0f21 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1548,6 +1548,7 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1428, 0xff, 0xff, 0xff),  /* Telewell TW-LTE 4G v2 */
 	  .driver_info = RSVD(2) },
 	{ USB_DEVICE_INTERFACE_CLASS(ZTE_VENDOR_ID, 0x1476, 0xff) },	/* GosunCn ZTE WeLink ME3630 (ECM/NCM mode) */
+	{ USB_DEVICE_INTERFACE_CLASS(ZTE_VENDOR_ID, 0x1481, 0xff) },	/* ZTE MF871A */
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1533, 0xff, 0xff, 0xff) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1534, 0xff, 0xff, 0xff) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1535, 0xff, 0xff, 0xff) },


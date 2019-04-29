Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB77E655
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 17:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728573AbfD2P0T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 11:26:19 -0400
Received: from gateway36.websitewelcome.com ([192.185.188.18]:37153 "EHLO
        gateway36.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728214AbfD2P0T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 11:26:19 -0400
X-Greylist: delayed 1500 seconds by postgrey-1.27 at vger.kernel.org; Mon, 29 Apr 2019 11:26:18 EDT
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
        by gateway36.websitewelcome.com (Postfix) with ESMTP id DB194400C4DD9
        for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2019 08:58:40 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id L7RohzrtrdnCeL7RohkLp1; Mon, 29 Apr 2019 09:40:00 -0500
X-Authority-Reason: nr=8
Received: from [189.250.54.97] (port=50000 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.91)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hL7Rm-000tKB-Vr; Mon, 29 Apr 2019 09:39:59 -0500
Date:   Mon, 29 Apr 2019 09:39:57 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kees Cook <keescook@chromium.org>
Subject: [PATCH] usbip: vhci_hcd: Mark expected switch fall-through
Message-ID: <20190429143957.GA6725@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.54.97
X-Source-L: No
X-Exim-ID: 1hL7Rm-000tKB-Vr
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.54.97]:50000
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 5
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In preparation to enabling -Wimplicit-fallthrough, mark switch
cases where we are expecting to fall through.

This patch fixes the following warning:

In file included from drivers/usb/usbip/vhci_hcd.c:15:
drivers/usb/usbip/vhci_hcd.c: In function ‘vhci_hub_control’:
drivers/usb/usbip/usbip_common.h:63:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
   if (flag & usbip_debug_flag)  \
      ^
drivers/usb/usbip/usbip_common.h:77:2: note: in expansion of macro ‘usbip_dbg_with_flag’
  usbip_dbg_with_flag(usbip_debug_vhci_rh, fmt , ##args)
  ^~~~~~~~~~~~~~~~~~~
drivers/usb/usbip/vhci_hcd.c:509:4: note: in expansion of macro ‘usbip_dbg_vhci_rh’
    usbip_dbg_vhci_rh(
    ^~~~~~~~~~~~~~~~~
drivers/usb/usbip/vhci_hcd.c:511:3: note: here
   case USB_PORT_FEAT_U2_TIMEOUT:
   ^~~~

Warning level 3 was used: -Wimplicit-fallthrough=3

This patch is part of the ongoing efforts to enable
-Wimplicit-fallthrough.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/usb/usbip/vhci_hcd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 667d9c0ec905..000ab7225717 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -508,6 +508,7 @@ static int vhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		case USB_PORT_FEAT_U1_TIMEOUT:
 			usbip_dbg_vhci_rh(
 				" SetPortFeature: USB_PORT_FEAT_U1_TIMEOUT\n");
+			/* Fall through */
 		case USB_PORT_FEAT_U2_TIMEOUT:
 			usbip_dbg_vhci_rh(
 				" SetPortFeature: USB_PORT_FEAT_U2_TIMEOUT\n");
-- 
2.21.0


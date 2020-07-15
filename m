Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC4F2201BB
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 03:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728006AbgGOBXO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 21:23:14 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:39175 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbgGOBXO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jul 2020 21:23:14 -0400
Received: from cwh (fob.gandi.net [217.70.181.1])
        (Authenticated sender: wxcafe@wxcafe.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 3C3A220004;
        Wed, 15 Jul 2020 01:23:11 +0000 (UTC)
Message-ID: <8ac19ec98239400a1e4870f7e322b8904673a137.camel@wxcafe.net>
Subject: [PATCH 1/4] cdc_ether: use dev->intf to get interface information
From:   =?ISO-8859-1?Q?Wxcaf=E9?= <wxcafe@wxcafe.net>
To:     linux-usb@vger.kernel.org
Cc:     Miguel =?ISO-8859-1?Q?Rodr=EDguez_P=E9rez?= 
        <miguel@det.uvigo.gal>, oliver@neukum.org, netdev@vger.kernel.org
Date:   Tue, 14 Jul 2020 21:23:07 -0400
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usbnet_cdc_update_filter was getting the interface number from the
usb_interface struct in cdc_state->control. However, cdc_ncm does
not initialize that structure in its bind function, but uses
cdc_ncm_cts instead. Getting intf directly from struct usbnet solves
the problem.

Signed-off-by: Miguel Rodríguez Pérez <miguel@det.uvigo.gal>
---
 drivers/net/usb/cdc_ether.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/usb/cdc_ether.c b/drivers/net/usb/cdc_ether.c
index a657943c9f01..2afe258e3648 100644
--- a/drivers/net/usb/cdc_ether.c
+++ b/drivers/net/usb/cdc_ether.c
@@ -65,8 +65,6 @@ static const u8 mbm_guid[16] = {
 
 static void usbnet_cdc_update_filter(struct usbnet *dev)
 {
-	struct cdc_state	*info = (void *) &dev->data;
-	struct usb_interface	*intf = info->control;
 	struct net_device	*net = dev->net;
 
 	u16 cdc_filter = USB_CDC_PACKET_TYPE_DIRECTED
@@ -86,7 +84,7 @@ static void usbnet_cdc_update_filter(struct usbnet *dev)
 			USB_CDC_SET_ETHERNET_PACKET_FILTER,
 			USB_TYPE_CLASS | USB_RECIP_INTERFACE,
 			cdc_filter,
-			intf->cur_altsetting->desc.bInterfaceNumber,
+			dev->intf->cur_altsetting->desc.bInterfaceNumber,
 			NULL,
 			0,
 			USB_CTRL_SET_TIMEOUT
-- 
2.27.0


-- 
Wxcafé <wxcafe@wxcafe.net>


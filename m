Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 674396AF96
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jul 2019 21:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728575AbfGPTMG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jul 2019 15:12:06 -0400
Received: from lisa.dawes.za.net ([178.63.77.189]:51432 "EHLO
        lisa.dawes.za.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728137AbfGPTMG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Jul 2019 15:12:06 -0400
Received: by lisa.dawes.za.net (Postfix, from userid 1000)
        id 2318B14054E; Tue, 16 Jul 2019 21:12:05 +0200 (SAST)
Date:   Tue, 16 Jul 2019 21:12:05 +0200
From:   Rogan Dawes <rogan@dawes.za.net>
To:     linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>, Lars Melin <larsm17@gmail.com>,
        Dan Williams <dcbw@redhat.com>
Subject: [PATCH v5] USB: serial/qmi_wwan: add D-Link DWM-222 device ID
Message-ID: <20190716191205.GA27426@lisa.dawes.za.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190716190210.GA27056@lisa.dawes.za.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add device id for D-Link DWM-222.

Cc: stable@vger.kernel.org
---
Also add the qmi_wwan entry, since it was blacklisted already in option

Apologies for the spam!

 drivers/net/usb/qmi_wwan.c  | 1 +
 drivers/usb/serial/option.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
index 8b4ad10cf940..69e0a2acfcb0 100644
--- a/drivers/net/usb/qmi_wwan.c
+++ b/drivers/net/usb/qmi_wwan.c
@@ -1292,6 +1292,7 @@ static const struct usb_device_id products[] = {
 	{QMI_FIXED_INTF(0x2001, 0x7e16, 3)},	/* D-Link DWM-221 */
 	{QMI_FIXED_INTF(0x2001, 0x7e19, 4)},	/* D-Link DWM-221 B1 */
 	{QMI_FIXED_INTF(0x2001, 0x7e35, 4)},	/* D-Link DWM-222 */
+	{QMI_FIXED_INTF(0x2001, 0x7e3d, 4)},	/* D-Link DWM-222 A2 */
 	{QMI_FIXED_INTF(0x2020, 0x2031, 4)},	/* Olicard 600 */
 	{QMI_FIXED_INTF(0x2020, 0x2033, 4)},	/* BroadMobi BM806U */
 	{QMI_FIXED_INTF(0x0f3d, 0x68a2, 8)},    /* Sierra Wireless MC7700 */
diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index a0aaf0635359..db6f76bbb471 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1951,6 +1951,8 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = RSVD(4) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x2001, 0x7e35, 0xff),			/* D-Link DWM-222 */
 	  .driver_info = RSVD(4) },
+	{ USB_DEVICE_INTERFACE_CLASS(0x2001, 0x7e3d, 0xff),			/* D-Link DWM-222 A2 */
+	  .driver_info = RSVD(0) | RSVD(4) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x07d1, 0x3e01, 0xff, 0xff, 0xff) },	/* D-Link DWM-152/C1 */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x07d1, 0x3e02, 0xff, 0xff, 0xff) },	/* D-Link DWM-156/C1 */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x07d1, 0x7e11, 0xff, 0xff, 0xff) },	/* D-Link DWM-156/A3 */
-- 
2.17.1


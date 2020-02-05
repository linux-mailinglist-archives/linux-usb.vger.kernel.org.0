Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 664E2152A14
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2020 12:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbgBELmM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Feb 2020 06:42:12 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:54762 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbgBELmM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Feb 2020 06:42:12 -0500
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1izIpQ-0003XC-TM; Wed, 05 Feb 2020 11:26:45 +0000
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
To:     mathias.nyman@intel.com, gregkh@linuxfoundation.org,
        stern@rowland.harvard.edu
Cc:     acelan.kao@canonical.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: [RESEND] [PATCH v2 3/3] USB: Disable LPM on WD19's Realtek Hub
Date:   Wed,  5 Feb 2020 19:26:33 +0800
Message-Id: <20200205112633.25995-3-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200205112633.25995-1-kai.heng.feng@canonical.com>
References: <20200205112633.25995-1-kai.heng.feng@canonical.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Realtek Hub (0bda:0x0487) used in Dell Dock WD19 sometimes drops off the
bus when bringing underlying ports from U3 to U0.

Disabling LPM on the hub during setting link state is not enough, so
let's disable LPM completely for this hub.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v2:
 - Use quirk instead of the original approach.

 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 6b6413073584..2fb7c1602280 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -371,6 +371,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	{ USB_DEVICE(0x0b05, 0x17e0), .driver_info =
 			USB_QUIRK_IGNORE_REMOTE_WAKEUP },
 
+	/* Realtek hub in Dell WD19 (Type-C) */
+	{ USB_DEVICE(0x0bda, 0x0487), .driver_info = USB_QUIRK_NO_LPM },
+
 	/* Action Semiconductor flash disk */
 	{ USB_DEVICE(0x10d6, 0x2200), .driver_info =
 			USB_QUIRK_STRING_FETCH_255 },
-- 
2.17.1


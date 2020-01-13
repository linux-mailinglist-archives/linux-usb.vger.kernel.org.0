Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1ECE41398C0
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2020 19:20:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727726AbgAMSUW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jan 2020 13:20:22 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42900 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbgAMSUV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jan 2020 13:20:21 -0500
Received: by mail-pg1-f196.google.com with SMTP id s64so5077792pgb.9
        for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2020 10:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fizzyade-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=dJVe3+GplXqRu4OFYY3SgtYa4JByZSCWQlyjqMqurEs=;
        b=muoHG8wsaS9nD6wiM7TkaH33L+GKJbw/vES81kyo+K5JdA9uN8uqqLVbv+6cSn+AV2
         ynq53nRC1VCkOeDKgo58I4IERTYFE/bA6Uyh7/oqjfqfJlc+2iVtyaGNjOECg7CR0Pia
         BWyLewCJAP7nUrLfUs6BZn7IgC+LnmivKs4IAMU4DP7lyfMVTFO8luF+YPXlKZuYEJ9Z
         91mSxkRJJrkrhwZOisWDmKTrU0j04pv56r+cnURcgpkQZgosM7VciXo+xIg56mA45mou
         OXnjO5spFL3TQojHAeyHmsZ1nf1GP94TXHFSss6GITTyeMXbeWbc1Vr5IQgp05X+mWr5
         9paQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=dJVe3+GplXqRu4OFYY3SgtYa4JByZSCWQlyjqMqurEs=;
        b=qAWhPT1pt7Gd4ILgFwDhAU81NV7U4BkpNj0hWu+6H32beYLZaCXk0c1IKDw408G8uI
         yQR+0+RFXAko54UOajMrrPuzJNJG39lKioKuGBkTWVLQ+ncXzzBtaConXsvdBCR5JfTx
         FRS6jlFvSGk7nmi1WRbkLkxMfRQlXv2u/UfSB4X01FLMnUxJEyM5vKATBgxnbhR44iXE
         2paJ0kTDf2Z9HGSJzYXzOCyUFvih0YoeRmzJBzxxyW9BeeBbY2R2gqx2gpea1b1baP1u
         EMac5EORQYQGOT3a5+R1SnZuNSroDpVcrskijzB7i4ZKQnUkByc8vVr4MjvM3nwi5iXF
         OBdg==
X-Gm-Message-State: APjAAAVj9v3uoeMXfuXN11Uk0EZU4d+F34qC0nKj5f31HATZQi1eQ3lO
        /B7osifJgPPBK1+qIxdwetjiVezd8i4JikqxuMNLq/BaH3734Q==
X-Google-Smtp-Source: APXvYqyB55QftrvssTkyIjEl3FuU6UwbRVCHrLUwX02mzNniFT8HB4qFQyIGgqry/zEC//0ZKbqdFtCMOHsngoyV/RQ=
X-Received: by 2002:a62:1a16:: with SMTP id a22mr20825345pfa.34.1578939620725;
 Mon, 13 Jan 2020 10:20:20 -0800 (PST)
MIME-Version: 1.0
From:   Adrian Carpenter <adrian@fizzyade.com>
Date:   Mon, 13 Jan 2020 18:20:09 +0000
Message-ID: <CABBSF+K5J0zo9JaACQ5xY-Cis8bARqLdRuk4YVFLrM8GG0BhQQ@mail.gmail.com>
Subject: [PATCH] USB: dwc2: handle gadget mode disconnect correctly
To:     linux-usb@vger.kernel.org, hminas@synopsys.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

dwc2 usb driver does not handle disconnect in gadget mode correctly,
this results in the gadget still thinking it is connected to a host.

Changing the suspend interrupt handling in gadget mode to reflect the
correct disconnected state fixes this.

Cc: linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>
Cc: Minas Harutyunyan <hminas@synopsys.com>
Signed-off-by: Adrian Carpenter <adrian@fizzyade.com>
---
 drivers/usb/dwc2/core_intr.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff -uprN -X usb-vanilla/Documentation/dontdiff
usb-vanilla/drivers/usb/dwc2/core_intr.c
usb/drivers/usb/dwc2/core_intr.c
--- usb-vanilla/drivers/usb/dwc2/core_intr.c    2020-01-13
13:56:03.988950132 +0000
+++ usb/drivers/usb/dwc2/core_intr.c    2020-01-13 17:29:03.496377075 +0000
@@ -536,13 +536,12 @@ static void dwc2_handle_usb_suspend_intr
                        }
 skip_power_saving:
                        /*
-                        * Change to L2 (suspend) state before releasing
-                        * spinlock
+                        * Suspend seems to be called in then event
+                        * of gadget mode disconnect
                         */
-                       hsotg->lx_state = DWC2_L2;
+                       hsotg->lx_state = DWC2_L3;

-                       /* Call gadget suspend callback */
-                       call_gadget(hsotg, suspend);
+                       usb_gadget_set_state(&hsotg->gadget,
USB_STATE_NOTATTACHED);
                }
        } else {
                if (hsotg->op_state == OTG_STATE_A_PERIPHERAL) {

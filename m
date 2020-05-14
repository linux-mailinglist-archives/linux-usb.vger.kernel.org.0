Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26BD71D34DD
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 17:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbgENPTA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 11:19:00 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:8015 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbgENPS7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 11:18:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589469539; x=1621005539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=bSkxPO4YAeYhoA86BhD7AljvgDtewB0pwQgHTAau/j4=;
  b=F+FfxlTpPbFccc7Ch0rkldLyfNMy0QlWEoiCemG2/dVSeMJKhk57h7P0
   SDZwK3if7wWHvdQChMdoqm/LDjJWSj8uAc5SviPkmHabuBYvsQ6DBmg6w
   v428oWzfdsnCoCiVsmy2S+/BdpWB4vUweiRvuDv2z75nMPInPxSEIYkKC
   VYpFvTzxZxS7ZFBhk2+Hf65MXJFisV363SaOTVNM1cTZ3srpTrZyry6Z9
   YcbvZrChT76o7vawnPVpmsXrXZtdsSu0Pd2Vp9ADbVYkpQP5at9m9wbMF
   zzrDWpswEJvKAf2NzzlvpntJVdRAfLhoLT5+3rgLE1h8VCxkBXz1UGQaT
   A==;
IronPort-SDR: YwZEYQ980Xrod7RQkQsiZFC7W0OSXRtClbRLXBwGuC1E8koaWVMhAyFZ9f1nZiY6lA1EUzjK6q
 I/QJ+7jrNrViRx46YXb1iItblsQNSIpI6ddsQSoCBSaBCLMbmQ5R1JoCNqNCPEmH/Tv2kUBzXA
 ZM8ZDVZBSM8R7pRKikkl7OOOuHGM3hIrNzjhAVIsgxOPtM2liU3ikF3OZtCLhcINzzEJosOyUY
 0OOO4p6VDGephHV7WfV5fY0K4ePwbsyZmqNPKpTenM5YOBmh8ueHk1sgqJ0gvTnPRUvyUwmunh
 7n4=
X-IronPort-AV: E=Sophos;i="5.73,391,1583218800"; 
   d="scan'208";a="75909803"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 May 2020 08:18:59 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 14 May 2020 08:19:01 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Thu, 14 May 2020 08:19:00 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH v2 2/7] staging: most: usb: remove reference to USB error codes
Date:   Thu, 14 May 2020 17:18:47 +0200
Message-ID: <1589469532-21488-3-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589469532-21488-1-git-send-email-christian.gromm@microchip.com>
References: <1589469532-21488-1-git-send-email-christian.gromm@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch removes the reference to the driver API file for USB error
codes.

Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2:
	removed copied USB error code section

 drivers/staging/most/usb/usb.c | 97 ------------------------------------------
 1 file changed, 97 deletions(-)

diff --git a/drivers/staging/most/usb/usb.c b/drivers/staging/most/usb/usb.c
index 85d4fa0..dbb6003 100644
--- a/drivers/staging/most/usb/usb.c
+++ b/drivers/staging/most/usb/usb.c
@@ -382,103 +382,6 @@ static void hdm_write_completion(struct urb *urb)
  * padding bytes -if necessary- and calls the completion function.
  *
  * Context: interrupt!
- *
- * **************************************************************************
- *                   Error codes returned by in urb->status
- *                   or in iso_frame_desc[n].status (for ISO)
- * *************************************************************************
- *
- * USB device drivers may only test urb status values in completion handlers.
- * This is because otherwise there would be a race between HCDs updating
- * these values on one CPU, and device drivers testing them on another CPU.
- *
- * A transfer's actual_length may be positive even when an error has been
- * reported.  That's because transfers often involve several packets, so that
- * one or more packets could finish before an error stops further endpoint I/O.
- *
- * For isochronous URBs, the urb status value is non-zero only if the URB is
- * unlinked, the device is removed, the host controller is disabled or the total
- * transferred length is less than the requested length and the URB_SHORT_NOT_OK
- * flag is set.  Completion handlers for isochronous URBs should only see
- * urb->status set to zero, -ENOENT, -ECONNRESET, -ESHUTDOWN, or -EREMOTEIO.
- * Individual frame descriptor status fields may report more status codes.
- *
- *
- * 0			Transfer completed successfully
- *
- * -ENOENT		URB was synchronously unlinked by usb_unlink_urb
- *
- * -EINPROGRESS		URB still pending, no results yet
- *			(That is, if drivers see this it's a bug.)
- *
- * -EPROTO (*, **)	a) bitstuff error
- *			b) no response packet received within the
- *			   prescribed bus turn-around time
- *			c) unknown USB error
- *
- * -EILSEQ (*, **)	a) CRC mismatch
- *			b) no response packet received within the
- *			   prescribed bus turn-around time
- *			c) unknown USB error
- *
- *			Note that often the controller hardware does not
- *			distinguish among cases a), b), and c), so a
- *			driver cannot tell whether there was a protocol
- *			error, a failure to respond (often caused by
- *			device disconnect), or some other fault.
- *
- * -ETIME (**)		No response packet received within the prescribed
- *			bus turn-around time.  This error may instead be
- *			reported as -EPROTO or -EILSEQ.
- *
- * -ETIMEDOUT		Synchronous USB message functions use this code
- *			to indicate timeout expired before the transfer
- *			completed, and no other error was reported by HC.
- *
- * -EPIPE (**)		Endpoint stalled.  For non-control endpoints,
- *			reset this status with usb_clear_halt().
- *
- * -ECOMM		During an IN transfer, the host controller
- *			received data from an endpoint faster than it
- *			could be written to system memory
- *
- * -ENOSR		During an OUT transfer, the host controller
- *			could not retrieve data from system memory fast
- *			enough to keep up with the USB data rate
- *
- * -EOVERFLOW (*)	The amount of data returned by the endpoint was
- *			greater than either the max packet size of the
- *			endpoint or the remaining buffer size.  "Babble".
- *
- * -EREMOTEIO		The data read from the endpoint did not fill the
- *			specified buffer, and URB_SHORT_NOT_OK was set in
- *			urb->transfer_flags.
- *
- * -ENODEV		Device was removed.  Often preceded by a burst of
- *			other errors, since the hub driver doesn't detect
- *			device removal events immediately.
- *
- * -EXDEV		ISO transfer only partially completed
- *			(only set in iso_frame_desc[n].status, not urb->status)
- *
- * -EINVAL		ISO madness, if this happens: Log off and go home
- *
- * -ECONNRESET		URB was asynchronously unlinked by usb_unlink_urb
- *
- * -ESHUTDOWN		The device or host controller has been disabled due
- *			to some problem that could not be worked around,
- *			such as a physical disconnect.
- *
- *
- * (*) Error codes like -EPROTO, -EILSEQ and -EOVERFLOW normally indicate
- * hardware problems such as bad devices (including firmware) or cables.
- *
- * (**) This is also one of several codes that different kinds of host
- * controller use to indicate a transfer has failed because of device
- * disconnect.  In the interval before the hub driver starts disconnect
- * processing, devices may receive such fault reports for every request.
- *
- * See <https://www.kernel.org/doc/Documentation/driver-api/usb/error-codes.rst>
  */
 static void hdm_read_completion(struct urb *urb)
 {
-- 
2.7.4


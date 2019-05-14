Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0CB1D163
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2019 23:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbfENVih (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 May 2019 17:38:37 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.47.102]:33632 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726134AbfENVih (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 May 2019 17:38:37 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6A54BC01E2;
        Tue, 14 May 2019 21:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1557869921; bh=0eOcbEzexVmYzSmQg0FJNp3VqFgjycYdOWrYqkOSdVY=;
        h=Date:From:Subject:To:CC:From;
        b=GsqmbmwM8FI3ka4Z5eyVsFNksQYwibmBxGhqZmnaXdtcUxdI2y0SBN27nqHCk23pi
         jEINNn34thMkSGXEbV+7Y5BLAy09z/FVAqdu88PBBWS85DbegZvEuW39yYPmFAaBit
         XXzTAT2ugzxWgkprmSUJGe2cCSmOSVaur1GJpVbbk8SDjWCRaSCHkScHOPU8a2kGxH
         U6Xo5fANhYJLGSDuLSjfi4ETsyqcOt15p9Q6kJA3FUbyywy3DgEMmRZcs+6SBy+gfS
         OFeWvjlVKMIsuS7jcIM72Edu+TEEbU08oAzIv+ziEW4L9Uor/BuAr3soHbCLtoX9dI
         MJMET7f//KOHQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id A18C4A005A;
        Tue, 14 May 2019 21:38:33 +0000 (UTC)
Received: from US01WEHTC1.internal.synopsys.com (10.12.239.236) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 14 May 2019 14:38:33 -0700
Received: from te-lab16 (10.13.184.19) by us01wehtc1.internal.synopsys.com
 (10.12.239.236) with Microsoft SMTP Server (TLS) id 14.3.408.0; Tue, 14 May
 2019 14:38:31 -0700
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 14 May 2019 14:38:31
 -0700
Date:   Tue, 14 May 2019 14:38:31 -0700
Message-ID: <e4d539c430598d2ac5b75e48dec807e855adcb76.1557869140.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 1/2] usb: core: hub: Enable/disable U1/U2 in configured state
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mathieu Malaterre <malat@debian.org>,
        "Nicolas Saenz Julienne" <nsaenzjulienne@suse.de>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Jon Flatley <jflat@chromium.org>,
        "Nicolas Boichat" <drinkcat@chromium.org>
CC:     John Youn <John.Youn@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.184.19]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SET_FEATURE(U1/U2_ENABLE) and CLEAR_FEATURE(U1/U2) only apply while the
device is in configured state. Add proper check in usb_disable_lpm() and
usb_enable_lpm() for enabling/disabling device-initiated U1/U2.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/core/hub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 2f94568ba385..026b652d4f38 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -4139,7 +4139,7 @@ int usb_disable_lpm(struct usb_device *udev)
 	if (!udev || !udev->parent ||
 			udev->speed < USB_SPEED_SUPER ||
 			!udev->lpm_capable ||
-			udev->state < USB_STATE_DEFAULT)
+			udev->state < USB_STATE_CONFIGURED)
 		return 0;
 
 	hcd = bus_to_hcd(udev->bus);
@@ -4198,7 +4198,7 @@ void usb_enable_lpm(struct usb_device *udev)
 	if (!udev || !udev->parent ||
 			udev->speed < USB_SPEED_SUPER ||
 			!udev->lpm_capable ||
-			udev->state < USB_STATE_DEFAULT)
+			udev->state < USB_STATE_CONFIGURED)
 		return;
 
 	udev->lpm_disable_count--;
-- 
2.11.0


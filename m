Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2B8400BF0
	for <lists+linux-usb@lfdr.de>; Sat,  4 Sep 2021 17:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236810AbhIDPkm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Sep 2021 11:40:42 -0400
Received: from informare.org ([217.11.52.70]:40642 "EHLO informare.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230312AbhIDPkm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 4 Sep 2021 11:40:42 -0400
X-Greylist: delayed 400 seconds by postgrey-1.27 at vger.kernel.org; Sat, 04 Sep 2021 11:40:41 EDT
Received: (qmail 13445 invoked from network); 4 Sep 2021 15:32:58 -0000
Received: from unknown (HELO ?192.168.2.105?) (faber@faberman.de@87.133.154.214)
  by 0 with ESMTPA; 4 Sep 2021 15:32:58 -0000
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
From:   Florian Faber <faber@faberman.de>
Subject: [PATCH] usb: gadget: f_mass_storage: Shut down mass storage device
 when USB connection is shut, down.
Message-ID: <5f9fbabd-2e2c-9389-446d-3bd1dd954a82@faberman.de>
Date:   Sat, 4 Sep 2021 17:32:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

f_mass_storage continues to send out packets after the connection to the 
USB host has been terminated, ignoring the error status.

Signed-off-by: Florian Faber <faber@faberman.de>

---
  drivers/usb/gadget/function/f_mass_storage.c | 4 ++++
  1 file changed, 4 insertions(+)

diff --git a/drivers/usb/gadget/function/f_mass_storage.c 
b/drivers/usb/gadget/function/f_mass_storage.c
index 6ad669dde41c..1e73ba629e43 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -529,6 +529,10 @@ static int start_transfer(struct fsg_dev *fsg, 
struct usb_ep *ep,
  		/* We can't do much more than wait for a reset */
  		req->status = rc;

+		if (rc==-ESHUTDOWN) {
+			fsg->common->running = 0;
+		}
+
  		/*
  		 * Note: currently the net2280 driver fails zero-length
  		 * submissions if DMA is enabled.
-- 
2.33.0

Flo
-- 
Machines can do the work, so people have time to think.

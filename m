Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65EAA1C9723
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 19:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727808AbgEGRHK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 May 2020 13:07:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727799AbgEGRHH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 May 2020 13:07:07 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D6CAC05BD09
        for <linux-usb@vger.kernel.org>; Thu,  7 May 2020 10:07:07 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id a62so6486904qkd.4
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2020 10:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=UkoJB8mrsXvJ/mhp+/IOB9nRbu0RcDR5Saku4Tm8lGU=;
        b=Xjw3YQDKpPMme3PoqQQ8vRC+br/9ZRYJ4YydUX3wxHjW+x/HraXRlU2zOvDpyfLcPP
         Btez9FR8imo7LTgnaUc/gY4ZG86nZRSDftd2/vztY842ug21by/oURrcAcqSsGnVYoDO
         0OB5b8lSBjwo0NEDK3Mxh8rGzzb12C4eKxqmHWHVG0xyvLP2j0jGYIbzMgfsWfRv2rmB
         Nn6m19H0Ja+JeqCrlyMt+GKcqce8aM2cMEmCbpj/RsSaAZeiv+Cb0yF/uYgHcF5OYSLN
         UUf+j2a6w/QK34V3y37ELg2p9yfZb9LB10hnOoLoC/EVsSr46tfZOxswwqOop86EQgQu
         SAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=UkoJB8mrsXvJ/mhp+/IOB9nRbu0RcDR5Saku4Tm8lGU=;
        b=HQa01tTmFZFX+mMtznfCv8B4FGKcAOqL7mBzdbTsnRC8BN9SVRi8+jmwwOiRzEpapr
         Qk2ppjtnnggvwfD+yOc15rSJx8oaJv5/XeMiUwPPvFQu3AFT4NU/z6e3STQOl3i/yYyT
         jr2w0lxcxMTNbhuY0psyfX8YfWBRlCN6tG/lCyHQTgGmznukDtEbPds3VHhE8ebIWiCB
         zxevzScm740x6b8NGTdmnDvVFzU+DsUcehmuxZa2ZRM8RD6bwjo/Dt+4UjgXNr0Vp6U7
         TthSH4Pww15hl3x1HbOZfURBZS0uiorSyQLanZUO2GUj4mGpIiPIfMUuBrQlZ9cN2PPL
         +52Q==
X-Gm-Message-State: AGi0Pub/YBxONmmkIKUht2Y1yYWyrCkLJYBjGYvGlx9miRX4HyLMmjsA
        15qr1vHf9VrlxsFHN2OSt+nyJivDoSG0l48Y
X-Google-Smtp-Source: APiQypLZa2bsIo3FGThkD21eG+RwPhgKjDyYY7K5nvsOcHUVUTmz1VXVMJ/cESbH1ZZ09e9oydvFKZ/4Lr/r9CMd
X-Received: by 2002:a0c:f2d3:: with SMTP id c19mr14261142qvm.109.1588871226725;
 Thu, 07 May 2020 10:07:06 -0700 (PDT)
Date:   Thu,  7 May 2020 19:06:55 +0200
In-Reply-To: <cover.1588870822.git.andreyknvl@google.com>
Message-Id: <f18addecff393ae7d2706c9eec928bdfc0260fec.1588870822.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1588870822.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
Subject: [PATCH USB v3 2/5] usb: raw-gadget: improve uapi headers comments
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix typo "trasferred" => "transferred".

Don't call USB requests URBs.

Fix comment style.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 include/uapi/linux/usb/raw_gadget.h | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/include/uapi/linux/usb/raw_gadget.h b/include/uapi/linux/usb/raw_gadget.h
index ea375082b3ac..02885e021ee5 100644
--- a/include/uapi/linux/usb/raw_gadget.h
+++ b/include/uapi/linux/usb/raw_gadget.h
@@ -115,11 +115,11 @@ struct usb_raw_ep_io {
 #define USB_RAW_IOCTL_EVENT_FETCH	_IOR('U', 2, struct usb_raw_event)
 
 /*
- * Queues an IN (OUT for READ) urb as a response to the last control request
- * received on endpoint 0, provided that was an IN (OUT for READ) request and
- * waits until the urb is completed. Copies received data to user for READ.
+ * Queues an IN (OUT for READ) request as a response to the last setup request
+ * received on endpoint 0 (provided that was an IN (OUT for READ) request), and
+ * waits until the request is completed. Copies received data to user for READ.
  * Accepts a pointer to the usb_raw_ep_io struct as an argument.
- * Returns length of trasferred data on success or negative error code on
+ * Returns length of transferred data on success or negative error code on
  * failure.
  */
 #define USB_RAW_IOCTL_EP0_WRITE		_IOW('U', 3, struct usb_raw_ep_io)
@@ -133,19 +133,20 @@ struct usb_raw_ep_io {
  */
 #define USB_RAW_IOCTL_EP_ENABLE		_IOW('U', 5, struct usb_endpoint_descriptor)
 
-/* Disables specified endpoint.
+/*
+ * Disables specified endpoint.
  * Accepts endpoint handle as an argument.
  * Returns 0 on success or negative error code on failure.
  */
 #define USB_RAW_IOCTL_EP_DISABLE	_IOW('U', 6, __u32)
 
 /*
- * Queues an IN (OUT for READ) urb as a response to the last control request
- * received on endpoint usb_raw_ep_io.ep, provided that was an IN (OUT for READ)
- * request and waits until the urb is completed. Copies received data to user
- * for READ.
+ * Queues an IN (OUT for READ) request as a response to the last setup request
+ * received on endpoint usb_raw_ep_io.ep (provided that was an IN (OUT for READ)
+ * request), and waits until the request is completed. Copies received data to
+ * user for READ.
  * Accepts a pointer to the usb_raw_ep_io struct as an argument.
- * Returns length of trasferred data on success or negative error code on
+ * Returns length of transferred data on success or negative error code on
  * failure.
  */
 #define USB_RAW_IOCTL_EP_WRITE		_IOW('U', 7, struct usb_raw_ep_io)
-- 
2.26.2.526.g744177e7f7-goog


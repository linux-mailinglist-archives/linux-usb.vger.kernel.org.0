Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2D291B78BC
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2020 17:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727872AbgDXPB1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Apr 2020 11:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727772AbgDXPB0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Apr 2020 11:01:26 -0400
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com [IPv6:2a00:1450:4864:20::349])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D35C09B045
        for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2020 08:01:26 -0700 (PDT)
Received: by mail-wm1-x349.google.com with SMTP id h22so3932555wml.1
        for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2020 08:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=vPweaUu0n8N5ojVI6YTHlNR6RVae+s1ZfL4NXpGDEY8=;
        b=CzXG651tqQGpLYABpTDUIWCPrBKtlNyPiKq2JvQ7XiWDgddU5MRSUeEDzupHu+4Oyb
         765grjuzBU1V/mqSKzgqnANCL+eZM0Js72WVBbPamB90SsD02Jlf8ookkEKnFLVLrkTV
         PtUYdWZ9AzGNy3Q0aBNrBUguEJEJpnh34geuHt0CEuQ9Jm7mN1Eoil5HwaMtHETi0htn
         D10kRvCoGCIk9/obRUq5+MoDz18475ZI7dIwhp1BEqeBcToOzZS8FjQh24klg0ej4SiU
         nxo6/Ua/UE6WD1EtlLv7v6ECbN2vtaAWIbDPwVKGf3/DrYXS3esGwSBMVRnF7qn5vZaT
         WVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=vPweaUu0n8N5ojVI6YTHlNR6RVae+s1ZfL4NXpGDEY8=;
        b=H2YIpZI5orHFVZvS37nUmoCx5vDFhRJ0acW+lhUWJaauMRg4UrYkTjHp2fUsQq8mSj
         ly4ZGOF/Aj703RWBVehFl2IZknzMy8zaZ+vxpMpzZF2szYF5Dzj3ce9QD2LwsZCFGOB8
         cmB+3gHlWSYHUAsJ05g1Ufg2iLIxUzqJR9BkCZSJtW50kfuL8dBRjjyG85TQl0nTcApq
         jJZhiOvoKT5S0soRIIO9/c9wMKSNBD6pnYvOeiwP5uM9nIL261cm+S9SJW/Wpg/Dc/2F
         GrQVHDQqdG/vOcjM6EkSIUoYKpYciOaa3eddcM/yPybDL3pU/R3gVgAi+dA9zR9YJ/h3
         OzRw==
X-Gm-Message-State: AGi0PuaUAStQJrV3xeQ5B1CMw3xUsmV1WwdgFR9cFslNftUfWqfocUIn
        DwWhczpo+xtJZlMRHNeroZW/TwaMDacia/F4
X-Google-Smtp-Source: APiQypKi6/7PAgEPPWLjNplmNSxX7MjIwrXlxZnQNxOtf329JhltiqzMVd1HjrrdLB4CXuk1PiqX2VDx28fBO85O
X-Received: by 2002:adf:e4cc:: with SMTP id v12mr11760768wrm.106.1587740484984;
 Fri, 24 Apr 2020 08:01:24 -0700 (PDT)
Date:   Fri, 24 Apr 2020 17:01:19 +0200
In-Reply-To: <9c99c508da044822baf53db5e3fccd4f21b0f8d3.1587734346.git.andreyknvl@google.com>
Message-Id: <635f48fcb4bb99c70ab9d7f0dfe84d1ec7dc540e.1587734346.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <9c99c508da044822baf53db5e3fccd4f21b0f8d3.1587734346.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
Subject: [PATCH USB v2 2/2] usb: raw-gadget: fix typo in uapi headers
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Change "trasferred" into "transferred".

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---

Changes in v2:

- Updated commit message.

---
 include/uapi/linux/usb/raw_gadget.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/usb/raw_gadget.h b/include/uapi/linux/usb/raw_gadget.h
index ea375082b3ac..8544802b25bd 100644
--- a/include/uapi/linux/usb/raw_gadget.h
+++ b/include/uapi/linux/usb/raw_gadget.h
@@ -119,7 +119,7 @@ struct usb_raw_ep_io {
  * received on endpoint 0, provided that was an IN (OUT for READ) request and
  * waits until the urb is completed. Copies received data to user for READ.
  * Accepts a pointer to the usb_raw_ep_io struct as an argument.
- * Returns length of trasferred data on success or negative error code on
+ * Returns length of transferred data on success or negative error code on
  * failure.
  */
 #define USB_RAW_IOCTL_EP0_WRITE		_IOW('U', 3, struct usb_raw_ep_io)
@@ -145,7 +145,7 @@ struct usb_raw_ep_io {
  * request and waits until the urb is completed. Copies received data to user
  * for READ.
  * Accepts a pointer to the usb_raw_ep_io struct as an argument.
- * Returns length of trasferred data on success or negative error code on
+ * Returns length of transferred data on success or negative error code on
  * failure.
  */
 #define USB_RAW_IOCTL_EP_WRITE		_IOW('U', 7, struct usb_raw_ep_io)
-- 
2.26.2.303.gf8c07b1a785-goog


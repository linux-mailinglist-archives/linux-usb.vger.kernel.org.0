Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8412E1B6AAD
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2020 03:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728225AbgDXBKJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Apr 2020 21:10:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728155AbgDXBKJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Apr 2020 21:10:09 -0400
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com [IPv6:2a00:1450:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C849BC09B043
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2020 18:10:08 -0700 (PDT)
Received: by mail-wr1-x449.google.com with SMTP id q10so3878280wrv.10
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2020 18:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=2lczKYi6eXKIqEV5vZ3OKNN42MIcg9ncaA29fA6tV5c=;
        b=k362AasEOyB1hZyiKYyn7oJMpt7MhEmnTnZLwIwrtZPUbV81EfZN0mHvpywWsDlJAo
         YHETS/awxfTsyeOqruwu/O4eIbUQY5m7jWvgb4y0UZgYDoLzJJcV948J7zapkKI3MRcl
         nIeSFiDHYHCmRl9VxwlQHFAxE+FEBqGi7c+6Wey7PjvsHSwc6zbc3Pq1sULGU4XBdSyi
         QIxEzDBjILr0vXJHF0T0+u1QzY/TmnacZUiuwQmeXBeCVKg8R8lJeufELyAsKdbMmQC6
         6fG7pmzh4jlMEj0ruR94njKSvOqPIxDRmMFoSd8MonQCtYCz5AXdJ7ICvWpcEWnf7XPu
         DPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=2lczKYi6eXKIqEV5vZ3OKNN42MIcg9ncaA29fA6tV5c=;
        b=fbSkTg5jRaBCUEG5plBfMl6Wz8+O0zH7t/J965AUEiJbUUMzUkOkI03EXkAvNmmmZ4
         C1GWTHMxQhn59bYffYvEFlvEaH/B8vOiWRMJPxHdgzGTrXqh7puP6Y1BEtdfdzEe9TTx
         yfaKta05CvQOhUHJzpVt4loFDenfPZT7l/sseEs6A99AdVwxUTf0xbObAwH51kDf85V8
         e0HNQhU9r5D1GsC4/O48gbGqV0VyGpeOS7oKjVtnouH4XjHm7LoCxq02B4mLYc4hUKsB
         /vxL6uk77BhNPhtQjYl111hRzYbkRMamdeRIGQFO4zpMYAORri1SJe9JeqxO1yX9DlfE
         79OQ==
X-Gm-Message-State: AGi0PuZta73/jNmPvBCDsq6+wyXTpMlkmI0pvV8TS0Vb1jOaKex9iJcD
        yK2T7HPCaqbBt/Zb76WIrCpSkOtQ9kpOuzID
X-Google-Smtp-Source: APiQypIHd9N1IA6FkupTM7be7kBBWctFdnyZM1y7pXkX8lojIIfJy0f+oMp7IR1LlAdk96j7s54eBmX3cuA3wJ2y
X-Received: by 2002:adf:f146:: with SMTP id y6mr8493146wro.132.1587690607372;
 Thu, 23 Apr 2020 18:10:07 -0700 (PDT)
Date:   Fri, 24 Apr 2020 03:09:59 +0200
In-Reply-To: <ca6b79b47313aa7ee9d8c24c5a7f595772764171.1587690539.git.andreyknvl@google.com>
Message-Id: <059e7e0ff26cc7d6e85275f764e31d85db867c4b.1587690539.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <ca6b79b47313aa7ee9d8c24c5a7f595772764171.1587690539.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
Subject: [PATCH USB 2/2] usb: raw-gadget: fix typo in uapi headers
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

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
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


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E725B1B76CF
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2020 15:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbgDXNUb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Apr 2020 09:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727930AbgDXNUa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Apr 2020 09:20:30 -0400
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com [IPv6:2607:f8b0:4864:20::a4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 493EBC09B046
        for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2020 06:20:29 -0700 (PDT)
Received: by mail-vk1-xa4a.google.com with SMTP id s206so4579998vke.20
        for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2020 06:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=iVEHdoFtCdFpiBaH+7lTMwaiCbL5fq6YQc2JbTG34i0=;
        b=PdCZQPxFLh4X4g5Ge3zd7n/ltxri3640RXfDg8wJyfnyqccwK4dNf6XCxJUoDtGfHi
         NCZXLr0l23ePq/mUzsBAqQgrJwLnifk7PHlnEWjWovbaGsSQK+rGwyCMiyvwBJDRWN0H
         49TzMZBzZPVhBD5vBJ1BJohRFK0Z9L+dEYCyOBNPAN7eDKYKYwXXiFQUeiiRlwsis2m2
         iaKg+XOwjGAF0atcmVy/kJh3248oEYro+CDniEPaSy46WuLqmZymFJqhrkdMb+XaWCu1
         syFtzCej7wE791ewsv/Pgujzbyp43R1Rw9h/+xWUqIqo9pJLLB1VCbBOiDUYK79B0AEv
         Qqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=iVEHdoFtCdFpiBaH+7lTMwaiCbL5fq6YQc2JbTG34i0=;
        b=U7Uctx+VuQuUsq5eXhCOCyIBjhLdt+MIcWFbVkQKsaJmRH9KmhS9JQq+3kD3A++yBh
         AK8SzrmfA3n6J3SP62wOUFJb7mJ8wZugOK+ktK2M8AeiZI7VGdKsDT3ZfUGPJ+Nhzvoq
         9mhMI3zXSo/b0q2ECNu8lErRJwvJtjzjxQWjyZkG3pRgljqZpgo2g5bRxrd8svpDwUkm
         ILtqWZ4+RkOvOX8XIwM44nxgEAYz4C7EtbnCg6K/jfXCpY88u8gzIjHu5mXP23nn+Bqb
         gqGa93NXSuFdk6j0YTqoFznIOjPGPC7k+Yyr39DuBfIMKslO9xtibs1XrNINIp8lpWOM
         gYig==
X-Gm-Message-State: AGi0PuaMr4XxSGxGsuZClfTCXSltkeUmGNK8GPZhvQ/MKhba2+C9Szfs
        dTgGnwdv3eQmnyKix/UyiVFxKzBYHA/D/6fG
X-Google-Smtp-Source: APiQypKBNnbfnbdI4IQDk1HiBGDGCEt6LytLKochQyMW8Chmj4ToVQPSf3IEhYa2CEKPn1r93OojRJbC1kl5TjKi
X-Received: by 2002:a1f:ff11:: with SMTP id p17mr7604647vki.25.1587734428386;
 Fri, 24 Apr 2020 06:20:28 -0700 (PDT)
Date:   Fri, 24 Apr 2020 15:20:20 +0200
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

Change-Id: I2d8d1dcc9ba6aacafc03f4b76caca7409a6da1a6
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


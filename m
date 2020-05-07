Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8EF91C9722
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 19:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbgEGRHG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 May 2020 13:07:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726393AbgEGRHF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 May 2020 13:07:05 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5461DC05BD43
        for <linux-usb@vger.kernel.org>; Thu,  7 May 2020 10:07:05 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id p17so5708647qkp.10
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2020 10:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ymubhbuUMqo10NP0iRjdqCfzVtS0tpPXFP6hBmZD6a0=;
        b=mowMqO9im8184u6QOvUBA0wIM78Byr0OqoioGhshWiiwT8nJKONKJJz5svQElVrQKa
         TYEOuPweh0lLQnIpkM4IlDj46vfTQlhYXqkJ2w078q+zaS+1Kp33l1KLOCjpP+RPMvlc
         TceMvMFO/x8ng6ELmji6WKn+z5mkB5NSe7j12yp7xLzXV5ucHeZl6pVO4Kv847l4rMrI
         5G6pq5PMrPrpIXoFT/XsBKQa9l7gNtgfx6RDn2Ixi7tMhkKC1t9BsJPkfurxniFsVDOH
         uRyyPpOUsabh/m8iJswGUmZQ7GfmEVMDWrYeChDVkUMTUSkA2hL3wi8Ysur7vzXJ5ATj
         Pb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ymubhbuUMqo10NP0iRjdqCfzVtS0tpPXFP6hBmZD6a0=;
        b=G1cd9qF/3BVPc8h2jpwF0aBbUqEwdniImsSq9H9OyuSQwBR+K4P1+O+Z9Hww9Grmq0
         WmtA/BAs/WNk9PaloOwA3XACScO0MAx4zVofvyJwTs8jN3dGeRCjgQ5e2EF39gwYHbyC
         s0gQOrIEERw8mzEP1G9PcOZzvCGw1f+CQiyX16k0YK+FyiZBWZfbq/6wQbQduZdt7w0r
         z2t3uyyQcUUvhtAaE+JghikHc/8r5XDk3sletspCGAOqinJSG01KdgLCyphgGQK80qnQ
         KD6xmdguw46/0IJiqlTCp8+EYq7vV7gUtoXrKfVOcoE+XSngr3zOJ6I9ll6QNDDdrA5A
         EONQ==
X-Gm-Message-State: AGi0PubXJtjBOOargema1fHZiBK4TxTS8vyOrtOCo/MUxITdzgcU1v/I
        knylyFFLTv2kyatfU62F3C/y/LcQ/lQlD6ij
X-Google-Smtp-Source: APiQypLvkahc8DkzAjMi93zhah8Vj2AFn3RskThIsYEhnKOwAREgc0dTuM+sVqh9dhx1TvuAjZQlitIsge7llnO1
X-Received: by 2002:a0c:e8c2:: with SMTP id m2mr13550246qvo.24.1588871224508;
 Thu, 07 May 2020 10:07:04 -0700 (PDT)
Date:   Thu,  7 May 2020 19:06:54 +0200
In-Reply-To: <cover.1588870822.git.andreyknvl@google.com>
Message-Id: <eed8414b900ad9c899009afb9e9b6262c08fe253.1588870822.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1588870822.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
Subject: [PATCH USB v3 1/5] usb: raw-gadget: fix return value of ep read ioctls
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

They must return the number of bytes transferred during the data stage.

Fixes: 068fbff4f860 ("usb: raw-gadget: Fix copy_to/from_user() checks")
Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 drivers/usb/gadget/legacy/raw_gadget.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index ca7d95bf7397..7b241992ad5a 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -669,12 +669,14 @@ static int raw_ioctl_ep0_read(struct raw_dev *dev, unsigned long value)
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 	ret = raw_process_ep0_io(dev, &io, data, false);
-	if (ret)
+	if (ret < 0)
 		goto free;
 
 	length = min(io.length, (unsigned int)ret);
 	if (copy_to_user((void __user *)(value + sizeof(io)), data, length))
 		ret = -EFAULT;
+	else
+		ret = length;
 free:
 	kfree(data);
 	return ret;
@@ -964,12 +966,14 @@ static int raw_ioctl_ep_read(struct raw_dev *dev, unsigned long value)
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 	ret = raw_process_ep_io(dev, &io, data, false);
-	if (ret)
+	if (ret < 0)
 		goto free;
 
 	length = min(io.length, (unsigned int)ret);
 	if (copy_to_user((void __user *)(value + sizeof(io)), data, length))
 		ret = -EFAULT;
+	else
+		ret = length;
 free:
 	kfree(data);
 	return ret;
-- 
2.26.2.526.g744177e7f7-goog


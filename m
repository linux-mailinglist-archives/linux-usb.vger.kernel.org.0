Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 179FE1B6AAC
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2020 03:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727968AbgDXBKH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Apr 2020 21:10:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727890AbgDXBKH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Apr 2020 21:10:07 -0400
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18306C09B043
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2020 18:10:07 -0700 (PDT)
Received: by mail-wm1-x34a.google.com with SMTP id h184so3103592wmf.5
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2020 18:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=88mZnk/yJJPxv8ksSnTZfxrk5uMuKcJLn1UiqJx+wmw=;
        b=Xjy0j8oGaQBfUC0+TLweiaTVBntI5YN9B+ojSDjBhyR5peIn+AA+/fa23bCTH3tEPR
         xUM6US7ZQz7kMwXzO9iMVgkYLxaFQDPMKIEwgVRG2Q/qb4+gRNlQ7ouRgyJ7HugzFiRC
         17y1xK81h1VFdRZXkpktGeDPnCtjQ/PJCjD5WVfxioYm4SaexlU0CU4JzXFC1f4bX9NR
         vfMCoQFcHtAUh9V3nvqvTcGUIrVN9SLhRr+P9M9NFr8Ijt1ZWKLuyUbuu2rzT2bF1nLG
         As3NVgP6NZGHzw0cl1VtyDbpl2WjwEIiAzOy+bT98IZxfp/A2baWrqYz4uiz4uSHZTjE
         SGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=88mZnk/yJJPxv8ksSnTZfxrk5uMuKcJLn1UiqJx+wmw=;
        b=SLguBoYK5wnKADqwm90T02g9SdxWaq7HLhBZhLvvRB8FLK2b5iWkIaPW+k2u9m+3GD
         vigdkzXW7hBuH3pX3i9hcdBCKBUAmO7qucF6uciAT7/yAv6kWkurqP9P3nPpxMVXwvyq
         dgPKbT/xS68fxi5VR3lIwVjdUFwfGIiQP2Bwb0WCE98hX3q0ZU0+ibnNO5fYoremj9sn
         qfgZ+1He7Nj2I6YaZX0M/AbAeRTgPL0d7fknsu8+1+DLzg5aDP/bnpgquMb7KnOZROFG
         mEJKmNdhHTA4iguSEkbRQNrikeTwt0Hk3XUMevE6zPlHnys0Xbvcw/Bvbg4yHljsdm/c
         3IiA==
X-Gm-Message-State: AGi0PuZ+otXjayDMqLvBrlnKSRoLcfMEmwi07KNZbGTmsn1+kzgTBLHP
        4ZBq32FkGAaoYctLtxoQMhox+LzuHFeXaIM9
X-Google-Smtp-Source: APiQypLPbcD2u3CRgSM+YSTrO9Dn4z0hpKBCeWEN1/zI3eqQ7+bp2ft+MtTqNYq3W2P3SZPbmLzBuX/XwjTVCdVc
X-Received: by 2002:adf:a11a:: with SMTP id o26mr7819194wro.284.1587690604105;
 Thu, 23 Apr 2020 18:10:04 -0700 (PDT)
Date:   Fri, 24 Apr 2020 03:09:58 +0200
Message-Id: <ca6b79b47313aa7ee9d8c24c5a7f595772764171.1587690539.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
Subject: [PATCH USB 1/2] usb: raw-gadget: fix return value of ep read ioctls
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

They must return the number of bytes transferred during the data stage.

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
2.26.2.303.gf8c07b1a785-goog


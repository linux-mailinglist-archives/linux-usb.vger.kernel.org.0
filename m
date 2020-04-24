Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0521B76CD
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2020 15:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbgDXNU1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Apr 2020 09:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbgDXNU1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Apr 2020 09:20:27 -0400
Received: from mail-ua1-x94a.google.com (mail-ua1-x94a.google.com [IPv6:2607:f8b0:4864:20::94a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED111C09B045
        for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2020 06:20:25 -0700 (PDT)
Received: by mail-ua1-x94a.google.com with SMTP id l9so4969098uao.12
        for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2020 06:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=r9H1IW1LgtEkP8qLWkbs6oOL83C0+GpU8c93D2C8O+E=;
        b=Wu8YZlRMt98XgKmsACE1XV5n+dabvH9NmisOPAUZ0ezGdXqMT7BBGBOb9Ng2O42kj+
         hibERO+zT/JA3JGDhq+Bu5OKltmrKOmEyKCDtM7Tc3Cr9oOT98JfCGMYuFtiEzuRbgFt
         vFJtVM1griYhhIpH0n94Z+GLXyzlHtzbwDu0ytT8GiF0bkDL7vEogBQMPThOkApOTGeG
         tQgdpm06Hf37atZMj4s22ubXfS+RR85cE05v4M/sqCfBwJl+z3T45KEEnZIU2K+3rrjW
         AUrs1UOTnH18pm/f62KclP3ZifYgNYYaLROml0hWiVTtddpsNq4L9ho9lbWp3MCVyn3C
         1e5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=r9H1IW1LgtEkP8qLWkbs6oOL83C0+GpU8c93D2C8O+E=;
        b=ZxtC+0hx4Ge3aTnFy3wM0zAcg3v1wPseUP40fWCmhbyTZv0ciqDEpIxa3vUwheBkC2
         9+XCWd9adiksV1YDyYYUCVb5j0ZtjUAMl0GOvtSVcc4kjTi11TQUca3ESXD7PQ04f6nS
         sc4zZZSQR66JKAsFcwRxxMqJ8ugdYb/I3mE47MmnLWHDPVNGZIWLo05OAYf3rXh3b1/i
         oZubul4tdv3Ey03EIerX5tBk91OmiWAqLJxVhKeBgw59LWGGAwqn4vRKUqzJZxa0qQCb
         pNf8f+gOMjNUaXB0pCDPRI8FP3zm46X8BkhWNvMybJDv4yQKkhH/ZpGw901+5JWrom5O
         niTg==
X-Gm-Message-State: AGi0PuYKNVKXiKx4n5ZWK2mIa+w07hkfz2o7QAbV3gzzB9BH55an7goG
        prgrtTSo3UuAvcnoJVlBasPI6nrc5wWBZu2J
X-Google-Smtp-Source: APiQypLElWOC/iqIxBReE7LPkVfCCE0t6xjkTcKjVSJ7azxEWLCUiTVOs3OH+UJQG5OnKKEI8yAUeQAHcW20bhPU
X-Received: by 2002:a1f:99d1:: with SMTP id b200mr7899519vke.95.1587734424795;
 Fri, 24 Apr 2020 06:20:24 -0700 (PDT)
Date:   Fri, 24 Apr 2020 15:20:19 +0200
Message-Id: <9c99c508da044822baf53db5e3fccd4f21b0f8d3.1587734346.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
Subject: [PATCH USB v2 1/2] usb: raw-gadget: fix return value of ep read ioctls
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

Fixes: 068fbff4f860 ("usb: raw-gadget: Fix copy_to/from_user() checks")
Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---

Changes in v2:
- Added Fixes tags.

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


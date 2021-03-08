Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3484333069C
	for <lists+linux-usb@lfdr.de>; Mon,  8 Mar 2021 04:54:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234043AbhCHDyA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Mar 2021 22:54:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234027AbhCHDxq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 7 Mar 2021 22:53:46 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83ACBC06175F
        for <linux-usb@vger.kernel.org>; Sun,  7 Mar 2021 19:53:35 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id u20so8500127iot.9
        for <linux-usb@vger.kernel.org>; Sun, 07 Mar 2021 19:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pjP5jnpjOCAAGVvM2wgeXDUNlH+i430AZmhAaZRiAsc=;
        b=P4mqjVrcRIoZvnHBTs8vz2AUyZS7YuVUCwejYaWNBf4NufH7g4nOfO+8f3VQfc/YZm
         /NlPoAUgCXi/BAClLpBTF4RLHxJ2QfM0Zmvl7aWFuEANkE36YyI0GzWgX2Tio0kMbtQL
         3TKnbCnjucceTqy/R2jBSMlh519RWcZ5aE88s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pjP5jnpjOCAAGVvM2wgeXDUNlH+i430AZmhAaZRiAsc=;
        b=M4Jdv4VqpPxgO1XvNoAOnc9zHU1Ak8cmHyJ+jAfE3lpnWG7ZvZ4wwwXw/+iQ3w9yoX
         3ev9P05ETeAO+XeK5jugvlCO5FKXsL3rLt1y4bSDOpAO16N399KIva4si0VMDFC9qxHK
         fuNezP8qF4YJhkaZL9d3Z58CshpylOWqHqKX5jOlfn5IT0KB8BbfMzba5MXzO46CejTt
         rcbMD/DrFUBwXHXnQJWBH5JW8L7DcVTTbg0ZhtX7QXJdm15gajT14TiLejWMRLKeM0E5
         xI43j8NpqaQ7BFzPv/c3aqJPpQAS9mnD4iw6ZjD8q6Dolf1Dsi5hKtoD74mmbJQGxeEB
         qZIg==
X-Gm-Message-State: AOAM533/JnnZyKMG3rLU5hZY0CAj4Qx84cZ3edwlKc1HRvrPRyZzt3ha
        mjsxkh7P+N8f5a+XMfAMAL9pHA==
X-Google-Smtp-Source: ABdhPJzDImSLEVxZQblxYwCjtei3KT0UduOf/H0kLlvtdtz8OHNNv1wqu3/i06fuhwpTUDy0ndyp8A==
X-Received: by 2002:a02:9986:: with SMTP id a6mr21528852jal.46.1615175614977;
        Sun, 07 Mar 2021 19:53:34 -0800 (PST)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id g6sm5605242ilj.28.2021.03.07.19.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 19:53:34 -0800 (PST)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     shuah@kernel.org, valentina.manea.m@gmail.com,
        gregkh@linuxfoundation.org
Cc:     Shuah Khan <skhan@linuxfoundation.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, penguin-kernel@I-love.SAKURA.ne.jp,
        stable@vger.kernel.org
Subject: [PATCH 1/6] usbip: fix stub_dev to check for stream socket
Date:   Sun,  7 Mar 2021 20:53:26 -0700
Message-Id: <e942d2bd03afb8e8552bd2a5d84e18d17670d521.1615171203.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1615171203.git.skhan@linuxfoundation.org>
References: <cover.1615171203.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix usbip_sockfd_store() to validate the passed in file descriptor is
a stream socket. If the file descriptor passed was a SOCK_DGRAM socket,
sock_recvmsg() can't detect end of stream.

Cc: stable@vger.kernel.org
Suggested-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/usb/usbip/stub_dev.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/stub_dev.c b/drivers/usb/usbip/stub_dev.c
index 2305d425e6c9..90c105469a07 100644
--- a/drivers/usb/usbip/stub_dev.c
+++ b/drivers/usb/usbip/stub_dev.c
@@ -69,8 +69,16 @@ static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *a
 		}
 
 		socket = sockfd_lookup(sockfd, &err);
-		if (!socket)
+		if (!socket) {
+			dev_err(dev, "failed to lookup sock");
 			goto err;
+		}
+
+		if (socket->type != SOCK_STREAM) {
+			dev_err(dev, "Expecting SOCK_STREAM - found %d",
+				socket->type);
+			goto sock_err;
+		}
 
 		sdev->ud.tcp_socket = socket;
 		sdev->ud.sockfd = sockfd;
@@ -100,6 +108,8 @@ static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *a
 
 	return count;
 
+sock_err:
+	sockfd_put(socket);
 err:
 	spin_unlock_irq(&sdev->ud.lock);
 	return -EINVAL;
-- 
2.27.0


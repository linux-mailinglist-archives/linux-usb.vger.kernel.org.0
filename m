Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89C20330695
	for <lists+linux-usb@lfdr.de>; Mon,  8 Mar 2021 04:54:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234008AbhCHDx4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Mar 2021 22:53:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234014AbhCHDxg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 7 Mar 2021 22:53:36 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31B57C061762
        for <linux-usb@vger.kernel.org>; Sun,  7 Mar 2021 19:53:36 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id 81so8484455iou.11
        for <linux-usb@vger.kernel.org>; Sun, 07 Mar 2021 19:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=stb9NZQa9CoZP2FT0RtVu5IO2NO9bsYFRmhQMMwPtwI=;
        b=Ion4q7bVE0BiGHce3xt5QcO+o3aPufTGpYQVqOlqjcxp/FSn+FhwN0JCP1UF5qcAyp
         itJCsRcbammtMz/zEX9oOCIWg474A0MeDOo2tfke0FBQmfzKB3RBx0/cfWh4NWNUS8Mo
         TWyOjOcOQRGmyhDswgZwa55SymSaOiOtDXyg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=stb9NZQa9CoZP2FT0RtVu5IO2NO9bsYFRmhQMMwPtwI=;
        b=aM4Mwo64bELKA8xp/TijVgsCThHej7hhkadAhsx9l01i/5kNdHsAlobAAGIYCK77GO
         mJU0GhM6ZnnDHLlECxDstFsO3QsxUcaaaeplsxptiSt+Xx8+ygHH49rwVKrV0E3Ozeok
         fYI1hM9x6JA6e4EyqYRaJzLCr8wbCsxDD4lvR5KT70P6Aftwse+ZDFXk4kJMUZWDktUM
         osSqWZEI9aatiKBo2XFf5t9PAb2QfArb9xUpnrubUrAK3HW4TLIsE/EYULSGOmOrh6o3
         FMLfc10s4S2YxGULGQXUHHnA6h1tXku9v6uZ1mXsMNmprztT12cpu5/7Mtttc9ScrOBr
         vqXw==
X-Gm-Message-State: AOAM530HSIIKCL0Ih36mi5TmWQkR2p6TH+f5S2wh3hydu2NrUWwKurO5
        Rwjv8UPCZNBlDw93MrnER4Nx+w==
X-Google-Smtp-Source: ABdhPJxdcP6ReSyMv+HKPdVsVhGNdO0sIdrDv/CUnOM/Oelf9mArASvu0DbE6+jMNfeVV97a8kDh8w==
X-Received: by 2002:a02:9382:: with SMTP id z2mr21758038jah.120.1615175615725;
        Sun, 07 Mar 2021 19:53:35 -0800 (PST)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id g6sm5605242ilj.28.2021.03.07.19.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 19:53:35 -0800 (PST)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     shuah@kernel.org, valentina.manea.m@gmail.com,
        gregkh@linuxfoundation.org
Cc:     Shuah Khan <skhan@linuxfoundation.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, penguin-kernel@I-love.SAKURA.ne.jp,
        stable@vger.kernel.org
Subject: [PATCH 2/6] usbip: fix vhci_hcd to check for stream socket
Date:   Sun,  7 Mar 2021 20:53:27 -0700
Message-Id: <52712aa308915bda02cece1589e04ee8b401d1f3.1615171203.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1615171203.git.skhan@linuxfoundation.org>
References: <cover.1615171203.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix attach_store() to validate the passed in file descriptor is a
stream socket. If the file descriptor passed was a SOCK_DGRAM socket,
sock_recvmsg() can't detect end of stream.

Cc: stable@vger.kernel.org
Suggested-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/usb/usbip/vhci_sysfs.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
index 96e5371dc335..1e1ae9bd06ab 100644
--- a/drivers/usb/usbip/vhci_sysfs.c
+++ b/drivers/usb/usbip/vhci_sysfs.c
@@ -349,8 +349,16 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
 
 	/* Extract socket from fd. */
 	socket = sockfd_lookup(sockfd, &err);
-	if (!socket)
+	if (!socket) {
+		dev_err(dev, "failed to lookup sock");
 		return -EINVAL;
+	}
+	if (socket->type != SOCK_STREAM) {
+		dev_err(dev, "Expecting SOCK_STREAM - found %d",
+			socket->type);
+		sockfd_put(socket);
+		return -EINVAL;
+	}
 
 	/* now need lock until setting vdev status as used */
 
-- 
2.27.0


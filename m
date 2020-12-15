Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D89AA2DB0C5
	for <lists+linux-usb@lfdr.de>; Tue, 15 Dec 2020 17:03:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730478AbgLOQBo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Dec 2020 11:01:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730709AbgLOP6D (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Dec 2020 10:58:03 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A5ADC0617B0
        for <linux-usb@vger.kernel.org>; Tue, 15 Dec 2020 07:57:22 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id t16so20364183wra.3
        for <linux-usb@vger.kernel.org>; Tue, 15 Dec 2020 07:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wQ1Nj9fFgzAFnX7YMGZ99IfqwZhx1clfgvERaYbHZJI=;
        b=OA+2GyVSPZE0QBChP1z2Pinzj9r/61dxBzRzglL+/lvmoVKSWYFWSm2R2cv0rUedm4
         teyC7vcpyb+9yuJDFylOFkhM33QCHDks/9xnlkF8+x6AyKf6kdiLyCvNIEQ5+Pr654/R
         4GxvUIKluBb9zpTXr02K7oj77duJeVr55oeaWf3hrJvACwpC42aC5lKkoTSP0rqLSOdD
         cLvHjsfiFmmfb+bxfXEcJSylEomf8gAwTRv9/iaYo8dzAcHgYcr0rv6awK/c6umjyt+X
         9CmgetjUjfq34FBPjWAO+kyLsTOltkG+GngmMGUL2juEfd2DHk6XibwB5/dIgt5A3Zre
         fqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wQ1Nj9fFgzAFnX7YMGZ99IfqwZhx1clfgvERaYbHZJI=;
        b=kWtPqXRxGlS51Bac8wQKT8ncv+5zB/XyGn0zGWAI70dz2Kf5GG95sY0DRWnqLcIWO+
         YZyd/Sh8JMtO3mFf2IgRLNlEtpg7JZD8Nz/w38kBazzcdp2xuY88eAjj7gqxe3gnng84
         z0XtmXmjHigPkD/QsqR8UeaSemaWlrhn3hUBEv96o6KLVg5BvlsQIGJj6WLAiA6cKtOI
         1/ZTMvxGQPopaVRdD6TwatY+hnnGsqDCbU5S4FO897Td/lR8tcD0h7uDyTcEcbUENi3Z
         IhEQVRzh3SokYnkuU1z1E18MzzAxN38uuBEihiPmLkepFKgyhpnJ6qw3vfi/O0iXyRsZ
         F+IA==
X-Gm-Message-State: AOAM533/PREAyfODJrQEuoR3L30x8yinp9giqbBhZBTOy46FY+Hu/vAw
        7PtH9LZgIP82mJSJvB5Rkg4=
X-Google-Smtp-Source: ABdhPJy2COTvX1vhWgQ5ELN/HHRtMKJtWtKBSjGx3LDqcfn15X2yc4CpptzgE02CdBIP/7wE7xTbSg==
X-Received: by 2002:a5d:4a06:: with SMTP id m6mr35858526wrq.189.1608047841180;
        Tue, 15 Dec 2020 07:57:21 -0800 (PST)
Received: from egonzo.toto.net.toto.net ([88.123.121.14])
        by smtp.gmail.com with ESMTPSA id c10sm38792018wrb.92.2020.12.15.07.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 07:57:20 -0800 (PST)
From:   Dave Penkler <dpenkler@gmail.com>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     guido.kiener@rohde-schwarz.com, john.harvey@non.keysight.com,
        jian-wei_wu@keysight.com, gabe.jones@ni.com, dpenkler@gmail.com
Subject: [PATCH 2/4] USB: usbtmc: Add USBTMC_IOCTL_GET_STB
Date:   Tue, 15 Dec 2020 16:56:19 +0100
Message-Id: <20201215155621.9592-3-dpenkler@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215155621.9592-1-dpenkler@gmail.com>
References: <20201215155621.9592-1-dpenkler@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This new ioctl reads the status byte (STB) from the device and returns
the STB unmodified to the application. The srq_asserted bit is not taken
into account and not changed.

This ioctl is useful to support non USBTMC-488 compliant devices.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
Reviewed-by: Guido Kiener <guido.kiener@rohde-schwarz.com>
Tested-by: Jian-Wei Wu <jian-wei_wu@keysight.com>
---
 drivers/usb/class/usbtmc.c   | 6 ++++++
 include/uapi/linux/usb/tmc.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
index 189f06dcb7d3..8918e2182eca 100644
--- a/drivers/usb/class/usbtmc.c
+++ b/drivers/usb/class/usbtmc.c
@@ -2149,6 +2149,12 @@ static long usbtmc_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 			file_data->auto_abort = !!tmp_byte;
 		break;
 
+	case USBTMC_IOCTL_GET_STB:
+		retval = usbtmc_get_stb(file_data, &tmp_byte);
+		if (retval > 0)
+			retval = put_user(tmp_byte, (__u8 __user *)arg);
+		break;
+
 	case USBTMC_IOCTL_CANCEL_IO:
 		retval = usbtmc_ioctl_cancel_io(file_data);
 		break;
diff --git a/include/uapi/linux/usb/tmc.h b/include/uapi/linux/usb/tmc.h
index fdd4d88a7b95..1e7878fe591f 100644
--- a/include/uapi/linux/usb/tmc.h
+++ b/include/uapi/linux/usb/tmc.h
@@ -102,6 +102,8 @@ struct usbtmc_message {
 #define USBTMC_IOCTL_MSG_IN_ATTR	_IOR(USBTMC_IOC_NR, 24, __u8)
 #define USBTMC_IOCTL_AUTO_ABORT		_IOW(USBTMC_IOC_NR, 25, __u8)
 
+#define USBTMC_IOCTL_GET_STB            _IOR(USBTMC_IOC_NR, 26, __u8)
+
 /* Cancel and cleanup asynchronous calls */
 #define USBTMC_IOCTL_CANCEL_IO		_IO(USBTMC_IOC_NR, 35)
 #define USBTMC_IOCTL_CLEANUP_IO		_IO(USBTMC_IOC_NR, 36)
-- 
2.29.2


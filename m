Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5048B2DB0C6
	for <lists+linux-usb@lfdr.de>; Tue, 15 Dec 2020 17:03:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730510AbgLOQBp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Dec 2020 11:01:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730711AbgLOP6E (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Dec 2020 10:58:04 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F623C06138C
        for <linux-usb@vger.kernel.org>; Tue, 15 Dec 2020 07:57:24 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id d13so2112591wrc.13
        for <linux-usb@vger.kernel.org>; Tue, 15 Dec 2020 07:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V39UoMYaoTkTDqn5dsE6514lVOSQVxJuzNZrRAktrsU=;
        b=olomyCo78CGfCdjlS0zLov3C5hitUgEWI6h5uYOGGyTitPtABiQFQyVvCfpcnow2x4
         5+nM+l+VJ7STDMCTWtDaTXgESL9EZJ/HPVtwL28uydNIT2hQ8j4n0oJLseNAlT5pxuj6
         rhkaJA1FTO7u0nNSy5xZ7zNNcIryY96/giGlOPyACM9u1ugHHH9D/0QadlOPe7cBxU/A
         TSHGvcAm94q3y6l1tXVj4p8MLFYAh2YehL1s0RFPjfhT3YskU1wnBFWoV4GZXgQNZu+I
         wZU25IQxtaXH00Sh7/AtOr/C1oeG3BdVxpjaunUBeeEDusNJMhX4hGJFckTcJ7inqAeB
         juIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V39UoMYaoTkTDqn5dsE6514lVOSQVxJuzNZrRAktrsU=;
        b=umWtQWVj0XYCCsVM0wHjB3MoI3AnwW0fE+eRdURnBoIWGn4pIPrVM5H2NYNzQNRFP8
         OXrfd/nhI4hdHxKpPUou68UH3vN81wukdKJ/RU+2fd1cLTp3c4jnN/5GAz6luaS1WEId
         Sq9cdz1XYzVQHKmIX5Ez2xTjW3uBTdBDqfE0K7dig4QJgAY7UeF3JOfkVeTrNm8YS582
         HEj8224c8qSwMHyVzu8dBZ5IuYy74/BZYdsmDeLWwRHN8cPLwKz3AmI3rmxxygMdgJwJ
         KWPt92zlGQR4r06SiPjJAOMKXOChm57/JqnBB0YzC0j+HiM5E9gxINO8nVvrxazs7ip9
         KNvg==
X-Gm-Message-State: AOAM531DodqaoRE31CvAN5CvcXn7XBLAsm56xR4rBKabeWC9bj6ETh2/
        kYkKEuSMeMqefvsVB6uexwc=
X-Google-Smtp-Source: ABdhPJy96tltN65Haa2PTWAsWAIUDH6sod/DkQno968BY6LXGS6eioqSQWXWlyav/Zped6O5hh/v4g==
X-Received: by 2002:a5d:464b:: with SMTP id j11mr34645678wrs.227.1608047842817;
        Tue, 15 Dec 2020 07:57:22 -0800 (PST)
Received: from egonzo.toto.net.toto.net ([88.123.121.14])
        by smtp.gmail.com with ESMTPSA id c10sm38792018wrb.92.2020.12.15.07.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 07:57:22 -0800 (PST)
From:   Dave Penkler <dpenkler@gmail.com>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     guido.kiener@rohde-schwarz.com, john.harvey@non.keysight.com,
        jian-wei_wu@keysight.com, gabe.jones@ni.com, dpenkler@gmail.com
Subject: [PATCH 3/4] USB: usbtmc: Add separate USBTMC_IOCTL_GET_SRQ_STB
Date:   Tue, 15 Dec 2020 16:56:20 +0100
Message-Id: <20201215155621.9592-4-dpenkler@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215155621.9592-1-dpenkler@gmail.com>
References: <20201215155621.9592-1-dpenkler@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This new ioctl only returns the status byte (STB) that was originally
sent by the device due to a service request (SRQ) condition.

This ioctl checks the srq_asserted bit of the associated file
descriptor. If set, the srq_asserted bit is reset and the cached
STB with original SRQ information is returned. Otherwise the ioctl
returns the error code ENOMSG.

This ioctl is useful to support non USBTMC-488 compliant devices.
Time sensitive applications can read the cached STB without incurring
the cost of an urb transaction over the bus.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
Reviewed-by: Guido Kiener <guido.kiener@rohde-schwarz.com>
Tested-by: Jian-Wei Wu <jian-wei_wu@keysight.com>
---
 drivers/usb/class/usbtmc.c   | 31 +++++++++++++++++++++++++++++++
 include/uapi/linux/usb/tmc.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
index 8918e2182eca..d2fcc698c745 100644
--- a/drivers/usb/class/usbtmc.c
+++ b/drivers/usb/class/usbtmc.c
@@ -571,6 +571,32 @@ static int usbtmc488_ioctl_read_stb(struct usbtmc_file_data *file_data,
 
 }
 
+static int usbtmc_ioctl_get_srq_stb(struct usbtmc_file_data *file_data,
+				void __user *arg)
+{
+	struct usbtmc_device_data *data = file_data->data;
+	struct device *dev = &data->intf->dev;
+	int srq_asserted = 0;
+	__u8 stb = 0;
+	int rv;
+
+	spin_lock_irq(&data->dev_lock);
+	srq_asserted  = atomic_xchg(&file_data->srq_asserted, srq_asserted);
+
+	if (srq_asserted) {
+		stb = file_data->srq_byte;
+		spin_unlock_irq(&data->dev_lock);
+		rv = put_user(stb, (__u8 __user *)arg);
+	} else {
+		spin_unlock_irq(&data->dev_lock);
+		rv = -ENOMSG;
+	}
+
+	dev_dbg(dev, "stb:0x%02x with srq received %d\n", (unsigned int)stb, rv);
+
+	return rv;
+}
+
 static int usbtmc488_ioctl_wait_srq(struct usbtmc_file_data *file_data,
 				    __u32 __user *arg)
 {
@@ -2155,6 +2181,11 @@ static long usbtmc_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 			retval = put_user(tmp_byte, (__u8 __user *)arg);
 		break;
 
+	case USBTMC_IOCTL_GET_SRQ_STB:
+		retval = usbtmc_ioctl_get_srq_stb(file_data,
+						  (void __user *)arg);
+		break;
+
 	case USBTMC_IOCTL_CANCEL_IO:
 		retval = usbtmc_ioctl_cancel_io(file_data);
 		break;
diff --git a/include/uapi/linux/usb/tmc.h b/include/uapi/linux/usb/tmc.h
index 1e7878fe591f..d791cc58a7f0 100644
--- a/include/uapi/linux/usb/tmc.h
+++ b/include/uapi/linux/usb/tmc.h
@@ -103,6 +103,7 @@ struct usbtmc_message {
 #define USBTMC_IOCTL_AUTO_ABORT		_IOW(USBTMC_IOC_NR, 25, __u8)
 
 #define USBTMC_IOCTL_GET_STB            _IOR(USBTMC_IOC_NR, 26, __u8)
+#define USBTMC_IOCTL_GET_SRQ_STB        _IOR(USBTMC_IOC_NR, 27, __u8)
 
 /* Cancel and cleanup asynchronous calls */
 #define USBTMC_IOCTL_CANCEL_IO		_IO(USBTMC_IOC_NR, 35)
-- 
2.29.2


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A523BDBCCF
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2019 07:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406851AbfJRFUF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Oct 2019 01:20:05 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41334 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbfJRFUE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Oct 2019 01:20:04 -0400
Received: by mail-pg1-f194.google.com with SMTP id t3so2676457pga.8
        for <linux-usb@vger.kernel.org>; Thu, 17 Oct 2019 22:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=b6Qjq8AUYqxvUIoRvUfuNcrTuVzAtoJKx0iC24h3W6Q=;
        b=qsRzvoy+sgdccSc/9lY7QPJLY+I/HimHOBY016sU94Cf2HM40sF0dcya5pCRvmxn1n
         JbHCmzGOB/rnlf8PdZzH3reIznLJACJTxLBo7SFplhEx+Fvr4QYvNjjiQxWEtSHV8Ifm
         8zkep2HSObXq8nqkSUaKC72vjy2zaltjDUgU/dzy3vrIc0mCpCeUqkbmWzjUDx8hn+nV
         XWOcYuDTrFosjDfv2ryrBz6aGf/Lufoc8aWnm7yLH+TLVg0xMndVRu4QVXMAyEFTzku9
         1sLKILfWG/HgcdQWvYCa1BmjmCxd+D3/vjy4Ic3/YLsg2kDONmrU4+y0TPhCCo7PQWxx
         lSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=b6Qjq8AUYqxvUIoRvUfuNcrTuVzAtoJKx0iC24h3W6Q=;
        b=U4SsxoXTrafQOexRZUq8K0nRQTvp7h6NpH6zYTBzffrJoNm6+CixOjALHyD+ajri5A
         Hi6dvWE7BFINg//khw10s8bRaINyMfT/7dUcGZAE6XxorpCc31O0EejgZtgUaIvqTsGA
         X+yMqKPeDYLmGs9sWwULBI0dAiCnwNm1AGBzXrhXa+zqY7UXjG6bIVqBQC3QiHSmJoeH
         RTeZZOuY13+swMAyywvhJ6EGDidzhh29BjFTErUGKOZhPrq7ea9qcBFwTUcmkXTTGDFA
         /ONo7d+sUAEyBnqF2FvP5/2KinV0CevejD8jbp7+WyMJFRWF5AUZDd8OkCxwEJABBkz8
         2ueQ==
X-Gm-Message-State: APjAAAWBJw4z09pgJV3xjnnt9gtzJzLaJIPSblQtoLClcqQlcji3MIA/
        ahi5sNrnkL9txY+c94Ke4ThFrho8yDLgQA==
X-Google-Smtp-Source: APXvYqwFwUZeFChu7WpLEw16VuxL9InaC08dTKbSTOfjeDZJqJRRSS+JpoQoNN3a+wpZ+KYoaSO0sw==
X-Received: by 2002:a63:7845:: with SMTP id t66mr7583920pgc.31.1571368950729;
        Thu, 17 Oct 2019 20:22:30 -0700 (PDT)
Received: from goorm.ap-northeast-2.compute.internal (ec2-13-125-234-98.ap-northeast-2.compute.amazonaws.com. [13.125.234.98])
        by smtp.gmail.com with ESMTPSA id ev20sm3841105pjb.19.2019.10.17.20.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 20:22:29 -0700 (PDT)
From:   GwanYeong Kim <gy741.kim@gmail.com>
To:     valentina.manea.m@gmail.com
Cc:     shuah@kernel.org, gregkh@linuxfoundation.org, allison@lohutok.net,
        opensource@jilayne.com, changcheng.liu@intel.com,
        tglx@linutronix.de, linux-usb@vger.kernel.org,
        GwanYeong Kim <gy741.kim@gmail.com>
Subject: [PATCH v3] usbip: tools: Fix read_usb_vudc_device() error path handling
Date:   Fri, 18 Oct 2019 03:22:23 +0000
Message-Id: <20191018032223.4644-1-gy741.kim@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <948530c4-0f42-1244-faee-aad531074bf3@kernel.org>
References: <948530c4-0f42-1244-faee-aad531074bf3@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This isn't really accurate right. fread() doesn't always
return 0 in error. It could return < number of elements
and set errno.

Signed-off-by: GwanYeong Kim <gy741.kim@gmail.com>
---
 tools/usb/usbip/libsrc/usbip_device_driver.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c b/tools/usb/usbip/libsrc/usbip_device_driver.c
index 051d7d3f443b..927a151fa9aa 100644
--- a/tools/usb/usbip/libsrc/usbip_device_driver.c
+++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
@@ -69,7 +69,7 @@ int read_usb_vudc_device(struct udev_device *sdev, struct usbip_usb_device *dev)
 	FILE *fd = NULL;
 	struct udev_device *plat;
 	const char *speed;
-	int ret = 0;
+	size_t ret;
 
 	plat = udev_device_get_parent(sdev);
 	path = udev_device_get_syspath(plat);
@@ -79,8 +79,10 @@ int read_usb_vudc_device(struct udev_device *sdev, struct usbip_usb_device *dev)
 	if (!fd)
 		return -1;
 	ret = fread((char *) &descr, sizeof(descr), 1, fd);
-	if (ret < 0)
+	if (ret != 1) {
+		err("Cannot read vudc device descr file: %s", strerror(errno));
 		goto err;
+	}
 	fclose(fd);
 
 	copy_descr_attr(dev, &descr, bDeviceClass);
-- 
2.17.1


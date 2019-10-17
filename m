Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93B90DA3AB
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2019 04:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404268AbfJQCZT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Oct 2019 22:25:19 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41758 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727328AbfJQCZT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Oct 2019 22:25:19 -0400
Received: by mail-pg1-f194.google.com with SMTP id t3so375080pga.8
        for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2019 19:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HiTb1lGMW2hDjeX1w1W4dB5NOv9bAsByUoSi2ucDFlY=;
        b=ix9tACCneSBCKeIVNoba8KcFLtiMSmMN5UAPagEhhHzVBxigG2t4ljoQortWb3UqTC
         zbnyOLLlbshpWTbusWPen5jp0Rcv/sTUR/lWn5W+EHUqLZT3ToEV45+cxcbFF2qDVRpA
         /cDIIfUnpVnmjQYqh9gcpOn/UIX3YWXI2LeOJKcvGzK+dilVMr7Ip30uPws1k1oBE/oO
         slSY9yg9JxFNmdM3riB5SHsUzK4HRNkH6C7yx1byWApO01Piru1a95KJAobjgQCWqws+
         ps/3qvrDRktTv9B+HsW1sNqmViiY3FvOtzxgz+F8wKKRz9HpHxHdVli85DGaFIS382FN
         Q+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HiTb1lGMW2hDjeX1w1W4dB5NOv9bAsByUoSi2ucDFlY=;
        b=qSoalYN5fCrBxpPwu2lj9R+zkbx0lbUH2+214VaaghyGAtbfrBtgh8eOMTSERclhjM
         cBmltq1MLdiFLPqKLVRgD8ILGkMTBIMzSzXx1K0IMgfJ9ixIAGxzPXksILSUYQ/2dphw
         noFKcPYaPtr0xjzLCCSUZu95uYUZDBejddMY1Xi66HFOwF0cpztObgFQvaeh4cUTdh/0
         qTl1eN89Apm5a6u+PV1IsHCywy7qgtzFOTQwLC1PXxzzLHPU1hH80nvx/e2OzdFb80Bb
         852uuhm1PYJ8spzs52nuvSFF4eBFlxQjO42bJUFGPwO+Y4vNr23Q4JQ/QF1FdA7hwYFf
         fwsQ==
X-Gm-Message-State: APjAAAW4PFZAHy+7PqFW0D1Hz5eUwcWizOGQnctgeoFNHBKg2RKCXZHV
        tdmxLGQMgLPoB3ajRpcpKl8=
X-Google-Smtp-Source: APXvYqzcPEZJa6fpVkMD6j9SWHln2Zp6Ayeu10YNeEsGw4iTMMzSMZEV8Ff720YGkU7KPu/UBiiXNw==
X-Received: by 2002:a63:f904:: with SMTP id h4mr1449932pgi.80.1571279118501;
        Wed, 16 Oct 2019 19:25:18 -0700 (PDT)
Received: from goorm.ap-northeast-2.compute.internal (ec2-52-78-194-131.ap-northeast-2.compute.amazonaws.com. [52.78.194.131])
        by smtp.gmail.com with ESMTPSA id k9sm449980pfk.72.2019.10.16.19.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 19:25:17 -0700 (PDT)
From:   GwanYeong Kim <gy741.kim@gmail.com>
To:     valentina.manea.m@gmail.com
Cc:     shuah@kernel.org, gregkh@linuxfoundation.org, allison@lohutok.net,
        opensource@jilayne.com, changcheng.liu@intel.com,
        tglx@linutronix.de, linux-usb@vger.kernel.org,
        GwanYeong Kim <gy741.kim@gmail.com>
Subject: [PATCH v2] usbip: tools: Fix read_usb_vudc_device() error path handling
Date:   Thu, 17 Oct 2019 02:25:12 +0000
Message-Id: <20191017022512.3809-1-gy741.kim@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191016131832.GC56859@kroah.com>
References: <20191016131832.GC56859@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

cannot be less than 0 - fread() returns 0 on error.

Signed-off-by: GwanYeong Kim <gy741.kim@gmail.com>
---
 tools/usb/usbip/libsrc/usbip_device_driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c b/tools/usb/usbip/libsrc/usbip_device_driver.c
index 051d7d3f443b..959bb29d0477 100644
--- a/tools/usb/usbip/libsrc/usbip_device_driver.c
+++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
@@ -69,7 +69,7 @@ int read_usb_vudc_device(struct udev_device *sdev, struct usbip_usb_device *dev)
 	FILE *fd = NULL;
 	struct udev_device *plat;
 	const char *speed;
-	int ret = 0;
+	size_t ret = 0;
 
 	plat = udev_device_get_parent(sdev);
 	path = udev_device_get_syspath(plat);
@@ -79,7 +79,7 @@ int read_usb_vudc_device(struct udev_device *sdev, struct usbip_usb_device *dev)
 	if (!fd)
 		return -1;
 	ret = fread((char *) &descr, sizeof(descr), 1, fd);
-	if (ret < 0)
+	if (ret != 1)
 		goto err;
 	fclose(fd);
 
-- 
2.17.1


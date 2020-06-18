Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B77DD1FDA14
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jun 2020 02:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbgFRAJ7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Jun 2020 20:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726815AbgFRAJ7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Jun 2020 20:09:59 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBAA3C061755;
        Wed, 17 Jun 2020 17:09:58 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id b6so4165918wrs.11;
        Wed, 17 Jun 2020 17:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7inzO9UP28E4HK5AwcA3raikK65alSD3oW0aeo5vJ8Q=;
        b=VQgK0Voi5Rd+VMD1G1he8kf1cq2/l1jlOntXtu5XYIEhnk1vvRF9HZ4jkEtWL8ZOPr
         wr+KlOAc60I9RfiEUIfB2VD8ASwSpk7y6lxYbMIqS2OUyOORj4SjrZ0ph4b8QW46xjE+
         avINlHybFMgc1r823bjndK4AyxEyxX1scwBj25QC+d3Qvw/S2bo7w54jQj2jjjMGiOOK
         YwsNa5crWyVT9Of0vIjrEQF5MTCEvp7r/iMwOSBHnFJk6+El6bWqTkUxzAluQS12mJ9i
         UEXknWnJlQskZpmnC2lfkF2Y1znSSw2aNn4j5nFOu3DrhhEH0ESqMs9KGnlbldMHAa8s
         iicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7inzO9UP28E4HK5AwcA3raikK65alSD3oW0aeo5vJ8Q=;
        b=fWwC/JfkeqQZnk8yYm87zSrwAm4cibAwIVoh0/nry5SooxzzPh8QVSjpTcC02FDyYd
         2NYM0QT75W7nor74WLIrfHmMprCqOHUYm2Ekl3yTWy82x3Oj5P0EjG0Q8qEY8hK+dCy4
         P2EMwDpU5xlUEb9HMtxTrlSqxCIUaCqfZFayoAHG/rcOouIisOOs3CGv8YM7DNFWDxaI
         Rs2wzszKlcDR/qwUZACro/6LTwvTguFTkPkWRvE7VThVMJBrxz4UcBuGY/HrfFebQCTB
         7aSEI/bsb35tZQzTqSFsElBJSnKPJegeAwA8kU2iDB0W907rZlECjZCxRZ+n5P1AIHXq
         1Yxg==
X-Gm-Message-State: AOAM530IdaPUGQz9Y5udZY8JJEcqcQkWtrcLn+VCFymMs1uGIz6Gsra+
        IRUlyB+RsUB02EIuYxEen5g=
X-Google-Smtp-Source: ABdhPJz4mlf12mzHC4iJV7r76PCJF/kBpg9ri/XcA2x2wsWVKl+4aQx8JlfIVL/L1qZEgSzo71L4fw==
X-Received: by 2002:adf:e749:: with SMTP id c9mr1844369wrn.25.1592438997519;
        Wed, 17 Jun 2020 17:09:57 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:4cc:a210:8e70:5aff:fe7e:da0a])
        by smtp.gmail.com with ESMTPSA id h203sm905252wme.37.2020.06.17.17.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 17:09:57 -0700 (PDT)
From:   Antonio Borneo <borneo.antonio@gmail.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hewenliang <hewenliang4@huawei.com>, linux-usb@vger.kernel.org
Cc:     Antonio Borneo <borneo.antonio@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] usbip: tools: fix build error for multiple definition
Date:   Thu, 18 Jun 2020 02:08:44 +0200
Message-Id: <20200618000844.1048309-1-borneo.antonio@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

With GCC 10, building usbip triggers error for multiple definition
of 'udev_context', in:
- libsrc/vhci_driver.c:18 and
- libsrc/usbip_host_common.c:27.

Declare as extern the definition in libsrc/usbip_host_common.c.

Signed-off-by: Antonio Borneo <borneo.antonio@gmail.com>
---
 tools/usb/usbip/libsrc/usbip_host_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/usb/usbip/libsrc/usbip_host_common.c b/tools/usb/usbip/libsrc/usbip_host_common.c
index d1d8ba2a4a40..ca78aa368476 100644
--- a/tools/usb/usbip/libsrc/usbip_host_common.c
+++ b/tools/usb/usbip/libsrc/usbip_host_common.c
@@ -23,7 +23,7 @@
 #include "list.h"
 #include "sysfs_utils.h"
 
-struct udev *udev_context;
+extern struct udev *udev_context;
 
 static int32_t read_attr_usbip_status(struct usbip_usb_device *udev)
 {
-- 
2.27.0


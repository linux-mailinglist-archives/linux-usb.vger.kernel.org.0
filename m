Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2FC8DFCA
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2019 23:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729457AbfHNV3d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Aug 2019 17:29:33 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38506 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726585AbfHNV3c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Aug 2019 17:29:32 -0400
Received: by mail-pg1-f194.google.com with SMTP id e11so242473pga.5
        for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2019 14:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegavinli.com; s=google;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MMm/ExH9rvgx4TnsyL2M9+UyYSLrKGK1rytt1mCW+D4=;
        b=C13o7xx1THEHMIQr0YB8fXhJNXXrH3BQaxa4AOjGFVmHlxtUxMwwFRuELNxZPCjg9J
         okbJSJv7z8Km2J85QkuqFpqUpeijZfW1baB/GpQmQEWx7wLhMBbXnf+boSmtDBZZUQvl
         omMGvNmnRO9xXfFdCZJ2sp6de5gj41EsEbWQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=MMm/ExH9rvgx4TnsyL2M9+UyYSLrKGK1rytt1mCW+D4=;
        b=nQB8mHxink75xQK8WhVHvSg8PVDM0glhnzROFF2iJTLFx3XGhbTW9cYyFYCTMcaVCc
         qFQUGLDMwzGm1i2T4Vdq44xWEeZXfH2BEnrx4afRfmUtNhv++aUXu11xZDNfrdCHLp+M
         1GvqN4AqmAjb1TtesPdkwlAbJuEnC9pwIK5lxqLwl27qXfaPDQbQ5vrAfQRKfWLjBI49
         2cKX0rGquuxGHvyzQ1Slw2NxiVV7z45NQbFezbqbdptLZ0vFUCZmAiqZmTBuvXrT6rPY
         cxgtLSWSRqWGpuAOOaz0KWGTF59jlvz/+Usyt3OCOTynZWPHuaOIZWr90dOrQ6k+X2ne
         uJCQ==
X-Gm-Message-State: APjAAAXb38DXlHN0Ts9OIKpafpWCLPaSyNpohTSUm7HSOzbLDcNUAa25
        exH4AFy7MtqGM3WFw5ZEA9zFxrcY4DA=
X-Google-Smtp-Source: APXvYqzKBhjLfxonv4rgLvtSTQGrQsSbm4qCBfoJKzUlTcyggAHWc+nyxqTrl8nV+EqYxb4HEZZyKw==
X-Received: by 2002:a63:6c46:: with SMTP id h67mr1016699pgc.248.1565818171724;
        Wed, 14 Aug 2019 14:29:31 -0700 (PDT)
Received: from mtgav.corp.matician.com ([2601:647:5a01:84c0::a53])
        by smtp.gmail.com with ESMTPSA id t23sm834402pfl.154.2019.08.14.14.29.29
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 14 Aug 2019 14:29:30 -0700 (PDT)
From:   gavinli@thegavinli.com
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Gavin Li <git@thegavinli.com>
Subject: [PATCH] usb: usbfs: only account once for mmap()'ed usb memory usage
Date:   Wed, 14 Aug 2019 14:29:24 -0700
Message-Id: <20190814212924.10381-1-gavinli@thegavinli.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Gavin Li <git@thegavinli.com>

Memory usage for USB memory allocated via mmap() is already accounted
for at mmap() time; no need to account for it again at submiturb time.

Signed-off-by: Gavin Li <git@thegavinli.com>
---
 drivers/usb/core/devio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index bbe9c2edd3e7..9681dd55473b 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -1603,7 +1603,8 @@ static int proc_do_submiturb(struct usb_dev_state *ps, struct usbdevfs_urb *uurb
 	if (as->usbm)
 		num_sgs = 0;
 
-	u += sizeof(struct async) + sizeof(struct urb) + uurb->buffer_length +
+	u += sizeof(struct async) + sizeof(struct urb) +
+	     (as->usbm ? 0 : uurb->buffer_length) +
 	     num_sgs * sizeof(struct scatterlist);
 	ret = usbfs_increase_memory_usage(u);
 	if (ret)
-- 
2.22.0


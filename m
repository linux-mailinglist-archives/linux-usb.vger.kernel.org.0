Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3A35215884
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 15:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729341AbgGFNeL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 09:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729336AbgGFNeK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 09:34:10 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D10BBC061794
        for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2020 06:34:09 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id 17so42074031wmo.1
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 06:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=atQQd6B48grrwp+3FZv95LUICx56wwJRa1SpQXxMQxY=;
        b=w6hRYUO7YyVcZnrxkVQcL9i+DIcegwSxOpJpusHM7ek+/DIU5QwFI/PAYc6YFHkaCT
         k8FRF534bpubL0B0OmFF5oq6wY03Rw6yEomh35Tmx6FPDE/waGSczpU5Cgzrn5Uju7Cc
         bCaXLGQifZRD/R4nbrn64owZsuCBcCb1EC0ImDhAGAXd/cc+WlULEQCijrABf+IpaKDT
         3EKntJe03seySO6FPX3ZDocV61TFxZ1D1a4x8qhefwdg2zdjfgFY86PiagDVLamwPJy8
         Cryz85XcxwCCMuv2nwLw+AXH9YXajlbSNY8nVxl/zMp1+gxb+292tL9mvtsS+CABRwnw
         YPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=atQQd6B48grrwp+3FZv95LUICx56wwJRa1SpQXxMQxY=;
        b=XeDxVn4Jxf40Yo2IaX/7zmE9EBPTT1GY4vXIrwYXHptikC6GB4bx6bNgxAUzEU6Vje
         +Uq7pwyjAn+xTTW+EIFVSVcz0QHllixRE0sFGrksU/EgDia+0uOHJLgw2DYnK5CpLNps
         803XM4TiH8jXt57/GJGCcgXY1dEHrPIW4S+KmAjVb1r07RPwt3wRIRqdOVzvvj/Zu/dR
         Y5M9xKh9kKcgXzsxFVPFI6ZoaOTz+PtGkUqK0+Vm0zBgorfG/LxJA5Vh2qHakxV6BlyY
         EoYQZkFaW9Q6b1uKSWgeYtX6x6IotE29wBLT5oKbahV9L+65QzLwsm5XmInNkXy7skDB
         QtWg==
X-Gm-Message-State: AOAM533bzH6alN79gsfaQBb7GRa34RA28KIdKwbOmzdps4CvVvif6rno
        DHPHn9A8zNsTFPCGGcyELjRnjA==
X-Google-Smtp-Source: ABdhPJwn3KSyjv54N4scU2QXm9bSuHZxzD4jVab9Us5MgbW3y2o+Nt2CodWPVpAjqv1powTZgDaF9Q==
X-Received: by 2002:a1c:ed0b:: with SMTP id l11mr2416931wmh.121.1594042448527;
        Mon, 06 Jul 2020 06:34:08 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id v18sm25416082wrv.49.2020.07.06.06.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 06:34:07 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Chuhong Yuan <hslester96@gmail.com>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        Felix Fietkau <nbd@openwrt.org>, Michael Buesch <m@bues.ch>
Subject: [PATCH 20/32] usb: host: bcma-hcd: Demote obvious misuse of kerneldoc to standard comment blocks
Date:   Mon,  6 Jul 2020 14:33:29 +0100
Message-Id: <20200706133341.476881-21-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200706133341.476881-1-lee.jones@linaro.org>
References: <20200706133341.476881-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

No attempt has been made to document either of the demoted functions here.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/host/bcma-hcd.c:180: warning: Function parameter or member 'usb_dev' not described in 'bcma_hcd_usb20_old_arm_init'
 drivers/usb/host/bcma-hcd.c:268: warning: Function parameter or member 'bcma_hcd' not described in 'bcma_hcd_usb20_ns_init'

Cc: Chuhong Yuan <hslester96@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Felix Fietkau <nbd@openwrt.org>
Cc: Michael Buesch <m@bues.ch>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/host/bcma-hcd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/bcma-hcd.c b/drivers/usb/host/bcma-hcd.c
index 652fa29beb273..b1b777f33521e 100644
--- a/drivers/usb/host/bcma-hcd.c
+++ b/drivers/usb/host/bcma-hcd.c
@@ -168,7 +168,7 @@ static void bcma_hcd_init_chip_mips(struct bcma_device *dev)
 	}
 }
 
-/**
+/*
  * bcma_hcd_usb20_old_arm_init - Initialize old USB 2.0 controller on ARM
  *
  * Old USB 2.0 core is identified as BCMA_CORE_USB20_HOST and was introduced
@@ -261,7 +261,7 @@ static void bcma_hcd_usb20_ns_init_hc(struct bcma_device *dev)
 	usleep_range(1000, 2000);
 }
 
-/**
+/*
  * bcma_hcd_usb20_ns_init - Initialize Northstar USB 2.0 controller
  */
 static int bcma_hcd_usb20_ns_init(struct bcma_hcd_device *bcma_hcd)
-- 
2.25.1


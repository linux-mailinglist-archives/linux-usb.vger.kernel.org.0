Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A123925C89F
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 20:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728949AbgICSRn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 14:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbgICSRm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Sep 2020 14:17:42 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2E6CC061244
        for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2020 11:17:41 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id u13so2792852pgh.1
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2020 11:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zPbBfYdRv19xF3sirA0d8CLfF89pzIdN85SmGePftxg=;
        b=DcLqkfolcDogOjHXTFh6eeQiN8y9U2e+niKgUvNbmSC9tAB4/4yMqGavUhhAKZgQos
         irics9Vy+xnoaFQl29crrMPhImX84fuyfcVrRUdiINkDy9T0siMlVIcWK7BOndv2LAyX
         1PDelL4Cu3TvZ+QcpP6k7SWrImF6JJI8T7Q62MnZCGuaeoN2VNgHwN8P2XcE/mqsZmtH
         Y4xxSTR83VqO760qYhkJCDq+qBzyNZ7upT8H6SYCaYK7i61re7Ep2RRkksk5TFLwbfI7
         fQ0fMKXhJhmFRLj2MyTSOO8NCBhXO1ltLSSuAOBtxIQunpPGDe5px/eWNIzI+LtQmfsF
         J6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zPbBfYdRv19xF3sirA0d8CLfF89pzIdN85SmGePftxg=;
        b=afJu4TUpIdGLZVUQGu57wWli/86TfnW09WBYKpeQZ4+Ovg1XAnhUGHbTRYvy99KwAh
         oKZH9NrRlymuJezBw8PyZHMB0fPVOQbL137h85QLShuKmKLdTKE974JmuJeR14f5tyj4
         y6p1C6KaDYL0g5e/dUvOX3UGgIkjE07XovkX0R94MC0cmwWWI5q53l2AWavbPc8/coXe
         VUETy/0oqsgrPdVKeY6SYuv6MvF+ng93NaNA1s2asEIW14fp5GYVMu1YS2QGeC53iUfu
         PjrPqTiSBa6OZj1YeIxGpLf1+5+Gjo8skVmUpr8HYivZJQI5p9tXdS05AB6A58HkPdVt
         Sh/w==
X-Gm-Message-State: AOAM531E1VChX/zrC78D6y1O2Whh96vcclT813Gxbh1erZCG7UeILJjq
        62j4ceYMU3zgB7FQsExGJh1wzJ68p3g=
X-Google-Smtp-Source: ABdhPJz5kSixLnik27wxO/GYEJXv4jmlyN306qUCqmMql4I6QvyVrGPM/73DpDsQrfZZ5FwO6evuKA==
X-Received: by 2002:a17:902:8c94:: with SMTP id t20mr4991702plo.76.1599157060947;
        Thu, 03 Sep 2020 11:17:40 -0700 (PDT)
Received: from localhost.localdomain ([161.81.62.213])
        by smtp.gmail.com with ESMTPSA id r91sm3228530pja.56.2020.09.03.11.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 11:17:40 -0700 (PDT)
From:   Tom Yan <tom.ty89@gmail.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        stern@rowland.harvard.edu, arnd@arndb.de
Cc:     cyrozap@gmail.com, yoshihiro.shimoda.uh@renesas.com,
        Tom Yan <tom.ty89@gmail.com>
Subject: [PATCH v6 3/3] uas: bump hw_max_sectors to 2048 blocks for SS or faster drives
Date:   Fri,  4 Sep 2020 02:17:25 +0800
Message-Id: <20200903181725.2931-3-tom.ty89@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903181725.2931-1-tom.ty89@gmail.com>
References: <20200903155438.GC663761@rowland.harvard.edu>
 <20200903181725.2931-1-tom.ty89@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There's no reason for uas to use a smaller value of max_sectors than
usb-storage.

Signed-off-by: Tom Yan <tom.ty89@gmail.com>
---
 drivers/usb/storage/uas.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index f4beeb8a8adb..c1123da43407 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -839,6 +839,8 @@ static int uas_slave_configure(struct scsi_device *sdev)
 		blk_queue_max_hw_sectors(sdev->request_queue, 64);
 	else if (devinfo->flags & US_FL_MAX_SECTORS_240)
 		blk_queue_max_hw_sectors(sdev->request_queue, 240);
+	else if (devinfo->udev->speed >= USB_SPEED_SUPER)
+		blk_queue_max_hw_sectors(sdev->request_queue, 2048);
 
 	blk_queue_max_hw_sectors(sdev->request_queue,
 		min_t(size_t, queue_max_hw_sectors(sdev->request_queue),
-- 
2.28.0


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5C825BDAB
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 10:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728311AbgICIq7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 04:46:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726493AbgICIq4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Sep 2020 04:46:56 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 461DAC061245
        for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2020 01:46:56 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id p37so1581955pgl.3
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2020 01:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zPbBfYdRv19xF3sirA0d8CLfF89pzIdN85SmGePftxg=;
        b=UOaNnRKrHosvVy0IieS+UZfI+QddwkluwiP6zVw1BR1peNVsB5TQvTCn4GuoMQziDX
         Ot87UTS5/FVRZ3oxSUBVORyIul4XuY2xQFXANcikjDqsjGMYA4Ms3BRijnAVJLOpF/Lw
         pmD7K85G+bDbU05SqanIjvPoZts948ZDyJE1VQjBBmvsf1/Q32xifH8cHF3WMBZj1zkO
         KZjNBcCJY9ToPoMdDfS2vRKCeUsy+kNEP7ceWHzQ3VVOP5rlu63CMAnH4ejrP5iRmhF4
         dvzYDjwrELmVd5GpnsC7oGLBzuhXqW0Wj3skU9Lpbk1gVgbE2lB8gt6VTgdnv85CNzhZ
         O5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zPbBfYdRv19xF3sirA0d8CLfF89pzIdN85SmGePftxg=;
        b=okvQwXhPngcnS4CEQ/vtooh341V4q+3LNnbw2id9heTxgODXLImIsZBNAiwCG+qXbT
         bHDSzhI4sM+CXYB6a9/jPHmKVTjs1iHsQlO48LIw9o9i4juugmSzV+JPbVT/Ym9XXGI7
         7XqF5dItUR8JUNDBeNea4lgz8wLJLYpwbaVPivMWnYgtYAx3r2vHS4D3gPZ/OeWo031i
         OHxYF7US2fq7ySxHROd3TbTFTsbjUYDVNaLdLgcJm5d2AJya/+xXe0d9quE9IfId5llo
         rnutl6+T4f+h9XPC6Mju9RfefnV+79GdXhw5Klp+hDke0B8RnXly/BHhLQ90PfPkL7sJ
         /9tg==
X-Gm-Message-State: AOAM533rOms8BN5OuhsKTADC1O2JGHoFYIKHQlqKft9M9Q+n/GKj4bv4
        hDEDDkIN4FlEeRftNxJfRvFRoNoUD38=
X-Google-Smtp-Source: ABdhPJxS5krGkKOL06lGpxa/6QnZAbx/5eHMpXkki7Q+nr9lq4lbs7uOEirjOrUlFJs8mmDY0zAXBg==
X-Received: by 2002:a63:1c18:: with SMTP id c24mr2139015pgc.30.1599122815543;
        Thu, 03 Sep 2020 01:46:55 -0700 (PDT)
Received: from localhost.localdomain ([161.81.62.213])
        by smtp.gmail.com with ESMTPSA id k5sm1840180pjq.5.2020.09.03.01.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 01:46:54 -0700 (PDT)
From:   Tom Yan <tom.ty89@gmail.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        stern@rowland.harvard.edu, arnd@arndb.de
Cc:     cyrozap@gmail.com, yoshihiro.shimoda.uh@renesas.com,
        Tom Yan <tom.ty89@gmail.com>
Subject: [PATCH v4 2/2] uas: bump hw_max_sectors to 2048 blocks for SS or faster drives
Date:   Thu,  3 Sep 2020 16:46:45 +0800
Message-Id: <20200903084645.287856-2-tom.ty89@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903084645.287856-1-tom.ty89@gmail.com>
References: <20200903083404.GA2169202@kroah.com>
 <20200903084645.287856-1-tom.ty89@gmail.com>
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


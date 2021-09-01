Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21D813FE23A
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 20:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345025AbhIASQZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 14:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345009AbhIASQY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Sep 2021 14:16:24 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67900C061764
        for <linux-usb@vger.kernel.org>; Wed,  1 Sep 2021 11:15:27 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso302043pjh.5
        for <linux-usb@vger.kernel.org>; Wed, 01 Sep 2021 11:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dicortech-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O5m3n2KfiOF0z1ugIvCOFASG1zCIwCs9jpr25aJGmWs=;
        b=ExUVvoyZPZPC7K9zJdW3B3e74cXZdIsFbmJdl8IZcu3Yu1+7Ua37VLI1RnkBeW7fJM
         5s4gYl6lrFPN70gMbKDcRZluxc9kPu2mungsQYsbnXKLabrm5NPUa+pBg/rUwoKFw9IG
         V0BbKmmz0j2seeTxvna6vA2AwQTM/bH25ENjcrc2TANxh30L1gc5WVEeoGGYVdI0N37T
         +3iu74AuSryylH0BFxXh4Zqo445bKEEPB61DHGpWAosqc4JbRkBbuqJ+SEe0btFOoREi
         PsUfw5XmbtQtbp1xe6MvRtNo2yOR3lueEmjGJGOgoBKGqDJ/iLGyQTzkx7bhgAJ40LVD
         8Ztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O5m3n2KfiOF0z1ugIvCOFASG1zCIwCs9jpr25aJGmWs=;
        b=AbHSV6dKiMGUbNWs5i4WP+pRziybQ0Kf+Uv+3GAc/UwWaLTrXHTm9W48N83uoR5aKx
         zDkAETf14xQMSiD/u0SFrB4b6Agp1jBLfYWu6uYig+q7yPwq6HN7q5BCw41gmn+D9CPN
         kb7CTPRWBcmUj1uPGsaYgvTpqJPcA6K+wtsuaFtNiViiNyUybU0DC8r4YF4P+PhmRu0N
         ddklG7tL3v2hXj9mt0R4Noxa7UQmKzOgL1NOuCwoa2slba+je8T5MiuZVyX5XG81tfdJ
         8blQowXjRkb+MmTjcxBxGlcGaZ1bX8CRqzxfK/2/DMkCYPOacDWgBb21AR7FAyEVDJ8r
         jgfQ==
X-Gm-Message-State: AOAM5300pWcL28ZjSX/Hbot4Q0Rs8yQDFnaOFXkieFZ4S+5wuf4yDMUJ
        r2+rlBIjKfqfImX+0FDgvpNqW1lGsU4NiA==
X-Google-Smtp-Source: ABdhPJwDunj/fIJylfS1RbQ7Rr1jvkzpbnvJxln7/LWX6GbBpyfR3p4i4xWAmYshbfMUo4MhUjRD3A==
X-Received: by 2002:a17:90b:2212:: with SMTP id kw18mr605175pjb.59.1630520126887;
        Wed, 01 Sep 2021 11:15:26 -0700 (PDT)
Received: from faizel.kb ([103.160.194.126])
        by smtp.gmail.com with ESMTPSA id y4sm156683pjw.57.2021.09.01.11.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 11:15:26 -0700 (PDT)
From:   Faizel K B <faizel.kb@dicortech.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, Faizel K B <faizel.kb@dicortech.com>
Subject: Re: [PATCH] usb: testusb: Fix for showing the connection speed
Date:   Wed,  1 Sep 2021 23:43:51 +0530
Message-Id: <20210901181351.131378-1-faizel.kb@dicortech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YS8V9Jz/MivXiaZc@kroah.com>
References: <YS8V9Jz/MivXiaZc@kroah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Signed-off-by: Faizel K B <faizel.kb@dicortech.com>
---
 tools/usb/testusb.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tools/usb/testusb.c b/tools/usb/testusb.c
index ee8208b2f946..69c3ead25313 100644
--- a/tools/usb/testusb.c
+++ b/tools/usb/testusb.c
@@ -265,12 +265,6 @@ static int find_testdev(const char *name, const struct stat *sb, int flag)
 	}
 
 	entry->ifnum = ifnum;
-
-	/* FIXME update USBDEVFS_CONNECTINFO so it tells about high speed etc */
-
-	fprintf(stderr, "%s speed\t%s\t%u\n",
-		speed(entry->speed), entry->name, entry->ifnum);
-
 	entry->next = testdevs;
 	testdevs = entry;
 	return 0;
@@ -299,6 +293,14 @@ static void *handle_testdev (void *arg)
 		return 0;
 	}
 
+	status  =  ioctl(fd, USBDEVFS_GET_SPEED, NULL);
+	if (status < 0)
+		fprintf(stderr, "USBDEVFS_GET_SPEED failed %d\n", status);
+	else
+		dev->speed = status;
+	fprintf(stderr, "%s speed\t%s\t%u\n",
+			speed(dev->speed), dev->name, dev->ifnum);
+
 restart:
 	for (i = 0; i < TEST_CASES; i++) {
 		if (dev->test != -1 && dev->test != i)
-- 
2.25.1


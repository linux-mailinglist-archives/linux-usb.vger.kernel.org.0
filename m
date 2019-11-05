Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53345EF771
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 09:42:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730545AbfKEImV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Nov 2019 03:42:21 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45330 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730216AbfKEImV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 03:42:21 -0500
Received: by mail-lf1-f66.google.com with SMTP id v8so14405148lfa.12
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2019 00:42:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=afgTwGT7brsAeSuOhWRZ7IqDVxGWSNG4jsxiRPhaQaE=;
        b=QAq6lsEriyCxG5sZ+g4sguFSiIbckvgL91HeiPNQIBVWVKGI1JEoBoPj50PCvoY4+7
         F4YWlWyYTEAT6oqerGs707Xe6S1FokI27cpL1xM7GKEeSDMUeCFTFgfRhfbHXN2e+G4Z
         3TSqN6SjP2CDcmNeEFMOYNtrgSV40AqfwbLo1/7UzyP82YXatZS/fwB3iz+P5MvhCYGx
         k6O19VHxHhpLw0+87TJHUZtmkI/uf3ttnPBR9Gr01MBMrgQLiYugmv+mORGxzjjz3BKL
         +URprfNalgzm9AJNg4YN0vr+n3QFiwqomshtK1kEdYCeRUBLWuueWxJGONqSDJ+jR2dC
         5Oog==
X-Gm-Message-State: APjAAAU5m2zfIRSgF/vgmX/uNQa7WbkxauqsIiA6B3EkIxpfpzpBON9N
        CL7jy9qIlo0hm46xN3q4UuM=
X-Google-Smtp-Source: APXvYqz6voU62owE/+PeCh7//o9mb3l6X8QWXCzgYNJwXxxh+IiFGiA9+k55ftLmaPqgrjx+zLe2Yw==
X-Received: by 2002:a19:c6d6:: with SMTP id w205mr18235575lff.17.1572943338396;
        Tue, 05 Nov 2019 00:42:18 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id r9sm798017ljm.7.2019.11.05.00.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 00:42:16 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iRuPl-0004H3-QJ; Tue, 05 Nov 2019 09:42:13 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Juergen Stuber <starblue@users.sourceforge.net>,
        legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 07/14] USB: legousbtower: stop interrupt-out URB unconditionally
Date:   Tue,  5 Nov 2019 09:41:45 +0100
Message-Id: <20191105084152.16322-8-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105084152.16322-1-johan@kernel.org>
References: <20191105084152.16322-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Stop also the interrupt-out URB unconditionally in
tower_abort_transfers() which is called from release() (for connected
devices). Calling usb_kill_urb() for an idle URB is perfectly fine.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/legousbtower.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index 33533faa019e..3e409dfe172c 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -448,8 +448,7 @@ static void tower_abort_transfers (struct lego_usb_tower *dev)
 {
 	/* shutdown transfer */
 	usb_kill_urb(dev->interrupt_in_urb);
-	if (dev->interrupt_out_busy)
-		usb_kill_urb(dev->interrupt_out_urb);
+	usb_kill_urb(dev->interrupt_out_urb);
 }
 
 
-- 
2.23.0


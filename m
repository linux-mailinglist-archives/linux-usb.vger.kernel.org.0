Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4230921889D
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 15:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729393AbgGHNMy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 09:12:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24418 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729139AbgGHNMx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jul 2020 09:12:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594213972;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=dpcN6uhzyYQ/ewztTgf0OWdeJAZ75wA/b6rJJQ+xVDs=;
        b=LTXCD78c8WKfs+M4LqeYYWuXHRgNrp0qfwHxhr3jVpk0DT1mltbpbKj8RW3s314dufbVSX
        Va/IcR31/AtFTEBfNUGcg/ypb9L1h1kgurxUVcjhWOFMGOE3XDWkbo2sN5DJy9DVMy2A4f
        WoFFQcGPqciwYs8X1Ar9tX0jaHGeSyw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-c5gZZ00eOYGLeZtXUXxWeg-1; Wed, 08 Jul 2020 09:12:50 -0400
X-MC-Unique: c5gZZ00eOYGLeZtXUXxWeg-1
Received: by mail-qk1-f197.google.com with SMTP id j79so30934292qke.5
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2020 06:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=dpcN6uhzyYQ/ewztTgf0OWdeJAZ75wA/b6rJJQ+xVDs=;
        b=pfh4IDwo+ulY3HUj8kpdcY4Tb2eDsBEHrhBkNC65x8fbFikhFhn+49V0RHGd5OwSvF
         gjHY35nn1BLu7UD7pTdggxe6TR4txA0gbUpvAPRYg4al8WcHaUy3a5yxWoOOs2QguZ0M
         dTJU9o4T+YiCBn0PtBeWqQIxNsGMnXKXznrXpI9DefsguIeJhswrbZUbMef+o8qJ4AbI
         ntuA/2rurZaZbieTCs9ixBkXYT21f5uATdd7N1QtCLOyfGbx5PVjEY/qE9Trkk62K/Vt
         0E8Ho3zxn3E/qhI0WfH5gaH8qKcLquzvO4ARkjl1YOlj5mMAaFmfDl3vGCqkQksy3RFz
         h73Q==
X-Gm-Message-State: AOAM533kK2+8eYcie4tLKK4z+aFpn2NE0noEO0xJLCuGwp50t1yyJqK/
        LjYW81TOZ2+MWZUqTQOdQDb6VMm0M7t9FPVRm9SJ1Hqj4zN7zZ1ogPY8PEOq4/PW/PFjJKLsxPp
        OePYgaCqYE1R4larGMmsl
X-Received: by 2002:a05:620a:7d6:: with SMTP id 22mr56815620qkb.311.1594213970198;
        Wed, 08 Jul 2020 06:12:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxitu/hHcDwF3flowJxfpEmgEDZRQIJzjglSzVYv/A5vvAMuGPmy88ZU3gyB0peMa9Z/OfSHA==
X-Received: by 2002:a05:620a:7d6:: with SMTP id 22mr56815595qkb.311.1594213969919;
        Wed, 08 Jul 2020 06:12:49 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id k6sm21494856qki.123.2020.07.08.06.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 06:12:49 -0700 (PDT)
From:   trix@redhat.com
To:     jacmet@sunsite.dk, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] USB: c67x00: fix use after free in c67x00_giveback_urb
Date:   Wed,  8 Jul 2020 06:12:43 -0700
Message-Id: <20200708131243.24336-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Tom Rix <trix@redhat.com>

clang static analysis flags this error

c67x00-sched.c:489:55: warning: Use of memory after it is freed [unix.Malloc]
        usb_hcd_giveback_urb(c67x00_hcd_to_hcd(c67x00), urb, urbp->status);
                                                             ^~~~~~~~~~~~
Problem happens in this block of code

	c67x00_release_urb(c67x00, urb);
	usb_hcd_unlink_urb_from_ep(c67x00_hcd_to_hcd(c67x00), urb);
	spin_unlock(&c67x00->lock);
	usb_hcd_giveback_urb(c67x00_hcd_to_hcd(c67x00), urb, urbp->status);

In the call to c67x00_release_urb has this freeing of urbp

	urbp = urb->hcpriv;
	urb->hcpriv = NULL;
	list_del(&urbp->hep_node);
	kfree(urbp);

And so urbp is freed before usb_hcd_giveback_urb uses it as its 3rd
parameter.

Since all is required is the status, pass the status directly as is
done in c64x00_urb_dequeue

Fixes: e9b29ffc519b ("USB: add Cypress c67x00 OTG controller HCD driver")

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/usb/c67x00/c67x00-sched.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/c67x00/c67x00-sched.c b/drivers/usb/c67x00/c67x00-sched.c
index ef1e4ecaee99..f7f6229082ca 100644
--- a/drivers/usb/c67x00/c67x00-sched.c
+++ b/drivers/usb/c67x00/c67x00-sched.c
@@ -486,7 +486,7 @@ c67x00_giveback_urb(struct c67x00_hcd *c67x00, struct urb *urb, int status)
 	c67x00_release_urb(c67x00, urb);
 	usb_hcd_unlink_urb_from_ep(c67x00_hcd_to_hcd(c67x00), urb);
 	spin_unlock(&c67x00->lock);
-	usb_hcd_giveback_urb(c67x00_hcd_to_hcd(c67x00), urb, urbp->status);
+	usb_hcd_giveback_urb(c67x00_hcd_to_hcd(c67x00), urb, status);
 	spin_lock(&c67x00->lock);
 }
 
-- 
2.18.1


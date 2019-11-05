Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1D9EF775
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 09:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730605AbfKEImX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Nov 2019 03:42:23 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45345 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730600AbfKEImX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 03:42:23 -0500
Received: by mail-lj1-f196.google.com with SMTP id n21so7179631ljg.12
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2019 00:42:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ERFUKff5h8q5nbebLz28a5tfExWrZYctDruZlj5SbFM=;
        b=lzzFz1Peew6hwFclhH9SMjVFPLRrI1Rrobfy2KxQqa2ZYMPQQvrtTBs/K7uISQMu2e
         VkL0lHH8k7YWFAqUb07fwzC/LdyqD7ijlx3/uaegVGke/Zu20SBtQz77VncjfaMwlodh
         x4wpwIU4sONEBmGVRh8Har3Tw7SJp1IlhQZ9tzbm7J7hHLr6zU8roNvWjDIo51pD5B+D
         zCHePht1+oYXAHJOL0UPb/zfHXfBTyQ7LPig9a+qj/XSE7zWOeqZ7pkl0OFJxKr/1m6X
         QMDKfHhCvPHngGJqXS+h4JHNiIfOAyQf/QlgRMvb5SVNF31zMehqn7zjTnA3zwA1svP2
         aAnQ==
X-Gm-Message-State: APjAAAW86mcj7P1zbO3kLd1dthNLAFzyWpdFkgetld4Vr2DJ1L9nZmqO
        ZP9LnOskGc5UNJM70KtQt8A=
X-Google-Smtp-Source: APXvYqxNwQSNgQ+zs+1jA+5HRNQNAJ3dSHGNHq5cYi7X7agKKs139a3yRrZj7QSNnSxnYwYIZ8MTEg==
X-Received: by 2002:a2e:8694:: with SMTP id l20mr22053739lji.64.1572943341401;
        Tue, 05 Nov 2019 00:42:21 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id v6sm13894861ljd.15.2019.11.05.00.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 00:42:16 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iRuPm-0004HD-0M; Tue, 05 Nov 2019 09:42:14 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Juergen Stuber <starblue@users.sourceforge.net>,
        legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 09/14] USB: legousbtower: clean up pointer declarations in driver data
Date:   Tue,  5 Nov 2019 09:41:47 +0100
Message-Id: <20191105084152.16322-10-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105084152.16322-1-johan@kernel.org>
References: <20191105084152.16322-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Clean up the pointer declarations in the driver data, whose style wasn't
even consistent with the rest of the driver.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/legousbtower.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index f85b6ed2fb8b..c8ed8792b931 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -186,13 +186,13 @@ MODULE_DEVICE_TABLE (usb, tower_table);
 /* Structure to hold all of our device specific stuff */
 struct lego_usb_tower {
 	struct mutex		lock;		/* locks this structure */
-	struct usb_device*	udev;		/* save off the usb device pointer */
+	struct usb_device	*udev;		/* save off the usb device pointer */
 	unsigned char		minor;		/* the starting minor number for this device */
 
 	int			open_count;	/* number of times this port has been opened */
 	unsigned long		disconnected:1;
 
-	char*			read_buffer;
+	char			*read_buffer;
 	size_t			read_buffer_length; /* this much came in */
 	size_t			read_packet_length; /* this much will be returned on read */
 	spinlock_t		read_buffer_lock;
@@ -202,15 +202,15 @@ struct lego_usb_tower {
 	wait_queue_head_t	read_wait;
 	wait_queue_head_t	write_wait;
 
-	char*			interrupt_in_buffer;
-	struct usb_endpoint_descriptor* interrupt_in_endpoint;
-	struct urb*		interrupt_in_urb;
+	char			*interrupt_in_buffer;
+	struct usb_endpoint_descriptor *interrupt_in_endpoint;
+	struct urb		*interrupt_in_urb;
 	int			interrupt_in_interval;
 	int			interrupt_in_done;
 
-	char*			interrupt_out_buffer;
-	struct usb_endpoint_descriptor* interrupt_out_endpoint;
-	struct urb*		interrupt_out_urb;
+	char			*interrupt_out_buffer;
+	struct usb_endpoint_descriptor *interrupt_out_endpoint;
+	struct urb		*interrupt_out_urb;
 	int			interrupt_out_interval;
 	int			interrupt_out_busy;
 
-- 
2.23.0


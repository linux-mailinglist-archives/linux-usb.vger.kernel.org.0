Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54E66EF773
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 09:42:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730601AbfKEImW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Nov 2019 03:42:22 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46720 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730541AbfKEImV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 03:42:21 -0500
Received: by mail-lj1-f195.google.com with SMTP id e9so7498787ljp.13
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2019 00:42:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KzD2kRMqXBk5Yohy1WZyW20m/TFgSNbBGXd2XRm4RLc=;
        b=UspIH8ziMEILjxCXVD6s9T7GRZ0p+hG+bLP07jBY0GEOwUsz0K8RkL3m3ihnmkji1q
         daHCpeHl1hvi6FijZj70w//htg98N8ZMU2Gr976JUuzF7m1oB2BQsw8BeiyTR8rufLxl
         EeQKAGhjOCl3njs6L84FsYg0MgGcMQ2JcpF8U/hbnCfjQV6lyFSHsWZbZXVJCIGTR7pk
         P5tGOwn1fa3DjYxyDmEUej7tyuLljHQdRjVdoTwMRsi6O/XqLzFRdoj0a8fTbYWd25pM
         ywGP8IiqoJX+IEG2sj1fJZl0jM+QBKahUqR/jFm9hEfB+b/OvPI/1pAq71fitJlOOEPT
         gmBw==
X-Gm-Message-State: APjAAAW34cECWNxjvB8vr0AvcA03kc0J0JbO9hncmQmcviwxlitmrgYS
        /XOKJJpHC2oUReKeggiPMWE5P0fG
X-Google-Smtp-Source: APXvYqz/Tf/zHFQUZBgQpN4ukW+wBjTaq52O80nCjCrse6r6pgdXd/roW482mpw8wruO4jF68kn7GA==
X-Received: by 2002:a05:651c:28a:: with SMTP id b10mr3113831ljo.124.1572943339825;
        Tue, 05 Nov 2019 00:42:19 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id e22sm10521721ljg.73.2019.11.05.00.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 00:42:16 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iRuPm-0004Hc-G4; Tue, 05 Nov 2019 09:42:14 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Juergen Stuber <starblue@users.sourceforge.net>,
        legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 14/14] USB: legousbtower: drop superfluous newlines
Date:   Tue,  5 Nov 2019 09:41:52 +0100
Message-Id: <20191105084152.16322-15-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105084152.16322-1-johan@kernel.org>
References: <20191105084152.16322-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop some superfluous newlines before conditionals which made the code
harder to read.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/legousbtower.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index 6b7ea80d5876..ab4b98b04115 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -312,7 +312,6 @@ static int tower_open(struct inode *inode, struct file *file)
 	int result;
 
 	reset_reply = kmalloc(sizeof(*reset_reply), GFP_KERNEL);
-
 	if (!reset_reply) {
 		retval = -ENOMEM;
 		goto exit;
@@ -322,7 +321,6 @@ static int tower_open(struct inode *inode, struct file *file)
 	subminor = iminor(inode);
 
 	interface = usb_find_interface(&tower_driver, subminor);
-
 	if (!interface) {
 		pr_err("error, can't find device for minor %d\n", subminor);
 		retval = -ENODEV;
@@ -409,7 +407,6 @@ static int tower_release(struct inode *inode, struct file *file)
 	int retval = 0;
 
 	dev = file->private_data;
-
 	if (dev == NULL) {
 		retval = -ENODEV;
 		goto exit;
@@ -802,7 +799,6 @@ static int tower_probe(struct usb_interface *interface, const struct usb_device_
 	dev->interrupt_out_interval = interrupt_out_interval ? interrupt_out_interval : dev->interrupt_out_endpoint->bInterval;
 
 	get_version_reply = kmalloc(sizeof(*get_version_reply), GFP_KERNEL);
-
 	if (!get_version_reply) {
 		retval = -ENOMEM;
 		goto error;
@@ -835,7 +831,6 @@ static int tower_probe(struct usb_interface *interface, const struct usb_device_
 	usb_set_intfdata(interface, dev);
 
 	retval = usb_register_dev(interface, &tower_class);
-
 	if (retval) {
 		/* something prevented us from registering this driver */
 		dev_err(idev, "Not able to get a minor for this device.\n");
-- 
2.23.0


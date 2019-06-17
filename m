Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72B42495E5
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2019 01:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729037AbfFQXby (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jun 2019 19:31:54 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42358 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728997AbfFQXby (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jun 2019 19:31:54 -0400
Received: by mail-pf1-f193.google.com with SMTP id q10so6481991pff.9
        for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2019 16:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DGYOEoZzB7ON/ATlnUBcULai9xMr1qfqBufmX8ObGVk=;
        b=MsOJAsmqrNkd+thN/EWzBdMwNxj11a8cL2a44gNkr5+pGlHsbvwFICvinXt9UuNXfc
         9w5UjUPapfCk+RI6jLlGn9IsIg41Ov/hPbChGOKC2kl7VrM6R3DnpU5/m3tWF+9fj/1w
         Coh9CN6EQBKQiPTFWy/qTfW2mwy09MQwbHYmnsMixzM/3VKWYe5NI3Zx334w4sNQ6ga/
         2Vhphf7roI1R01zasbHn5+RLqEhfKbPEMsPHxPiNumjE7xlWyZhxb6zCa5w4wUyF9pbS
         T49IKBb7QUu0yNv6oSDo5f4XCDQCE1HDXSDEsXmyfFjGcM5aPyxI7/wfGxWZ6U+YK34J
         6nUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=DGYOEoZzB7ON/ATlnUBcULai9xMr1qfqBufmX8ObGVk=;
        b=EKpeOWjM2/8T/DmUXUSzuReoT508nvOAImkP2TvIR7falaBTUEbh+hTkzjppnuvRNZ
         OIOcQ0UvfvFzDLFi5od3kwT7xqN+8dNeQe6YLxEzKKn0sT/KIgUxE3XO3htTYKtmCLFd
         jEtkau8gNNb5+DCS8oCPiJp99NCQWvCWl8e3OL+w3UiXKCkUwSH+QAZvSERPLugg7JeU
         /tKEAQFdCYr5mgYtndQ7oqgFco8HNZZZQRZvwFRHcgAOH7T9NruHYWlWld+MCp3uFwSI
         nO3D/3NbovKZjcNdkS2LmkC/tHL54ZYkEx+WrqtTvV1NG2rvQRtwff3p5GEYBNzEI94t
         /fQQ==
X-Gm-Message-State: APjAAAVpwamvhnV2pKPsoD1KD58fS6NcgulOnKA8edj27r8PLWiyRlpl
        ujEm0/8+lGEJs14x5Umgl/cfN8vZVI8=
X-Google-Smtp-Source: APXvYqxhoDCo/2WrjA1oZwFDetrz3gTPAAcfoCkSlyrzm+oAC1Ce2sXawNGtom1y+s+nhHsRbJxuPg==
X-Received: by 2002:a17:90a:d14a:: with SMTP id t10mr1778883pjw.85.1560814313171;
        Mon, 17 Jun 2019 16:31:53 -0700 (PDT)
Received: from mn.cs.uvic.ca (S01061cabc0a516f3.gv.shawcable.net. [24.69.190.94])
        by smtp.gmail.com with ESMTPSA id q10sm9526373pgg.35.2019.06.17.16.31.52
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 16:31:52 -0700 (PDT)
Received: by mn.cs.uvic.ca (Postfix, from userid 1000)
        id B68FA4609F0; Mon, 17 Jun 2019 16:31:51 -0700 (PDT)
From:   dmg@turingmachine.org
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, Daniel M German <dmg@turingmachine.org>
Subject: [PATCH] usb: Replace a < b ? a : b construct with min_t(type, a, b) in drivers/usb
Date:   Mon, 17 Jun 2019 16:30:50 -0700
Message-Id: <20190617233050.21409-1-dmg@turingmachine.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Daniel M German <dmg@turingmachine.org>

Use min_t to find the minimum of two values instead of using the ?: operator.

This change does not alter functionality. It is merely cosmetic intended to
improve the readability of the code.

Signed-off-by: Daniel M German <dmg@turingmachine.org>
---
 drivers/usb/gadget/function/u_ether.c | 2 +-
 drivers/usb/misc/adutux.c             | 2 +-
 drivers/usb/storage/realtek_cr.c      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index 737bd77a575d..f6ba46684ddb 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -1006,7 +1006,7 @@ int gether_get_ifname(struct net_device *net, char *name, int len)
 	rtnl_lock();
 	ret = snprintf(name, len, "%s\n", netdev_name(net));
 	rtnl_unlock();
-	return ret < len ? ret : len;
+	return min_t(int, ret, len);
 }
 EXPORT_SYMBOL_GPL(gether_get_ifname);
 
diff --git a/drivers/usb/misc/adutux.c b/drivers/usb/misc/adutux.c
index 9465fb95d70a..4a9fa3152f2a 100644
--- a/drivers/usb/misc/adutux.c
+++ b/drivers/usb/misc/adutux.c
@@ -379,7 +379,7 @@ static ssize_t adu_read(struct file *file, __user char *buffer, size_t count,
 
 		if (data_in_secondary) {
 			/* drain secondary buffer */
-			int amount = bytes_to_read < data_in_secondary ? bytes_to_read : data_in_secondary;
+			int amount = min_t(size_t, bytes_to_read, data_in_secondary);
 			i = copy_to_user(buffer, dev->read_buffer_secondary+dev->secondary_head, amount);
 			if (i) {
 				retval = -EFAULT;
diff --git a/drivers/usb/storage/realtek_cr.c b/drivers/usb/storage/realtek_cr.c
index cc794e25a0b6..15ce54bde600 100644
--- a/drivers/usb/storage/realtek_cr.c
+++ b/drivers/usb/storage/realtek_cr.c
@@ -260,7 +260,7 @@ static int rts51x_bulk_transport(struct us_data *us, u8 lun,
 	 * was really transferred and what the device tells us
 	 */
 	if (residue)
-		residue = residue < buf_len ? residue : buf_len;
+		residue = min_t(unsigned int, residue, buf_len);
 
 	if (act_len)
 		*act_len = buf_len - residue;
-- 
2.20.1


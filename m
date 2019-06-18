Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC9A4A58B
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2019 17:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729308AbfFRPgL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 11:36:11 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38893 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729285AbfFRPgL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jun 2019 11:36:11 -0400
Received: by mail-pg1-f195.google.com with SMTP id v11so7893835pgl.5
        for <linux-usb@vger.kernel.org>; Tue, 18 Jun 2019 08:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FRHIqy+oERa/Gd6tXhpzHnzQu1LajS4OaM9wG+DmJJk=;
        b=K+/gYtWUi60SxOuIr8ZKy8R2dM76NvxsxDO23GSEjnGS79Wxy71qht/Lq6AwDHKZiP
         Ja9CaOvO5cEaF7FQ2yFBKiVu6bPNxtoP6pApe4H0ydHCB+4XgtKfKiJRLTI3Di/z2ZJ8
         L3r31w8bQzDts9klevrGqiSDSuC56nU/s7S3WmX6kLiLP6Hdq9jHfNFLaEQKZ23ccBJc
         jIb+TLAZX6emjVMxGiqO9XXpOdNqXmzLX8Vwui5mYF08qa/GFKh3JHWZcUkGTUrYksVg
         0/D/dx3XzkY+/Fyr/BdOpCwXfYoo9x6QcHhxKO6mWeQfTHXd/ZlGK8UoRVTKenFsL6IO
         BzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=FRHIqy+oERa/Gd6tXhpzHnzQu1LajS4OaM9wG+DmJJk=;
        b=DY48UZcMK2lPWhxlVnDwx15APfIPEoI65a+5m6VKv769x1TJEbM9erdHeho4wdTFnT
         0reQ3DKRfcnbJYGEMgZkfglM/unKLUXknSEhT8fJ/9J08ulk8+pOeK8qc46GIseDzFrF
         zqAYP/IENwzDghJpxCQxY5CoRGuNLnR+ETyLE2bbkAGIFvJODEJN4fCd7QDbzSnBFuc/
         wqyTEYUXdqoJKQ5cgdd4kmK+2VnCkz0T7Vc+L995LsWnnhxblCl6AvdWBfJ6dwQt957x
         bHaoknF33d5V0nNvyaiSz/DYGPdDyKncQlqbpZD8tK/MS0cvoRybTsmJh+lrZxfzQe+o
         jr/g==
X-Gm-Message-State: APjAAAVx5bn+CpHrf5z61n1rZGC/VDWwEw6utu/b0h+J+7G4CfBsV0MC
        61EvvZzDEApdj6ui5Y8wMD4=
X-Google-Smtp-Source: APXvYqwLuTYuti8sPurnZmvdLuOYrIhstWX68mF/Ot6IEw1+gYX5uAN3sQX3IGyUquf07LcfawbDZQ==
X-Received: by 2002:a62:ac11:: with SMTP id v17mr4504975pfe.236.1560872170527;
        Tue, 18 Jun 2019 08:36:10 -0700 (PDT)
Received: from mn.cs.uvic.ca (S01061cabc0a516f3.gv.shawcable.net. [24.69.190.94])
        by smtp.gmail.com with ESMTPSA id y19sm14606742pfe.150.2019.06.18.08.36.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 08:36:09 -0700 (PDT)
Received: by mn.cs.uvic.ca (Postfix, from userid 1000)
        id AA1CB4650F3; Tue, 18 Jun 2019 08:36:08 -0700 (PDT)
From:   dmg@turingmachine.org
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, Daniel M German <dmg@turingmachine.org>
Subject: [PATCH] usb: Replace a < b ? a : b construct with min_t(type, a, b) in adutux driver
Date:   Tue, 18 Jun 2019 08:35:29 -0700
Message-Id: <20190618153529.11418-1-dmg@turingmachine.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Daniel M German <dmg@turingmachine.org>

Use min_t to find the minimum of two values instead of using the ?: operator.

We use min_t instead of min to avoid the compilation warning 'comparison of
distinct pointer types lacks a cast'.

This change does not alter functionality. It is merely cosmetic intended to
improve the readability of the code.

Signed-off-by: Daniel M German <dmg@turingmachine.org>
---
 drivers/usb/misc/adutux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.20.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A678921C241
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jul 2020 06:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbgGKEao (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Jul 2020 00:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726671AbgGKEao (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Jul 2020 00:30:44 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07002C08C5DD
        for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2020 21:30:44 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id k18so7375753qke.4
        for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2020 21:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=KgyD21fct8GBQNGvfXKrMNHsg9rzOcfHTfC09VU6ykY=;
        b=R9GwFRexqcA2WnexQX5AyS/c0nGeprpBK0Xsyg0a7MRoVbR4vT7fhACly7lA/7ybLs
         Ws6XvJS+jNspcRWwph8ChQOFMj5vVzTy7DawKH7h38Sy2iXWKSqvmU6UB9qulF6bLeBE
         YVxKk6hK1+cJemW4nT5Pq5WaA+8FUhRfrGHJuKQFMLvv9horsbxXbNvXwfQ+Fr5pt50J
         FdnpJXwxiHx9h0r59ccRwcf/DmILUwZjyTFBDrtAThvU0BV5xWF3q8hZIla3bF2lsyRu
         ufvlSyExMuYRg76UPt8JHXXVKEFT9lEQPCXgEZlvy2Zk/QmPxUVseEkMmYe9e68DNG+h
         cuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KgyD21fct8GBQNGvfXKrMNHsg9rzOcfHTfC09VU6ykY=;
        b=RMta0sc8ZH+E/aZhLbnS08Ks5Y5Pk7kI/3yz8c7qGTwytrXubMCEbt/frJmRb95Gd9
         L+VjV4IiVzUwRe1Xz9uFYa3Yiy2SZ6TCbsiI0whz5n5BmHFLDxBqICzX0HUDVKEjpPnB
         AwbG7WScGieaUDChjVNYeYYFUVIpmcPsoEJgAhvrQwbgCSoisG1ndbY85rsqpIVnoYga
         zq1UVRONOyAON0CQ/u2AjaUZDl7nzDqIr7Ob4YX/6GC5LfU+pxn/s1w7G22cF51xPppK
         Okkx4lnjvg+lVYbliThSPa29j1bHYRnYsMNOeuN406KfmSjVqJ+PAprJxlq927fA3lwf
         cuRw==
X-Gm-Message-State: AOAM530/FY+PIrdTn7lsAVCiQ7dS6+m+MYcoQKBP1URi+iX9/4aVqW26
        AjTkH5PdglfivL6vsy627fI=
X-Google-Smtp-Source: ABdhPJyLKZ5WbaKzx0c4fvpqIqCgyR8naj5lhRuwSJG4CU1P0rkKRMqr8AYX0dY9e8TLkMjVDWGa/Q==
X-Received: by 2002:a37:6547:: with SMTP id z68mr68718482qkb.340.1594441843177;
        Fri, 10 Jul 2020 21:30:43 -0700 (PDT)
Received: from DESKTOP-2I1VNC3.cable.rcn.com ([209.94.140.104])
        by smtp.gmail.com with ESMTPSA id m4sm10750871qtf.43.2020.07.10.21.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 21:30:42 -0700 (PDT)
From:   Changming <charley.ashbringer@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     thomas@winischhofer.net, linux-usb@vger.kernel.org,
        Changming Liu <charley.ashbringer@gmail.com>
Subject: [PATCH] USB: sisusbvga: Fix a UB casued by left shifting a negative value
Date:   Sat, 11 Jul 2020 00:30:18 -0400
Message-Id: <20200711043018.928-1-charley.ashbringer@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Changming Liu <charley.ashbringer@gmail.com>

The char buffer buf, receives data directly from user space,
so its content might be negative and its elements are left
shifted to form an unsigned integer.

Since left shifting a negative value is undefined behavior, thus
change the char to u8 to elimintate this UB.

Signed-off-by: Changming Liu <charley.ashbringer@gmail.com>
---
 drivers/usb/misc/sisusbvga/sisusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusb.c b/drivers/usb/misc/sisusbvga/sisusb.c
index fc8a5da4a07c..0734e6dd9386 100644
--- a/drivers/usb/misc/sisusbvga/sisusb.c
+++ b/drivers/usb/misc/sisusbvga/sisusb.c
@@ -761,7 +761,7 @@ static int sisusb_write_mem_bulk(struct sisusb_usb_data *sisusb, u32 addr,
 	u8   swap8, fromkern = kernbuffer ? 1 : 0;
 	u16  swap16;
 	u32  swap32, flag = (length >> 28) & 1;
-	char buf[4];
+	u8 buf[4];
 
 	/* if neither kernbuffer not userbuffer are given, assume
 	 * data in obuf
-- 
2.17.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFAA1FFF41
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 02:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728989AbgFSA3Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Jun 2020 20:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727981AbgFSA3X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Jun 2020 20:29:23 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADEB9C0613EF
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2020 17:29:23 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id fc4so3707639qvb.1
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2020 17:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zey5/HEMnczIhTbkvBUGfCn+Fd1KG+Z57tf47eFAyUg=;
        b=Kf86HnGvbnkVjhEM3n+lfUEgFr/8LXPo/pUbCoc9NnkO6Preg3evv9KC3qzY5tSGp1
         cd21BHMqT1BSbKXvoX1Og6rcwe6i6g9Y1nB5QLewGtM/q2LLlv7QnOrHz8Fi2lr2x5OU
         3hZd9NZdxfzdy79xmRyQSj1/adJS8AzS+CnWMusvPU5sXO/4/OcfIeesXavdMzKvMAg0
         BT/nlSCrbKLQ6CWXXzWgsiv151uVoIxZMmcqpVOTLaWjYwsVYYLS6fkdLIe5pccZdNSx
         Lb2cmkIFlxHfb+NA7W60rKRy+qZy8kk+M4VXnD2aISfIWCUNqlphZjKA5XysTkcAQFq8
         UBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zey5/HEMnczIhTbkvBUGfCn+Fd1KG+Z57tf47eFAyUg=;
        b=JfVhhx6Ak1w0LdwLFAVaL7LY636E+0/v5fuZMHXxFn7vSoYBdeVReLdkuodXRa+QxK
         64/xKw70AIxpzL8VLIet5EpsUw77EvHaC5CrukZO1Y13W5BCuTL3wuBPJsIEfe0G34LT
         5NdyVjv90gHzqwNp5dKRzhNwq9zM2slwegPzJRNHxWDjNjBiZMLiADRos4bChSJyA1UI
         +IGloDkv9nGN9Cl/9eo08oBtLeBGKKLfOyTH7usGXp3GXNtoyEfF7S1/dlNgdvnqV1bS
         GRSDkLEwL71rKSjDssW2JVBfFUNewmPMS/x61SNSbnsupf9ux6vAdY0exm8h6jQaM+XL
         sFKg==
X-Gm-Message-State: AOAM531j4sMDtNdNEMhiKGLxtSXKd1f8QQXFicOWgyS/Sm2h3R6athnK
        4/gYne4HPR2STL7gR8elPTU=
X-Google-Smtp-Source: ABdhPJxhFhKB4ZBiavyyY8YWxtj7H6H8aRk7LVLxz5yd6zQhViiZ05aBEnd7EbVs8+VkN4qbsogVyw==
X-Received: by 2002:ad4:42b1:: with SMTP id e17mr6555166qvr.104.1592526563011;
        Thu, 18 Jun 2020 17:29:23 -0700 (PDT)
Received: from DESKTOP-JC0RTV5.neu.edu ([155.33.134.7])
        by smtp.gmail.com with ESMTPSA id p7sm135497qki.61.2020.06.18.17.29.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jun 2020 17:29:22 -0700 (PDT)
From:   Changming Liu <charley.ashbringer@gmail.com>
X-Google-Original-From: Changming Liu <liu.changm@northeastern.edu>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, thomas@winischhofer.net,
        Changming Liu <liu.changm@northeastern.edu>
Subject: [PATCH 3/4] USB: sisusbvga: change userbuffer for sisusb_recv_bulk_msg to u8
Date:   Thu, 18 Jun 2020 20:28:53 -0400
Message-Id: <1592526534-1739-4-git-send-email-liu.changm@northeastern.edu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592526534-1739-1-git-send-email-liu.changm@northeastern.edu>
References: <1592526534-1739-1-git-send-email-liu.changm@northeastern.edu>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

change the userbuffer of sisusb_recv_bulk_msg from char to u8
also force cast the kernbuffer to u8 when passed in

Signed-off-by: Changming Liu <liu.changm@northeastern.edu>
---
 drivers/usb/misc/sisusbvga/sisusb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusb.c b/drivers/usb/misc/sisusbvga/sisusb.c
index 8878c28..86638c1 100644
--- a/drivers/usb/misc/sisusbvga/sisusb.c
+++ b/drivers/usb/misc/sisusbvga/sisusb.c
@@ -448,7 +448,7 @@ static int sisusb_send_bulk_msg(struct sisusb_usb_data *sisusb, int ep, int len,
  */
 
 static int sisusb_recv_bulk_msg(struct sisusb_usb_data *sisusb, int ep, int len,
-		void *kernbuffer, char __user *userbuffer, ssize_t *bytes_read,
+		void *kernbuffer, u8 __user *userbuffer, ssize_t *bytes_read,
 		unsigned int tflags)
 {
 	int result = 0, retry, count = len;
@@ -551,7 +551,7 @@ static int sisusb_send_packet(struct sisusb_usb_data *sisusb, int len,
 		 *    return value and write it to packet->data
 		 */
 		ret = sisusb_recv_bulk_msg(sisusb, SISUSB_EP_GFX_IN, 4,
-				(char *)&tmp, NULL, &bytes_transferred, 0);
+				(u8 *)&tmp, NULL, &bytes_transferred, 0);
 
 		packet->data = le32_to_cpu(tmp);
 	}
@@ -587,7 +587,7 @@ static int sisusb_send_bridge_packet(struct sisusb_usb_data *sisusb, int len,
 		 *    return value and write it to packet->data
 		 */
 		ret = sisusb_recv_bulk_msg(sisusb, SISUSB_EP_BRIDGE_IN, 4,
-				(char *)&tmp, NULL, &bytes_transferred, 0);
+				(u8 *)&tmp, NULL, &bytes_transferred, 0);
 
 		packet->data = le32_to_cpu(tmp);
 	}
-- 
2.7.4


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94A8E1E8CF0
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2020 03:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728649AbgE3BtH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 21:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727876AbgE3BtG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 May 2020 21:49:06 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10E6FC08C5C9
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 18:49:05 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id 1so2581274vsl.9
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 18:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xuV3GUDS4YMG1XNMIzPaZWUKlHIyzC217w53oI2G29E=;
        b=Ye6rJSBoaxvktib2iI4sFbjfs417oDu1RnryANrJEmCBxB1J1yGRF9WMwlUbsjFnZ+
         UUH1Fef42bkaXPI2R6hE/+h94rky+WoAnrwMtAxGh0yikBcnWVW7fMVIRv8Q6c3I7wq2
         G7iG1iOhQ66GKmNnzW0865aUD5M0+PMUvVpkhZA7CwkhoDc03nIPiPpWc7IYMQKO4BAK
         /AgnQ0+RrzPThEkjqprMUxhGXbK+lHldw0lLqr38UNB7SDS+qpHRmTDUZnG/3V1aCY9b
         vYHRys2slCVxAXvX34If6GE5GYildXaYxq8ijlWS6z4mBPUrNyN8PGMK/lkfA3aHXbv3
         G87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xuV3GUDS4YMG1XNMIzPaZWUKlHIyzC217w53oI2G29E=;
        b=Yi50laOVSO2zLJmuECuEoq6b69YeYv7FKNUBPvtRa7sqoseke57yPNYe+UZeiwKCCF
         JwL9Fg3JMVKl3NMND2XDzVi6yK5f1L10siH0Fa06RMBjwYUwisibtR8bKZaPcBpeIQN5
         3hDYDv6AM6Fq0TujAJM8oVFr3KljQplbi9VGQ47XPv4rH73xXcoHb9llE4R0Wm93l1r4
         B/NhlYwOvyJlN/9do0J8ehu6jZtG2y4rZtIeBxItnEVEoHXC1ZfUwTGsMbCumLN5PiKU
         kgipFMVZaHrHlR10i6Koz9SrqMfT5YKiNicDfZXu4lXUKn7H9hXX2teVVWYV5AP/JUc3
         nShQ==
X-Gm-Message-State: AOAM530Gq+WmYp/0+RGvbbdsCnD36fsdJuqaKZZ0p68c+0EgoB8uqpZP
        HKmB2VuKx1NDnLtczbAdVRA=
X-Google-Smtp-Source: ABdhPJwrB/4JbS0SDbaTV3R+lReDzVvH3sLM0NbFbKW56YQ/dwo7Ia435zIsAYBUc5JFtvPYSXqArw==
X-Received: by 2002:a67:6958:: with SMTP id e85mr8449451vsc.194.1590803344327;
        Fri, 29 May 2020 18:49:04 -0700 (PDT)
Received: from DESKTOP-2I1VNC3.localdomain (host-128-227-216-118.xlate.ufl.edu. [128.227.216.118])
        by smtp.gmail.com with ESMTPSA id z75sm1507759vkd.5.2020.05.29.18.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 18:49:04 -0700 (PDT)
From:   Changming <charley.ashbringer@gmail.com>
X-Google-Original-From: Changming <liu.changm@northeastern.edu>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, thomas@winischhofer.net,
        Changming Liu <liu.changm@northeastern.edu>
Subject: [PATCH 4/6] USB: sisusbvga: change userbuffer for sisusb_recv_bulk_msg to u8
Date:   Fri, 29 May 2020 21:48:18 -0400
Message-Id: <20200530014820.9967-5-liu.changm@northeastern.edu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200530014820.9967-1-liu.changm@northeastern.edu>
References: <20200530014820.9967-1-liu.changm@northeastern.edu>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Changming Liu <liu.changm@northeastern.edu>

change the userbuffer of sisusb_recv_bulk_msg
also force cast the kernbuffer to u8 when passed in

Signed-off-by: Changming Liu <liu.changm@northeastern.edu>
---
 drivers/usb/misc/sisusbvga/sisusb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusb.c b/drivers/usb/misc/sisusbvga/sisusb.c
index 83c3785ce4ab..9e858530c4ed 100755
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
2.17.1


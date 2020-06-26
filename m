Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 463A520B95A
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jun 2020 21:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbgFZTeq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Jun 2020 15:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgFZTeq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Jun 2020 15:34:46 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE269C03E979
        for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2020 12:34:45 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id j10so8317254qtq.11
        for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2020 12:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Xc/KS1+lBdxXwaLwp7k6sHJ5EPV+57y26bhAeg9ND/g=;
        b=Ws83tmIfX4UgNNgNbIsgrwG6IiYab7KzvS8BTdqsaYP97vNw/QCQLg4Eau6qbG3aBA
         sCAY3bcaC4OOWlhmCziCFQlFCJkdbFducSk0YMVVCL62FiOGjS/xt1vLpUoVTvS0qJzf
         NQtTTPgGqZ91LSVx6Zp8XVQaUe9BAIdcRa3tpWf+g7xjhv7z9ZKTj9554RHDNVu0L44u
         8C0IQwc+Sq9M7lCqnlu39iHuBR5pXi9wzv3c5uWYiz7+XwjVjYSA384Q51UqbibZC9D+
         KaJ0CklGRTlgXBzpe3Uv+3eyCXY3MgY8siA6UARgENtS14Q6x7zZrikR0MW2LuUaVYKN
         w4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Xc/KS1+lBdxXwaLwp7k6sHJ5EPV+57y26bhAeg9ND/g=;
        b=YuVTTrrdcSl+ykCtkCzxTNpZWdL98kegxEZ4Sd/tFM04QZwpY92NP9eRc5/MFp0A/a
         FtIm6NkquAHUJ0VQyOiIegIq3g062pBpEhZg/AduXFib+FnGqCMsf5ZH5emseudyIMLb
         iQmz1upTznOD9akH1CLXeyKNJnTv8VFp6V4+NMWTn073kG+dJvq7KSsl057JSerRWyZ3
         4mdiFcgIF+jaltXDA7MrE9BXv5JD+PpZUj9aVYcvFipG+SB0M9exy/uqbU3qB8W6SKpP
         5Wobv1LPA8JZmGCkRsF+qyIhwIKX263Ij8OsliFR1BN2mis0cTwNw1Tk34N+ElshbJ0g
         S1YA==
X-Gm-Message-State: AOAM530bPZKDoL1ufaibEegvvkzuXkC8KbMo5eTw/kGP3YgLcFTqErr6
        HFDxRsOk05aXjjWYl49nmiA=
X-Google-Smtp-Source: ABdhPJzkPMe+aiwY6ARgO3lZAQBRviVz5bnXjZP6DrG9I3KIvdIh6BvSKlt26SzAbS+3jjRNmCJJsA==
X-Received: by 2002:ac8:2928:: with SMTP id y37mr4501131qty.245.1593200085105;
        Fri, 26 Jun 2020 12:34:45 -0700 (PDT)
Received: from DESKTOP-JC0RTV5.neu.edu ([155.33.134.7])
        by smtp.gmail.com with ESMTPSA id u124sm1089990qkf.83.2020.06.26.12.34.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jun 2020 12:34:44 -0700 (PDT)
From:   Changming Liu <charley.ashbringer@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, thomas@winischhofer.net,
        Changming Liu <charley.ashbringer@gmail.com>
Subject: [PATCH 3/4] USB: sisusbvga: change the buffer in sisusb_recv_bulk_msg from char to u8
Date:   Fri, 26 Jun 2020 15:34:16 -0400
Message-Id: <1593200057-245-4-git-send-email-charley.ashbringer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593200057-245-1-git-send-email-charley.ashbringer@gmail.com>
References: <1593200057-245-1-git-send-email-charley.ashbringer@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch changes the userbuffer of sisusb_recv_bulk_msg from char to u8
to avoid related UB.

Also, for kernbuffer declared as void* in the function header, force cast 
the passed-in parameters from char* to u8*.

Signed-off-by: Changming Liu <charley.ashbringer@gmail.com>
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


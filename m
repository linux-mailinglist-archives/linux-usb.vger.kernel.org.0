Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94F8B272694
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 16:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgIUODy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 10:03:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgIUODx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Sep 2020 10:03:53 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 130C3C061755
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2020 07:03:53 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id l126so9326708pfd.5
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2020 07:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tAeIRa3VqxftcoxgnhacaYdMVbJKOqRUMbFtY1HDm5g=;
        b=q/cS9VBb365FK/JG7LtouMFSKam9+eHMJe8YgNCU49CfGKMEZ4P4g9WuGSQbGT2o/d
         UplwjFyx5YFlYmhjgVf3TEthku/J4WYNvbngHT/j0EsFobqNHCpu5se6kbh2NpG3Y4Um
         q+dQAvYHNJn+LE0Q9w6ihbEFTVO8OJ0/HsMNNSneaKp85D7NbO+O87h/i8LNmX0TVLL3
         c7BFlYVwBROx5YpAjD4xAiWm+F0VZTgumssgieZjEOORvY2KikjLfNgUtelOcLBx4jiQ
         osW/wtKp26pLg7edTXQnK/R+4+YL1ypWYTz/DT9glINKuysykjrbvoCqikCvodhQdss0
         Tv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tAeIRa3VqxftcoxgnhacaYdMVbJKOqRUMbFtY1HDm5g=;
        b=tkUvcsb8ZO8h98kXb3HT6jy3NwnBnQtM+svROupC0YLRC6kNW7elZ0FfbYdhBg2Gl4
         FCgOHhmtJVSB/NM/d/O1IRbahRsTifIQNBA5NjSjn1f//a4+o+k8seFw9Do5PFCX8Ml8
         /vldyG/SblwvSmBfeXkHW6pJn1iUJPmo0yrn3RVlG7D9cHdpwhOA6fsXUSLNgbbJ3gM/
         d8Q7nJfL5NsO6zyk6pxzi9C6TUYeZhU2NsMm+5ZoUcgv1zgocMMzXJgozpIPL7xVCSQ3
         ON1K2J4NKXRt+oIjVF7XznYziyaV2YSazsSaSeTUfSyHaiIGxkC7Jx4KYg0CEZf9SE3q
         AMpA==
X-Gm-Message-State: AOAM533j2xUfuU9kUTuFNpp/pkppzJ1Atfuaotwbn75OvCH8ZOEXSbui
        UPLIVsnv2VrxIV2XbsC1tnU=
X-Google-Smtp-Source: ABdhPJyCfgqBgx8cPjgInhHeJOcF13lTelEEX8MnkKXCkYQg3Bhoa6B4eLTYJUU1JVfdsCMuUrxWtw==
X-Received: by 2002:a63:ea16:: with SMTP id c22mr17275567pgi.326.1600697032585;
        Mon, 21 Sep 2020 07:03:52 -0700 (PDT)
Received: from lemmy.tees.ne.jp (153-125-65-70.catv.tees.ne.jp. [153.125.65.70])
        by smtp.googlemail.com with ESMTPSA id q24sm12018585pfs.206.2020.09.21.07.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 07:03:52 -0700 (PDT)
From:   Yasushi Asano <yazzep@gmail.com>
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, erosca@de.adit-jv.com,
        andrew_gabbasov@mentor.com, jim_baxter@mentor.com,
        wnatsume@jp.adit-jv.com, nnishiguchi@jp.adit-jv.com,
        yasano@jp.adit-jv.com
Subject: [PATCH] Re: [PATCH v3] USB: hub.c: decrease the number of attempts of enumeration scheme
Date:   Mon, 21 Sep 2020 23:03:42 +0900
Message-Id: <20200921140342.3813-1-yazzep@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200920192114.GB1190206@rowland.harvard.edu>
References: <20200920192114.GB1190206@rowland.harvard.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Yasushi Asano <yasano@jp.adit-jv.com>

Dear Alan

Thank you very much for providing the patch.
I really appreciate your kindness.

When I added a pseudo error code and checked it,
the for statement of the "operation" in the new scheme
runs unconditionally three times. Therefore It doesn't
seem to meet the requirements (30seconds).

After applying your patch, I added a patch that can
change the loop number of "operation" as shown below,
and it worked fine in the pseudo error environment.
Is this modification acceptable?

If it is good, I'll add this patch and test it.
Since the PET tool is only in the customer,
I will ask the customer to test it. I will report the
result when I receive the results.

Signed-off-by: Yasushi Asano <yasano@jp.adit-jv.com>
---
 drivers/usb/core/hub.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 61effd5..2f07f7c 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2709,12 +2709,14 @@ static unsigned hub_is_wusb(struct usb_hub *hub)
 #define PORT_RESET_TRIES	2
 #define SET_ADDRESS_TRIES	1
 #define GET_DESCRIPTOR_TRIES	1
+#define GET_DESCRIPTOR_OPERATIONS	1
 #define PORT_INIT_TRIES		5
 
 #else
 #define PORT_RESET_TRIES	5
 #define SET_ADDRESS_TRIES	2
 #define GET_DESCRIPTOR_TRIES	2
+#define GET_DESCRIPTOR_OPERATIONS	3
 #define PORT_INIT_TRIES		4
 #endif	/* CONFIG_USB_FEW_INIT_RETRIES */
 
@@ -4699,7 +4701,7 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
 			 * 255 is for WUSB devices, we actually need to use
 			 * 512 (WUSB1.0[4.8.1]).
 			 */
-			for (operations = 0; operations < 3; ++operations) {
+			for (operations = 0; operations < GET_DESCRIPTOR_OPERATIONS; ++operations) {
 				buf->bMaxPacketSize0 = 0;
 				r = usb_control_msg(udev, usb_rcvaddr0pipe(),
 					USB_REQ_GET_DESCRIPTOR, USB_DIR_IN,
-- 
2.7.4


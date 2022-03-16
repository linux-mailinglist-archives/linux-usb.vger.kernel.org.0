Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5274DB605
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 17:22:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354141AbiCPQVG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 12:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356452AbiCPQVD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 12:21:03 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B35E232ECB
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 09:19:48 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id bx5so2557971pjb.3
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 09:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eKWoLdilS/xkKbSS5GySewhiz9ZErVZagSWCzPknuLE=;
        b=VtFOA0plwxRQLpJsWVv+q05IlvVD2keUwGLKs1Apf8j8On94/U4M8ebGtn4dOT30nc
         FvuiCwMNGWMykhFLzRsbdhpv4CLiy+k848FMYqPSNAPJKvceC+I/97BtfewNQU3qgmpz
         PWOQuu4JSUfHO6ibCJE34lY9Y7N6vLa7vaXWE/djTnQe16ZTL31bUReWh7LEthMNHtiM
         sKIqyGs9Gq3fhaaMUUS35jkI2R7s6ET9PXbHN3fi3yNsZrzxvCpGI9JU1RHA0zrsAJTW
         mtRSg0SJzlUDA9I1VAoq1HlwKZT9FyNWSJ7Y0CUllJZM7VrCWLx1Oic/4N43vnWSjb+x
         56yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=eKWoLdilS/xkKbSS5GySewhiz9ZErVZagSWCzPknuLE=;
        b=Z0v7Wt6xS8BZlfYWx00OcfyzfzMUyVinLcdJkzRoK7w6wGxxYYy6un/iZGyiqWcyRa
         h1NQEvrHFQ9nib0FlXODtXIM007XfHdksF3QjLgWAjpqHBbKCFyaa8/Rlte8rOBHT7yY
         FwRXYinPhs90C+sZ70s1ZK7Z53hkLb/1cy7+6GyHr1OzkaMdi6LO5wxYR8MV26gE/sJ7
         dN3JousLfGB1Vp8E0+9xt6/yU6SuW5dvbCr+Xh/LLdODNDVqFLB728N8I8M4L5h40phY
         JKN68GeSzXb4lMJBGydblUXZKylQv8Jo+cAxSZVcTMRQc+E+OwNF8YiCNF5T3lmuvVSB
         DM6Q==
X-Gm-Message-State: AOAM531TB6xPJw749zv41HDAX06hiZtvzqBqpuhsIWj1XSdGT6G1TGD/
        ReF/hg2V1d5ItQrZ41IKaus=
X-Google-Smtp-Source: ABdhPJxC3lPQLQYBnbVF2k6l0aXEyO6U0UmB9pB1o7GFZZYjp8qEjWaBjAdBx+QRNeI5/72048zG2A==
X-Received: by 2002:a17:902:7141:b0:153:8050:4357 with SMTP id u1-20020a170902714100b0015380504357mr707674plm.166.1647447588104;
        Wed, 16 Mar 2022 09:19:48 -0700 (PDT)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id mt15-20020a17090b230f00b001bf191e6f08sm2988374pjb.9.2022.03.16.09.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 09:19:47 -0700 (PDT)
Sender: Vincent Mailhol <vincent.mailhol@gmail.com>
From:   Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [PATCH v3 1/9] usb: deprecate the third argument of usb_maxpacket()
Date:   Thu, 17 Mar 2022 01:19:27 +0900
Message-Id: <20220316161935.2049-2-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220316161935.2049-1-mailhol.vincent@wanadoo.fr>
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
 <20220316161935.2049-1-mailhol.vincent@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a transitional patch with the ultimate goal of changing the
prototype of usb_maxpacket() from:
| static inline __u16
| usb_maxpacket(struct usb_device *udev, int pipe, int is_out)

into:
| static inline u16 usb_maxpacket(struct usb_device *udev, int pipe)

The third argument of usb_maxpacket(): is_out gets removed because it
can be derived from its second argument: pipe using
usb_pipeout(pipe). Furthermore, in the current version,
ubs_pipeout(pipe) is called regardless in order to sanitize the is_out
parameter.

In order to make a smooth change, we first deprecate the is_out
parameter by simply ignoring it (using a variadic function) and will
remove it later, once all the callers get updated.

The body of the function is reworked accordingly and is_out is
replaced by usb_pipeout(pipe). The WARN_ON() calls become unnecessary
and get removed.

Finally, the return type is changed from __u16 to u16 because this is
not a UAPI function.

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 include/linux/usb.h | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/include/linux/usb.h b/include/linux/usb.h
index 200b7b79acb5..572e136f6314 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1969,21 +1969,17 @@ usb_pipe_endpoint(struct usb_device *dev, unsigned int pipe)
 	return eps[usb_pipeendpoint(pipe)];
 }
 
-/*-------------------------------------------------------------------------*/
-
-static inline __u16
-usb_maxpacket(struct usb_device *udev, int pipe, int is_out)
+static inline u16 usb_maxpacket(struct usb_device *udev, int pipe,
+				/* int is_out deprecated */ ...)
 {
 	struct usb_host_endpoint	*ep;
 	unsigned			epnum = usb_pipeendpoint(pipe);
 
-	if (is_out) {
-		WARN_ON(usb_pipein(pipe));
+	if (usb_pipeout(pipe))
 		ep = udev->ep_out[epnum];
-	} else {
-		WARN_ON(usb_pipeout(pipe));
+	else
 		ep = udev->ep_in[epnum];
-	}
+
 	if (!ep)
 		return 0;
 
@@ -1991,8 +1987,6 @@ usb_maxpacket(struct usb_device *udev, int pipe, int is_out)
 	return usb_endpoint_maxp(&ep->desc);
 }
 
-/* ----------------------------------------------------------------------- */
-
 /* translate USB error codes to codes user space understands */
 static inline int usb_translate_errors(int error_code)
 {
-- 
2.34.1


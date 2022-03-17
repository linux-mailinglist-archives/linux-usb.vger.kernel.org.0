Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFEC4DBEF2
	for <lists+linux-usb@lfdr.de>; Thu, 17 Mar 2022 07:06:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbiCQGHe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Mar 2022 02:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbiCQGH2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Mar 2022 02:07:28 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA131877DD
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 22:41:38 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id y27-20020a4a9c1b000000b0032129651bb0so5308859ooj.2
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 22:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eKWoLdilS/xkKbSS5GySewhiz9ZErVZagSWCzPknuLE=;
        b=FqXuQMOFnqBE6bBsSlhdI9alOQYxAXLxS1CVr9WBBV27+wmlxvyiJAJsuCOVNCEvTI
         OiRVsBxxfskJhw4mp8BDrpBVgGNBmdRWuoFVZzS1SXVXRef0/9Zb/LLZaaFw3qymSu9U
         IYFQU4OuToy939E5Uth2ceMjbFEBOKYv+VuH0is529E0CuqukhqXdGN3hIGx3E0XPb/d
         nCcOaDQwL1Ykp0CVfJNd6RAxgp1XTYRLCoMllt1FHHI7qWiltBzXR7xNQVHHHMPaMSk2
         fyznGvU76N8NeDz8EjluTiI3hb3dRlmNTpocoPJP+tCfKdXmjwS8oSKehgur/dxw0OvQ
         YHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=eKWoLdilS/xkKbSS5GySewhiz9ZErVZagSWCzPknuLE=;
        b=iKQriGID8RGuFHrOFCwGZIgKpb/QOXX0OETagAd/LdFv7RQM/o/K0Y9iyyVY5cHdTe
         2KS0H7iri3KAnorcTzuC+ZBr6XjOa0jCMyzeru0X2kPJMuFDbCVi/iftZToHQyr6U2X2
         WgWVJLy6YBGCW77lt4DhXgoNMwKKMfN0xCgGz6fP6Jv+tefvu4GOkXKojHEHnCEqdM9+
         iKODSyA/7uSXrIYY0YRd0/bcappAm60W7iIx2CKDO3YDoFYCr8791cW+r8aP1LsOmKqp
         /0OobDCcmp+n6gwmfXdlDW3IG3lPMn+dLlDlVmFEd3uCSfvHA2wHluL+iWiUp91m22Sh
         Pxow==
X-Gm-Message-State: AOAM530wCMrB1N4pcg3y66lolH7hnbhOXDP6D1swnzmmVOqGIOxcUaUq
        REITCFi4ux1I0xGro966kF1+n5di0AI=
X-Google-Smtp-Source: ABdhPJyPbBaLrJCUcNtWWIB1eRklnVSjmo82iUkp9BVVNv/0J7Whh7i/mwE4q0vX4tyeUVsDuoAsKw==
X-Received: by 2002:a17:90a:6c02:b0:1c6:1173:6880 with SMTP id x2-20020a17090a6c0200b001c611736880mr13731401pjj.171.1647489334552;
        Wed, 16 Mar 2022 20:55:34 -0700 (PDT)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id e6-20020a056a001a8600b004f78e446ff5sm5096734pfv.15.2022.03.16.20.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 20:55:34 -0700 (PDT)
Sender: Vincent Mailhol <vincent.mailhol@gmail.com>
From:   Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [PATCH v4 1/9] usb: deprecate the third argument of usb_maxpacket()
Date:   Thu, 17 Mar 2022 12:55:06 +0900
Message-Id: <20220317035514.6378-2-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220317035514.6378-1-mailhol.vincent@wanadoo.fr>
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
 <20220317035514.6378-1-mailhol.vincent@wanadoo.fr>
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


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 307B371FA73
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jun 2023 09:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234076AbjFBHAb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jun 2023 03:00:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233852AbjFBHA2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jun 2023 03:00:28 -0400
Received: from mail-lf1-x149.google.com (mail-lf1-x149.google.com [IPv6:2a00:1450:4864:20::149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F16D18C
        for <linux-usb@vger.kernel.org>; Fri,  2 Jun 2023 00:00:26 -0700 (PDT)
Received: by mail-lf1-x149.google.com with SMTP id 2adb3069b0e04-4f256ddef3aso1404889e87.2
        for <linux-usb@vger.kernel.org>; Fri, 02 Jun 2023 00:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685689224; x=1688281224;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O9ZIKWjkpmVJpjBcwd1faCmsxJuo8++sV8GGVf8Hz50=;
        b=CvlI6erYkRfyV842uoAgZvj+msGjwKVDshzzaQ/XoCkfmEG/Aujr56RmHcSWipfChb
         uZfkYOdLwMNig6SgfUt0QW0Kq2NJtMdM7WaV5HJb3XRyqezLV+LgyFmsRhBiS+mpnXUg
         cID5wJjqaqWMpy+4OvkMTi+vbETSCwnbrF8hw+olZDogSPMnesmbfN/x/IxuaQ1Qgb11
         STXldN/ZwMW743+lSAKDhNR5u0mTYVFuPZlt7etI6jrwJN22+KtQ4byJMIrUlt77aqRP
         Jg3ZsbvXydzaJKmaY7DpMVtxdMp00L5VQwDBsAIWhUjpfmJ/zlHU/djLHCR/ZmxFFb3C
         ViKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685689224; x=1688281224;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O9ZIKWjkpmVJpjBcwd1faCmsxJuo8++sV8GGVf8Hz50=;
        b=QB02PRRguM5UkfY5AQMsi+2L4tvtWsj+95l68szNaztGReytcHYuG55ECm3Hh8/544
         IQfSshS+SyP0hayjaRX+63Znp2l2yBdQKiQm16ZYCPNVjWK7q81GtLok1HzQQ2bKwFF6
         iQqb5wr6+VXFlaNU9j9n3bacRX8uRsIz39dEGSm2tjnvXgPWlCFwvIYNq7DDsm+pdg+v
         wsmmliA3UZTRX8xPIhjNSHqRp0D57FtEYsy+ezyNmmcLbbw3sQlKKam0Vk7xEj+1mvmA
         XrEXmlJNwDj2StXtw22tGzueLBG/Rtd/MlqMaCXHWBeWpsdr0zuGrBDPloJxI1gCUps1
         jMLQ==
X-Gm-Message-State: AC+VfDzdDM1JmYjSviqv21VZu47rrc+g0loHyRl+6N+lQGRZHahWGY/I
        25mcTuLeUOP5vJtHOEMGBGGS3iHyE/U=
X-Google-Smtp-Source: ACHHUZ6oBlvLdJULcpGlUGRE+UmAIvUjgyqxTa110SwNR4R2uKlXcaEHp+qVShmBy6Uh5ox0yKQZI8Vy6vM=
X-Received: from khtsai-large-gcloudtop.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:289])
 (user=khtsai job=sendgmr) by 2002:a19:ee13:0:b0:4ed:b87e:2fce with SMTP id
 g19-20020a19ee13000000b004edb87e2fcemr504185lfb.5.1685689224623; Fri, 02 Jun
 2023 00:00:24 -0700 (PDT)
Date:   Fri,  2 Jun 2023 15:00:06 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230602070009.1353946-1-khtsai@google.com>
Subject: [PATCH] usb: gadget: u_serial: Add null pointer check in gs_start_io
From:   Kuen-Han Tsai <khtsai@google.com>
To:     gregkh@linuxfoundation.org, quic_prashk@quicinc.com,
        christophe.jaillet@wanadoo.fr, xiujianfeng@huawei.com
Cc:     raychi@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kuen-Han Tsai <khtsai@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If gs_close has cleared port->port.tty and gs_start_io is called
afterwards, then the function tty_wakeup will attempt to access the value
of the pointer port->port.tty which will cause a null pointer
dereference error.

To avoid this, add a null pointer check to gs_start_io before attempting
to access the value of the pointer port->port.tty.

Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
 drivers/usb/gadget/function/u_serial.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 97f07757d19e..1115396b46a0 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -539,16 +539,20 @@ static int gs_alloc_requests(struct usb_ep *ep, struct list_head *head,
 static int gs_start_io(struct gs_port *port)
 {
 	struct list_head	*head = &port->read_pool;
-	struct usb_ep		*ep = port->port_usb->out;
+	struct usb_ep		*ep;
 	int			status;
 	unsigned		started;
 
+	if (!port->port_usb || !port->port.tty)
+		return -EIO;
+
 	/* Allocate RX and TX I/O buffers.  We can't easily do this much
 	 * earlier (with GFP_KERNEL) because the requests are coupled to
 	 * endpoints, as are the packet sizes we'll be using.  Different
 	 * configurations may use different endpoints with a given port;
 	 * and high speed vs full speed changes packet sizes too.
 	 */
+	ep = port->port_usb->out;
 	status = gs_alloc_requests(ep, head, gs_read_complete,
 		&port->read_allocated);
 	if (status)
-- 
2.41.0.rc0.172.g3f132b7071-goog


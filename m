Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EFF5538EBD
	for <lists+linux-usb@lfdr.de>; Tue, 31 May 2022 12:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245616AbiEaKXP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 May 2022 06:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245439AbiEaKXO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 May 2022 06:23:14 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5225585EE9
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 03:23:13 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id s23so13608152iog.13
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 03:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8L0KmYGjKZ0kAibn+cW4rBl30abrm7aN2sGXSHCJRuk=;
        b=RQBMrNKJ3dnEv3H9N0Gc6U9pD/fwlO/re7oFeDq31jBGgB8+MpkOXbTb722rAERITN
         t068CzpPOX1lkJlpL3NDPztpg+JlBB6KxT/1Uiok1DHFoUatONiwmUnwzxpY8H+48l1v
         xqhYWoLYMq2TR8veIEPUDFXjJP7xNGXV0dqBvcZXnS87VON+PfdiChPwXwKef9KOJima
         4Qspeeo/iOAHl2lHDj9Alln5Afz39XQxsMrTJW8M98qXlbbZGSXzxm58f6SSVG2qshrj
         0ZVFk/32qbYdJR9OcoO83VerokSjfcgeyQG9ERkwp8G55z85mA1Ro8KsO80J8Lx+dR/B
         uPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8L0KmYGjKZ0kAibn+cW4rBl30abrm7aN2sGXSHCJRuk=;
        b=OXjvkRWYU8qE10QejKyWyw2AruWsD6SKQfdvKJe+Ee3DweySJnee4nB4tha4gBTHha
         1fFv0FPnktp3R3jivMXvDfiqSPpTNfcprLAyLw8DVPL2cq4x/VPFGjJwVLl8Jf3DIyTs
         ZrVCaus8wl7ayD04g6F26oEYQPXBdA2zq8z99FT8ZKRzSkCOfo3To+BBUZuUNPuJQNiy
         nuUQXvZ1c6Jl1KRSG20KRsu5sOGMVEBRbXmFan6MlZY7yRYvS6nJsW32voifBxbrU+sk
         FwNJHXOCSk3tKJitljQqlbSMo13HDQNbACuKNZxCJnzGklyjlEPIJn5yXAmYiN2mGw8S
         mKJg==
X-Gm-Message-State: AOAM533V5ntaeZR7B8l7hvCtv2f4zwbkET2V0NB4XTkPxjOKqTX0FFYh
        Vj+KabQ4rczwjt0hMU+iNYM=
X-Google-Smtp-Source: ABdhPJx6YfUdQhVy658v24NM4WKcHM5Nt0aOsnNeTyf83nsu+aKFCdrrTtk+xwgDTXggbCZ4jmnohg==
X-Received: by 2002:a05:6602:2e0d:b0:64f:8bfd:a83 with SMTP id o13-20020a0566022e0d00b0064f8bfd0a83mr25011137iow.200.1653992592639;
        Tue, 31 May 2022 03:23:12 -0700 (PDT)
Received: from LABDL-ITC-SW03.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id cp11-20020a056638480b00b00330c4762d44sm3382114jab.53.2022.05.31.03.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 03:23:12 -0700 (PDT)
From:   Carlo Lobrano <c.lobrano@gmail.com>
To:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Daniele Palmas <dnlplm@gmail.com>,
        Carlo Lobrano <c.lobrano@gmail.com>
Subject: [PATCH v3] USB: serial: option: Add Telit LE910Cx 0x1250 composition
Date:   Tue, 31 May 2022 12:23:01 +0200
Message-Id: <20220531102301.13435-1-c.lobrano@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for the following Telit LE910Cx composition:

0x1250: rmnet, tty, tty, tty, tty

Signed-off-by: Carlo Lobrano <c.lobrano@gmail.com>
---
v3: - fix subject prefix and modem name (s/LN910Cx/LE910Cx)
    - more descriptive e-mail content
v2: use RSVD in place of NCTRL for interface 0 (rmnet)

 drivers/usb/serial/option.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 152ad882657d..cd9aa61ec801 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1275,6 +1275,8 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1231, 0xff),	/* Telit LE910Cx (RNDIS) */
 	  .driver_info = NCTRL(2) | RSVD(3) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1250, 0xff),	/* Telit LE910Cx (rmnet) */
+	  .driver_info = RSVD(0) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, 0x1260),
 	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, 0x1261),
-- 
2.25.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EDBB6C38F7
	for <lists+linux-usb@lfdr.de>; Tue, 21 Mar 2023 19:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbjCUSNr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Mar 2023 14:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbjCUSNq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Mar 2023 14:13:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 764329EE4
        for <linux-usb@vger.kernel.org>; Tue, 21 Mar 2023 11:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679422385;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=7PqcmUw+IZmRGt9WUw0A+lCjcIOG3yrVoicilFi5R4o=;
        b=Y45a5O8g1+HMWmmcW08oa8ZLJw6ndwm6If+RKdYm5BO2H9dcis9+ohFDBU4cVlwxwI+Co+
        SW/Vkfy6jRIRyrr2VG7ehsLDZXIkXkXpfw94NnU2ApcV+e4QzBQWGUCg59WrwNpfhxExK7
        4GNL5fBjKZXbsWInuRnO1FgBmu9nHwE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-vsclKQaNOU29Wy3r4F8N8Q-1; Tue, 21 Mar 2023 14:13:04 -0400
X-MC-Unique: vsclKQaNOU29Wy3r4F8N8Q-1
Received: by mail-qv1-f71.google.com with SMTP id l18-20020ad44bd2000000b005a9cf5f609eso8061319qvw.15
        for <linux-usb@vger.kernel.org>; Tue, 21 Mar 2023 11:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679422383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7PqcmUw+IZmRGt9WUw0A+lCjcIOG3yrVoicilFi5R4o=;
        b=OpEbkVI1br2rqkTNcJBWXR386H4Hd5fcJVtYdAApqzSS5i+yOi8x2ojxtBJ03GsNCT
         3QqBMNa92UtZ2MoJAX1FKsgEN8RWL5zd2XeWEU34akQPR14Bxerk7VGC/p7zQ0e70bJ0
         zB0SjFWczaPK74ZOW0Vo0B4RVYlF65o0cx7sLkq3erENKzLh8JQl+R/eaaFMjNKhMq+U
         yIAM60OqDs3Yg6oU31of3lwtJgHdztxCob8v61NxBxuxrOUoohx8aeAad4GfUwgURah2
         AfiVp+TRsjP9OEgUcr2ewXfEflGJfuIanTkx4/WpvdiNf9am9cSnAVAJepH7Nf88Cqx6
         1ocg==
X-Gm-Message-State: AO0yUKU0IZifYnoCmifi/JM8SMallr9C8zjgUoFs/1CZ60yrDqR2642/
        DzIKYAJXoFERQBVSVctq5/VU16Cv1Vawjflskl3aGOMjOip0KO1c8E+1fWTKOYNs51KaCn3cbGW
        EqddRsZnp3Ir7RHrUU3//O9N0dIRr
X-Received: by 2002:ac8:7c55:0:b0:3e3:8119:7c68 with SMTP id o21-20020ac87c55000000b003e381197c68mr1356030qtv.52.1679422383558;
        Tue, 21 Mar 2023 11:13:03 -0700 (PDT)
X-Google-Smtp-Source: AK7set+5mKIAyTWquc0+eLxRrstoll07nUcDhsg7ybPYJhnq2pOAz549MYFTu+kSCHFP7AxBTc+21g==
X-Received: by 2002:ac8:7c55:0:b0:3e3:8119:7c68 with SMTP id o21-20020ac87c55000000b003e381197c68mr1355993qtv.52.1679422383304;
        Tue, 21 Mar 2023 11:13:03 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id i1-20020a05620a0a0100b0074631fb7ccesm9599518qka.67.2023.03.21.11.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 11:13:03 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     johan@kernel.org, gregkh@linuxfoundation.org, nathan@kernel.org,
        ndesaulniers@google.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Tom Rix <trix@redhat.com>
Subject: [PATCH] USB: serial: quatech2: remove unused qt2_setdevice function
Date:   Tue, 21 Mar 2023 14:12:55 -0400
Message-Id: <20230321181255.1825963-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

clang with W=1 reports
drivers/usb/serial/quatech2.c:179:19: error: unused function
  'qt2_setdevice' [-Werror,-Wunused-function]
static inline int qt2_setdevice(struct usb_device *dev, u8 *data)
                  ^
This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/usb/serial/quatech2.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/usb/serial/quatech2.c b/drivers/usb/serial/quatech2.c
index 6fca40ace83a..fee581409bf6 100644
--- a/drivers/usb/serial/quatech2.c
+++ b/drivers/usb/serial/quatech2.c
@@ -176,14 +176,6 @@ static inline int qt2_control_msg(struct usb_device *dev,
 			       NULL, 0, QT2_USB_TIMEOUT);
 }
 
-static inline int qt2_setdevice(struct usb_device *dev, u8 *data)
-{
-	u16 x = ((u16) (data[1] << 8) | (u16) (data[0]));
-
-	return qt2_control_msg(dev, QT_SET_GET_DEVICE, x, 0);
-}
-
-
 static inline int qt2_getregister(struct usb_device *dev,
 				  u8 uart,
 				  u8 reg,
-- 
2.27.0


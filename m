Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C40C5377EA
	for <lists+linux-usb@lfdr.de>; Mon, 30 May 2022 12:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234541AbiE3JAc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 May 2022 05:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234743AbiE3JAU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 May 2022 05:00:20 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD8577F18
        for <linux-usb@vger.kernel.org>; Mon, 30 May 2022 02:00:19 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id fd25so12620774edb.3
        for <linux-usb@vger.kernel.org>; Mon, 30 May 2022 02:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ljxpyu4EwIB0B764cXsfVgQ81js3u1o9272S+cTdhwg=;
        b=UC87APDRa8o6KfnIJFEowDs82bb13SCG/zBhS1q2hWgeZFySdLYDWSiGIbSeQJyryp
         5ASvZOotNWu/CRxzqX7kiIXuOOwssoBgaGe4DecXpB/LgYOAY1RrfGsXr4ykstD+Pj+Y
         rcAPdAlldrYLcJ/Ly3BSZnhp83BGTK/Db4spqpY0ZLVbSVy8Nosni12V9EJK/Y3CdFC+
         2SdsbeorptOd8NC8IIQ/1iA5gUCJ1pkAV9FcE5bdZ+okh4Mx+Whj1nsWvxAQpVwxxYsH
         sATxcrbOIvgmy6kIl/Xp7Qncf8LzPf2bbqkfliufaKX+YWR9slT6CpBbzXdjGLQ5zkjg
         Fwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ljxpyu4EwIB0B764cXsfVgQ81js3u1o9272S+cTdhwg=;
        b=V0S7DaVnceXNIY2szl15esZytfuBzNNP5tJkT3XbD1AyX7kCkV13JTzhwGFKU1X9X1
         aclGQBKRIaPXZa5yPFf6SL1X24mt5sppDdjkdugCZ52ee0BYAU7aRGTln25RF460dSmI
         tvDr6itKpEZdki6osnsg+/WonLJ5ET/T2cs/r7cePYij2JGN+zRXghe5FvxMGW3gs7d0
         IL8vsucGp7CoqKg3VWO6jzP5hYWxb2/lVaXsVHs1Mc8TnlkZaRk9Z54jNjaJ8AoaSXka
         Mz9JelGK9uD/S6cqDZsTREwKsQAueIETaOw2bBGgw/CA9SW43gMncdWHfRR/b6mvLg77
         xedQ==
X-Gm-Message-State: AOAM531sQZ1/rTFohYfQLZ+4GK2igHNGlXieAyN194rqRnaW0EYvjoIK
        de85EgJZXNWNjykF5EJSA0XaTcTZ5Ho=
X-Google-Smtp-Source: ABdhPJzjrSZsG+KEXVSnetnqO4eECZJ+IAcYNP9efXDdc0XYpgkYu29RrwwjOzHlpIJJwQRkFojjkg==
X-Received: by 2002:a05:6402:3688:b0:42d:d3ba:4725 with SMTP id ej8-20020a056402368800b0042dd3ba4725mr2876701edb.212.1653901217612;
        Mon, 30 May 2022 02:00:17 -0700 (PDT)
Received: from LABDL-ITC-SW03.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id r27-20020a056402235b00b0042abf2affebsm6098510eda.67.2022.05.30.02.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 02:00:17 -0700 (PDT)
From:   Carlo Lobrano <c.lobrano@gmail.com>
To:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Carlo Lobrano <c.lobrano@gmail.com>
Subject: [PATCH v2] usb: serial: Add support for Telit LN910Cx 0x1250 composition
Date:   Mon, 30 May 2022 11:00:03 +0200
Message-Id: <20220530090003.351702-1-c.lobrano@gmail.com>
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

0x1250: rmnet, tty, tty, tty, tty

Signed-off-by: Carlo Lobrano <c.lobrano@gmail.com>
---

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


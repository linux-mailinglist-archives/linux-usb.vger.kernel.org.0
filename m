Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 727FF7915EA
	for <lists+linux-usb@lfdr.de>; Mon,  4 Sep 2023 12:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234334AbjIDKzT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Sep 2023 06:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233259AbjIDKzR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Sep 2023 06:55:17 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77B2F99
        for <linux-usb@vger.kernel.org>; Mon,  4 Sep 2023 03:55:14 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-68a56401c12so693134b3a.2
        for <linux-usb@vger.kernel.org>; Mon, 04 Sep 2023 03:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693824914; x=1694429714; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gvYaoEncFB8pFriWfZJptjzo8dg4icGttQv2rjZDUs=;
        b=Lewg79ZH9vTU6NhKGarnh3hO+YkzlOttKVE5GkALh/6gHn9eEZs4hmw/91FDesO+Bj
         gr9soCJ7yobJYvCZbFLBznlwzyfzEbq9eFsd/8u7K/lDh5Wb87yz1VPjSlRaXwvpsPsq
         DZ7qR6Pd+7JorhNzQCIzSQ12/8DP3ilpoVowrs7Xf2D8T48Us2AFG16A+dStIvmUiGqe
         /W0FZ05Ydpkg1U04AzgJglTFvbUBuUKwUxco+qWoHFK4TOsSsKLjLWVFOhrHg0gKEI0g
         2/oeXilQyK63UFkQBhBuXed+DISKV6A87kiw1i0CnG/FACLKeDSWnnvYlaAnt8ZbGHYc
         t7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693824914; x=1694429714;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8gvYaoEncFB8pFriWfZJptjzo8dg4icGttQv2rjZDUs=;
        b=lFW3Gn8NBq5lOz0SVjKruiP2zYW0sH6tC3/1lElW2oF2Oc4g777X9t3fzy9xuvyTEj
         UqG2tBExig4BYxjbJczWWdUUmB+pOJhIHHfAtg1CLALrQsZg5LI/vbm6K98v+CXDWtjm
         EvFKCQYONmTNGoffOFcGxVYPd6dvkH3pfsiuGX1vtGkS/SwB3rTafyXDmImgctg6EQ+a
         V/2mUWKiE6bkUmJv777XYPucbJbkeNXriKd+JZwsiTZ/NCJayi0+54CFHh7Z0zFFbHgw
         npBvVaWxCEIqVK1kymO84Ht+bJwm+bqmwx+1eoeAxQLaW6ejilElMd/NEJnfT+mlDguQ
         fLeA==
X-Gm-Message-State: AOJu0Ywh3z6c8t8KQ5kTH/o7miY/tOOkqzXaBECn4YOED5VOAuodQhGs
        eBJ/jYZPrNvEQH+2+A+6ZqE=
X-Google-Smtp-Source: AGHT+IGATpKjncxSEymG7NMCGhCfHQr5W3GE56HM2PrK39PcwoYCnpTbwza37ZspI6T6WM+kK4LAHw==
X-Received: by 2002:a05:6a00:1916:b0:68a:3b25:50cc with SMTP id y22-20020a056a00191600b0068a3b2550ccmr8806986pfi.30.1693824913927;
        Mon, 04 Sep 2023 03:55:13 -0700 (PDT)
Received: from localhost ([103.40.76.4])
        by smtp.gmail.com with ESMTPSA id d6-20020aa78686000000b00666b3706be6sm7126189pfo.107.2023.09.04.03.55.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 03:55:13 -0700 (PDT)
From:   "Jiazi.Li" <jqqlijiazi@gmail.com>
X-Google-Original-From: "Jiazi.Li" <jiazi.li@transsion.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Jiazi.Li" <jiazi.li@transsion.com>, linux-usb@vger.kernel.org
Subject: [PATCH] usb: gadget: u_serial: Add null pointer check in gs_close
Date:   Mon,  4 Sep 2023 18:54:55 +0800
Message-Id: <20230904105455.13090-1-jiazi.li@transsion.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If kfifo_alloc return err in gs_open, tty->driver_data will not
be assigned a legal value.
This will result in a NULL pointer issue when calling gs_close in
the following error handling:
tty_open
    ->tty_release
        ->gs_close		
Add a null pointer check in gs_close to prevent this.

Signed-off-by: Jiazi.Li <jiazi.li@transsion.com>
---
 drivers/usb/gadget/function/u_serial.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index a92eb6d90976..9a04b34bbe8c 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -680,6 +680,9 @@ static void gs_close(struct tty_struct *tty, struct file *file)
 	struct gs_port *port = tty->driver_data;
 	struct gserial	*gser;
 
+	if (!port)
+		return;
+
 	spin_lock_irq(&port->port_lock);
 
 	if (port->port.count != 1) {
-- 
2.17.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E24BF213B51
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 15:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgGCNs4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 09:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbgGCNs4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 09:48:56 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05F16C08C5C1
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 06:48:55 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id g2so18534743lfb.0
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 06:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=z7WGnhrv8inryB3FF2p3COaLVkafqC1zohRmYO8QVfk=;
        b=SiICFvYE2kuMzlmRn25NS+UcFD2kIL36I3HKwDOyosV2jLqXDWqZEPhxSyqM+hanPN
         ZfJhYyjeB5l9VvOxgSJssKIyZYBkqcDAvQFbIOtHgxdS6T3WhIxzzYtzwaKiSuwPsHlJ
         8xiic2M6BqUCi8bBVkEolImyGr/PVvWFRTBX0gluoOgPY/ftnjeqJpt0exlMm+1zjZUh
         p0jgEF7VGjXrkGVkFNoPprGYN55X87hq4FEcd41ypqnZIUnYAmmV7LWprkuuZVY5SBP+
         /c4U8siouo1tjyyQ8qYxijMjiDMIZKAUxwzdySEP0XaPh+5gKSerBRCScuLF2cdfD5Yi
         WK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=z7WGnhrv8inryB3FF2p3COaLVkafqC1zohRmYO8QVfk=;
        b=o4j6zEOs2sprl/kehA5MWoT2oAo/Ycf/zldrJ3HPBD2MXyVCBz0AzJfcCtmW61/aLG
         BZgfNys33niogtvF7oRqLbapqRrWiUHD+wfvleVdzx8w8Tq5XKmUDU+TEoyuBXJqMU6j
         2z6SsDckOraK9uBSkVzPCqmVVlMHtqXAfITnGIL6ntR0BI9I2JEiYkn8FzesLFRqDYHW
         N1tSJ81vZezRC8C5hUq85rJnNc6pcIAR+8DBZs8CO5BHG9lZwlkxPXxaIOYBxH9uYO9Q
         kXLxUCWz5klcaUlv2RgQLariLRDUOAncRShayDFYzu+oAUGOMde5SDt9OBgRvhtq0oE5
         bGtA==
X-Gm-Message-State: AOAM532eMIYqSFAH9+/cLV7cdFF3CaH5Z/jYxVHkXwKOpEZwUmbCGs7l
        BS+iE/gSMBwn0XjWyvRbYwI=
X-Google-Smtp-Source: ABdhPJwBsPMlCe1O0iH67UkCIpsMGf5kM7ddF4LnlOigAR8OPnxGrmyyiGVtUpoL10LRFI/OnQeLTw==
X-Received: by 2002:ac2:52ac:: with SMTP id r12mr3926465lfm.175.1593784134320;
        Fri, 03 Jul 2020 06:48:54 -0700 (PDT)
Received: from localhost ([80.64.86.40])
        by smtp.gmail.com with ESMTPSA id w19sm2924508ljm.120.2020.07.03.06.48.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 06:48:53 -0700 (PDT)
From:   Ruslan Bilovol <ruslan.bilovol@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH] usb: gadget: f_uac2: fix AC Interface Header Descriptor wTotalLength
Date:   Fri,  3 Jul 2020 16:49:03 +0300
Message-Id: <20200703134903.5695-1-ruslan.bilovol@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As per UAC2 spec (ch. 4.7.2), wTotalLength of AC Interface
Header Descriptor "includes the combined length of this
descriptor header and all Clock Source, Unit and Terminal
descriptors."

Thus add its size to its wTotalLength.

Also after recent changes wTotalLength is calculated
dynamically, update static definition of uac2_ac_header_descriptor
accordingly

Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
---
 drivers/usb/gadget/function/f_uac2.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index db2d4980cb35..3633df6d7610 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -215,10 +215,7 @@ static struct uac2_ac_header_descriptor ac_hdr_desc = {
 	.bDescriptorSubtype = UAC_MS_HEADER,
 	.bcdADC = cpu_to_le16(0x200),
 	.bCategory = UAC2_FUNCTION_IO_BOX,
-	.wTotalLength = cpu_to_le16(sizeof in_clk_src_desc
-			+ sizeof out_clk_src_desc + sizeof usb_out_it_desc
-			+ sizeof io_in_it_desc + sizeof usb_in_ot_desc
-			+ sizeof io_out_ot_desc),
+	/* .wTotalLength = DYNAMIC */
 	.bmControls = 0,
 };
 
@@ -501,7 +498,7 @@ static void setup_descriptor(struct f_uac2_opts *opts)
 	as_in_hdr_desc.bTerminalLink = usb_in_ot_desc.bTerminalID;
 
 	iad_desc.bInterfaceCount = 1;
-	ac_hdr_desc.wTotalLength = 0;
+	ac_hdr_desc.wTotalLength = cpu_to_le16(sizeof(ac_hdr_desc));
 
 	if (EPIN_EN(opts)) {
 		u16 len = le16_to_cpu(ac_hdr_desc.wTotalLength);
-- 
2.17.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC6D10B232
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2019 16:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727438AbfK0PPG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Nov 2019 10:15:06 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35337 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfK0PPG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Nov 2019 10:15:06 -0500
Received: by mail-wm1-f68.google.com with SMTP id n5so7947689wmc.0
        for <linux-usb@vger.kernel.org>; Wed, 27 Nov 2019 07:15:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=vl5ePDqM2NbCqRJJOzdx9lMYryri4mRLO9xlqH1kqZE=;
        b=d3REp2fDO6gV16yPio+TVrXHj12NI6+D3Lz7XrxlaKJYoDyBBFxi9sd7TXs6gU5Hk8
         6veCdBXUn/rceyYia/g1JgjQKzd433hW4WY27+zBoBYZeHu5zcyWS/+HjbxwBBmORP9J
         fgnd3FaIbpHct/s9Rg2Ia172myrq2tRa3tVzoHpubSyK0TaEDV5F1zKl53ytNHO0QPKE
         eZbRA0yMYPlxeo5214/W+DjQYmqRApS4GXhPpq9tT5I37abfCwzAXLxNSwAXaRREaAi6
         /6bB/aTxTvKwmYTY+421O3j8NEB9rpTiObwhggxDkf8kGXvlmRN6aZzZSNcBKNi8HlX7
         raCg==
X-Gm-Message-State: APjAAAVlUTnnR1a+DRRGIn5OF6DYXT2tqydO9wbW6z31oJ1aTon1Rz0E
        LXzyqvQ2gR+0Bt64VPFFMjJwKxn9xYc=
X-Google-Smtp-Source: APXvYqxpDYBLyDjasywk1RjSB9K5Wq2ja25Z7rc1JdBib2ZGbv5FO2K7++QFCvZj1iYsna1jqVO40w==
X-Received: by 2002:a1c:ed05:: with SMTP id l5mr5152045wmh.161.1574867704989;
        Wed, 27 Nov 2019 07:15:04 -0800 (PST)
Received: from ingrassia.epigenesys.com (host194-85-static.3-79-b.business.telecomitalia.it. [79.3.85.194])
        by smtp.gmail.com with ESMTPSA id f1sm1078591wrp.93.2019.11.27.07.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 07:15:04 -0800 (PST)
Date:   Wed, 27 Nov 2019 16:15:02 +0100
From:   Emiliano Ingrassia <ingrassia@epigenesys.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH] usb: core: urb: explicitly initialize urb_list field in
 usb_init_urb()
Message-ID: <20191127151502.GA26047@ingrassia.epigenesys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
---
 drivers/usb/core/urb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index 0eab79f82ce4..da923ec17612 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -45,6 +45,7 @@ void usb_init_urb(struct urb *urb)
 	if (urb) {
 		memset(urb, 0, sizeof(*urb));
 		kref_init(&urb->kref);
+		INIT_LIST_HEAD(&urb->urb_list);
 		INIT_LIST_HEAD(&urb->anchor_list);
 	}
 }
--
2.24.0


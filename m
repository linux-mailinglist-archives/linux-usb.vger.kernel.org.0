Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 093FDF2F5D
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2019 14:29:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388750AbfKGN3i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Nov 2019 08:29:38 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45169 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388525AbfKGN3i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Nov 2019 08:29:38 -0500
Received: by mail-lj1-f193.google.com with SMTP id n21so2252811ljg.12
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2019 05:29:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KMldmjZNEDlQPHZw4y7grynkhWU7xoAmhFJtHHyHyMY=;
        b=LYv0aB7gmqJji3Fhyik4Ash8n7tnWt1pgM56hQyVGIj8IbrLLDvVdFyUerwQXskuLZ
         WwAl6ZlKxkzfrTwgEGiAB+a5HvuyWJeRctXkyBGnoegIp5WaCQUJIvjqpQmDZMXJFsL8
         SjW3oqcHe8i9sDWihv5WLHzHCEV8V2Q/A1TAwrZOJUaST7dJtncZnASPBbhobaNKZuVX
         /g+ODFt9aa6b3tiBB2m6WVqfCis2GY3kYBuiPBLb7hVRpsa5U5Qi4C7qsRJMx2uVseGq
         gvJEupAceaxrJjmH85umG1FessKKtLRF5Cc+3nXd1rgrAmpKR3DizcliwulLfwK1wsqM
         khXA==
X-Gm-Message-State: APjAAAWKOk9eu1kWtWJdVa6LrUF1ikhVlfiyRuj4Gg5JExOAWEzcJrta
        kxgKPzD38FeEpsRGbaaobZ8=
X-Google-Smtp-Source: APXvYqwctiqQiqO9QZbEe2PJEZjZciyTHtcInuxQbhDSypJGYVZ13fhV9R21JY9C5D3RfQNPC0iDrQ==
X-Received: by 2002:a2e:9112:: with SMTP id m18mr2565052ljg.75.1573133374533;
        Thu, 07 Nov 2019 05:29:34 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id y17sm918053lfy.58.2019.11.07.05.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 05:29:28 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iShqn-0000dj-KQ; Thu, 07 Nov 2019 14:29:25 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 05/11] USB: serial: mos7840: drop redundant urb context check
Date:   Thu,  7 Nov 2019 14:28:58 +0100
Message-Id: <20191107132904.2379-6-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107132904.2379-1-johan@kernel.org>
References: <20191107132904.2379-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The bulk-in URB context is set to the driver-data struct at open and is
never cleared so drop the redundant check in the completion callback.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/mos7840.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
index 9c5956fbd600..92180687097f 100644
--- a/drivers/usb/serial/mos7840.c
+++ b/drivers/usb/serial/mos7840.c
@@ -500,17 +500,13 @@ static struct usb_serial *mos7840_get_usb_serial(struct usb_serial_port *port,
 
 static void mos7840_bulk_in_callback(struct urb *urb)
 {
+	struct moschip_port *mos7840_port = urb->context;
 	int retval;
 	unsigned char *data;
 	struct usb_serial *serial;
 	struct usb_serial_port *port;
-	struct moschip_port *mos7840_port;
 	int status = urb->status;
 
-	mos7840_port = urb->context;
-	if (!mos7840_port)
-		return;
-
 	if (status) {
 		dev_dbg(&urb->dev->dev, "nonzero read bulk status received: %d\n", status);
 		mos7840_port->read_urb_busy = false;
-- 
2.23.0


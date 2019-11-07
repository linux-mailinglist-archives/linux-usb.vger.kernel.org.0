Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC85F2F52
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2019 14:29:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387675AbfKGN3a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Nov 2019 08:29:30 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46808 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729070AbfKGN3a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Nov 2019 08:29:30 -0500
Received: by mail-lj1-f193.google.com with SMTP id e9so2235963ljp.13
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2019 05:29:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4r/F/ivoK5xSMfm2eKEdB73WmR9Rd+NwLR476BvBd0I=;
        b=TBXJfcHvrALZJ4J5O3o2cYaB56lopKe8MJX6myMMaCHFv+TdwNs0sVnBAEzhVZFqkf
         uFPcjN+tJInVdZbYSdJBrhSn3nW7zuKey0z4j5iP9Mp+ZqiJ/G4lv8huA4x3GOVinodm
         C0uHXeSWfy7QAaZnKkNB1icbzdb2eR7aHc5vB9kf2Pn84nYQ8+d44DKmI49kMWlGwB/N
         fLisKfkGjSuxe/65zoyvFn0A8n7+76PWsmGhBhNOdVCOWRD7YeyY2EDfWL/KFCzOBaUu
         4PsHZMWL0+pIrWZOA4OGu0mh4LQkH8r2fJtTEmakZtWhTv5fQ5r9Wgu+G2dX86NQtwoc
         vrHA==
X-Gm-Message-State: APjAAAXlxdTm+kk0SGJctl0fKK+UVE9pBbGH1D5bjGC96AJ5q0+2iR8Z
        97ye9lLK87oA2Nu6j+vKiMA=
X-Google-Smtp-Source: APXvYqyXmqRzwEmDcodMrwAkoADtdV7DZgLjf7FJEOrdlJ2xw6dejHGCNxBLBq31IekOezeiqX4/kg==
X-Received: by 2002:a2e:b4c1:: with SMTP id r1mr2540310ljm.203.1573133368314;
        Thu, 07 Nov 2019 05:29:28 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id p8sm1210257ljn.0.2019.11.07.05.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 05:29:23 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iShqn-0000dS-BI; Thu, 07 Nov 2019 14:29:25 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 02/11] USB: serial: mos7840: document MCS7810 detection hack
Date:   Thu,  7 Nov 2019 14:28:55 +0100
Message-Id: <20191107132904.2379-3-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107132904.2379-1-johan@kernel.org>
References: <20191107132904.2379-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Document the MCS7810 detection hack which relies on having the GPO and
GPI pins connected as recommended by ASIX.

Note that GPO (pin 42) is really RTS of the third port which will be
toggled for the corresponding physical port on two- and four-port
devices.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/mos7840.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
index f13cf723fa6c..6de41a3c2dab 100644
--- a/drivers/usb/serial/mos7840.c
+++ b/drivers/usb/serial/mos7840.c
@@ -1955,6 +1955,13 @@ static int mos7840_ioctl(struct tty_struct *tty,
 	return -ENOIOCTLCMD;
 }
 
+/*
+ * Check if GPO (pin 42) is connected to GPI (pin 33) as recommended by ASIX
+ * for MCS7810 by bit-banging a 16-bit word.
+ *
+ * Note that GPO is really RTS of the third port so this will toggle RTS of
+ * port two or three on two- and four-port devices.
+ */
 static int mos7810_check(struct usb_serial *serial)
 {
 	int i, pass_count = 0;
-- 
2.23.0


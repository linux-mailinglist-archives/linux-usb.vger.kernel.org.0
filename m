Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D247688BD7
	for <lists+linux-usb@lfdr.de>; Sat, 10 Aug 2019 17:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbfHJPFD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 10 Aug 2019 11:05:03 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41590 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbfHJPFD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 10 Aug 2019 11:05:03 -0400
Received: by mail-lf1-f65.google.com with SMTP id 62so66684009lfa.8
        for <linux-usb@vger.kernel.org>; Sat, 10 Aug 2019 08:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X0SVgB3hTGST7nqpvoFejGqz86qw1oYwy3TMBUWpuKY=;
        b=CHoezcXaZHmx0amETbz2IKzpx0Jua9qfQ1bl6EsE7BvZYiL05gmhLlXIpoqrB5aIp3
         XKVsVzDxWI1LXJkt03ZLAwZ6WtY18SbYkPDKVfHMf64HXB4r6PrNY4mpSSy5k/xjX+Xt
         mGpDHGlX8eS54CwlXdyNZrcdK7rw8uVMFCvVOgW12UkwDRuQsZ+oAK/+NE8Jgv6roM0u
         WsYCuieU4qO7IGCwVpSKYDSvfcRPXELS0ZUOoqrk65T8zQobllsgwb13ueikWWYf/2MS
         mKpB/Xn7fmRAxBYSE0Pp6+/bFEnnbxGFqolpt4bR4Uy0lq0UvzU+F9srTpc0ViPRBHod
         w+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X0SVgB3hTGST7nqpvoFejGqz86qw1oYwy3TMBUWpuKY=;
        b=mYLNrjm+AWTpvt4fjZgfqb5QZgBK2QZEttkE4Wi+yWqKudgfnxGLUNICu+c7QRkbnO
         /aUHxTpnt1flTrr2e5UKBZHr0J7A6T7OuX3FoRf8sqx0G95D8KxgbvsGl0+kXCJJH7JJ
         HZDh3JaGQTdUcUvQ5sJIrbUnFipZHTX3QqbAZUu5ygtjnxY+wO4Itoq1m8z267zYIMMo
         8RrV4vLpsRKVGnUsYsUxYkVWoUIVfENGfqQ3Uw0jRrFwWcubxRspQkWKdW2LE7GpG4zO
         nVtMtdUyrCDEFQPGp7WSCBlZYsC6RwWXPARLDiEO+ILtPf/BfXFKL/9JlHS5pBazBWsy
         R3Tw==
X-Gm-Message-State: APjAAAXNyxJ7cQKI9/VAjUF70iChECIo+h3I6DoPSpNG/i0yPjbdWXjF
        I2z+J6plOkDMp2TXpXyclGIJ8+aA5sypPQ==
X-Google-Smtp-Source: APXvYqxRe6PWxT/qawjxk/T30aZXyL/829yZBohZJcCZNLcoC3KI5/o2A06fk9qPVetDsMJFMZQJ8g==
X-Received: by 2002:a19:8586:: with SMTP id h128mr16169179lfd.62.1565449501563;
        Sat, 10 Aug 2019 08:05:01 -0700 (PDT)
Received: from localhost.bredbandsbolaget (c-2ccd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.44])
        by smtp.gmail.com with ESMTPSA id k27sm19822161lfm.90.2019.08.10.08.04.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 10 Aug 2019 08:05:00 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] usb: host: fotg2: restart hcd after port reset
Date:   Sat, 10 Aug 2019 17:04:58 +0200
Message-Id: <20190810150458.817-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Hans Ulli Kroll <ulli.kroll@googlemail.com>

On the Gemini SoC the FOTG2 stalls after port reset
so restart the HCD after each port reset.

Signed-off-by: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/host/fotg210-hcd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/fotg210-hcd.c b/drivers/usb/host/fotg210-hcd.c
index 35f69bce40d9..8ee28f5b7957 100644
--- a/drivers/usb/host/fotg210-hcd.c
+++ b/drivers/usb/host/fotg210-hcd.c
@@ -1633,6 +1633,10 @@ static int fotg210_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			/* see what we found out */
 			temp = check_reset_complete(fotg210, wIndex, status_reg,
 					fotg210_readl(fotg210, status_reg));
+
+			/* restart schedule */
+			fotg210->command |= CMD_RUN;
+			fotg210_writel(fotg210, fotg210->command, &fotg210->regs->command);
 		}
 
 		if (!(temp & (PORT_RESUME|PORT_RESET))) {
-- 
2.21.0


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E485021D411
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jul 2020 12:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729637AbgGMKza (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jul 2020 06:55:30 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40975 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729390AbgGMKz3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jul 2020 06:55:29 -0400
Received: by mail-lj1-f194.google.com with SMTP id z24so17045608ljn.8
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2020 03:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zHz8NknCTaxz5a5UDHP74or+j+uZtzHJd5Oje+2RAAU=;
        b=Z6k23mahE7Xjpj6NVEhrSuV9t9iK93MBAFKMBqE0H4ckRe5LqEibXTQm/v1nK1TNfr
         NX4AgpNF53zhu7ZJOKpS1UZ3jcpjm5B9MYmFy7UVw9E/D0asWDBhWVJEbNfBj/vXN/tk
         lDAtU3FzH4q2vWp++l+EDxleK6IulXdf8NPkRujui6H4IfZWUuI4/cYqeQeYgA6SYqwr
         mmFMyrEZckdywOKW+Yo4lrXzg7sZqNnWdSgrQ2nTVzQqEC8RGMiyBUrtvMtJcFxgMX8s
         i8Aft5lwOGgnMILT9UvN36p6PGG/aVk1IMBjxhVYjNCM1bwIWgB15WUGgIIBv21gWcs3
         7kOA==
X-Gm-Message-State: AOAM532zZWtDbc6iJJ475gZlzvLdsUR4lohovfvTktCOtSz5IBLbK92+
        M2yq0dGRfOLOv82OuVSKdmB+0hTpFH0=
X-Google-Smtp-Source: ABdhPJxaWRgS+pgaIfelIc/fIDB8Ca5Kp1pc3GTb2a6U5zEF3jiafAy2cwz+XKGkn/cnvqyNKdZsXA==
X-Received: by 2002:a2e:9619:: with SMTP id v25mr50266132ljh.324.1594637727379;
        Mon, 13 Jul 2020 03:55:27 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id a22sm4548804lfg.96.2020.07.13.03.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 03:55:26 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1juw7S-0007FN-8X; Mon, 13 Jul 2020 12:55:34 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     =?UTF-8?q?Jarom=C3=ADr=20=C5=A0korpil?= <Jerry@jrr.cz>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 3/5] USB: serial: cp210x: add support for TIOCGICOUNT
Date:   Mon, 13 Jul 2020 12:55:15 +0200
Message-Id: <20200713105517.27796-4-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200713105517.27796-1-johan@kernel.org>
References: <20200713105517.27796-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Enable TIOCGICOUNT to allow reading out the (unused) interrupt counters
and error statistics.

Note that modem-status events are currently left unimplemented as they
appear to be buffered on at least CP2102 and therefore cannot be used to
implement TIOCMIWAIT.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/cp210x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index 02e4acb2823b..3a65be4a0ec0 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -291,6 +291,7 @@ static struct usb_serial_driver cp210x_device = {
 	.unthrottle		= usb_serial_generic_unthrottle,
 	.tiocmget		= cp210x_tiocmget,
 	.tiocmset		= cp210x_tiocmset,
+	.get_icount		= usb_serial_generic_get_icount,
 	.attach			= cp210x_attach,
 	.disconnect		= cp210x_disconnect,
 	.release		= cp210x_release,
-- 
2.26.2


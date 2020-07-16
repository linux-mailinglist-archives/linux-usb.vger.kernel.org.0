Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5621C221EF0
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jul 2020 10:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbgGPIvT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jul 2020 04:51:19 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44818 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgGPIvS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jul 2020 04:51:18 -0400
Received: by mail-lf1-f66.google.com with SMTP id y18so2860071lfh.11
        for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2020 01:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ypdYuxWlVt0iVQAAP2taHUEw+zsMDy2Mhe6Tvu/DYhc=;
        b=P9VA+gWKz+slj0zO7C9baMcHb5va3BOu5ZEd4OthlTrSNnuhWstevvbdk4ByCbkGaM
         VMCvJ5OtoIu+UA+aP9plwH1x6g1sKdXtkT4JEEpAv6lFud5nNquVLM3SDgjX61WWai55
         QpxCXC29tHg0xotJyYJwAoAKbWUzwSaOev/3KxKeyjgln0bXWG32InjALDbAih1Jar3A
         Rhj1OlKhHldDwiENT96iOB0JSFSNlqGU0u/YggpJpQO10y+q5CKApQUmG+YSjz28D+dU
         WUArPy0lgXUs4RKFn9uIinNmRPqqEOHP5yMHxcbFggT3AXOovsCjeRExntDQqeiS9vRv
         ooDQ==
X-Gm-Message-State: AOAM532OPe7dNxK1Tit+kS3OGcqNgKQzOks1CrvLpzDy0F10XAAJrBFm
        NlDVoGsC1T91Dt7JC89Rr/nOZ9XPhMg=
X-Google-Smtp-Source: ABdhPJy2ZyzaVUXsmAE1khizQiJl6GhKMg1M7SI4n+lbzBbkoQuaiCI0dzKWo35p+Sp1l8X2T3gcNw==
X-Received: by 2002:ac2:5e6e:: with SMTP id a14mr1603554lfr.79.1594889476415;
        Thu, 16 Jul 2020 01:51:16 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id u5sm1247108lfm.81.2020.07.16.01.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 01:51:15 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1jvzc4-0008CU-57; Thu, 16 Jul 2020 10:51:32 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>, George Spelvin <lkml@sdf.org>
Subject: [PATCH] USB: serial: iuu_phoenix: fix led-activity helpers
Date:   Thu, 16 Jul 2020 10:50:55 +0200
Message-Id: <20200716085056.31471-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The set-led command is eight bytes long and starts with a command byte
followed by six bytes of RGB data and ends with a byte encoding a
frequency (see iuu_led() and iuu_rgbf_fill_buffer()).

The led activity helpers had a few long-standing bugs which corrupted
the command packets by inserting a second command byte and thereby
offsetting the RGB data and dropping the frequency in non-xmas mode.

In xmas mode, a related off-by-one error left the frequency field
uninitialised.

Fixes: 60a8fc017103 ("USB: add iuu_phoenix driver")
Reported-by: George Spelvin <lkml@sdf.org>
Signed-off-by: Johan Hovold <johan@kernel.org>
---

George,

Thanks for reporting this issue and sorry for not getting back to you
sooner about this. It was sort buried in that long RFC series of yours
which was about something unrelated (and your patch did two distinct
logical changes in one patch which is generally frowned upon):

	https://lore.kernel.org/r/202003281643.02SGhKg2024958@sdf.org

Let me know if you prefer to respin your fix, and then include also the
fix of the related issue in iuu_led_activity_off().

Otherwise I'll apply this one next week.

Johan



 drivers/usb/serial/iuu_phoenix.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/serial/iuu_phoenix.c b/drivers/usb/serial/iuu_phoenix.c
index 0c2c4aea289c..b4ba79123d9d 100644
--- a/drivers/usb/serial/iuu_phoenix.c
+++ b/drivers/usb/serial/iuu_phoenix.c
@@ -350,10 +350,11 @@ static void iuu_led_activity_on(struct urb *urb)
 {
 	struct usb_serial_port *port = urb->context;
 	char *buf_ptr = port->write_urb->transfer_buffer;
-	*buf_ptr++ = IUU_SET_LED;
+
 	if (xmas) {
-		get_random_bytes(buf_ptr, 6);
-		*(buf_ptr+7) = 1;
+		buf_ptr[0] = IUU_SET_LED;
+		get_random_bytes(buf_ptr + 1, 6);
+		buf_ptr[7] = 1;
 	} else {
 		iuu_rgbf_fill_buffer(buf_ptr, 255, 255, 0, 0, 0, 0, 255);
 	}
@@ -370,13 +371,14 @@ static void iuu_led_activity_off(struct urb *urb)
 {
 	struct usb_serial_port *port = urb->context;
 	char *buf_ptr = port->write_urb->transfer_buffer;
+
 	if (xmas) {
 		iuu_rxcmd(urb);
 		return;
-	} else {
-		*buf_ptr++ = IUU_SET_LED;
-		iuu_rgbf_fill_buffer(buf_ptr, 0, 0, 255, 255, 0, 0, 255);
 	}
+
+	iuu_rgbf_fill_buffer(buf_ptr, 0, 0, 255, 255, 0, 0, 255);
+
 	usb_fill_bulk_urb(port->write_urb, port->serial->dev,
 			  usb_sndbulkpipe(port->serial->dev,
 					  port->bulk_out_endpointAddress),
-- 
2.26.2


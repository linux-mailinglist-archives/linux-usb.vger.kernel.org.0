Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7643569EA
	for <lists+linux-usb@lfdr.de>; Wed,  7 Apr 2021 12:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351243AbhDGKkU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Apr 2021 06:40:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:49096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244114AbhDGKkA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 7 Apr 2021 06:40:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B4CF613DF;
        Wed,  7 Apr 2021 10:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617791990;
        bh=sNeOBPVqsjxF0gDECWn/9gulNwkDtwDce1h8BbPrewQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DLjk8w3xPIhjVmdzQnyX6yScGs+rVR1KZLTEHn50yX1kvuz6FaRX+5RnC1LuvOike
         LSFjowa3IEvzOwlM1nHFIjkd99fqN8cmqBfXlMagHLdnUwBJVDPcSUW2KTkprG6Ydz
         KnPHOpPgdIZOjYapg1qwVq13nqXoAYCqn/UqR1ND/eCDwk5I1ZNYu2AZ7n9+6pR9V0
         8Rw/W85lg+BCwVgBhLxy3Uc/m9Y0iLS4O59qe8y4HnzV2GMjBqoHaLQcmvaUUvYzt9
         rJP++xO8XYYiTDXnQ37K40clFpCYkXuFawEpDOCuO5h7zS3QpZM2hKE7CvS/ERLuim
         YCECRaosz2WGA==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lU5b5-0000F6-9z; Wed, 07 Apr 2021 12:39:43 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 12/24] USB: serial: ssu100: fix TIOCGSERIAL implementation
Date:   Wed,  7 Apr 2021 12:39:13 +0200
Message-Id: <20210407103925.829-13-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407103925.829-1-johan@kernel.org>
References: <20210407103925.829-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

TIOCSSERIAL is a horrid, underspecified, legacy interface which for most
serial devices is only useful for setting the close_delay and
closing_wait parameters.

The xmit_fifo_size parameter could be used to set the hardware transmit
fifo size of a legacy UART when it could not be detected, but the
interface is limited to eight bits and should be left unset when not
used.

Similarly, baud_base could be used to set the UART base clock when it
could not be detected but might as well be left unset when it is not
known.

The close_delay and closing_wait parameters returned by TIOCGSERIAL are
specified in centiseconds (not jiffies). The driver does not yet support
changing these, but let's report back the default values actually used
(0.5 and 30 seconds, respectively).

Fixes: 52af95459939 ("USB: add USB serial ssu100 driver")
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/ssu100.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/serial/ssu100.c b/drivers/usb/serial/ssu100.c
index 89fdc5c19285..c4616c37f33f 100644
--- a/drivers/usb/serial/ssu100.c
+++ b/drivers/usb/serial/ssu100.c
@@ -337,12 +337,9 @@ static int get_serial_info(struct tty_struct *tty,
 	struct usb_serial_port *port = tty->driver_data;
 
 	ss->line		= port->minor;
-	ss->port		= 0;
-	ss->irq			= 0;
-	ss->xmit_fifo_size	= port->bulk_out_size;
-	ss->baud_base		= 9600;
-	ss->close_delay		= 5*HZ;
-	ss->closing_wait	= 30*HZ;
+	ss->close_delay		= 50;
+	ss->closing_wait	= 3000;
+
 	return 0;
 }
 
-- 
2.26.3


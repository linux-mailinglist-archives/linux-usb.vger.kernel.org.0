Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 309BC703AF
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2019 17:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728942AbfGVP0J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jul 2019 11:26:09 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:41103 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728931AbfGVP0J (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Jul 2019 11:26:09 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 45sllh4zKfzGX;
        Mon, 22 Jul 2019 17:24:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1563809088; bh=iFR7o9fGK3lbkCJi9BQ0wocBKjRvGrCENFlnwDbZSZU=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=D8rhhE39r0VoTtlggMchwnKK+rWchUIppqF68bHcENs5w2tUR2hd3WR52iO4Fu9k/
         lcj55DNvwcQ+vWccEwJVmZYVhQLxneZcStHdchCxLuU+v13j+EN3+gCu3YDf9Qu0fv
         xEQWn4z/ElPX9YXLyud8NzdHd9U30SZw5M37FjeC6B+MtGrthq6IYLIMv3QI/L01vt
         52LwSAvz3H+f/O3n54CtWs2trYwjDuc6G09x6hd1iog9x26SqDa47ZbkfCAGzCaDBI
         6OfdDm+UbTVdMrbZ7klwEVNpcxHE6M18fBPwauZ6YUVeG3SQ/LtXG9kpU6u94odhh9
         AjtKybUygilRQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date:   Mon, 22 Jul 2019 17:26:07 +0200
Message-Id: <88d0237995cd3c1498511c17597cb5c4098916f2.1563809035.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1563809035.git.mirq-linux@rere.qmqm.pl>
References: <cover.1563809035.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v5 1/6] usb: gadget: u_serial: add missing port entry locking
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-usb@vger.kernel.org
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ladislav Michl <ladis@linux-mips.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

gserial_alloc_line() misses locking (for a release barrier) while
resetting port entry on TTY allocation failure. Fix this.

Cc: stable@vger.kernel.org
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Tested-by: Ladislav Michl <ladis@linux-mips.org>

---
  v5: no changes
  v4: no changes
  v3: cc-stable
  v2: no changes

---
 drivers/usb/gadget/function/u_serial.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 65f634ec7fc2..bb1e2e1d0076 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -1239,8 +1239,10 @@ int gserial_alloc_line(unsigned char *line_num)
 				__func__, port_num, PTR_ERR(tty_dev));
 
 		ret = PTR_ERR(tty_dev);
+		mutex_lock(&ports[port_num].lock);
 		port = ports[port_num].port;
 		ports[port_num].port = NULL;
+		mutex_unlock(&ports[port_num].lock);
 		gserial_free_port(port);
 		goto err;
 	}
-- 
2.20.1


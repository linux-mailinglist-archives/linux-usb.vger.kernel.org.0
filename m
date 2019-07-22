Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF1B703B1
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2019 17:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728953AbfGVP0M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jul 2019 11:26:12 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:18673 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728850AbfGVP0L (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Jul 2019 11:26:11 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 45sllj2cLLzKH;
        Mon, 22 Jul 2019 17:24:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1563809089; bh=Lhqtef4oXYOK0jrjWX8/bLKkzChx4mU8Ytd6fmGoecs=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=dXWsZkZZqb+J/aHckDbp5p+WhLKD13TiWM416iLjy1W77pGZFNs4+Ms2atBdImCVz
         t1gvn7zC6dkR4Sc5DSFiJDudxkm/ke9UcCE0iajPQ6OdtSxa50gL2v+eCOUUbgt9MT
         ZuyDPo9Q451jh89d9LJ0qtwPgKoWX5qT3kXpqhxFbWpn+KulsTsEx8w/YvRv793LLm
         9lMnXh8NwL2gmIYKuFEHjg8k4JUbz5FtpGe6wqSZd1CLMfHNhjeTOoMUzl5WbMFmNm
         z5p5f6GzBsfCbE8DfU7GHCD8Kiu1CnBD9bdqddejvC7yz9Mj0MPExXMyuFo+fmM/xE
         FZMPG94vxwMAQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date:   Mon, 22 Jul 2019 17:26:08 +0200
Message-Id: <04c2ceba6fe98ab7de71b1dbfce000bc69ec787e.1563809035.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1563809035.git.mirq-linux@rere.qmqm.pl>
References: <cover.1563809035.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v5 3/6] usb: gadget: u_serial: make OBEX port not a console
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

Prevent OBEX serial port from ever becoming a console. Console messages
will definitely break the protocol, and since you have to instantiate
the port making it explicitly for OBEX, there is no point in allowing
console to break it by mistake.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
  v5: no changes
  v4: no changes
  v3: rename gserial_alloc_line_raw() -> gserial_alloc_line_no_console()
  v2: change of API
    + commit message massage

---
 drivers/usb/gadget/function/f_obex.c   |  2 +-
 drivers/usb/gadget/function/u_serial.c | 16 ++++++++++++----
 drivers/usb/gadget/function/u_serial.h |  1 +
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/function/f_obex.c b/drivers/usb/gadget/function/f_obex.c
index 55b7f57d2dc7..ab26d84ed95e 100644
--- a/drivers/usb/gadget/function/f_obex.c
+++ b/drivers/usb/gadget/function/f_obex.c
@@ -432,7 +432,7 @@ static struct usb_function_instance *obex_alloc_inst(void)
 		return ERR_PTR(-ENOMEM);
 
 	opts->func_inst.free_func_inst = obex_free_inst;
-	ret = gserial_alloc_line(&opts->port_num);
+	ret = gserial_alloc_line_no_console(&opts->port_num);
 	if (ret) {
 		kfree(opts);
 		return ERR_PTR(ret);
diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 94f6999e8262..62280c23cde2 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -1180,7 +1180,7 @@ void gserial_free_line(unsigned char port_num)
 }
 EXPORT_SYMBOL_GPL(gserial_free_line);
 
-int gserial_alloc_line(unsigned char *line_num)
+int gserial_alloc_line_no_console(unsigned char *line_num)
 {
 	struct usb_cdc_line_coding	coding;
 	struct gs_port			*port;
@@ -1221,12 +1221,20 @@ int gserial_alloc_line(unsigned char *line_num)
 		goto err;
 	}
 	*line_num = port_num;
-
-	if (!port_num)
-		gs_console_init(port);
 err:
 	return ret;
 }
+EXPORT_SYMBOL_GPL(gserial_alloc_line_no_console);
+
+int gserial_alloc_line(unsigned char *line_num)
+{
+	int ret = gserial_alloc_line_no_console(line_num);
+
+	if (!ret && !*line_num)
+		gs_console_init(ports[*line_num].port);
+
+	return ret;
+}
 EXPORT_SYMBOL_GPL(gserial_alloc_line);
 
 /**
diff --git a/drivers/usb/gadget/function/u_serial.h b/drivers/usb/gadget/function/u_serial.h
index 9acaac1cbb75..8b472b0c8cb4 100644
--- a/drivers/usb/gadget/function/u_serial.h
+++ b/drivers/usb/gadget/function/u_serial.h
@@ -54,6 +54,7 @@ struct usb_request *gs_alloc_req(struct usb_ep *ep, unsigned len, gfp_t flags);
 void gs_free_req(struct usb_ep *, struct usb_request *req);
 
 /* management of individual TTY ports */
+int gserial_alloc_line_no_console(unsigned char *port_line);
 int gserial_alloc_line(unsigned char *port_line);
 void gserial_free_line(unsigned char port_line);
 
-- 
2.20.1


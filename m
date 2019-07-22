Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC8270355
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2019 17:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728189AbfGVPOk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jul 2019 11:14:40 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:51918 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728152AbfGVPOk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Jul 2019 11:14:40 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 45slVR27BzzGX;
        Mon, 22 Jul 2019 17:13:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1563808399; bh=DBNuW0YJwUvtAyAvubxDi0qtQK0nSYUvCbj08GjxcEY=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=ByumiXL80+AtTaoy6T9POcTEZeQ7ZR35nmqhqgbt28URgzPCeBppKg7F4BfJ7XTJ5
         AJEetigSy3/toUz6BP3yC2ggoFTy3y5i8bwANbHjtavn5WdRzkHMyjrZhy18z8A21J
         JfA1aeNBzMSpo3fEB2loHNXdYmt83VitHJCYMH24kz6Jb1vQ6/pvBZT9AKEH1YqeBF
         qDJwkS/qGWmUVmV15GkXXkOWiMdIlz8fuYXRoYxD9sQydaIQ3m7lkzJxq/6WmtjzlO
         dOKmWEViw7SXmkR4K5JpDURuQ6949sSF0V/MHwb5T+UoR27Dxb2gaXEQyi/raLzIkT
         P768ozSja4HEA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date:   Mon, 22 Jul 2019 17:14:38 +0200
Message-Id: <136348ea5b8eaee8d45fb4beb9b15c832243bd5b.1563808218.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1563808218.git.mirq-linux@rere.qmqm.pl>
References: <cover.1563808218.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v4 1/6] usb: gadget: u_serial: add missing port entry locking
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


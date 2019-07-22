Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F029470359
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2019 17:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728222AbfGVPOn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jul 2019 11:14:43 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:12445 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728152AbfGVPOm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Jul 2019 11:14:42 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 45slVS5P2dzPY;
        Mon, 22 Jul 2019 17:13:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1563808400; bh=TdT9n1Ywbi3S34fc4ws+j1DBivDFgXdJh+HjmrViuK8=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=Oy1r4i0sqX5+dA3NmkrvCxla0ywfeGvtWIV7SWrc507UGN7Oe03IvBMxnqv8U+tmS
         OIUBcTPcXXyXoxhJgVxhz/L2LGuRzgKXNksOmIpQS69cxSH0k/KArpUHUH1udx0Ab8
         WsUqxV5pndnTyQRszQayVyu/vs1tXNDXA/x3RJTurb0LFhsZVA4noj909vDUmx6sT5
         N7NHYVgwnn3taOUQsCzFKbA0TvgMv3k+PSAta1AMRWv9flOV84mNR7lXqM7+ma7H6/
         JdVcHzGo0wUDGxRWnL1hDoEVId+JWIBt+ilUnNPRKVNFVLAlPdunKojP44COhBTURo
         DG5x+3JQ/ONoA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date:   Mon, 22 Jul 2019 17:14:39 +0200
Message-Id: <728d64c793a7aade68fb9d3488ba017492f8eded.1563808218.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1563808218.git.mirq-linux@rere.qmqm.pl>
References: <cover.1563808218.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v4 6/6] USB: gadget: legacy/serial: allow dynamic removal
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

Legacy serial USB gadget is still useful as an early console,
before userspace is up. Later it could be replaced with proper
configfs-configured composite gadget - that use case is enabled
by this patch.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>

---
  v4: initial revision, new in the patchset

---
 drivers/usb/gadget/legacy/serial.c | 49 +++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/serial.c b/drivers/usb/gadget/legacy/serial.c
index de30d7628eef..da44f89f5e73 100644
--- a/drivers/usb/gadget/legacy/serial.c
+++ b/drivers/usb/gadget/legacy/serial.c
@@ -97,6 +97,36 @@ static unsigned n_ports = 1;
 module_param(n_ports, uint, 0);
 MODULE_PARM_DESC(n_ports, "number of ports to create, default=1");
 
+static bool enable = true;
+
+static int switch_gserial_enable(bool do_enable);
+
+static int enable_set(const char *s, const struct kernel_param *kp)
+{
+	bool do_enable;
+	int ret;
+
+	if (!s)	/* called for no-arg enable == default */
+		return 0;
+
+	ret = strtobool(s, &do_enable);
+	if (ret || enable == do_enable)
+		return ret;
+
+	ret = switch_gserial_enable(do_enable);
+	if (!ret)
+		enable = do_enable;
+
+	return ret;
+}
+
+static const struct kernel_param_ops enable_ops = {
+	.set = enable_set,
+	.get = param_get_bool,
+};
+
+module_param_cb(enable, &enable_ops, &enable, 0644);
+
 /*-------------------------------------------------------------------------*/
 
 static struct usb_configuration serial_config_driver = {
@@ -240,6 +270,19 @@ static struct usb_composite_driver gserial_driver = {
 	.unbind		= gs_unbind,
 };
 
+static int switch_gserial_enable(bool do_enable)
+{
+	if (!serial_config_driver.label)
+		/* init() was not called, yet */
+		return 0;
+
+	if (do_enable)
+		return usb_composite_probe(&gserial_driver);
+
+	usb_composite_unregister(&gserial_driver);
+	return 0;
+}
+
 static int __init init(void)
 {
 	/* We *could* export two configs; that'd be much cleaner...
@@ -266,12 +309,16 @@ static int __init init(void)
 	}
 	strings_dev[STRING_DESCRIPTION_IDX].s = serial_config_driver.label;
 
+	if (!enable)
+		return 0;
+
 	return usb_composite_probe(&gserial_driver);
 }
 module_init(init);
 
 static void __exit cleanup(void)
 {
-	usb_composite_unregister(&gserial_driver);
+	if (enable)
+		usb_composite_unregister(&gserial_driver);
 }
 module_exit(cleanup);
-- 
2.20.1


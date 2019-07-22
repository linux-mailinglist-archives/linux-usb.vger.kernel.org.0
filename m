Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDE417035F
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2019 17:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbfGVPOn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jul 2019 11:14:43 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:63343 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728170AbfGVPOm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Jul 2019 11:14:42 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 45slVS1DPPzLD;
        Mon, 22 Jul 2019 17:13:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1563808400; bh=cP8Dq9CjSBWX918uwEZHXky22UdYhXp96dosoGdXsUA=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=cFRxQO+RGbp4QHnrl4ig8yiwKHMvhxkPv8PAjw9ZZREf3bd2g/HMn2jfixtGJUiQP
         hGaaWU7AQQOE+DpT/B2cbzPeC9bVBo4sri5fhJkuwRLFqkcpgMlqXftjspz3/43dUD
         x/lnJqb6djWPvZZl4jnJKAQ+PD2C2B6eMbw6SofvKdkI0Ctbz+WD//NKZrFT3L59Np
         2YMLkR1y7Nr5BnBtkxSLvT8Aeprg/OEIajdzOnemYzzHlvEOmuut4IAz76xCx4eXHf
         O2zlCXmavSzPdJuY/wBs8CX5yYfIO+Opd4o4zOhFCr9LoYdmIIxP+8jJM3Wo5BCyp7
         eqTiDPcRHwESw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date:   Mon, 22 Jul 2019 17:14:39 +0200
Message-Id: <0f82c726dcf2d4c7819a7ccfb7be250b031884f7.1563808218.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1563808218.git.mirq-linux@rere.qmqm.pl>
References: <cover.1563808218.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v4 4/6] usb: gadget: u_serial: allow more console gadget ports
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

Allow configuring more than one console using USB serial or ACM gadget.

By default, only first (ttyGS0) is a console, but this may be changed
using function's new "console" attribute.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>

---
  v4: fixed locking in gserial_set_console()
  v3: no changes
  v2: no changes

---
 drivers/usb/gadget/function/f_acm.c    | 21 +++++++++++
 drivers/usb/gadget/function/f_serial.c | 21 +++++++++++
 drivers/usb/gadget/function/u_serial.c | 48 ++++++++++++++++++++++++++
 drivers/usb/gadget/function/u_serial.h |  7 ++++
 4 files changed, 97 insertions(+)

diff --git a/drivers/usb/gadget/function/f_acm.c b/drivers/usb/gadget/function/f_acm.c
index 9fc98de83624..7c152c28b26c 100644
--- a/drivers/usb/gadget/function/f_acm.c
+++ b/drivers/usb/gadget/function/f_acm.c
@@ -771,6 +771,24 @@ static struct configfs_item_operations acm_item_ops = {
 	.release                = acm_attr_release,
 };
 
+#ifdef CONFIG_U_SERIAL_CONSOLE
+
+static ssize_t f_acm_console_store(struct config_item *item,
+		const char *page, size_t count)
+{
+	return gserial_set_console(to_f_serial_opts(item)->port_num,
+				   page, count);
+}
+
+static ssize_t f_acm_console_show(struct config_item *item, char *page)
+{
+	return gserial_get_console(to_f_serial_opts(item)->port_num, page);
+}
+
+CONFIGFS_ATTR(f_acm_, console);
+
+#endif /* CONFIG_U_SERIAL_CONSOLE */
+
 static ssize_t f_acm_port_num_show(struct config_item *item, char *page)
 {
 	return sprintf(page, "%u\n", to_f_serial_opts(item)->port_num);
@@ -779,6 +797,9 @@ static ssize_t f_acm_port_num_show(struct config_item *item, char *page)
 CONFIGFS_ATTR_RO(f_acm_, port_num);
 
 static struct configfs_attribute *acm_attrs[] = {
+#ifdef CONFIG_U_SERIAL_CONSOLE
+	&f_acm_attr_console,
+#endif
 	&f_acm_attr_port_num,
 	NULL,
 };
diff --git a/drivers/usb/gadget/function/f_serial.c b/drivers/usb/gadget/function/f_serial.c
index c860f30a0ea2..1406255d0865 100644
--- a/drivers/usb/gadget/function/f_serial.c
+++ b/drivers/usb/gadget/function/f_serial.c
@@ -266,6 +266,24 @@ static struct configfs_item_operations serial_item_ops = {
 	.release	= serial_attr_release,
 };
 
+#ifdef CONFIG_U_SERIAL_CONSOLE
+
+static ssize_t f_serial_console_store(struct config_item *item,
+		const char *page, size_t count)
+{
+	return gserial_set_console(to_f_serial_opts(item)->port_num,
+				   page, count);
+}
+
+static ssize_t f_serial_console_show(struct config_item *item, char *page)
+{
+	return gserial_get_console(to_f_serial_opts(item)->port_num, page);
+}
+
+CONFIGFS_ATTR(f_serial_, console);
+
+#endif /* CONFIG_U_SERIAL_CONSOLE */
+
 static ssize_t f_serial_port_num_show(struct config_item *item, char *page)
 {
 	return sprintf(page, "%u\n", to_f_serial_opts(item)->port_num);
@@ -274,6 +292,9 @@ static ssize_t f_serial_port_num_show(struct config_item *item, char *page)
 CONFIGFS_ATTR_RO(f_serial_, port_num);
 
 static struct configfs_attribute *acm_attrs[] = {
+#ifdef CONFIG_U_SERIAL_CONSOLE
+	&f_serial_attr_console,
+#endif
 	&f_serial_attr_port_num,
 	NULL,
 };
diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 62280c23cde2..ccfa8c6a35ac 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -1081,6 +1081,54 @@ static void gs_console_exit(struct gs_port *port)
 	port->console = NULL;
 }
 
+ssize_t gserial_set_console(unsigned char port_num, const char *page, size_t count)
+{
+	struct gs_port *port;
+	bool enable;
+	int ret;
+
+	ret = strtobool(page, &enable);
+	if (ret)
+		return ret;
+
+	mutex_lock(&ports[port_num].lock);
+	port = ports[port_num].port;
+
+	if (WARN_ON(port == NULL)) {
+		ret = -ENXIO;
+		goto out;
+	}
+
+	if (enable)
+		ret = gs_console_init(port);
+	else
+		gs_console_exit(port);
+out:
+	mutex_unlock(&ports[port_num].lock);
+
+	return ret < 0 ? ret : count;
+}
+EXPORT_SYMBOL_GPL(gserial_set_console);
+
+ssize_t gserial_get_console(unsigned char port_num, char *page)
+{
+	struct gs_port *port;
+	ssize_t ret = -ENXIO;
+
+	mutex_lock(&ports[port_num].lock);
+	port = ports[port_num].port;
+
+	if (WARN_ON(port == NULL))
+		goto out;
+
+	ret = sprintf(page, "%u\n", !!port->console);
+
+	mutex_unlock(&ports[port_num].lock);
+out:
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gserial_get_console);
+
 #else
 
 static int gs_console_connect(struct gs_port *port)
diff --git a/drivers/usb/gadget/function/u_serial.h b/drivers/usb/gadget/function/u_serial.h
index 8b472b0c8cb4..e5b08ab8cf7a 100644
--- a/drivers/usb/gadget/function/u_serial.h
+++ b/drivers/usb/gadget/function/u_serial.h
@@ -58,6 +58,13 @@ int gserial_alloc_line_no_console(unsigned char *port_line);
 int gserial_alloc_line(unsigned char *port_line);
 void gserial_free_line(unsigned char port_line);
 
+#ifdef CONFIG_U_SERIAL_CONSOLE
+
+ssize_t gserial_set_console(unsigned char port_num, const char *page, size_t count);
+ssize_t gserial_get_console(unsigned char port_num, char *page);
+
+#endif /* CONFIG_U_SERIAL_CONSOLE */
+
 /* connect/disconnect is handled by individual functions */
 int gserial_connect(struct gserial *, u8 port_num);
 void gserial_disconnect(struct gserial *);
-- 
2.20.1


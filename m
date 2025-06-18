Return-Path: <linux-usb+bounces-24881-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B7FADECCC
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 14:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8BEB3B3E70
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 12:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0B02E6D3B;
	Wed, 18 Jun 2025 12:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3YC5DW+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047E4295DA5
	for <linux-usb@vger.kernel.org>; Wed, 18 Jun 2025 12:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750250132; cv=none; b=QZDUG+CWFmHSf64m76ufePyC6rhnq2EJ+mGK5tZrbF0F3UrFqzsiINeL8K2ZGctWbXPPpi0y80bmPCuT2GmrnHPfv6kIFj3h+XZbyLNC5yJoqRS2Jb5LsyyFfiemDLeaioYnvYijDuAowpizC5Lf/HuKc5DAgLQ0anf8fesVyVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750250132; c=relaxed/simple;
	bh=AbYDDaIja78YBw9bZOJ9k726JfeEPcq/CghCS/AfyZc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E1Pky68bK+Ossz5pmvFVt/rBvt3+KAmRI6TqD25jxPEtmf7W6dWZz7G2AU+oSY6hfOZcDFYVCrGtQ6tfUQEnpScINySrQkmcibV3rIgBY2TpC+7xC4Fk8A9so9B/TwjxkaKe0oSa1A/X2pAn/RSTFuKKnoYvSJDc1eNkP6Wk5jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3YC5DW+; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b26f5f47ba1so5723266a12.1
        for <linux-usb@vger.kernel.org>; Wed, 18 Jun 2025 05:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750250130; x=1750854930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NTqnvbPxiN8oRREt4xqbbET/T50YDFlqznNyzQ9K46o=;
        b=A3YC5DW+0F/7h4vXFrWDorO0XqqQXknRGngeEFBF9YzHk5L6pNHXxKDUhBxCRQRyGp
         OuXTK9FLgO9S7Ff+ARAQHu6HTMO0KtEnEnrLFnpeeUffiIKyLHGsIPhCC8cdAez0oErF
         Kw+XvNFDE8EbqHs9rd4EBSoxlo7YYgmpGYiPup3qxtjx4b0c8PI5r+6OakpmYsccva6d
         wBFFIIUqmW3spk6ZN4kkns7aRIdDNexml5aULhfYBcfbNcqOA1a8Gmxq8ld023shmU0h
         1udfOhnWh3A9ha0AtARFgcaZApXVGhNUXEJcGPJBRoS9T47IGn3smixYNrvYVyXR9FHq
         iYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750250130; x=1750854930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NTqnvbPxiN8oRREt4xqbbET/T50YDFlqznNyzQ9K46o=;
        b=Wyt39P4R2xXNCE9+vxKt+akChvTOpDWCyCoKxnPldSo6Npt5Q5INC42bGLDn7+Cjbc
         s+jJOl5UcnYz24Qo4jAc9a5OevD5d69Fb9QKWSWjfUpvRenGdISO/FXzos/7YcVDkaPi
         9pZ5ZOL7wbZHO/8AuyPptgokxGr7Wwssk1mS1dPqkVwZnP8b5ZoObFAhYjwXnyFTdh7o
         VczoypLeuy/g/MiSYxGPoGaYc3uWfYZry3Wd811yz63S9/kcue5HhdaysC3cO6SGed2+
         bbV9mXHrwIEM+fwVMREY5km2wmvfOjuY9k0BqiA94W5h8W5Y95qaRGko25WsjrxE3+YQ
         RhQA==
X-Forwarded-Encrypted: i=1; AJvYcCXuoOwWRpFelbBGsTbsZciJjmZ6eGGHxRi3f2o7lkHr5TDh8jrM6gebrIJS/csVX4ugG+XSQ9s7X2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzawxIdZDv25rhy/aEaGxfjPNzqm8nWZplWR5Lb16/lK1L6lU4B
	PVAmveyswn0PUszAjIrBGA5tWu4cwY1bVABTcFQMtugd8u4zvhXf/ZhB
X-Gm-Gg: ASbGncs3Zdi44l8rMXdyb8ZO3fAqdPOTj14ZoT9pNK49IjWU61hACA1/KHmB4+j4czM
	EAXQQmo2PcmdDjihcm4HpEw3/kzHfWPR8gnyGMZRbDz+DZ0zdhUKCnlUtCiXD6RTi+W3O3sTf2+
	BlFWCfFJ/7ktzOfkeA4RkTGMDxGSqr8xJGQhmJq8cZC/rHO5PmQjOavzU8hgXSq8HcYC4hFJLMw
	ezZIJYCPt7ro4wPl1msxm1cMExndCQ58fKZmXp9UShRKcDMYclDbcPpLuJGaeZ23lvZnE9KfYL3
	5OCyaYl/TrfU1FwYsz8oU5dIEeVW5cRifPHorxXQYKOEzj3dcCFT38IcdgH8qgABWeG+wJ9qDF0
	E39z3y9luQFGMgIkFQefSfEAVlZpTSMskx5WdBYj+qn8gHK+Zz2pz7uvTdFm9tCwZCDSglYUn1J
	9w/2zDAY6Lboc=
X-Google-Smtp-Source: AGHT+IHDcTJn0l/WoJAZPQs26Lks+6rd3gOB6UkJFeQdy304HXssI5Syqwol5sm2vQblN0OTfUIu6w==
X-Received: by 2002:a17:90b:1cc3:b0:311:d05c:936 with SMTP id 98e67ed59e1d1-313f1daa6a7mr29748232a91.17.1750250130179;
        Wed, 18 Jun 2025 05:35:30 -0700 (PDT)
Received: from localhost.localdomain (2001-b011-381b-1978-817c-4b59-2b5a-333e.dynamic-ip6.hinet.net. [2001:b011:381b:1978:817c:4b59:2b5a:333e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a4d82sm99105125ad.72.2025.06.18.05.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:35:29 -0700 (PDT)
From: Charles Yeh <charlesyeh522@gmail.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org,
	linux-usb@vger.kernel.org
Cc: charles-yeh@prolific.com.tw,
	joy-yeh@prolific.com.tw,
	Charles Yeh <charlesyeh522@gmail.com>
Subject: [PATCH] USB: serial: pl2303: add PL2303G GPIO_A and GPIO_B functions
Date: Wed, 18 Jun 2025 20:35:13 +0800
Message-Id: <20250618123513.12-1-charlesyeh522@gmail.com>
X-Mailer: git-send-email 2.32.0.windows.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PL2303G (TYPE_HXN) series ICs: PL2303GC, PL2303GS, PL2303GT, PL2303GR,.. etc.

For example:
PL2303GC can provide up to 16 GPIO (general purpose input/output) signals.
they are composed of GPIO_A0~A7 and GPIO_B0~B7 respectively.

In addition to the original UART functions such as Tx, Rx, RTS, CTS, etc.,
users can also use GPIO to implement certain applications,
such as turning on/off the LED power.

Users can download the PL2303G Linux GPIO app: PL2303G_Linux_GPIO_Test.c
from the Prolific website.

Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>
---
 drivers/usb/serial/pl2303.c | 182 ++++++++++++++++++++++++++++++++++++
 1 file changed, 182 insertions(+)

diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index 22579d0d8ab8..be7e695bea60 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -175,6 +175,37 @@ MODULE_DEVICE_TABLE(usb, id_table);
 #define PL2303_HXN_FLOWCTRL_RTS_CTS	0x18
 #define PL2303_HXN_FLOWCTRL_XON_XOFF	0x0c
 
+
+struct PL2303G_GPIO {
+	u8 GP_Branch;
+	u8 Number;
+	u8 Value;
+};
+
+
+#define GPIO_AB_CONTROL_MODE		_IOW(0x81, 10, struct PL2303G_GPIO)
+#define GPIO_AB_OUTPUT_MODE		_IOW(0x81, 11, struct PL2303G_GPIO)
+#define GPIO_AB_SET_VALUE		_IOW(0x81, 12, struct PL2303G_GPIO)
+#define GPIO_AB_GET_VALUE		_IOR(0x81, 13, struct PL2303G_GPIO)
+
+#define GPIO_A_DATA_REG		0x00
+#define GPIO_A_OE_REG		0x02
+#define GPIO_A_CE_REG		0x04
+
+#define GPIO_B_DATA_REG		0x01
+#define GPIO_B_OE_REG		0x03
+#define GPIO_B_CE_REG		0x05
+
+#define PL2303N_CE_MODE		0
+#define PL2303N_OE_MODE		1
+#define PL2303N_SET_MODE	2
+#define PL2303N_GET_MODE	2
+
+#define GET_GPIO_REG(mode, branch) \
+		((mode) == 0 ? ((branch) == 0 ? GPIO_A_CE_REG : GPIO_B_CE_REG) : \
+		(mode) == 1 ? ((branch) == 0 ? GPIO_A_OE_REG : GPIO_B_OE_REG) : \
+					((branch) == 0 ? GPIO_A_DATA_REG : GPIO_B_DATA_REG))
+
 static int pl2303_set_break(struct usb_serial_port *port, bool enable);
 
 enum pl2303_type {
@@ -1095,6 +1126,156 @@ static int pl2303_carrier_raised(struct usb_serial_port *port)
 	return 0;
 }
 
+static int pl2303N_gpio_get(struct usb_serial *serial, void __user *data, u8 u8Mode)
+{
+	struct pl2303_serial_private *spriv = usb_get_serial_data(serial);
+	struct PL2303G_GPIO gpio;
+	unsigned char *buf;
+	u8 channel;
+	u8 kdatPar;
+	int retval = 0;
+
+	/* only support TYPE_HXN */
+	if (spriv->type != &pl2303_type_data[TYPE_HXN])
+		return -ENOIOCTLCMD;
+
+	buf = kmalloc(1, GFP_KERNEL);
+	if (!buf)
+		return -ENOIOCTLCMD;
+
+	if (copy_from_user(&gpio, data, sizeof(gpio))) {
+		retval = -EFAULT;
+		goto err_out;
+	}
+
+	channel = GET_GPIO_REG(u8Mode, gpio.GP_Branch);
+
+	retval = pl2303_vendor_read(serial, channel, buf);
+
+	if (retval < 0)
+		goto err_out;
+
+	if (gpio.Number <= 7)
+		kdatPar = 1 << gpio.Number;
+	else
+		kdatPar = 0x01;
+
+	if (*buf & kdatPar)
+		gpio.Value = 1;
+	else
+		gpio.Value = 0;
+
+	if (copy_to_user(data, &gpio, sizeof(gpio))) {
+		retval = -EFAULT;
+		goto err_out;
+	}
+
+err_out:
+
+	kfree(buf);
+
+	return retval;
+
+}
+
+static int pl2303N_gpio_set(struct usb_serial *serial, void __user *data, u8 u8Mode)
+{
+	struct pl2303_serial_private *spriv = usb_get_serial_data(serial);
+	struct PL2303G_GPIO gpio;
+	unsigned char *buf;
+	u8 kdatPar;
+	u8 channel;
+	int retval = 0;
+
+	/* only support TYPE_HXN */
+	if (spriv->type != &pl2303_type_data[TYPE_HXN])
+		return -ENOIOCTLCMD;
+
+	buf = kmalloc(1, GFP_KERNEL);
+	if (!buf)
+		return -ENOIOCTLCMD;
+
+	if (copy_from_user(&gpio, data, sizeof(gpio))) {
+		retval = -EFAULT;
+		goto err_out;
+	}
+
+	channel = GET_GPIO_REG(u8Mode, gpio.GP_Branch);
+
+	retval = pl2303_vendor_read(serial, channel, buf);
+
+	if (retval < 0)
+		goto err_out;
+
+	if (gpio.Number <= 7)
+		kdatPar = 1 << gpio.Number;
+	else
+		kdatPar = 0x01;
+
+	if (gpio.Value)
+		*buf |= kdatPar;
+	else
+		*buf &= ~kdatPar;
+
+	retval = pl2303_vendor_write(serial, channel, *buf);
+
+	if (retval < 0)
+		goto err_out;
+
+err_out:
+
+	kfree(buf);
+
+	return retval;
+
+}
+
+
+static int pl2303_ioctl(struct tty_struct *tty,
+			unsigned int cmd, unsigned long arg)
+{
+	int retval = 0;
+	struct serial_struct ser;
+	struct usb_serial_port *port = tty->driver_data;
+	struct usb_serial *serial = port->serial;
+
+	switch (cmd) {
+	case TIOCGSERIAL:
+		memset(&ser, 0, sizeof(ser));
+		ser.type = PORT_16654;
+		ser.line = port->minor;
+		ser.port = port->port_number;
+		ser.baud_base = 460800;
+
+		if (copy_to_user((void __user *)arg, &ser, sizeof(ser)))
+			return -EFAULT;
+
+		return 0;
+	case GPIO_AB_CONTROL_MODE:
+		retval = pl2303N_gpio_set(serial, (void __user *) arg,
+								PL2303N_CE_MODE);
+		break;
+	case GPIO_AB_OUTPUT_MODE:
+		retval = pl2303N_gpio_set(serial, (void __user *) arg,
+								PL2303N_OE_MODE);
+		break;
+	case GPIO_AB_SET_VALUE:
+		retval = pl2303N_gpio_set(serial, (void __user *) arg,
+								PL2303N_SET_MODE);
+		break;
+	case GPIO_AB_GET_VALUE:
+		retval = pl2303N_gpio_get(serial, (void __user *) arg,
+								PL2303N_GET_MODE);
+		break;
+	default:
+		retval = -ENOIOCTLCMD;
+		break;
+	}
+
+	return retval;
+
+}
+
 static int pl2303_set_break(struct usb_serial_port *port, bool enable)
 {
 	struct usb_serial *serial = port->serial;
@@ -1285,6 +1466,7 @@ static struct usb_serial_driver pl2303_device = {
 	.close =		pl2303_close,
 	.dtr_rts =		pl2303_dtr_rts,
 	.carrier_raised =	pl2303_carrier_raised,
+	.ioctl =		pl2303_ioctl,
 	.break_ctl =		pl2303_break_ctl,
 	.set_termios =		pl2303_set_termios,
 	.tiocmget =		pl2303_tiocmget,
-- 
2.48.1



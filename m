Return-Path: <linux-usb+bounces-12516-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D6893E546
	for <lists+linux-usb@lfdr.de>; Sun, 28 Jul 2024 15:05:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4403281BCE
	for <lists+linux-usb@lfdr.de>; Sun, 28 Jul 2024 13:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3374A9B0;
	Sun, 28 Jul 2024 13:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="LmscagCW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7190739FCE;
	Sun, 28 Jul 2024 13:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722171925; cv=none; b=Stx2/o69cdp1UrdYVjGy3at02HwvZCpTeQQW3LDJj1l6HkFH6oZ+BE5SiBsM/V5Ht4Gofn6bQL3ip41VJNYZTGfBilCWSZvMcxbKNHhjgFsu4X1ZNVwMSXQu8ITsAKVxEXO7rcnG+5qvTVNLjiPxUYSVbDrlYrTwQrZbF9hQ3KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722171925; c=relaxed/simple;
	bh=1OgNP2z2wcObDZoggVwBSp/N3WuQBXgDb7IqEI1gJ1A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l3VsoRkxEl4gcuB9a8MdcxvElY+YKcFDQw8BZES0zdHKbQodE3lzhJd0T+Sd/s1UiwlGxw9nnguOu3FNG2KNpMI9U1Q0AdnWG9xinLwWq43uuPoxia2jJXL8yz+rrrD/llkLLtXu4b+Fjti7j5tkuhLrVeb3CDXhXeLkLi9D42M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=LmscagCW; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1722171897; x=1722776697; i=wahrenst@gmx.net;
	bh=CgyBVhShFPQHZA3QGcWv2/P5EoEiVb+TjGrpEimPkw0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LmscagCWdykxy8BHKIPNK4bcXTouq8j/oUpumI0X0mp69ItEAEIyO4a+6RpIBkYZ
	 6NF329NP3eJHwTPcEhoiu7JpIMFxjjwksG84J5YRVfGQzrYYJMABi2WI8V5xDNzM8
	 cUpRefPt40a42h1X+B3yMcdQOb2uW4W/nY2X11+lGtmXGHwAYYBtTvfISwcD+pF9I
	 iJbStJF9oorst5a8YTzG1Bki/NUsb0+3xXRgfWPEyAlZKuNdkiCy7oOVplvBjOYe9
	 L54Z1Z188auJMY3svXTwvChidjc5L3ljXMFSaPEigEwHZs1uJusyXUy/+u18XPtQS
	 qrmnJtHVd+00Cw9g4A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Msq6M-1sIjaL0js0-00xHk0; Sun, 28
 Jul 2024 15:04:57 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Maxime Ripard <mripard@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Lukas Wunner <lukas@wunner.de>,
	Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	dri-devel@lists.freedesktop.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-pm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel-list@raspberrypi.com,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 13/16] usb: dwc2: Skip clock gating on Broadcom SoCs
Date: Sun, 28 Jul 2024 15:00:26 +0200
Message-Id: <20240728130029.78279-5-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240728130029.78279-1-wahrenst@gmx.net>
References: <20240728114200.75559-1-wahrenst@gmx.net>
 <20240728130029.78279-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:s8dsyj9qqRYRsL8bQxmQ5roOnkmyC1BaDiF5Im83qgwzAe1fvr6
 YXnXSZOZhFMguv09RAYYhDM4htVwDa5FeYuT+H/zRLHpvpAy3embHN092azTN9XIXKqI6LQ
 EqeF4jqQqz0Xe9a4i3mCDUz+PSAKUgHCcZwsaiIzby2QVe8AwODU1/uwi5Y8+rBTJyoqgFR
 2p/gSxu8/5aOBWD7jcRDQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JTYlFqlSooo=;Pk+uJOwCtCXcINyxmO7dEmrah04
 UlqaymRbX4CDsGbuGm87NnD4Zn9nFGfDHkF9XM3X/7qCMlMnukYR9YbOGd1+h/CDfAO/QXR4j
 Mi2OYWa33FGI4McxuWU+k3ftzulYGx/FwCwVrvnMRwcN+0IM9AYCJ+66ykuqV2SKu0KB+0bvD
 CY9dth/UCl9UTQqAnavn+GsgK6M8oeULSmIFCKyWHHxqVmLwunOUfQqgO3EEIojncArkOAii4
 /PVwVRf1NGvHecEiEnugwPkApVZwnPT3S91JTtXLBBZlCvdXhxM+WuznxF53Q76HfCUd7SORq
 h+LO45U2Uph33zEydNLlS2aNgdLD+6cF1iTACUrQJcTxOxtIAYYfzP2v9hjUC+E9HJy9us6fr
 /qIDEwOBsbSDNNSU7WKBPK/IXkyHCOHI8/eT4HW/9mkSdlhqcH7LyKNf5y0qV0jhQ++4XDGC7
 +IXc0XGnvzCIkz/Rv/0oBnCnWU5B72aF3k+w6vTXN4YJ5TFv3RSj5E9E0Q6TyQd6sA9Mr4jmk
 C0x0+lXe2PhRxsH8fpKLWSUyHl7/w7sowHnSLl2VxiALCZtxa8IZmr3Bw4ddDW4l4UUz6HFVU
 kMtmIYztsHjrF23zxLoYPgzujYEvmxbWW+xnAt9jPSUEjs09kaBq1nO+4b6i7KWuHxgPtNSQa
 HURzalESXk+ZB6LBTxFryPcDIlnAn98/xIz+NNaQsDbC1vkN3LdZTb/cBIkHnvf1URGknvGRK
 LeEn0gIHaO/zO85hJoiPuCejMqKbxwdJ9cjQ5+A7+EjcTBULn2AxkjZ6lW7WjoEge/ysaLKGd
 sj4BCm6UWRIQKx6Nheb7bDpoQK+JoNk6fxrIqPkDdPPoM=

On resume of the Raspberry Pi the dwc2 driver fails to enable
HCD_FLAG_HW_ACCESSIBLE before re-enabling the interrupts.
This causes a situation where both handler ignore a incoming port
interrupt and force the upper layers to disable the dwc2 interrupt line.
This leaves the USB interface in a unusable state:

irq 66: nobody cared (try booting with the "irqpoll" option)
CPU: 0 PID: 0 Comm: swapper/0 Tainted: G W          6.10.0-rc3
Hardware name: BCM2835
Call trace:
unwind_backtrace from show_stack+0x10/0x14
show_stack from dump_stack_lvl+0x50/0x64
dump_stack_lvl from __report_bad_irq+0x38/0xc0
__report_bad_irq from note_interrupt+0x2ac/0x2f4
note_interrupt from handle_irq_event+0x88/0x8c
handle_irq_event from handle_level_irq+0xb4/0x1ac
handle_level_irq from generic_handle_domain_irq+0x24/0x34
generic_handle_domain_irq from bcm2836_chained_handle_irq+0x24/0x28
bcm2836_chained_handle_irq from generic_handle_domain_irq+0x24/0x34
generic_handle_domain_irq from generic_handle_arch_irq+0x34/0x44
generic_handle_arch_irq from __irq_svc+0x88/0xb0
Exception stack(0xc1b01f20 to 0xc1b01f68)
1f20: 0005c0d4 00000001 00000000 00000000 c1b09780 c1d6b32c c1b04e54 c1a5e=
ae8
1f40: c1b04e90 00000000 00000000 00000000 c1d6a8a0 c1b01f70 c11d2da8 c11d4=
160
1f60: 60000013 ffffffff
__irq_svc from default_idle_call+0x1c/0xb0
default_idle_call from do_idle+0x21c/0x284
do_idle from cpu_startup_entry+0x28/0x2c
cpu_startup_entry from kernel_init+0x0/0x12c
handlers:
[<f539e0f4>] dwc2_handle_common_intr
[<75cd278b>] usb_hcd_irq
Disabling IRQ #66

Disabling clock gating workaround this issue.

Fixes: 0112b7ce68ea ("usb: dwc2: Update dwc2_handle_usb_suspend_intr funct=
ion.")
Link: https://lore.kernel.org/linux-usb/3fd0c2fb-4752-45b3-94eb-42352703e1=
fd@gmx.net/T/
Link: https://lore.kernel.org/all/5e8cbce0-3260-2971-484f-fc73a3b2bd28@syn=
opsys.com/
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Minas Harutyunyan <hminas@synopsys.com>
=2D--
 drivers/usb/dwc2/params.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 4d73fae80b12..68226defdc60 100644
=2D-- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -23,6 +23,7 @@ static void dwc2_set_bcm_params(struct dwc2_hsotg *hsotg=
)
 	p->max_transfer_size =3D 65535;
 	p->max_packet_count =3D 511;
 	p->ahbcfg =3D 0x10;
+	p->no_clock_gating =3D true;
 }

 static void dwc2_set_his_params(struct dwc2_hsotg *hsotg)
=2D-
2.34.1



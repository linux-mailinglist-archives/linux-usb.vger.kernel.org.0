Return-Path: <linux-usb+bounces-11805-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B79191D26B
	for <lists+linux-usb@lfdr.de>; Sun, 30 Jun 2024 17:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21AFD2810BC
	for <lists+linux-usb@lfdr.de>; Sun, 30 Jun 2024 15:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A0715535D;
	Sun, 30 Jun 2024 15:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="HqwyRkuo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B331534FB;
	Sun, 30 Jun 2024 15:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719761873; cv=none; b=boeyDKCb3azHIxauREMbjwmMeL2veejz5yYhrDyNSodyAX4IJWrZr2iHmP4Ae10/rDUFKnkdQI+8bVLRWeJsQYNRM26Lhv6UTpCq/j7emtjXlnGLckw7L2NR8ZUKmsonDUixrYtfaruHgx92JOZCiIKZTkc4o+QLF9do/Irrdw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719761873; c=relaxed/simple;
	bh=Snna4vWkVe7VrHMEWqWpceKl+iHu1h0a2wRLIPoC/ms=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ld1TbJTE/Wk/vdxQhnFjdw8yfKP/edYRK7YY5TuBBQZrFnEx0gDSv2jvyI9iFRramQWDdFfCCerGVk0J1uOqVYN0PJddhdBpbomhFZaDBD9KufTFnZmu0xQyo/oFweaKsZEqEL8sYHo+HFtCbpP9hUQchZfPmTCH7Pb9HaZkY74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=HqwyRkuo; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1719761839; x=1720366639; i=wahrenst@gmx.net;
	bh=ih3wUQeDzJJqL1OWTddn6+L5ffHfGjRbiVctGOrH+AM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=HqwyRkuoE+qRsI0+bsGC/P5S+k1ntwg9R2iHcaSt4zBPCsVFbokHB3+hnVE6g+4K
	 IZ2akmhbed3E639JN7lTkCI8LvV6gP5hN4McqVggJj69w+A6h2Z8ZItSK/070OMkn
	 RnoD50XogkbvhLocYP7iobTjkghA84DEPBP1rY8PCRmXUJtwz6KJkZmFJEfXGtfwY
	 jTYH0JiE2zcfI3j1LR6rm6vWJ4gICa5tkgTY77NyIORF9n2T91GjYrnFqTz2CEWwa
	 ErloGGNjt2nxnwCGsA9Oc09dswosSEfyT9A1VvEzsMHv3LhiR1vAlGXZx0RsF7xvy
	 k6067PpRJRfl2m7XHw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Msq2E-1s8baQ3Q64-00ufFH; Sun, 30
 Jun 2024 17:37:18 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Lukas Wunner <lukas@wunner.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	dri-devel@lists.freedesktop.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-pm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel-list@raspberrypi.com,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 02/11] mailbox: bcm2835: Fix timeout during suspend mode
Date: Sun, 30 Jun 2024 17:36:43 +0200
Message-Id: <20240630153652.318882-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240630153652.318882-1-wahrenst@gmx.net>
References: <20240630153652.318882-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+eS7VjvylTmd2ce6rQQXNQVZzMe2xTWuYOen4qDXgVNExxnGsfd
 DRRDc00e/b7oFfw1PtqTPjPGxawx4evTppOhjkFTdloe2+teyYa0P9+O3rja0FohGjpcLGf
 QZAa1N0wPmLsjx9sMQ69FB6QKU1teVj1vxft+Q/rpDQoxKFmkJz+s+7F54inVXqEdNkGiIO
 85++VrQYxeuQAPABACv2Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8EW4z9MobNc=;JJUIZttLMZqr1SkeydBcjP1xOPu
 Unjiw4xtRYZWx+8jWNS7/NFujaE44rLoAreuM9ovzixRSOHuwaiX5IvDXc/ZBWuIS4Dx+FT26
 WmSSk9Xr0y7JZyOGarctrjVEZqeHcm69gMSEGwcXeQfIF9c/GkufHP17W/AeO5QqJKa7hxkpC
 qSTfqxiSahJcX9E4ihmngP9fID9fZMEagemuUc1EPX/exRL2YMAqqwK/D31hzCoznCsydQmrX
 G/ti47qlJ+GHDSD+WFTnuFtJ0EqHhfj60z3EHojwBJJ7xO34z8+9dusRBtT8h+NXARmlx6Jd/
 d61c1fWDeZZ3AeiYVinXdj06R/RL56GpV+fNPpXhnKpBn95fw4/kB/MMGpjnLezLnD4QAEEiv
 KtTN7E4dOlumDkeQFdgBp4/9GdAqfQbQF3sD/h/7n9DV4EzjrUoZfrMV5fKZz/cj4uLeLHAMs
 bu7vHdtNBtQiSz2twOkSJunW3EJkENGSBcrgZuO56v/amzdzJVihzreqRTJ70L5/zNx3G3ogR
 aG8NJWb+/WNa/HyEySRyOzEJ5OOmG0vGEqCj6yMYi/oHCzDQG8vN4afVwj7WtQ85iea/gspxv
 QsOHYQLTTorNxa4lLkIVBrWi+ux5KgiEgubR87zoCcB3sFilayjUJftidRGic8eY9/jYcW2et
 3qMbMpA9jqp5AhK8g0Y2uwqASCSYgCRIhsvcfhiB33cT3w1zLgkYreCSOdwlqAhKSUZ1hrYzy
 xtMd9N578XdAkaW1MnqYyWn7IF9Mh2/cYZy9WgweNk2Te24+8SlVCftIgk4GYxjGuKSxWqksu
 aLO+1f5vwa7QqijA/YXsn08LcgY7Zct48NRYwB70/OJv0=

During noirq suspend phase the Raspberry Pi power driver suffer of
firmware property timeouts. The reason is that the IRQ of the underlying
BCM2835 mailbox is disabled and rpi_firmware_property_list() will always
run into a timeout [1].

Since the VideoCore side isn't consider as a wakeup source, set the
IRQF_NO_SUSPEND flag for the mailbox IRQ in order to keep it enabled
during suspend-resume cycle.

[1]
PM: late suspend of devices complete after 1.754 msecs
WARNING: CPU: 0 PID: 438 at drivers/firmware/raspberrypi.c:128
 rpi_firmware_property_list+0x204/0x22c
Firmware transaction 0x00028001 timeout
Modules linked in:
CPU: 0 PID: 438 Comm: bash Tainted: G         C         6.9.3-dirty #17
Hardware name: BCM2835
Call trace:
unwind_backtrace from show_stack+0x18/0x1c
show_stack from dump_stack_lvl+0x34/0x44
dump_stack_lvl from __warn+0x88/0xec
__warn from warn_slowpath_fmt+0x7c/0xb0
warn_slowpath_fmt from rpi_firmware_property_list+0x204/0x22c
rpi_firmware_property_list from rpi_firmware_property+0x68/0x8c
rpi_firmware_property from rpi_firmware_set_power+0x54/0xc0
rpi_firmware_set_power from _genpd_power_off+0xe4/0x148
_genpd_power_off from genpd_sync_power_off+0x7c/0x11c
genpd_sync_power_off from genpd_finish_suspend+0xcc/0xe0
genpd_finish_suspend from dpm_run_callback+0x78/0xd0
dpm_run_callback from device_suspend_noirq+0xc0/0x238
device_suspend_noirq from dpm_suspend_noirq+0xb0/0x168
dpm_suspend_noirq from suspend_devices_and_enter+0x1b8/0x5ac
suspend_devices_and_enter from pm_suspend+0x254/0x2e4
pm_suspend from state_store+0xa8/0xd4
state_store from kernfs_fop_write_iter+0x154/0x1a0
kernfs_fop_write_iter from vfs_write+0x12c/0x184
vfs_write from ksys_write+0x78/0xc0
ksys_write from ret_fast_syscall+0x0/0x54
Exception stack(0xcc93dfa8 to 0xcc93dff0)
[...]
PM: noirq suspend of devices complete after 3095.584 msecs

Link: https://github.com/raspberrypi/firmware/issues/1894
Fixes: 0bae6af6d704 ("mailbox: Enable BCM2835 mailbox support")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/mailbox/bcm2835-mailbox.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/bcm2835-mailbox.c b/drivers/mailbox/bcm2835-m=
ailbox.c
index fbfd0202047c..ea12fb8d2401 100644
=2D-- a/drivers/mailbox/bcm2835-mailbox.c
+++ b/drivers/mailbox/bcm2835-mailbox.c
@@ -145,7 +145,8 @@ static int bcm2835_mbox_probe(struct platform_device *=
pdev)
 	spin_lock_init(&mbox->lock);

 	ret =3D devm_request_irq(dev, irq_of_parse_and_map(dev->of_node, 0),
-			       bcm2835_mbox_irq, 0, dev_name(dev), mbox);
+			       bcm2835_mbox_irq, IRQF_NO_SUSPEND, dev_name(dev),
+			       mbox);
 	if (ret) {
 		dev_err(dev, "Failed to register a mailbox IRQ handler: %d\n",
 			ret);
=2D-
2.34.1



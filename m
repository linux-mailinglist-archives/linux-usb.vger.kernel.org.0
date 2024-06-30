Return-Path: <linux-usb+bounces-11810-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DE191D27A
	for <lists+linux-usb@lfdr.de>; Sun, 30 Jun 2024 17:38:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50ED71F213F6
	for <lists+linux-usb@lfdr.de>; Sun, 30 Jun 2024 15:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DB4156C7F;
	Sun, 30 Jun 2024 15:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="OAM7af0S"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858E6155739;
	Sun, 30 Jun 2024 15:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719761876; cv=none; b=Fe5n1lojfrT4WIyamxAe4Jj8jCdhdpgbdMumv7L9i5j5Vnvtab3vd2TAvXU3Do9QjCiaeY7xIv/SxkBsMb/rRxpxaNf5BYbJfMqsPH1GGiFEqIWLaSOxv/ZqfqJc56PpgdIUPJR9pkfL99KFAuglVLYzZBTuNchX78UWa1aKN4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719761876; c=relaxed/simple;
	bh=htFaQCpdyD71n4pNPL8ZQEsGXm5kTTzIwWkMkp+T2HM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J+zzIXfmQ0U6K0A+ZwgBhhGUBeC/efKkLUZtVFWLqQKjSjz+c8OOpfMxwl9m9M5QK88+f8zfpFsTmjmVJY3kWkt+r5YKmiY1C7+8E3cBR4IEy7ADB8B2COlalTiE1TPFXAUGOeLYAzhgGCZWev038tm9RLMAydy1yX7BHAiTV+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=OAM7af0S; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1719761845; x=1720366645; i=wahrenst@gmx.net;
	bh=P9b6UEReDpU77Jd10Cj2qEnGBLfdX01BBvJz6wX6RDo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OAM7af0SnCS1ZARK4RA4CkYk6exCAufqxsQsCgLR3fzwetYAHxX8NmH/xwsSHH52
	 fn1X+6k5daXF2o1dCVvJQcbRKkBqB9dCRlPuxjhk4WWwPfkESO8kqXJQGd5/e+Yea
	 daEuJ0eMROYKxns6+GMiGnSo8oeUg63Xb80p1qAWsD+UaUL0OQ5vgEcr/v6NvqRND
	 ir43c+JlVVjWo4dAVHoaJ9y77syEzO06rQGJ3d0mrWPETWcKuseoLBKc+qZPFETen
	 q7UsPqvgIG1dtXKZ3gzaFHF2ghr6cyavqKQWFVWFrYsSvc2NhQZ8RTZPj78V/oL87
	 qifxeKiHGa1paw5yYg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGz1V-1sbMbW2khX-00EpCe; Sun, 30
 Jun 2024 17:37:25 +0200
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
Subject: [PATCH 09/11] usb: dwc2: Skip clock gating on Broadcom SoCs
Date: Sun, 30 Jun 2024 17:36:50 +0200
Message-Id: <20240630153652.318882-10-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:pI9X3saIj1rv3u8rkYVt5Z2mn5Afvx+C+DmVZ9+PgFr6tyA0tFT
 f2di+bJIcWOzMogkgezYjB2heHLGJEe8mitLQMHh9hvvizU9Hub7dsnOj4PIXEncKhn0sOG
 qFyhE2FzXXiMAY4c3kL70pxuCzZlNgA5sOSR1b7MqrlnsWwpJm+DpDqU60tldbwLzD8KCtz
 q+ZBsE8ao6B1eNETfpP5Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:r+xf4Y+CXp8=;dAxB9no4yNcRmM23mLNbkn4eZo0
 gJCfajaBuonOEWkB8tcs8u29OtY9HzcchKLFC269zRzIh6A2oqV3NtDMHpkfbEANkUhMm1Qcb
 179qo1P8aCyoO/ZyOP3ZYJajVnrKo8+HKOMH6JbZxKE/sd7oqzPwf9icHwS8tpiEGs/qhnWYx
 cOtF3xjeahz5zE56PFH9Vp2Pmq7m1oohwh6A8exJYoNuVmcucmwcRc8rgo6cTcET2UH+s+JC9
 Rlqs9/AsBxgLNy4sRWcZFVpQ5EKrrlLu7VP+JuCdBhPHpkr4kdbFfpRyOjqUD8FuJkacwdble
 v8N11NQXp2AaMNUB+f1IDYAzDywiNcJGZedSkfMTWJJYdUEZL4eB4RevvWZ8/nJ/o0uAFrp2M
 MtHBholgzoF2F5MMKzaFF7HLSmUZcC/iRa3ZQkXEyXk+8G1u5EjBHuqJ4cVOC+NtYHusYEjVt
 mVMr0/pC7dBf/dhJCvJ8KcN+T7XgVKG03fpRzG3il+g66/V/NBjECOhZQ1gythLP+ara/KBNA
 svb7saNx+lZ/Mj3ieDkFFbEaJ0MGVa7vQXozZpJ6Ta03U7nsrJVPaqIfEr/ykkq7h/DlFKPYt
 n43yd5fgYkm4l1a1JOM3WoM9kgTecGab53+kFTRW7z8yrhAEceUbBjvivjLK4kyM1Pkb2RgyK
 P/VcJyHNUyDtZ31jvnVzDzUaksEjHH26JoYQ6SYmoKnL/4ceTi/s/wDDtGDyF3/gGPiVWDj3Z
 n41gLwUZ869NfKYPmkpKfJjYec8zWnthXdSKxtJPCUU+sbNSxWlnBffvZl2zGz6pFOqwebFbp
 MqDNR8LlYtDj15hOgxvhLT5CCquAP/IoO4r60kKWmcFpE=

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

Disabling clock gatling workaround this issue.

Fixes: 0112b7ce68ea ("usb: dwc2: Update dwc2_handle_usb_suspend_intr funct=
ion.")
Link: https://lore.kernel.org/linux-usb/3fd0c2fb-4752-45b3-94eb-42352703e1=
fd@gmx.net/T/
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/usb/dwc2/params.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 5a1500d0bdd9..66580de52882 100644
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



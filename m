Return-Path: <linux-usb+bounces-17981-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F78B9DF77F
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2024 01:17:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90BDBB2157D
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2024 00:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E2336FC3;
	Mon,  2 Dec 2024 00:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="M5lB+M1z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E0E15A8
	for <linux-usb@vger.kernel.org>; Mon,  2 Dec 2024 00:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733098614; cv=none; b=haKJbzdYBOECgnAFU080HPxt2y/KVcnY5xc2awv9z7j/c49K0Y7gs9xA9u6z0pFX/NLFMbKhV+/HPFQie1DPSsg7KFxAW8D2Qs8IjAP/+ef+uwxz/SQf2eN47D02mCj7tUp7mVXeAssV5VEhT9ic6mZHDs4c/AhNEeQDfD/iL5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733098614; c=relaxed/simple;
	bh=K8HONCnuS4qwivJa/bwymz9aY3IG/GCWMKRi8RZyg3E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z4ug7qExc6CppyIlNoY1/8POK21oQUwcAgPgDFBDRpDF9KXFRsm0CWdsXX7NSf2m19HU24CkpN5rQJNGFATbX4hOh74OpZ35j7RXBdAUOjpqyZcjKhkyVz8/Yd45J8aUBmxQP3ju1f5p1cdt2u9w2ckjjsZqr60Z5ZseGFAuM9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=M5lB+M1z; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1733098599; x=1733703399; i=wahrenst@gmx.net;
	bh=+R0kGeDahSE2bQYrc9eaJqpEkaauDPc1fVFI7Orj3K4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=M5lB+M1zVZHSdZ5k7Jkc/7gK4MN7xNd+cd8mw8sOd0wVDW/r70suT9crutInE31G
	 VgX1+aTYZp8DVoP9HcbL4jFCkRnwEopWca71RMY8EpTb8dxTMhXDKLI/VsChvuFEr
	 jAY+ctdzUYTEIMAszUCsX50CnnUU6LZtlKtEKQXtCAwTLy2iHQUG9KFKjTnIOaXaw
	 Bc98c5gRzgogDEmkocIOsxkFEpOeSyri551Kx5VoCZ1IAA8Pi7doThIm/bfEf6lUE
	 z/B29GejgDraqZRUsB6uzOsU02x384pHPlRDt4Uq9MqekvJwR7bSPaVR/VI1yaWBe
	 2UMM3W+tnpphEfBNPA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N17UW-1tgPD3357y-00utTg; Mon, 02
 Dec 2024 01:16:39 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
	Douglas Anderson <dianders@chromium.org>,
	Lukas Wunner <lukas@wunner.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	"Ivan T . Ivanov" <iivanov@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 3/3] usb: dwc2: Fix HCD port connection race
Date: Mon,  2 Dec 2024 01:16:31 +0100
Message-Id: <20241202001631.75473-4-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202001631.75473-1-wahrenst@gmx.net>
References: <20241202001631.75473-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zmtuM5DkNntCStJmYi5VCvC05+XSKT7lwIQzihqInJcIRhAIcGf
 VgNWNQHTKiDILBd4kwXpL+9EgdHufd8+T5YYEXkToLRZERguc9l/cfHazzg/4AtnqyoF7km
 JyAUyH0o/YtETTl7qhuDT/TZdYiqKYR5UTVnPS34sclZNrgn1MYvgzSUTSDdLPE9+//Ajxo
 gSrphSjxSfC9kPq++UZ5A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nW6iQxO9QDs=;tF2QF696jWkJf2Fcn0lCYEz4JDG
 wcVu8ujnHHoboNmN0q3tyJuTGxDJ9XNfI8jrNT7J/aftMLQsfrwOt1Y35Wa75fLp+9la2Nc8v
 YcJKxSK+8EOZgvLmRrbig3FM05Z/Mmu4Aj2pkObCJlWe9OkiTqbRSRI/5j2rlK1gm0pHrMMm+
 u3CDNGIWYTirXXFOWgzL6UdFgBOAqpXLTyKLxBMbe7ZjCW6iuOFhqA6f5JxysSle2Bb9yv9cp
 wYVr8xJBYdRgtAVop0+Apf1ZLQ8EJxuRHETgS2i71rkuVljDJ0/W2+fuE4MyySo5ZnuFjw+SF
 YGeJ4wuambHWL3EX4QZ16wlc4fAztpJNgGLYL0z8Q+B+R4raPhO13TtQo6UT6yuS/ujDZXrxN
 vEj75Sk6ElTH75ZBjx9k/wn+6fg3mB9VJRztLr/NqhF2all+WMxD9muhSaXEuH2zXqa208oyK
 ACmk9H2djKcbjR8aSsAvuO9s3iiGN69jp1rEDZ9xIxhN14xUbKKDQM8ubXTms2cKz2dSDzkXr
 UuQL1kVAnJTX1obck06MJKB5pZ59CsLWHQyhywZ6y43gvB0Jwnvi7hVg18qskLC5dPqSyPCZN
 u68SZJ46kPzj7urMxY29aLkKzzqWvTrDTnvGBW46SGJshW5deJ6/iAEhQbHxXGkx6kX7DA4VB
 BA7LvtxlHpaFnonYJHZ0nDrvpMnJ2HwNE56SBcw40pp9RejHefz4R4DsO0nOdw4bddW6UsY7v
 i+U5cxeHvF+wntnv9bsr/AptanlCVltYaxFsNae10nQ8/JlCWyk2LeKPzxFrkegnPoo3XJ+PI
 QMMLUXJo6YEb7aIFBMHl7uKSd3L3fL46nAvoDiBTAQSW21zcZ0+32yn7RWuscM7TbOi56lLyN
 ckjhXqpYqwF7ImiUdyiDpe/+Mgi1Dn4fz59R/sVO2v8uOR6bQWWvtZA15+2fLbTPaosA7ideE
 2X1J3T3SUiUND7SvdykjT2y4sUK7RUOYQVSmNU2I7I9ITeTlQb/4MUyNxclLRy10s2rNzgahP
 W2Gb+b7kHQx7XLXHsZmA2ospXUuLx/FHfiWaPgZB/FnyasxB/gsOpmOTslI9dvCL957NFTGiK
 JR5+/D7DkYU0OlyDypriYXFdYrE8kd

On Raspberry Pis without onboard USB hub frequent device reconnects
can trigger a interrupt storm after DWC2 entered host clock gating.
This is caused by a race between _dwc2_hcd_suspend() and the port
interrupt, which sets port_connect_status. The issue occurs if
port_connect_status is still 1, but there is no connection anymore:

usb 1-1: USB disconnect, device number 25
dwc2 3f980000.usb: _dwc2_hcd_suspend: port_connect_status: 1
dwc2 3f980000.usb: Entering host clock gating.
Disabling IRQ #66
irq 66: nobody cared (try booting with the "irqpoll" option)
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.12.0-gc1bb81b13202-dirt=
y #322
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
 Exception stack(0xc1d01f20 to 0xc1d01f68)
 1f20: 0004ef3c 00000001 00000000 00000000 c1d09780 c1f6bb5c c1d04e54 c1c6=
0ca8
 1f40: c1d04e94 00000000 00000000 c1d092a8 c1f6af20 c1d01f70 c1211b98 c121=
2f40
 1f60: 60000013 ffffffff
 __irq_svc from default_idle_call+0x1c/0xb0
 default_idle_call from do_idle+0x21c/0x284
 do_idle from cpu_startup_entry+0x28/0x2c
 cpu_startup_entry from kernel_init+0x0/0x12c
handlers:
 [<e3a25c00>] dwc2_handle_common_intr
 [<58bf98a3>] usb_hcd_irq
Disabling IRQ #66

So avoid this by reading the connection status directly.

Fixes: 113f86d0c302 ("usb: dwc2: Update partial power down entering by sys=
tem suspend")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/usb/dwc2/hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index fb4fbd8c43df..8c3941ecaaf5 100644
=2D-- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -4345,7 +4345,7 @@ static int _dwc2_hcd_suspend(struct usb_hcd *hcd)
 	if (hsotg->bus_suspended)
 		goto skip_power_saving;

-	if (hsotg->flags.b.port_connect_status =3D=3D 0)
+	if (!(dwc2_read_hprt0(hsotg) & HPRT0_CONNSTS))
 		goto skip_power_saving;

 	switch (hsotg->params.power_down) {
=2D-
2.34.1



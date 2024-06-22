Return-Path: <linux-usb+bounces-11558-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 720989135B8
	for <lists+linux-usb@lfdr.de>; Sat, 22 Jun 2024 20:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DF7C283DB0
	for <lists+linux-usb@lfdr.de>; Sat, 22 Jun 2024 18:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E01288DF;
	Sat, 22 Jun 2024 18:48:01 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1F51A269
	for <linux-usb@vger.kernel.org>; Sat, 22 Jun 2024 18:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719082081; cv=none; b=gHBSQyVoP6FUNzSg2iTM02G7jokc0IhcNX9gU6rF4v7SOMUm2RZ7YPuhH/dxVoyzhmLZ09plGrhmurAg/1nRzXhlc5hDj/CjS/52W8koZJVmkCdq97mOqy0a4nxaC82KIlYd7RKIVxnZxwPBOy7GGoY//nl7d7rbGK6IZ/l7YLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719082081; c=relaxed/simple;
	bh=Hr0e4ZJ5ho59IhuCuFEA7Im4hnnFHSaOyUBffkYiro0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aczv53DSaSiE4vMzT2B7aecHU6mc0TXOH6vyC8/Z2mQWAmkWP/XxL0g4SOCGQeMtnmEJ6eryLB6/+60y2lz/fMs+RM/fV43zc6xqB2vGZbWS7puUJwJ0dPtua9D0rYWVhsEe2GK+JMw4n4DG4WhW/OEnfC6/3OFQBUBRivNfNcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=176.9.242.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 053851019DAD2;
	Sat, 22 Jun 2024 20:47:49 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 7E8A51DB73A; Sat, 22 Jun 2024 20:47:48 +0200 (CEST)
Date: Sat, 22 Jun 2024 20:47:48 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Minas Harutyunyan <hminas@synopsys.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: dwc2: irq 66: nobody cared triggered on resume
Message-ID: <ZnccVLINb_xQcmZG@wunner.de>
References: <2bcf7fac-8e8f-4d7a-a837-08805a0076e3@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bcf7fac-8e8f-4d7a-a837-08805a0076e3@gmx.net>

On Sat, Jun 22, 2024 at 02:23:33PM +0200, Stefan Wahren wrote:
> i currently experiment with suspend to idle on the Raspberry Pi 3 A+.
> Supend & resume works expected as long as no USB device is connected to
> the board. If i connect a USB hub to the Pi, the resume phase is
> significantly delayed and the kernel disabled IRQ 66 which belongs to DWC2.
[...]
> [ 1131.109996] PM: noirq resume of devices complete after 1.273 msecs
> [ 1131.111208] PM: early resume of devices complete after 1.051 msecs
> [ 1131.230277] brcmfmac: brcmf_fw_alloc_request: using
> brcm/brcmfmac43455-sdio for chip BCM4345/6
> [ 1131.458687] irq 66: nobody cared (try booting with the "irqpoll" option)
> [ 1131.458714] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G W 6.10.0-rc3-g7fd4227d1bd5-dirty #49
> [ 1131.458734] Hardware name: BCM2835
> [ 1131.458744] Call trace:
[...]
> [ 1131.458877] note_interrupt from handle_irq_event+0x88/0x8c
> [ 1131.458900] handle_irq_event from handle_level_irq+0xb4/0x1ac
> [ 1131.458923] handle_level_irq from generic_handle_domain_irq+0x24/0x34
> [ 1131.458957] generic_handle_domain_irq from bcm2836_chained_handle_irq+0x24/0x28
> [ 1131.458992] bcm2836_chained_handle_irq from generic_handle_domain_irq+0x24/0x34
> [ 1131.459024] generic_handle_domain_irq from generic_handle_arch_irq+0x34/0x44
> [ 1131.459056] generic_handle_arch_irq from __irq_svc+0x88/0xb0
> [ 1131.459079] Exception stack(0xc1b01f20 to 0xc1b01f68)
> [ 1131.459142] __irq_svc from default_idle_call+0x1c/0xb0
> [ 1131.459167] default_idle_call from do_idle+0x21c/0x284
> [ 1131.459202] do_idle from cpu_startup_entry+0x28/0x2c
> [ 1131.459239] cpu_startup_entry from kernel_init+0x0/0x12c
> [ 1131.459271] handlers:
> [ 1131.459279] [<f539e0f4>] dwc2_handle_common_intr
> [ 1131.459308] [<75cd278b>] usb_hcd_irq
> [ 1131.459329] Disabling IRQ #66
[...]
> An ideas what causing this issue?

Interrupts are re-enabled after the resume_noirq phase.  Looks like
the chip signals an interrupt right afterwards but the two hardirq
handlers do not feel responsible.

The only option might be to add a few printk() in dwc2_handle_common_intr(),
usb_hcd_irq() and dwc2_handle_hcd_intr() (called from usb_hcd_irq())
to see why they're all returning IRQ_NONE without clearing the source
of the interrupt.  The chip just keeps signaling interrupts because
the driver doesn't handle them, hence the IRQ storm which the IRQ core
eventually stops by outright disabling the interrupt.

Thanks,

Lukas


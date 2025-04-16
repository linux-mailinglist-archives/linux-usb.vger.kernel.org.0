Return-Path: <linux-usb+bounces-23019-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A22A87784
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 07:47:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D56041890195
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 05:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181411A262D;
	Mon, 14 Apr 2025 05:47:21 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B8025776
	for <linux-usb@vger.kernel.org>; Mon, 14 Apr 2025 05:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744609640; cv=none; b=C1ONctlbpulmjmYx9nTPKybenQbAGx2LljoiMpkTzLIZGuA8MfJ3EDWnkuz8u6W0Rh+yMaaHP91dOPjW2SlYtL+fQfv7sjA5I7FzADipmnKrZOlIEqJmhQUTNQGf4FblHRbCLUe10AWE/6fG9QdwF2kcq53xHnFEYT0XHW5i3j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744609640; c=relaxed/simple;
	bh=ifp+Rc6GyOS8cXHrcl6fph6v5VnNnVQ6tWfeUCqd90w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=etlTLs02tonzN9UrQZPEizt5B5u+aXKkUWP7A/UwyCtKAdzPGi4TRCHfddb93l4vHaUmzNV7yisNn/IQH66mcUe+ohDnPwWNYZj+nF+0lIbeSg29dZrpL0Iz2i8BCzlvMiD2i4fHvVsjsHKCnWtQtQ8Ry7KyZNx8aszGLDmxFYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1u4Cer-00063p-40; Mon, 14 Apr 2025 07:47:01 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1u4Ceq-000CNP-0Y;
	Mon, 14 Apr 2025 07:47:00 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1u4Ceq-000AAR-0E;
	Mon, 14 Apr 2025 07:47:00 +0200
Date: Mon, 14 Apr 2025 07:47:00 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
	netdev <netdev@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: lan78xx: Failed to sync IRQ enable register: -ENODEV
Message-ID: <Z_yhVCu0UR5s6p19@pengutronix.de>
References: <3d4bda4e-f4e8-455e-87ec-2a84d6924d76@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d4bda4e-f4e8-455e-87ec-2a84d6924d76@gmx.net>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

Hi Stefan,

On Sun, Apr 13, 2025 at 09:49:00PM +0200, Stefan Wahren wrote:
> Hi,
> i noticed that recent changes to lan78xx introduced error messages to
> the bootlog of Raspberry Pi 3 B Plus (arm/multi_v7_defconfig, 6.15.0-rc1).
> 
> [    8.715374] lan78xx 1-1.1.1:1.0 (unnamed net_device) (uninitialized):
> No External EEPROM. Setting MAC Speed
> [    9.313859] usbcore: registered new interface driver lan78xx
> [   10.132752] vchiq: module is from the staging directory, the quality
> is unknown, you have been warned.
> [   10.533613] usbcore: registered new device driver onboard-usb-dev
> [   10.533861] usb 1-1.1: USB disconnect, device number 3
> [   10.533880] usb 1-1.1.1: USB disconnect, device number 6
> [   10.656641] lan78xx 1-1.1.1:1.0 eth0 (unregistered): Failed to sync
> IRQ enable register: -ENODEV
> [   10.657440] lan78xx 1-1.1.1:1.0 eth0 (unregistered): Failed to sync
> IRQ enable register: -ENODEV
> [   10.658819] usb 1-1.1.2: USB disconnect, device number 5
> 
> Since this happend during only two times during boot, i added a
> WARN_ON() in this specific case in order to see what's going on:
...
> [   10.656092]  lan78xx_irq_bus_sync_unlock from  free_irq
> [   10.656110]  free_irq from phy_disconnect
> [   10.656131]  phy_disconnect from lan78xx_disconnect
> [   10.656143]  lan78xx_disconnect from usb_unbind_interface
...
> Maybe some has any idea, how to fix this properly.

Thanks for the detailed report and backtrace!

The warning you're seeing was introduced by this patch:
0da202e6a56f ("net: usb: lan78xx: Add error handling to lan78xx_irq_bus_sync_unlock")

It adds error handling to lan78xx_irq_bus_sync_unlock() to log failed
register access.

In your case, everything in the stack is actually doing what it's
supposed to:
- lan78xx_disconnect() notifies the PHY subsystem.
- PHY framework sees the attached IRQ and calls free_irq().
- free_irq() calls irq_chip_bus_sync_unlock() ->
  lan78xx_irq_bus_sync_unlock(), where we hit the -ENODEV because
  the USB device is already gone.

The issue is that the IRQ subsystem doesn’t currently support
hot-unpluggable IRQ controllers, so there's no mechanism to tell it
"the hardware is already gone, just clean up the software state."
Until such a mechanism exists, these benign warnings can show up in
valid disconnect paths.

I can imagine a few possible options:

- Silently ignore -ENODEV in irq_bus_sync_unlock() and similar paths  
  Pro: trivial to implement  
  Contra: completely hides real issues if they happen for other reasons

- Add a global flag to suppress lan78xxx errors in .disconnect path  
  Pro: simple and less intrusive  
  Contra: same as above — poor diagnostics

- Introduce irq_domain_mark_hardware_removed() and check it in relevant paths  
  Pro: makes the real hardware state explicit, allows IRQ framework to make
       better decisions, improves diagnostics  
  Contra: requires some non-trivial changes across IRQ and driver code

Personally, I’d prefer the last option. It's harder to implement, but it gives
us the right model for handling hot-unpluggable IRQ controllers in the long
term.

All of these changes are more or less cosmetic. So far, there is no real
problem — just the fact that software is attempting to access hardware that is
already gone.  My proposal would primarily make the disconnection path cleaner
and less noisy.

It won’t prevent other parts of the driver or subsystem from hitting -ENODEV
before we reach the disconnect path. So until the driver itself is aware that
the hardware is gone and begins cleanup, we may still get register access
errors from other paths. This is expected.

Best regards,  
Oleksij Rempel
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


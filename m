Return-Path: <linux-usb+bounces-6869-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D182885EBE5
	for <lists+linux-usb@lfdr.de>; Wed, 21 Feb 2024 23:40:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22315B232BC
	for <lists+linux-usb@lfdr.de>; Wed, 21 Feb 2024 22:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3C53C470;
	Wed, 21 Feb 2024 22:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnCYkhnE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2333B2B6
	for <linux-usb@vger.kernel.org>; Wed, 21 Feb 2024 22:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708555219; cv=none; b=tFGFeF0rLPsKKT6lNwuVbWrNEoKUDMRBTtjvtSkUSC7pptFDvWlR68bTQWuCbT89R/+ULsNrsCbAt0M8iSB5j3epfgM0852h4cNlrqhUHAAqGWl/cZ6q9A/z9uGFDLYERy+3//13fIvfIbmLOpgrx0PWOA9ml0Ndn6gwWAZ1aYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708555219; c=relaxed/simple;
	bh=CwioOBId8IOQMHlndBX+Is4P1BUPXdK2g1sTsvOz31g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n39eflxbOfl03Bbv9dsqJXiNgCmZiywT07XPY4YtBCJXgdj+zp73gEbVJ5Ul3LRFsSxefMjOsWwzfHBQxKCMiuOpbyrX7Z0s1Z8xKc2wSpAa1IwWGfB0IZS84JzR1rCD66mqnEH48fO9bU9BoRuPeSR46w0jdryT42lRZVrZXuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YnCYkhnE; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4704f3e2a99so801453137.3
        for <linux-usb@vger.kernel.org>; Wed, 21 Feb 2024 14:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708555216; x=1709160016; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bdLNv4kqADSmLjP18Z5JYESHYr0H899Shb5dvYZVJtE=;
        b=YnCYkhnE5cxVPw8CyA+6yhdRso6SHFkHYlHvDW6ynBLhQ/fFB3hfOj3spXTJReBx6I
         PYxzINyy+01/4seND52QslfYdkRcZQg2ofF0LnaEbNgqTJL5AsWNh5mjdH8n/XSQ3GJC
         /hOdkoZup+QN3fpCcff7i6ZJFSHwr7cdhxpiYXKuW5BP87Ocfl6MhBT8MB6T5wp1OovJ
         AGiIeAhMec4UoW9Hm3aU7+0Fg3PdaX3EgAcVQUpfAf7iWxgcLc7nf8P9Cp2osOhEnbm9
         XavpBfSanyvvtE5vHL1jdJDNI/e7NBPFtvpNHTtb56WklK3zJKW3CWymvrPBrVSN/I/b
         fAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708555216; x=1709160016;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdLNv4kqADSmLjP18Z5JYESHYr0H899Shb5dvYZVJtE=;
        b=SlHQnlkJQo/iXT+CA+4+elVZIyGU86dLZgXjxhz3GShGPCCXa/bR8GwMRWOdzSUdLY
         BRKtrg/W6naFASqB3y5T1z7fiNU0i32QoK3I0Jd3KGKjVBaSbryhaQmM/aIjrkIHlV5b
         hlFM+xPaAtR8VyMUmx3nj3dOOtOtzIpqlUdHBw1bBmrii7304UliBiO7cDrJKnofuMJJ
         Sf3St9y37gw41jkwYSRm7IWZT86KHz2OXiGpYbAzl83WBfq6DEynIzDzLUWXxmqRC7X7
         L9x+9Ra0sdq1im5XQm007RrhvMG0Gm/CCSFBBZH3T/Tl6kO6+HOYtxrR3fwGYpY961eI
         Dbxg==
X-Gm-Message-State: AOJu0YyegYEDrNc7NL1WDAEjE3mP2oDZWms+dIjdNgT4GO1gome5mrAf
	k4RnVTkSa1i7jmUuvMbg1lHNHUlpcx0Yzvth1KFZzgazank/Kvf2ipecJWjG3ptccULIVtHTGgL
	4e96Lnq3jK98xs+kgF1oXIzATmOt0P3G+3zo=
X-Google-Smtp-Source: AGHT+IFOscLJs1Tqu38p4zuXVCzPo6s3nBHlyS6OlFy7YncnE0tEN4Mz2roPPScP1n9R54Z1VJxguzMiTBdhLfFwArk=
X-Received: by 2002:a05:6102:32c5:b0:470:5c9f:6c2d with SMTP id
 o5-20020a05610232c500b004705c9f6c2dmr11563549vss.26.1708555216445; Wed, 21
 Feb 2024 14:40:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHK3GzziwVASKgvBQmv_DnhwLJ8Bj2K=42ptyTrtOFCAAPXcnw@mail.gmail.com>
 <Yp9k4JRcNMcvVi6l@rowland.harvard.edu>
In-Reply-To: <Yp9k4JRcNMcvVi6l@rowland.harvard.edu>
From: Kevin Rowland <kevin.p.rowland@gmail.com>
Date: Wed, 21 Feb 2024 14:40:05 -0800
Message-ID: <CAHK3Gzw7tqgjyiKgEqg0LHMFf4ycjOKE=pdobf6OFeANvUvkQg@mail.gmail.com>
Subject: Re: Control of external VBUS on resume from sleep
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Alan, first, apologies for the extremely late response.

I successfully hacked around the original issue, things have been
working for a long
time, but now I have to revisit it. Responses inline.

On Tue, Jun 7, 2022 at 7:46 AM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Mon, Jun 06, 2022 at 03:12:58PM -0700, Kevin Rowland wrote:
> > Hello all,
> >
> > I've got a USB 3.0 host (an NXP i.MX8QM running 5.10.72 with Cadence
> > XHCI host controller IP) connected to a USB device on the same PCB,
> > which also happens to run Linux (although I think that's beside the
> > point here). The quirk is that, although D+/D- are routed directly
> > from host to device, VBUS is actually controlled by a separate GPIO on
> > the host. The dedicated VBUS pin on the USB host controller is pulled
> > high. ID is pulled high on the PBC but driven low by a GPIO from the
> > i.MX8, so we can imagine it's tied to ground.
> >
> > I've made a little schematic drawing [1] to help visualize the connections.
> >
> > We've run into an issue where, on resume from STR, the following
> > sequence occurs:
> > - the GPIO peripheral on the host is powered back on, VBUS is
> > immediately driven high
>
> Why wasn't the GPIO turned on the whole time the system was suspended?
> How can remote wakeup work without VBUS power?
We don't currently use remote wakeup. The device is self-powered and enters
suspend-to-RAM itself when the host is suspended. The device can then wake
from an external source, at which point it will wake the host (i.MX8)
by asserting a
GPIO.

We've discussed maintaining VBUS through suspend and using USB remote
wakeup from the device, but that's off the table right now. Part of
the reason is
that our SoC can't get down into its lowest power state without powering off all
on-chip peripherals like the USB host controller - it can, however,
get to its lowest
power state and still wake via GPIO events.

> > - the device signals attach on DP/DN, but _I believe_ the host
> > controller on the host is not yet powered on
Slight correction, we have a 3.0 link so the device signals attach on
the SS lines,
then I think it falls back to signaling attach on DP/DN. Hopefully that doesn't
change things too much.

> > - the host controller is then powered on and the {hub, hcd, xhci}
> > drivers all resume, but no port status change is detected; I believe
> > that attach signaling was missed by the host controller
> >
> > I'd like for the host controller driver (or the root hub driver??) to
> > have explicit control of VBUS, so that it's driven high only when the
> > host controller regains power and is ready to detect attach signaling.
> > I see device-tree documentation about the USB connector node and
> > `vbus-supply`, but I'm having a hard time understanding how to square
> > my use-case with `drivers/usb/common/usb-conn-gpio.c`, which reacts to
> > state changes on VBUS or ID.
> >
> > Any thoughts on where I should stick the logic that enables VBUS on
> > resume? My current (very hacky) fix is to initialize a global (argh!)
> > gpio_desc to refer to the VBUS GPIO, then to call
> > `gpiod_set_value(<gpio_desc>, 0); gpiod_set_value(<gpio_desc>, 1);` in
> > `usb_port_resume()`, which is where I ended up when tracking the
> > original issue. This toggles VBUS and allows us to catch the new round
> > of attach signaling from the device.
>
> The hub driver already knows to turn on port power when a hub is
> initialized or during a reset-resume.  It doesn't do so during a
> regular resume because it assumes power was on the whole time.  You can
> change this, if necessary.
Via set_port_feature(PORT_FEAT_POWER) in hub_power_on? Does this mean
I should patch in some extra logic to ask the platform-specific driver
to assert the
external VBUS GPIO? I'm happy to do that, I just don't want to miss logic that's
already built-in to the drivers.

If I'm reading the indirection correctly, I'll need:
hcd_to_xhci(bus_to_hcd(hub->hdev->bus))

to access the struct xhci_hcd. I don't yet see how to go from there to
the platform
driver.

>
> > I'm happy to use the fixed-regulator framework instead, I'm just not
> > sure which driver should own the gpio_desc / regulator and where it
> > should be disabled / enabled during suspend / resume.
>
> Probably whichever platform-specific driver manages your xHCI controller
> should be the one to interact with the GPIO.  But it should make changes
> only when told to do so by a higher layer (such as the hub driver).
This helps, thanks.

Best,
Kevin



> Alan Stern
>
> > Best,
> > Kevin
> >
> > [1]
> >
> >  i.MX8                      device
> > .----------------.         .-------------.
> > |     GPIOX.Y ---|-------->| VBUS (in)   |
> > |                |         |             |
> > |  USB           |    _    |             |
> > | .------------. |    |    |             |
> > | |    VBUS ---|-|----'    |             |
> > | |     DP <---|-|-------->| DP          |
> > | |     DP <---|-|-------->| DN          |
> > | |     ID ----|-|----.    '-------------'
> > | '------------' |    |
> > '----------------'    v


Return-Path: <linux-usb+bounces-6912-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F64886027C
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 20:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55ACC28D5E6
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 19:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C68554904;
	Thu, 22 Feb 2024 19:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKq0bGX3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD0E14B82B
	for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 19:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708629483; cv=none; b=Z9dJwicwYci85G0GI1y935Ll4XQ1GMq1aa3m05YPMMVDBZdf+oyIGavQrdwS9F8naGAIYDvD1pB8aanzXQzjEkczNxScJUNTscRgD5Y1o5Q65Y4ToPfDsVX45gQZhA9dAVTdo78e+NI/EyHQxBiXDemtfwHJjFCo94WQer3pqRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708629483; c=relaxed/simple;
	bh=hHaCh0qYRJtQz/22yVWqMc419T74hhb+qmd6KY7KPNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=No226Wi5tF1gtfzjzLafxvczo5u3O3AGu03JxwJ5gqDP1Bv2Kn1vo0UGwLA6SVWKNtSZKRClFW8KmcMhxHBjOSFpjRwEhpefZWcqToTBtKSOAyH/9WKVKedV7BngDFK5ziNFAQARFr5FNia2h7AYmDd9txONLg2a1f3N7UrveDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKq0bGX3; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7d5c514944fso573809241.1
        for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 11:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708629480; x=1709234280; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lk/hQX0g76DH2PDGuuic9ne11CgGhr4vV3zmfQNW/W8=;
        b=lKq0bGX3uUd7HtwVFmuxx/7m21WXz46CHSyFaugfNQaqm/cOGKyHSPlqsmHEvuLzsE
         hAzUGvRLT1tj3ksjcbkEdYuxWqcXKY4wl4iiTW66dc5kv15y2zzi4dIr3M6t1knL9HEt
         yzX6pDuw5cZHzdYCJz24u3qf08OqTRHtl0GmdndL5MuKGOItryLll/x+cCqMWTnxQMZ6
         bUPEDqjdd1OPBrIZx7ddtOnuSkoxFPCO/1aaHP+QR7XexmkB4lO5PZMXUG04FeYDq5oA
         upWBf75faDRH8T+Nw+UJMziCLnn4deiPSJzl5KOyIqanth1+gnP5Qqp1fJNuMXQl1Xud
         jZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708629480; x=1709234280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lk/hQX0g76DH2PDGuuic9ne11CgGhr4vV3zmfQNW/W8=;
        b=tUrxzfQvb+GPzVs9CO9kXEXkgKvLWx1rDzVmRWdJjy0jn2ZcD9nTv31Ac3NH5Avb+c
         MvVwK2y37ixxVDBMXgrDPPCrOdTP1Hcznq3rtJXYJFJ6g09yxI0bOGamu+uDPI+FCK4g
         VZVSE45fA4O8Eq/ML5oa69aayjUzKxW+//YbCiEqDThwQ51STNenG5flWKpiq+HatHJh
         4C5LAVqmL0XX/1rK0JU14E0YDO0happjesEfU24lCwwsFheey+i27Sw+mG8U6BB3eUOV
         bmbB84ffjgaiQfP9sW9YSPr754+pmSHJAISv4/0hGDD89tLiNmOB0kB2PsO01xzw/ESl
         c/1Q==
X-Gm-Message-State: AOJu0Ywtyh6OZ/V8+3zHsEt4pd0eUrAUYmRDPMDVtLj7MbdoFnswHLCe
	TucCFbmGVRp3fNEIYpfO4crkT2iAXOAWfbOCve3sseRA/RN77JmwcDOKVZEA0pbptVlmKRwfxLt
	I4zu+MV1plqFQBu2OguS3b0ZfNiM9Jvm3SYE=
X-Google-Smtp-Source: AGHT+IGnz0sU7GMOldiNplNVwBaC8NYxqLmjTa0Cy9FZCqAOrSncwemQFPxTk5DjzQLGUpaXguS/v57wzZg1MgJ7aOA=
X-Received: by 2002:a05:6122:2486:b0:4d1:3924:caa6 with SMTP id
 by6-20020a056122248600b004d13924caa6mr3174657vkb.1.1708629479998; Thu, 22 Feb
 2024 11:17:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHK3GzziwVASKgvBQmv_DnhwLJ8Bj2K=42ptyTrtOFCAAPXcnw@mail.gmail.com>
 <Yp9k4JRcNMcvVi6l@rowland.harvard.edu> <CAHK3Gzw7tqgjyiKgEqg0LHMFf4ycjOKE=pdobf6OFeANvUvkQg@mail.gmail.com>
 <30fa974b-d943-4b8f-b6a7-313f03ca439e@rowland.harvard.edu>
In-Reply-To: <30fa974b-d943-4b8f-b6a7-313f03ca439e@rowland.harvard.edu>
From: Kevin Rowland <kevin.p.rowland@gmail.com>
Date: Thu, 22 Feb 2024 11:17:48 -0800
Message-ID: <CAHK3GzzvDkA_a2eFEqx8Dw+mL9wLnCh5F-TUBKKT0ui8psfXuw@mail.gmail.com>
Subject: Re: Control of external VBUS on resume from sleep
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 7:55=E2=80=AFAM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Wed, Feb 21, 2024 at 02:40:05PM -0800, Kevin Rowland wrote:
> > Alan, first, apologies for the extremely late response.
> >
> > I successfully hacked around the original issue, things have been
> > working for a long
> > time, but now I have to revisit it. Responses inline.
> >
> > On Tue, Jun 7, 2022 at 7:46 AM Alan Stern <stern@rowland.harvard.edu> w=
rote:
> > >
> > > On Mon, Jun 06, 2022 at 03:12:58PM -0700, Kevin Rowland wrote:
> > > > Hello all,
> > > >
> > > > I've got a USB 3.0 host (an NXP i.MX8QM running 5.10.72 with Cadenc=
e
> > > > XHCI host controller IP) connected to a USB device on the same PCB,
> > > > which also happens to run Linux (although I think that's beside the
> > > > point here). The quirk is that, although D+/D- are routed directly
> > > > from host to device, VBUS is actually controlled by a separate GPIO=
 on
> > > > the host. The dedicated VBUS pin on the USB host controller is pull=
ed
> > > > high. ID is pulled high on the PBC but driven low by a GPIO from th=
e
> > > > i.MX8, so we can imagine it's tied to ground.
> > > >
> > > > I've made a little schematic drawing [1] to help visualize the conn=
ections.
> > > >
> > > > We've run into an issue where, on resume from STR, the following
> > > > sequence occurs:
> > > > - the GPIO peripheral on the host is powered back on, VBUS is
> > > > immediately driven high
> > >
> > > Why wasn't the GPIO turned on the whole time the system was suspended=
?
> > > How can remote wakeup work without VBUS power?
> > We don't currently use remote wakeup. The device is self-powered and en=
ters
> > suspend-to-RAM itself when the host is suspended. The device can then w=
ake
> > from an external source, at which point it will wake the host (i.MX8)
> > by asserting a
> > GPIO.
> >
> > We've discussed maintaining VBUS through suspend and using USB remote
> > wakeup from the device, but that's off the table right now. Part of
> > the reason is
> > that our SoC can't get down into its lowest power state without powerin=
g off all
> > on-chip peripherals like the USB host controller - it can, however,
> > get to its lowest
> > power state and still wake via GPIO events.
> >
> > > > - the device signals attach on DP/DN, but _I believe_ the host
> > > > controller on the host is not yet powered on
> > Slight correction, we have a 3.0 link so the device signals attach on
> > the SS lines,
> > then I think it falls back to signaling attach on DP/DN. Hopefully that=
 doesn't
> > change things too much.
> >
> > > > - the host controller is then powered on and the {hub, hcd, xhci}
> > > > drivers all resume, but no port status change is detected; I believ=
e
> > > > that attach signaling was missed by the host controller
>
> You mean the port is physically attached to the device but the host
> controller reports that it is not connected?
>
> As part of its resume handling, the hub driver polls all the port
> statuses.  If there was a status change, it would be aware unless the
> controller's root hub simply did not report the new port status at all.

Right, in my original investigation from 18 months ago, on return from
`check_port_resume_type()` in `usb_port_resume()` I saw that BIT(0) in
both portstatus and portchange was cleared.

Then, if I hacked in an extra LOW->HIGH toggle of VBUS in
`usb_port_resume()`, right before `wait_for_connected()` /
`check_port_resume_type()`, I saw BIT(0) in both of those two port
registers was set, and enumeration succeeded. My conclusion was that
the host controller hardware was simply not powered on when VBUS was
first driven HIGH, so the hardware missed ATTACH signaling by the
device, and therefore BIT(0) remained clear. Hacking in an extra
rising edge on VBUS forced the device to signal ATTACH again, and at
that point the hardware was powered and ready to notice it.

I'm still pretty confident that that conclusion is correct, but I'm
open to clarifications.

>
> > > > I'd like for the host controller driver (or the root hub driver??) =
to
> > > > have explicit control of VBUS, so that it's driven high only when t=
he
> > > > host controller regains power and is ready to detect attach signali=
ng.
>
> In fact, the hub driver is aware of none of this.  The host controller
> driver, or better, the host controller's platform driver is where all
> the knowledge about the VBUS GPIO resides.
>
> How does your resume sequence work?  Does the PM core call a resume
> routine in the platform driver, which then tells the xHCI core to do its
> resume processing?  If that's the case then all you have to is turn on
> the GPIO after the xHCI resume processing is finished, just before the
> platform driver's resume routine returns.
>
> If that's not how it works then you might have to add some
> platform-specific glue code to the end of the xHCI core resume routine.
> Maybe controlled by a quirk flag.
>

I'm not sure if "platform driver" here means the i.MX8-specific driver
or the glue driver in `xhci-plat.c`. I see that the glue driver in
`xhci-plat.c` registers a resume hook. That resume hook indeed calls
`xhci_resume()` to tell the xHCI core to resume.

The i.MX8-specific driver is just the `cdns3` driver, which doesn't
seem to call into the xHCI core directly. Rather, the `cdns3` driver
creates the xHCI platform device with a
`platform_device_{alloc,add}()` pair. So since the xHCI platform
device is a child of the`cdns3` device, the latter will be resumed
before the former (just because of their ordering in `dpm_list`).
Writing that out makes me think I need to drive VBUS in the glue
driver, in `xhci-plat.c:xhci_plat_resume()`, after returning from
`xhci_resume()`, exactly as you've suggested. I can structure it in
the same way as the existing `suspend_quirk()`, such that a callback
is included in the "private" data passed by the `cdns3` driver.

> > > > I see device-tree documentation about the USB connector node and
> > > > `vbus-supply`, but I'm having a hard time understanding how to squa=
re
> > > > my use-case with `drivers/usb/common/usb-conn-gpio.c`, which reacts=
 to
> > > > state changes on VBUS or ID.
> > > >
> > > > Any thoughts on where I should stick the logic that enables VBUS on
> > > > resume? My current (very hacky) fix is to initialize a global (argh=
!)
> > > > gpio_desc to refer to the VBUS GPIO, then to call
> > > > `gpiod_set_value(<gpio_desc>, 0); gpiod_set_value(<gpio_desc>, 1);`=
 in
> > > > `usb_port_resume()`, which is where I ended up when tracking the
> > > > original issue. This toggles VBUS and allows us to catch the new ro=
und
> > > > of attach signaling from the device.
> > >
> > > The hub driver already knows to turn on port power when a hub is
> > > initialized or during a reset-resume.  It doesn't do so during a
> > > regular resume because it assumes power was on the whole time.  You c=
an
> > > change this, if necessary.
> > Via set_port_feature(PORT_FEAT_POWER) in hub_power_on? Does this mean
> > I should patch in some extra logic to ask the platform-specific driver
> > to assert the
> > external VBUS GPIO? I'm happy to do that, I just don't want to miss log=
ic that's
> > already built-in to the drivers.
> >
> > If I'm reading the indirection correctly, I'll need:
> > hcd_to_xhci(bus_to_hcd(hub->hdev->bus))
> >
> > to access the struct xhci_hcd. I don't yet see how to go from there to
> > the platform
> > driver.
>
> This is a good indication that you're trying to do things in the wrong
> place.  Since what you're talking about is all platform-specific stuff,
> that best place to put it all is in the platform driver.
>

Okay great, avoiding the indirection game is always nice :-)

> Alan Stern
>
> > > > I'm happy to use the fixed-regulator framework instead, I'm just no=
t
> > > > sure which driver should own the gpio_desc / regulator and where it
> > > > should be disabled / enabled during suspend / resume.
> > >
> > > Probably whichever platform-specific driver manages your xHCI control=
ler
> > > should be the one to interact with the GPIO.  But it should make chan=
ges
> > > only when told to do so by a higher layer (such as the hub driver).
> > This helps, thanks.
> >
> > Best,
> > Kevin
> >
> >
> >
> > > Alan Stern
> > >
> > > > Best,
> > > > Kevin
> > > >
> > > > [1]
> > > >
> > > >  i.MX8                      device
> > > > .----------------.         .-------------.
> > > > |     GPIOX.Y ---|-------->| VBUS (in)   |
> > > > |                |         |             |
> > > > |  USB           |    _    |             |
> > > > | .------------. |    |    |             |
> > > > | |    VBUS ---|-|----'    |             |
> > > > | |     DP <---|-|-------->| DP          |
> > > > | |     DP <---|-|-------->| DN          |
> > > > | |     ID ----|-|----.    '-------------'
> > > > | '------------' |    |
> > > > '----------------'    v


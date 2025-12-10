Return-Path: <linux-usb+bounces-31350-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9235ECB1C74
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 04:16:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 293883014D9A
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 03:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7C927FD54;
	Wed, 10 Dec 2025 03:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i74G7DWy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025CC1E8342
	for <linux-usb@vger.kernel.org>; Wed, 10 Dec 2025 03:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765336536; cv=none; b=jQqE1h4v5rsAxUxaBfGyOaQZrIn5hpGl/RN8xAOsSx6rEa/2OX1wDxLkjeRCSfCu6H6RtAHdhE2oNVTIJyUdZy7FVO3QIilijPciLZcuHE9+5HfWgYkEXkGcy9dDrNbDs0IUwuBK/aVn7hNgu2yRTUa3tQKSbvim4xTWI3b1RWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765336536; c=relaxed/simple;
	bh=bZTqksrpBv2DrNLxZZS34vBm2UQ3LWxjYTFVL1QFk3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kB4+CRF5e7b+FHPOpWP3PyFg96tCY5VKSYW/aD+IdD3s9dR1crtvlo4ywDT/6JN2gPS7Nu2gtVzYtMYK2rJow4yaoVPsKEmAbcTCjY//xcIMGrAmVYHt1Wv5hq9LOPD3ogtW17UDIv4LY5r7C6a4v8zWz98w09+vUr/B5FHBpa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i74G7DWy; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-29586626fbeso73029885ad.0
        for <linux-usb@vger.kernel.org>; Tue, 09 Dec 2025 19:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765336533; x=1765941333; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mozq4iTByOjAFbmy+ytE/IJyyTlJdLj7+crXi19pnTw=;
        b=i74G7DWy7vZ5a5cDP/N144OuhXEq0YJYdJv0iytkPkdvkt6UQqEAZ1DffiuTJTCwC9
         2O3jzbIPljJEiXzetCynsZZMPGrNUV/kuZyxns0e0l/LvMKTahlNlbinFq9c4TlqFBuI
         ByOAQPHxvdvvR94Q+EgnQkS4X1tigQz1b+TXyV+SguroULBFwObAkovglVwPVyueqE7c
         vYkmcR3Rx1HF7pk8slbBJHny4n0xN2tKNYxl/GwS+BqRUPMtUXkBr6EQa/Dw3gFMiw/9
         /B1lHTWmgBk+zKfZ46iXq8DBK3Tyymz/wxLLwSBbYsAxTB9gcCxrIQAKJtysyrCpGM50
         Nd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765336533; x=1765941333;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mozq4iTByOjAFbmy+ytE/IJyyTlJdLj7+crXi19pnTw=;
        b=xUi62T+GD5TO50R+ie5XVApw/MFopFLk2i1VUcXEvhVM9XatINqC49EctHAWn0krTb
         o/CsXt6vP6bMNHjVlicHC6cRTtGfq7kdNnP6s7ppaP8lTsUGJ4K7PoLbX3MsW9MaIpwc
         qErBmawYAr/F+eVxhZxWVQWOVPpegYG4BwxypFvO9h7Zd2AHP1eW+RREdxtcIyUIe8xa
         IG/7mvC1jPI272bvrQC90EDOUvYQbTDXE95ULodOgmr2/yZj35lWHt6WET42i7oapewM
         Zhrl6bvk1UxwyXQ+BZ9bnuxmumGzntVoNAVWxBWSXPHSJv52vuk+Vyxxmn7RJRo8Ym5g
         wRoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwRWr+NFp70MweOTFRnYMmZqmn49ndcTRgNlBKNAIrGO/rAjBXQTuGj3v7hh3uEUDoCsm/muDqsZs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1W3SIfxdMpoGWp0Qz/C+ex6X+U1G92uD32mnO+NW95jIncuwg
	+9hXlojKl9Jrm5BS06/7EOmh0BdfZrhgxap4g21uF4OU3gZSRuFn/cui
X-Gm-Gg: AY/fxX6K7yL/oYfRGkiLqJFBIQHDQG0WQYPTpjQ6DmgDY2Qu40RW7b3UHgDOL3Nms0x
	qiRBASZhiqg+6IqkzzCQ4IzxhaT7eHo6Bnva+0iDDHIx2NWcFQglCRWE/Ackku/dmiX2Vw5yfq8
	bc2LeWJXEVw5q9hRLfwLY1T4IeTkt12/xTFixIsXl/24fMzzEMCoM1YVVmI319X3CC9IA+0vVt1
	7mIslhVGZkI06ZAvzm9+MC0aTIp+s/L0wx1tiQQ0nSNJRkVYr+UxdhlqJgdKkbFE1S6wG6sdfAL
	p7cPpok4UnH0iYYcxBCeloImcXUs9iyibPfTNO93JyqMOVQkVtMMVK9qOp5lBZY+27pGzrC+v+2
	EPfcl1+3WGtYxOhqaVUb36WxYGnRb90ZMvexrO/57RtS7iMCFELfW1Jb3P563QgNYd/ZVCVIocD
	7xTqvL
X-Google-Smtp-Source: AGHT+IFVLUHLgccmhLjotVAGoYiTDCLQw2jseK84qWI/Fc8mYpW2JOxmc7nctzTDKwdIX174jUBYBg==
X-Received: by 2002:a17:903:2984:b0:295:8a2a:9595 with SMTP id d9443c01a7336-29ec2486e7amr12387605ad.39.1765336532990;
        Tue, 09 Dec 2025 19:15:32 -0800 (PST)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaabf7csm166667715ad.79.2025.12.09.19.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 19:15:32 -0800 (PST)
Sender: AceLan Kao <acelan@gmail.com>
Date: Wed, 10 Dec 2025 11:15:25 +0800
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andreas Noever <andreas.noever@gmail.com>, 
	Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH] [RFC] thunderbolt: Add delay for Dell U2725QE link width
Message-ID: <pjn5d7oz433z4jph6whdalhowf652xknnk2fh5q7elffgb5ogo@7dtpvywxc6nw>
Mail-Followup-To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andreas Noever <andreas.noever@gmail.com>, 
	Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mario Limonciello <mario.limonciello@amd.com>
References: <20251209054141.1975982-1-acelan.kao@canonical.com>
 <20251209070633.GA2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251209070633.GA2275908@black.igk.intel.com>

Hi Mika,

On Tue, Dec 09, 2025 at 08:06:33AM +0100, Mika Westerberg wrote:
> +Mario since this is AMD related.
> 
> [Also keeping all the context].
> 
> On Tue, Dec 09, 2025 at 01:41:41PM +0800, Chia-Lin Kao (AceLan) wrote:
> > When plugging in a Dell U2725QE Thunderbolt monitor, the kernel produces
> > a call trace during initial enumeration. The device automatically
> > disconnects and reconnects ~3 seconds later, and works correctly on the
> > second attempt.
> > 
> > Issue Description:
> > ==================
> > The Dell U2725QE (USB4 device 8087:b26) requires additional time during
> > link width negotiation from single lane to dual lane. On first plug, the
> > following sequence occurs:
> > 
> > 1. Port state reaches TB_PORT_UP (link established, single lane)
> > 2. Path activation begins immediately
> > 3. tb_path_activate() - > tb_port_write() returns -ENOTCONN (error -107)
> > 4. Call trace is generated at tb_path_activate()
> > 5. Device disconnects/reconnects automatically after ~3 seconds
> > 6. Second attempt succeeds with full dual-lane bandwidth
> > 
> > First attempt dmesg (failure):
> > -------------------------------
> > [   36.030347] thunderbolt 0000:c7:00.6: 2:16: available bandwidth for new USB3 tunnel 9000/9000 Mb/s
> > [   36.030613] thunderbolt 0000:c7:00.6: 2: USB3 tunnel creation failed
> > [   36.031530] thunderbolt 0000:c7:00.6: PCIe Down path activation failed
> > [   36.031531] WARNING: drivers/thunderbolt/path.c:589 at 0x0, CPU#12: pool-/usr/libex/3145
> > 
> > Second attempt dmesg (success):
> > --------------------------------
> > [   40.440012] thunderbolt 0000:c7:00.6: 2:16: available bandwidth for new USB3 tunnel 36000/36000 Mb/s
> > [   40.440261] thunderbolt 0000:c7:00.6: 2:16: maximum required bandwidth for USB3 tunnel 9000 Mb/s
> > [   40.440269] thunderbolt 0000:c7:00.6: 0:4 <-> 2:16 (USB3): activating
> > [   40.440271] thunderbolt 0000:c7:00.6: 0:4 <-> 2:16 (USB3): allocating initial bandwidth 9000/9000 Mb/s
> > 
> > The bandwidth difference (9000 vs 36000 Mb/s) indicates the first attempt
> > occurs while the link is still in single-lane mode.
> > 
> > Root Cause Analysis:
> > ====================
> > The error originates from the Thunderbolt/USB4 device hardware itself:
> > 
> > 1. Port config space read/write returns TB_CFG_ERROR_PORT_NOT_CONNECTED
> > 2. This gets translated to -ENOTCONN in tb_cfg_get_error()
> > 3. The port's control channel is temporarily unavailable during state
> >    transition from single lane to dual lane (lane bonding)
> > 
> > The comment in drivers/thunderbolt/ctl.c explains this is expected:
> >   "Port is not connected. This can happen during surprise removal.
> >    Do not warn."
> > 
> > Attempted Solutions:
> > ====================
> > 1. Retry logic on -ENOTCONN in tb_path_activate():
> >    Result: Caused host port (0:0) lockup with hundreds of "downstream
> >    port is locked" errors. Rejected by user.
> > 
> > 2. Increased tb_port_wait_for_link_width() timeout from 100ms to 3000ms:
> >    Result: Did not resolve the issue. The timeout increase alone is
> >    insufficient because the port state hasn't reached TB_PORT_UP when
> >    lane bonding is attempted.
> > 
> > 3. Added msleep(2000) at various points in enumeration flow:
> >    Locations tested:
> >    - Before tb_switch_configure(): Works ✓
> >    - Before tb_switch_add(): Works ✓
> >    - Before usb4_port_hotplug_enable(): Works ✓
> >    - After tb_switch_add(): Doesn't work ✗
> >    - In tb_configure_link(): Doesn't work ✗
> >    - In tb_switch_lane_bonding_enable(): Doesn't work ✗
> >    - In tb_port_wait_for_link_width(): Doesn't work ✗
> > 
> >    The pattern shows the delay must occur BEFORE hotplug enable, which
> >    happens early in tb_switch_port_hotplug_enable() -> usb4_port_hotplug_enable().
> > 
> > Current Workaround:
> > ===================
> > Add a 2-second delay in tb_wait_for_port() when the port state reaches
> > TB_PORT_UP. This is the earliest point where we know:
> > - The link is physically established
> > - The device is responsive
> > - But lane width negotiation may still be in progress
> > 
> > This location is chosen because:
> > 1. It's called during port enumeration before any tunnel creation
> > 2. The port has just transitioned to TB_PORT_UP state
> > 3. Allows sufficient time for lane bonding to complete
> > 4. Avoids affecting other code paths
> > 
> > Testing Results:
> > ================
> > With this patch:
> > - No call trace on first plug
> > - Device enumerates correctly on first attempt
> > - Full bandwidth (36000 Mb/s) available immediately
> > - No disconnect/reconnect cycle
> > - USB and PCIe tunnels create successfully
> > 
> > Without this patch:
> > - Call trace on every first plug
> > - Only 9000 Mb/s bandwidth (single lane) on first attempt
> > - Automatic disconnect/reconnect after ~3 seconds
> > - Second attempt works with 36000 Mb/s
> > 
> > Discussion Points for RFC:
> > ===========================
> > 1. Is a fixed 2-second delay acceptable, or should we poll for a
> >    specific hardware state?
> > 
> > 2. Should we check PORT_CS_18_TIP (Transition In Progress) bit instead
> >    of using a fixed delay?
> > 
> > 3. Is there a better location for this delay in the enumeration flow?
> > 
> > 4. Should this be device-specific (based on vendor/device ID) or apply
> >    to all USB4 devices?
> > 
> > 5. The 100ms timeout in tb_switch_lane_bonding_enable() may be too
> >    short for other devices as well. Should we increase it universally?
> 
> We should understand the issue better. This is Intel Goshen Ridge based
> monitor which I'm pretty sure does not require additional quirks, at least
> I have not heard any issues like this. I suspect this is combination of the
> AMD and Intel hardware that is causing the issue.
Actually, we encountered the same issue on Intel machine, too.
Here is the log captured by my ex-colleague, and at that time he used
6.16-rc4 drmtip kernel and should have reported this issue somewhere.
https://paste.ubuntu.com/p/bJkBTdYMp6/

The log combines with drm debug log, and becomes too large to be
pasted on the pastebin, so I removed some unrelated lines between 44s
~ 335s.

> 
> Looking at your dmesg, even before your issue there is suspicious log
> entry:
> 
> [    5.852476] localhost kernel: [31] thunderbolt 0000:c7:00.5: acking hot unplug event on 0:6
> [    5.852492] localhost kernel: [12] thunderbolt 0000:c7:00.5: 0:6: DP IN resource unavailable: adapter unplug
> 
> This causes tearing down the DP tunnel. It is unexpected for the host
> router to send this unless you plugged monitor directly to some of the
> Type-C ports at this time?
No, I didn't plug any device during booting.

> 
> I wonder if you could take trace logs too from the issue? Instructions:
> 
> https://github.com/intel/tbtools?tab=readme-ov-file#tracing
> https://github.com/intel/tbtools/wiki/Useful-Commands#tracing
> 
> Please provide both full dmesg and the trace.out or the merged one. That
> would allow us to look what is going on (hopefully).
Got it, I'll do it tomorrow.

> 
> > Hardware Details:
> > =================
> > Device: Dell U2725QE Thunderbolt Monitor
> > USB4 Router: 8087:b26 (Intel USB4 controller)
> > Host: AMD Thunderbolt 4 controller (0000:c7:00.6)
> > 
> > Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> > ---
> > Full dmesg log available at: https://paste.ubuntu.com/p/CXs2T4XzZ3/
> > ---
> >  drivers/thunderbolt/switch.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> > index b3948aad0b955..e0c65e5fb0dca 100644
> > --- a/drivers/thunderbolt/switch.c
> > +++ b/drivers/thunderbolt/switch.c
> > @@ -530,6 +530,8 @@ int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
> >  			return 0;
> >  
> >  		case TB_PORT_UP:
> > +			msleep(2000);
> > +			fallthrough;
> >  		case TB_PORT_TX_CL0S:
> >  		case TB_PORT_RX_CL0S:
> >  		case TB_PORT_CL1:
> > -- 
> > 2.43.0


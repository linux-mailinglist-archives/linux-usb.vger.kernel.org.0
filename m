Return-Path: <linux-usb+bounces-32284-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 75871D19ED9
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 16:34:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 227A4300B371
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 15:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F613090C5;
	Tue, 13 Jan 2026 15:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XS0BVzMd"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9854C283FC3;
	Tue, 13 Jan 2026 15:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768318313; cv=none; b=qWUfTe8E6xglvuUOoIFPj631q8gLRgbqJk2QnZ4m5ddCfWUcenVLVcI1HjXRcOE1EEdAUW0tK1TsLvIUpFIWKd2FQCgkor6+vo0ErNpViFCNb/0vev0dYOsJPjjpr7QqRPF4y9eg2SyzZ2xDsKj0cR4y3KPx0yZjnll0wFP38dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768318313; c=relaxed/simple;
	bh=c7d5jlgASjxzIxTiQVH1feaKffgW8+1S4PM5q3EL+Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1JrlDAwkE1eQsAaWUuYWSShZbVkFfDZgVIB5dpn1wPgGUwZ5ao/J41tkdwr6f1xjgwMpb1vMco7g8pTq7veN425kSojHwKVG1SUV7YdvgCLPFJf+iCfDAs3qVci7Z+LcvT9uV/iLFmESPqjaP10TsB4HX/Ova70HWirFSmFpmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XS0BVzMd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F049C116C6;
	Tue, 13 Jan 2026 15:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768318313;
	bh=c7d5jlgASjxzIxTiQVH1feaKffgW8+1S4PM5q3EL+Ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XS0BVzMdX6wwu7jJFI+Wdwj2hnpaDwThBV75hD8X85Duz3CNwf7fp7JHjOtbf6/jx
	 y6vxuNYBx7dnIIewd+MzRJu5km5LJhhD2J5bbHriW75eKt27VS/1vkAchNpfquybt1
	 tLK/NhIVazPzjHgIdsb3kXfazz+icFLN76q/9WFWMprIjCfRd75NFUELNxbYbXXZxl
	 sz4Ai6kdAA7bN+CbjXm3GjM78eTCdqAWv8Rj+uob5B3+Pfe+Vhg5I/Vbz5SE7vaFmj
	 KkT0HfBC3grnmz0UlSby0lXkT911+M2BvfqUXOjuEknQkf5tC8RlrZJ0ihlTYF8RKH
	 X6lxleOce0Tfg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vfgN0-000000003Tx-0cMf;
	Tue, 13 Jan 2026 16:31:46 +0100
Date: Tue, 13 Jan 2026 16:31:46 +0100
From: Johan Hovold <johan@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Corentin Labbe <clabbe@baylibre.com>, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	david@ixit.cz
Subject: Re: [PATCH v8 1/2] usb: serial: add support for CH348
Message-ID: <aWZlYuFXYd5eAZTT@hovoldconsulting.com>
References: <aINXS813fmWNJh3A@hovoldconsulting.com>
 <CAFBinCBMTOM-FMgENS-mrnV17HbKzhtPUd44_dDiwnD=+HVMWQ@mail.gmail.com>
 <aIiXyEuPmWU00hFf@hovoldconsulting.com>
 <CAFBinCBZhjs7DGEgxhz54Dg8aW3NX9_LdnoZeUZpm5ohaT_-oQ@mail.gmail.com>
 <aJCoRFe-RFW1MuDk@hovoldconsulting.com>
 <CAFBinCCYsWHsNwi99kFqvLv+xOYtp9u3omhrPdV-hdH+5Cfyew@mail.gmail.com>
 <aK7Y9rRIsGBKRFAO@hovoldconsulting.com>
 <CAFBinCD19CVc0kX-aqa8pw71O2F3Nwy9ght+2TCn9B4PbOCBfw@mail.gmail.com>
 <aS2hxeBR-tptevYd@hovoldconsulting.com>
 <CAFBinCAt1DevnggWJdzBzh3X1Yfb0ScZXYsgkrA1cGrUmfXVwg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFBinCAt1DevnggWJdzBzh3X1Yfb0ScZXYsgkrA1cGrUmfXVwg@mail.gmail.com>

On Mon, Dec 15, 2025 at 03:10:29AM +0100, Martin Blumenstingl wrote:
> On Mon, Dec 1, 2025 at 3:10 PM Johan Hovold <johan@kernel.org> wrote:

> > > Unfortunately I don't know how to read the HW flow control state from
> > > the hardware.
> > > Do you have any suggestions, how I can test HW flow control (after
> > > manually enabling it for a port)?
> >
> > You can try disabling reading from the device (e.g. never submit the
> > read urbs) and see if the RTS is deasserted when the buffer fills up.

> Doing so results in:
> - lots of UART_LSR_OE
> - RTS stays LOW (pulled to GND)
> 
> UART_LSR_OE increasing seems correct as far as I understand this.
> RTS being LOW is wrong and I cannot manage to get ch348 to pull it to HIGH.
> 
> I did some more research and found that ch348 implements UART_IIR_MSI
> and provides a fully standard compatible UART_MSR.
> This is either triggered by a status change on the pins (UART_MSR
> delta bits and the actual status bits), or by requesting an update
> using the VEN_R command (UART_MSR status bits only, no delta bits).
> 
> In a very simple test-case I've used jumper cables on port #0 of ch348:
> - RX and TX connected together
> - CTS and RTS connected together
> 
> If I remove the jumper between CTS and RTS I get:
>   ch348 ttyUSB0: got MSR = 0x01 // jumper removed
>   ch348 ttyUSB0: got MSR = 0x11 // jumper connected again
>   ch348 ttyUSB0: got MSR = 0x01 // jumper removed again
> 
> So the hardware does register the change.
> 
> Earlier I thought I found a fix: I had the values for
> R_C4_HW_FLOW_CONTROL_OFF and R_C4_HW_FLOW_CONTROL_ON swapped.
> That however didn't fix it.
> 
> My current work can be found here: [0]
> If you also don't have any further ideas then I'll drop the whole
> RTS/CTS code for now so the ch348 driver can finally make it into
> Linux 6.20

Or you can include it and just document the known issue with RTS control
for port 1. It seems you have everything else working, right?

> > And in the other direction, verify that writes are buffered after you
> > deassert RTS manually on the other end. That should be easier.

> This seems to work: if I pull CTS up then ch348 stops sending data

So that means hardware flow control (CRTSCTS) is enabled, which could
prevent manual control of RTS. Which port did you test this on? Or is it
the same behaviour on all ports (0-3)?

Going back to archives, it seems like you can control RTS on ports 0, 2
and 3. (And DTR/RTS is not available for ports 4-7).

Hardware flow being enabled on just port 1 may explain the difference
even if you would expect the device to also deassert RTS in the overflow
test (unless there are separate bits for controlling auto-rts and
auto-cts).

> > > In case I can't easily figure it out: would you also accept a driver
> > > that doesn't support RTS/CTS for its initial version?
> >
> > It's good to at least be able to control DTR/RST at open/close (i.e.
> > implement dtr_rts()) so that you can communicate when the other end
> > has hw flow enabled. Sound like you're really close to doing so.

> In the meantime I found out why I had trouble with the DTR signal on port 1.
> It was a user(space) error. I've been using [1] for some of my tests
> and it has a bug where it would clear c_cflag HUPCL [2], which
> prevents the kernel from turning DTR off on port close.

Ah, good that you found that.

Johan


Return-Path: <linux-usb+bounces-2332-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 638227DB32F
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 07:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E76D6B20D12
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 06:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D090A3FE4;
	Mon, 30 Oct 2023 06:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="K3vmFdX2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DC37ED
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 06:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EDAFC433C7;
	Mon, 30 Oct 2023 06:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698646940;
	bh=x/c6I6OK3ZtUw/+wssnpJw6q8FJ41rWL8uUeOHkfaj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K3vmFdX2YU/7WEbMZLogqJFTV7sa39AcFoGyadIjGmAACSONDkCyblUwz2G0OaNqD
	 xVABimG3FDvyBCi8S5NxL8X8SZbxlIeLLLS+kEIraqjBrZXq1e6CHactgUfU/Cmo9w
	 j6Le6jXmRL7+LzGO9+n7IKx7Z85Y2J7cPiSQTW7I=
Date: Mon, 30 Oct 2023 07:22:12 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: ariel marcovitch <arielmarcovitch@gmail.com>
Cc: johan@kernel.org, linux-usb@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Gaps in logs while using usb-serial as a console
Message-ID: <2023103052-unpeeled-calibrate-ae48@gregkh>
References: <CAFGKuwoFUaXMsOOWJNBenQDG6+syt80Z9pvQQK1XSZFztC2_SQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFGKuwoFUaXMsOOWJNBenQDG6+syt80Z9pvQQK1XSZFztC2_SQ@mail.gmail.com>

On Sun, Oct 29, 2023 at 08:21:21PM +0200, ariel marcovitch wrote:
> Greetings!
> 
> While using a usb-serial device as console, I've noticed some
> significant gaps in the kernel logs it receives.
> 
> The problem can be reproduced in qemu like this (the kernel is a
> x86_64_defconfig with usb-serial enabled and with the ftdi_sio driver
> enabled):
> qemu-system-x86_64 -m 4G -kernel arch/x86_64/boot/bzImage -usb -device
> usb-serial,chardev=ser -chardev pty,id=ser -append 'console=ttyUSB0'
> (this will create a `pts` device that will connect to the other end of
> the emulated usb-serial)
> 
> Then the logs look something like this:
> [    1.006459] SELinux:  Initializing.
> [    1.011620] Mount-cache hash table entries: 8192 (order: 4, 65536
> bytes, li[    2.315341] ACPI: \_SB_.LNKD: Enabled at IRQ 11
> 
> This probably happens because of the code in
> `usb_serial_generic_write` which tries to insert the data into the
> fifo:
> count = kfifo_in_locked(&port->write_fifo, buf, count, &port->lock);
> Because added indications for when the result is less than expected
> and it showed significant losses.
> The return value is silently ignored in `usb_console_write`
> Also making the fifo bigger in `setup_port_bulk_out` helped (I made it
> 10 times bigger and there were no losses)
> 
> The reason so much data is written at a short time is because
> usb-serial is initialized rather late, and when it is registered as a
> console, all the logs until this point are written to it.
> 
> I'm not sure what the solution should be. Maybe we need to check
> whether the write in `console_emit_next_record` was successful and not
> increase the seq counter in this case.
> 
> Any suggestions?

Please realize that usb-serial console was the result of me loosing a
drunken bet.  It's amazing it works at all.  For "fake" devices like
this, that use the generic usb-serial code, yes, you will have overruns
and other problems, that's just part of how it works (i.e. not well.)

For something like qemu, please use a real console, like the serial port
(i.e. a fake serial port), not the fake usb-serial port.

So this is "working as designed" in that it wasn't designed at all and
again, it is a miracle any data is flowing there at all :)

sorry,

greg k-h


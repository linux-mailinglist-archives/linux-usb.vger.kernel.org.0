Return-Path: <linux-usb+bounces-4206-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C792D8148AC
	for <lists+linux-usb@lfdr.de>; Fri, 15 Dec 2023 14:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3566AB22A97
	for <lists+linux-usb@lfdr.de>; Fri, 15 Dec 2023 13:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389122D043;
	Fri, 15 Dec 2023 13:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s5X/K38s"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAE42CCBB
	for <linux-usb@vger.kernel.org>; Fri, 15 Dec 2023 13:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A5ABC433C8;
	Fri, 15 Dec 2023 13:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702645355;
	bh=7AUgy8KMCt6MEINuFAEOgI4QH89ItYvtNqrWwo4O9rQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s5X/K38sbDc3olCG07Sy40SukiCfpfnsYD13rCaLdRDNJyd7Lg8k7EGlNKNvK0xxx
	 fnXRsBWZ8v7EU1SIK3gLcUhVPdYlLTOrcAcS3YzA9pg5Z5kV9p6gTGKxnCDfurpC6d
	 /gXYeAoW2Nbrzd63BrMb32UB6cxPj3GjE78kpqgWZKQ41Jao/7EbeqxuLqkyjKK/uF
	 gzk/j5YfR65fdAztfwF0k7PDAyQ2Q4m+ehej/2WEqohQS9zJUjVDSXcSH3wb2+h8HY
	 nUkHez6erbQ+oDiYsxnM9MAMHTfcxes3zmvpSLYYGLCl4eZhF0A9rBG1lWODFVupy5
	 KTP56vI25Pp6Q==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rE7pn-0008E2-0L;
	Fri, 15 Dec 2023 14:02:31 +0100
Date: Fri, 15 Dec 2023 14:02:31 +0100
From: Johan Hovold <johan@kernel.org>
To: Brian Kloppenborg <bkloppenborg@gmail.com>
Cc: linux-usb@vger.kernel.org, Brian Kloppenborg <brian@kloppenborg.net>
Subject: Re: [PATCH 0/2] Enable modem line status events on cp210x, add
 support for PPS on RI pin
Message-ID: <ZXxOZ4xTKeA7_X3b@hovoldconsulting.com>
References: <20231009023425.366783-1-brian@kloppenborg.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009023425.366783-1-brian@kloppenborg.net>

Hi Brian,

and sorry about the late reply. I was also waiting to see if you'd
address the issues pointed out by Greg.

On Sun, Oct 08, 2023 at 08:34:23PM -0600, Brian Kloppenborg wrote:

> This is my first patch to the Linux kernel.

There are some form issues as Greg's bot mentioned, like there being no
commit message, missing Subject prefix, missing Signed-off by, and
some coding style issues (space after if keyword, brackets around single
line statements, etc).

Make sure you have read

	Documentation/process/submitting-patches.rst

and you should run scripts/checkpatch.pl on your patches before posting
as it would find some of these issues.

Just looking at the git log for this driver may also give you an idea of
the expected patch format.

> Patch 1 enables support for modem line status changes to the cp210x
> driver. This is required to receive pulse-per-second (PPS) signals
> from GPS receivers. Support for this feature exists in the FTDI
> driver, but is not present in cp210x. The patch is implemented through
> (1) enabling the device's event mode by default when the port is
> opened or closed, and (2) registering the CTS, DSR, RI, and DCD
> changes with the kernel through conventional means.

So there are a few issues with this.

First, as I mentioned in the commit message when adding support for the
event mode, on at least some of the cp210x devices modem events appeared
to be buffered until the next character was received:

	https://lore.kernel.org/r/all/20200713105517.27796-3-johan@kernel.org/

Second, the event mode comes at a cost since all received characters
needs to be processed one-by-one instead of simply being copied to the
tty buffers.

For those reasons, I left modem-event support unimplemented and only
enabled event-mode when the user specifically requested input-parity
checking.

Perhaps some of these issues only affect some device types, and perhaps
we can allow users to avoid the processing cost by only enabling event
mode when, for example, CLOCAL is not set.

Hmm, scratch that last bit, usb_serial_handle_dcd_change() would hang up
the port when the CD is deasserted with !CLOCAL.

> Patch 2 enables support for GPS PPS signals on the RI pin. While most
> GPS devices typically expose this signal on the DCD pin, the Adafruit
> Ultimate GPS with USB-C placed it on the RI pin instead. So this patch
> is highly focused on that specific device. From what I can tell, the
> usb_serial_handle_dcd_change function is used exclusively to register
> PPS signals with the kernel, so calling it from the RI block shouldn't
> result in unexpected behavior.

So I'm afraid this is not going to work. First of all, serial drivers
need to work with all types of devices and can't have hacks for quirky
connected hardware like this.

Second, the usb_serial_handle_dcd_change() also handles waiting for a
modem connection on open and hangups using the carrier-detect line,
which would break if called on RI instead of CD events.

You also generally should not be using a slow USB device for things like
PPS as I imagine latency and jitter would make it practically useless.

Johan


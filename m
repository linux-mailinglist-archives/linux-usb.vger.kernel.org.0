Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9BD42EF07B
	for <lists+linux-usb@lfdr.de>; Fri,  8 Jan 2021 11:14:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbhAHKOY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Jan 2021 05:14:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:58282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725984AbhAHKOY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 8 Jan 2021 05:14:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 83394235FF;
        Fri,  8 Jan 2021 10:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610100819;
        bh=Wm1MlJjEAlj8i72EdXXjjwuEZPS6n2ivN2s4CfoqcNE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bxAz5rt3lJRAz33Uj3cZSnHMO19m4Z0SGDRNcpoZccgP+GNcI1SX3y4qi1792zPKK
         DGzne5yKPOycRbKNrLfb34oRav6ADqbw8lCL/KedRAxj3vo1VcRwVE03ssunQJ1vDR
         1F+i9yJTDQW9GYjkGk8Z14MA7bMhLoRoh4rgusQnBFxo/h4L1MrpwpIquCbxnTSoQc
         j6Z+hMiyAFXHN0zWUFH+B8kQZYxuRBFTWsghNkIqJ9dOkr1LIMZlT3yT5jHcRAdpyM
         giwP/3Phs4bwUCLe8Tj7lmHHfKAbBNH2tYSO3wSFgqym/uo9K3Zjvp1on1U6sRee9R
         FjxTiwnu+GTuQ==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kxom6-0003Xp-Cv; Fri, 08 Jan 2021 11:13:43 +0100
Date:   Fri, 8 Jan 2021 11:13:42 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Joe Abbott <jabbott@rollanet.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: pl2303.c 110 baud not working
Message-ID: <X/gwVvn09NFiIOWw@hovoldconsulting.com>
References: <CADuz4ONmN299aw460r4wXCEK5F1v9kt_cewCCrdg2hb5nJV9uQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADuz4ONmN299aw460r4wXCEK5F1v9kt_cewCCrdg2hb5nJV9uQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 07, 2021 at 03:06:07PM -0600, Joe Abbott wrote:
> Got redirected here by GKH email-bot.
> 
> My message to him was:
> I have an ASR33 teletype that I'm trying to communicate with using a
> PL2303 based Benfei USB serial adapter.  The ASR requires 110 baud 7E1
> and it appears that the driver is defaulting to 9600 baud. (possibly
> because the baud_sup array doesn't contain 110?)  I've tried adding
> 110 to the array and recompiling but that doesn't seem to help. I did
> have to comment out the '/ SPDX-License-Identifier: GPL-2.0' line in
> pl2303.c to get it to compile.

No, you don't need to add 110 to the baud_sup array as 110 baud is set
using divisors (i.e. pl2303_encode_baud_rate_divisor()).

> The windows driver works so the hardware is capable.
> 
> I must be missing something.  Any help appreciated.
> 
> Running Mint 19.3 64-bit.
> 
> I'm using stty to set baud rate like this:
> stty 110 cs7 evenp -F /dev/ttyUSB0
> stty reports that 110 is in use when I:
> stty -F /dev/ttyUSB0
> 
> Oscope shows 150 and above changing (didn't try 75) but 110 reverts to
> 9600 (mentioned in pl2303.c file).

I just verified using a logic analyser that 110 baud works just fine
here (with even parity too) using a PL2303 HXD.

Not sure what kernel version you're on, but this should have been
supported since at least around 2015 (and I think we backported the
corresponding fix of the divisor algorithm to earlier kernels).

Try a recent mainline kernel or enable dynamic debugging and make sure
the line request is sent correctly (110 cs7 parenb):

	pl2303_set_line_request - d5 0e 00 80 00 02 07

If there's some difference in how your device encodes baud rates you may
be able to compare that with what the Windows driver uses by tracing the
USB packets.

Johan

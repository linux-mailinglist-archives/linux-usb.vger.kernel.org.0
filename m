Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A39B22F06FE
	for <lists+linux-usb@lfdr.de>; Sun, 10 Jan 2021 13:05:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbhAJMEy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 10 Jan 2021 07:04:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:50966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726069AbhAJMEx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 10 Jan 2021 07:04:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB5982376E;
        Sun, 10 Jan 2021 12:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610280252;
        bh=BH09Z18/iuEnfef78NF+lc4mjUfTJ8I0SPRUHw8C3qc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ktg2qykg/tqzSS2Xxm+EM+9KnyFj6OS3F+tqy0igHJnYeqhd9czoBfIHNB63aYx0w
         JOnJerCRjk+Y84R2hPHTWZ6UxulwABIMbPf78ViEJn6MACUo16/32FP5UYZKvIQse+
         ZIr+0KedXPICGWthUmquzULE1+nk/ujWpyB8iLgOooWWYuRO3fihlelDLNuJkUB7lO
         AyI7wGpoPMHs4CQC8kiqeZ4Xe+Lk7xvrnC9nFjRe1Ys+WPlHQWr5PUGpsGY5UflP07
         nrDuX/NCneHNZG4j6eUig/99xRAyMeaBfeXa6o3YiHDiB/Gy0eETcB6c90GFpKV4Lx
         E/RMeRiBmnZ2Q==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kyZSA-0008RA-Ln; Sun, 10 Jan 2021 13:04:15 +0100
Date:   Sun, 10 Jan 2021 13:04:14 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Joe Abbott <jabbott@rollanet.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: pl2303.c 110 baud not working
Message-ID: <X/rtPpHMii7AxXPJ@hovoldconsulting.com>
References: <CADuz4ONmN299aw460r4wXCEK5F1v9kt_cewCCrdg2hb5nJV9uQ@mail.gmail.com>
 <X/gwVvn09NFiIOWw@hovoldconsulting.com>
 <CADuz4ONNPq+mADWYPKp8+M2rZtuoMwjO=+HDXfgrO2dQ0S1vQA@mail.gmail.com>
 <X/htEGiNbjGb2dy8@hovoldconsulting.com>
 <CADuz4OPCnq_4Xx-sWc-ZijoQRAZR-4+MRvpOx4np2rXifoCL5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADuz4OPCnq_4Xx-sWc-ZijoQRAZR-4+MRvpOx4np2rXifoCL5A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jan 09, 2021 at 08:26:26AM -0600, Joe Abbott wrote:
> Hi Johan,
> 
> > Please keep the USB list on CC.
> I'm sorry, I don't know what you mean.

You're only replying to me instead of replying to "all" so that the USB
mailing list is CCed. We don't do kernel development in private so
please make sure that your mails do not drop the list from CC.

I've added linux-usb@vger.kernel.org back on CC in my replies.

> Here's dmesg after debug turned on and 'stty 110 cs7 parenb evenp -F
> /dev/ttyUSB0':
> [  315.112142] pl2303 ttyUSB0: pl2303_set_control_lines - 03
> [  315.115032] pl2303 ttyUSB0: pl2303_get_line_request - 80 25 00 00 00 00 08
> [  315.115038] pl2303 ttyUSB0: data bits = 7
> [  315.115041] pl2303 ttyUSB0: baud requested = 110
> [  315.115045] pl2303 ttyUSB0: baud set = 110
> [  315.115048] pl2303 ttyUSB0: stop bits = 1
> [  315.115051] pl2303 ttyUSB0: parity = even
> [  315.116032] pl2303 ttyUSB0: pl2303_set_line_request - d5 0e 00 80 00 02 07

So as expected, your 5.0 Mint kernel behaves just like mainline:

	pl2303_set_line_request - d5 0e 00 80 00 02 07

> [  315.116037] pl2303 6-1:1.0: pl2303_vendor_write - [0000] = 00
> 
> I have some windows wireshark usb captures for 110 and 9600 taken
> while using putty.
> I don't know how to interpret them.  What is the best way to send them to you?

Look for the set-line-request control request:

	bmRequestType	0x21
	bRequest 	0x20	(SET_LINE_REQUEST)
	wValue		0
	wIndex		0
	wLength		7

the data stage should contain the corresponding 7 bytes of request data
for 110/cs7/parenb:

	d5 0e 00 80 00 02 07

where the first four bytes encodes the baud rate (either directly or as
for 110 baud using divisors, see the code for details).

I'm afraid I don't have time to be reverse-engineering this myself, but
if you manage to find a difference in how the Windows driver configures
your device we may be able to figure out how to get 110 baud working.

Johan

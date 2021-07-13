Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B6CB3C6AA8
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jul 2021 08:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233576AbhGMGk0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jul 2021 02:40:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:52544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233310AbhGMGkZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 13 Jul 2021 02:40:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 12FC461042;
        Tue, 13 Jul 2021 06:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1626158255;
        bh=2rZ7yQkX7fzWCstNTNo7MTkC1F2Ehck0m3IdzqyZSQg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tx0JDfJGzzvIo96iawMGA2HQpHjOUQpBoqm+jGfMUPuiaAWE3Th1bTlb1/M7LERoQ
         LDqqMFSo30O7xPAOLgIeytfZ7ctzauZWpnVIwAwAxWfp63DxH3iCpvTl1iKkBT9bAz
         8xdll1FO9N3U92jouhJYrzq8yhgcmg+PMT0KxL+U=
Date:   Tue, 13 Jul 2021 08:37:32 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Paul Wise <pabs3@bonedaddy.net>
Cc:     Krzysztof Opasiak <k.opasiak@samsung.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Karol Lewandowski <k.lewandowsk@samsung.com>,
        Matt Porter <mporter@kernel.crashing.org>,
        linux-usb@vger.kernel.org
Subject: Re: proposal: move Linux userspace USB gadget projects to linux-usb
 GitHub organisation?
Message-ID: <YO00rA8sTT2mrdOv@kroah.com>
References: <c38162833d1c8fede734e41eb5ce23cf393d6555.camel@bonedaddy.net>
 <ac8342bbedc5aa0f5754cb6830e6d5628cc022f1.camel@bonedaddy.net>
 <YO0cL+4gzLSyTY7f@kroah.com>
 <6be6edd3a30888ef7181735a1bbdac579578fd99.camel@bonedaddy.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6be6edd3a30888ef7181735a1bbdac579578fd99.camel@bonedaddy.net>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 13, 2021 at 01:40:27PM +0800, Paul Wise wrote:
> On Tue, 2021-07-13 at 06:53 +0200, Greg KH wrote:
> 
> > What do you mean "archive libusbg"?
> > 
> 
> GitHub repositories can be made read-only to indicate that they are no
> longer being developed, this is known as "archiving".
> 
> https://github.blog/2017-11-08-archiving-repositories/

Ah, hopefully people actually realize this :)

> > What type of funding and for what specific development?
> > What is lacking in the current projects here that needs to be
> > resolved? And who have you asked for funding from so far?
> 
> 
> The work needed is varied; the bugs/patches backlog, possibly porting
> to newer library APIs, cleaning up build complaints, cleaning up static
> and dynamic analysis complaints, integration with system software,
> integration with mobile user interfaces, integration into distros,
> automated testing with dummy_hcd, testing on devices, improving
> documentation, promoting the tools, encouraging gadget authors to use
> the tools, engaging with the user community, potentially additional UDC
> drivers if any are missing, ongoing maintenance and anything else that
> comes up during the course of that work.
> 
> I've mentioned the need for investment in the Linux userspace USB
> gadget projects offlist to yourself, the other folks in CC, Bootlin and
> a few other folks around the Linux ARM/mobile space.

I find it suprising that if these projects are really being used, and
there are problems, that none of the companies using them are
contributing back to the projects for these issues.

The technical things should be easy for those companies to help with,
the "advocacy" is a different thing, and that you should be able to do
today by submitting talks to conferences to get the word out.  Almost
all conferences have travel stipends for speakers that are not sponsored
by companies to travel.

good luck!

greg k-h

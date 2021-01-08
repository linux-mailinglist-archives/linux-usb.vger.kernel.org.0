Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 181912EF3F9
	for <lists+linux-usb@lfdr.de>; Fri,  8 Jan 2021 15:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbhAHOdY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Jan 2021 09:33:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:46634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726477AbhAHOdY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 8 Jan 2021 09:33:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 357C2235FC;
        Fri,  8 Jan 2021 14:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610116364;
        bh=RKR4DSjuNUekK0DXe3OOOzOLo6OYJhfz9eayq+3iS94=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WHWSG1An/Rn9aUJf1VNyEEe+Qs+n+U5nvcuygpBTCs2DsNrhWDF6QauPyQhRv1U4n
         11c10aGLc6V1pP3FIbx88lkrIat+KF4gjSfEocc9SjjBOIJPIyq0QHsWPosCoz7aN+
         bkFpA3xz0PUY9AaeXfyEnvTup236BoRKOb9dfOSBgyYgO4D+tP1UOIWHrER8EzG5+p
         oZR+kUUTfMAoYIDff/LllOyqYb1dXjpjEUAsmG9VBoovPk3l0HtfdeYRDL5SngICy/
         aan38G5mymmPA8mFq4zqJA3fbQi5sbKboW1b/Nq7oa4mHhhAImLOhehPsvOtaHHi2u
         OSWYYbCzJ6c9g==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kxsoq-0007ht-HJ; Fri, 08 Jan 2021 15:32:48 +0100
Date:   Fri, 8 Jan 2021 15:32:48 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Joe Abbott <jabbott@rollanet.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: pl2303.c 110 baud not working
Message-ID: <X/htEGiNbjGb2dy8@hovoldconsulting.com>
References: <CADuz4ONmN299aw460r4wXCEK5F1v9kt_cewCCrdg2hb5nJV9uQ@mail.gmail.com>
 <X/gwVvn09NFiIOWw@hovoldconsulting.com>
 <CADuz4ONNPq+mADWYPKp8+M2rZtuoMwjO=+HDXfgrO2dQ0S1vQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADuz4ONNPq+mADWYPKp8+M2rZtuoMwjO=+HDXfgrO2dQ0S1vQA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Please keep the USB list on CC.

On Fri, Jan 08, 2021 at 08:02:36AM -0600, Joe Abbott wrote:
> Thanks for the reply.
> 
> kernel version is 5.0.0-32-generic.  I've restored pl2303.ko to original.

5.0 should work as well.

> Chip version is PL2303TA.

And I believe that one is supposed to be compatible with HXD.

> When I loopback rs232 to pc at 150 baud it looks normal.  After
> setting to 110 baud it returns at a much higher rate and scope trace looks
> the same as when set to 9600 baud.
>
> Setting up debug might be beyond my abilities unless I could find a good
> how-to that I could follow.

You can either use debugfs:

	echo module pl2303 +p > /sys/kernel/debug/dynamic_debug/control

or provide an argument to modprobe:

	modprobe pl2303 dyndbg==p

Then just check demsg after calling stty (110 evenp).

> I'll look into capturing some windows packets at 110 and 9600.

Sounds good.

Johan

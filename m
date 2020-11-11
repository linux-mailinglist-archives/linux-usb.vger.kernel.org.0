Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 364A32AF579
	for <lists+linux-usb@lfdr.de>; Wed, 11 Nov 2020 16:51:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727166AbgKKPvb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Nov 2020 10:51:31 -0500
Received: from netrider.rowland.org ([192.131.102.5]:34619 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726274AbgKKPvb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Nov 2020 10:51:31 -0500
Received: (qmail 238344 invoked by uid 1000); 11 Nov 2020 10:51:30 -0500
Date:   Wed, 11 Nov 2020 10:51:30 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Alberto Sentieri <22t@tripolho.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: kernel locks due to USB I/O
Message-ID: <20201111155130.GB237113@rowland.harvard.edu>
References: <9428ae70-887e-b48b-f31c-f95d58f67c61@tripolho.com>
 <20201110205114.GB204624@rowland.harvard.edu>
 <8152190e-c962-e376-64fd-cc2ebf3e6104@tripolho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8152190e-c962-e376-64fd-cc2ebf3e6104@tripolho.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 10, 2020 at 06:42:17PM -0500, Alberto Sentieri wrote:
> 1) The current Ubuntu Kernel is 5.4.0-53. Do you want me to upgrade it to
> 5.9, from kernel.org? Or is there a Ubuntu 5.9 package that I can use? It
> would be easy to do it If there is a Ubuntu package with 5.9, which I would
> install and, after the tests, uninstall.

If you want to know what Ubuntu packages are available, you should ask 
on an Ubuntu mailing list instead of the linux-usb mailing list.

> 2) Why do you believe that 5.9 would solve the problem? I am asking that
> because I cannot change the production machine for a test if I cannot go
> back to the original state. There is always a risk involved.

We do not believe that 5.9 will solve the problem -- we have no reason 
to believe this -- but we could be wrong.  In any case it is always 
best to test with the most up-to-date software available, and 5.9 is the 
version closest to what we are working on now.

> 3) It is one single thread dealing with all 36 devices. Each device has its
> own co-routine (not preemptive), but all co-routines are executed by a
> unique thread.

If everything runs within a single thread, how can adding a semaphore 
or mutex make any difference?

> 4) By network console, do you mean ssh? It dies as well when it locks. The
> screen is the regular GNOME3 screen and nothing can be seen there. Every
> time it locks they send a picture, and I cannot see anything meaningful
> there. I am thinking about disabling GNOME3, but I need their blessing for
> that.

See https://www.kernel.org/doc/Documentation/networking/netconsole.txt
for instructions on netconsole.  And when you use it for testing, be 
sure to set the console log level to a high value.

Alan Stern

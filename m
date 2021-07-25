Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49A823D4EB1
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jul 2021 18:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbhGYPfS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Jul 2021 11:35:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:34782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229545AbhGYPfS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 25 Jul 2021 11:35:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C25960F37;
        Sun, 25 Jul 2021 16:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627229747;
        bh=8kn9itcYpgZkRRVoBfD9tNV+dM9O1eL5DF5fXloIUi4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MCULIpz4S23iDuURNeAyf4vUY8ImdAWczEIbtEAcPF1GMKMN4gP/ujS7/f5DhQo4F
         TuTDwwxYYo5Zd24bckcWkO3jgJ1a5imu5JudWOyYTmjWeTgSt5vssKhCZqtqA6CNm3
         rF2c5S64s8U0paoPKzTntv2qy9uDFqHk3tUYyEOo=
Date:   Sun, 25 Jul 2021 18:15:45 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [GIT PULL] USB fixes for 5.14-rc3
Message-ID: <YP2OMa89rnd8hhft@kroah.com>
References: <YPrX98Lqa1xH8uH7@kroah.com>
 <970d93d8-38ec-0ff8-6178-825a0698b2ea@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <970d93d8-38ec-0ff8-6178-825a0698b2ea@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jul 25, 2021 at 04:05:11PM +0000, Minas Harutyunyan wrote:
> Hi  Greg,
> On 7/23/2021 6:53 PM, Greg KH wrote:
> > The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> > 
> >    Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> > 
> > are available in the Git repository at:
> > 
> >    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-5.14-rc3
> > 
> > for you to fetch changes up to 1d1b97d5e7636d72890a5bdd0b40e980e54b2d34:
> > 
> >    Merge tag 'usb-serial-5.14-rc3' of https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial__;!!A4F2R9G_pg!MJ8qYQZESfA6SADfkbKTOvLpPUIWj9rC0lSEDjqrLPEJjfiuWPCWgzU0Yi_Vb7wC7J3PJwdX$  into usb-linus (2021-07-22 20:51:14 +0200)
> > 
> > ----------------------------------------------------------------
> > USB fixes for 5.14-rc3
> > 
> > Here are some USB fixes for 5.14-rc3 to resolve a bunch of tiny problems
> > reported.  Included in here are:
> > 	- dtsi revert to resolve a problem which broke android systems
> > 	  that relied on the dts name to find the USB controller device.
> > 	  People are still working out the "real" solution for this, but
> > 	  for now the revert is needed.
> > 	- core USB fix for pipe calculation found by syzbot
> > 	- typec fixes
> > 	- gadget driver fixes
> > 	- new usb-serial device ids
> > 	- new USB quirks
> > 	- xhci fixes
> > 	- usb hub fixes for power management issues reported
> > 	- other tiny fixes
> > 
> > All have been in linux-next with no reported problems.
> > 
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > 
> 
> 
> > 
> > Marek Szyprowski (1):
> >        usb: dwc2: Skip clock gating on Samsung SoCs
> > 
> 
> I didn't ACK this patch. Me and Marek Szyprowski agreed to discuss 
> details of this patch after he will back from vacation after August 2.

Ok, so should I revert it now that it is in Linus's tree?  Did I miss
the discussion that said there were problems with it?  I see an ack for
the patch, what was wrong with that?

thanks,

greg k-h

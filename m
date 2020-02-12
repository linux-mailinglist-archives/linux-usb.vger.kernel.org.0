Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1690615B492
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 00:18:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729103AbgBLXSA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Feb 2020 18:18:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:57350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729054AbgBLXSA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Feb 2020 18:18:00 -0500
Received: from localhost (unknown [104.132.1.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C325E21569;
        Wed, 12 Feb 2020 23:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581549479;
        bh=Ukqm9Z3CYY3yIlkQqJDAOsFY0tdswri4NcosyaH5ekQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oLDT8bhdast180St4dKuXTz/P5R+C0/l5ePurTmZZaf7wWoIQD+HLRt1Ia/OpnCHs
         V7vPuo68Va+oGoFX5c7g252druFpIdwPUgXYCTvBlrnglMoy/jVbCBMechTBtHOk8d
         yW2W93a1+3ZxugAxhGGJGbaIeOzEviiR0bvNl7GM=
Date:   Wed, 12 Feb 2020 15:17:59 -0800
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH v3 0/6] Add Apple MFi fastcharge USB device driver
Message-ID: <20200212231759.GA2491995@kroah.com>
References: <20191016093933.693-1-hadess@hadess.net>
 <20200212190621.GA1970508@kroah.com>
 <9a3f2a266b53ab24b613a04b38e668338d43117e.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a3f2a266b53ab24b613a04b38e668338d43117e.camel@hadess.net>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 13, 2020 at 12:05:13AM +0100, Bastien Nocera wrote:
> On Wed, 2020-02-12 at 11:06 -0800, Greg Kroah-Hartman wrote:
> > On Wed, Oct 16, 2019 at 11:39:27AM +0200, Bastien Nocera wrote:
> > > This is version 3 of the patch set.
> > > 
> > > Changes in v3:
> > > - Add Alan's ack
> > > - don't export usb_device_match_id()
> > > 
> > > Changes in v2:
> > > - checkpatch.pl is now quiet
> > > - fallback to the generic driver when driver ->probe() fails
> > 
> > Sorry for the long response to this, my fault.
> > 
> > At first, I really don't like the idea of using the usb device driver
> > interface, but I don't think there's a better way.  And, you did the
> > work to make it so that it works cleanly, which is always
> > appreciated.
> 
> I'm hoping that a few user-space drivers end up upstream in the kernel
> for hardware that needs it.

And here I am wanting to move more USB drivers to userspace :)

What ones do you see that are currently in userspace that should be in
the kernel?  The power control one here makes sense, are there others
like this?

> I plan on making some more changes to the USB subsystem in the (near)
> future, so it's to get my feet wet with this.

That was a serious modification to "start" with, nice work.

greg k-h

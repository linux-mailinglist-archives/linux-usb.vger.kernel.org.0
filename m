Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D0023BA0E
	for <lists+linux-usb@lfdr.de>; Tue,  4 Aug 2020 13:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730391AbgHDL6A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Aug 2020 07:58:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:39268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730377AbgHDL5s (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 4 Aug 2020 07:57:48 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 58EC42086A;
        Tue,  4 Aug 2020 11:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596542212;
        bh=Spm5JSI+Bd0FBYtapWeQzYxYTOs4IxRXrw2IzJwxVJc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wyXPZZgFa5+HqVS3IVQz234H2sAk3JsRK2KlnBXBc6r/krMILu7wfABGRh2UACID4
         mxWkHj5hiyM3wVf38rRwaE/2qwoenaBU/l42TJleXewd59ENcSyQ3DmfmrrdAznryS
         Wu7DXeMNrc0OPPmMKdcdcOlxcxpgqDfFoyncc6JI=
Date:   Tue, 4 Aug 2020 13:56:33 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v6 3/3] USB: Fix device driver race
Message-ID: <20200804115633.GA203147@kroah.com>
References: <20200727104644.149873-1-hadess@hadess.net>
 <20200727104644.149873-3-hadess@hadess.net>
 <64c8caa8ee054ed9106683f15238b2be74f77aa2.camel@hadess.net>
 <20200803153804.GA1172014@kroah.com>
 <8f1de4cc2813f0a8721a2f76421956056c0c6278.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f1de4cc2813f0a8721a2f76421956056c0c6278.camel@hadess.net>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 04, 2020 at 01:41:25PM +0200, Bastien Nocera wrote:
> On Mon, 2020-08-03 at 17:38 +0200, Greg Kroah-Hartman wrote:
> > On Mon, Aug 03, 2020 at 05:04:46PM +0200, Bastien Nocera wrote:
> > > On Mon, 2020-07-27 at 12:46 +0200, Bastien Nocera wrote:
> > > > When a new device with a specialised device driver is plugged in,
> > > > the
> > > > new driver will be modprobe()'d but the driver core will attach
> > > > the
> > > > "generic" driver to the device.
> > > > 
> > > > After that, nothing will trigger a reprobe when the modprobe()'d
> > > > device
> > > > driver has finished initialising, as the device has the "generic"
> > > > driver attached to it.
> > > > 
> > > > Trigger a reprobe ourselves when new specialised drivers get
> > > > registered.
> > > > 
> > > > Fixes: 88b7381a939d ("USB: Select better matching USB drivers
> > > > when
> > > > available")
> > > > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > > 
> > > Greg, Alan, are you happy with this iteration?
> > > 
> > > If so, I can send it again with Alan's acks, along with a fix for
> > > the
> > > function name Alan mentioned. I see that the first patch in the
> > > list
> > > landed in usb-next already.
> > > 
> > 
> > Yes, please resend the remaining patches.  I don't recall seeing
> > Alan's
> > ack on it.
> 
> Resent as v7. There's a new patch in the lot, based on a comment by
> Alan in this thread which I thought appropriate to include.

Thanks, will look at them once 5.9-rc1 is out as I can't do anything
with my tree until then.

greg k-h

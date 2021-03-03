Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44C1B32B70E
	for <lists+linux-usb@lfdr.de>; Wed,  3 Mar 2021 12:02:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240540AbhCCKbv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Mar 2021 05:31:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:51644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1575975AbhCCHco (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Mar 2021 02:32:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3176364EE4;
        Wed,  3 Mar 2021 07:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1614756722;
        bh=JwuBlz/eJ28FzLdCxE/vHNKLwCXKoSTBBTBJf+8TJdg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fWSwcLkXg1WGBFAwRy6ydf5ZcUePVbYvCmJsjazJyDyhdcgMqMiW3ZBL/1x4DYnVj
         /vBgTNdbKSQfhhs6JDL5FLEvL9BdMKhWDtkhgt/F5LCHsxv15Y3NpnAz8onvFe59zH
         IQinCLnZdNf6Czo3LtC/KgjELQ9g734pdXx0ZE1E=
Date:   Wed, 3 Mar 2021 08:31:59 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "tiantao (H)" <tiantao6@huawei.com>
Cc:     Tian Tao <tiantao6@hisilicon.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: hcd: remove unused including <linux/version.h>
Message-ID: <YD87b/zYXgEFmmXl@kroah.com>
References: <1614733752-56541-1-git-send-email-tiantao6@hisilicon.com>
 <YD80gndsrjIRvy8H@kroah.com>
 <ff94889c-1d51-e6e3-65dc-739b7509e05c@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff94889c-1d51-e6e3-65dc-739b7509e05c@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 03, 2021 at 03:15:53PM +0800, tiantao (H) wrote:
> 
> 在 2021/3/3 15:02, Greg KH 写道:
> > On Wed, Mar 03, 2021 at 09:09:12AM +0800, Tian Tao wrote:
> > > Remove including <linux/version.h> that don't need it.
> > > 
> > > Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> > > ---
> > >   drivers/usb/core/hcd.c | 1 -
> > >   1 file changed, 1 deletion(-)
> > > 
> > > diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> > > index 3f03813..53bc93d 100644
> > > --- a/drivers/usb/core/hcd.c
> > > +++ b/drivers/usb/core/hcd.c
> > > @@ -11,7 +11,6 @@
> > >   #include <linux/bcd.h>
> > >   #include <linux/module.h>
> > > -#include <linux/version.h>
> > >   #include <linux/kernel.h>
> > >   #include <linux/sched/task_stack.h>
> > >   #include <linux/slab.h>
> > You obviously did not even test-build this patch, which is very odd when
> > submitting something to the community.  Why did you not do this?
> > 
> > This file _DOES_ need this .h file, whatever tool you are using to
> > detect this is completely broken.  Please fix it and be more careful
> > before sending new patches.
> this is reported by command “make versioncheck”

Then the tool is broken.  Why did you not test-build your change before
sending it?  Did you read the checklist of "what to do before sending a
patch" that we have in our documentation?  If not, please do so.

thanks,

greg k-h

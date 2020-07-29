Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE1523211B
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jul 2020 16:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgG2O5v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jul 2020 10:57:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:36802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726353AbgG2O5v (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 29 Jul 2020 10:57:51 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C6FEA20829;
        Wed, 29 Jul 2020 14:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596034671;
        bh=PetF+YxL9uyJxluGUGwLtyh7dr4mJSsSpbz6SvwkKtY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t4pcc1G8ggkv5bkZYS2j0kZxY4h9eKsaxlx8wSdyt8hQSx6FxQYNIykr4lrC0/vkE
         axbLful3b+kMIl7XHK5y512+mTydNyfoQh0ULYlCQxUhM35lGC85f0Xp78xNGagU03
         hbHLFzGeMZcI0nBfQE/3XIGEbYs2WnN67uCRlXOI=
Date:   Wed, 29 Jul 2020 16:57:41 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Christian.Gromm@microchip.com
Cc:     driverdev-devel@linuxdriverproject.org, linux-usb@vger.kernel.org
Subject: Re: [RESEND PATCH v5] drivers: most: add USB adapter driver
Message-ID: <20200729145741.GA3501473@kroah.com>
References: <1595838646-12674-1-git-send-email-christian.gromm@microchip.com>
 <20200729142715.GA3343116@kroah.com>
 <799deccc9cd874a2f36bbe93f9b880eea018197f.camel@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <799deccc9cd874a2f36bbe93f9b880eea018197f.camel@microchip.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 29, 2020 at 02:53:29PM +0000, Christian.Gromm@microchip.com wrote:
> On Wed, 2020-07-29 at 16:27 +0200, Greg KH wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you
> > know the content is safe
> > 
> > On Mon, Jul 27, 2020 at 10:30:46AM +0200, Christian Gromm wrote:
> > > This patch adds the usb driver source file most_usb.c and
> > > modifies the Makefile and Kconfig accordingly.
> > > 
> > > Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
> > 
> > Sorry for the long delay in getting to this.
> > 
> > This looks good to me, but I tried to apply it to my usb tree, and of
> > course I get the following build error:
> >         error: the following would cause module name conflict:
> >           drivers/staging/most/usb/most_usb.ko
> >           drivers/most/most_usb.ko
> > 
> > So, can you just send a "rename the file" patch that I can apply
> > against
> > my staging-next branch and I will take it through there so that there
> > are no conflicts like this?
> 
> Are you talking about (1) a patch that just renames the most_usb.ko
> file located at drivers/staging/most/usb/ or (2) a patch for the
> Makefile in the staging tree, so the Kbuild system creates a new
> kernel object in this branch with a different name?

(1) is easiest, do it all at once :)

thanks,

greg k-h

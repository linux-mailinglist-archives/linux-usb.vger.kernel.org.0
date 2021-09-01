Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16FDE3FE20A
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 20:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344645AbhIASMe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 14:12:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:50118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346858AbhIASM2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Sep 2021 14:12:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EFFAD610A8;
        Wed,  1 Sep 2021 18:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1630519891;
        bh=YWUU+D+DA+y7ujYSL3sggJYVOZW5DLa85nwv3HEbl1A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K9NYbULlvn7odFUm3nyzWVUjd1qW/1aU4pqfWLZ/2RBxNmyeYC2HWEmPtmH6rh4sr
         /YpQqDnj+RFxrFammOxg2mtb8+ZqbexfOL2AHBHKuEUqSgaFC+JZoawGXWOB+M3j8f
         2+GJMIMqGmJnakpQvh9J4Yd+TD5Rn4qyqfwa0x5o=
Date:   Wed, 1 Sep 2021 20:11:29 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial updates for 5.15-rc1
Message-ID: <YS/CUe6sSDprtdKn@kroah.com>
References: <YS4A7ZJYrhRXb+PN@hovoldconsulting.com>
 <YS+LqqKnyQzS/fCY@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YS+LqqKnyQzS/fCY@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 01, 2021 at 04:18:18PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Aug 31, 2021 at 12:14:05PM +0200, Johan Hovold wrote:
> > The following changes since commit ff1176468d368232b684f75e82563369208bc371:
> > 
> >   Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.15-rc1-2
> > 
> > for you to fetch changes up to a65ab973c1669d3edc27719527bb3906f7b09918:
> > 
> >   USB: serial: replace symbolic permissions by octal permissions (2021-08-26 09:38:27 +0200)
> > 
> > ----------------------------------------------------------------
> > USB-serial updates for 5.15-rc1
> > 
> > Here are the USB serial updates for 5.15-rc1, including:
> > 
> >  - a couple of fixes for cp210x termios error handling
> >  - retrieval of fw revisions for more cp210x types
> >  - a switch to octal permissions for all module-parameter definitions
> > 
> > Included are also various clean ups.
> > 
> > All have been in linux-next with no reported issues.
> > 
> 
> Ugh, this was late, I'll pull this in after Linus takes the request I
> just sent him...

Now pulled into my tree, thanks.

greg k-h

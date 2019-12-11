Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A960E11AD80
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 15:32:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729689AbfLKOc5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 09:32:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:37750 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729652AbfLKOc5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Dec 2019 09:32:57 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7FFEB20836;
        Wed, 11 Dec 2019 14:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576074777;
        bh=nNl0R2Aij4oF7CuTOPsnhqob2ZWGOkP1aN0tpu7nv3Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gs/5kcr84Jtodkt/v6NZSCGu0AXQ5GnMYIlSi2FWm1KWnHdXlVHlFErbGSgUSLLnY
         fs3BJ2IzEG/CH+D9lJlZPzSdusgWmXIcavkLdx9wauZ9NUkoPZh9wbpTaf+63XrqbH
         kaMehSdQKWb3cZ/oKmbg9rJc4VLFliNjOetU4Bdc=
Date:   Wed, 11 Dec 2019 15:32:54 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB fixes for v5.5-rc2
Message-ID: <20191211143254.GA624754@kroah.com>
References: <87h827x7mv.fsf@kernel.org>
 <87eexbx7l5.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eexbx7l5.fsf@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 11, 2019 at 04:25:26PM +0200, Felipe Balbi wrote:
> 
> (off course I forgot linux-usb, sorry)
> 
> Felipe Balbi <balbi@kernel.org> writes:
> 
> > Hi Greg,
> >
> > here's a list of 4 patches to be merged for the next -rc cycle.
> >
> > Sorry for the long delay, but since I changed jobs recently, I'm still
> > getting the hang of things. Moreover, my laptop failed couple of days
> > ago. :-s
> >
> > I'll try to avoid these long delays in the future by scheduling a
> > specific time every week to go over the linux-usb mailing list.

I didn't notice a delay at all, all is fine from my end here :)

> >
> > Cheers
> >
> > The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:
> >
> >   Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/fixes-for-v5.5-rc2

All now pulled and pushed out.

greg k-h

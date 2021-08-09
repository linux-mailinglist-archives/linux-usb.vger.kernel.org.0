Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 394CF3E3D5F
	for <lists+linux-usb@lfdr.de>; Mon,  9 Aug 2021 02:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhHIAmi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 8 Aug 2021 20:42:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:48038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229977AbhHIAmi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 8 Aug 2021 20:42:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1D3960ED6;
        Mon,  9 Aug 2021 00:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628469738;
        bh=q7I3mO1/OCobYI9TziAX5MrBdUvrhoHFEswsMsxBim4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=baHHykfqeRp/sj41HTaQGJhi0hC4mLLBYxC9HFW+SsXrz101YdDP0fD7kmLgPrgGo
         Rb/awEsTVVDRnOyaicAiCq8K2qrrs73eTsFH+rch3gewPkD03RoU0OOZHavMyrsWce
         CrGPteUrT3xXjjxQE4FEO9MKY3Tzip6duPRa9cJZntCXKQlkVeyJct6OiT3wEHux4Y
         g7/f9hhAUnyufHnwTfz/D7SxhPsTe9SxZ+YrvWN5uYCWIQ2j2Zsh0eUVjywKiJVHDl
         YKaJXeyLyUKQ8LUhZD/mcsyUUIIEOzDzf5FzawDGvZk3bSUvsZrs+xs0O5kXnXBpMO
         0rdApqN058HPg==
Date:   Mon, 9 Aug 2021 08:42:14 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Salah Triki <salah.triki@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: chipidea: get lock before calling
 usb_[disable|enable]_autosuspend()
Message-ID: <20210809004214.GA6693@nchen>
References: <20210802215212.GA1350820@pc>
 <20210804013809.GA16676@nchen>
 <YQu2Yys43Egstxmn@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQu2Yys43Egstxmn@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-08-05 11:58:59, Greg Kroah-Hartman wrote:
> On Wed, Aug 04, 2021 at 09:38:09AM +0800, Peter Chen wrote:
> > On 21-08-02 22:52:12, Salah Triki wrote:
> > > Based on the documentation of usb_[disable|enable]_autosuspend(), the
> > > caller must hold udev's device lock.
> > > 
> > > Signed-off-by: Salah Triki <salah.triki@gmail.com>
> > > ---
> > >  drivers/usb/chipidea/otg_fsm.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/usb/chipidea/otg_fsm.c b/drivers/usb/chipidea/otg_fsm.c
> > > index 6ed4b00dba96..2d4174250432 100644
> > > --- a/drivers/usb/chipidea/otg_fsm.c
> > > +++ b/drivers/usb/chipidea/otg_fsm.c
> > > @@ -518,12 +518,14 @@ static void ci_otg_loc_sof(struct otg_fsm *fsm, int on)
> > >  	if (!udev)
> > >  		return;
> > >  
> > > +	usb_lock_device(udev);
> > >  	if (on) {
> > >  		usb_disable_autosuspend(udev);
> > >  	} else {
> > >  		pm_runtime_set_autosuspend_delay(&udev->dev, 0);
> > >  		usb_enable_autosuspend(udev);
> > >  	}
> > > +	usb_unlock_device(udev);
> > >  }
> > >  
> > 
> > Acked-by: Peter Chen <peter.chen@kernel.org>
> 
> I think this is not ok, see the other threads...

Thanks for checking it, I read Alan's comments for the similar patches.
Yes, it doesn't need since all callers have already holds fsm->lock.

-- 

Thanks,
Peter Chen


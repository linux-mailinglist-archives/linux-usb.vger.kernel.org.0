Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0FA73E11BC
	for <lists+linux-usb@lfdr.de>; Thu,  5 Aug 2021 11:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239998AbhHEJ7R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Aug 2021 05:59:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:58792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239975AbhHEJ7P (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Aug 2021 05:59:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56F6461029;
        Thu,  5 Aug 2021 09:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1628157541;
        bh=mIwr1eFWPTkp245SNkVdapNZY/QB0VOmh/SYQdVdwwA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uWfDxwhUD43Y8IPdmoA6SEiAECFa7QkULcg4vBZMm4XIAZ1IG89IdfPdckFrJjqjM
         otVyN8cU17kIInxHjmHeq8svtCe2BomJAzd8RB+2s+KhiKdP5dKI0QD+FPiTXzdu4X
         NKxhD/htFEeCthv1WcigGQcy2XHmi1AujVfpszwg=
Date:   Thu, 5 Aug 2021 11:58:59 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     Salah Triki <salah.triki@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: chipidea: get lock before calling
 usb_[disable|enable]_autosuspend()
Message-ID: <YQu2Yys43Egstxmn@kroah.com>
References: <20210802215212.GA1350820@pc>
 <20210804013809.GA16676@nchen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210804013809.GA16676@nchen>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 04, 2021 at 09:38:09AM +0800, Peter Chen wrote:
> On 21-08-02 22:52:12, Salah Triki wrote:
> > Based on the documentation of usb_[disable|enable]_autosuspend(), the
> > caller must hold udev's device lock.
> > 
> > Signed-off-by: Salah Triki <salah.triki@gmail.com>
> > ---
> >  drivers/usb/chipidea/otg_fsm.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/usb/chipidea/otg_fsm.c b/drivers/usb/chipidea/otg_fsm.c
> > index 6ed4b00dba96..2d4174250432 100644
> > --- a/drivers/usb/chipidea/otg_fsm.c
> > +++ b/drivers/usb/chipidea/otg_fsm.c
> > @@ -518,12 +518,14 @@ static void ci_otg_loc_sof(struct otg_fsm *fsm, int on)
> >  	if (!udev)
> >  		return;
> >  
> > +	usb_lock_device(udev);
> >  	if (on) {
> >  		usb_disable_autosuspend(udev);
> >  	} else {
> >  		pm_runtime_set_autosuspend_delay(&udev->dev, 0);
> >  		usb_enable_autosuspend(udev);
> >  	}
> > +	usb_unlock_device(udev);
> >  }
> >  
> 
> Acked-by: Peter Chen <peter.chen@kernel.org>

I think this is not ok, see the other threads...

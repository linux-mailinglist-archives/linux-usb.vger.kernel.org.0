Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52474359AC
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 11:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbfFEJaT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 05:30:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:43264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726785AbfFEJaT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 Jun 2019 05:30:19 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4355C20717;
        Wed,  5 Jun 2019 09:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559727016;
        bh=3PiEcJIDQRHFNTo8PrPMa739MMytCh4DacLEwY6ZY/A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bFP/8HeRkJi6VIREnf8ifbJTveLTUp8Yu1n8gVC+LcI3BXxKoYG0LXdH5T+pTA5YJ
         juxl8ZCJgsdr4UkZ6twqHRkoaNRbu2OQtrM+chelbjeOyl1A5t/6uZtZaVqWz7f2hg
         t10qy7gf8JruCsDWrIlCRt+kLCv+5x+uXNd6u+xA=
Date:   Wed, 5 Jun 2019 11:30:14 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Marco Zatta <marco@zatta.me>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] Fix chipmunk-like voice when using Logitech C270 for
 recording audio.
Message-ID: <20190605093014.GB23758@kroah.com>
References: <20190601075257.GA24550@jimmy.localdomain>
 <1559555890.25071.5.camel@suse.com>
 <20190603175540.GA4368@jimmy.localdomain>
 <1559639677.21920.4.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559639677.21920.4.camel@suse.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 04, 2019 at 11:14:37AM +0200, Oliver Neukum wrote:
> Am Montag, den 03.06.2019, 19:55 +0200 schrieb Marco Zatta:
> > On Mon, Jun 03, 2019 at 11:58:10AM +0200, Oliver Neukum wrote:
> > > Are you sure only the C270 is affected?
> > > 
> > > 	Regards
> > > 		Oliver
> > 
> > Hello Oliver,
> > 
> > No, unfortunately I am not sure but I am missing the hardware to
> > properly test. I am quite sure that it fixes the problem in the C270
> > though :)
> 
> Well, after all that time neither do I have the test hardware.
> And I doubt that for some reason only the C270 should be affected.
> 
> > Thanks for that, since you were the author of the first commit.
> 
> I appreciate your patch, but I think teh safe option would be to do
> it for all models.

As we don't have anyone else complaining at the moment, let's just take
this patch as-for now.

thanks,

greg k-h

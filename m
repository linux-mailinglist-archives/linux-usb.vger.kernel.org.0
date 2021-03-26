Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 004E434A844
	for <lists+linux-usb@lfdr.de>; Fri, 26 Mar 2021 14:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbhCZNkU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Mar 2021 09:40:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:37168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230179AbhCZNj4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Mar 2021 09:39:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB39C61A0D;
        Fri, 26 Mar 2021 13:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616765996;
        bh=FXN5c3vmP5J9L/H3cKbBcDDzn0t8YWc74GGqTOz3rFw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2S7ERypc/J7ehttRAfkWvtpy3bpxCo/8TYi7fb9lzK3/PIcXlwyxVbcd87vguxI9q
         NkMG24pHGpVuPJvdEBzAEiGV2jgE9QcWvhlWwTmLuqDJZcd08QL5HZCDDQafl/oerg
         ZLuU5cm87JgDc0LgLw3IN8IKjtnA4Pudv33NCYps=
Date:   Fri, 26 Mar 2021 14:39:53 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: Create helper function getting MDWIDTH
Message-ID: <YF3kKePNnF6wRUbj@kroah.com>
References: <f6c3bf1ec9d6e36a36ed84534988014f2dd70035.1616636455.git.Thinh.Nguyen@synopsys.com>
 <b4e8500c-fe6f-226a-8822-c26072e4d710@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4e8500c-fe6f-226a-8822-c26072e4d710@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 25, 2021 at 02:00:14AM +0000, Thinh Nguyen wrote:
> Thinh Nguyen wrote:
> > Different controller IPs check different HW parameters for MDWIDTH.
> > To help with maintainability, create a helper function to consolidate
> > the logic in a single place.
> > 
> > Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> > ---
> >  drivers/usb/dwc3/core.h    | 19 +++++++++++++++++--
> >  drivers/usb/dwc3/debugfs.c | 12 ++++--------
> >  drivers/usb/dwc3/gadget.c  | 16 +++++-----------
> >  3 files changed, 26 insertions(+), 21 deletions(-)
> > 
> 
> Sorry for the noise and please ignore the duplicate patch...

So was this the duplicate?  I'm lost, so am dropping this one...

thanks,

greg k-h

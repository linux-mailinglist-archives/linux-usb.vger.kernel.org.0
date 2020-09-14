Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9553E268FAC
	for <lists+linux-usb@lfdr.de>; Mon, 14 Sep 2020 17:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbgINPXt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Sep 2020 11:23:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:38582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726058AbgINPXL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 14 Sep 2020 11:23:11 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2BE5B20639;
        Mon, 14 Sep 2020 15:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600096990;
        bh=EBqqQRsDxhvM1nw92/w69eMe9mZazFwm//Ofb5xCjvc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NhxFEZ5hFRzKcHM5UdRESvNf5RWMR93f2OaogAsqv4akh7DGDkhvKhkLXVh3XCM0k
         bsyO24n6WDGAe+S0tayv+05GZAfma4r1iry3NA2mq4riIC66xgJYRRiAOYGhZ3L7Wk
         KZNptsHILBCJ9AFv6G0mXT/Pfdx9wAbjVpWcRzH4=
Date:   Mon, 14 Sep 2020 17:23:09 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     himadrispandya@gmail.com, dvyukov@google.com,
        linux-usb@vger.kernel.org, perex@perex.cz, tiwai@suse.com,
        stern@rowland.harvard.ed, linux-kernel@vger.kernel.org,
        marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-bluetooth@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 04/11] USB: core: hub.c: use usb_control_msg_send() in
 a few places
Message-ID: <20200914152309.GA3394411@kroah.com>
References: <20200907145108.3766613-1-gregkh@linuxfoundation.org>
 <20200907145108.3766613-5-gregkh@linuxfoundation.org>
 <20200907150858.GD762136@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907150858.GD762136@rowland.harvard.edu>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 07, 2020 at 11:08:58AM -0400, Alan Stern wrote:
> On Mon, Sep 07, 2020 at 04:51:01PM +0200, Greg Kroah-Hartman wrote:
> > There are a few calls to usb_control_msg() that can be converted to use
> > usb_control_msg_send() instead, so do that in order to make the error
> > checking a bit simpler and the code smaller.
> > 
> > Cc: Alan Stern <stern@rowland.harvard.edu>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> > v2:
> >  - dropped changes to usb_req_set_sel() thanks to review from Alan
> 
> > @@ -4056,7 +4035,7 @@ static void usb_enable_link_state(struct usb_hcd *hcd, struct usb_device *udev,
> >  	 * associated with the link state we're about to enable.
> >  	 */
> >  	ret = usb_req_set_sel(udev, state);
> > -	if (ret < 0) {
> > +	if (ret) {
> >  		dev_warn(&udev->dev, "Set SEL for device-initiated %s failed.\n",
> >  				usb3_lpm_names[state]);
> >  		return;
> 
> Did this change survive by mistake?
> 
> Actually, it looks like usb_req_set_sel needs to check the value 
> returned by usb_control_msg -- a perfect example of the sort of thing 
> you were trying to fix in the first place!

Ugh, good catch, and yes, the original code is buggy :)

thanks,

greg k-h

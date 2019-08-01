Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4BF07DFBA
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2019 18:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730202AbfHAQHM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Aug 2019 12:07:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:57202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727403AbfHAQHM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 1 Aug 2019 12:07:12 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9CFE4206B8;
        Thu,  1 Aug 2019 16:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564675632;
        bh=FyO14N9hdL7T+o4znc5y53gBxbiS53HRgMTnU1igtD4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=blbeNTn76GmBpQwumjGFE3Yzx6ZuMei3ImHsLEYOReE9oWpKcKYqNd/mcIOs/M+C9
         wVAVEjP0PD1PFRY3gBzhJ6SJYBb8BsVKglxT9OEb6Pjd9TIQfwWE2pz7iZ9ElVULdO
         ELZIiODuhD9Md5Qqlg4kDd154gUgu2cyBSRAplWg=
Date:   Thu, 1 Aug 2019 18:07:09 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Douglas Gilbert <dgilbert@interlog.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] usb: typec: tcpm: Ignore unsupported/unknown
 alternate mode requests
Message-ID: <20190801160709.GA20933@kroah.com>
References: <1564029037-22929-1-git-send-email-linux@roeck-us.net>
 <20190729140457.GC28600@kuha.fi.intel.com>
 <20190729173104.GA32556@roeck-us.net>
 <20190730120747.GL28600@kuha.fi.intel.com>
 <a14d8a51-85f6-65d8-2e1e-19538a7bf3d3@roeck-us.net>
 <20190731095555.GN28600@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190731095555.GN28600@kuha.fi.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 31, 2019 at 12:55:55PM +0300, Heikki Krogerus wrote:
> On Tue, Jul 30, 2019 at 06:28:52AM -0700, Guenter Roeck wrote:
> > On 7/30/19 5:07 AM, Heikki Krogerus wrote:
> > > On Mon, Jul 29, 2019 at 10:31:04AM -0700, Guenter Roeck wrote:
> > > > On Mon, Jul 29, 2019 at 05:04:57PM +0300, Heikki Krogerus wrote:
> > > > > Hi,
> > > > > 
> > > > > On Wed, Jul 24, 2019 at 09:30:37PM -0700, Guenter Roeck wrote:
> > > > > > TCPM may receive PD messages associated with unknown or unsupported
> > > > > > alternate modes. If that happens, calls to typec_match_altmode()
> > > > > > will return NULL. The tcpm code does not currently take this into
> > > > > > account. This results in crashes.
> > > > > > 
> > > > > > Unable to handle kernel NULL pointer dereference at virtual address 000001f0
> > > > > > pgd = 41dad9a1
> > > > > > [000001f0] *pgd=00000000
> > > > > > Internal error: Oops: 5 [#1] THUMB2
> > > > > > Modules linked in: tcpci tcpm
> > > > > > CPU: 0 PID: 2338 Comm: kworker/u2:0 Not tainted 5.1.18-sama5-armv7-r2 #6
> > > > > > Hardware name: Atmel SAMA5
> > > > > > Workqueue: 2-0050 tcpm_pd_rx_handler [tcpm]
> > > > > > PC is at typec_altmode_attention+0x0/0x14
> > > > > > LR is at tcpm_pd_rx_handler+0xa3b/0xda0 [tcpm]
> > > > > > ...
> > > > > > [<c03fbee8>] (typec_altmode_attention) from [<bf8030fb>]
> > > > > > 				(tcpm_pd_rx_handler+0xa3b/0xda0 [tcpm])
> > > > > > [<bf8030fb>] (tcpm_pd_rx_handler [tcpm]) from [<c012082b>]
> > > > > > 				(process_one_work+0x123/0x2a8)
> > > > > > [<c012082b>] (process_one_work) from [<c0120a6d>]
> > > > > > 				(worker_thread+0xbd/0x3b0)
> > > > > > [<c0120a6d>] (worker_thread) from [<c012431f>] (kthread+0xcf/0xf4)
> > > > > > [<c012431f>] (kthread) from [<c01010f9>] (ret_from_fork+0x11/0x38)
> > > > > > 
> > > > > > Ignore PD messages if the asociated alternate mode is not supported.
> > > > > > 
> > > > > > Reported-by: Douglas Gilbert <dgilbert@interlog.com>
> > > > > > Cc: Douglas Gilbert <dgilbert@interlog.com>
> > > > > > Fixes: e9576fe8e605c ("usb: typec: tcpm: Support for Alternate Modes")
> > > > > > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > > > > > ---
> > > > > > Taking a stab at the problem. I don't really know if this is the correct
> > > > > > fix, or even if my understanding of the problem is correct, thus marking
> > > > > > the patch as RFC.
> > > > > 
> > > > > My guess is that typec_match_altmode() is the real culprit. We can't
> > > > > rely on the partner mode index number when identifying the port alt
> > > > > mode.
> > > > > 
> > > > > Douglas, can you test the attached hack instead of this patch?
> > > > > 
> > > > > 
> > > > > thanks,
> > > > > 
> > > > > -- 
> > > > > heikki
> > > > 
> > > > > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > > > > index ec525811a9eb..033dc097ba83 100644
> > > > > --- a/drivers/usb/typec/tcpm/tcpm.c
> > > > > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > > > > @@ -1067,12 +1067,11 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const __le32 *payload, int cnt,
> > > > >   	modep = &port->mode_data;
> > > > > -	adev = typec_match_altmode(port->port_altmode, ALTMODE_DISCOVERY_MAX,
> > > > > -				   PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
> > > > > -
> > > > >   	pdev = typec_match_altmode(port->partner_altmode, ALTMODE_DISCOVERY_MAX,
> > > > >   				   PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
> > > > > +	adev = (void *)typec_altmode_get_partner(pdev);
> > > > > +
> > > > 
> > > > I understand that typec_altmode_get_partner() returns a const *;
> > > > maybe adev should be declared as const struct typec_altmode *
> > > > instead of using a typecast.
> > > 
> > > Yes...
> > > 
> > > > Also, typec_altmode_get_partner() can return NULL as well if pdev is NULL.
> > > > Is it guaranteed that typec_match_altmode() never returns NULL for pdev ?
> > > 
> > > ...and probable no. But I don't think we can receive Attention to a
> > > mode that hasn't been entered.
> > > 
> > 
> > If I understand correctly, the Attention was generated by a test system.
> > What prevents badly implemented code in the connected system from sending
> > such an Attention message ?
> 
> Oh, if that is the case, then I don't think my change has any effect.
> I misunderstood the scenario. Sorry for that.
> 
> I think we should use your patch to fix this issue.

So is this an "ack"?  I'm confused as to if this patch should be applied
or not...

thanks,

greg k-h

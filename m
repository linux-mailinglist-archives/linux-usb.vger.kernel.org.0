Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA79275722
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 13:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgIWL21 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 07:28:27 -0400
Received: from mx2.suse.de ([195.135.220.15]:45050 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbgIWL20 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Sep 2020 07:28:26 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600860505;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G55sus1OXx21Jkw2p6s96Mf/kmQLyNFdk1r4POhNKbA=;
        b=M5pFcB8c/yAXtZluQTLvxNB1vJaHEclLBRsDK/HA+gFjaWEWS99/m4PK9h9zHRdCTeG+Jc
        r5dYna3R0n3eYujiaNgC2Y6ATtKI5lJu/xuy6F0WySV1x1jWl16G7JRXgkP5KUBgvHvGx/
        j1AJtwYWP/djP8IjL1V4kWZvYY/HQxs=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 1678CACC2;
        Wed, 23 Sep 2020 11:29:03 +0000 (UTC)
Message-ID: <1600860486.26851.19.camel@suse.com>
Subject: Re: usb_control_msg_send() and usb_control_msg_recv() are highly
 problematic
From:   Oliver Neukum <oneukum@suse.com>
To:     Greg KH <gregKH@linuxfoundation.org>
Cc:     Himadri Pandya <himadrispandya@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-usb@vger.kernel.org
Date:   Wed, 23 Sep 2020 13:28:06 +0200
In-Reply-To: <20200923110724.GA3692555@kroah.com>
References: <1600858740.26851.16.camel@suse.com>
         <20200923110724.GA3692555@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 23.09.2020, 13:07 +0200 schrieb Greg KH:
> On Wed, Sep 23, 2020 at 12:59:00PM +0200, Oliver Neukum wrote:
> > Hi,
> > 
> > you probably do not want to hear this. I was out of comission
> > for the last week weeks and I should have looked at this more closely.
> > 
> > You may notice that usb_control_msg() for times immemorial has been
> > using GFP_NOIO internally. This is because control messages are needed
> > in a lot of contexts such as SCSI error handling and runtime PM
> > that require GFP_NOIO. IIRC at that time we found ourselves unable to
> > go through all those call chains, so we pulled the nuclear option
> > and slapped a blanket GFP_NOIO on the function.
> > 
> > Today I got a patch that outright deleted a memory allocation with
> > GFP_NOIO, so I looked into this. We are making the same mistake
> > we couldn't fix in the past.
> > I am afraid the API has to be changed to include memory flags.
> > And we should do this now while the damage is still within limits.
> > I am preparing patches.
> 
> How about we always use GPF_NOIO for the calls?  That should be fine and
> make it easier, right?

We are supposed to use GFP_NOIO thousands of times without any reason?
Usually we try to be better citizens in terms of VM allocations.

Of course this works, but do you want an API that is flawed  by design?

	Regards
		Oliver


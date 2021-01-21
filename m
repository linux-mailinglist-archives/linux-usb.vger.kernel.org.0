Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A27D2FF43D
	for <lists+linux-usb@lfdr.de>; Thu, 21 Jan 2021 20:22:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727267AbhAUTWA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Jan 2021 14:22:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47988 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727224AbhAUTVZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Jan 2021 14:21:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611256798;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pn5LHeOAJK8XWzc2xw7nllLWxQoJvQHBS5Z4RKjD4Gs=;
        b=cmWFZCEMjS3T5xVz1Rb/MEDyXI/eEy0XnWxCsiMOOcHIMr5PbdDZBLZiC9u9CXWEzz7vCc
        4ho8OB0qnLY2C4SOoXE0+n/LyI7CIMXRXAhP2BHRIW4TI8ACT/OEPGiLbnW4xLQf62kWyN
        fhI6WFhT8qHb0O3S2D1Gdxsudn6hZcg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-jGl82rotPHuQ_dq3cJqhRA-1; Thu, 21 Jan 2021 14:19:57 -0500
X-MC-Unique: jGl82rotPHuQ_dq3cJqhRA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD163802B40;
        Thu, 21 Jan 2021 19:19:55 +0000 (UTC)
Received: from suzdal.zaitcev.lan (ovpn-112-202.phx2.redhat.com [10.3.112.202])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4F3C51002382;
        Thu, 21 Jan 2021 19:19:55 +0000 (UTC)
Date:   Thu, 21 Jan 2021 13:19:54 -0600
From:   Pete Zaitcev <zaitcev@redhat.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Jeremy Figgins <kernel@jeremyfiggins.com>,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        zaitcev@redhat.com
Subject: Re: [PATCH] USB: usblp: add USBLP_QUIRK_NO_SET_INTF flag
Message-ID: <20210121131954.7103881d@suzdal.zaitcev.lan>
In-Reply-To: <20210118163117.GA142198@rowland.harvard.edu>
References: <YASt5wgOCkXhH2Dv@watson>
        <20210117234416.49d59761@suzdal.zaitcev.lan>
        <20210118163117.GA142198@rowland.harvard.edu>
Organization: Red Hat, Inc.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 18 Jan 2021 11:31:17 -0500
Alan Stern <stern@rowland.harvard.edu> wrote:

> > diff --git a/drivers/usb/class/usblp.c b/drivers/usb/class/usblp.c
> > index 37062130a03c..0c4a98f00797 100644
> > --- a/drivers/usb/class/usblp.c
> > +++ b/drivers/usb/class/usblp.c
> > @@ -1315,7 +1315,11 @@ static int usblp_set_protocol(struct usblp *usblp, int protocol)
> >  	alts = usblp->protocol[protocol].alt_setting;
> >  	if (alts < 0)
> >  		return -EINVAL;
> > -	r = usb_set_interface(usblp->dev, usblp->ifnum, alts);
> > +	if (usblp->dev->quirks & USB_QUIRK_NO_SET_INTF) {
> > +		r = 0;
> > +	} else {
> > +		r = usb_set_interface(usblp->dev, usblp->ifnum, alts);
> > +	}
> >  	if (r < 0) {
> >  		printk(KERN_ERR "usblp: can't set desired altsetting %d on interface %d\n",
> >  			alts, usblp->ifnum);  
> 
> Would it be practical simply to skip the usb_set_interface() call 
> whenever alts is 0?  After all, devices use altsetting 0 by default; it 
> shouldn't be necessary to tell them to do so.

Is it possible to bind and unbind the driver without enumeration, and
thus inherit a non-zero altsetting?

I'm also concerned about regressions. This is a legacy class driver,
only used where CUPS is not applicable, mostly with truly ancient
devices. So yes, setting a zero altsetting after enumeration should
be unnecessary. But you never know with the old firmware.

-- Pete


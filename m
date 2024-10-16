Return-Path: <linux-usb+bounces-16315-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CB89A0ABC
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 14:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1394B283A3
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 12:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4C1208D9A;
	Wed, 16 Oct 2024 12:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHYlyTJW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546D9208D96
	for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2024 12:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729083096; cv=none; b=dAFe+svcJ2XqwpFyb3VCODplXI7vCSMx3eYjHSJcbCZvUoJuOiQfWRGtaEx3vyC5bywNW3MOtCg5+Yxo2EtyxiEppuxe4FrWJIvUZo9gg4d32eRF2y630U4RP3GSBfGauBbvAwhqRDxQdAxMv4l7NviWbYhe8DLRbdYkYGp3G4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729083096; c=relaxed/simple;
	bh=BEtTK4azvAPR8a5g57xTdtbn93n1Q4PfNrmtQvKQLj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ocftOR/gxBscMuyXXyduphLZX7paA9Si23VUFWWJvBCWsT6l1J3YCpmzhO9MiiQvnUWyvVe8B/9AefjjLM9x1H0KoSB/PQLgl+dbmRhW48ECQnKMHa5k5UDZ52Wtj9vwC5FgxgBpY2uS67Il+qC6DDa650GX7abpc6DIiFy3mpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHYlyTJW; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d5689eea8so3233623f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2024 05:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729083092; x=1729687892; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h67SeTWZnAw2r6MS8kpA655AhW0wef7/mgwfLB1NXto=;
        b=BHYlyTJW6FUEVAASjiQ9fDBBAtMIbDuCsu9qCAaaZVNf8it2rd10e/GBJE9rimkEuo
         NODDdYfgTRMtete2+/Wj9VkwmtXO8rqjfsBAM41FpTyQYw1RZXrGBCF4/o5RlrgqMZcg
         DmyCpAC+Svmn4rtet35ns21ko1j64o7zg8L0mAgfwxQhd8hKCzEsOwSBehh9DTZta+Ec
         9buybq1LujmBqRwf+8pfJHLjSW66Yj9K2eZJOxUVuiA354IFAFp+CLqw7BjpS9touIxb
         lVOTXQ+ydcyCr8hm3to6Dx5q/L0TdaNSNNezGIW3nK2WUX1baXWLSIZUpltxlFi3QKsX
         LU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729083092; x=1729687892;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h67SeTWZnAw2r6MS8kpA655AhW0wef7/mgwfLB1NXto=;
        b=bi2gI1vYjsk/W/Pwljib74sFLGl5AoDypC5kUHxuK6YJtfEVFfQOWtC54DwyVzhMbH
         sv13zPU0Gboa6egQXKxai+cxTsKBJH1gP/NeFQ32Sgx2OFQARXldqQijKBat/QkopaRm
         Km7bP7hOBYKcCHZ+5z4Eo9XfVYahs1XmMG8bbJv5jXC3CdvJbytVR77xpD/MGQJFXw5Q
         c4ApXfuiD1FUYxx3b1/lgkOxZqUatu9FWtQv+aYQWd9ppHDVaQBZAvLKTpb4KxSW34X0
         H74zeeglJyw/ugqM56SYY3XR+Pm5+tjSh56wGYX8RlcwTUGgZsUAvdlSRPMAwogZEpaw
         VO6g==
X-Gm-Message-State: AOJu0Yw1Z1O3r2EKQzJnZG5uPAl0Lyu2XCrUNhkvM8w/fQDS/BIQfq9Y
	qMQk+H8wt5OdCZ08YfxQzHT0uD2Fu7+rZKmi5cpgKs7RZDye7riS
X-Google-Smtp-Source: AGHT+IHaC3nt9ONpIplR9HLU5Vpi75fQxFFxLgck2sziHQaqoskprZk0pVSier5Ow8mw/MgxldHztQ==
X-Received: by 2002:adf:a413:0:b0:37d:5338:8733 with SMTP id ffacd0b85a97d-37d86d3cb35mr2193415f8f.37.1729083092216;
        Wed, 16 Oct 2024 05:51:32 -0700 (PDT)
Received: from fedora ([78.211.67.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f56eab2sm48258725e9.26.2024.10.16.05.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 05:51:29 -0700 (PDT)
Date: Wed, 16 Oct 2024 14:51:24 +0200
From: Fabio Luongo <f.langufo.l@gmail.com>
To: Greg KH <greg@kroah.com>
Cc: linux-usb@vger.kernel.org, oneukum@suse.com
Subject: Re: [PATCH] Add support for JULABO PRESTO to cdc_acm
Message-ID: <Zw-2m7gQTNEkovBi@fedora>
References: <20240927134404.110284-1-f.langufo.l@gmail.com>
 <2024101624-stimulate-unbend-89a8@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024101624-stimulate-unbend-89a8@gregkh>

On Wed, Oct 16, 2024 at 10:11:15AM +0200, Greg KH wrote:
> On Fri, Sep 27, 2024 at 03:44:04PM +0200, Fabio Luongo wrote:
> > JULABO PRESTO chillers on Windows use the usbser.sys driver
> > for communication, so the same functionality should be achievable
> > on Linux using the cdc_acm driver.
> > 
> > However, cdc_acm does not accomodate the quirkness of these devices,
> > as they fail normal probing ("Zero length descriptor references"),
> > but they also feature a single USB interface instead of two.
> > 
> > This patch extends the effect of the `NO_UNION_NORMAL` quirk
> > to cover the features of JULABO PRESTO devices.
> > 
> > Signed-off-by: Fabio Luongo <f.langufo.l@gmail.com>
> > ---
> >  drivers/usb/class/cdc-acm.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
> > index 605fea461102..d77c84c6e878 100644
> > --- a/drivers/usb/class/cdc-acm.c
> > +++ b/drivers/usb/class/cdc-acm.c
> > @@ -1210,6 +1210,8 @@ static int acm_probe(struct usb_interface *intf,
> >  	if (quirks == NO_UNION_NORMAL) {
> >  		data_interface = usb_ifnum_to_if(usb_dev, 1);
> >  		control_interface = usb_ifnum_to_if(usb_dev, 0);
> > +		if (!data_interface)
> > +			data_interface = control_interface;
> 
> That feels wrong, how can we send data out both for different things?

My understanding is that we still have the correct number of (i.e. 3) endpoints
as in the case of properly implemented CDC devices, except they all belong
to the same interface, instead of being split across two,
so it should only be a matter of identifying which EP is for control and
which EPs are for data.

Indeed, I think this is what the current driver does via the call to
`usb_find_common_endpoints`.

> 
> >  		/* we would crash */
> >  		if (!data_interface || !control_interface)
> >  			return -ENODEV;
> > @@ -1284,6 +1286,8 @@ static int acm_probe(struct usb_interface *intf,
> >  	if (data_intf_num != call_intf_num)
> >  		dev_dbg(&intf->dev, "Separate call control interface. That is not fully supported.\n");
> >  
> > +skip_normal_probe:
> > +
> >  	if (control_interface == data_interface) {
> >  		/* some broken devices designed for windows work this way */
> >  		dev_warn(&intf->dev,"Control and data interfaces are not separated!\n");
> > @@ -1303,8 +1307,6 @@ static int acm_probe(struct usb_interface *intf,
> >  		goto made_compressed_probe;
> >  	}
> >  
> > -skip_normal_probe:
> 
> Why the movement of the goto tag?

Since `NO_UNION_NORMAL` allows for collapsed interfaces for data and control
after these changes, the label was moved to the `if`
that stands just above its current position,
where the case `control_interface == data_interface` is handled.

As a general comment, my understanding is that these changes
should not affect the devices which the driver already supports:
the `data_interface = control_interface` assignment is done only
as a last attempt to save a probing that would fail with ENODEV;
the extra `if` from the `goto` label movement should not get executed
by the currently supported devices, as they should have distinct interfaces.



Thanks,

Fabio L

> 
> thanks,
> 
> greg k-h


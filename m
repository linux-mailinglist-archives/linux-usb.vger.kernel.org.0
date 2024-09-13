Return-Path: <linux-usb+bounces-15092-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3878E977C93
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 11:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5016A28847B
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 09:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F2A1D6DC2;
	Fri, 13 Sep 2024 09:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UHw+eD5y"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD6A1C1743;
	Fri, 13 Sep 2024 09:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726221233; cv=none; b=CFMia5FAltPGMdSELWfuXnSB5ww+TlRPmahYC6IWMZ+8ZplEgP194x0HBVUTg+6ThG4SN4wC1Hq/tCgWK4V8nXNouSg2WWgs1mScTfLgtbgUh0nlewcU7G09+02qtEkyGl4tFE8x2yHU+HhnadErl1RdfJOKygqYZ99dyPeMgx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726221233; c=relaxed/simple;
	bh=mCI+QATUiukZGtLa4D51SCOTzP//jCzdbzpitsxGZlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i5iof+LsCnS04TCjNspXKgbisdqkznZPt112Xz88HO2+Fbm7lb7ZKWzvf3ODUcN9cYIfu9rKpNWdFKX4vVuZyry4sDmkVdyAvPMNS/jd9uwqFoHOSyv2RNzxmgKqpCXeZBL9OQARjZ+gknryzt6ZI7XZ5rX0AJ1B9wnFGxlrEk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UHw+eD5y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0B84C4CEC0;
	Fri, 13 Sep 2024 09:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726221233;
	bh=mCI+QATUiukZGtLa4D51SCOTzP//jCzdbzpitsxGZlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UHw+eD5yjsMFBcAGhpiJUZJkhQoPwRxn8EJ+PN7sYj/Y6vBut04qcplxG8fkbs9og
	 y5xwF+smKmvyeUsCVr/teU8LA9xkkDANvkNrw4fhJk/EX/Uu5CO6rDwCGiQVw4KwYV
	 T8czPUU1rhauNhA/h7NIf6jLNdsNjdTG5/89oMLSICt4ZBYIiDwxSYgH5MfOhmkL2R
	 gh4A4nLgbZp8MaxK118KWdbEx6zFucEJNLZXHHVpSC8qBTHi0s6TTFaCkAr675HBZD
	 wpZvhOPY7kKOOqly09GyaJR7FYwqKkEEjb8mjrEbrkoL4IyjrXC6+BjrIN7rFYnmGw
	 2kQroOR3Rkm5Q==
Date: Fri, 13 Sep 2024 17:53:44 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 1/2] usb: chipidea: udc: limit usb request length to max
 16KB
Message-ID: <20240913095344.GA321485@nchen-desktop>
References: <20240912045150.915573-1-xu.yang_2@nxp.com>
 <20240913012045.GA320526@nchen-desktop>
 <20240913071133.pstilja3z25yey2p@hippo>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913071133.pstilja3z25yey2p@hippo>

On 24-09-13 15:11:33, Xu Yang wrote:
> On Fri, Sep 13, 2024 at 09:20:45AM +0800, Peter Chen wrote:
> > On 24-09-12 12:51:49, Xu Yang wrote:
> > > Currently, the deivice controller has below limitations:
> > > 1. can't generate short packet interrupt if IOC not set in dTD. So if one
> > >    request span more than one dTDs and only the last dTD set IOC, the usb
> > >    request will pending there if no more data comes.
> > > 2. the controller can't accurately deliver data to differtent usb requests
> > >    in some cases due to short packet. For example: one usb request span 3
> > >    dTDs, then if the controller received a short packet the next packet
> > >    will go to 2nd dTD of current request rather than the first dTD of next
> > >    request.
> > > 
> > 
> > Are there any IP errata for it?
> 
> No. It's decided by hw IP design. This old design may not suit current
> requirements.
> 
> > 
> > > To let the device controller work properly, one usb request should only
> > > correspond to one dTD. Then every dTD will set IOC. In theory, each dTD
> > > support up to 20KB data transfer if the offset is 0. Due to we cannot
> > > predetermine the offset, this will limit the usb request length to max
> > > 16KB. This should be fine since most of the user transfer data based on
> > > this size policy.
> > > 
> > > Although these limitations found on OUT eps, we can put the request to IN
> > > eps too, this will benefit the following patches.
> > 
> > Since IN endpoints have not found the problem, please limit the changes
> > only for OUT endpoints.
> 
> This 1st patch is mainly used to serve the 2nd patch which may impact
> both IN and OUT eps.
...
> Because it's hard to judge whether a request is
> suit for transfer if it spans more dTDs. So it's needed for both eps.

Sorry, I do not understand you above words. First, you may know this
request is for IN or OUT, second, according to TD size and data buffer
address, you may know you use one or more dTDs.

Peter

> I've looked through all function drivers, all of them use 16KB as max
> request size. If one future function driver does use a larger request
> size, they can adjust it according to this error log too.
> 
> > 
> > > 
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > ---
> > >  drivers/usb/chipidea/ci.h  | 1 +
> > >  drivers/usb/chipidea/udc.c | 5 +++++
> > >  2 files changed, 6 insertions(+)
> > > 
> > > diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
> > > index 2a38e1eb6546..f8deccfc8713 100644
> > > --- a/drivers/usb/chipidea/ci.h
> > > +++ b/drivers/usb/chipidea/ci.h
> > > @@ -25,6 +25,7 @@
> > >  #define TD_PAGE_COUNT      5
> > >  #define CI_HDRC_PAGE_SIZE  4096ul /* page size for TD's */
> > >  #define ENDPT_MAX          32
> > > +#define CI_MAX_REQ_SIZE	(4 * CI_HDRC_PAGE_SIZE)
> > >  #define CI_MAX_BUF_SIZE	(TD_PAGE_COUNT * CI_HDRC_PAGE_SIZE)
> > >  
> > >  /******************************************************************************
> > > diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> > > index b1a1be6439b6..5d9369d01065 100644
> > > --- a/drivers/usb/chipidea/udc.c
> > > +++ b/drivers/usb/chipidea/udc.c
> > > @@ -969,6 +969,11 @@ static int _ep_queue(struct usb_ep *ep, struct usb_request *req,
> > >  		return -EMSGSIZE;
> > >  	}
> > >  
> > > +	if (hwreq->req.length > CI_MAX_REQ_SIZE) {
> > > +		dev_err(hwep->ci->dev, "request length too big (max 16KB)\n");
> > > +		return -EMSGSIZE;
> > > +	}
> > > +
> > 
> > Since this IP is used by many vendors, it may fix by others.
> > I prefer add flag like CI_HDRC_SHORT_PACKET_NOT_SUPPORT, 
> > and set in imx platform file.
> 
> Okay, I can limit the impact to only imx platform.
> 
> Thanks,
> Xu Yang 


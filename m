Return-Path: <linux-usb+bounces-9549-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 622518AC385
	for <lists+linux-usb@lfdr.de>; Mon, 22 Apr 2024 06:53:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1615C1F21676
	for <lists+linux-usb@lfdr.de>; Mon, 22 Apr 2024 04:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417A014A81;
	Mon, 22 Apr 2024 04:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Nz9HmPS7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D4614285
	for <linux-usb@vger.kernel.org>; Mon, 22 Apr 2024 04:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713761585; cv=none; b=haCJitYEqpSkoMDYEUjrvZ8kUTPKt8IXJo5e0HhODKbMHZfZdqKm1ZI0FpqyHDDx4KC+NuOL4cPsw7VEBuywTV4OWahjvhcB6TLRV/Yevxg1RCFHPifGhLWVcWGvT644B4p1hJqAu2OvIVhSya9E8wyQhRgV1TEbKdxB2e9vUYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713761585; c=relaxed/simple;
	bh=bC2fvOIQGTU2iHYqfVd3uKndA4tZ9kvh9O+6V7j+jVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4g9NnMLg6An1qlQ1yO7dh4F9JIE10s6hLdsFnPD1wXKqayyg7KVpZLs70KUp5q+XvWKHkB1UmWxRvaxyYe8hyH0yWSzLFTs1aJTl+faNHpRTJLlX0iWlCylGPOO3b7Miu/SO/oMWvineQxfUU6HQkjnAqUd8k9Oxjy9j8O1yLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Nz9HmPS7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CDFDC113CC;
	Mon, 22 Apr 2024 04:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713761585;
	bh=bC2fvOIQGTU2iHYqfVd3uKndA4tZ9kvh9O+6V7j+jVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nz9HmPS75YZiQStze8cpndresv8B7XoySUiUzlqt4SsO/SZpAirNRCvnr8c5nNIDp
	 hzOEmZeBuy/SlLDLl8Jf+fj/yoFxb1/8XSIGnkRnieHcdAIhoMVQ2Fq+XZZTGRjZ4y
	 ArpADn3WG2M/qPUsMMm+VgWGJFJSNXRRDDU2wcNc=
Date: Mon, 22 Apr 2024 06:53:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chris Wulff <Chris.Wulff@biamp.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: f_uac1: Expose all string descriptors
 through configfs.
Message-ID: <2024042213-tidings-epileptic-d67f@gregkh>
References: <CO1PR17MB54198F836C3ED1B4FA5F14A9E10D2@CO1PR17MB5419.namprd17.prod.outlook.com>
 <2024042131-bonded-flaring-c579@gregkh>
 <CO1PR17MB5419329D1584AD5AED65C703E1132@CO1PR17MB5419.namprd17.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CO1PR17MB5419329D1584AD5AED65C703E1132@CO1PR17MB5419.namprd17.prod.outlook.com>

On Sun, Apr 21, 2024 at 03:41:23PM +0000, Chris Wulff wrote:
> 
> > Any specific reason you didn't cc: the maintainer here?  Or the
> > developers who touched the file last?  scripts/get_maintainer.pl is your
> > friend :)
> 
> Thanks for the script reference. I looked in MAINTAINERS and didn't see one for the file(s) I am patching. As luck would have it, the first person on the list is you :). I will  CC the emails from the script in the future. I am struggling a bit with our Outlook 365 server as it doesn't allow SMTP mail with any kind of basic authentication so I am unable to directly use git send-email.

You might want to have your email client wrap lines at a sane length as
well :)

> > > diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
> > > index 7de74a3dd392..100169d6dca7 100644
> > > --- a/drivers/usb/gadget/function/f_uac1.c
> > > +++ b/drivers/usb/gadget/function/f_uac1.c
> > > @@ -377,24 +377,10 @@ enum {
> > >        STR_AS_OUT_IF_ALT1,
> > >        STR_AS_IN_IF_ALT0,
> > >        STR_AS_IN_IF_ALT1,
> > > +     NUM_STR_DESCRIPTORS,
> >
> > Does this require a change to the Documentation/ABI/ files as well?
> 
> I will add the additional configfs strings to Documentation/ABI/testing/configfs-usb-gadget-uac1 and Documentation/usb/gadget-testing.rst
> Are you aware of any other documentation that I might need to update? Those are the ones I've found so far.

That's a good start and probably is all that is needed for now, thanks.

greg k-h


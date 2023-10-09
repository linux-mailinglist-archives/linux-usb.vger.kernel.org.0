Return-Path: <linux-usb+bounces-1274-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6827BE52F
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 17:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AAFE1C20B6E
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 15:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D803374D7;
	Mon,  9 Oct 2023 15:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ogSBdGUz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A625B35887
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 15:42:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86013C433C7;
	Mon,  9 Oct 2023 15:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696866127;
	bh=2mtSi2dbcAnR0GFGNL7D62vYmsOpV5Y4fVEsQuUd0SY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ogSBdGUzby6aA7AasCeZkWmGc60fX7E+M2Tc2BRRnPhQlOFbKfoV8SqHj1yejXNNO
	 RwcWl4AlVK/rHHcdzEqk4AXkym2QlRNElhEXYC2N9ARFnrqLrEnJ+xXlrK3TO4krEX
	 n/ApupIQUDh4pxhqO4S+yZBGH4YSvcuWi8+H7I9A=
Date: Mon, 9 Oct 2023 17:42:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	onathan Corbet <corbet@lwn.net>,
	Linyu Yuan <quic_linyyuan@quicinc.com>, linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_ppratap@quicinc.com, quic_wcheng@quicinc.com,
	quic_jackp@quicinc.com
Subject: Re: [PATCH 1/2] Documentation: usb: Update NCM configfs parameters
Message-ID: <2023100940-shrill-unmoved-0b4e@gregkh>
References: <20231009142005.21338-1-quic_kriskura@quicinc.com>
 <2023100942-drop-down-abide-f8fe@gregkh>
 <e8a1cde2-0df1-4cc2-a6a1-e31a2a99dae3@quicinc.com>
 <2023100954-steadier-discolor-084f@gregkh>
 <7681bac9-5b64-49cc-8e47-8d9f54d4e39f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7681bac9-5b64-49cc-8e47-8d9f54d4e39f@quicinc.com>

On Mon, Oct 09, 2023 at 09:03:41PM +0530, Krishna Kurapati PSSNV wrote:
> 
> 
> On 10/9/2023 8:51 PM, Greg Kroah-Hartman wrote:
> 
> > > > > diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
> > > > > index 29072c166d23..6e5d96668e8e 100644
> > > > > --- a/Documentation/usb/gadget-testing.rst
> > > > > +++ b/Documentation/usb/gadget-testing.rst
> > > > > @@ -448,15 +448,17 @@ Function-specific configfs interface
> > > > >    The function name to use when creating the function directory is "ncm".
> > > > >    The NCM function provides these attributes in its function directory:
> > > > > -	=============== ==================================================
> > > > > -	ifname		network device interface name associated with this
> > > > > -			function instance
> > > > > -	qmult		queue length multiplier for high and super speed
> > > > > -	host_addr	MAC address of host's end of this
> > > > > -			Ethernet over USB link
> > > > > -	dev_addr	MAC address of device's end of this
> > > > > -			Ethernet over USB link
> > > > > -	=============== ==================================================
> > > > > +	================= ====================================================
> > > > > +	ifname		  network device interface name associated with this
> > > > > +			  function instance
> > > > > +	qmult		  queue length multiplier for high and super speed
> > > > > +	host_addr	  MAC address of host's end of this
> > > > > +			  Ethernet over USB link
> > > > > +	dev_addr	  MAC address of device's end of this
> > > > > +			  Ethernet over USB link
> > > > > +	max_segment_size  Segment size required for P2P connections. This
> > > > > +			  will inturn set MTU to (max_segment_size - 14 bytes)
> > > > 
> > > > "inturn"???
> > > > 
> > > > > +	================= ====================================================
> > > > 
> > > > What commit id does this fix?
> > > > 
> > > This is not a bug fix. It is just an addition of a new property. Does it
> > > need a fixes tag ?
> > 
> > Where is the code for the new property?
> > 
> > Ah, it's in patch 2/2, that wasn't obvious, sorry.  Why is this a
> > separate patch at all, shouldn't be part of the commit that adds the new
> > property to the system?
> > 
> 
> Sorry. I followed the practice of splitting patches like we usually do. Will
> club them up in a single patch in v2. Thanks for pointing this mistake.

Splitting is fine, but don't ask us to review documentation before the
feature is even presented, that's reading backwards :)



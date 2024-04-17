Return-Path: <linux-usb+bounces-9417-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E18FC8A7C6F
	for <lists+linux-usb@lfdr.de>; Wed, 17 Apr 2024 08:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CB9C1F24DBC
	for <lists+linux-usb@lfdr.de>; Wed, 17 Apr 2024 06:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2800F657DE;
	Wed, 17 Apr 2024 06:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JSJ183ZV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948C3657D2
	for <linux-usb@vger.kernel.org>; Wed, 17 Apr 2024 06:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713336147; cv=none; b=s86SNp0JEZFDjuT/eSpZN3SWZyA+8xYRFwhfuGg9VJis6waa3Sb9t36vutl6+rMmRCvqE9LqxcYo+suIlQyUZAuM6UVIf+6mnBUx1mcLBDKCP9PIvVmCu3BAgwsgFsIevt4h4mgYSprosByZHoq349oVOAVLDWCWhdz47SqQ758=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713336147; c=relaxed/simple;
	bh=e46zsUZwA8NddMs2AD3pPr6sFXa6p/xgseD8Db97YiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=du5LpXHakKHt/t5f9gPo3CpgRPsDDf60RrR+eFEviNkheqvdfFT9K64tLn+oOjDy1blh0WOgaL3oqxSL1pCI4lBvMR7Zdfq308y8aXL3anCe8QHAsGE8mjGoCuHzVQ6aXYN7tzoPvFuvepeFSjDOKWQC73siGdlYaW05LqjF1so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JSJ183ZV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28A0C2BD11;
	Wed, 17 Apr 2024 06:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713336147;
	bh=e46zsUZwA8NddMs2AD3pPr6sFXa6p/xgseD8Db97YiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JSJ183ZVXS5vwKD4hsQPFZIqNh2NN5w4O2b5/0VPw4i1uymhUvG7PMHUqo4O4zC4L
	 86LzQSHHs8dced/N/80BT/OSy8hjM88ls1kTJh2MF1HekWHeV7x+mRp7veXWb8E2Sf
	 SvywlEgW9CNoXxvfDljIsZo82khbxBEjkUFWjBHY=
Date: Wed, 17 Apr 2024 08:42:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "Grossman, Jake" <Jacob.Grossman@drs.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"Krebs, Charles" <Charles.Krebs@drs.com>,
	"Hardee, Hayden M" <Hayden.Hardee@drs.com>
Subject: Re: usb: dwc3: gadget performance insight
Message-ID: <2024041752-tutu-sliceable-2e18@gregkh>
References: <PH1P110MB1489614D2BD4B34E66B9A3208334A@PH1P110MB1489.NAMP110.PROD.OUTLOOK.COM>
 <PH1P110MB148961B015C6ABB24C2E03538308A@PH1P110MB1489.NAMP110.PROD.OUTLOOK.COM>
 <20240416223109.ckmljamgjc53sbpr@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240416223109.ckmljamgjc53sbpr@synopsys.com>

On Tue, Apr 16, 2024 at 10:31:19PM +0000, Thinh Nguyen wrote:
> On Tue, Apr 16, 2024, Grossman, Jake wrote:
> > Hello,
> > 
> >  
> > 
> > We’re trying to operate a USB gadget backed by the DWC3 core on an iMX8
> > processor, but we are seeing issues with performance.
> > 
> >  
> > 
> > As a comparison, utilizing iperf3 to benchmark, we are able to see ~230Mbit/s
> > with an RNDIS gadget, and ~900Mbit/s with a hardware USB-to-Ethernet
> > peripheral.
> > 
> 
> What is "a hardware USB-to-Ethernet peripheral"? Does it use the same
> RNDIS function driver and the same kernel version? If not, you're
> comparing 2 very different things. Also, I assume that you're testing
> against the same host.
> 
> >  
> > 
> > Looking at the output of perf, we are seeing that with all of the gadget
> > drivers (RNDIS, UVC, ACM), there is significant time spent spinning in an IRQ
> > context that does not occur with the hardware peripheral. This seems like it
> > might be related to the interrupt handler as described here: https://
> > docs.kernel.org/usb/dwc3.html.
> > 
> >  
> > 
> >  1. We have not yet acquired technical documentation regarding the DWC3
> >     module.  Do you have a list of the DWC3 commands that have high latency
> >     (~1ms)?
> >  2. Do you believe that implementing a per endpoint IRQ framework will resolve
> >     the large disparity in performance?  If not, do you have any insight into
> >     what the root cause might be?
> > 
> 
> I'm not familiar with RNDIS. However, my suspicion is that RNDIS
> transfers are small, and they may not take advantage of USB burst. Or
> perhaps your platform doesn't setup the TxFIFO size for performance? On
> a side note, isn't RNDIS getting outdated?

It's not only outdated, but incredibly insecure and should not be used
for anything unless you explicitly trust both ends of the connection.
Please never use it for anything real, including benchmarks.

I need to dust off my "delete the rndis code" patch set one of these
days...

thanks,

greg k-h


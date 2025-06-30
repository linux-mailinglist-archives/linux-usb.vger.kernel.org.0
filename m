Return-Path: <linux-usb+bounces-25282-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCEFAEDAA8
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 13:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17341172A6C
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 11:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED78A23F40D;
	Mon, 30 Jun 2025 11:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="u5FgT5IG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D89A1E9915
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 11:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282361; cv=none; b=lsvdm9aC7NmJ9sznMvmH+c5dU7/3ZaTJGCAMdkB5EuFqEDXSkFrsAypZ07H5KgjsbwStcvkVqOnK4Lh3z17oiGeujHjO4HM3NbvWPc+zqh/EbRY3RFCDxFIIrZOukqpLLcePd8SxxWyaPycBQw+rJ7Gi1Cor6Q/RCMs3C+C+qzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282361; c=relaxed/simple;
	bh=SFxR88aJo44rjPwtn1eYzaaCjb5p2K6HoBfDqVKHVk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIdMrv98JjwW0oVOwfcaxSJqnqA5VlxVw0kXppIcnr4AR8MTxZgapxGOlIzqcR3sX6EtXo1JWgZ+JNlZjtPDkEjWRhaC60f0MutVJKZbeBgcUgnOUMIMTVqtBCku43KSVoDNZoN2nvJdWB1c8KbNERMGpsiFEVCrFZ9WrDxfYE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=u5FgT5IG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B49C4CEEF;
	Mon, 30 Jun 2025 11:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751282360;
	bh=SFxR88aJo44rjPwtn1eYzaaCjb5p2K6HoBfDqVKHVk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u5FgT5IGfLKV93LHR1sTRoX/52wsG/E7XUEyBLAfkIwKfbpOijb64JlptpoSsnqMH
	 AmlsWf5opYwf9vOuZylZJnXV/bLX8fmSOJvyi7hkH66TshodMSSBGSNcki43ye8+J1
	 C9Tksh2Gl+vWYrNainZ0iUOwEqS1qGyON9qviGHk=
Date: Mon, 30 Jun 2025 13:19:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu, oneukum@suse.com,
	konrad.dybcio@oss.qualcomm.com, broonie@kernel.org,
	stable@kernel.org
Subject: Re: [RFT PATCH v3 1/1] usb: hub: Fix flushing of delayed work used
 for post resume purposes
Message-ID: <2025063001-angled-caretaker-4494@gregkh>
References: <20250627164348.3982628-1-mathias.nyman@linux.intel.com>
 <20250627164348.3982628-2-mathias.nyman@linux.intel.com>
 <2025062810-slush-trillion-b199@gregkh>
 <cea37477-319a-4090-b878-7bcbf348b6d8@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cea37477-319a-4090-b878-7bcbf348b6d8@linux.intel.com>

On Mon, Jun 30, 2025 at 01:07:29PM +0300, Mathias Nyman wrote:
> On 28.6.2025 17.46, Greg KH wrote:
> > On Fri, Jun 27, 2025 at 07:43:48PM +0300, Mathias Nyman wrote:
> > > Delayed work that prevents USB3 hubs from runtime-suspending too early
> > > needed to be flushed in hub_quiesce() to resolve issues detected on
> > > QC SC8280XP CRD board during suspend resume testing.
> > > 
> > > This flushing did however trigger new issues on Raspberry Pi 3B+, which
> > > doesn't have USB3 ports, and doesn't queue any post resume delayed work.
> > > 
> > > The flushed 'hub->init_work' item is used for several purposes, and
> > > is originally initialized with a 'NULL' work function. The work function
> > > is also changed on the fly, which may contribute to the issue.
> > > 
> > > Solve this by creating a dedicated delayed work item for post resume work,
> > > and flush that delayed work in hub_quiesce()
> > > 
> > > Cc: stable@kernel.org
> > > Fixes: a49e1e2e785f ("usb: hub: Fix flushing and scheduling of delayed work that tunes runtime pm")
> > > Reported-by: Mark Brown <broonie@kernel.org>
> > > Closes: https://lore.kernel.org/linux-usb/aF5rNp1l0LWITnEB@finisterre.sirena.org.uk
> > > Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > ---
> > > v3:
> > >   - Rebase on top of a49e1e2e785f ("usb: hub: Fix flushing and scheduling of delayed work that tunes runtime pm")
> > >   - Rewrite commit message
> > > 
> > > v2:
> > >   - Add and use dedicated delayed work struct for post resume work
> > >   - Add commit message section about dedicated work
> > 
> > This seems to work, want me to take this, or are you going to submit
> > another one?  I'll hold off on sending the pull request to Linus for
> > -rc4 because of this.
> > 
> > thanks,
> > 
> > greg k-h
> 
> Sorry about the response delay, was offline during weekend

As one should be!  :)

> I'll do some quick additional smoketests, suspending and disconnecting runtime suspended
> chained USB3 hubs. Shouldn't take more than a couple of hours

Ok, no rush, thanks for letting me know.

greg k-h


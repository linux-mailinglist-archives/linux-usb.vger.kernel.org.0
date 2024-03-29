Return-Path: <linux-usb+bounces-8656-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCFE891821
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 12:47:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2D741F22BBC
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 11:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4561E6A34F;
	Fri, 29 Mar 2024 11:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g6A5F4ZX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883583D0A1
	for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 11:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711712851; cv=none; b=lplBaZ6BhNPbJJwrM88xdPugv5fIMxn/zh69faVrV8RwbjAOGTH2CGUCIZmvWDjqPo9dpQTTTJNWAtjwZfp6cHY/ea1uiykIHQ2vuMVF0gct4NYp7fGNmsYeCjUfy+LWugP/S7ule0ANngz5xCFYAafLP4Yx4QusLLPViPgC4BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711712851; c=relaxed/simple;
	bh=I7f/3CsjdLUFsLq+w28tSlz23OH37yHqxjD/ccfg900=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BaqegKDl5sygVkDa9PN0Q85s/Q4Fxp/WfkA+dlv1i5YKs3sPHirnP4h0rHFlwBvSfqAFaBSajjTAR+4ktSyDPbQ16iSKhsFOiyxxtfbKbJqBWj34q4Vy6BjPviHwD0FNY74NeSWJTW0qduActtJvTfEd28jg8Y+IhE6TYFCn9j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g6A5F4ZX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84AE6C433C7;
	Fri, 29 Mar 2024 11:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711712851;
	bh=I7f/3CsjdLUFsLq+w28tSlz23OH37yHqxjD/ccfg900=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g6A5F4ZXoyNCV+v+4ZJ3A4Mg7RouPykwEeCpm10MoCoJi3nm06vBM5xmcX6SemIWq
	 xs21z6eWW6Xd1Pkp07P/xbBrwqbhsFBHIkU8iegEKpoAYs0Quv5TnNOR5BwqcPGoDY
	 hyyBTfdUVvYeQnBIwq4qMK/Ai6Q8pKdUxWdmmNN4=
Date: Fri, 29 Mar 2024 12:47:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Subject: Re: Device with two interfaces - what is the probing order?
Message-ID: <2024032907-smokeless-imperial-f3f9@gregkh>
References: <f4df8e45-5dc5-4d81-a414-e19a83b71403@gmail.com>
 <8bc3a7ae-bf8a-486e-946b-ff75ef2ac727@rowland.harvard.edu>
 <77a2f290-2f63-42d8-a6d2-25840049beca@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77a2f290-2f63-42d8-a6d2-25840049beca@gmail.com>

On Fri, Mar 29, 2024 at 01:36:18PM +0200, Bitterblue Smith wrote:
> On 28/03/2024 22:05, Alan Stern wrote:
> > On Thu, Mar 28, 2024 at 09:08:43PM +0200, Bitterblue Smith wrote:
> >> Hi all,
> >>
> >> Given a USB Wifi device with two "identical" interfaces,
> >> in what order are the interfaces probed? Is the order guaranteed?
> > 
> > They are probed in the order that they are listed in the 
> > Get-Config-Descriptor output.  But this is not guaranteed.
> > 
> > Alan Stern
> 
> Is it guaranteed that they are probed one at a time, not in parallel?

Yes, all USB probes are in sequence.

> Oh, and what about the disconnect function? Is that guaranteed to be called not in parallel?

Yes.

hope this helps,

greg k-h


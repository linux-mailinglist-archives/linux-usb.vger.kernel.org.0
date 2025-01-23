Return-Path: <linux-usb+bounces-19671-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA24EA1A573
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 15:07:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C459F16A50A
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 14:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 730DF21147C;
	Thu, 23 Jan 2025 14:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BD0Zeqbz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE99220F083;
	Thu, 23 Jan 2025 14:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737641254; cv=none; b=bA8HbaiTc9rpKEk1au6q8D6cH6HFn91vzM0owwiGchXkywfbD8mkXuP7rD0aWoPAnDiI279gZjkg6JdOcNeHlJc3lAWU6elDou7p241UVJCYaHnEZoo2pE+jGZwHAgpw57Bjy08oTFXxRR7gjB5bBZwnNoHHfVRxWSPL093ngjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737641254; c=relaxed/simple;
	bh=xEx0VGMAXYxmClVrvjnIjLpUt1NoPakGo+n7/nWJbvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K/iMGmzL4wqFLpn3YBDJyRL/PcPqC2Xz95M5oQjqHk1EQ1FYciWrdYWy2rHfK78ozOwP1hlzfZB+9iOB/Muc1dWNRujuEQp+1oBeYUVZWhEwizRICrmKf81PZl8wrNGg5REGgn9wtFe6PiJLj0eVICZTEG4henypwZO5U5JBadA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BD0Zeqbz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E55C4CED3;
	Thu, 23 Jan 2025 14:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737641253;
	bh=xEx0VGMAXYxmClVrvjnIjLpUt1NoPakGo+n7/nWJbvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BD0ZeqbzeBBWK73Pkhf9xfH4EJ3ZP4g8ql8Hn8MMPVSt7nMunkQigCshIT9QXPIhm
	 eeKaAB0bctVR0EMTU4QFDvl6RCYm0QF/owqMoxn8JYZPvReg0fihIcLFmZUleD7dUy
	 MEomS7GdXZo2lSQxxs63jCzvZ17iLo9ILsqbS0Lk=
Date: Thu, 23 Jan 2025 15:07:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Usman Akinyemi <usmanakinyemi202@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: Fix documentation warning for sg member
Message-ID: <2025012315-feminine-spiny-b288@gregkh>
References: <20250123080102.1632517-1-usmanakinyemi202@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123080102.1632517-1-usmanakinyemi202@gmail.com>

On Thu, Jan 23, 2025 at 01:31:02PM +0530, Usman Akinyemi wrote:
> The 'sg' member in struct dwc3_request was undocumented, causing a
> documentation warning when building the kernel docs.
> 
> This patch adds a description for the 'sg' field, resolving the warning.
> 
> Signed-off-by: Usman Akinyemi <usmanakinyemi202@gmail.com>

What commit id does this fix?  And what about the reported-by: line?

thanks,

greg k-h


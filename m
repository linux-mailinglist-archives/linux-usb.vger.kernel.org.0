Return-Path: <linux-usb+bounces-2312-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A93317DA66A
	for <lists+linux-usb@lfdr.de>; Sat, 28 Oct 2023 12:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EF4EB2143E
	for <lists+linux-usb@lfdr.de>; Sat, 28 Oct 2023 10:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA2BDF57;
	Sat, 28 Oct 2023 10:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ntb02SXi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE48114F8E
	for <linux-usb@vger.kernel.org>; Sat, 28 Oct 2023 10:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C0DC433C7;
	Sat, 28 Oct 2023 10:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698489134;
	bh=0nW2uSS/veGOLX0iHBYTP53/zL6hySIszK3yCN6ui8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ntb02SXi3hrjD8PLMZ9qS8fePfUDvNCK2VSeandxJycossxP8Oxi9sZsmImK11SmC
	 Aa1tjyyei0bhGlmBlDfzywwOBPVZX3Sg4s9N67IhnONCdtkypxTJSChjVL12QZsT/a
	 beallckNmrmuYCXQmV114VEqA4Sn2VIiyCZsVkHc=
Date: Sat, 28 Oct 2023 12:32:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/1] usb: dwc3: Fix default mode initialization
Message-ID: <2023102854-outcast-stupor-55c8@gregkh>
References: <20231025095110.2405281-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025095110.2405281-1-alexander.stein@ew.tq-group.com>

On Wed, Oct 25, 2023 at 11:51:10AM +0200, Alexander Stein wrote:
> The default mode, configurable by DT, shall be set before usb role switch
> driver is registered. Otherwise there is a race between default mode
> and mode set by usb role switch driver.
> 
> Fixes: 98ed256a4dbad ("usb: dwc3: Add support for role-switch-default-mode binding")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> This is a different approach to [1] to fix the race upon dwc3 role
> initialization. dwc3_set_mode() needs to be called in dwc3_setup_role_switch()
> to ensure the mode is initialized.
> The usb role switch driver probe might be delayed or defered for some unrelated
> reason, leaving the dwc3 mode unitialized if dwc3_set_mode() is not called here.
> 
> [1] https://lore.kernel.org/linux-usb/2176034.Icojqenx9y@steina-w/T/
> 
>  drivers/usb/dwc3/drd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot


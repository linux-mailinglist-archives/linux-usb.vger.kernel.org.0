Return-Path: <linux-usb+bounces-855-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E65D7B4582
	for <lists+linux-usb@lfdr.de>; Sun,  1 Oct 2023 08:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 7DAB91C209F6
	for <lists+linux-usb@lfdr.de>; Sun,  1 Oct 2023 06:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7046B9477;
	Sun,  1 Oct 2023 06:06:10 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C83B138D
	for <linux-usb@vger.kernel.org>; Sun,  1 Oct 2023 06:06:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17905C433C7;
	Sun,  1 Oct 2023 06:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696140369;
	bh=EunzAtVRcUsF9o6B6FHmIwvRxk8PXJwsGkPsvupw0MU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hLNRNEMlcvYjnZseSVoV64pf6GrG4Pvtl6ENR0mqGXEO7dpqxBLJwSDRsp4EGUR+r
	 8JIGsPJZC+37loUsv74BDG7bArjFcriguAcZnuSrzdxuM1LThtap91SiSWNeLy2NlI
	 BL3xrIoQY21oHL05HWWNe9Va2IqprRRzsYvta0Ng=
Date: Sun, 1 Oct 2023 08:06:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jonathan Bergh <bergh.jonathan@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drivers: usb: Fix block comments whose trailing */
 was not on a separate line
Message-ID: <2023100133-exclusive-boss-edc4@gregkh>
References: <20230930203646.61863-1-bergh.jonathan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230930203646.61863-1-bergh.jonathan@gmail.com>

On Sat, Sep 30, 2023 at 10:36:46PM +0200, Jonathan Bergh wrote:
> Fixed various instances where block comments trailing */ where not on a
> separate line and should be.
> 
> Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
> ---
>  drivers/usb/atm/cxacru.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Your subject line for these patches is not correct, please fix up.

And the patches are not properly threaded, what happened in your email
client?

And finally, why make coding style changes outside of drivers/staging/?
Did you get the maintainer's approval to do so before taking the time?
Usually most maintainers do not want these so always ask before doing
so, or just stick with drivers/staging/ to learn how the process works
first please.

thanks,

greg k-h


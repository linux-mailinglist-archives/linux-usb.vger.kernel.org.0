Return-Path: <linux-usb+bounces-14478-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ABC96825E
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 10:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4932F1C2229F
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 08:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B977D178388;
	Mon,  2 Sep 2024 08:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mSlNzR+9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108C51E48A
	for <linux-usb@vger.kernel.org>; Mon,  2 Sep 2024 08:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725266962; cv=none; b=lCxBtt+U12wt+0cnF/6k7PwQmN+poQ7HqPnlkxs8eIbJCPD9+bk3JU8YMXRXcG/WYvXlmMKi+JE1Bei7SOOaqisUW2zapYI1C+wxQfIyRbnfDZc6ha1m4Nq8kUdvt4jz595q/G2ONhXMGButk39KL+ukx5Xl59X6ULQNyhTD5eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725266962; c=relaxed/simple;
	bh=UIt14ol5Bdd1RfRAl5hXr0GhclZw22Cd2yi3D935fGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TzQ73KLdl3VZWWNUnJl7wV16MHATCEArC6aA9SBu/uee2fbt5nuVhj/blxEGOIPQpEcDYFAIb6HH0YyNhN7mwcsS88FniFI5QOvlaxcJIsslcCKz2W7IQvBB+MvQa14Uq5n8KsxI6dq8lOq174L35nZRTp4f7y8gOuZ3WiyfuP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mSlNzR+9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227D6C4CEC6;
	Mon,  2 Sep 2024 08:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725266961;
	bh=UIt14ol5Bdd1RfRAl5hXr0GhclZw22Cd2yi3D935fGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mSlNzR+95GgSkZuFzUIkU2DmytbifYcp0iRErXBuN+wCmV7ZBT+fmVmK9ws8tHs3R
	 41JE+SV85ofn96itDKB5/DsHZ3cIARer+m4oOIYHwxBVsMZoXl0ZFjQZXHNtMbEtxs
	 MmB2wc4jFNfl1gbQIJ2jnT8Gw/WoM1eR1x0ayMfA=
Date: Mon, 2 Sep 2024 10:49:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: sashal@kernel.org, peter.chen@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-imx@nxp.com, balbi@ti.com, linux-usb@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH 1/3] usb: chipidea: add USB PHY event
Message-ID: <2024090255-unvocal-quickly-7454@gregkh>
References: <20230627110353.1879477-1-xu.yang_2@nxp.com>
 <20240902075600.mubftf5ryv3txdlz@hippo>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902075600.mubftf5ryv3txdlz@hippo>

On Mon, Sep 02, 2024 at 03:59:12PM +0800, Xu Yang wrote:
> Hi Greg and Sasha,
> 
> On Tue, Jun 27, 2023 at 07:03:51PM +0800, Xu Yang wrote:
> > Add USB PHY event for below situation:
> > - usb role changed
> > - vbus connect
> > - vbus disconnect
> > - gadget driver is enumerated
> > 
> > USB PHY driver can get the last event after above situation occurs
> > and deal with different situations.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> These 3 patches had already merged to usb tree. But I didn't add fix tag
> to patch #1 and #3, therefore, only patch #2 went to stable tree. Now
> the stable tree linux-5.15.y and linux-6.1.y have issue due to patch #2
> depends on patch #1. So could you please add patch #1 and patch #3 to
> linux-5.15.y and linux-6.1.y? Or should I post a normal request to achieve
> this? 

Please send a "normal" request as I have no idea what to do here, nor
what the git commit ids are.

thanks,

greg k-h


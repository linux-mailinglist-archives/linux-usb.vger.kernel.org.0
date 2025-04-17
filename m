Return-Path: <linux-usb+bounces-23188-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71091A91826
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 11:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D90173BF4CB
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 09:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C84225A3D;
	Thu, 17 Apr 2025 09:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DeGKJ4Co"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDBCA55
	for <linux-usb@vger.kernel.org>; Thu, 17 Apr 2025 09:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744882783; cv=none; b=pE3z5Ao8HOrD4Bw5dBXhqB/mUFOWsmkrJft9KtwKZyHm25YEZYktJameSC08URd2SGdC3YpsN2oOznhkzn9HXM5mJPx0BJ3LSPDUJMERpDdz4VSClMUrss1olzHHq7jjsBB2HbLFLQ0IW4bgQfNRh1VJoVkG6rnqaLHEnE190VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744882783; c=relaxed/simple;
	bh=grZJy5VzmBEoVRtMVETapGC63vkhWLbSkqpprGCV7ME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r213/RcLsIUK3y/P6uDDUFIMYnZcGnWkhzzVjc3OmjUdNJxYwz3+vFRcN8sLnT7cEh8Z/5B/tVtYmUfck9pv4ZB1yjE79gHmgRXQO5446FOi8XHuABjiMm1DEcZk9hYz39N7zYdEhAwFDuRo2VKjpLwCFdofrPUqLiJqdsYATyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DeGKJ4Co; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E01FEC4CEE4;
	Thu, 17 Apr 2025 09:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744882781;
	bh=grZJy5VzmBEoVRtMVETapGC63vkhWLbSkqpprGCV7ME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DeGKJ4CodBG2IQBC3zMdx3N4cfEpxWWki3yb/z24Q7jJU+s/qqn6WlMnbVKSrv82T
	 VNlXtRnuvsnHoVg7Du5mjgzva+XnvNRtA5KJpuXom4kivKi/Ko/1qdfUSjl+fB42LG
	 QezZp8PM8/xzBCOWLcM+kmb7zqMEM5pKU/W2H5YQ=
Date: Thu, 17 Apr 2025 11:39:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Saranya Gopal <saranya.gopal@intel.com>
Subject: Re: [PATCH v2 4/4] Documentation/admin-guide: Document
 Thunderbolt/USB4 tunneling events
Message-ID: <2025041759-slimy-subzero-a6ba@gregkh>
References: <20250417090426.221773-1-mika.westerberg@linux.intel.com>
 <20250417090426.221773-5-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417090426.221773-5-mika.westerberg@linux.intel.com>

On Thu, Apr 17, 2025 at 12:04:26PM +0300, Mika Westerberg wrote:
> From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
> 
> Add documentation about the Thunderbolt/USB4 tunneling events to the
> user’s and administrator’s guide.
> 
> Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  Documentation/admin-guide/thunderbolt.rst | 33 +++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/Documentation/admin-guide/thunderbolt.rst b/Documentation/admin-guide/thunderbolt.rst
> index d0502691dfa1..f0368ab6bd1f 100644
> --- a/Documentation/admin-guide/thunderbolt.rst
> +++ b/Documentation/admin-guide/thunderbolt.rst
> @@ -296,6 +296,39 @@ information is missing.
>  To recover from this mode, one needs to flash a valid NVM image to the
>  host controller in the same way it is done in the previous chapter.
>  
> +Tunneling events
> +----------------
> +The driver sends ``KOBJ_CHANGE`` events to userspace when there is a
> +tunneling change in the ``thunderbolt_domain``. The notification carries
> +following environment variables::
> +
> +  TUNNEL_EVENT=<EVENT>
> +  TUNNEL_DETAILS=0:12 <-> 1:20 (USB3)

I'm ok with this, but wow TUNNEL_DETAILS is going to be hard to parse by
userspace, right?  Is this something that it is supposed to do something
with?

thanks,

greg k-h


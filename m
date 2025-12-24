Return-Path: <linux-usb+bounces-31745-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C7BCDBB05
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 09:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F6B33031984
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 08:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E4132ED32;
	Wed, 24 Dec 2025 08:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CrRpvlGj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE6F32AAAF;
	Wed, 24 Dec 2025 08:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766565609; cv=none; b=fm2Xg8gsLZiz5ffXenZkumJT9RRTYPqQA6sE7C43TugnirCQKLNYfkhU3SJQfws0HSbZMXq3IFNn/z7bDPQ5SpMqdkKRly50Z75emq75ZKgqx3ODfPSyD98fUZRA+l59qpba+y4rMV/KQF0EDOB22v2+KxZDcNc47F3/Qo61ApY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766565609; c=relaxed/simple;
	bh=GWwxhJVDkHjtUDMVXrW/mwqCRPpUaZKHzoOfZwjM0Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIkuEEe2nVYSF0unXSHJzDnMs1tyNA3IZXo6AD7mLjbo19j72xqU2CbYwU+HFWooCyVPgR//EDzw9W9+dkwv2zZ8gIJKYNfTLPCe6pSc+hR/2dSJKMMVcMNQt4VhvsOQdfDjf5jzB6F8dEbJphjyM1L3ooWfHWvwBL+QiPO8meM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CrRpvlGj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9738C4CEFB;
	Wed, 24 Dec 2025 08:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766565606;
	bh=GWwxhJVDkHjtUDMVXrW/mwqCRPpUaZKHzoOfZwjM0Yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CrRpvlGjgFkUf88MnKvbW4ciLcopgzIfstOpm97ywuEOJJvk//Unf+YHQuVDoQjwO
	 icC4hsLOAt/8ZLQqhr9XfKx/L45tByIDlJhd0UNdGBCS1kc09JSfdKIRpJatzOwVde
	 DBXVNhcIlcB/obIel3T2eGX31ZNordma0pfMcu10=
Date: Wed, 24 Dec 2025 09:40:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jason Sun <jason.sun689@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	sunqian@senarytech.com
Subject: Re: [PATCH v2] dwc2: Delay resume until device connection is stable
Message-ID: <2025122444-handcraft-hammock-c020@gregkh>
References: <20251215125317.85624-1-sunqian@senarytech.com>
 <20251224082013.87100-1-jason.sun689@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224082013.87100-1-jason.sun689@gmail.com>

On Wed, Dec 24, 2025 at 04:20:13PM +0800, Jason Sun wrote:
> Tested on:
>   - Kernel: v5.15.140

That's a very old kernel version.  How about 6.18?

thanks,

greg k-h


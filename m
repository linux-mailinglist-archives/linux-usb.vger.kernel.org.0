Return-Path: <linux-usb+bounces-22282-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D91A9A74608
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 10:11:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9521E3ADEDD
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 09:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD8B212F8F;
	Fri, 28 Mar 2025 09:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0nk9dfih"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0EE1D5170
	for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743153059; cv=none; b=J6PuM3beu7UjLs6PLab+c07gZhQsCK94EnWw9+gr7p1YyAfeTwtCCjYFzrw20GTEBq+Ta2F5P7mBzO5TCsdSLusLMKROS1DdnYJzbRSFNbmEAQIbk0mhHD/NIlIAzw63Zuz97YQq0/aXFWk0QW5awY7eFZPwQf1PtbgicaRnouk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743153059; c=relaxed/simple;
	bh=rj/oItgzrVr7b9u7ChyhR8PDanjmB4327zKnaYX/9hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1NLiNSM/b6n0Q5JittJlKn8cqVOxzcgrxsZ7UbYhpVK8ock9YpLFLAZYulauzfUo/wIjvxan29sr0c628S9ePRRga99L0sU6wLtkanISTFPej47p6Giz0Yn4shfl7KXI3jdjg6TUMx9A1KfO+F4VeqB8AKh56oGoONThMlUtKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0nk9dfih; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E62EC4CEE4;
	Fri, 28 Mar 2025 09:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743153058;
	bh=rj/oItgzrVr7b9u7ChyhR8PDanjmB4327zKnaYX/9hU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0nk9dfihiYhl8O0mwodafXapA4hAtdxo8uKhU45L89YbcwQlgvZj/lc7nveub7d6b
	 3PqstxZZkSpkXtaFTich85gsghEApUSXwgP4WW8ZVAnEw5IziiUOjq4U12ko6Unutr
	 Xwl3K9LQRfNHoP6ZnBphVOpP0PWO8yrRnlh1H9to=
Date: Fri, 28 Mar 2025 10:10:55 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Frode Isaksen <fisaksen@baylibre.com>
Cc: linux-usb@vger.kernel.org, Thinh.Nguyen@synopsys.com,
	Frode Isaksen <frode@meta.com>
Subject: Re: [PATCH] usb: dwc3: gadget: check that event count does not
 exceed event buffer length
Message-ID: <2025032841-tactics-linguini-f2ca@gregkh>
References: <20250328085603.2156517-1-fisaksen@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328085603.2156517-1-fisaksen@baylibre.com>

On Fri, Mar 28, 2025 at 09:55:25AM +0100, Frode Isaksen wrote:
> From: Frode Isaksen <frode@meta.com>
> 
> The event count is read from register DWC3_GEVNTCOUNT.
> There is a check for the count being zero, but not for exceeding the
> event buffer length.
> Check that event count does not exceed event buffer length,
> avoiding an out-of-bounds access when memcpy'ing the event.
> Crash log:
> Unable to handle kernel paging request at virtual address ffffffc0129be000
> pc : __memcpy+0x114/0x180
> lr : dwc3_check_event_buf+0xec/0x348
> x3 : 0000000000000030 x2 : 000000000000dfc4
> x1 : ffffffc0129be000 x0 : ffffff87aad60080
> Call trace:
> __memcpy+0x114/0x180
> dwc3_interrupt+0x24/0x34
> 
> Signed-off-by: Frode Isaksen <frode@meta.com>
> ---
> This bug was discovered, tested and fixed (no more crashes seen) on Meta Quest 3 device.
> Also tested on T.I. AM62x board.

What commit id does this fix?  Should it go to stable kernels too?

thanks,

greg k-h


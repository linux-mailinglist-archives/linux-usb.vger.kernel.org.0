Return-Path: <linux-usb+bounces-17105-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E7B9BC92C
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 10:32:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D51A61C216A2
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 09:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA751D04A9;
	Tue,  5 Nov 2024 09:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Zm6ldfxw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E62C1CEAA0;
	Tue,  5 Nov 2024 09:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730799118; cv=none; b=WL5jFjv0qWXvnmHNQYKrdtdQBn757iPgd6tO5RLS6KDp1aFiAi0k0voeS06c9E0dVO7Iq2kgfaeSI6y+qO2xaYJke33aMwH9V1aXzVt3dDrNda0Ny0MLJZiswPrk7hT+xW9GugwM+YmHfQLA0HR+9h3NjCdd7KgUUdWFfZqOYVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730799118; c=relaxed/simple;
	bh=wPIGb8hV6N56iKxEiA9YRRsc4R1JZzDisefhuwIws1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WA1X+j8q16CWIADBVnhXSlfTUJmtDMRncwW9H01Gl87/6tww9RRU334X+a3qGGm222GVwaKsyoUEbNpZyuezH+LpAFvLkAxYMlNNp1LT2ZwhkE11kr6YZOCmuZ2pEF8b7gRx1LT1BIfSX3B1Xwwxxfr37Q6p9tqab+98qVNQb88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Zm6ldfxw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685E4C4CED0;
	Tue,  5 Nov 2024 09:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730799117;
	bh=wPIGb8hV6N56iKxEiA9YRRsc4R1JZzDisefhuwIws1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zm6ldfxwzvWdA9DaRFByGCE5HxEOdTjyVqD/s5bzYtAbw2MTb7z8DIthTVrdSg+CM
	 QCge7X6VxjzgXzGtyBG7h0T/rSFYNDC6TQOJGhX3dGNlGIQYCmLPeD/ZEwVSOtnNWK
	 j1v2sd0+zsYl+pp6TAhMmeKPhUUGk19QMeoNQjnc=
Date: Tue, 5 Nov 2024 10:31:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Raju Rangoju <Raju.Rangoju@amd.com>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: quirk for data loss in ISOC transfers
Message-ID: <2024110521-thwarting-imagines-567e@gregkh>
References: <20241105091850.3094-1-Raju.Rangoju@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105091850.3094-1-Raju.Rangoju@amd.com>

On Tue, Nov 05, 2024 at 02:48:50PM +0530, Raju Rangoju wrote:
> During the High-Speed Isochronous Audio transfers, xHCI
> controller on certain AMD platforms experiences momentary data
> loss. This results in Missed Service Errors (MSE) being
> generated by the xHCI.
> 
> The root cause of the MSE is attributed to the ISOC OUT endpoint
> being omitted from scheduling. This can happen either when an IN
> endpoint with a 64ms service interval is pre-scheduled prior to
> the ISOC OUT endpoint or when the interval of the ISOC OUT
> endpoint is shorter than that of the IN endpoint. Consequently,
> the OUT service is neglected when an IN endpoint with a service
> interval exceeding 32ms is scheduled concurrently (every 64ms in
> this scenario).
> 
> This issue is particularly seen on certain older AMD platforms.
> To mitigate this problem, it is recommended to adjust the service
> interval of the IN endpoint to exceed 32ms (interval 8). This
> adjustment ensures that the OUT endpoint will not be bypassed,
> even if a smaller interval value is utilized.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Raju Rangoju <Raju.Rangoju@amd.com>

What commit id does this fix?  Should it go to stable kernels, and if
so, how far back?

thanks,

greg k-h


Return-Path: <linux-usb+bounces-11283-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C161B9073F8
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 15:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3243C28B0DA
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 13:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97599145323;
	Thu, 13 Jun 2024 13:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MfMzUYFq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9A7144D22;
	Thu, 13 Jun 2024 13:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718285987; cv=none; b=WMyYeEEKTGlZwuPthFebr8I8c+eHWbDpSs+dRTdHXpRPC8N3YrD2H75XIx9PjlV3Y6gPEO3C9cNCcdJJxUu+YsckLfNcq6Z7rFwyMbW5IFeWgXNHwnn5AI7gAWNBeOFHPhd2A9daUDi6PWQ3hCKhA2bhXOdaHBZb+cv5VCF+qqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718285987; c=relaxed/simple;
	bh=0V2xfbv1qoX2jEhAXlPk2ELeXPbgFnKVzbds4fptVAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdp0ze5z/F/2ADs/twsK0NRkUreU0bmaRc+yOmB92fnaeOzDPmdvtbh+5NE3qpzedinncjjqUdcMYFrh6q5BlrD1o/vHqpYC2hl48I3yIvNyldt5e7sDpkgpTHntu1Yo6QaIYlBvXvUHIIA5HBq9yMF/2NBwIsYUP24mj9WiQFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MfMzUYFq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B67C2BBFC;
	Thu, 13 Jun 2024 13:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718285986;
	bh=0V2xfbv1qoX2jEhAXlPk2ELeXPbgFnKVzbds4fptVAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MfMzUYFq6tSu6oKFUlDbbXzqclh+Wul3HoHFWqBZRUZBOKrdB1u9ptSC3Z3eGLraN
	 BI+NQDKs4uYs72jr5iiXcYpgFsZb8V2npCajdsRnwX8yMbN4OvrGIKQOoR3meKume8
	 RwPVBIJiLfu8/yyveo0MltaPSz2MQGLhX2sDRBv8=
Date: Thu, 13 Jun 2024 15:39:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: johan@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: spcp8x5: remove unused struct
 'spcp8x5_usb_ctrl_arg'
Message-ID: <2024061357-lagged-cloud-a2a3@gregkh>
References: <20240529234722.130609-1-linux@treblig.org>
 <Zmr0GV57EGwxcYeM@gallifrey>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zmr0GV57EGwxcYeM@gallifrey>

On Thu, Jun 13, 2024 at 01:28:57PM +0000, Dr. David Alan Gilbert wrote:
> * linux@treblig.org (linux@treblig.org) wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > 'spcp8x5_usb_ctrl_arg' has been unused since the original
> > commit 619a6f1d1423 ("USB: add usb-serial spcp8x5 driver").
> > 
> > Remove it.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 
> Ping?

It's only been 2 weeks for a "remove some unused code" type of patch,
which will be gotten to, but realize that people are traveling and the
like...  Give it some time.

In the meantime, why not help review other patches on the list?

thanks,

greg k-h


Return-Path: <linux-usb+bounces-32328-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAECD1E831
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 12:47:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D6693027D87
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 11:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5EB339447B;
	Wed, 14 Jan 2026 11:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G6sf4Z+U"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC52343D8F;
	Wed, 14 Jan 2026 11:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768390805; cv=none; b=T8kGLvhQy7UgaZ1ebwtwVKq9MuWtMAdmZ1voDBmvzZ/lcTV0inFhfMfeGtLJegEG65LVH1k/KAYbupFYereDJR6cPqSC4CY4B9at7rTogItv8CM0y5VFUck49ytiTpbrpddoamc/E0+z7OJZrkMdddgVLiXT2M7FmRVczDrPAEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768390805; c=relaxed/simple;
	bh=e+AeNfdB5zw6guBtdpeOnScf0Y08Y9+3Ne3yV9cw1o4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q8SCDPoTXc5l5bwVPs3ELYDm0z70qBVYC1KXGmGHIpqpe9G9QHSxekvZfkqAd8RutZ9TcKVhns0j5CVVuxK9KcFGQ2fyJzIWOiEiyaaWUQxkBv7jRrnFb/zXNYpvAKAJKpRqZAeCvcDOLJcOKW1FIlifbUXgIpPW3/cnzJzOI7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=G6sf4Z+U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A5EAC4CEF7;
	Wed, 14 Jan 2026 11:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768390804;
	bh=e+AeNfdB5zw6guBtdpeOnScf0Y08Y9+3Ne3yV9cw1o4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G6sf4Z+U73XL0Q1KAHFRLq3cEH9Q5PS3vnrnSvOheqiRzxD0feZFaIiL4YB9KyFil
	 W3evHZ/uvbr5fe74Tc6LZ24XziDbHEu5qRBlBstnvH3a+5JAWvgfNCVOkuKo28j6Zt
	 IPUJIAadELYM7YuseEP23o3oz89wwNDjyk+UuNH8=
Date: Wed, 14 Jan 2026 12:40:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] usb: dwc3: Log dwc3 address in traces
Message-ID: <2026011400-monthly-commend-f89b@gregkh>
References: <20260114100748.2950103-1-prashanth.k@oss.qualcomm.com>
 <20260114100748.2950103-4-prashanth.k@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114100748.2950103-4-prashanth.k@oss.qualcomm.com>

On Wed, Jan 14, 2026 at 03:37:48PM +0530, Prashanth K wrote:
> + * @address: Cached lower 32-bit base address to be used for logging.

Why are 32bits enough / ok?  Why not use the full 64 that you really
have?  What happens if you have 2 devices with just the upper 32 bits
different?

This is a resource value, so why not use the proper type for it?

thanks,

greg k-h


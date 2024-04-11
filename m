Return-Path: <linux-usb+bounces-9264-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4278A16C9
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 16:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C092B28CF64
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 14:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C00814E2F4;
	Thu, 11 Apr 2024 14:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CMxTWc9w"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68AA14D6FD
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 14:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712844573; cv=none; b=m/8JlIaf6HU0NrtvlezpjVGndf1gO3Qc8CHIl9sbI6PPQKd4rN6R/jL2P/9XNvpZtOByLh+5dsQXLCb9yUdoXPHGh3kbfArRlNU9OJijfSMoMfkyVVmwAvXmpZXIYCPLXBfVZLJV/vnbwPFBFSrOrFY33mkJNxNpxJCKQVyDSSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712844573; c=relaxed/simple;
	bh=ZhwYC60cDfV2YQR6pVVvnX3GNGj1Ud3RiJBHIUzQ/i4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOlmc9yM890X0mfSt1KWaW5hHUNtWLbv7PXrxpbUOma1uFhjv84iTmIx2bX549eWKCw60eKkzySEwOaW3berRWSZg+UqpRgpDrTLkt0FstuTxOCK/1RDy9b46E9NRhHBS/ptYfzWqnmXB8DF4JE9EnTOjiarWQk100zr0AmVoRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CMxTWc9w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8AA6C072AA;
	Thu, 11 Apr 2024 14:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1712844573;
	bh=ZhwYC60cDfV2YQR6pVVvnX3GNGj1Ud3RiJBHIUzQ/i4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CMxTWc9w8qxO+A2at6JN6OjXGM1gRbZ3cZ3g+7xPsId0BzK9fGdMljb6LMMzuDCgb
	 1Lpwc/lh3G+rt/VpUdyIGdfki1rAF2zTQ84zEcXCJz92IfT4qz7x7flNf9ovqpAGzO
	 tr3QL7ySIzPJ5/on9JU54Z6WoLJvl9fmWr5XnKG4=
Date: Thu, 11 Apr 2024 16:09:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Hardening the parser during enumerations
Message-ID: <2024041116-unicorn-washbasin-ba17@gregkh>
References: <20240411124722.17343-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411124722.17343-1-oneukum@suse.com>

On Thu, Apr 11, 2024 at 02:42:58PM +0200, Oliver Neukum wrote:
> The parser we use to enumerate a new device has no hardening
> against nonsensical descriptors at all. This is a bit optimistic
> 

When it was written, we trusted hardware, all we had to do was get it
working properly as all USB devices were supposed to have passed the
USB-IF's validation before it got to us.

Right now, we barely trust USB descriptors, if we wish to change this
threat-model, that's great, but I think a lot of work is still to be
done as you prove here.

thanks,

greg k-h


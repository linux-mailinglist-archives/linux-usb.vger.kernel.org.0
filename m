Return-Path: <linux-usb+bounces-31090-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ED9C9A17F
	for <lists+linux-usb@lfdr.de>; Tue, 02 Dec 2025 06:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 053BC4E29EE
	for <lists+linux-usb@lfdr.de>; Tue,  2 Dec 2025 05:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389A82F693D;
	Tue,  2 Dec 2025 05:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NVhv+QcI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6D629BDA9;
	Tue,  2 Dec 2025 05:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764653352; cv=none; b=XgEZ2+aPIJsmBbt//L4XFfTTynMevz9JpFwpKtr63AlROZdZYNGWzcXxKdDP0G6CFCvhsy6UA3pq+byeaAtCoeDAOoGcqNIylbHNuHzondfy3Q3bYAJo0i2zI63rGvlVMGqGsttEDrNa0Il4kbojmwM+r+XEFwmrAzOmlIzt9uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764653352; c=relaxed/simple;
	bh=ePn68zIOv6CdcVw0/H5uUyEQ/xrEJ0Eubk/RpZUtfgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+4qoOQNYTG6gzPnWueaAIeW0Gs5QiaxApmKqMZbbKYm7iqREXkZwD5qlCMiw2WzFMm+xDAJFEaICPNRoWTjuNN6gw/gdsxpPwxxuW7AIqU63rwkIuVJm9oeJcZ5UJks2Dmi2W+AuisdO2wTu98njGonMy+/qZAAFkW9y88d+y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NVhv+QcI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA51EC113D0;
	Tue,  2 Dec 2025 05:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764653352;
	bh=ePn68zIOv6CdcVw0/H5uUyEQ/xrEJ0Eubk/RpZUtfgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NVhv+QcI6e1Jt5vkELc7OpTe9R8wjvbmbmvZbAlhDzDnocRJeZa2xXa3yd3Voh93b
	 5845dTyd5/O/g1iBdRFRnvE7eoQgflAvEbqVL0Om1EZS6GnIz3TTZs1Rbpap+XMrCb
	 tPFegbGxSqtEn88XKu4IhnJHX/1i2clAjhzezMfg=
Date: Tue, 2 Dec 2025 06:29:09 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Clint George <clintbgeorge@gmail.com>
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	khalid@kernel.org
Subject: Re: [PATCH v2 2/6] usb: gadget: dummy_hcd: use 'unsigned int'
 instead of bare 'unsigned'
Message-ID: <2025120202-wanted-swab-479a@gregkh>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
 <20251201203715.17768-1-clintbgeorge@gmail.com>
 <20251201203715.17768-3-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201203715.17768-3-clintbgeorge@gmail.com>

On Tue, Dec 02, 2025 at 02:07:11AM +0530, Clint George wrote:
> Use 'unsigned int' instead of 'unsigned' wherever possible to maintain
> consistency with the kernel coding style.
> ---
>  drivers/usb/gadget/udc/dummy_hcd.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Hm, this patch is kind of proof of why coding style cleanups outside of
drivers/staging/ is generally not a good idea :(

Please stick to that portion of the kernel now, so you can get the
development process understood more, before making changes elsewhere.

good luck!

greg k-h


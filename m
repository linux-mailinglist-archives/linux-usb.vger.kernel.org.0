Return-Path: <linux-usb+bounces-20420-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C36A2F21B
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2025 16:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 392D71887AC1
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2025 15:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFDF6225A25;
	Mon, 10 Feb 2025 15:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wk+BSLw+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412CC24BCFB
	for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2025 15:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739202706; cv=none; b=kV8yuRAM5DDTj1fe8r2pdx1RnM2sZunuMbPEgPR60NQZwDfNif8xY4+lj/zvnKZglT5r1D6gDgnoILj1cDRTQbeEqwineTBO+iIqIl74koZ0C1pbbAw6SWCwFChUF1dRMjMICkvA9yQSgLhzQO7HkmeYAlrMUwfFyr2VqfoYqrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739202706; c=relaxed/simple;
	bh=IR+HP+V5WPqTeT/J+8dQRKemoKl/k18774o0lt8HJIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ftp+KH6ARnsOmx2RGMYp+kBF3lIdAfqvtuEbormt7YT7PpXpIKHM8BB6FbiEg+muNo3+HbeyLFq0mN7zDBhkyFXgEN9+iMC5EZP0BPh7WGdmt0OcQy2YWpCo2/cr/TpBA5LXN5svh5gz6rf6qYaYUbs+2LtNP1leVHLM2Lv9zT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wk+BSLw+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C1BC4CED1;
	Mon, 10 Feb 2025 15:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739202705;
	bh=IR+HP+V5WPqTeT/J+8dQRKemoKl/k18774o0lt8HJIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wk+BSLw+p4ChJ19vV93EpmYgppeT65t4p35u5WRyvQjQIjhURs+zh4DGi4eF+2c/6
	 K1v2tbdIb5Szbe3NLfJVkzjNsPKvOByK9dj+KgkhTKh7j07I302itOLJuXF+MX3flV
	 MK9oCrBOhPit54tjIOYr3A8TruU8I/Ate9gHGi0w=
Date: Mon, 10 Feb 2025 16:51:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Matt Lee <matt@oscium.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] USB: max3421: Fix scheduling while atomic in
 max3421_remove()
Message-ID: <2025021031-pessimism-studied-99d3@gregkh>
References: <CABrMTje0ijdtcO31HmuSufxXFQO2Ay2Rh0_0Qc4FFC3zgqe-pA@mail.gmail.com>
 <2025021044-conjuror-captivity-619b@gregkh>
 <CABrMTjdJ6Xpwo2+oExb7i1jCuRJNb8tDJtov-xsnyiSoOxF-3w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABrMTjdJ6Xpwo2+oExb7i1jCuRJNb8tDJtov-xsnyiSoOxF-3w@mail.gmail.com>

On Mon, Feb 10, 2025 at 09:42:46AM -0600, Matt Lee wrote:
> The submitted patch fixes a crash we are experiencing on every shutdown.
> Perhaps the better solution is to remove the spin_lock_irqsave/restore?

Please don't top post.

Having a lock/unlock pair without anything in it can be used for
something (it's a gate primitive), but I don't think that it's being
used for that here.

> I tested removing the spin_lock completely and the crash issue was eliminated.
> Happy to update the patch if this is the preferred method.

Ideally fix the root issue in that this lock is needed to protect the
data here, so removing it doesn't actually fix the real problem, only
trade the crash for a race condition, right?

thanks,

greg k-h


Return-Path: <linux-usb+bounces-19415-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F57A13D26
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 16:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09DB7163029
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 15:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D9022AE75;
	Thu, 16 Jan 2025 15:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K/mssTjD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED751DD9AC;
	Thu, 16 Jan 2025 15:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737039782; cv=none; b=WC2bTctsG5iCl9UftyGBpf7C75axk6aGAbriQ0112pbulX0AxBB+4L6Mk6p/I93tbjPXd8TNNEpuacasyJP1G5NEgIVU5gVGcbd2Eg4RsxGfkUFG970JcbMeT39/L6mCjeVYT7R534bn0SqRbNSVS7w6WrN7u2eh2kP3Zr5osCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737039782; c=relaxed/simple;
	bh=RSivkfPn3uPsOvEF1NGjwlpMFMXrKr1RrLcNfU4XDIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OIlsFs93C5Qea6kySjk0Yheo8CDczs1OpRaD919gKHZUFm6T2wEAca977mkM2cuphJsq7RjLK0IvR7K2hExMrzHBVYEFgXml2U7lA0tcON68Qh+5Ratzlb4rhslfaENReKCD3ih+elmwKdROQJlWC+aW/KeEO5QMr/42ZTsKO4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K/mssTjD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E9C0C4CEE6;
	Thu, 16 Jan 2025 15:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737039782;
	bh=RSivkfPn3uPsOvEF1NGjwlpMFMXrKr1RrLcNfU4XDIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K/mssTjDHclAPCR2cRjzr7m/cD7WuGCkxMH5nVPvOekIzZxnPaUoDvxX6dwL9dLfo
	 kr6PqiDcxtJI5u5HIl2h5qrZfINSwDNMDi0wuKcEH8Pg7jO3ishuS+t2Gn8vuiVTfW
	 ozBASlrTcLrG8uOeaLk6hDAj+pqPWKmVRxAJ+HkSuyrIlU+ztGZhI5xTwdF7Hc29FS
	 HNpq0Y6H4K1+/env5ZzHadf31Lto1Xss1f37AVDjTiwYykvIB0b0cEHC5dggTWspCj
	 nxDHJxmiKoEUQQAkZr7Qqh3XFM5T7G3mEilCYivT554d4tt7gLd5mpOAS19z3YR4nr
	 WfIuN1HvkBGiA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tYROl-000000001zW-0ua8;
	Thu, 16 Jan 2025 16:03:07 +0100
Date: Thu, 16 Jan 2025 16:03:07 +0100
From: Johan Hovold <johan@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Corentin Labbe <clabbe@baylibre.com>, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	david@ixit.cz
Subject: Re: [PATCH 1/1 v7] usb: serial: add support for CH348
Message-ID: <Z4kfqwCrO6q6oqtL@hovoldconsulting.com>
References: <20240507131522.3546113-1-clabbe@baylibre.com>
 <20240507131522.3546113-2-clabbe@baylibre.com>
 <Zp5q5V_OnLAdvBrU@hovoldconsulting.com>
 <CAFBinCC9ftXxkyoiY=3ia6UubTeG-cHXa40ddd7WMNUhvVjr+g@mail.gmail.com>
 <Zp_WiocH4D14mEA7@hovoldconsulting.com>
 <CAFBinCATe+RXHz6Cy9cbo=vYL+qm_kz1qDTB8oL775xdgk=TYg@mail.gmail.com>
 <Z4aFSCnJTX2WHGY_@hovoldconsulting.com>
 <CAFBinCB4pDOoE9QCH966uyP0yaVm3CkAi3uncMqEDh19VSmbQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFBinCB4pDOoE9QCH966uyP0yaVm3CkAi3uncMqEDh19VSmbQw@mail.gmail.com>

On Tue, Jan 14, 2025 at 10:40:56PM +0100, Martin Blumenstingl wrote:

> > Not sure what Corentin has been preparing, but yeah, you need some kind
> > of deferred mechanism to make write() non-blocking and hold off sending
> > more data to the device until you're sure there's room in its buffers. I
> > guess a workqueue should do fine.

> We're currently testing an updated driver based on a workqueue
> (work_struct) and it's working fine.
> The issue that Corentin reported is unrelated to the workqueue part.
> At this point we're thinking it may be a regression in linux-next, but
> we're running more tests to verify this.

You don't need to test the driver against linux-next, rc7 should do just
fine for a driver like this.

Let's see what the new implementation looks like. Perhaps you don't even
need to use a workqueue (e.g. send off the single URB from the
completion callback when you get a notification that the transmitter has
emptied).

Johan


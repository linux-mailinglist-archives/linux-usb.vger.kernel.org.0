Return-Path: <linux-usb+bounces-9636-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 289948AE3F3
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 13:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E497B218E3
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 11:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914AE7E58E;
	Tue, 23 Apr 2024 11:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LFyBtinU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2EB762E8
	for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 11:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713871888; cv=none; b=YtRIhGlJ82W+hmOu+8sw0tfd1c6sIsrgMgXpdq7murrTL9nRpGBNmYDfaaIE/uRo5YRLQxrM8A9EZsWbX2Flhg96nP6bwvOPfB0E+27tVWe2A3n4nKeVTZP8CQKQxFnPnN71izmWUkXcIphjqH1o/U63NOb24MN6vZQmNmF9SRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713871888; c=relaxed/simple;
	bh=VyxlUtuDZtjJe0QjL6M2KeAfKaTc2qDe65cYnDIHI+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YfAhjwLt8M+i32ER+qrTIgMEVtka8G5VHGwR/s4mB/wkah20O3gqtVPdODbgBWdu4iPdQvn9DkHRdJWvTS0nxiXk6Sw7ZEXBz/MemwsGuNfiKxs2YUttt60JpJ7uTeRleyfp7C8/mui8ga4fjUcjARY/YYi3NcOBQ+qlbshXeks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LFyBtinU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47E5C116B1;
	Tue, 23 Apr 2024 11:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713871887;
	bh=VyxlUtuDZtjJe0QjL6M2KeAfKaTc2qDe65cYnDIHI+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LFyBtinUkBiCkt8J/cd7E756DjfIeOdNu73GHKhWtJmlBmtlnwWZtg44JyeaWkFBP
	 Kf7xSHzZg2DUkix1NmnDKN1lXWecvbfOUxhyTtxQXul2P5EsS+Js3p9KVElFDDL+1N
	 NSZunjPdjjSqsV2N3Q9DDQz02i13tXUNeKmoeiTM=
Date: Tue, 23 Apr 2024 13:31:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: bugzilla-daemon@kernel.org
Cc: linux-usb@vger.kernel.org
Subject: Re: [Bug 218762] New: USB string order in dmesg
Message-ID: <2024042351-county-proven-e8a7@gregkh>
References: <bug-218762-208809@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-218762-208809@https.bugzilla.kernel.org/>

On Mon, Apr 22, 2024 at 07:34:17PM +0000, bugzilla-daemon@kernel.org wrote:
> Is there any good reason why the code
> https://github.com/torvalds/linux/blob/c85af715cac0a951eea97393378e84bb49384734/drivers/usb/core/hub.c#L2361
> is declaring string (show_string) values in a different order than they are
> specified in dev_info?
> 
>         dev_info(&udev->dev,
>                 "New USB device strings: Mfr=%d, Product=%d,
> SerialNumber=%d\n",
>                 udev->descriptor.iManufacturer,
>                 udev->descriptor.iProduct,
>                 udev->descriptor.iSerialNumber);
>         show_string(udev, "Product", udev->product);
>         show_string(udev, "Manufacturer", udev->manufacturer);
>         show_string(udev, "SerialNumber", udev->serial);
> 
> 
> Now
> usb 4-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 4-1: Product: BM5100ADW series
> usb 4-1: Manufacturer: Pantum
> usb 4-1: SerialNumber: CK1A8823765
> 
> Expected
> usb 4-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 4-1: Manufacturer: Pantum
> usb 4-1: Product: BM5100ADW series
> usb 4-1: SerialNumber: CK1A8823765

No specific reaason, just has always been that way for 20+ years and no
one has noticed.


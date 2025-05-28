Return-Path: <linux-usb+bounces-24348-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FBCAC60CD
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 06:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCB0A4A383A
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 04:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7095B1C84AA;
	Wed, 28 May 2025 04:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mlSt5XKz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52074C9F
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 04:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748406956; cv=none; b=lIfgHcngx/LExLVdVGmW1c7sHGBQQdWZ37uY2sOdQyXSiiQGi7/1ryPRV6zF8MG75HNzwCEkTlg63a0EK0tYpagwLW427t+CP4uQTTzW0s3zxrwJcUvAsVtp6T7+Miyjc6hZUHV41K1W8wn8AT48RVuTW9+jhUOeC7nYxybsMAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748406956; c=relaxed/simple;
	bh=gcVVKtoTBKJT2QMHiYzxfdOWANOnr7z/wGTEKuoVdv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+uuV9HvPVTMYVTurHC2coemOhS4huVh6mn4wWWc2Y7cEtEC3yy3H4c9355x1fDHyDHGoTDdnI+dvPArwDEFoGCr2YD0sI7DtzrZi5hZcr63jcQ7b1ITWVxQeKzD7t+eqGRUo40B9Y+XBYyVbtSO5Z/zjMOaHo9wfnVigwQptwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mlSt5XKz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D12C4CEE7;
	Wed, 28 May 2025 04:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748406956;
	bh=gcVVKtoTBKJT2QMHiYzxfdOWANOnr7z/wGTEKuoVdv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mlSt5XKzX/7lPS5lVlpODyVQPXLxzQxi9XaeUZdBm3IimgrgwynvhWMP0l4batI1p
	 bd6PKX5niL8UGRu4AeqxxCHk0xvH6VnjddQO8rwEY4K5CRgAwHF6t+TwLXFs5IMkH+
	 U8lhORc6y0UYNfTOz51XHQnGZvcCXLYPOEBl+NK8=
Date: Wed, 28 May 2025 06:34:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Josh Cabarrus <joshcabarrus@gmail.com>
Cc: linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	balbi@kernel.org
Subject: Re: g_webcam UVC gadget causes USB\DEVICE_DESCRIPTOR_FAILURE on
 Windows 11
Message-ID: <2025052821-certified-remission-05fd@gregkh>
References: <CAD=osaSH51vGF_zq2ArWY-6jCuG0LfMO5guSE9mgGpc-YPWOtw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=osaSH51vGF_zq2ArWY-6jCuG0LfMO5guSE9mgGpc-YPWOtw@mail.gmail.com>

On Tue, May 27, 2025 at 08:48:20PM -0600, Josh Cabarrus wrote:
> Bug Report: g_webcam UVC gadget incompatible with Windows 11 USB
> descriptor validation

Has this ever worked in the past?  If so, what kernel versions did work,
and can you use git bisect to track down the offending commits?

If it has never worked, any patches to change the code to make it work
would be appreciated.

> Could the maintainers investigate updating g_webcam's USB descriptors
> to meet Windows 11's stricter validation requirements? The fact that
> g_serial works but g_webcam fails suggests this is a
> descriptor-specific issue rather than hardware or driver framework
> problem.

g_serial is trivial compared to g_webcam, so this is not really a fair
comparison.  What changed in windows 11 descriptor requirements?  Do you
have a pointer to the relevant documentation for where it is explained
what has changed?

And what exact descriptors are failing here?

> I can provide:
> 
> USB protocol analyzer captures
> Testing with different Windows versions

Did windows 10 work?

> Comparison with working UVC implementations

Great, that might be the simplest, what descriptors work, and what do
not?

thanks,

greg k-h


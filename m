Return-Path: <linux-usb+bounces-26978-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AE742B2A175
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 14:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B78184E2BA2
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 12:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3E031B138;
	Mon, 18 Aug 2025 12:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KKzOjQbJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3502131B10A
	for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 12:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519810; cv=none; b=haOQ6rN4ev2rCIGAv3vJtxH68w1fFFXzmbOehbaLnqIkDWNmZoMz4tbqDpyLCBeJZKNaoYyVpWLKNKsfd2KCwKBdu82qx25sbV8N1tpSW+Q7zfAbG4O8Y4rzyIV53U07Ka4pJ6SU1i7JQ5w7EIYQSJL43jXTevf0L96ZknWU9R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519810; c=relaxed/simple;
	bh=B7raxLLLwEn0umaOUlBOpkLw4JvN4SyLfOMJGI1q4dM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2qMOIw5H/zX7hvAHg9m+K6CkCcNOj1+BmwN8dVwQP0Z83SKVeSCiITzDBeIY236mHxAB9zmvPmklg3WTn95BFP6+GoMglb6o98ETsEAdxTblBQiwWML+JLwNfZ+sy6BWB1hDIk1r+JIztG2jIRRsH5NU5QtJI0euVGLO3z9Ix0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KKzOjQbJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59157C4CEF1;
	Mon, 18 Aug 2025 12:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755519809;
	bh=B7raxLLLwEn0umaOUlBOpkLw4JvN4SyLfOMJGI1q4dM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KKzOjQbJbS5HM6mgDGCG+9eS8iVHkrfNmAwptFq8FzvBZrXgbmh29lxUj/wVeT5mC
	 8mA5DAu1NPEZ3xQNrfrgNeU0wRzHMf8/g+iKKx+LE5EuzkMqUCzAEwlaT0jRv4nq4x
	 7FhV0rnunMvv8WbJw3Nv1/9V4GMkkrPH5i2i5lTY=
Date: Mon, 18 Aug 2025 14:23:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] drivers/usb/mon/mon_bin: Style fixes
Message-ID: <2025081811-taps-film-182d@gregkh>
References: <20250818121745.1160522-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250818121745.1160522-1-abarnas@google.com>

On Mon, Aug 18, 2025 at 12:17:45PM +0000, Adrian Barnaś wrote:
> Address various coding style issues reported by checkpatch.pl
> in drivers/usb/mon/mon_bin.c to improve adherence to kernel coding style.

Note, given the age of the USB code, there are many portions that do not
follow the "correct" coding style.  Same for many other kernel
subsystems.  It's generally not a good idea to attempt to clean them up
as it doesn't provide any real benefit, unless the subsystem maintainer
says it's ok.

Otherwise it's just a constant churn over time as new things get added
to checkpatch.pl.  If you want to work on coding style cleanups, please
do so in drivers/staging/ as that is explicitly where it is allowed to
do so.

thanks,

greg k-h


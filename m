Return-Path: <linux-usb+bounces-32370-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FF1D2292E
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 07:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 187D5306D502
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 06:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D022288C30;
	Thu, 15 Jan 2026 06:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TD0jhGBc"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4BC23815D;
	Thu, 15 Jan 2026 06:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768458958; cv=none; b=eygjUNwHnqVPraRsgCcXF4lqra28+WS0Cwsn7rGn+9QcDDqONdS583huiIka+6ub32OK+4et63G3GTeBRsMHWYmKl/NJEOQb7aC01OGI0chC7JoMfmBqxQboP3g3/oQczDzUZMV0YrPAW+RRJ39mPSJZ0iZCSZBj1ibFRVKtkmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768458958; c=relaxed/simple;
	bh=29M3jBqfG0onnD6EvV/o67UyGPziEJWmr/lvCnji4qY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRxd+WTkeQE7ffI2iG0uEjWJU8m7BaerdDyFmorNowCTRXAnNXifujjJWD44YaOg/PdCBpHPM99mOP736XaOi4Y9pBy7SS+0GEpmQm/K/5SxzzMkEY8bYjIZXxA4qoq9fzieHGtN6GKYnsKCHitGCxk0/68ozPEkqYUuJNsuuQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TD0jhGBc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FDF0C116D0;
	Thu, 15 Jan 2026 06:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768458958;
	bh=29M3jBqfG0onnD6EvV/o67UyGPziEJWmr/lvCnji4qY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TD0jhGBc82T5yQV2U/itzHWW/3tmjhtXTK1V8WekaecZaWrgaHCFAGix/fmnKUp+f
	 CdEZtbOgoiJeia1EH37681E0I6BOgz81PzsN9Tsx3irJC8VRQzdfaBWrWWfIegyj7E
	 xOiprkm5DwRgd1M+ZlGyFGGNkb0DXwHKnBP/2YvI=
Date: Thu, 15 Jan 2026 07:35:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?6b2Q5p+v5a6H?= <qikeyu2017@gmail.com>
Cc: pawell@cadence.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: cdns2: fix use-after-free in cdns2_gadget_giveback
Message-ID: <2026011551-illusion-footage-7841@gregkh>
References: <CALEuBamV3oXcTm1bE=m6O6XcXR=rrFaMgjaLyZqSOG2ghDDqqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALEuBamV3oXcTm1bE=m6O6XcXR=rrFaMgjaLyZqSOG2ghDDqqw@mail.gmail.com>

On Thu, Jan 15, 2026 at 04:32:21AM +0800, 齐柯宇 wrote:
> This fix addresses a use-after-free vulnerability discovered through
> static code analysis of the cdns2_gadget_giveback() function.

What tool was used for that?  Please always document it as per our
documentation.

thanks,

greg k-h


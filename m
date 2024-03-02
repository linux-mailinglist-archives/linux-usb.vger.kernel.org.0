Return-Path: <linux-usb+bounces-7438-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A941A86F20B
	for <lists+linux-usb@lfdr.de>; Sat,  2 Mar 2024 20:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67B8F1F21DAC
	for <lists+linux-usb@lfdr.de>; Sat,  2 Mar 2024 19:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 686DC3FE2A;
	Sat,  2 Mar 2024 19:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TJGY/QjH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CFF179BC
	for <linux-usb@vger.kernel.org>; Sat,  2 Mar 2024 19:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709406910; cv=none; b=ZZF+3r3FJCgHwdlCNGOsDoqyl6GmgZTtFWhlLujL9lmtdpnNk+4W/0N2jVprQo9Q6xP19ia8S1DaIc9XfWeDkqvbhvkk6+qH97TFyMWGxOWWF1e0Ep/MDsUZuwrS6wp+4wFK+G0nzDazHb5sP5NPRnQ7OIqxOgRFJ5MvroRCZHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709406910; c=relaxed/simple;
	bh=318OP+Gw/WTNq8ofifh3rzLgiThlBVtHz6v22UAgE7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=upIjDHChCqTToXqMcmLaWsPYnlg0CEOYI6tKlDE4a0m5K/DUUp8ht4baq5spdRmQhSy9sgPu4yp5vI2mWepIaNbDuUtijGKOciC1dwuAjC2J4v+qMWivqmOoZ8eBe+jPQ5CEBQ5gAzajMIdXSNAlbPssxG+Q0j21XR4hXdkSBAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TJGY/QjH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C66C433F1;
	Sat,  2 Mar 2024 19:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709406909;
	bh=318OP+Gw/WTNq8ofifh3rzLgiThlBVtHz6v22UAgE7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TJGY/QjHoQq+9hn/c5CqSW0Xr6uY3Vo+ZZ5pA486uwDLChEpmOMCf0Qx6J7uRQ8ze
	 UCIgFm1tGO2pzlIKinQZ133lkfFW6n3jd3ihQZyoDWT/n7cms6QBdkCmhP/Y6N93Mi
	 jt2POJTeC3yKPhwa9UOnNYCb1ZitfnLx/ASjmR30=
Date: Sat, 2 Mar 2024 20:14:32 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt changes for v6.9 merge window
Message-ID: <2024030223-dispose-recharger-1676@gregkh>
References: <20240229101109.GG8454@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229101109.GG8454@black.fi.intel.com>

On Thu, Feb 29, 2024 at 12:11:09PM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> [Sending this one early as I will be out-of-office next week.]
> 
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.9-rc1

Pulled and pushed out, thanks.

greg k-h


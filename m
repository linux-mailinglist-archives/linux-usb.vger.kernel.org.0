Return-Path: <linux-usb+bounces-7437-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACDB86F1F3
	for <lists+linux-usb@lfdr.de>; Sat,  2 Mar 2024 19:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C98C1C21366
	for <lists+linux-usb@lfdr.de>; Sat,  2 Mar 2024 18:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650C33EA96;
	Sat,  2 Mar 2024 18:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bJ0GRQt0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCF833CD1
	for <linux-usb@vger.kernel.org>; Sat,  2 Mar 2024 18:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709405247; cv=none; b=qfEWtUo0hZnDV1cKjEDwO3TUHG9d2VxaeWDcQ1Eu71rWvOE/CsgrTToKNfI+3BKMI7Y9/Smg4HetM1O9pZeXzjw+tu+UPfnSwEsiC4hgipPSjLhL/9Ob+mUpGccxqq4c5g7a+aR1hgI1yEfJMaQVVfB1sVVibfGHxJlpgaUbr1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709405247; c=relaxed/simple;
	bh=nfyeuKJKUpwzZFtNUg+/oDOvCGHK39YhLZo/z0h3HVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PkD4GTY9OQ5cIx4qEV8+VZUZ9dQPZyaC5VIxW192Kfde2Jhmgu8fPjnbVjOR1MmEeP5WCmFPqbsqi43x3AjFdznLM4GOrNoeoYqXc1WAWrstxe4KI3+DzfRyGU/tjmlqx5+drY23YCTWnga/IlhkqM7ieHU/BMvbTvZKItMpICk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bJ0GRQt0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA59AC433C7;
	Sat,  2 Mar 2024 18:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709405247;
	bh=nfyeuKJKUpwzZFtNUg+/oDOvCGHK39YhLZo/z0h3HVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bJ0GRQt06Y4BPZxzZ5MnzOOiG3TqSmMrr1N+ePLuhRk7apkhrDj9SvfBFhlZkmP2U
	 QSRwvPOyDES4S11bEUC9QDMFAg/sFbRLR0tNgMDvhaw4C4WPaPWtLBcssbr84XqaQo
	 ql76CWirPkNfK9M2SlsJb+g0hVcsNh1bF81Z7SdY=
Date: Sat, 2 Mar 2024 19:47:24 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt fix for v6.8-rc7
Message-ID: <2024030214-unsorted-senorita-6523@gregkh>
References: <20240226093826.GB8454@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226093826.GB8454@black.fi.intel.com>

On Mon, Feb 26, 2024 at 11:38:26AM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 841c35169323cd833294798e58b9bf63fa4fa1de:
> 
>   Linux 6.8-rc4 (2024-02-11 12:18:13 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.8-rc7

Pulled and pushed out, thanks.

greg k-h


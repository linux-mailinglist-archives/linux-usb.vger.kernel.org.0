Return-Path: <linux-usb+bounces-17323-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1C69C09BB
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 16:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C94E1F24DB7
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 15:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7821212F08;
	Thu,  7 Nov 2024 15:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qWa8bTl2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CA72101A4
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 15:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730992367; cv=none; b=Ku8ROQMDjM1N3gIDB7vdOftU26qe9po4iWFxsCIw8M5D047umSOQwhR5/zkTPwIWih+kv+ZivGAHiw5/WkRlGQb683vH3SRLYkDDSFdQ6Oumz+WG8khft2ZIoAQiRdJ6TTPjmyhWog3VYfD9t8No/ZPt+9faCMnXacxcnxH9IvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730992367; c=relaxed/simple;
	bh=dl4oEA9i9EQSliQJsLEURXTSANg1jJMDc4U1ZF4te5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rq0yjjsoDd6rpOISHfp/8ltJc2edtwswvvJlnJZOXBd2+EC70oYPFzER6KEhnBRT5u8gLF2QKkYaB7aconcoSLmQdhtwSEh7Y4C5DWGrpg26r11mPipa/epATBf7PyuMb0lDLh+IgARA6O0+ck3DMGSraQbBFWzf/kp9Tm/fZEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qWa8bTl2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84770C4CECC;
	Thu,  7 Nov 2024 15:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730992366;
	bh=dl4oEA9i9EQSliQJsLEURXTSANg1jJMDc4U1ZF4te5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qWa8bTl20iYuZZ3ivqGx/eL/kCBQKGvF8nW3aWq6g+uoHg1fOvR+/QmfJ/WiMLsX0
	 s6Qx+w0qqp3rQQP/cFNSguVRdZucGoIyonQG1Dm3TdeemRRK2XTCPmEjwEc1EUi9vv
	 aTbZzHtiKmeD/RGQcvRjTdFdFPd7N+M79Cb3tNGI=
Date: Thu, 7 Nov 2024 16:12:27 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt fixes for v6.12-rc7
Message-ID: <2024110719-fester-captivity-bd88@gregkh>
References: <20241107095747.GM275077@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107095747.GM275077@black.fi.intel.com>

On Thu, Nov 07, 2024 at 11:57:47AM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 81983758430957d9a5cb3333fe324fd70cf63e7e:
> 
>   Linux 6.12-rc5 (2024-10-27 12:52:02 -1000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.12-rc7

Pulled and pushed out, thanks.

greg k-h


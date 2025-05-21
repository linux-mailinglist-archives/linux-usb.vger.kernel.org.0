Return-Path: <linux-usb+bounces-24150-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C86ABF18C
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 12:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05B9C7A6193
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 10:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731DB25C802;
	Wed, 21 May 2025 10:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DT0vlRUl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED758248F49
	for <linux-usb@vger.kernel.org>; Wed, 21 May 2025 10:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747823265; cv=none; b=JZ0dGgxGiCffmwP+dp5DAXiRQSvnwt+YV/z9zJILSh6d1gjhA2v2yelbUpor0L5TtFrY2oPZ4lVhhMjPLA1kX0x6oRas1zU5FfDYx3B7dKZtW6ZfZz41T2iivJbpnZqxeAYX9E/PiM1wgLV6t9NrBOxK9GW5pd6iHmDoLTDONLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747823265; c=relaxed/simple;
	bh=VG1EI91mFyCpQCBk3C4loJJyW0wPNY+eS0LqlwYwe/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVXRAbxlniuL7NqHPS7ZL2L+1DmMC+elv63NZTtsj0zKIPwQiw5xeAV+cINlxvYIlN2WOJJM+evHy36q6VzW/IEL7cKYC8i/L9iPnG3ZneZHm5vWn1vCYikv2tHBjjL8vjiAkgKQY+uuA7ttGR5Zq3rSzEkOl5712YnKTRO/gpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DT0vlRUl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C983C4CEEF;
	Wed, 21 May 2025 10:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747823264;
	bh=VG1EI91mFyCpQCBk3C4loJJyW0wPNY+eS0LqlwYwe/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DT0vlRUlcsN5O4pKya+Kfy/PjFV/QXMMrwRwaT9KgcJxmMp+0/27Kr588oYMm3RkA
	 +L36FJ0ZY0IFyDXjk8oUHx3FtXwArsIvcvVYNg9w4pfzu4ZjZ7ITcVgzcDNfK5ru6t
	 gnPY9TVTwfbn7wDkngqrT22cIIYlU4fEgW6eV++E=
Date: Wed, 21 May 2025 12:27:25 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt changes for v6.16 merge window
Message-ID: <2025052112-headway-neuron-e777@gregkh>
References: <20250520101645.GH88033@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520101645.GH88033@black.fi.intel.com>

On Tue, May 20, 2025 at 01:16:45PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.16-rc1

Pulled and pushed out, thanks.

greg k-h


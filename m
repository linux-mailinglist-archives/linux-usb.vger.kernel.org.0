Return-Path: <linux-usb+bounces-24151-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3A7ABF18F
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 12:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41EC87A4778
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 10:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F9F25C802;
	Wed, 21 May 2025 10:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XLE43J7G"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F7923099F
	for <linux-usb@vger.kernel.org>; Wed, 21 May 2025 10:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747823288; cv=none; b=BpdWC+I+ClHBLlctT76h4+ItKajUq30q7mtOnqldnOkuo/I2/AeCsueE8skdkghjxGlP2uBOEWC+sR1Cd1p5cy7vJtGiHU6gJVUiubXPLYpcavlN8jwC6zk++fp3g+bRF2a4HybA0DwioEkrlWbzIIVZmXp0t53SGCba/EXa6Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747823288; c=relaxed/simple;
	bh=GVZrbbcIxnAdHtcbkc5iEuh9aU42Pj4xTNWIcwgp430=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ghWW3/kYjHVKhIBG1ci8zsePXS/9CKgSpSFJ7w/rX6Kq4s298vlzozHc0DgWk32FB2xbEQk0tI17rZxrGymNv3RMAGDtFPOs+TKt5yYsc1by4vxM3LLZOseldWoIrAufatHOEo0DSZDtRG5i7xyVoctaxL8QxPmCw57ssiFSmQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XLE43J7G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 602EFC4CEE4;
	Wed, 21 May 2025 10:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747823287;
	bh=GVZrbbcIxnAdHtcbkc5iEuh9aU42Pj4xTNWIcwgp430=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XLE43J7Gllw+NG6OwJ1yaL13NH7qAcB/YSBq1WBdwqY6s8VUmXLZbDz+4oUTfhSMU
	 3Umf+CHZDIeIZh0j0JVu5Qjg59RBIj/9IDUq0EEZrpu7Tv5hWU6DR7XsImjIdoyFNW
	 e6hAUYnpyJPWbIs6gyxbgL9Jn0NssUhEMGcfyeW4=
Date: Wed, 21 May 2025 12:28:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt fix for v6.15-rc7
Message-ID: <2025052127-supermom-radish-5b37@gregkh>
References: <20250513145638.GM88033@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513145638.GM88033@black.fi.intel.com>

On Tue, May 13, 2025 at 05:56:38PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb:
> 
>   Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.15-rc7
> 
> for you to fetch changes up to 0f73628e9da1ee39daf5f188190cdbaee5e0c98c:
> 
>   thunderbolt: Do not double dequeue a configuration request (2025-05-09 12:14:25 +0300)

It's too late for my branch to get stuff into -final, sorry, I was
traveling last week.  I'll take this now and get it into -rc1 and then
backport to the needed stable trees.

thanks,

greg k-h


Return-Path: <linux-usb+bounces-3264-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 538C67F6591
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 18:37:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E03F281455
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 17:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE0F405DE;
	Thu, 23 Nov 2023 17:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rQ/FIbgp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB14405E4
	for <linux-usb@vger.kernel.org>; Thu, 23 Nov 2023 17:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D683BC433C9;
	Thu, 23 Nov 2023 17:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700761018;
	bh=C8UA/rmJkwKNOvA+j0N7u0n3ZpA0Xbr76wwlbqBsBgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rQ/FIbgpYTwbh6hw5SDTMFcgqTknmvhiZWwTmNEjSOqDzdGz/GOguYK8as75M+R5Y
	 tozsk4RqjHmYiAtheR+y49B33Mw6f9Ebgnm2HbXktnwNX9FxrgsdaDi9UpNfOIN4+w
	 ruP8E+dJJV6qya7wMrQcw7rlaDePHNxYg3iZeWfWKUvWfvvF2OsJGZR+vsOXW/MJIr
	 8QC8MNtlCqMmZT7wuV5q1virzvelLiII/qUflUjnRro92jTpb5GW6X+NXos5NXaoO5
	 LQfWoUuB2sCsEeXR/+bMZPDSP0HyGQceeg2Z//j9uNKktMXFTZ85zbV1QryCX1+jHt
	 KFhjDIispc5hA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r6Ddc-0006zw-1v;
	Thu, 23 Nov 2023 18:37:17 +0100
Date: Thu, 23 Nov 2023 18:37:16 +0100
From: Johan Hovold <johan@kernel.org>
To: Asuna Yang <spriteovo@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: Re: [PATCH v2] USB: serial: option: add Luat Air72*U series products
Message-ID: <ZV-NzHAcmfpVmG5w@hovoldconsulting.com>
References: <20231122141803.82844-1-SpriteOvO@gmail.com>
 <ZV9BaBBrn78i0x64@hovoldconsulting.com>
 <921fc036-7ebb-43cf-b4a3-de7a7c993bbf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <921fc036-7ebb-43cf-b4a3-de7a7c993bbf@gmail.com>

On Fri, Nov 24, 2023 at 01:03:46AM +0800, Asuna Yang wrote:
> If#= 2: AT
> If#= 3: PPP + AT
> If#= 4: Debug
> 
> Reference from the device documentation:
> https://doc.openluat.com/wiki/21?wiki_page_id=2501

Thanks for the details.

> Should I send a v3 to include the serial interfaces information in the 
> git message? This is my first time sending a patch to the kernel, please 
> forgive me for not being particularly sure of the process.

No, that's ok, I can just amend the commit message when applying.

For your next contribution, just keep in mind that top-posting should be
avoided when replying on the mailing lists (instead reply inline after
trimming unnecessary context as I did here).

And congratulations on your first merged kernel patch. :)

Johan


Return-Path: <linux-usb+bounces-4632-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D311821C8A
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jan 2024 14:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB0B9B2162E
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jan 2024 13:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23ECAFBE4;
	Tue,  2 Jan 2024 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Efuu0tnA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79828FBE1
	for <linux-usb@vger.kernel.org>; Tue,  2 Jan 2024 13:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68261C433C8;
	Tue,  2 Jan 2024 13:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704201976;
	bh=dqTMLpR8Ro8LGSOozsItv2spwR/NNtMT8KKVaoD2KGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Efuu0tnA0n0M2d8X1zpsV8RFvw2wr1B84GBcDrDeo0VYzQnCzaihTUaMPYkWr6jpM
	 s4RtImAK5Vtz+9ZYNbEDeUAriW78fT2CuEJCYWGmaJhzRaPIR8C54XFGV/Em3KZciy
	 oFkHGfd0HIEizsmT1QRTMObWd6UjLx0nlWi/iorU=
Date: Tue, 2 Jan 2024 14:25:34 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt changes for v6.8 merge window
Message-ID: <2024010227-dean-placate-68c6@gregkh>
References: <20240102123954.GK2543524@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102123954.GK2543524@black.fi.intel.com>

On Tue, Jan 02, 2024 at 02:39:54PM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.8-rc1

Pulled and pushed out,

greg k-h


Return-Path: <linux-usb+bounces-3179-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5554F7F4579
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 13:11:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9293B2114D
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 12:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87AC918E1F;
	Wed, 22 Nov 2023 12:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fGM/+aX9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84754BA95
	for <linux-usb@vger.kernel.org>; Wed, 22 Nov 2023 12:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E38FC433C7;
	Wed, 22 Nov 2023 12:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700655103;
	bh=sMXBeQjJa1nV4FIPkndlU8+ax8tszfpfgx7UkTZwhDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fGM/+aX9Y7vyAhG9pGPSbIgrWaIcBx8fWQVOddFz+HzCSCz4gPdYzObYgNP0VPJLr
	 VYHXZEy4LF+cGt/0LCGZJ9EQ9E9XqshwmFmkQLZS+TRGr6IDJOTNjuO3P1NIzx8ZTN
	 3frYBETZp6NbpBPBdrfjiT06yntHvge44/Gl9SyY=
Date: Wed, 22 Nov 2023 12:11:39 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
	Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] usb: misc: ljca: Fix enumeration error on Dell
 Latitude 9420
Message-ID: <2023112217-audacious-eccentric-3522@gregkh>
References: <20231121203205.223047-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121203205.223047-1-hdegoede@redhat.com>

On Tue, Nov 21, 2023 at 09:32:05PM +0100, Hans de Goede wrote:
> Not all LJCA chips implement SPI and on chips without SPI reading
> the SPI descriptors will timeout.
> 
> On laptop models like the Dell Latitude 9420, this is expected behavior
> and not an error.
> 
> Modify the driver to continue without instantiating a SPI auxbus child,
> instead of failing to probe() the whole LJCA chip.
> 
> Fixes: acd6199f195d ("usb: Add support for Intel LJCA device")
> Cc: stable@vger.kernel.org

Nit, stable is not needed as the above commit only ended up in 6.7-rc1,
nothing older.  I'll drop it when I queue this up, thanks!

greg k-h


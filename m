Return-Path: <linux-usb+bounces-14056-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6E595E327
	for <lists+linux-usb@lfdr.de>; Sun, 25 Aug 2024 13:45:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1AB21F2186D
	for <lists+linux-usb@lfdr.de>; Sun, 25 Aug 2024 11:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A465913D525;
	Sun, 25 Aug 2024 11:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="r4QqL+ET"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8522B9D4;
	Sun, 25 Aug 2024 11:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724586330; cv=none; b=ruKp/s1kmXK8onHB2Ny2/HSnFgAKrEfK9NSoT1CVaOJ3HZ/kKEnz3Z5eOTW8Q9lRcGq8Mofw7jNBzb1UasT6vsLqjsfkvjdJgiDbyj4tNV/+/mE6Y+5DWPIteU1v9PDE33U21JGmEI6V691oHlkugIu131QwBIrdwyFE7gmbYLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724586330; c=relaxed/simple;
	bh=RrEWQwic0Pw0VGW3kWVimwyowlR2JbDGl3M5gx2prCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tymuGZX16w0hTLf/wAIFZ926502TbqFp8JXvYPiGmV5w8cNWIRuiYCkGKEjiMfTbDKWZu3w6HoEiOb779V7Cy7tRfrOaeoCrajtoQ6H6Sgxd9zaKQPbPrSwYL+7PVeaTqyZQ1gBeznPwur3Jy8ZjB4x/Z30OD7tgYkcGEuO/EYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=r4QqL+ET; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31BF7C32782;
	Sun, 25 Aug 2024 11:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724586329;
	bh=RrEWQwic0Pw0VGW3kWVimwyowlR2JbDGl3M5gx2prCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r4QqL+ETmam2vsTtTy98XpPuvGGOLJiWAH9QFxewDDtep2pfqm5Kyw1mEA75CtfAa
	 uSEgK3gmBJj5Rsux8n3qnUppmUivovc9U32NBZ+xOrB4blwZ+CaCsYgLZFxQVKocLO
	 cZpjFcQkfn/it0ZKAESzDiQpqHWMZE69DuEtxET4=
Date: Sun, 25 Aug 2024 13:45:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org
Subject: Re: [usb:usb-testing 20/25]
 drivers/usb/misc/onboard_usb_dev.c:329:15: error: implicit declaration of
 function 'i2c_smbus_write_block_data'
Message-ID: <2024082503-uncoated-chaperone-7f70@gregkh>
References: <202408242231.WOLALxi9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202408242231.WOLALxi9-lkp@intel.com>

On Sat, Aug 24, 2024 at 10:53:53PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> head:   9a03b9a88e4a44e358e3638736286442ae262497
> commit: 7b5e970ff0e58f9239226fe81c77d5b98d744986 [20/25] usb: misc: onboard_usb_dev: add Microchip usb5744 SMBus programming support
> config: arc-randconfig-001-20240824 (https://download.01.org/0day-ci/archive/20240824/202408242231.WOLALxi9-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240824/202408242231.WOLALxi9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408242231.WOLALxi9-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/usb/misc/onboard_usb_dev.c: In function 'onboard_dev_5744_i2c_init':
> >> drivers/usb/misc/onboard_usb_dev.c:329:15: error: implicit declaration of function 'i2c_smbus_write_block_data' [-Werror=implicit-function-declaration]
>      329 |         ret = i2c_smbus_write_block_data(client, 0, sizeof(wr_buf), wr_buf);
>          |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
> >> drivers/usb/misc/onboard_usb_dev.c:333:15: error: implicit declaration of function 'i2c_smbus_write_word_data' [-Werror=implicit-function-declaration]
>      333 |         ret = i2c_smbus_write_word_data(client, USB5744_CMD_CREG_ACCESS,
>          |               ^~~~~~~~~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors

I'll drop this series from my tree, please fix up and resend.

thanks,

greg k-h


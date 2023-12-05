Return-Path: <linux-usb+bounces-3744-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9B4805B38
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 18:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D5A21C20FB6
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 17:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69E768B73;
	Tue,  5 Dec 2023 17:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fvFKOWyw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F092E68B68
	for <linux-usb@vger.kernel.org>; Tue,  5 Dec 2023 17:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87157C433C8;
	Tue,  5 Dec 2023 17:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701797776;
	bh=fZJBVThzrr7Cpbt4r+c/0aCx8e5OR3GiRs46lYXo1Fs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fvFKOWywnSl9+/f0Gh5AAWEcg1w/ig2d93V+HiVVrEHOGeL+dt1MOFMaiV5g26UO+
	 5G6XH2aMAT2kW9OVIK2R/SuorcoiLwT7/YymLpVBHIL7DYqjL6rFzMYD53OHywhp7/
	 /SUaOtvkqhgDSwcCXZvbNa4ftY/23akJsW6Gq1zE=
Date: Wed, 6 Dec 2023 02:36:10 +0900
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kernel test robot <lkp@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [usb:usb-linus] BUILD REGRESSION
 b17b7fe6dd5c6ff74b38b0758ca799cdbb79e26e
Message-ID: <2023120635-devotee-plank-3278@gregkh>
References: <202312052256.y5R3B4ix-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202312052256.y5R3B4ix-lkp@intel.com>

On Tue, Dec 05, 2023 at 10:07:58PM +0800, kernel test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
> branch HEAD: b17b7fe6dd5c6ff74b38b0758ca799cdbb79e26e  usb: typec: class: fix typec_altmode_put_partner to put plugs
> 
> Error/Warning ids grouped by kconfigs:
> 
> gcc_recent_errors
> |-- sparc-allmodconfig
> |   `-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used
> |-- sparc-allnoconfig
> |   |-- arch-sparc-kernel-traps_32.c:error:no-previous-prototype-for-trap_init
> |   |-- arch-sparc-lib-cmpdi2.c:error:no-previous-prototype-for-__cmpdi2
> |   |-- arch-sparc-lib-ucmpdi2.c:error:no-previous-prototype-for-__ucmpdi2
> |   |-- arch-sparc-mm-leon_mm.c:error:variable-paddrbase-set-but-not-used
> |   `-- arch-sparc-mm-srmmu.c:error:variable-clear-set-but-not-used
> |-- sparc-defconfig
> |   |-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used
> |   |-- arch-sparc-kernel-traps_32.c:error:no-previous-prototype-for-trap_init
> |   |-- arch-sparc-lib-cmpdi2.c:error:no-previous-prototype-for-__cmpdi2
> |   |-- arch-sparc-lib-ucmpdi2.c:error:no-previous-prototype-for-__ucmpdi2
> |   |-- arch-sparc-mm-leon_mm.c:error:variable-paddrbase-set-but-not-used
> |   `-- arch-sparc-mm-srmmu.c:error:variable-clear-set-but-not-used
> |-- sparc-randconfig-001-20231205
> |   `-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used
> |-- sparc64-allmodconfig
> |   `-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used
> |-- sparc64-allyesconfig
> |   `-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used
> `-- sparc64-defconfig
>     `-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used

Odd, why are errors for changes that are NOT from this branch triggering
the bot to report them here as if they came from this branch?

thanks,

greg k-h


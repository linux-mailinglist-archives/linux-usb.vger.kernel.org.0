Return-Path: <linux-usb+bounces-28-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C2A79FDA3
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 09:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07C4C1F2149D
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 07:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F3ECA59;
	Thu, 14 Sep 2023 07:57:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431C4C8E7
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 07:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01827C433C7;
	Thu, 14 Sep 2023 07:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694678225;
	bh=2ufj/dkiu5C9aI9VOV15kVL199L5WrTgWHf+hb5IyTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hdT4bhltQEOObibgTe1UKoo0kHa563R3jH6g3lldaEO0pdCibFT6JexrMfgtDyCjk
	 zWnF1cZsnmanR82cmHDXMGSqoqzYSLjFimV+8MBgTjsf58thSdJRO1TL63bZFye3vI
	 Fq3vqyV2Gzlz9hgnCQg1LR82MZbcAYco0OJREyjZmjBfuF8MzK2j1pRjiNhmBwIeep
	 pf1flpeoFzmd5MmAWO8OnNcMygN3mvKK/8R0xkUDSTI9AcJAeZ8tmXBDsCVpZ/0lKE
	 1fssy50g3jgAFaXpAilGNljeBDWEcS/vXnpzk5sUIKRaOtQlOBi2hO0OTQ+6B3XV7Q
	 3FXzrKtuu/G/g==
Date: Thu, 14 Sep 2023 09:56:57 +0200
From: Christian Brauner <brauner@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christoph Hellwig <hch@lst.de>, Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	Tejun Heo <tj@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna@kernel.org>, Kees Cook <keescook@chromium.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Naohiro Aota <naohiro.aota@wdc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-hardening@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: Re: [PATCH 03/19] fs: release anon dev_t in deactivate_locked_super
Message-ID: <20230914-zielt-einzog-00389009b293@brauner>
References: <20230913111013.77623-1-hch@lst.de>
 <20230913111013.77623-4-hch@lst.de>
 <20230913232712.GC800259@ZenIV>
 <20230914023705.GH800259@ZenIV>
 <20230914053843.GI800259@ZenIV>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230914053843.GI800259@ZenIV>

> BTW, this part of commit message in 2c18a63b760a is rather confused:
>     Recent rework moved block device closing out of sb->put_super() and into
>     sb->kill_sb() to avoid deadlocks as s_umount is held in put_super() and
>     blkdev_put() can end up taking s_umount again.
> 
> That was *NOT* what a recent rework had done.  Block device closing had never
> been inside ->put_super() - at no point since that (closing, that is) had been
> introduced back in 0.97 ;-)  ->put_super() predates it (0.95c+).

I think the commit message probably just isn't clear enough. The main
block device of a superblock isn't closed in sb->put_super(). That's
always been closed in kill_block_super() after generic_shutdown_super().

But afaict filesystem like ext4 and xfs may have additional block
devices open exclusively and closed them in sb->put_super():

xfs_fs_put_super()
-> xfs_close_devices()
   -> xfs_blkdev_put()
      -> blkdev_put()

ext4_put_super()
-> ext4_blkdev_remove()
   -> blkdev_put()


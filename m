Return-Path: <linux-usb+bounces-581-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F347AE947
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 11:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id 7F83DB20995
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 09:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B519134C7;
	Tue, 26 Sep 2023 09:31:37 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F8712B95;
	Tue, 26 Sep 2023 09:31:35 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29D50BE;
	Tue, 26 Sep 2023 02:31:34 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1A2D668AA6; Tue, 26 Sep 2023 11:31:30 +0200 (CEST)
Date: Tue, 26 Sep 2023 11:31:29 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christian Brauner <brauner@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>,
	Heiko Carstens <hca@linux.ibm.com>,
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
Message-ID: <20230926093129.GA13806@lst.de>
References: <20230913111013.77623-1-hch@lst.de> <20230913111013.77623-4-hch@lst.de> <20230913232712.GC800259@ZenIV> <20230914023705.GH800259@ZenIV> <20230914053843.GI800259@ZenIV> <20230914-zielt-einzog-00389009b293@brauner>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914-zielt-einzog-00389009b293@brauner>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Sep 14, 2023 at 09:56:57AM +0200, Christian Brauner wrote:
> > BTW, this part of commit message in 2c18a63b760a is rather confused:
> >     Recent rework moved block device closing out of sb->put_super() and into
> >     sb->kill_sb() to avoid deadlocks as s_umount is held in put_super() and
> >     blkdev_put() can end up taking s_umount again.
> > 
> > That was *NOT* what a recent rework had done.  Block device closing had never
> > been inside ->put_super() - at no point since that (closing, that is) had been
> > introduced back in 0.97 ;-)  ->put_super() predates it (0.95c+).
> 
> I think the commit message probably just isn't clear enough. The main
> block device of a superblock isn't closed in sb->put_super(). That's
> always been closed in kill_block_super() after generic_shutdown_super().

Yes.

> But afaict filesystem like ext4 and xfs may have additional block
> devices open exclusively and closed them in sb->put_super():
> 
> xfs_fs_put_super()
> -> xfs_close_devices()
>    -> xfs_blkdev_put()
>       -> blkdev_put()
> 
> ext4_put_super()
> -> ext4_blkdev_remove()
>    -> blkdev_put()

Yes.


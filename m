Return-Path: <linux-usb+bounces-22-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C01DA79F848
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 04:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E89E91C20D18
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 02:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E93EDF;
	Thu, 14 Sep 2023 02:37:21 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420917F
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 02:37:20 +0000 (UTC)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC711AD;
	Wed, 13 Sep 2023 19:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Fs/ieUOzEj1DJJnuPdJynyuGwhVwUzz6eMOmGXh2XPQ=; b=vBih36PvMGvnigKKwMXXuftKUm
	bYcVHZyAzBZCyqMevOmqSWtLZg2ga4FS6u6ULYpQO3TNkDQU6H93nz4MSoC8eE9AXX8WAxQ4wHrxI
	fBC9SZ2pPwXrA4yp0O4VXrx6YaQWlugot2bohWBlp9zlxPblr/FiBvD8vO3bfw5d6dP2zseW3jz1V
	m2Gh9lj+iFNTDfhyCT+Of+gfxYQZwXh4TqAJfw+oct0OfwY3azttfnGHHFxgpMMtGFo6KvTNh+i5H
	lTWX/TJIRrRMQdcGH3EwRli2Jq6Q+HGtL2uJYF2BQDL8jgKjpYninzye6ZXaw6y/iFEpUxfTTJv5+
	NZajqC7w==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qgcE5-005tvI-16;
	Thu, 14 Sep 2023 02:37:05 +0000
Date: Thu, 14 Sep 2023 03:37:05 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>,
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
Message-ID: <20230914023705.GH800259@ZenIV>
References: <20230913111013.77623-1-hch@lst.de>
 <20230913111013.77623-4-hch@lst.de>
 <20230913232712.GC800259@ZenIV>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913232712.GC800259@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, Sep 14, 2023 at 12:27:12AM +0100, Al Viro wrote:
> On Wed, Sep 13, 2023 at 08:09:57AM -0300, Christoph Hellwig wrote:
> > Releasing an anon dev_t is a very common thing when freeing a
> > super_block, as that's done for basically any not block based file
> > system (modulo the odd mtd special case).  So instead of requiring
> > a special ->kill_sb helper and a lot of boilerplate in more complicated
> > file systems, just release the anon dev_t in deactivate_locked_super if
> > the super_block was using one.
> > 
> > As the freeing is done after the main call to kill_super_notify, this
> > removes the need for having two slightly different call sites for it.
> 
> Huh?  At this stage in your series freeing is still in ->kill_sb()
> instances, after the calls of kill_anon_super() you've turned into
> the calls of generic_shutdown_super().
> 
> You do split it off into a separate method later in the series, but
> at this point you are reopening the same UAF that had been dealt with
> in dc3216b14160 "super: ensure valid info".
> 
> Either move the introduction of ->free_sb() before that one, or
> split it into lifting put_anon_bdev() (left here) and getting rid
> of kill_anon_super() (after ->free_sb() introduction).

Actually, looking at the final stage in the series, you still have
kill_super_notify() done *AFTER* ->free_sb() call.  So the problem
persists until the very end...


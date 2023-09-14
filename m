Return-Path: <linux-usb+bounces-87-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E01CA7A0E30
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 21:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77F9F1F244DC
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 19:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED34F266AF;
	Thu, 14 Sep 2023 19:23:55 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051CB15EB7
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 19:23:53 +0000 (UTC)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17E2026B3;
	Thu, 14 Sep 2023 12:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4hr36i5Cv0yOjN7Qm9aK+O+t73F0SaG9UQf71oo3coc=; b=TUQ6R0vfZi/dderGJyPUNMNW1S
	bGBX6G1t2V5wN0IJDFy3lSyvNLxteUnMS7i8LrmlKHnBX7D/46D3VL1LLp3PmhIcrV8xp75QBNrph
	uhKRrW8158NAtE6Nld12BbWmWTk6GDXfhxGjKJ9K5AQbTyVr5vCqN6iZU3CFmXLSa9W49CQKDf8JC
	uvti6ZvkSk3v9U6tCGhbhjUC3u1Cko0dd2WrfufnlEMkfYxRNpLRW3s38xAwwJL3hK3fj7qLAGb4y
	tqzNWInzV2Fz4nBN2aLW1MikDwXWL39jXoxSvpcwL0QBKsfKL2xUZIlLl6IopWufWXsm7kdFdP6cK
	o/GMz/RA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qgrw3-0066QM-1t;
	Thu, 14 Sep 2023 19:23:31 +0000
Date: Thu, 14 Sep 2023 20:23:31 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christian Brauner <brauner@kernel.org>
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
	cgroups@vger.kernel.org, Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 03/19] fs: release anon dev_t in deactivate_locked_super
Message-ID: <20230914192331.GK800259@ZenIV>
References: <20230913111013.77623-1-hch@lst.de>
 <20230913111013.77623-4-hch@lst.de>
 <20230913232712.GC800259@ZenIV>
 <20230914023705.GH800259@ZenIV>
 <20230914053843.GI800259@ZenIV>
 <20230914-munkeln-pelzmantel-3e3a761acb72@brauner>
 <20230914165805.GJ800259@ZenIV>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914165805.GJ800259@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, Sep 14, 2023 at 05:58:05PM +0100, Al Viro wrote:

> Incidentally, I'm going to add a (belated by 10 years) chunk in porting.rst
> re making sure that anything in superblock that might be needed by methods
> called in RCU mode should *not* be freed without an RCU delay...  Should've
> done that back in 3.12 merge window when RCU'd vfsmounts went in; as it
> is, today we have several filesystems with exact same kind of breakage.
> hfsplus and affs breakage had been there in 3.13 (missed those two), exfat
> and ntfs3 - introduced later, by initial merges of filesystems in question.
> Missed on review...
> 
> Hell knows - perhaps Documentation/filesystems/whack-a-mole might be a good
> idea...

Actually, utf8 casefolding stuff also has the same problem, so ext4 and f2fs
with casefolding are also affected ;-/


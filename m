Return-Path: <linux-usb+bounces-899-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FB67B4BA1
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 08:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id 56866B209A2
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 06:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6202F17F0;
	Mon,  2 Oct 2023 06:46:54 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F161138A;
	Mon,  2 Oct 2023 06:46:52 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A6119E;
	Sun,  1 Oct 2023 23:46:50 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
	id BB46A68C7B; Mon,  2 Oct 2023 08:46:46 +0200 (CEST)
Date: Mon, 2 Oct 2023 08:46:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>,
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
Message-ID: <20231002064646.GA1799@lst.de>
References: <20230913111013.77623-1-hch@lst.de> <20230913111013.77623-4-hch@lst.de> <20230913232712.GC800259@ZenIV> <20230926093834.GB13806@lst.de> <20230926212515.GN800259@ZenIV>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230926212515.GN800259@ZenIV>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Sep 26, 2023 at 10:25:15PM +0100, Al Viro wrote:
> Before your patch: foo_kill_super() calls kill_anon_super(),
> which calls kill_super_notify(), which removes the sucker from
> the list, then frees ->s_fs_info.  After your patch:
> removal from the lists happens via the call of kill_super_notify()
> *after* both of your methods had been called, while freeing
> ->s_fs_info happens from the method call.  IOW, you've restored
> the situation prior to "super: ensure valid info".  The whole
> point of that commit had been to make sure that we have nothing
> in the lists with ->s_fs_info pointing to a freed object.
> 
> It's not about free_anon_bdev(); that part is fine - it's the
> "we can drop the weird second call site of kill_super_notify()"
> thing that is broken.

The point has been to only release the anon dev_t after
kill_super_notify, to prevent two of them beeing reused.

Which we do as the free_anon_bdev is done directly in
deactivate_locked_super.  The new ->free_sb for non-block file systems
frees resources, but none of them matter for sget.



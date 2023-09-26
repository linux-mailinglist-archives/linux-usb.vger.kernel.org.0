Return-Path: <linux-usb+bounces-579-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F18D7AE8F0
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 11:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 58C62281995
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 09:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9D512B95;
	Tue, 26 Sep 2023 09:24:38 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F092763AF;
	Tue, 26 Sep 2023 09:24:35 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F91F12A;
	Tue, 26 Sep 2023 02:24:34 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
	id E3A3768AA6; Tue, 26 Sep 2023 11:24:27 +0200 (CEST)
Date: Tue, 26 Sep 2023 11:24:27 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
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
Subject: Re: [PATCH 10/19] USB: gadget/legacy: remove sb_mutex
Message-ID: <20230926092427.GC12504@lst.de>
References: <20230913111013.77623-1-hch@lst.de> <20230913111013.77623-11-hch@lst.de> <7f839be1-4898-41ad-8eda-10d5a0350bdf@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f839be1-4898-41ad-8eda-10d5a0350bdf@rowland.harvard.edu>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, Sep 13, 2023 at 12:10:56PM -0400, Alan Stern wrote:
> On Wed, Sep 13, 2023 at 08:10:04AM -0300, Christoph Hellwig wrote:
> > Creating new a new super_block vs freeing the old one for single instance
> > file systems is serialized by the wait for SB_DEAD.
> > 
> > Remove the superfluous sb_mutex.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> 
> You might mention that this is essentially a reversion of commit 
> d18dcfe9860e ("USB: gadgetfs: Fix race between mounting and 
> unmounting").

The difference we have now is that sb creation waits for the
old one to go way, but I'll add a notice on all that.



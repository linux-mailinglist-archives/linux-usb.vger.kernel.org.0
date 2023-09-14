Return-Path: <linux-usb+bounces-21-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBF179F813
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 04:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77877281CE0
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 02:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E24137A;
	Thu, 14 Sep 2023 02:30:24 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A057D2F8
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 02:30:23 +0000 (UTC)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F02A196;
	Wed, 13 Sep 2023 19:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QJxYibQmjq+Pbg/cA03aH9CORAW2km8XuLC8t21WRo0=; b=OhhyqIHCwHStb3YKeZZHm1zzhR
	U7O739LtvvKuHLAPD7ckbdBOFedy6E2v7i0Tfx1DmJVsyfhRU/Vf9CdQ98YAdW3hZj1GxnkaSUSC+
	f1GSWOIBvcn4DK3Ykh6+6pr5SEpqGerIj8wRKOY/SA9QQVjCllxI1qUJgW45jMDU6uUBo+xCxf0Y4
	k5s+4wc/rQVH8gvkzFdaFjW08BguRZWF58BlkNDZ78YNFfr4eRqta88fWJjbQjSxNMTHF0eZxfoc0
	alUzUlwddMgPH2Kc6JNmW0oLYbwh7FNCzEfhcmU0j2uid7Appi7wlg5hDG2mY+jkRK2sVhnOnNWGZ
	dH9DMfLg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qgc7A-005tq0-0T;
	Thu, 14 Sep 2023 02:29:56 +0000
Date: Thu, 14 Sep 2023 03:29:56 +0100
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
Subject: Re: [PATCH 13/19] fs: convert kill_block_super to block_free_sb
Message-ID: <20230914022956.GG800259@ZenIV>
References: <20230913111013.77623-1-hch@lst.de>
 <20230913111013.77623-14-hch@lst.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913111013.77623-14-hch@lst.de>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Wed, Sep 13, 2023 at 08:10:07AM -0300, Christoph Hellwig wrote:

> -static void affs_kill_sb(struct super_block *sb)
> +static void affs_free_sb(struct super_block *sb)
>  {
>  	struct affs_sb_info *sbi = AFFS_SB(sb);
> -	kill_block_super(sb);
> +
> +	block_free_sb(sb);
>  	if (sbi) {
>  		affs_free_bitmap(sb);
>  		affs_brelse(sbi->s_root_bh);

<checks>

Yep, that's printk + brelse()...  Could we have that
block_free_sb() (an awful name aside) done after the
if (sbi) { ... } there?


Return-Path: <linux-usb+bounces-14-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 840EE79F602
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 02:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 227FC1F214AB
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 00:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42790381;
	Thu, 14 Sep 2023 00:49:20 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1425E369
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 00:49:19 +0000 (UTC)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B50193;
	Wed, 13 Sep 2023 17:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Xd391DCoeJ0otc/wf6vG0zsYE7F5JC70Mi4jJ3xxJjA=; b=n+22JQMYrzItCb/bwKW0Rb/EJQ
	dwFQ8VSaoXqFBijd/Rd/ooWBNw3vLTu30WBEOhDvT25Q9qgRGG9JfuYzPT3UBPnlm2wCqNzCbO7By
	/iUao6NvaaDgKy8WqMgyBgZe3PZG5V5K+OO+orKOctFo1R9Jwb0SvwLw1aa6eobFX7cvJ9EUVmiLt
	gUDGMOe6eZXghVfiDysquUEc88hQJtc6ceYa23j0V58Q80ZcLI+tO/8o95/IQTOWF73wWpogK/bNA
	rNc7xLccZRUaK6i9AJPcd8KpubW/XLwjGB4f7jxGjXwh5jFtZxGCgzjUMnzyR95jfPksEubQg1Cpw
	Kuq5FGvA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qgaXU-005smy-0x;
	Thu, 14 Sep 2023 00:49:00 +0000
Date: Thu, 14 Sep 2023 01:49:00 +0100
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
Subject: Re: [PATCH 09/19] zonefs: remove duplicate cleanup in
 zonefs_fill_super
Message-ID: <20230914004900.GE800259@ZenIV>
References: <20230913111013.77623-1-hch@lst.de>
 <20230913111013.77623-10-hch@lst.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913111013.77623-10-hch@lst.de>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Wed, Sep 13, 2023 at 08:10:03AM -0300, Christoph Hellwig wrote:
> When ->fill_super fails, ->kill_sb is called which already cleans up
> the inodes and zgroups.

Ugh...  The use of "->" strongly suggests that you are talking about
a method; 'fill_super' here actually refers to callback passed to
mount_bdev().  Have a pity for those who'll be trying to parse it
- that might be yourself a couple of years down the road...

Something like

"If zonefs_fill_super() returns an error, its caller (mount_bdev()) will
make sure to call zonefs_kill_super(), which already cleans up
the inodes and zgroups.", perhaps?

> 
> Drop the extra cleanup code in zonefs_fill_super.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/zonefs/super.c | 21 +++++----------------
>  1 file changed, 5 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
> index 9d1a9808fbbba6..35b2554ce2ac2e 100644
> --- a/fs/zonefs/super.c
> +++ b/fs/zonefs/super.c
> @@ -1309,13 +1309,12 @@ static int zonefs_fill_super(struct super_block *sb, void *data, int silent)
>  	/* Initialize the zone groups */
>  	ret = zonefs_init_zgroups(sb);
>  	if (ret)
> -		goto cleanup;
> +		return ret;
>  
>  	/* Create the root directory inode */
> -	ret = -ENOMEM;
>  	inode = new_inode(sb);
>  	if (!inode)
> -		goto cleanup;
> +		return -ENOMEM;
>  
>  	inode->i_ino = bdev_nr_zones(sb->s_bdev);
>  	inode->i_mode = S_IFDIR | 0555;
> @@ -1333,7 +1332,7 @@ static int zonefs_fill_super(struct super_block *sb, void *data, int silent)
>  
>  	sb->s_root = d_make_root(inode);
>  	if (!sb->s_root)
> -		goto cleanup;
> +		return -ENOMEM;
>  
>  	/*
>  	 * Take a reference on the zone groups directory inodes
> @@ -1341,19 +1340,9 @@ static int zonefs_fill_super(struct super_block *sb, void *data, int silent)
>  	 */
>  	ret = zonefs_get_zgroup_inodes(sb);
>  	if (ret)
> -		goto cleanup;
> -
> -	ret = zonefs_sysfs_register(sb);
> -	if (ret)
> -		goto cleanup;
> -
> -	return 0;
> -
> -cleanup:
> -	zonefs_release_zgroup_inodes(sb);
> -	zonefs_free_zgroups(sb);
> +		return ret;
>  
> -	return ret;
> +	return zonefs_sysfs_register(sb);
>  }
>  
>  static struct dentry *zonefs_mount(struct file_system_type *fs_type,
> -- 
> 2.39.2
> 


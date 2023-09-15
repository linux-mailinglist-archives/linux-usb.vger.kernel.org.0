Return-Path: <linux-usb+bounces-158-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5527A20EC
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 16:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 854241C2174D
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 14:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34CFF111B7;
	Fri, 15 Sep 2023 14:28:45 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25565111A6
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 14:28:42 +0000 (UTC)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 314181FCE;
	Fri, 15 Sep 2023 07:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LQfJYvE2Csoxjb0lVlLN4FcWufcYVyyJCyyuwAbWOnU=; b=KQXtAOeuJAErVKd6uCAVlHA6pg
	YEjxPW8qCQSdnT0BpMPpiEQUqoWgnx96ACyemvrrs070Hx49chE8bD/RX6bVGcgAlD6+Fhi1XO6xX
	Z7rkRFy5u2HkFO69DEB0fz1XiCQ6zqT0Ehti6NRcEE4vBRecafV5pY9/6maldCvxzy9GqM2PkwGUO
	zlWUKy5Hawds6CoeWyMvCxmVhsjtC1qzXqXjtAmxjElm/ZsL0IqcA07elyzjW84yZ98nj+bPoR6K2
	eCbtX9jR50Qsk1JCgWNbndDpqTBH5bhOB+TqRtHzjkA2YK2vLvSMHdrNBIgByv8unzvp4sIU6+y/M
	YHMHee/A==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qh9nq-006KYh-18;
	Fri, 15 Sep 2023 14:28:14 +0000
Date: Fri, 15 Sep 2023 15:28:14 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>,
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
Message-ID: <20230915142814.GL800259@ZenIV>
References: <20230913111013.77623-1-hch@lst.de>
 <20230913111013.77623-4-hch@lst.de>
 <20230913232712.GC800259@ZenIV>
 <20230914023705.GH800259@ZenIV>
 <20230914053843.GI800259@ZenIV>
 <20230914-munkeln-pelzmantel-3e3a761acb72@brauner>
 <20230914165805.GJ800259@ZenIV>
 <20230915-elstern-etatplanung-906c6780af19@brauner>
 <20230915-zweit-frech-0e06394208a3@brauner>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915-zweit-frech-0e06394208a3@brauner>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Sep 15, 2023 at 04:12:07PM +0200, Christian Brauner wrote:
> +	static void some_fs_kill_sb(struct super_block *sb)
> +	{
> +		struct some_fs_info *info = sb->s_fs_info;
> +
> +		kill_*_super(sb);
> +		kfree(info);
> +	}
> +
> +It's best practice to never deviate from this pattern.

The last part is flat-out incorrect.  If e.g. fatfs or cifs ever switches
to that pattern, you'll get UAF - they need freeing of ->s_fs_info
of anything that ever had been mounted done with RCU delay; moreover,
unload_nls() in fatfs needs to be behind the same.

Lifetime rules for fs-private parts of superblock are really private to
filesystem; their use by sget/sget_fc callbacks might impose restrictions
on those, but that again is none of the VFS business.


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 890ED4AD725
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 12:32:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376313AbiBHLb5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Feb 2022 06:31:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356415AbiBHKoc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 05:44:32 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A16C03FEC0
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 02:44:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 40CB36156F
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 10:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED230C004E1;
        Tue,  8 Feb 2022 10:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1644317070;
        bh=JcYAKVeym09gnYUzyTheahVOrpS5X8Mb7Vq+R4lyd2Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A2hFXzR+ci2ZTOV3pflUJ4bsU7zD8aAAKbcaaQv5wim448s7D4jPtNN4QZOoy9MbE
         q2v2/oMOaARhATdcmPSuxLuig6OzsmAINnJvXa+bVQREXJvwTErmBbGJIq/CQYRABB
         IqkAXJb3P/fWahGHLJ2YYnR0LKPW+aMBiz2FbTx4=
Date:   Tue, 8 Feb 2022 11:44:27 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/1] usb: gadget: f_fs: Support zerocopy transfers via
 mmap.
Message-ID: <YgJJi0q+/oV9SRq8@kroah.com>
References: <20220202172056.44722-1-ingo.rohloff@lauterbach.com>
 <20220202172056.44722-2-ingo.rohloff@lauterbach.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202172056.44722-2-ingo.rohloff@lauterbach.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 02, 2022 at 06:20:56PM +0100, Ingo Rohloff wrote:
> This patch implements the same functionality for FunctionFS as
> commit f7d34b445abc00e979b7 ("USB: Add support for usbfs zerocopy.")
> did for USB host devio.c
> 
> For FunctionFS, each "struct file *" for an endpoint (except EP0), keeps
> a list of mmapped buffers. User space might use these buffers to avoid
> copying of data by the kernel, by employing Linux native AsyncIO via
> libaio.
> 
> Standard read() and write() operations will NOT be zerocopy.
> Especially for reads, the expected USB transfer length is unclear;
> whereas an AIO request clearly specifies the maximum transfer length.
> 
> Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
> ---
>  drivers/usb/gadget/function/f_fs.c | 269 ++++++++++++++++++++++++++++-
>  drivers/usb/gadget/function/u_fs.h |   4 +
>  2 files changed, 267 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 7461d27e9604..a2e46704426f 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -201,6 +201,23 @@ struct ffs_epfile {
>  	unsigned char			_pad;
>  };
>  
> +struct ffs_ep_listener {
> +	struct ffs_epfile *epfile;
> +	struct list_head ffsm_list;
> +	spinlock_t       ffsm_lock;
> +};
> +
> +struct ffs_memory {
> +	struct list_head memlist;
> +	struct ffs_ep_listener *listener;
> +	char *kmem;
> +	unsigned long vm_start;
> +	u32 size;
> +
> +	int vma_use_count;
> +	int aio_use_count;
> +};
> +
>  struct ffs_buffer {
>  	size_t length;
>  	char *data;
> @@ -227,6 +244,7 @@ struct ffs_io_data {
>  	bool use_sg;
>  
>  	struct ffs_data *ffs;
> +	struct ffs_memory *ffsm;
>  };
>  
>  struct ffs_desc_helper {
> @@ -702,6 +720,200 @@ static const struct file_operations ffs_ep0_operations = {
>  	.poll =		ffs_ep0_poll,
>  };
>  
> +/* Handling of mmapped transfers *******************************/
> +
> +/* Check whether it's okay to allocate more memory for mmap */
> +static int ffsm_increase_mmap_mem_usage(struct ffs_data *ffs, u64 amount)
> +{
> +	u64 lim;
> +
> +	lim = READ_ONCE(ffs->mmap_memory_mb);
> +	lim <<= 20;
> +
> +	atomic64_add(amount, &ffs->mmap_mem_usage);
> +
> +	if (lim > 0 && atomic64_read(&ffs->mmap_mem_usage) > lim) {

What prevents it from changing right after you read this?

> +		atomic64_sub(amount, &ffs->mmap_mem_usage);

Why not use a real lock instead of trying to do a fake one with this
atomic variable?  You are not really protecting anything here correctly
from what I can tell.

thanks,

greg k-h

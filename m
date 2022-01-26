Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFED949C98B
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 13:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241224AbiAZMXB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 07:23:01 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:41964 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241221AbiAZMXA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jan 2022 07:23:00 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A07F7619CB
        for <linux-usb@vger.kernel.org>; Wed, 26 Jan 2022 12:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E199C340E3;
        Wed, 26 Jan 2022 12:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1643199780;
        bh=5YCxE1bMI3ZWJBc8wHXEQ0KqGn+7RusUgZRsmTPfzLY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0WacOoN+RTJmblpgybue1dqP5SMB6FoE1BfmqdIcJz3AqjONp6j3uz2Ax4tR+ZDOC
         LF0BDpSHTng96xCUOD3iAXPtysGtC3C7AmAEnMAGUyXnlqYTep3MK6nOSySKrfk173
         HJRs37umbPFFMJAiO71BA0nfnYYDcqnj+1O+TeHM=
Date:   Wed, 26 Jan 2022 13:22:57 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] usb: gadget: f_fs: Support zerocopy transfers via
 mmap.
Message-ID: <YfE9Ie42lC32f0Ui@kroah.com>
References: <20220118190849.22084-1-ingo.rohloff@lauterbach.com>
 <20220118190849.22084-2-ingo.rohloff@lauterbach.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220118190849.22084-2-ingo.rohloff@lauterbach.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 18, 2022 at 08:08:49PM +0100, Ingo Rohloff wrote:
> This patch implements the same functionality for USB Gadget FunctionFS as
> commit f7d34b445abc00e979b7 ("USB: Add support for usbfs zerocopy.")
> did for USB host devio.c
> 
> This patch allows user space to mmap USB transfer buffers via
> USB FunctionFS endpoint 0.
> 
> User space might then use these buffers in conjunction with
> Linux native AsyncIO (via libaio) to avoid data copying by the kernel.
> 
> Standard read() and write() operations to bulk USB endpoints will NOT be
> zerocopy.  Especially for reads, the expected USB transfer length is
> unclear; whereas an AsyncIO request clearly specifies the maximum transfer
> length.
> 
> Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
> ---
>  drivers/usb/gadget/function/f_fs.c | 230 ++++++++++++++++++++++++++++-
>  1 file changed, 226 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 25ad1e97a458..a8fac065b9b4 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -201,6 +201,16 @@ struct ffs_epfile {
>  	unsigned char			_pad;
>  };
>  
> +struct ffs_memory {
> +	struct list_head memlist;
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
> @@ -227,6 +237,7 @@ struct ffs_io_data {
>  	bool use_sg;
>  
>  	struct ffs_data *ffs;
> +	struct ffs_memory *ffsm;
>  };
>  
>  struct ffs_desc_helper {
> @@ -262,6 +273,135 @@ static int ffs_mutex_lock(struct mutex *mutex, unsigned nonblock)
>  static char *ffs_prepare_buffer(const char __user *buf, size_t len)
>  	__attribute__((warn_unused_result, nonnull));
>  
> +/* Handling of mmapped transfers *******************************/
> +
> +static LIST_HEAD(ffsm_list);
> +static DEFINE_SPINLOCK(ffsm_lock);
> +
> +/* Limit on the total amount of memory ffs can allocate via mmap */
> +static u32 ffsm_memory_mb = 16;
> +module_param(ffsm_memory_mb, uint, 0644);
> +MODULE_PARM_DESC(ffsm_memory_mb,
> +		"maximum MB allowed for ffs mmap buffers (0 = no limit)");

No, sorry, this is not the 1990's, we can not add new module parameters
for stuff like this.  The code should "just work" without needing to be
tuned.

thanks,

greg k-h

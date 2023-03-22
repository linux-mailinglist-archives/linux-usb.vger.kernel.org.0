Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03A866C4A06
	for <lists+linux-usb@lfdr.de>; Wed, 22 Mar 2023 13:12:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbjCVMMp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Mar 2023 08:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbjCVMMn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Mar 2023 08:12:43 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA65560A9C
        for <linux-usb@vger.kernel.org>; Wed, 22 Mar 2023 05:12:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 28622B81C29
        for <linux-usb@vger.kernel.org>; Wed, 22 Mar 2023 12:12:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69AC0C433A1;
        Wed, 22 Mar 2023 12:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1679487157;
        bh=PoyhYF4uIzWOcgh7O44xh855YmcyTR2utD6jVuMv7GI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OUeJLgveemVJlIwcywLjZRC2DHAWkmhpP7e6bp2UW7uNOzFsz38qy85t63oDTFwJ7
         OM/ItDElEId9mGgoQIwqK5w5rX3drrOoFIOi1qbbMTVPPrA/vjJ4dDmqzsG3uHS7Sr
         JEHZCgJlf2B7IIAnjAoefkApo/I8feHz59RvDkE8=
Date:   Wed, 22 Mar 2023 13:12:34 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_fs: show device name in debug message
Message-ID: <ZBrwsu0gliC6pquN@kroah.com>
References: <1679481369-30094-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1679481369-30094-1-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 22, 2023 at 06:36:09PM +0800, Linyu Yuan wrote:
> when multiple instances in use, the debug message is hard to understand
> as there is no instance name show.
> 
> this change will show each instance name for all most all debug messsage.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
>  drivers/usb/gadget/function/f_fs.c | 406 +++++++++++++++++++------------------

That's a lot of churn just for debugging messages.

But that's good, the debugging code here needs lots of work, so let's do
this properly!

>  drivers/usb/gadget/function/u_fs.h |   2 +
>  2 files changed, 215 insertions(+), 193 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index a277c70..5abeb18 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -231,13 +231,13 @@ struct ffs_io_data {
>  };
>  
>  struct ffs_desc_helper {
> -	struct ffs_data *ffs;
> -	unsigned interfaces_count;
> -	unsigned eps_count;
> +	unsigned int interfaces_count;
> +	unsigned int eps_count;

Why did you change interfaces_count and eps_count for a debugging
message change?

This doesn't make me feel good about this...

>  };
>  
>  static int  __must_check ffs_epfiles_create(struct ffs_data *ffs);
> -static void ffs_epfiles_destroy(struct ffs_epfile *epfiles, unsigned count);
> +static void ffs_epfiles_destroy(struct ffs_data *ffs, struct ffs_epfile *epfiles,
> +				unsigned int count);
>  
>  static struct dentry *
>  ffs_sb_create_file(struct super_block *sb, const char *name, void *data,
> @@ -258,9 +258,9 @@ static void ffs_closed(struct ffs_data *ffs);
>  
>  /* Misc helper functions ****************************************************/
>  
> -static int ffs_mutex_lock(struct mutex *mutex, unsigned nonblock)
> +static int ffs_mutex_lock(struct mutex *mutex, unsigned int nonblock)
>  	__attribute__((warn_unused_result, nonnull));
> -static char *ffs_prepare_buffer(const char __user *buf, size_t len)
> +static char *ffs_prepare_buffer(struct ffs_data *ffs, const char __user *buf, size_t len)
>  	__attribute__((warn_unused_result, nonnull));
>  
>  
> @@ -318,12 +318,12 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
>  static int __ffs_ep0_stall(struct ffs_data *ffs)
>  {
>  	if (ffs->ev.can_stall) {
> -		pr_vdebug("ep0 stall\n");
> +		pr_vdebug("%s: ep0 stall\n", ffs->dev_name);

Please don't try to create a custom version of the widely used dev_dbg()
call like you are doing here.  Just use dev_dbg().  Why can't you do
that?

>  		usb_ep_set_halt(ffs->gadget->ep0);
>  		ffs->setup_state = FFS_NO_SETUP;
>  		return -EL2HLT;
>  	} else {
> -		pr_debug("bogus ep0 stall!\n");
> +		pr_debug("%s: bogus ep0 stall!\n", ffs->dev_name);
>  		return -ESRCH;
>  	}
>  }
> @@ -335,7 +335,7 @@ static ssize_t ffs_ep0_write(struct file *file, const char __user *buf,
>  	ssize_t ret;
>  	char *data;
>  
> -	ENTER();
> +	ENTER_FFS();

Why change the macro name if no options are changed?

And why is this macro needed at all anymore?  You should just use
ftrace, and these macros should be deleted as they are nothing that we
would ever accept in new submissions.

So how about making this a patch series, one that removed the unneeded
tracing macros like ENTER(), and then one that uses the proper dev_dbg()
functions and then, if you really want it, one that fixes up the use of
"unsigned" which has nothing to do with debug messages.

thanks,

greg k-h

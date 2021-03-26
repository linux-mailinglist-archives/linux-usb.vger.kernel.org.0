Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12FA334A84C
	for <lists+linux-usb@lfdr.de>; Fri, 26 Mar 2021 14:42:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbhCZNmB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Mar 2021 09:42:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:37498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230083AbhCZNlx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Mar 2021 09:41:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21F5061A13;
        Fri, 26 Mar 2021 13:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616766112;
        bh=7lST/Kiw6GGs2KSScFinlKhaTOz83CCIcH6EaBVLQ8g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eMy51KpMZv9FRTtsfHaujYgkLterkwa7VtRuKQhFm3QJ2KJv2qOQDst9xOm5GlUbQ
         KyOKFcvgjUaa+NacH0gOoY/gtEs5oo7RzfzoYXF9fzTPOGZ9r0F1Xrb1HegeaWC6Jx
         8yy9welg63PhbA4VmPaWQe/osNO8V73MolKPCO0o=
Date:   Fri, 26 Mar 2021 14:41:50 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jay Fang <f.fangjian@huawei.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        tangzihao1@hisilicon.com, huangdaode@huawei.com
Subject: Re: [PATCH V2] USB: gadget: f_fs: Use memdup_user() as a cleanup
Message-ID: <YF3kntEVAKGom1is@kroah.com>
References: <1616644100-8214-1-git-send-email-f.fangjian@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616644100-8214-1-git-send-email-f.fangjian@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 25, 2021 at 11:48:20AM +0800, Jay Fang wrote:
> From: Zihao Tang <tangzihao1@hisilicon.com>
> 
> Fix coccicheck warning which recommends to use memdup_user():
> 
> drivers/usb/gadget/function/f_fs.c:3829:8-15: WARNING opportunity for memdup_user
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Zihao Tang <tangzihao1@hisilicon.com>
> Signed-off-by: Jay Fang <f.fangjian@huawei.com>
> ---
>  drivers/usb/gadget/function/f_fs.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 801a8b6..90a24d4 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -3826,14 +3826,9 @@ static char *ffs_prepare_buffer(const char __user *buf, size_t len)
>  	if (!len)
>  		return NULL;
>  
> -	data = kmalloc(len, GFP_KERNEL);
> -	if (!data)
> -		return ERR_PTR(-ENOMEM);
> -
> -	if (copy_from_user(data, buf, len)) {
> -		kfree(data);
> -		return ERR_PTR(-EFAULT);
> -	}
> +	data = memdup_user(buf, len);
> +	if (IS_ERR(data))
> +		return data;
>  
>  	pr_vdebug("Buffer from user space:\n");
>  	ffs_dump_mem("", data, len);
> -- 
> 2.7.4
> 

Does not apply to my tree at all :(

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7B48691A7E
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 09:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbjBJI7B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 03:59:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231683AbjBJI66 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 03:58:58 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D784A208
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 00:58:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6D323B8240D
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 08:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A583BC433D2;
        Fri, 10 Feb 2023 08:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676019529;
        bh=qvi6aGhcC3wbrnhYZZL25CmcrvYdTOaqLQ1kZGI8x7I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gVt2+OUiwq7vIseVPUZbGzYa9YojFI7UuEqC+Li9+eTJu12VP2zYO8Xh99uACptM8
         YOAFl5nV5dEnTXr+cY7VRImQ1k8GkSgFPP9tcqRbGry5oacMGGcCF+Hyj0GNKUw7zZ
         MGUOIrBe8KLcElZHGlIb7kgXvVReJNbUqj01ZAoBawa0kbjJ9lB2WJc2RzsZbzP1Et
         mD1svc0PseGS2bTrnPuQtiEmdARe06fjGYxTWeHQmLGxEvEF/tu56m3NEi++TN549S
         6yFTcCF+FYNi7DqRGpwBXuXT8bCgSRNF1tuMSFG8ZsqqBTrx+FUZJZ664KJzzAIEJK
         iiPqQ3ycRZtKA==
Date:   Fri, 10 Feb 2023 16:58:39 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH v2 3/3] usb: chipidea: debug: remove redundant 'role'
 debug file
Message-ID: <20230210085839.GE1991028@nchen-desktop>
References: <20221130081231.3127369-1-xu.yang_2@nxp.com>
 <20221130081231.3127369-3-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130081231.3127369-3-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22-11-30 16:12:31, Xu Yang wrote:
> Two 'role' file exist in different position but with totally same function.
> 
> 1. /sys/devices/platform/soc@0/xxxxxxxx.usb/ci_hdrc.0/role
> 2. /sys/kernel/debug/usb/ci_hdrc.0/role
> 
> This will remove the 2rd redundant 'role' debug file (under debugfs) and
> keep the one which is more closer to user.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> 
> ---
> changes since v1:
> - no change
> ---
>  drivers/usb/chipidea/debug.c | 55 ------------------------------------
>  1 file changed, 55 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/debug.c b/drivers/usb/chipidea/debug.c
> index faf6b078b6c4..37da83de3cba 100644
> --- a/drivers/usb/chipidea/debug.c
> +++ b/drivers/usb/chipidea/debug.c
> @@ -247,60 +247,6 @@ static int ci_otg_show(struct seq_file *s, void *unused)
>  }
>  DEFINE_SHOW_ATTRIBUTE(ci_otg);
>  
> -static int ci_role_show(struct seq_file *s, void *data)
> -{
> -	struct ci_hdrc *ci = s->private;
> -
> -	if (ci->role != CI_ROLE_END)
> -		seq_printf(s, "%s\n", ci_role(ci)->name);
> -
> -	return 0;
> -}
> -
> -static ssize_t ci_role_write(struct file *file, const char __user *ubuf,
> -			     size_t count, loff_t *ppos)
> -{
> -	struct seq_file *s = file->private_data;
> -	struct ci_hdrc *ci = s->private;
> -	enum ci_role role;
> -	char buf[8];
> -	int ret;
> -
> -	if (copy_from_user(buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
> -		return -EFAULT;
> -
> -	for (role = CI_ROLE_HOST; role < CI_ROLE_END; role++)
> -		if (ci->roles[role] &&
> -		    !strncmp(buf, ci->roles[role]->name,
> -			     strlen(ci->roles[role]->name)))
> -			break;
> -
> -	if (role == CI_ROLE_END || role == ci->role)
> -		return -EINVAL;
> -
> -	pm_runtime_get_sync(ci->dev);
> -	disable_irq(ci->irq);
> -	ci_role_stop(ci);
> -	ret = ci_role_start(ci, role);
> -	enable_irq(ci->irq);
> -	pm_runtime_put_sync(ci->dev);
> -
> -	return ret ? ret : count;
> -}
> -
> -static int ci_role_open(struct inode *inode, struct file *file)
> -{
> -	return single_open(file, ci_role_show, inode->i_private);
> -}
> -
> -static const struct file_operations ci_role_fops = {
> -	.open		= ci_role_open,
> -	.write		= ci_role_write,
> -	.read		= seq_read,
> -	.llseek		= seq_lseek,
> -	.release	= single_release,
> -};
> -
>  static int ci_registers_show(struct seq_file *s, void *unused)
>  {
>  	struct ci_hdrc *ci = s->private;
> @@ -354,7 +300,6 @@ void dbg_create_files(struct ci_hdrc *ci)
>  	if (ci_otg_is_fsm_mode(ci))
>  		debugfs_create_file("otg", S_IRUGO, dir, ci, &ci_otg_fops);
>  
> -	debugfs_create_file("role", S_IRUGO | S_IWUSR, dir, ci, &ci_role_fops);
>  	debugfs_create_file("registers", S_IRUGO, dir, ci, &ci_registers_fops);
>  }
>  
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen

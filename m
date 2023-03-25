Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 447D36C8CD8
	for <lists+linux-usb@lfdr.de>; Sat, 25 Mar 2023 10:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232170AbjCYJAc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Mar 2023 05:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231954AbjCYJAa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Mar 2023 05:00:30 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB94F11140
        for <linux-usb@vger.kernel.org>; Sat, 25 Mar 2023 02:00:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4F74DB8069D
        for <linux-usb@vger.kernel.org>; Sat, 25 Mar 2023 09:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4CDC433D2;
        Sat, 25 Mar 2023 09:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1679734827;
        bh=869KkipBOku4RBsLP3k6W08JG+mMxvY2gm4MAwWOZP4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a8KiOjZL/sNoiBBabo4HfQ2ngHInf8hdOStLsaJ5DNogXxV/dggc3hLl4l7KLVGUI
         oZ9CHtem8f0oFN2rojXPM2ccSYs17uZwXM4zz9g5lDv1XGmAl9kWjgSymNhqEWt6hB
         Mpg5dnVGysdCK7ys8RBuJnFeu9O5ehdkWmQP5RfA=
Date:   Sat, 25 Mar 2023 10:00:23 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 3/3] usb: gadget: f_fs: add dev name as prefix for
 pr_vdebug()
Message-ID: <ZB64J50M4RmkPJSD@kroah.com>
References: <1679638227-20496-1-git-send-email-quic_linyyuan@quicinc.com>
 <1679638227-20496-3-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1679638227-20496-3-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 24, 2023 at 02:10:27PM +0800, Linyu Yuan wrote:
> when multiple instances in use, the debug message is hard to understand
> as there is no instance name show.
> 
> this change will show each instance name for debug messages.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
> v2: split to several changes according to v1 comments
> v1: https://lore.kernel.org/linux-usb/1679481369-30094-1-git-send-email-quic_linyyuan@quicinc.com/
> 
>  drivers/usb/gadget/function/f_fs.c | 136 +++++++++++++++++++------------------
>  1 file changed, 69 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index a4051c8..df67ab5 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -317,12 +317,12 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
>  static int __ffs_ep0_stall(struct ffs_data *ffs)
>  {
>  	if (ffs->ev.can_stall) {
> -		pr_vdebug("ep0 stall\n");
> +		pr_vdebug("%s: ep0 stall\n", ffs->dev_name);

Again, no, please use dev_dbg() instead.  Do NOT roll your own debugging
macros.  You have access to a struct device pointer for this device that
the driver is controlling, so please always use that instead.

thanks,

greg k-h

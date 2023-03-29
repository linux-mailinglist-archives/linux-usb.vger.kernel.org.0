Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6387B6CD253
	for <lists+linux-usb@lfdr.de>; Wed, 29 Mar 2023 08:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbjC2Gyo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Mar 2023 02:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjC2Gyn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Mar 2023 02:54:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEA2D2135
        for <linux-usb@vger.kernel.org>; Tue, 28 Mar 2023 23:54:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8983F61A94
        for <linux-usb@vger.kernel.org>; Wed, 29 Mar 2023 06:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 952E3C433EF;
        Wed, 29 Mar 2023 06:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1680072882;
        bh=vqPLFFVg6m7hKtClYwjdJacKSJy/JUR42afuLttOmiQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GXW5oCRq1upkYWZR8brVdVNIxq8PuzwVouAUbFLpRdYUO/e2fKDD6wEKbqLBEl083
         qJPhABOzv8ETX4aARC87iWQwh2MyjVUPzfHUUxTC6g0zWo9IdMCf9o/f607HZnEedU
         DGl+wGeyMPfJODfqVKkmioLkF2i/q7SUgcBAzfKw=
Date:   Wed, 29 Mar 2023 08:54:39 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 6/6] usb: gadget: f_fs: show instance name in debug
 message
Message-ID: <ZCPgr1SY94UuBfdX@kroah.com>
References: <1679911940-4727-1-git-send-email-quic_linyyuan@quicinc.com>
 <1679911940-4727-6-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1679911940-4727-6-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 27, 2023 at 06:12:20PM +0800, Linyu Yuan wrote:
> show ffs->dev_name in all possible debug message.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
> v3: change according comments
> v2: split to several changes according to v1 comments
> v1: https://lore.kernel.org/linux-usb/1679481369-30094-1-git-send-email-quic_linyyuan@quicinc.com/
> 
>  drivers/usb/gadget/function/f_fs.c | 141 ++++++++++++++++++++-----------------
>  1 file changed, 75 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 0761eaa..383343d 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -317,12 +317,12 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
>  static int __ffs_ep0_stall(struct ffs_data *ffs)
>  {
>  	if (ffs->ev.can_stall) {
> -		dev_vdbg(ffs->dev, "ep0 stall\n");
> +		dev_vdbg(ffs->dev, "%s: ep0 stall\n", ffs->dev_name);

You already have the name here, it's in the usb-gadget structure, why do
you need to print it out again?

What is the before and after output of this change?  I think it should
have the same information already in it.

thanks,

greg k-h

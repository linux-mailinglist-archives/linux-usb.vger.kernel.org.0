Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFFD56C8CDB
	for <lists+linux-usb@lfdr.de>; Sat, 25 Mar 2023 10:01:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232127AbjCYJBn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Mar 2023 05:01:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231196AbjCYJBm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Mar 2023 05:01:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18DBD11EA7
        for <linux-usb@vger.kernel.org>; Sat, 25 Mar 2023 02:01:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A978660A25
        for <linux-usb@vger.kernel.org>; Sat, 25 Mar 2023 09:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A3DDC433EF;
        Sat, 25 Mar 2023 09:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1679734900;
        bh=Mimd15Rf6b9f0oy7YTOF3LBMyiRks7yKbYxhtFffazQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CayPpDZvpupvii6ymJNHDSdxVyoqkUx9EOPMOJ1QJVgK4q3uMvuBs3Fe/QWOUkNIS
         GkeqspejWLbKe6+KlTpZCTMZbXZkCRb1AWLQL6lm/9zB7sb99Zc5qwCGoxN1uUHZI1
         SIo/Q58HhQnCq5HXBm6V5KKvN0OUC5hkE1z+tkDQ=
Date:   Sat, 25 Mar 2023 10:01:37 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/3] usb: gadget: f_fs: add more function with struct
 ffs_data *ffs parameter
Message-ID: <ZB64cW4iJ+2+wqZR@kroah.com>
References: <1679638227-20496-1-git-send-email-quic_linyyuan@quicinc.com>
 <1679638227-20496-2-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1679638227-20496-2-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 24, 2023 at 02:10:26PM +0800, Linyu Yuan wrote:
> It prepare to improve pr_vdebug() which will show dev_name when multiple
> f_fs instance exist.

I am sorry, but I can not parse this.  Please describe why you are doing
this better next time.

> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
> v2: split to several changes according to v1 comments
> v1: https://lore.kernel.org/linux-usb/1679481369-30094-1-git-send-email-quic_linyyuan@quicinc.com/
> 
>  drivers/usb/gadget/function/f_fs.c | 78 +++++++++++++++++++-------------------
>  1 file changed, 38 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 8830847..a4051c8 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -231,7 +231,6 @@ struct ffs_io_data {
>  };
>  
>  struct ffs_desc_helper {
> -	struct ffs_data *ffs;

Your subject line says you are adding more function, but you are really
removing the structure pointer here?  Why?

Shouldn't removing this pointer be a separate commit?

thanks,

greg k-h

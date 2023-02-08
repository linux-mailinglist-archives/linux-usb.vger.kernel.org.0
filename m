Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2405A68F14D
	for <lists+linux-usb@lfdr.de>; Wed,  8 Feb 2023 15:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231608AbjBHOy7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Feb 2023 09:54:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbjBHOy6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Feb 2023 09:54:58 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A1B1526E;
        Wed,  8 Feb 2023 06:54:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4961EB81E4B;
        Wed,  8 Feb 2023 14:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE0AC433EF;
        Wed,  8 Feb 2023 14:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1675868095;
        bh=K40VKH6bWRcTPucEbgvdvZ7YJ9QWhZmDNw3iO+juPTQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=haMS9in0rEpld9hSRQ82B81Wm8lh+JahXvz2gXG5redQdEQOc2xMzKHrZU50VhvZf
         2T8VTBkFSikHFJyHUKag3r2i0YLSnSLWYyIPWkwzZHweh+rIv5NU83daQCHVoZvLfw
         KoCH7EbxS2GbjXXPOxUAJv4tuG8leQx2VkCewIJI=
Date:   Wed, 8 Feb 2023 15:54:52 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Prashanth K <quic_prashk@quicinc.com>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Xiu Jianfeng <xiujianfeng@huawei.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: u_serial: Add null pointer check in
 gserial_resume
Message-ID: <Y+O3vBbBh4ZwSBWT@kroah.com>
References: <1675864487-18620-1-git-send-email-quic_prashk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1675864487-18620-1-git-send-email-quic_prashk@quicinc.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 08, 2023 at 07:24:47PM +0530, Prashanth K wrote:
> Consider a case where gserial_disconnect has already cleared
> gser->ioport. And if a wakeup interrupt triggers afterwards,
> gserial_resume gets called, which will lead to accessing of
> gserial->port and thus causing null pointer dereference.Add
> a null pointer check to prevent this.
> 
> Fixes: aba3a8d01d62 (" usb: gadget: u_serial: add suspend resume callbacks")

Nit, and our tools will complain, no " " before the "usb:" string here,
right?



> Signed-off-by: Prashanth K <quic_prashk@quicinc.com>
> ---
>  drivers/usb/gadget/function/u_serial.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
> index 840626e..98be2b8 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -1428,6 +1428,9 @@ void gserial_resume(struct gserial *gser)
>  	struct gs_port *port = gser->ioport;
>  	unsigned long	flags;
>  
> +	if (!port)
> +		return;
> +

What prevents port from going to NULL right after this check?

thanks,

greg k-h

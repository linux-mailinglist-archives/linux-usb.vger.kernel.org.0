Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 300F74224BB
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 13:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234286AbhJELNt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Oct 2021 07:13:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:46786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233998AbhJELNs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Oct 2021 07:13:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FFD360F93;
        Tue,  5 Oct 2021 11:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1633432318;
        bh=Z2KkxE/hGFuaO3c3OlolGRDXXEFhI3mFKoHC/MH0rBU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oOL4yfG299Zy8Upl0ZMhY1e/jPQH+lIow9Sh4jDoUdXI7bPITgQwpWJhiBYP8eHRV
         ZaibmlfHH5SnuVeZyk0HGYfH/ED5WacOrDI112Njkc/nf/GIMU5y4ZAmuYygl0BkyK
         DEsiH7ajN/IaGe5yrr+DZmhLYkLES+SPt2z9t6bw=
Date:   Tue, 5 Oct 2021 13:11:56 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 2/3] usb: gadget: configfs: add gadget_info for config
 group
Message-ID: <YVwy/AHW2jfeGRnl@kroah.com>
References: <1630976977-13938-1-git-send-email-quic_linyyuan@quicinc.com>
 <1630976977-13938-3-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630976977-13938-3-git-send-email-quic_linyyuan@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 07, 2021 at 09:09:36AM +0800, Linyu Yuan wrote:
> add gadget_info pointer in struct config_usb_cfg
> to allow common gadget info trace from configfs layer.

Again, I do not understand this description, can you please try to
reword it?

> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
> v2: no change
> v3: change struct inside configfs.c
> v4: no change
> v5: no change
> 
>  drivers/usb/gadget/configfs.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index 5b2e6f9..cea12c3 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -70,6 +70,7 @@ struct config_usb_cfg {
>  	struct usb_configuration c;
>  	struct list_head func_list;
>  	struct usb_gadget_strings *gstrings[MAX_USB_STRING_LANGS + 1];
> +	struct gadget_info *gi;

You add a pointer, where are you removing it?

thanks,

greg k-h

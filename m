Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51BEA736E90
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jun 2023 16:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233251AbjFTOXH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Jun 2023 10:23:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233280AbjFTOWw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Jun 2023 10:22:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 502A51985
        for <linux-usb@vger.kernel.org>; Tue, 20 Jun 2023 07:22:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C528461283
        for <linux-usb@vger.kernel.org>; Tue, 20 Jun 2023 14:22:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE337C433C0;
        Tue, 20 Jun 2023 14:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1687270970;
        bh=mgFHllUtoUwkvQIg0KOGIl3PHGgls+Dl5rOEhBTEcog=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1AWqPnB9RQDlZBRt7Ab1YjNgmQjop5lO0IIR9747eNVpdlnsl7WSOUBXoHbB/jxRz
         MTZgRVmai2C/GE4J7w1jn3rzw4IbMEKnLr1F2MDHk//sxuRQHkqplKDZqJP8Q5GPhK
         bxYKsin9lEbcEkqhNlmxpLqmdv4ewBintLy9ksBU=
Date:   Tue, 20 Jun 2023 16:22:47 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Ivan Orlov <ivan.orlov0322@gmail.com>
Subject: Re: [PATCH 6/6] USB: file.c: make usb class a static const structure
Message-ID: <2023062000-consuming-crusher-8a92@gregkh>
References: <20230620094412.508580-7-gregkh@linuxfoundation.org>
 <20230620094412.508580-12-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620094412.508580-12-gregkh@linuxfoundation.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 20, 2023 at 11:44:18AM +0200, Greg Kroah-Hartman wrote:
> From: Ivan Orlov <ivan.orlov0322@gmail.com>
> 
> Now that the driver core allows for struct class to be in read-only
> memory, remove the class field of the usb_class structure and
> create the usbmisc_class static class structure declared at build time
> which places it into read-only memory, instead of having it to be
> dynamically allocated at load time.
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/usb/core/file.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/core/file.c b/drivers/usb/core/file.c
> index c4ed3310e069..0e16a9c048dd 100644
> --- a/drivers/usb/core/file.c
> +++ b/drivers/usb/core/file.c
> @@ -59,7 +59,6 @@ static const struct file_operations usb_fops = {
>  
>  static struct usb_class {
>  	struct kref kref;
> -	struct class *class;
>  } *usb_class;

Is this structure needed anymore at all now that the thing the kref was
"protecting" is gone?  I think it can be dropped entirely, right?

thanks,

greg k-h

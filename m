Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9509A738A84
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jun 2023 18:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232017AbjFUQJe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jun 2023 12:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231953AbjFUQJd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jun 2023 12:09:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF04186
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 09:09:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1ECAC615D3
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 16:09:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DCDFC433C8;
        Wed, 21 Jun 2023 16:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1687363771;
        bh=oht3L8SsHBhrMJWuKVL2oRtW+oq+7fPJYXnNcJkvMuQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dzGQGpnJFjNqBhe83MsozPkWDQYOW++rNG/NyrwFqG2yxLOAMRXwrOyJxwOAYKNkw
         feEra2VGg+Bf3DWgJRMPtEXk8xdbb3JgSXST87xnspNyqOnxsQT5hWnm3gMqyme+oP
         qdY4r4hwwzoWNoFaOE2jKutu2k87viZ2p98WZ5ME=
Date:   Wed, 21 Jun 2023 18:09:29 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ivan Orlov <ivan.orlov0322@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] USB: make usb class a const structure
Message-ID: <2023062157-disobey-kung-a565@gregkh>
References: <20230621150903.1219439-1-ivan.orlov0322@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621150903.1219439-1-ivan.orlov0322@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 21, 2023 at 07:09:03PM +0400, Ivan Orlov wrote:
> Now that the driver core allows for struct class to be in read-only
> memory, remove the usb_class structure and create the usbmisc_class
> const class structure declared at build time which places it into
> read-only memory, instead of having it to be dynamically allocated
> at load time.
> 
> Additionally, now we register usb class at startup and unregister it
> when shutting down, so we don't have to count uses of the class.
> Therefore we don't need the 'usb_class' structure anymore. Due to this
> fact, remove all static functions related to class initialization and
> deinitialization. We can't use them in 'usb.c' since they are static
> and we don't really need them anymore.
> 
> Since we have to register the class in usb_init function in 'usb.c'
> and use it in 'file.c' as well, declare the usbmisc_class structure
> as 'export' in the 'usb.h' file.
> 
> Debatable moment: the class registration and unregistration functions
> could be extracted to the 'file.c'. I think we don't want to do this
> since it would be one-line functions. They would make the code paths
> more confusing and add calling overhead.

Nah, your cleanup here was much nicer overall:

>  drivers/usb/core/file.c | 63 ++++-------------------------------------
>  drivers/usb/core/usb.c  |  6 ++++
>  drivers/usb/core/usb.h  |  1 +
>  3 files changed, 13 insertions(+), 57 deletions(-)

Deleting more lines than added is always a good thing, thanks for the
revision!

greg k-h

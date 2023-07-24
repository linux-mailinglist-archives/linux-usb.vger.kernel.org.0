Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF0475F8F8
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jul 2023 15:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbjGXNyz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jul 2023 09:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbjGXNyk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jul 2023 09:54:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E78D44ED6
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 06:52:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 84624611DC
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 13:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E680DC433C8;
        Mon, 24 Jul 2023 13:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690206739;
        bh=iY9pbzTrcV2zmEzCvFEDLumaJHDJHKnFfUMR/icSU6U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UPp0cy2UjKqRhK7Xevcoq93VBgak5pTmBvfVIwmp5N1tt65aQisN+PE0eylWmsApm
         9Msv2Ipp9xxKYWTqCLwIAvf1Nek67FCexNE1cjlJxJLKII1qKF0h6SUFtCTLQkwhxU
         xRxsJfB8Q6CmKWFntOhuPTp8lH+xgb+znGunNeTIvI5QfjhLRzkUZl3xYn9zRKMdu2
         6sFcCZFhGJXcNv8tt69YS+R/Zlu4g9h6jWT3rv1rXkclOhmVVuKVdC1nL+/gCfISqo
         Xptf9h+GgLuj2CP8xujTW8qZjY84rCtZA82V/oS7zMbU9RHqouZuTkaoO3h+U5n6hi
         4ZCNrSExH2vrQ==
Received: from johan by xi.lan with local (Exim 4.96)
        (envelope-from <johan@kernel.org>)
        id 1qNvzC-0004jd-34;
        Mon, 24 Jul 2023 15:52:31 +0200
Date:   Mon, 24 Jul 2023 15:52:30 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        liulongfang@huawei.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: hub: make sure stale buffers are not enumerated
Message-ID: <ZL6CHnYEmxssGXRG@hovoldconsulting.com>
References: <20230724124057.12975-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724124057.12975-1-oneukum@suse.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 24, 2023 at 02:40:57PM +0200, Oliver Neukum wrote:
> Quoting Alan Stern on why we cannot just check errors:
> 
> The operation carried out here is deliberately unsafe (for full-speed
> devices).  It is made before we know the actual maxpacket size for ep0,
> and as a result it might return an error code even when it works okay.
> This shouldn't happen, but a lot of USB hardware is unreliable.
> 
> Therefore we must not ignore the result merely because r < 0.  If we do
> that, the kernel might stop working with some devices.
> 
> He is absolutely right. However, we must make sure that in case
> we read nothing or a short answer, the buffer contains nothing
> that can be misinterpreted as a valid answer.
> So we have to zero it before we use it for IO.

This patch is neither correct or needed. The current implementation sets
	
	buf->bMaxPacketSize0 = 0

before reading the descriptor and makes sure that that field is non-zero
before accessing buf->bDescriptorType which lies before bMaxPacketSize0.

It may be subtle, but it looks correct.

Johan

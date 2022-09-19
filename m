Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86F285BC31D
	for <lists+linux-usb@lfdr.de>; Mon, 19 Sep 2022 08:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbiISGvS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Sep 2022 02:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbiISGvR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Sep 2022 02:51:17 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9400CDED4
        for <linux-usb@vger.kernel.org>; Sun, 18 Sep 2022 23:51:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3D34FB8128A
        for <linux-usb@vger.kernel.org>; Mon, 19 Sep 2022 06:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C213AC433C1;
        Mon, 19 Sep 2022 06:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663570273;
        bh=1rkNcLuAtMUbyRGA/rQQs3di4LgOyS75H73aSMcmUHE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H68AAoZmxi0Wgij4bL9b5dL7WSs8oT6KMYFLNUg4KmVLLEtdaamwobjIdlJp3HL9q
         DN/F9MINy5eyLDGf3JIxwiufZMhKEC69gNHEOGy7rIA23z6Z1O8OoQEyAHF6YzgX4Z
         ycIsWSnLO/L3P32WlDYFsuzTVKYWZgQGhhdLJVwapTCfS0jwCNfJsYLgZuHYCxWZjV
         rYv7AYfkZ3XsXLCK3mW/SZTHETezoVvsWvUWsR6xk6HaitDMK1gKlNKAfQJYHUWYal
         7gLG5gJbu308W7gyo3ColzC+qHPJBwd/S03GV8Io969gi16Z5LHJh5IxVrW4VcQ52j
         6PMeILENyG32g==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oaAcf-0004ut-56; Mon, 19 Sep 2022 08:51:17 +0200
Date:   Mon, 19 Sep 2022 08:51:17 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Liang He <windhl@126.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: Re: Re: Re: [PATCH] USB: serial: console: Fix potential
 use-after-free in usb_console_setup()
Message-ID: <YygRZTlYDE5xHAIk@hovoldconsulting.com>
References: <20220916073552.4093048-1-windhl@126.com>
 <YySQYi1S7GSDw7hQ@rowland.harvard.edu>
 <4b825ec3.7ceb.18346e2fa14.Coremail.windhl@126.com>
 <YySYD5URgLg3XPLs@rowland.harvard.edu>
 <7e842e47.16c8.1835378a0be.Coremail.windhl@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e842e47.16c8.1835378a0be.Coremail.windhl@126.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 19, 2022 at 09:59:17AM +0800, Liang He wrote:
> At 2022-09-16 23:36:47, "Alan Stern" <stern@rowland.harvard.edu> wrote:
> >On Fri, Sep 16, 2022 at 11:20:23PM +0800, Liang He wrote:
> >> At 2022-09-16 23:04:02, "Alan Stern" <stern@rowland.harvard.edu> wrote:
> >> >On Fri, Sep 16, 2022 at 03:35:52PM +0800, Liang He wrote:
> >> >> In usb_console_setup(), if we goto error_get_interface and the
> >> >> usb_serial_put() may finally call kfree(serial). However, the next
> >> >> line will call 'mutex_unlock(&serial->disc_mutex)' which can cause
> >> >> a potential UAF bug.
> >> >
> >> >Why not just move the mutex_unlock() call up one line, before the 
> >> >usb_serial_put()?

> >> >If the old code was unsafe then so is this, because s_mutex points to a 
> >> >mutex that is embedded within the serial structure.  If the structure 
> >> >was deallocated by usb_serial_put() then so was the mutex.

> >> Thanks for your review and this patch is indeed wrong!
> >> 
> >> But I am not sure if we can safely move the usb_serial_put()
> >> out of mutex_unlock().
> >> 
> >> If it is safe, I can give a new version of patch very soon.
> >> 
> >> Can you help me confirm if it is safe?
> >
> >I cannot.  You need to ask Johan (the USB-serial maintainer).

> Johan, please confirm if this can be accepted.

Yes, we should unlock before dropping the reference as Alan suggested.

Note however that there is no use-after-free here as USB serial core
holds another reference when the console is registered.

Johan

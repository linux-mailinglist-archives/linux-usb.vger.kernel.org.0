Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 809DA773F29
	for <lists+linux-usb@lfdr.de>; Tue,  8 Aug 2023 18:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233332AbjHHQn7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 12:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231904AbjHHQnE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 12:43:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72F861657F
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 08:55:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D3A5B62447
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 08:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E212DC433C8;
        Tue,  8 Aug 2023 08:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1691484460;
        bh=MOEfvfWX3cfAt+qCDDbDLYBWQsRGL5EpdJ+k94xf2Ys=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QfHLWOQF0UJqcYVNFqhxpAz8PIidPWNFb7O9PwKD3QfqL1Xe52UrWTQEFX7kbyiiz
         xY6JWdwxbmQ6gVJPqw0Akc+5I2d7B7aQDw6RE9aBd7l8Xq4sjX+mlL/g8fIV49eTIn
         PV2x0LXe9irhaWKaHi4i2U5cSqRxJWH4qKoLGNjY=
Date:   Tue, 8 Aug 2023 10:47:37 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Khazhy Kumykov <khazhy@google.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 0/3] USB: core: Don't overwrite device descriptor during
 reinitialization
Message-ID: <2023080828-frill-bullhorn-c646@gregkh>
References: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 04, 2023 at 03:09:04PM -0400, Alan Stern wrote:
> An outstanding syzbot bug report has been traced to a race between the
> routine that reads in the device descriptor for a device being
> reinitialized and the routine that writes the descriptors to a sysfs
> attribute file.  The problem is that reinitializing a device, like
> initializing it for the first time, stores the device descriptor
> directly in the usb_device structure, where it may be accessed
> concurrently as part of sending the descriptors to the sysfs reader.
> 
> This three-part series fixes the problem:
> 
> 	The first patch unites the code paths responsible for first
> 	reading the device descriptor in hub.c's old scheme and new
> 	scheme, so that neither of them will call
> 	usb_get_device_descriptor().
> 
> 	The second patch changes usb_get_device_descriptor(), making
> 	it return the descriptor in a dynamically allocated buffer
> 	rather than storing it directly in the device structure.
> 
> 	The third patch changes hub_port_init(), adding a new argument
> 	that specifies a buffer in which to store the device
> 	descriptor for devices being reinitialized.
> 
> As a result of these changes, the copy of the device descriptor stored
> in the usb_device structure will never be overwritten once it has been
> initialized.  This eliminates the data race causing the bug identified
> by syzbot.
> 
> It would be nice at some point to make a similar change to the code
> that reads the device's BOS descriptor; reinitialization should not
> overwrite its existing data either.  This series doesn't attempt to do
> that, but it would be a good thing to do.

Thanks for cleaning this up, all now applied.

greg k-h

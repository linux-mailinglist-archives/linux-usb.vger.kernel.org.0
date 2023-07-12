Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 688EC74FEE3
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jul 2023 07:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231540AbjGLFyE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jul 2023 01:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbjGLFyD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jul 2023 01:54:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 509AF173A
        for <linux-usb@vger.kernel.org>; Tue, 11 Jul 2023 22:54:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DA17660DCF
        for <linux-usb@vger.kernel.org>; Wed, 12 Jul 2023 05:54:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6822C433C8;
        Wed, 12 Jul 2023 05:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1689141241;
        bh=UHTq0jeExWM9vWoefd4qe+mPZ6EWBmQpT9qDgEten4Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DwKdwp6k4RMusUCLiQdMdZovAQIKszmSKf5J69I/2BHUye7kUOeiunVjlZSa+2mIp
         kLfvT8X6eI2vxC0SJOHKmvjoS4MCwBWzIbVh9F7eHrMjq/S0luCZPQz1wrlOlMJFcc
         CuQ8U+8pR/iGSpHWEb6w9LlcyWoQc5KcFEWXf5Sw=
Date:   Wed, 12 Jul 2023 07:53:57 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     mika.westerberg@linux.intel.com, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH RESEND] thunderbolt: Fix Thunderbolt 3 display flickering
 issue on 2nd hot plug onwards
Message-ID: <2023071229-deepness-radiated-e55c@gregkh>
References: <1689139946-18667-1-git-send-email-Sanju.Mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1689139946-18667-1-git-send-email-Sanju.Mehta@amd.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 12, 2023 at 12:32:26AM -0500, Sanjay R Mehta wrote:
> From: Sanjay R Mehta <sanju.mehta@amd.com>
> 
> Previously, on unplug events, the TMU mode was disabled first
> followed by the Time Synchronization Handshake, irrespective of
> whether the tb_switch_tmu_rate_write() API was successful or not.
> 
> However, this caused a problem with Thunderbolt 3 (TBT3)
> devices, as the TSPacketInterval bits were always enabled by default,
> leading the host router to assume that the device router's TMU was
> already enabled and preventing it from initiating the Time
> Synchronization Handshake. As a result, TBT3 monitors experienced
> display flickering from the second hot plug onwards.
> 
> To address this issue, we have modified the code to only disable the
> Time Synchronization Handshake during TMU disable if the
> tb_switch_tmu_rate_write() function is successful. This ensures that
> the TBT3 devices function correctly and eliminates the display
> flickering issue.
> 
> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
> Signed-off-by: Sanath S <Sanath.S@amd.com>
> ---
>  drivers/thunderbolt/tmu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Why is this a RESEND?  What changed?

And the ordering of the signed-off-by is incorrect.

thanks,

greg k-h

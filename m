Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC26750ED3
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jul 2023 18:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbjGLQmQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jul 2023 12:42:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbjGLQmP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jul 2023 12:42:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E76A1BEC
        for <linux-usb@vger.kernel.org>; Wed, 12 Jul 2023 09:42:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 49F2E6181E
        for <linux-usb@vger.kernel.org>; Wed, 12 Jul 2023 16:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E6FFC433C9;
        Wed, 12 Jul 2023 16:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1689180130;
        bh=Q5kQapaxNLuLrol8fZYQNVcVa1j8d6NRgJ78rGzu9TM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PLkYrI1TK1V89zkpV7TQD+3cTJ8GxrnuWCYsyK8OBgM4tBvtVkzjJ0b+h5hjppHbH
         hdWKtHstnH7A7gS/HQvoMEcyLeUaUvpWiMf63bqU3uUoZkFIhiW12JfgiGr23c4TGi
         pDbbOrmXzxglIy2SEdDhaRioFRbg0FK4g2Jg8s1k=
Date:   Wed, 12 Jul 2023 18:42:08 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sanjay R Mehta <sanmehta@amd.com>
Cc:     Sanjay R Mehta <Sanju.Mehta@amd.com>,
        mika.westerberg@linux.intel.com, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH RESEND] thunderbolt: Fix Thunderbolt 3 display flickering
 issue on 2nd hot plug onwards
Message-ID: <2023071235-steadier-fling-2446@gregkh>
References: <1689139946-18667-1-git-send-email-Sanju.Mehta@amd.com>
 <2023071229-deepness-radiated-e55c@gregkh>
 <af96080c-5c86-fffb-74ac-3bdcf5d4e5cc@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af96080c-5c86-fffb-74ac-3bdcf5d4e5cc@amd.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 12, 2023 at 11:33:58AM +0530, Sanjay R Mehta wrote:
> 
> 
> On 7/12/2023 11:23 AM, Greg KH wrote:
> > On Wed, Jul 12, 2023 at 12:32:26AM -0500, Sanjay R Mehta wrote:
> >> From: Sanjay R Mehta <sanju.mehta@amd.com>
> >>
> >> Previously, on unplug events, the TMU mode was disabled first
> >> followed by the Time Synchronization Handshake, irrespective of
> >> whether the tb_switch_tmu_rate_write() API was successful or not.
> >>
> >> However, this caused a problem with Thunderbolt 3 (TBT3)
> >> devices, as the TSPacketInterval bits were always enabled by default,
> >> leading the host router to assume that the device router's TMU was
> >> already enabled and preventing it from initiating the Time
> >> Synchronization Handshake. As a result, TBT3 monitors experienced
> >> display flickering from the second hot plug onwards.
> >>
> >> To address this issue, we have modified the code to only disable the
> >> Time Synchronization Handshake during TMU disable if the
> >> tb_switch_tmu_rate_write() function is successful. This ensures that
> >> the TBT3 devices function correctly and eliminates the display
> >> flickering issue.
> >>
> >> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
> >> Signed-off-by: Sanath S <Sanath.S@amd.com>
> >> ---
> >>  drivers/thunderbolt/tmu.c | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > Why is this a RESEND?  What changed?
> > 
> > And the ordering of the signed-off-by is incorrect.
> > 
> Hi Greg, My Apologies, but am unable to comprehend what I should be
> doing here. Please guide me on this.

Please go and take the AMD kernel developer class/training/something and
work with internal developers to get this right before resending it
again.

thanks,

greg k-h

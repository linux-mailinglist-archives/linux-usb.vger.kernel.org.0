Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1746617DE6
	for <lists+linux-usb@lfdr.de>; Thu,  3 Nov 2022 14:28:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231496AbiKCN2H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Nov 2022 09:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231510AbiKCN1z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Nov 2022 09:27:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B9C13F03
        for <linux-usb@vger.kernel.org>; Thu,  3 Nov 2022 06:27:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 27C3D61EAC
        for <linux-usb@vger.kernel.org>; Thu,  3 Nov 2022 13:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44CF5C433C1;
        Thu,  3 Nov 2022 13:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1667482073;
        bh=iMSXsUzCuEbonVY7obEcfOm5dNsI3CQUoXtyMb8jFzM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QO5shPhblT/xZybrlZsOwgpYIHYM1dPWMhPjKE1Ui0rK5eigtE6zKREfQ2uAbeaxH
         goHxGcPcpYN8A9NbnM3HUgQAFQNqg7p2j/+pffaj6ElbMmuKTqM9hcQzgqGQcbOitO
         Txyr2YB30S+5Ecp55EGAtNjayirHb0osAcGUaVN4=
Date:   Thu, 3 Nov 2022 22:28:34 +0900
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Albert Zhou <albert.zhou.50@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: r8152 module out of date
Message-ID: <Y2PCAn8wB7aiK+1x@kroah.com>
References: <f36495ab-4fa6-a3b1-23b9-f970cd2870ce@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f36495ab-4fa6-a3b1-23b9-f970cd2870ce@gmail.com>
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 03, 2022 at 10:00:04PM +1100, Albert Zhou wrote:
> The linux kernel v6.1-rc3 still has the old v1 driver for devices RTL8152/RTL8153: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/usb/r8152.c?h=v6.1-rc3
> 
> This results in slow ethernet speeds (I had this problem and fixed this by updating the driver); see also:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=205923
> https://bugzilla.kernel.org/show_bug.cgi?id=213685
> https://bugzilla.kernel.org/show_bug.cgi?id=103191
> 
> I fixed this issue (albeit on v5.15.0-52 on an ubuntu kernel) by updating the driver to the latest v2: https://www.realtek.com/en/component/zoo/category/network-interface-controllers-10-100-1000m-gigabit-ethernet-usb-3-0-software
> 
> The new driver is GPLv2. It would be great if this could be included in the linux kernel.

Wonderful, please submit patches to update the driver to the latest
version and we will be glad to take it.  Be sure to follow the rules
documented in the kernel tree for how to properly submit patches.

thanks,

greg k-h


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 822AA6764E6
	for <lists+linux-usb@lfdr.de>; Sat, 21 Jan 2023 08:18:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjAUHSe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 21 Jan 2023 02:18:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbjAUHSd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 21 Jan 2023 02:18:33 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF1D6E40C
        for <linux-usb@vger.kernel.org>; Fri, 20 Jan 2023 23:18:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 98F4CB829E1
        for <linux-usb@vger.kernel.org>; Sat, 21 Jan 2023 07:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C28C433EF;
        Sat, 21 Jan 2023 07:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1674285509;
        bh=9L8OEMqWvn0NRGeZoczYYYo0d4XSVhY+Mua6V2vD3BQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0OY0ym82JcExhH/+xXGRdF1t2xyhNqGVY7vi7IQcdd+LlIGZe66gm34WkQCAjEODr
         JxGQKRLiErXrVUclfd9sVqh9Invafu0zi4fHAScVNQKkDhkFKKVQgfUSUfcEtSPvCv
         JGQXK4Sq3o5Sn738kPz1TdtpjTyCRqVFrE5u2QR4=
Date:   Sat, 21 Jan 2023 08:18:26 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Ramneek Mehresh <ramneek.mehresh@freescale.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] usb: host: ehci-fsl: Fix module alias
Message-ID: <Y8uRwmMpwTLkVyVj@kroah.com>
References: <20230120122714.3848784-1-alexander.stein@ew.tq-group.com>
 <Y8rCo8ggvjy3ScdV@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8rCo8ggvjy3ScdV@rowland.harvard.edu>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 20, 2023 at 11:34:43AM -0500, Alan Stern wrote:
> On Fri, Jan 20, 2023 at 01:27:14PM +0100, Alexander Stein wrote:
> > Commit ca07e1c1e4a6 ("drivers:usb:fsl:Make fsl ehci drv an independent
> > driver module") changed DRV_NAME which was used for MODULE_ALIAS as well.
> > Starting from this the module alias didn't match the platform device
> > name created in fsl-mph-dr-of.c
> > Change DRV_NAME to match the driver name for host mode in fsl-mph-dr-of.
> > This is needed for module autoloading on ls1021a.
> > 
> > Fixes: ca07e1c1e4a6 ("drivers:usb:fsl:Make fsl ehci drv an independent driver module")
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> 
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> 
> Does this need to go in a -stable kernel?

I've already marked it to be included in stable kernels, thanks.

greg k-h

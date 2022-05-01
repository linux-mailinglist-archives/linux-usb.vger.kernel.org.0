Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29CAA5164A4
	for <lists+linux-usb@lfdr.de>; Sun,  1 May 2022 15:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242730AbiEANpV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 1 May 2022 09:45:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234564AbiEANpU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 1 May 2022 09:45:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D9957B17;
        Sun,  1 May 2022 06:41:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A5C8F60EBB;
        Sun,  1 May 2022 13:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5050C385A9;
        Sun,  1 May 2022 13:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1651412513;
        bh=k61F0ogUy4PJDIpmPhxULmPs5NoKc4vrWXFKShSBkdU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bRqrKtFgSe/pumsYsaOod7NV+SHJiJ2RvNoTdSHuQmkMz1qd0VWiNgghBoSWVMlU7
         efPMgrnwV4UMJuMGHH1MvKLFAyG1ePqwTCamvZ5SI9/tOeHi2O3bHbReaJJwYSZBM8
         +u+sDONY/VtAavMLZF4YGmmZE/N1DoJhGeqp8ksM=
Date:   Sun, 1 May 2022 15:41:42 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Kushagra Verma <kushagra765@outlook.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB / dwc3: fix checkpatch warnings
Message-ID: <Ym6OFmx4Wc1c81Y/@kroah.com>
References: <SI2PR01MB3929C96E8C81D71250BA618BF8FE9@SI2PR01MB3929.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SI2PR01MB3929C96E8C81D71250BA618BF8FE9@SI2PR01MB3929.apcprd01.prod.exchangelabs.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, May 01, 2022 at 06:46:46PM +0530, Kushagra Verma wrote:
> This patch fixes the following checkpatch warnings in core.c and
> core.h:
>    1. WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
>    2. WARNING: Possible unnecessary 'out of memory' message
>    3. WARNING: No space before tabs
> 
> It also changes 'Error to get property' to 'Couldn't get property' in
> dev_err() as the latter one is more meaningful.
> 
> Signed-off-by: Kushagra Verma <kushagra765@outlook.com>
> ---
>  drivers/usb/dwc3/core.c | 10 ++++------
>  drivers/usb/dwc3/core.h | 28 ++++++++++++++--------------
>  2 files changed, 18 insertions(+), 20 deletions(-)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFD4779E33
	for <lists+linux-usb@lfdr.de>; Sat, 12 Aug 2023 10:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233512AbjHLIFb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 12 Aug 2023 04:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232773AbjHLIFa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 12 Aug 2023 04:05:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F3DA2108
        for <linux-usb@vger.kernel.org>; Sat, 12 Aug 2023 01:05:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C9F5862F6A
        for <linux-usb@vger.kernel.org>; Sat, 12 Aug 2023 08:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAEC8C433C8;
        Sat, 12 Aug 2023 08:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1691827530;
        bh=IIiLWBzvau6//L7wXavOFdRR2yKn/N/gYON5u2BgKhY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k6MsCFWnUzNf5Y8Z1CqInl+q8E8VLRtmk+tWezi9LVBuLE0HkSk/zluW78OKIZnq4
         dmQ/QUbqErFs0NGaloVSsRkO4IBmr7r5xnD/IoxKXhnRH1l+k/qrc6kZfUtFAkVTmP
         BJnwr4lCY4xn4A9Mx4R9zjTB68wG5BnQvdquZHRc=
Date:   Sat, 12 Aug 2023 10:05:27 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Khazhy Kumykov <khazhy@google.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: core: Fix oversight in SuperSpeed initialization
Message-ID: <2023081204-concave-yoga-f6f0@gregkh>
References: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
 <20230810002257.nadxmfmrobkaxgnz@synopsys.com>
 <e070f49d-9bd2-4711-b748-b15e1a6be901@rowland.harvard.edu>
 <c1a18876-c505-4d4f-9f58-264199135905@rowland.harvard.edu>
 <20230810223824.6kgawiwerwkaj6vh@synopsys.com>
 <3c63cad6-55ef-46dd-90b7-d19cbefedbea@rowland.harvard.edu>
 <20230811170500.xbjyzmcslvajs2qv@synopsys.com>
 <8809e6c5-59d5-4d2d-ac8f-6d106658ad73@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8809e6c5-59d5-4d2d-ac8f-6d106658ad73@rowland.harvard.edu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 11, 2023 at 01:38:46PM -0400, Alan Stern wrote:
> Commit 85d07c556216 ("USB: core: Unite old scheme and new scheme
> descriptor reads") altered the way USB devices are enumerated
> following detection, and in the process it messed up the
> initialization of SuperSpeed (or faster) devices:
> 
> [   31.650759] usb 2-1: new SuperSpeed Plus Gen 2x1 USB device number 2 using xhci_hcd
> [   31.663107] usb 2-1: device descriptor read/8, error -71
> [   31.952697] usb 2-1: new SuperSpeed Plus Gen 2x1 USB device number 3 using xhci_hcd
> [   31.965122] usb 2-1: device descriptor read/8, error -71
> [   32.080991] usb usb2-port1: attempt power cycle
> ...
> 
> The problem was caused by the commit forgetting that in SuperSpeed or
> faster devices, the device descriptor uses a logarithmic encoding of
> the bMaxPacketSize0 value.  (For some reason I thought the 255 case in
> the switch statement was meant for these devices, but it isn't -- it
> was meant for Wireless USB and is no longer needed.)
> 
> We can fix the oversight by testing for buf->bMaxPacketSize0 = 9
> (meaning 512, the actual maxpacket size for ep0 on all SuperSpeed
> devices) and straightening out the logic that checks and adjusts our
> initial guesses of the maxpacket value.
> 
> Reported-and-tested-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Closes: https://lore.kernel.org/linux-usb/20230810002257.nadxmfmrobkaxgnz@synopsys.com/
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Fixes: 85d07c556216 ("USB: core: Unite old scheme and new scheme descriptor reads")
> 
> ---
> 
>  drivers/usb/core/hub.c |   36 ++++++++++++++++++++++++------------
>  1 file changed, 24 insertions(+), 12 deletions(-)

Process nit, when you add a patch to an existing patch series like this,
when I run `b4` to download and apply the patch, it sucks in the
original patch series, not this add-on patch (which then of course fails
as the original patch series was already applied.)

So, if it's easy enough, can you just send add-on patches for stuff that
has been applied, as a new thread?  That way the tools handle it
automatically and I don't have to hand edit/apply the patch?

thanks,

greg k-h

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD46C6D087D
	for <lists+linux-usb@lfdr.de>; Thu, 30 Mar 2023 16:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231322AbjC3Ok6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Mar 2023 10:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231151AbjC3Okz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Mar 2023 10:40:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8E1F8A5A
        for <linux-usb@vger.kernel.org>; Thu, 30 Mar 2023 07:40:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6BF7C620A3
        for <linux-usb@vger.kernel.org>; Thu, 30 Mar 2023 14:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE7BC433D2;
        Thu, 30 Mar 2023 14:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1680187245;
        bh=cI/FdwncyAEYdO0eTemr+1uAmXSoAKetudERYrk/YVQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2ivAW4+nGoRh9oP1u9MCv3oQFom4KMn24hYgYtKK2TssQlSycUXFlZVIJ2XHzXnUV
         WUtHcbK4u1tjlzkbJuJ9waNjfT8R60xCuKjVzY4FbW6GoXACuyZmWSk2EJ/aVXURzx
         G11uRMENw1+XR4SWeCXX73X//YGl/gwR0JMkOzEg=
Date:   Thu, 30 Mar 2023 16:40:43 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/3] Revert "usb: xhci-pci: Set PROBE_PREFER_ASYNCHRONOUS"
Message-ID: <ZCWfa9Hqs_mF8GKh@kroah.com>
References: <20230330143056.1390020-1-mathias.nyman@linux.intel.com>
 <20230330143056.1390020-3-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330143056.1390020-3-mathias.nyman@linux.intel.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 30, 2023 at 05:30:55PM +0300, Mathias Nyman wrote:
> This reverts commit 4c2604a9a6899bab195edbee35fc8d64ce1444aa.
> 
> Asynch probe caused regression in a setup with both Renesas and Intel xHC
> controllers. Devices connected to the Renesas disconnected shortly after
> boot. With Asynch probe the busnumbers got interleaved.
> 
> xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
> xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus number 2
> xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 3
> xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus number 4
> 
> Reason why this commit causes regression is still unknown, but revert it
> while debugging the issue.
> 
> Link: https://lore.kernel.org/linux-usb/20230307132120.5897c5af@deangelis.fenrir.org.uk
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

I'll add a Fixes: and cc: stable on this, ok?

thanks,

greg k-h

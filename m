Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 176F95FFEFE
	for <lists+linux-usb@lfdr.de>; Sun, 16 Oct 2022 13:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbiJPLrX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Oct 2022 07:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiJPLrV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Oct 2022 07:47:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97224357EF
        for <linux-usb@vger.kernel.org>; Sun, 16 Oct 2022 04:47:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 20C3660A4B
        for <linux-usb@vger.kernel.org>; Sun, 16 Oct 2022 11:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ACB7C433C1;
        Sun, 16 Oct 2022 11:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1665920839;
        bh=939rYgjXfEkUXa4BlOnOuDMNGiTFLQepD5vWv0ahUMc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2p3em1AMm8AWm4uG9Qj2UeQPL27JiaNHE0osu8v+/1jrD1W/5ISQNXPT/RgH/C2S8
         hEcXmPL4rRm/DxcF93tSImn4ChWJkaRvvIgXEKg/TmqpRZMlVQQZwtEpJxW9pJSq9X
         2McvFFHtzTpcRT8VhqE9mQspxqEhjMd3IeLaZ8/o=
Date:   Sun, 16 Oct 2022 13:48:05 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Chun-Chao Yen <nothingstopsme@hotmail.com>
Cc:     pabeni@redhat.com, davem@davemloft.net, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/3 (RESENT)] net: usb: ax88179_178a: Enable
 FLAG_MULTI_PACKET to improve tx stability
Message-ID: <Y0vvddh+uCONluRH@kroah.com>
References: <ME3P282MB28276594FEE8942909123B30D1269@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ME3P282MB28276594FEE8942909123B30D1269@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Oct 16, 2022 at 07:36:25PM +0800, Chun-Chao Yen wrote:
> Problem Description:
> The current way of handling the boundary case in tx, i.e. adding one-byte
> padding when the size of an outbound packet is a multiple of the maximum
> frame size used for USB bulk transfer, does not work with the hardware.
> This can be shown by running a loading test via iperf with this hardware as
> the sender; one can then tune the iperf parameters on the sender side (e.g.
> "-M 510" in my testing environment) so that sent packets frequently hit the
> boundary condition, and observe a significant drop in the transmission
> rate. In the worst case (often after a long run), the hardware can stop
> functioning (can not send or receive packets anymore, albeit the
> corresponding network interface is still reported present by ifconfig).
> 
> It is also believed that this problem is highly relevant to this bug [1].
> 
> Solution:
> Enable FLAG_MULTI_PACKET and modify both ax88179_rx_fixup() and
> ax88179_tx_fixup() accordingly.
> 
> Rationale:
> When FLAG_MULTI_PACKET is enabled (and FLAG_SEND_ZLP is off, which is the
> case for this driver), usbnet will skip padding, and trust that each
> sk_buff returned from the mini-driver's tx_fixup function has been taken
> care of to cater for the requirement of its target hardware. That
> mechanism allows this mini-driver to send, even when the boundary condition
> is detected, "untampered" packets (no padding, no extra flags, as if in the
> normal case) that the hardware accepts, and therefore resolves this
> problem.
> 
> Note that rather than being viewed as a workaround, enabling
> FLAG_MULTI_PACKET is intended to better match the overall behaviour of the
> hardware, as it also echos well the rx procedure conducting multiple-packet
> extraction from a single sk_buff in ax88179_rx_fixup().
> 
> Verification:
> Only tested with this device:
> 0b95:1790 ASIX Electronics Corp. AX88179 Gigabit Ethernet
> 
> References:
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=212731
> 
> Signed-off-by: Chun-Chao Yen <nothingstopsme@hotmail.com>
> ---
>  drivers/net/usb/ax88179_178a.c | 62 ++++++++++++++--------------------
>  1 file changed, 26 insertions(+), 36 deletions(-)

Why is this a RESEND?

Always put below the --- what is happening, what is different from the
first version you sent?

And why is this not threaded with the 2/3 and 3/3 patches?

thanks,

greg k-h

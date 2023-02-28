Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B029B6A5805
	for <lists+linux-usb@lfdr.de>; Tue, 28 Feb 2023 12:27:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231500AbjB1L1n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Feb 2023 06:27:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231527AbjB1L1m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Feb 2023 06:27:42 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64A382E821
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 03:27:10 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EA33CB80D58
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 11:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55028C433D2;
        Tue, 28 Feb 2023 11:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1677583552;
        bh=lV5vPNJsd5xnPb1ZH2xpOTx2YepFND5r2yjdi+r1awA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=otsO6r0ki3KLbioqxxFc7QetKoBjh3kOQF3ck7CZuu5iCnCeQIkHC4dYGUpG/1TBN
         RwiJSbe3dQrymFWFz/Ub4P9u+I4IZBnwP8ru889kr7vYsQkV85RqXj71cd6G5QH7Pp
         K7ReYOJs0l6JmRcpUv2nd72j6DRZymegN7esF/sA=
Date:   Tue, 28 Feb 2023 12:25:50 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yen ChunChao <nothingstopsme@hotmail.com>
Cc:     "davem@davemloft.net" <davem@davemloft.net>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 1/3 RFC] net: usb: ax88179_178a: Enable FLAG_MULTI_PACKET
 to improve tx stability
Message-ID: <Y/3kvjoTv7UDDqTj@kroah.com>
References: <ME3P282MB2827A82474F353487FF91CE4D15F9@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB2827E9AD698A7F925EB1E9BAD1AC9@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB2827F38828DB53102F370FA0D1AC9@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ME3P282MB2827F38828DB53102F370FA0D1AC9@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 28, 2023 at 09:44:43AM +0000, Yen ChunChao wrote:
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
> This is the same patch as https://rb.gy/199s5m sent in Oct. 2022.
> I just would like to know the current state of this patch.
> Has it been rejected or still under review?

Patches marked with "RFC" are never to be applied, what needs to be done
on this in order for you to feel comfortable enough to submit it for
actualy inclusion?

Please do that and then send it out properly.

Also, I think vger still bans hotmail.com emails, sorry, please use a
better email provider if you wish to contribute to the kernel.

thanks,

greg k-h

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9837A6B1025
	for <lists+linux-usb@lfdr.de>; Wed,  8 Mar 2023 18:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbjCHRZ1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Mar 2023 12:25:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjCHRZZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Mar 2023 12:25:25 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43D9F60A8A
        for <linux-usb@vger.kernel.org>; Wed,  8 Mar 2023 09:25:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1C7EC6187A
        for <linux-usb@vger.kernel.org>; Wed,  8 Mar 2023 17:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060CBC433D2;
        Wed,  8 Mar 2023 17:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678296322;
        bh=Cs6CK+or4xNFoDW6vhZwHmtvm+/j2BOTqoa17wP4Rzg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MfeCwUb5FZi4oThFfQyLskMKiQMqoSGLC0XDM2zilb5UIDCYEnSmzQoeTNEN0o0Cr
         FTM/I410iJhhm+UJXxYOM39ytZ9eRV16JmPBcMbLm4MXlkXKPtRhzoCgI1q6GvS0OI
         ivux0CUlWmdmJqarYqjDj6099CFPRUbbwm/r2i+U=
Date:   Wed, 8 Mar 2023 18:25:14 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "ran.wang_1@nxp.com" <ran.wang_1@nxp.com>
Subject: Re: dwc3 gadget and USB3
Message-ID: <ZAjE+p4IoXk/kvXu@kroah.com>
References: <c604031d4e3aa215b90f73e9a2dd55e7e116186f.camel@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c604031d4e3aa215b90f73e9a2dd55e7e116186f.camel@infinera.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 08, 2023 at 05:10:17PM +0000, Joakim Tjernlund wrote:
> we are using fsl-ls1043a-rdb based design but with a ls1023a SOC and
> use USB0 in gadget mode running either NCM or RNDIS ethernet on top.
> 
> When we connect the gadget to a PC(Linux of Windows) over an USB2 hub,
> networking(NCM or RNDIS) works well.
> 
> However, when we connect the gadget directly to the PC/laptop which uses USB3
> we see something odd:
>   Ping from PC to gadget works.
>   Ping from gadget to laptop does not. However if we also ping from PC at the same time we
>   see gadget to PC start working.
> Seems like ping from the PC tiggers the gadget to see incoming pkgs somehow.
> 
> Any idea what might be wrong or how to debug this?
> Kernel 5.15.87

5.15.y is very old, does this also happen on 6.2?

thanks,

greg k-h

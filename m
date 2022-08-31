Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59EA85A7768
	for <lists+linux-usb@lfdr.de>; Wed, 31 Aug 2022 09:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbiHaHWf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 Aug 2022 03:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiHaHWe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 Aug 2022 03:22:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65A395E5D
        for <linux-usb@vger.kernel.org>; Wed, 31 Aug 2022 00:22:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 51E2461890
        for <linux-usb@vger.kernel.org>; Wed, 31 Aug 2022 07:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51156C433C1;
        Wed, 31 Aug 2022 07:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1661930552;
        bh=ok+piTgBbVwWeFnhpQXwZ1BU0HwNdxCdX85LE8dm71A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sgGPAKinBrbZ4GKVPUiS0yoqItzwU8EWGSaI+nsyOEljPNw914R68jsx5b10MilUe
         6+7TG2U48DjKbdbyCPcPsNnzcOG68xvJejuyTIG8Zns8kpkfvI/QlhbgmBI9YtlQrw
         gr3W35osk5EYpVpDfW7ntMoPN1ZsP7PQKyqoEVy4=
Date:   Wed, 31 Aug 2022 09:22:29 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     zenghongling <zhongling0719@126.com>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH] uas: add no-uas quirk for Thinkplus and Hiksemi
 usb-storage
Message-ID: <Yw8MNa3vPEtkIQsj@kroah.com>
References: <1661930031-21908-1-git-send-email-zhongling0719@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1661930031-21908-1-git-send-email-zhongling0719@126.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 31, 2022 at 03:13:51PM +0800, zenghongling wrote:
> The UAS mode of Thinkplus and Hiksemi is reported to fail to work on
> several platforms with the following error message:
> 
> [   39.702439] xhci_hcd 0000:0c:00.3: ERROR Transfer event for disabled endpoint or incorrect stream ring
> [   39.702442] xhci_hcd 0000:0c:00.3: @000000026c61f810 00000000 00000000 1b000000 05038000
> 
> And when running iozone will disconnect from the USB controller, then after re-connecting the device
> will be offlined and not working at all.

Plese wrap your changelog at the properly length here (the warning
message is fine.)

> 
> Signed-off-by: zenghongling <zhongling0719@126.com>
> ---
>  drivers/usb/storage/unusual_uas.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index cdff7dc..bb0d31d 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -215,6 +215,24 @@ UNUSUAL_DEV(0x4971, 0x1012, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_IGNORE_UAS),
>  
> +UNUSUAL_DEV(0x17ef, 0x3899, 0x0000, 0x9999,
> +		"Thinkplus",
> +		"External HDD",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_IGNORE_UAS),
> +
> +UNUSUAL_DEV(0x090c, 0x2000, 0x0000, 0x9999,
> +		"Hiksemi",
> +		"External HDD",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_IGNORE_UAS),
> +
> +UNUSUAL_DEV(0x0bda, 0x9210, 0x0000, 0x9999,
> +		"Hiksemi",
> +		"External HDD",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_IGNORE_UAS),

These need to be in sorted order by vendor and product id in the file.

And all of these do not support UAS?  How slow does this change then
make this device?  You are defaulting back to the old-style usb-storage
protocol which is very very slow.  Why are these devices exposing a UAS
device if it does not work at all?

thanks,

greg k-h

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E33AD4CB8A6
	for <lists+linux-usb@lfdr.de>; Thu,  3 Mar 2022 09:21:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbiCCIWb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Mar 2022 03:22:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbiCCIWa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Mar 2022 03:22:30 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBF2D171874;
        Thu,  3 Mar 2022 00:21:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 55DD761AAD;
        Thu,  3 Mar 2022 08:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B59D2C004E1;
        Thu,  3 Mar 2022 08:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646295704;
        bh=Gp6JglkhjTdAVrzVd96E3S7hvE4cbhVXiV0LaXlu1+8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gVeWsBsFmJjqd/M0UDKsCa9PwCDab68I/C7hyff7wFeDn8dIZaEAnRxtUiZAvIoiN
         YXIGndqRXGDEud7HAOK68XYWvp3PwD0HOUurBSuXtMuIA9rxTenQI1QCh+87+jbH3G
         ZKwK7NZ8bAYGta5DZFlB2ghO/l4/9usaqLfZ/UoeZED4pq+Pr4epTUFUonpSk9/w3q
         BV60J+cRbF7I1AK91S7zF7Cwg2yvPrVnWEJvgEbCJOvfq+pnXmKq1YfrmQvfqXMdOW
         TnxBCDRfqKv4bM2+jk9W9Pt3uB/JeZtjp+fXzwVkTacxrwf/4WLhvdjk+24uaj9MDD
         JMhGeX+W53zzA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1nPgiU-0001j1-2Q; Thu, 03 Mar 2022 09:21:42 +0100
Date:   Thu, 3 Mar 2022 09:21:42 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Dawid Buchwald <buchwald.dawid@gmail.com>
Cc:     linux-serial@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] Support for new variant of PL2303GS adapter
Message-ID: <YiB6llY1e+QGekyL@hovoldconsulting.com>
References: <CAHxGD_vXqJS-6W6AS2hc7H-2ht8Ofy16faSpgaqoDArk3CY0Qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHxGD_vXqJS-6W6AS2hc7H-2ht8Ofy16faSpgaqoDArk3CY0Qw@mail.gmail.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[ +CC: linux-usb ]

On Wed, Mar 02, 2022 at 07:47:17PM +0100, Dawid Buchwald wrote:
> This is the issue I have with recently acquired PL2303 adapter:
> 
> [   70.502848] usb 1-2: new full-speed USB device number 5 using xhci_hcd
> [   70.652523] usb 1-2: New USB device found, idVendor=067b,
> idProduct=23f3, bcdDevice= 6.05
> [   70.652533] usb 1-2: New USB device strings: Mfr=1, Product=2,
> SerialNumber=3
> [   70.652538] usb 1-2: Product: USB-Serial Controller
> [   70.652540] usb 1-2: Manufacturer: Prolific Technology Inc.
> [   70.652543] usb 1-2: SerialNumber: CJAKj19B616
> [   70.674558] usbcore: registered new interface driver usbserial_generic
> [   70.674578] usbserial: USB Serial support registered for generic
> [   70.677490] usbcore: registered new interface driver pl2303
> [   70.677498] usbserial: USB Serial support registered for pl2303
> [   70.677510] pl2303 1-2:1.0: pl2303 converter detected
> [   70.677513] pl2303 1-2:1.0: unknown device type, please report to
> linux-usb@vger.kernel.org
> 
> Signed-off-by: Dawid Buchwald <buchwald.dawid@gmail.com>

Thanks for the patch. Looks good, but unfortunately it has been
whitespace damaged (tabs replaced by space, e.g. by your mailer) and
doesn't apply.

I could fix it up for you if you prefer, but it's probably better if
you get this fixed on your end so you're all set for your future
contributions.

Try sending the patch to yourself first and make sure you can apply it
with git-am. Take a look at git-send-email too for sending.

Please also add a "USB: serial: pl2303: " prefix to the Subject line and
shorten the current subject somewhat (e.g. "add support for PL2303GS").

For completeness, please also include the output of "lsusb -v" for this
device. It can replace the log snipped above.

> ---
> diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
> index a70fd86f735c..1072f8eb6ab9 100644
> --- a/drivers/usb/serial/pl2303.c
> +++ b/drivers/usb/serial/pl2303.c
> @@ -435,6 +435,7 @@ static int pl2303_detect_type(struct usb_serial *serial)
>                 case 0x105:
>                 case 0x305:
>                 case 0x405:
> +               case 0x605:
>                         /*
>                          * Assume it's an HXN-type if the device doesn't
>                          * support the old read request value.

Johan

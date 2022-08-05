Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D08C58A980
	for <lists+linux-usb@lfdr.de>; Fri,  5 Aug 2022 12:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240179AbiHEKcb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Aug 2022 06:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237773AbiHEKca (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Aug 2022 06:32:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F16E21835
        for <linux-usb@vger.kernel.org>; Fri,  5 Aug 2022 03:32:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CF5B96190B
        for <linux-usb@vger.kernel.org>; Fri,  5 Aug 2022 10:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6C4C433C1;
        Fri,  5 Aug 2022 10:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659695547;
        bh=ZarhKmS1oS/D0W4j4Nq2DFeqji6pqgnAiYZUvwb8/UU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QSQdibxo9yo5kqLVVmrorf+uOV3N/Ct7S0gtgv/k/tz0614MmBOYMJ4uGPe3dCxzs
         3udQ/Okw8YDjWCM9AT87Yc9nhiR8R/fQBy304HU4fKjBn9tM8Y8XwBboEAsvGqI8sD
         SfckFTTUPlFpn/hwkatc+R4JiaPIoNUxZtF/QpTGwR+4SlDz/JNimN0tS61EiualFm
         aeCsbNDtiRIt7C9fiAhlqeotys28Mg0e1ex5wU2lvPhhHEgESWSgw+wN7IDmEEHIou
         OXrcRMhRmhRgIStzgcgzwK+Sfa3NcZpYVanNZDHaCFCCYLBEBXgp1LPRaom9TF9K9e
         lZBaiUYQDRh7g==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oJudP-0001tg-2o; Fri, 05 Aug 2022 12:32:51 +0200
Date:   Fri, 5 Aug 2022 12:32:51 +0200
From:   Johan Hovold <johan@kernel.org>
To:     "niek.nooijens@omron.com" <niek.nooijens@omron.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Fw: Linux kernel patch for Omron CS1W-CIF31
Message-ID: <Yuzx02AZDD+ReI+r@hovoldconsulting.com>
References: <OS3P286MB149554090367DE82B0D687FFF69A9@OS3P286MB1495.JPNP286.PROD.OUTLOOK.COM>
 <YuorqOROzWlh8MY9@hovoldconsulting.com>
 <OS3P286MB1495F452606C51D673D2519DF69C9@OS3P286MB1495.JPNP286.PROD.OUTLOOK.COM>
 <OS3P286MB14959D8566969A709A50F2A7F69C9@OS3P286MB1495.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OS3P286MB14959D8566969A709A50F2A7F69C9@OS3P286MB1495.JPNP286.PROD.OUTLOOK.COM>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 03, 2022 at 08:51:18AM +0000, niek.nooijens@omron.com wrote:

> From: Niek Nooijens / IAB <niek.nooijens@omron.com>
> Sent: Wednesday, August 3, 2022 10:49 AM
> To: Johan Hovold <johan@kernel.org>
> Cc: linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>
> Subject: Re: Linux kernel patch for Omron CS1W-CIF31 
>  
> Hi Johan
> 
> Thanks for the feedback. I updated the patch and pasted the result
> below and in
> https://github.com/torvalds/linux/commit/03c572442d10dc88f7c50b9ea957894ebf702c84
> scripts/checkpatch.pl states
> "0001-USB-serial-ftdi_sio-add-Omron-CS1W-CIF31-device-id.patch has no
> obvious style problems and is ready for submission." 

Thanks for the update. Your v2 looks good, but there's still some
problem with the formatting as your mailer is corrupting the patch (e.g.
replacing tabs with spaces).

That's why I suggested you send the patch to yourself and run
checkpatch.pl on it after it's been sent by mail.

> git-send-email doesn't seem to work unfortunately. So I'll send it in
> plain text this way. (I had outlook web clear all formatting).

If you're not able to get git-send-email to work, you can send the patch
to me as an attachment and I'll get it merged. That won't happen for a
few weeks (e.g. after the merge window has closed) so you got plenty of
time if you want get your patch-submission infrastructure set up.

Johan

> ================begin patch================
> From 03c572442d10dc88f7c50b9ea957894ebf702c84 Mon Sep 17 00:00:00 2001 
> From: Niek Nooijens <niek.nooijens@omron.com>
> Date: Mon, 1 Aug 2022 10:39:25 +0200
> Subject: [PATCH] USB: serial: ftdi_sio: add Omron CS1W-CIF31 device id
> 
> works perfectly with:
> modprobe ftdi_sio
> echo "0590 00b2" | tee
> /sys/module/ftdi_sio/drivers/usb-serial\:ftdi_sio/new_id > /dev/null
> 
> but doing this every reboot is a pain in the ass.
> 
> Signed-off-by: Niek Nooijens <niek.nooijens@omron.com>
> ---
>  drivers/usb/serial/ftdi_sio.c     | 2 ++
>  drivers/usb/serial/ftdi_sio_ids.h | 6 ++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
> index d5a3986dfee7..52d59be92034 100644
> --- a/drivers/usb/serial/ftdi_sio.c
> +++ b/drivers/usb/serial/ftdi_sio.c
> @@ -1045,6 +1045,8 @@ static const struct usb_device_id id_table_combined[] = {
>       /* IDS GmbH devices */
>       { USB_DEVICE(IDS_VID, IDS_SI31A_PID) },
>       { USB_DEVICE(IDS_VID, IDS_CM31A_PID) },
> +     /* Omron devices */
> +     { USB_DEVICE(OMRON_VID, OMRON_CS1W_CIF31_PID) },
>       /* U-Blox devices */
>       { USB_DEVICE(UBLOX_VID, UBLOX_C099F9P_ZED_PID) },
>       { USB_DEVICE(UBLOX_VID, UBLOX_C099F9P_ODIN_PID) },
> diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_sio_ids.h
> index 4e92c165c86b..b99714c2f8cd 100644
> --- a/drivers/usb/serial/ftdi_sio_ids.h
> +++ b/drivers/usb/serial/ftdi_sio_ids.h
> @@ -1587,6 +1587,12 @@
>  #define IDS_SI31A_PID              0x13A2
>  #define IDS_CM31A_PID              0x13A3
>  
> +/*
> + * Omron corporation (https://www.omron.com/).
> + */
> + #define OMRON_VID                 0x0590
> + #define OMRON_CS1W_CIF31_PID            0x00b2
> +
>  /*
>   * U-Blox products (http://www.u-blox.com).
>   */

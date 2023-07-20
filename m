Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E91575A81F
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jul 2023 09:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231714AbjGTHtN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jul 2023 03:49:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjGTHtM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jul 2023 03:49:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 759392127
        for <linux-usb@vger.kernel.org>; Thu, 20 Jul 2023 00:49:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 01EF7618E5
        for <linux-usb@vger.kernel.org>; Thu, 20 Jul 2023 07:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC34C433C7;
        Thu, 20 Jul 2023 07:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689839350;
        bh=RM2gHEnB2mmQkCwZ9VsStgwu5Zsq7Y0yIK5rjMmjBag=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fNPiepMwOW8N8jQ0o4R+2g6U5adhdduixjyaEAcM6rI7e1KGyhzQBwC6g05YrdkBv
         3rIPTeTaES44/7FDQZoS5h7JZk7P0r82Hgb6uyyMitX00R6Wb+bUizT3kKbd1UGglC
         2eGv5C9Akl04dALl/MUmDPx0OcHcnji/i/hwvoOpHJ9HggjoZvkmegrzQEaxpMwFNt
         Qsvj8YCPMlF0DGX2m6qiUHXjalbQdMxWNncceDVylCJpjIKsmeSoSln9BurViyw2Qb
         gKIrvi5Ea2aDpBPVQw4bvLPrZixKYV+FdJI09bvjH294wJ+0NcsuT2/ZyXkVWMgzpz
         on1/LzwZ64RKg==
Received: from johan by xi.lan with local (Exim 4.96)
        (envelope-from <johan@kernel.org>)
        id 1qMOPV-0001vD-0S;
        Thu, 20 Jul 2023 09:49:17 +0200
Date:   Thu, 20 Jul 2023 09:49:17 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org,
        Kaufmann Automotive GmbH <info@kaufmann-automotive.ch>
Subject: Re: [PATCHv2] USB: serial-simple: adding Kaufmann RKS+CAN VCP
Message-ID: <ZLjm_XyKwqgGBNLn@hovoldconsulting.com>
References: <20230712141710.3116-1-oneukum@suse.com>
 <20230712141710.3116-2-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230712141710.3116-2-oneukum@suse.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 12, 2023 at 04:16:41PM +0200, Oliver Neukum wrote:
> Adding the device and product ID
> The device is a is a CAN bus interface / license dongle
> The device thus is usable either directly from user space
> or can be attached to a kernel CAN interface with slcan_attach

I reworded the above slightly and added the missing full stops to make
it a bit more readable. The result is here:

	https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/commit/?h=usb-linus&id=66672e61d4a6f8f9011b031d366eeb450fa41117

> v2: improve change log

In the future, please keep the changelog below the --- line.

> Reported-by: Kaufmann Automotive GmbH <info@kaufmann-automotive.ch>
> Tested-by: Kaufmann Automotive GmbH <info@kaufmann-automotive.ch>
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/serial/usb-serial-simple.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/serial/usb-serial-simple.c b/drivers/usb/serial/usb-serial-simple.c
> index 4c6747889a19..3612031030bb 100644
> --- a/drivers/usb/serial/usb-serial-simple.c
> +++ b/drivers/usb/serial/usb-serial-simple.c
> @@ -117,6 +117,11 @@ DEVICE(suunto, SUUNTO_IDS);
>  	{ USB_DEVICE(0x908, 0x0004) }
>  DEVICE(siemens_mpi, SIEMENS_IDS);
>  
> +/* KAUFMANN RKS+CAN VCP */
> +#define KAUFMANN_IDS()			\
> +	{ USB_DEVICE(0x16d0, 0x0870) }
> +DEVICE(kaufmann, KAUFMANN_IDS);
> +
>  /* All of the above structures mushed into two lists */
>  static struct usb_serial_driver * const serial_drivers[] = {
>  	&carelink_device,
> @@ -133,6 +138,7 @@ static struct usb_serial_driver * const serial_drivers[] = {
>  	&hp4x_device,
>  	&suunto_device,
>  	&siemens_mpi_device,
> +	&kaufmann_device,
>  	NULL
>  };
>  
> @@ -151,6 +157,7 @@ static const struct usb_device_id id_table[] = {
>  	HP4X_IDS(),
>  	SUUNTO_IDS(),
>  	SIEMENS_IDS(),
> +	KAUFMANN_IDS(),
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(usb, id_table);

Looks like you forgot to move the new entries to maintain the
(approximate) sort order as I asked you to do. I fixed that up before
applying.

Johan

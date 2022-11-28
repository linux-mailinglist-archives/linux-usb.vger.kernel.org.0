Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99DD463ABD5
	for <lists+linux-usb@lfdr.de>; Mon, 28 Nov 2022 16:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbiK1PAb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Nov 2022 10:00:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbiK1PAa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Nov 2022 10:00:30 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6325C1FD
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 07:00:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1956DB80DEB
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 15:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8657C433C1;
        Mon, 28 Nov 2022 15:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669647626;
        bh=sTu/IqkvEPjUj9eaVh0/gN7mZyNSqkNNV2SI0Wx5Djk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n1rkqZaZU8iB47t868revk3qUMex3eXLLk58k3C9lRoki+flnMi2EyLoBYVW1FhQt
         cx2GHJK2fmFp0WqDqucWJFFv5iPL69YPmCaNRoZBZqTDeRr2uKY2Z64j/fkqR2cwu5
         tC0VIFw+fB8R0iIpUysK4hCRiESeU0XAY3sX+YOrORyFlOpYZNYcTQzhbwtJpgPJ1k
         isGZXXrJWlZWYoNCjq7YTJdFpO0hR5AtbjTbv6LLw7FyAbK9jPyJjBNDry6ti7zx9a
         ewRddRpIxo2kcuunuc36FkTcCDJNpIRSWQ/02FGKr/oTxrxa1GamXOUHHX56q4Fjgd
         n6UBXr0UKlzoA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ozfcN-0002TD-TD; Mon, 28 Nov 2022 16:00:24 +0100
Date:   Mon, 28 Nov 2022 16:00:23 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 2/7] USB: serial: ftdi_sio: Add missing baud rate
 validation
Message-ID: <Y4TNB9AW0Vz8jBkr@hovoldconsulting.com>
References: <20220924102718.2984-1-pali@kernel.org>
 <20220924102718.2984-3-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220924102718.2984-3-pali@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Sep 24, 2022 at 12:27:13PM +0200, Pali Rohár wrote:
> Add lower checks for requested baud rate for FT8U232AM, FT232BM, FT2232C,
> FT232RL, FTX, FT2232H, FT4232H and FT232H. For all of these the minimum
> baud rate they can generate is 183 Baud.
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>
> Tested-by: Marek Behún <kabel@kernel.org>
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>  drivers/usb/serial/ftdi_sio.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
> index b2febe8d573a..bfa601fc14fe 100644
> --- a/drivers/usb/serial/ftdi_sio.c
> +++ b/drivers/usb/serial/ftdi_sio.c
> @@ -1335,7 +1335,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
>  		}
>  		break;
>  	case FT8U232AM: /* 8U232AM chip */
> -		if (baud <= 3000000) {
> +		if (baud >= 183 && baud <= 3000000) {
>  			div_value = ftdi_232am_baud_to_divisor(baud);
>  		} else {
>  			dev_dbg(dev, "%s - Baud rate too high!\n", __func__);

As someone else already pointed out, you should update these too. Please
drop the exclamation mark while at it:

	dev_dbg(dev, "invalid line speed\n")

should do.

Note that this series needs to be rebased on 6.1-rc too as the context
has changed.

> @@ -1348,7 +1348,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
>  	case FT2232C: /* FT2232C chip */
>  	case FT232RL: /* FT232RL chip */
>  	case FTX:     /* FT-X series */
> -		if (baud <= 3000000) {
> +		if (baud >= 183 && baud <= 3000000) {
>  			u16 product_id = le16_to_cpu(
>  				port->serial->dev->descriptor.idProduct);
>  			if (((product_id == FTDI_NDI_HUC_PID)		||

I think there's another dev_dbg() here below.

> @@ -1372,7 +1372,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
>  	case FT232H:  /* FT232H chip */
>  		if ((baud <= 12000000) && (baud >= 1200)) {
>  			div_value = ftdi_2232h_baud_to_divisor(baud);
> -		} else if (baud < 1200) {
> +		} else if (baud >= 183 && baud < 1200) {
>  			div_value = ftdi_232bm_baud_to_divisor(baud);
>  		} else {
>  			dev_dbg(dev, "%s - Baud rate too high!\n", __func__);

Same here.

Johan

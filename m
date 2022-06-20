Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C02F55148F
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jun 2022 11:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238852AbiFTJjc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jun 2022 05:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241231AbiFTJjX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jun 2022 05:39:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCB4821AD
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 02:39:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6742461382
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 09:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC0D5C3411B;
        Mon, 20 Jun 2022 09:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655717961;
        bh=jc7FVa9EzUwjhDNDYn8ZHxzuVDckc11DP//IKIiLFAs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hD7OnKGny9r6pMNR+BCN9ExakemUmJctj30hrvRVKF2juM/0DB8MzHelIEaTpCMKy
         C0CeYMLQ/c+HtaiqE6W10tV+FZGrENvzXBiCjgl3WMSzWT63jrJNZZyvn8DmOI9HWh
         hxErlVzEbI3oDx/U9OCVHIRxB+aZ2tRXWZy/v876C0Dmk7hnd9f8NbJKFh+lnrbYzh
         jlmJnEUva0gjNdpIy5xg5GG3LoJvPNHQhqouEzYWGqFiruxWM3M7dOuEOAdywPCIz5
         HvbDYgJxG1+OGaKH+7FXU3c3jgQg+Tgj2OY1EvOhskRjpcjrXBirWXSkMS9q0VaEIU
         vH5EV6aIx63Kw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1o3DsM-00081A-C0; Mon, 20 Jun 2022 11:39:18 +0200
Date:   Mon, 20 Jun 2022 11:39:18 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        charles-yeh@prolific.com.tw
Subject: Re: [PATCH] USB: serial: pl2303: Modify the detection method of
 PL2303HXN (TYPE_HXN)
Message-ID: <YrBARs5dfARHW9Rl@hovoldconsulting.com>
References: <20220617133514.357-1-charlesyeh522@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617133514.357-1-charlesyeh522@gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 17, 2022 at 09:35:14PM +0800, Charles Yeh wrote:
> The setting value of bcdUSB & bcdDevice of PL2303TA is the same as the
> setting value of bcdUSB & bcdDevice of a certain chip of PL2303HXN

Which ones would that be?

> The setting value of bcdUSB & bcdDevice of PL2303TB is the same as the
> setting value of bcdUSB & bcdDevice of a certain chip of PL2303HXN

Same question here.

> The PL2303HXN series currently has several chips on sale, and several chips
> are about to be sold.
> The PL2303HXN cannot use bcdDevice to determine the type one by one.

Even if we've found out that the hard way that the documented bdcDevice
for these chips does not match your datasheets, it still seems we're
able to determine the HXN types (GC, GS, etc) based on bcdDevice and
this is something we'll likely need sooner or later.

Could you provide a list of the bcdDevice you use for the various HXN
types instead?

Then we can use the hx_status check for TA and TB whose bcdDevice have
been reused.

> Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>
> ---
>  drivers/usb/serial/pl2303.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
> index 3506c47e1eef..95e5fdf3b80a 100644
> --- a/drivers/usb/serial/pl2303.c
> +++ b/drivers/usb/serial/pl2303.c
> @@ -436,22 +436,23 @@ static int pl2303_detect_type(struct usb_serial *serial)
>  		break;
>  	case 0x200:
>  		switch (bcdDevice) {
> -		case 0x100:
> -		case 0x105:
> -		case 0x305:
> -		case 0x405:
> -		case 0x605:
> +		case 0x300:
> +			if (!pl2303_supports_hx_status(serial))
> +				return TYPE_HXN;
> +			else
> +				return TYPE_TA;
> +		case 0x500:
> +			if (!pl2303_supports_hx_status(serial))
> +				return TYPE_HXN;
> +			else
> +				return TYPE_TB;
> +		default:
>  			/*
>  			 * Assume it's an HXN-type if the device doesn't
>  			 * support the old read request value.
>  			 */
>  			if (!pl2303_supports_hx_status(serial))
>  				return TYPE_HXN;
> -			break;
> -		case 0x300:
> -			return TYPE_TA;
> -		case 0x500:
> -			return TYPE_TB;
>  		}
>  		break;
>  	}

Johan

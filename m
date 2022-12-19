Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96ACA650DBC
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 15:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232227AbiLSOrF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 09:47:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231831AbiLSOqh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 09:46:37 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A1A112A84
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 06:45:18 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2346825;
        Mon, 19 Dec 2022 15:45:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671461110;
        bh=kOi592ysiEOPW4j8ylol+68SreAth+uxQ8ACD3ZZLTY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=gOoQUNSRx6H1O5McyQMP7CH3hOYp8sY7lph0695gi5ATWVScWOzyjq4QcQflR2WlF
         ol6hUoHY4/q9+PP6f9Ea2aafBilAv7Bz8I7Vmj2ciifH1CYWsrlgq8pHtCaoILEK1Q
         T3XyHyghnWybnmteR4ffNUYvImHBfu8yHGIjQwq8=
Message-ID: <10145364-505c-596f-2fd0-27b549115bd7@ideasonboard.com>
Date:   Mon, 19 Dec 2022 14:45:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/7] usb: uvc: Enumerate valid values for color
 matching
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com
References: <20221219144316.757680-1-dan.scally@ideasonboard.com>
 <20221219144316.757680-3-dan.scally@ideasonboard.com>
Content-Language: en-US
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20221219144316.757680-3-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 19/12/2022 14:43, Daniel Scally wrote:
> The color matching descriptors defined in the UVC 1.5 Specification
> contain 3 fields with discrete numeric values representing particular
> settings. Enumerate those values so that later code setting them can
> be more readable.
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v2:
>
>    - New patch
>
>   include/uapi/linux/usb/video.h | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
>
> diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/video.h
> index 6e8e572c2980..08606a52e1e2 100644
> --- a/include/uapi/linux/usb/video.h
> +++ b/include/uapi/linux/usb/video.h
> @@ -179,6 +179,36 @@
>   #define UVC_CONTROL_CAP_AUTOUPDATE			(1 << 3)
>   #define UVC_CONTROL_CAP_ASYNCHRONOUS			(1 << 4)
>   
> +/* ref Color Matching Descriptor Values */


_Immediately_ noticed that I forgot to replace the placeholder with the 
actual reference to the document - sorry...I'll fix that in the v3

> +enum uvc_color_primaries_values {
> +	UVC_COLOR_PRIMARIES_UNSPECIFIED,
> +	UVC_COLOR_PRIMARIES_BT_709_SRGB,
> +	UVC_COLOR_PRIMARIES_BT_470_2_M,
> +	UVC_COLOR_PRIMARIES_BT_470_2_B_G,
> +	UVC_COLOR_PRIMARIES_SMPTE_170M,
> +	UVC_COLOR_PRIMARIES_SMPTE_240M,
> +};
> +
> +enum uvc_transfer_characteristics_values {
> +	UVC_TRANSFER_CHARACTERISTICS_UNSPECIFIED,
> +	UVC_TRANSFER_CHARACTERISTICS_BT_709,
> +	UVC_TRANSFER_CHARACTERISTICS_BT_470_2_M,
> +	UVC_TRANSFER_CHARACTERISTICS_BT_470_2_B_G,
> +	UVC_TRANSFER_CHARACTERISTICS_SMPTE_170M,
> +	UVC_TRANSFER_CHARACTERISTICS_SMPTE_240M,
> +	UVC_TRANSFER_CHARACTERISTICS_LINEAR,
> +	UVC_TRANSFER_CHARACTERISTICS_SRGB,
> +};
> +
> +enum uvc_matrix_coefficients {
> +	UVC_MATRIX_COEFFICIENTS_UNSPECIFIED,
> +	UVC_MATRIX_COEFFICIENTS_BT_709,
> +	UVC_MATRIX_COEFFICIENTS_FCC,
> +	UVC_MATRIX_COEFFICIENTS_BT_470_2_B_G,
> +	UVC_MATRIX_COEFFICIENTS_SMPTE_170M,
> +	UVC_MATRIX_COEFFICIENTS_SMPTE_240M,
> +};
> +
>   /* ------------------------------------------------------------------------
>    * UVC structures
>    */

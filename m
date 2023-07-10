Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26EF274D151
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jul 2023 11:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbjGJJY5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jul 2023 05:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjGJJY4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jul 2023 05:24:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 288B492
        for <linux-usb@vger.kernel.org>; Mon, 10 Jul 2023 02:24:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AF85860F36
        for <linux-usb@vger.kernel.org>; Mon, 10 Jul 2023 09:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F498C433C8;
        Mon, 10 Jul 2023 09:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688981095;
        bh=gDgDXrT4xu+oFlxoLyT5AijUEFQkMSQUcGHG6LfEkic=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ld7hoDalsbVCM8DI84dvv+pcpsXfZKexstGKRhORmWf8/xJnpFJUBTQZm411qzdGt
         sDRMHVjJz12WY2LyM4dOmnzBN/doR/5OmNeVCVcb0PEuBNPXIcnZ9HDfHGORHW/RoN
         tyv7Z2tNpdFr8s5ynynt6oc1Iu9i9+tMKLhcV+vzX8cbWpLKFDIsoGBRjkUtTi0O94
         DwxetsNWTnIEZ3qbieuVOqzOFEfFWPp+xg3O9loHwbDbUtrvpwlzl5F/3tTk/kOLFj
         V1uAEymafXpfI1wFQE/bRTbETBAPhc0m2FYPF33VknaUPV6JLiZDp7K1GES2DXDNTW
         uL+oFPSiHOjXA==
Message-ID: <1dcd6d8f-f15b-4f71-52a2-3ff48bff7575@kernel.org>
Date:   Mon, 10 Jul 2023 11:24:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] Style error/warning fixes: replacing space with tabs
Content-Language: en-US
To:     Prince Kumar Maurya <princekumarmaurya06@gmail.com>,
        gregkh@linuxfoundation.org, raychi@google.com,
        skhan@linuxfoundation.org
Cc:     linux-kernel-mentees@lists.linuxfoundation.org,
        linux-usb@vger.kernel.org
References: <20230709005133.2439465-1-princekumarmaurya06@gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230709005133.2439465-1-princekumarmaurya06@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 09/07/2023 02:51, Prince Kumar Maurya wrote:
> Style fixes for warning found using checkpatch.pl script 
> 
> Signed-off-by: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
> ---
>  drivers/usb/core/hub.c | 58 +++++++++++++++++++++---------------------
>  1 file changed, 29 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index a739403a9e45..82a7b127a340 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -1777,7 +1777,7 @@ static bool hub_descriptor_is_sane(struct usb_host_interface *desc)
>  	if (!usb_endpoint_is_int_in(&desc->endpoint[0].desc))
>  		return false;
>  
> -        return true;
> +		return true;

This does not look like correctly indented.

>  }
>  
>  static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
> @@ -5854,37 +5854,37 @@ static void hub_event(struct work_struct *work)
>  }
>  
>  static const struct usb_device_id hub_id_table[] = {
> -    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
> -                   | USB_DEVICE_ID_MATCH_PRODUCT
> -                   | USB_DEVICE_ID_MATCH_INT_CLASS,
> -      .idVendor = USB_VENDOR_SMSC,
> -      .idProduct = USB_PRODUCT_USB5534B,
> -      .bInterfaceClass = USB_CLASS_HUB,
> -      .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
> -    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
> -                   | USB_DEVICE_ID_MATCH_PRODUCT,
> -      .idVendor = USB_VENDOR_CYPRESS,
> -      .idProduct = USB_PRODUCT_CY7C65632,
> -      .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
> -    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
> +	{ .match_flags = USB_DEVICE_ID_MATCH_VENDOR
> +			| USB_DEVICE_ID_MATCH_PRODUCT
> +			| USB_DEVICE_ID_MATCH_INT_CLASS,
> +	  .idVendor = USB_VENDOR_SMSC,

Spaces after the tab. Are you sure this does not cause checkpatch
--strict errors?



Best regards,
Krzysztof


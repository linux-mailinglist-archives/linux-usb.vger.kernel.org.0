Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4F9E6A56D2
	for <lists+linux-usb@lfdr.de>; Tue, 28 Feb 2023 11:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230481AbjB1KdI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Feb 2023 05:33:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230328AbjB1KdD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Feb 2023 05:33:03 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54516EB6
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 02:33:01 -0800 (PST)
Received: from [192.168.0.192] (unknown [194.146.248.75])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 672A466021F9;
        Tue, 28 Feb 2023 10:33:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1677580380;
        bh=ZLZtXqT6RCQEYR0IVxksuC5sAYmKPr400eCtZUyo7lU=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=nyMsv1dZE4Y/hSXzgiS20R66jasi4ZqPALC58Jg1j1Jwq1OJJ+05nI1QpBs9olY12
         mwhhfVosqm58Wbol5mBLkSlOCp9IuHv5TGnZEFNnqHN8Lh5jZffw1bCyEAyJIhQV/j
         b/NL9AKaCCE41nD0T5+ohNmJy3Cp1NmXpiTz0VrrVVYr36W/Gwne9Szk2LaN2LUgAz
         EkD9V+csop3EYdu1W/lgjo9zDDlhnlqTGJb6s6fqrZvchw9hNq5NkNIoiFEN4xi7Yk
         uCgLlxHQsjEXX4fB+sK09Lkl6tiu6q5IEdYrG8maVc3bDs6FXO3SepPTA1oaiBxZm6
         LbgFLE8vgxBdg==
Message-ID: <22883b1c-751d-f0fb-1529-227e5a96e66b@collabora.com>
Date:   Tue, 28 Feb 2023 11:32:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3] usb: gadget: f_fs: Fix incorrect version checking of
 OS descs
To:     Yuta Hayama <hayama@lineo.co.jp>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <290f96db-1877-5137-373a-318e7b4f2dde@lineo.co.jp>
Content-Language: en-US
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <290f96db-1877-5137-373a-318e7b4f2dde@lineo.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

W dniu 28.02.2023 o 09:56, Yuta Hayama pisze:
> Currently, the USB gadget framework supports only version 1.0 of the MS OS
> descriptor. OS desc has a field bcdVersion indicating its version, with
> v1.0 represented by the value 0x100. However, __ffs_do_os_desc_header()
> was expecting the incorrect value 0x1, so allow the correct value 0x100.
> 
> The bcdVersion field of the descriptor that is actually sent to the host
> is set by composite_setup() (in composite.c) to the fixed value 0x100.
> Therefore, it can be understood that __ffs_do_os_desc_header() is only
> performing a format check of the OS desc passed to functionfs. If a value
> other than 0x100 is accepted, there is no effect on communication over
> the USB bus. Indeed, until now __ffs_do_os_desc_header() has only accepted
> the incorrect value 0x1, but there was no problem with the communication
> over the USB bus.
> 
> However, this can be confusing for functionfs userspace drivers. Since
> bcdVersion=0x100 is used in actual communication, functionfs should accept
> the value 0x100.
> 
> Note that the correct value for bcdVersion in OS desc v1.0 is 0x100, but
> to avoid breaking old userspace drivers, the value 0x1 is also accepted as
> an exception. At this time, a message is output to notify the user to fix
> the userspace driver.
> 
> Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> ---
> Changelog
> v3:
> - modify wording of pr_warn() message (thanks to Andrzej),
>    and remove unnecessary format specifier.
> 
> v2:
> - remove comma inserted incorrectly in pr_vdebug()
> - when bcd_version == 0x1, use pr_warn() instead of pr_vdebug()
> 
>   drivers/usb/gadget/function/f_fs.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 8ad354741380..34ddb1802c5f 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -2292,8 +2292,11 @@ static int __ffs_do_os_desc_header(enum ffs_os_desc_type *next_type,
>   	u16 bcd_version = le16_to_cpu(desc->bcdVersion);
>   	u16 w_index = le16_to_cpu(desc->wIndex);
>   
> -	if (bcd_version != 1) {
> -		pr_vdebug("unsupported os descriptors version: %d",
> +	if (bcd_version == 0x1) {
> +		pr_warn("bcdVersion must be 0x0100, stored in Little Endian order. "
> +			"Userspace driver should be fixed, accepting 0x0001 for compatibility.\n");
> +	} else if (bcd_version != 0x100) {
> +		pr_vdebug("unsupported os descriptors version: 0x%x\n",
>   			  bcd_version);
>   		return -EINVAL;
>   	}


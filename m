Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E30FD69F331
	for <lists+linux-usb@lfdr.de>; Wed, 22 Feb 2023 12:09:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231500AbjBVLJM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Feb 2023 06:09:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230310AbjBVLJK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Feb 2023 06:09:10 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE122AD2C
        for <linux-usb@vger.kernel.org>; Wed, 22 Feb 2023 03:08:41 -0800 (PST)
Received: from [192.168.0.192] (unknown [194.146.248.75])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 53C3266021B5;
        Wed, 22 Feb 2023 11:08:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1677064120;
        bh=0eMIf4CzKpDouBQvd0nSmWYYvMi66UzMThlH0mBRBNo=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=F/Z3UA2f5dYEv2ZU3ZK5BGKbzG5L96IbEjGdzz+XeeC6ff98Pfe2j6lOJqyNVkmc+
         u6+kJpJiOhJKbz3hjolfQGpYOSxkgnsS5anELrlZMibwstwGr7yvUuxSR9ywH1nMj0
         Zqulxf+6P652oTOeoampBcBhZ0+IA8Ud4Nh6V3cRmHu7ypNogEH+1YFLYGbOsRgGV6
         xPTAhyNS8JTY4/3K12T9eoWRc+jQGMMWxFnjp9XicrLE7qtA1Te0RfE8WH+hB6zdH5
         9xm6b6sh4yYhw/rqZPscJCdLzQSTVfLJeEFoXc7PRvWxcoipgzvRBOl7MZqwT++24f
         kRMDvcBZAN5lw==
Message-ID: <57a35112-66b3-0a9d-8ced-4d47b5b7796c@collabora.com>
Date:   Wed, 22 Feb 2023 12:08:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v2] usb: gadget: f_fs: Fix incorrect version checking
 of OS descs
To:     Yuta Hayama <hayama@lineo.co.jp>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <f7e7fcd9-ddee-2c81-ca44-951b6cec1003@lineo.co.jp>
Content-Language: en-US
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <f7e7fcd9-ddee-2c81-ca44-951b6cec1003@lineo.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Yuta Hayama,

W dniu 22.02.2023 o 10:02, Yuta Hayama pisze:
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

Now that I think of it, aren't the numbers supposed to be in little endian
order?

In include/uapi/linux/usb/functionfs.h, descriptors and legacy descriptors
specify numbers as LE32, and below there is this sentence:

"All numbers must be in little endian order.".

And that is regardless of what endianness the machine running the gadget
uses. In other words, in the buffer passed through ep0 any numbers shall be
stored in such a way, that the least significant byte goes first.

The tables specifying the OS descriptors use general U16/U32 type, though,
but struct usb_os_desc_header says:

/* MS OS Descriptor header */
struct usb_os_desc_header {
	__u8	interface;
	__le32	dwLength;
	__le16	bcdVersion;
...

which is a strong hint that, in particular, bcdVersion _is_ little endian.

And a two-byte quantity of 0x0100 stored in little endian format looks like
this: 0x0001.

So it seems to me the correct thing to do is to ensure that the verifying code
works correctly both on big and little endian machines running USB gadgets,
rather than adding 0x0100 as a correct value and deprecating 0x0001.

Regards,

Andrzej

> 
> Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>
> ---
> I am currently considering the patch approach itself. Please see below.
> https://lore.kernel.org/linux-usb/80754db0-a3bb-ee5e-db39-b75b8ebbd30e@lineo.co.jp/
> 
> Changelog
> v2:
> - remove comma inserted incorrectly in pr_vdebug()
> - if bcd_version == 0x1, use pr_warn() instead of pr_vdebug()
> 
>   drivers/usb/gadget/function/f_fs.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 8ad354741380..05f83469956a 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -2292,8 +2292,12 @@ static int __ffs_do_os_desc_header(enum ffs_os_desc_type *next_type,
>   	u16 bcd_version = le16_to_cpu(desc->bcdVersion);
>   	u16 w_index = le16_to_cpu(desc->wIndex);
>   
> -	if (bcd_version != 1) {
> -		pr_vdebug("unsupported os descriptors version: %d",
> +	if (bcd_version == 0x1) {
> +		pr_warn("bcdVersion is expected to be 0x100, but it was 0x%x. "
> +			"Pass for compatibility, but fix your user space driver.\n",
> +			bcd_version);
> +	} else if (bcd_version != 0x100) {
> +		pr_vdebug("unsupported os descriptors version: 0x%x\n",
>   			  bcd_version);
>   		return -EINVAL;
>   	}


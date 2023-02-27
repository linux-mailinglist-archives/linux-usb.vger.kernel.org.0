Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED2ED6A4676
	for <lists+linux-usb@lfdr.de>; Mon, 27 Feb 2023 16:51:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbjB0Pvp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Feb 2023 10:51:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjB0Pvp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Feb 2023 10:51:45 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D47A71EFC3
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 07:51:43 -0800 (PST)
Received: from [192.168.0.192] (unknown [194.146.248.75])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 0E3566602FA7;
        Mon, 27 Feb 2023 15:51:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1677513102;
        bh=2XOMIwahgclJdYr+NQCIcDyP+9rfei0Nfdci3u/z0ik=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=V9IEFrroEGi95MrZpZc1oDt7I9tiO+IYKOVKoQf7P/ZXr2tNHH1i5XzMU2TGhUI23
         XDVvp31vsoqdazPckw9CtexnVsR7m/jHIKIe08Gmh5e/p/d3e76+6kTlrtxua2LiPF
         0GYR+N6pkIxMuam+6XL51ljqI9EAzAgI8xfjkhgf8+DztTv/43I7NKRskidV4UZGuV
         lr+SdJuG3ZdRmfm91ZMsejii8vkDVjPJfKP1E1Mtc0VmumtArKqM4duFGOHTmFqW5z
         Q9bt4cBKurVdzYqAUtsR1ct8FqIs2LFWGbmMcNnBaFTUENpKeFoD54UBJMX33jPWkt
         1BrS8RtMD5nEw==
Message-ID: <540eb9bc-a8e2-4515-2a80-7435366a7cf6@collabora.com>
Date:   Mon, 27 Feb 2023 16:51:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v2] usb: gadget: f_fs: Fix incorrect version checking
 of OS descs
Content-Language: en-US
To:     Yuta Hayama <hayama@lineo.co.jp>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <f7e7fcd9-ddee-2c81-ca44-951b6cec1003@lineo.co.jp>
 <57a35112-66b3-0a9d-8ced-4d47b5b7796c@collabora.com>
 <0e743482-95fc-375d-21cf-b5a237b52e0d@lineo.co.jp>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <0e743482-95fc-375d-21cf-b5a237b52e0d@lineo.co.jp>
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

W dniu 27.02.2023 o 08:51, Yuta Hayama pisze:
> Hi Andrzej,
> 
> On 2023/02/22 20:08, Andrzej Pietrasiewicz wrote:
>> Now that I think of it, aren't the numbers supposed to be in little endian
>> order?
>>
>> In include/uapi/linux/usb/functionfs.h, descriptors and legacy descriptors
>> specify numbers as LE32, and below there is this sentence:
>>
>> "All numbers must be in little endian order.".
>>
>> And that is regardless of what endianness the machine running the gadget
>> uses. In other words, in the buffer passed through ep0 any numbers shall be
>> stored in such a way, that the least significant byte goes first.
>>
>> The tables specifying the OS descriptors use general U16/U32 type, though,
>> but struct usb_os_desc_header says:
>>
>> /* MS OS Descriptor header */
>> struct usb_os_desc_header {
>>      __u8    interface;
>>      __le32    dwLength;
>>      __le16    bcdVersion;
>> ...
>>
>> which is a strong hint that, in particular, bcdVersion _is_ little endian.
>>
>> And a two-byte quantity of 0x0100 stored in little endian format looks like
>> this: 0x0001.
> 
> Yes, I think you are correct that each field in the (OS) descriptor must be in
> little-endian order.
> 
> However, the current code does not seem to be consistent with the part that
> verifies bcd_version and the part that verifies w_index. Below are the results
> of my experiments on my ARM v7 machine (AM335X).
> 
> On the userspace driver, set the values to the descriptor as follows:
> 
> #include <endian.h>
> ...
> 	struct usb_os_desc_header ext_compat_hdr = {};
> 	...
> 	ext_compat_hdr.bcdVersion = htole16(0x0001);
> 	ext_compat_hdr.wIndex = htole16(0x0004);
> 	...
> 
> In the Extended Compat ID Descriptor descriptor, the correct value for
> bcdVersion is probably 0x100 in little-endian format, and the correct value for
> wIndex is 0x4 in little-endian format. Note that the current kernel (without my
> patch) only accepts a value of 0x1 for bcdVersion, so the above is the case.
> 
> 
> On the other hand, the code to verify bcdVersion and wIndex in the kernel is as
> follows:
> 
> 	u16 bcd_version = le16_to_cpu(desc->bcdVersion);
> 	u16 w_index = le16_to_cpu(desc->wIndex);
> 
> 	if (bcd_version != 1) {
> 		pr_vdebug("unsupported os descriptors version: %d",
> 			  bcd_version);
> 		return -EINVAL;
> 	}
> 	switch (w_index) {
> 	case 0x4:
> 		*next_type = FFS_OS_DESC_EXT_COMPAT;
> 		break;
> 	case 0x5:
> 		*next_type = FFS_OS_DESC_EXT_PROP;
> 		break;
> 	default:
> 		pr_vdebug("unsupported os descriptor type: %d", w_index);
> 		return -EINVAL;
> 	}
> 
> When setting a value to a structure in the userspace driver, cpu_to_leXX() is
> used, and when checking the value in the kernel, leXX_to_cpu() is used after
> taking the value out of the structure. Therefore, I do not think we need to
> worry about endianness at the time of verification. Actually, the w_index
> verification, which expects a value of 0x4 or 0x5, seems to be working
> correctly.
> 
> As I stated in my email below, I am confident that 0x100 is the correct value
> for bcd_version. If this is correct, shouldn't the kernel accept the value
> 0x100 obtained by leXX_to_cpu()?
> https://lore.kernel.org/linux-usb/5c049a94-f848-ff9a-ffbe-c1cf335ca644@lineo.co.jp/
> 
> 
>> So it seems to me the correct thing to do is to ensure that the verifying code
>> works correctly both on big and little endian machines running USB gadgets,
>> rather than adding 0x0100 as a correct value and deprecating 0x0001.
> 
> Sorry, I don't have a big-endian machine, so it will take some time to prepare
> an environment for checking.
> 
> The procedure is to do cpu_to_leXX() on the user space driver and then
> leXX_to_cpu() in the kernel, so I think it will work no matter what the
> endianness of the machine is....
> 
> 

After all the discussion we've had, I agree that the initial approach in your
patch to allow 0x100 as a legitimate value in the check performed in
__ffs_do_os_desc_header() is correct.

Whatever arrives through ep0 is in little endian format. So 0x0100 will be
stored as 0x0001, but then u16 bcd_version = le16_to_cpu(desc->bcdVersion);
will ensure bcd_version equals 0x0100 no matter what (and regardless of
machine's endinanness) and we *should* be comparing it with 0x0100.

I would probably change the message generated by this portion:

+		pr_warn("bcdVersion is expected to be 0x100, but it was 0x%x. "
+			"Pass for compatibility, but fix your user space driver.\n",
+			bcd_version);

to, say:

pr_warn("bcdVersion must be 0x0100, stored in Little Endian order. "
	"Userspace driver should be fixed, accepting 0x0001 for compatibility.\n");

and there's no need to format-print bcd_version given it is 0x1
in this branch of the "if" statement.

Regards,

Andrzej

> Regards,
> 
> Yuta Hayama


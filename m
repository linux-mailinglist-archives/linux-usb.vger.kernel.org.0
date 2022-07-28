Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C07258456F
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jul 2022 20:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232022AbiG1SHZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jul 2022 14:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbiG1SHX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jul 2022 14:07:23 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCA1052E64
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 11:07:22 -0700 (PDT)
Received: from [192.168.1.141] (c-73-100-220-23.hsd1.ma.comcast.net [73.100.220.23])
        by endrift.com (Postfix) with ESMTPSA id D94B4A05B;
        Thu, 28 Jul 2022 11:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1659031642; bh=XUkwFAqs8KyWosKAgIq2ERV4Jxxqpex7rrt2N7gc9QY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=BMHXx63VdETWgic55vMoYzWN+q5bhB9T1lUQB60PHhfPwjQOe++cVqus5fUbMd7eH
         /LR/N4UeJXh6CeSGHJo99PbJVB785Wo+HSkeBi/MFRn7QCxHLqiPrHWzXT82TClneo
         f1Xmmun+Tx1krdZ5w6R/tm+Rc/DQhbxtgYopaza9EHNOfH0ruFvJZo0z6+mqEZlTMp
         5WTwUsP3YsOw5U+FeOIxRu/AALF7yUOFGBZVJjV4qqifGia975LV224ahhTUNIVqbn
         Ypeg+qHtjqiaAxrtmS7ogli4eguebiSQbmMSmN/Guae+T1YsIyEeC+gIOxQxwiwN6o
         u3+QZeAPRXOcQ==
Message-ID: <012961c6-8910-cee6-e479-2ad8261ddd72@endrift.com>
Date:   Thu, 28 Jul 2022 11:07:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] USB: gadget: f_hid: Add Get-Feature report
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Felipe Balbi <balbi@kernel.org>, Maxim Devaev <mdevaev@gmail.com>,
        linux-usb@vger.kernel.org
References: <20220726005824.2817646-1-vi@endrift.com>
 <YuJD7Xp3Ue86Y+I+@kroah.com>
From:   Vicki Pfau <vi@endrift.com>
In-Reply-To: <YuJD7Xp3Ue86Y+I+@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 7/28/22 01:08, Greg Kroah-Hartman wrote:
> On Mon, Jul 25, 2022 at 05:58:25PM -0700, Vicki Pfau wrote:
>> --- /dev/null
>> +++ b/include/uapi/linux/usb/g_hid.h
>> @@ -0,0 +1,38 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
>> +/*
>> + * g_hid.h -- Header file for USB HID gadget driver
>> + *
>> + * Copyright (C) 2022 Valve Software
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program; if not, write to the Free Software
>> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
> 
> This whole license "boilerplate" is not needed, and should be removed
> (especially things like addresses, that's crazy).
> 
> Only thing that is needed is the SPDX line.

I was just copying the header from g_printer.h and changing as needed. It hasn't been touched since 2017, so if that's no longer the convention you might want to update it too.

> 
>> + */
>> +
>> +#ifndef __UAPI_LINUX_USB_G_HID_H
>> +#define __UAPI_LINUX_USB_G_HID_H
>> +
>> +#include <linux/types.h>
>> +
>> +struct usb_hidg_report {
>> +	__u16 length;
>> +	__u8 data[512];
> 
> Why 512?

I was reading the specs and one of them said the maximum report length for USB 3 (I believe) was 512 bytes (in contrast with USB 2's 64). I can try to find where it said this, or add a define for max report length.

> 
>> +};
>> +
>> +/* The 'g' code is also used by gadgetfs and hid gadget ioctl requests.
>> + * Don't add any colliding codes to either driver, and keep
>> + * them in unique ranges (size 0x20 for now).
>> + */
>> +#define GADGET_HID_WRITE_GET_REPORT	_IOW('g', 0x42, struct usb_hidg_report)
> 
> This should be in the same .h file so that we don't get confused and
> accidentally use the same ioctl.

The same .h file as which? g_printer.h and gadgetfs.h are separate files.

> 
>> +
>> +#endif /* __UAPI_LINUX_USB_G_HID_H */
>> diff --git a/include/uapi/linux/usb/gadgetfs.h b/include/uapi/linux/usb/gadgetfs.h
>> index 835473910a49..9754822b2a40 100644
>> --- a/include/uapi/linux/usb/gadgetfs.h
>> +++ b/include/uapi/linux/usb/gadgetfs.h
>> @@ -62,7 +62,7 @@ struct usb_gadgetfs_event {
>>  };
>>  
>>  
>> -/* The 'g' code is also used by printer gadget ioctl requests.
>> +/* The 'g' code is also used by printer and hid gadget ioctl requests.
> 
> Yeah, put the definition here.

Should I move the g_printer.h definitions here at the same time? Maybe stub out g_printer.h and make it include gadgetfs.h?

> 
> thanks,
> 
> greg k-h

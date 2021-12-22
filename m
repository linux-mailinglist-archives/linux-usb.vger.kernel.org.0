Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAEE847CD6E
	for <lists+linux-usb@lfdr.de>; Wed, 22 Dec 2021 08:13:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242963AbhLVHNM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Dec 2021 02:13:12 -0500
Received: from cable.insite.cz ([84.242.75.189]:37668 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242960AbhLVHNK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Dec 2021 02:13:10 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id AAB9DA1A3D401;
        Wed, 22 Dec 2021 08:13:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640157188; bh=AMBUUCszKkE7DXsEeY9uxDBKe8mNvMDkVj63/Pa5ihQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=bndCDAHFnVsgJ4Vd9q8HlfviL1Iz4sGBEEtaj8bb2mTqu+aq59bun0/RQz7vFaYuW
         IjBTgNcRgK/xo+F/4PmUnLnYA4f33lmdtItR2wXab9qvxd9rTHa0qPR+ru9awl0h6l
         qXJN9jk/r0lFvKcQ3QwZVowm2A09tgSNrsXSVNQY=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id uALJzgHEQCXC; Wed, 22 Dec 2021 08:13:03 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id EBDD4A1A3D400;
        Wed, 22 Dec 2021 08:13:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640157183; bh=AMBUUCszKkE7DXsEeY9uxDBKe8mNvMDkVj63/Pa5ihQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=GfPnHWsbTduVgPhFybeQMK4TtFIf2mVU2DPdtcxAjtDp5DFtXbn5MoWFB1/eOPdbX
         NB0mGdmAWeCAnPD128Haqigizju9q/H7O4ph4zhgnxFd9wRinppU55fyAlUoaTj021
         2VNw3sxB4aTbhnMpzI/kWAnXZwlpXq9Bg3O/3pXk=
Subject: Re: [PATCH v2 02/11] usb: gadget: u_audio: Support multiple sampling
 rates
To:     John Keeping <john@metanate.com>
Cc:     linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20211220211130.88590-1-pavel.hofman@ivitera.com>
 <20211220211130.88590-3-pavel.hofman@ivitera.com> <YcG8Fa8mBg7VL8sb@donbot>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <6392639d-8a6f-8203-e5d0-e862ee1d2654@ivitera.com>
Date:   Wed, 22 Dec 2021 08:13:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YcG8Fa8mBg7VL8sb@donbot>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne 21. 12. 21 v 12:35 John Keeping napsal(a):
> On Mon, Dec 20, 2021 at 10:11:21PM +0100, Pavel Hofman wrote:
>> From: Julian Scheel <julian@jusst.de>
>>
>> Implement support for multiple sampling rates in u_audio part of the
>> audio gadget. The currently configured rates are exposed through
>> read-only amixer controls 'Capture Rate' and 'Playback Rate'.
>>
>> Signed-off-by: Julian Scheel <julian@jusst.de>
>> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
>> ---
> 
>> diff --git a/drivers/usb/gadget/function/uac_common.h b/drivers/usb/gadget/function/uac_common.h
>> new file mode 100644
>> index 000000000000..3ecf89d6e814
>> --- /dev/null
>> +++ b/drivers/usb/gadget/function/uac_common.h
>> @@ -0,0 +1,9 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + */
>> +
>> +#ifndef UAC_COMMON_H
>> +#define UAC_COMMON_H
>> +
>> +#define UAC_MAX_RATES 10 /* maximum number of rates configurable by f_uac1/2 */
> 
> Why a new header for this - doesn't it belong in u_audio.h?

The constant is used in subsequent patches in f_uac1.c, f_uac2.c, their 
headers u_uac1.h, u_uac2.h, and legacy/audio.c (which already includes 
u_uac1.h/u_uac2.h as needed). Since all occurences must use the same 
value, I did not know how to solve this without introducing a common 
header file, included in the existing headers u_audio.h, u_uac1.h, 
u_uac2.h. If there is a better way, I will be happy to use it, I do not 
like the extra common header file either. Thanks a lot for your help.

Pavel.


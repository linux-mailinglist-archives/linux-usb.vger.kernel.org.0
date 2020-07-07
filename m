Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 959AC2175F9
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 20:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728246AbgGGSJc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 14:09:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728149AbgGGSJc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jul 2020 14:09:32 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26112C061755
        for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2020 11:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=Zt1afFLK+YR3Gn7sHnyANaroV7mztKMD3gCNcqrzbhY=; b=aa02IVEUODTDwaDR522TyCsuWW
        6y2rO9bwwEIIyesAHFtC4T5rtwmVqGIx73ddLK3xmg0RooAyGkLG/Hj6th5M+C+bPei8Fi7YhIN/6
        vRB0gtYw/H4HlkWhkG5Fd4oanc2VGdkX2kvJz5Vp/i22DHIeJLeFNSlGoSJyY1OxmHb+tvefzVcRe
        MJy/yk4ObkBR7a2uyMpN7E7MybOTtJyUx0ydvrLn6QsfMppLYtNCtCZbMkRm0qYKuqRdiEO6DplDL
        iZ29XmFdphIJNRchldVI4xtF/eTgx1HOMnMfl4IJRAqeAUar01lV3pq4JH1K1FQ9T/JK9pq8v9AGR
        4HKro0eQ==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jss25-0004k7-QG; Tue, 07 Jul 2020 18:09:30 +0000
Subject: Re: [PATCH 1/2] usb: correct kernel-doc inconsistency
To:     Greg KH <greg@kroah.com>
Cc:     Colton Lewis <colton.w.lewis@protonmail.com>,
        gregkh@linuxfoundation.og, balbi@kernel.org,
        linux-usb@vger.kernel.org
References: <20200707045207.235540-1-colton.w.lewis@protonmail.com>
 <6c25acb6-f702-0ce0-508d-d55080fe469f@infradead.org>
 <20200707180238.GA252415@kroah.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f5602aa1-8207-6117-f507-e7fe743d84a4@infradead.org>
Date:   Tue, 7 Jul 2020 11:09:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200707180238.GA252415@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/7/20 11:02 AM, Greg KH wrote:
> On Mon, Jul 06, 2020 at 10:14:24PM -0700, Randy Dunlap wrote:
>> On 7/6/20 9:52 PM, Colton Lewis wrote:
>>> Silence documentation  build warning by correcting  kernel-doc comment
>>> for sub_validate_langid function.
>>>
>>> ./drivers/usb/gadget/usbstring.c:77: warning: Function parameter or member 'langid' not described in 'usb_validate_langid'
>>> ./drivers/usb/gadget/usbstring.c:77: warning: Excess function parameter 'lang' description in 'usb_validate_langid'
>>>
>>> Signed-off-by: Colton Lewis <colton.w.lewis@protonmail.com>
>>> ---
>>>  drivers/usb/gadget/usbstring.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/usb/gadget/usbstring.c b/drivers/usb/gadget/usbstring.c
>>> index 58a4d3325090..119505fac777 100644
>>> --- a/drivers/usb/gadget/usbstring.c
>>> +++ b/drivers/usb/gadget/usbstring.c
>>> @@ -68,7 +68,7 @@ EXPORT_SYMBOL_GPL(usb_gadget_get_string);
>>>  
>>>  /**
>>>   * usb_validate_langid - validate usb language identifiers
>>> - * @lang: usb language identifier
>>> + * @langid: usb language identifier
>>>   *
>>>   * Returns true for valid language identifier, otherwise false.
>>>   */
>>>
>>
>> Hi,
>> I sent a patch for this on June 28, but it has not yet been merged anywhere
>> AFAIK.
> 
> Have a message-id?  I don't see it in my queue.

Sure:  <b49b7e07-8986-f185-3a99-a088419a532b@infradead.org>

https://lore.kernel.org/linux-usb/b49b7e07-8986-f185-3a99-a088419a532b@infradead.org/


-- 
~Randy


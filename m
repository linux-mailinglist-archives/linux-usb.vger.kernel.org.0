Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AEFA404802
	for <lists+linux-usb@lfdr.de>; Thu,  9 Sep 2021 11:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233150AbhIIJtR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Sep 2021 05:49:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:50648 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233353AbhIIJtN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Sep 2021 05:49:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ACBEA611BD;
        Thu,  9 Sep 2021 09:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631180884;
        bh=OdJ9hF8aF+EiFbO4nYWFpj9ePWRPK7plwXk/kGVvHMs=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=dTxXkeil9JfzGywlLvd2UoTIuIfw3FLQQoBC/zeMP3wrTrtwrwseDPKkXMmLRRHm/
         u6klNYX6SXr4bACzE6up2ogUs08lvZWIfLvVAR6ndtm8t+mXOITbYBfBK2HBTbSrwc
         8AHUkc3T1bCgjeZ5lwpiGY7vyDIm+FnhSwsC7Jvs1+ak2wKeQHoHDkzVoewdmWVWRG
         qY3D294zmE/obSB7U5glHju8bu3t8D6hjKEuwe40OS+mFrKtKfs4lBkhzC6aPVqmwP
         fH3vPHVhBY6Jg8plDzekFivH2mD8j4qmdxoBOMg/MooWaNlpuc3vzpFIO0exUOBvvG
         //BSz2BCU8sJA==
References: <1631166347-25021-1-git-send-email-quic_linyyuan@quicinc.com>
 <YTmlbFw9DufQc6gU@kroah.com>
 <DM8PR02MB819856E1A159D7D3F820555FE3D59@DM8PR02MB8198.namprd02.prod.outlook.com>
 <YTm51tmCXRtKZIcx@kroah.com>
 <DM8PR02MB8198F1672DD3A8179B5DF097E3D59@DM8PR02MB8198.namprd02.prod.outlook.com>
 <87bl52b0i9.fsf@kernel.org>
 <DM8PR02MB8198BC47C3C0598542B51A8BE3D59@DM8PR02MB8198.namprd02.prod.outlook.com>
User-agent: mu4e 1.6.5; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: gadget: clear gadget pointer after exit
Date:   Thu, 09 Sep 2021 12:44:59 +0300
In-reply-to: <DM8PR02MB8198BC47C3C0598542B51A8BE3D59@DM8PR02MB8198.namprd02.prod.outlook.com>
Message-ID: <877dfqaxm6.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

"Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com> writes:
>> >> > > Why set this to NULL?  Who cares about this now?  What changed to
>> >> make
>> >> > > it required?
>> >> > It better to set to NULL for better understanding.
>> >>
>> >> Understanding of what?  What issue does this fix?  You need a reason to
>> >> make this, or any, kernel change.
>> >
>> > Sorry, let explain, for example, when do role switch, we can check it
>> > value to make sure it switch complete,
>> >
>> > If we do not set to NULL, it will be invalid.
>> 
>> Using this pointer as a role switch flag seems fragile, though.
> Hi Felipe,
>
> I update a v2 patch, no, I didn't use this pointer for role switch,
> just used to check role switch status, make sure it complete.

exactly, you're using it as a flag for role switch. But gadget pointer
being invalid is not very indication of that :-) It could be that right
now these two things correlate, but there's no guarantee. You end up
writing code that has possibility of failing in the future ;-)

>     when do role switch from device to host mode,
>     first disable device mode, currently there is no better way to
>     confirm when gadget was complete removed.

if ->udc_stop() finished running, you know for a fact that gadget was
completely removed ;-) If you want to be doubly sure, you can somehow
notify the UDC from the gadget_release() function, but that's a little
more invasive change

>     change device release function to clear gadget pointer,
>     this will confirm device stop complete when it is NULL.

And instead of checking for the pointer (which can be racy in some
occasions), perhaps tell the UDC about it with a callback or something
like that?

-- 
balbi

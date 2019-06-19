Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3AF4BE6C
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2019 18:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730060AbfFSQkB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jun 2019 12:40:01 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37825 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfFSQj6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Jun 2019 12:39:58 -0400
Received: by mail-pf1-f195.google.com with SMTP id 19so10087756pfa.4
        for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2019 09:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:references:user-agent:from:to:cc:subject:organization
         :in-reply-to:reply-to:address:date:message-id:mime-version;
        bh=S5aGe2FCWzC1yp9+JAheKlCtjAXCfJP2YiEAGUtnwaU=;
        b=uUNaS8oL7vNWRotEXyh+oNrBWmlZSgofY0RK2vCTtTAGqEm/cYhiyIG0xYPhovWd87
         oSZqOfkgyl1yoFM/opTgqgdvC3VFCByY1nq7nfQveSEl/E7vBs3lDB7iZPc0EBs3Yn+Y
         JcfAbRMnVBN1sdHn4exXf93l0OWHVXL/WVC9B03pLfc23zIntk4e7Cf9I+mAOzn5XvLK
         YqeM7j8Bvs/YXMCV2leQpTx4g482f1GCZCFgmZCs+AT/c+OuMRyrxbyKbKJT2gE/C+uK
         tyJ43wPT9lgnHWu56R39WkYFqrOQdMGvLxz9wZJiC1DepqJouxrCVQa9cdsmIQ3NrXH7
         NFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:references:user-agent:from:to:cc:subject
         :organization:in-reply-to:reply-to:address:date:message-id
         :mime-version;
        bh=S5aGe2FCWzC1yp9+JAheKlCtjAXCfJP2YiEAGUtnwaU=;
        b=eucYZYcX0GzJ8e2Kk7TqfL07T2GxUSurEOgR5lQT6JSy3jGsI9zRNt8J2lzACH0Y9h
         ELT08ixbKV8zoOvBJHTqJyRituZJsDUxQcujnSt8h/IKumVAqoktTr7fOK7GQHZNViRx
         iicPArJKORyZCu3U9k5zsNvKr6J/OLp1MGrGFTDbol5as7Je+xuH0LmDqSd6QliVKX8e
         em8jPzjtyo/N0YUxBVWdR4UC2iwWUtYSTzTQ3ETgBZPic6cdVucb5kYmgbUDDdmd2ype
         vuUSl0hZVQJUm6OvFJeg/Dm4Aq2Jir3OzdWUUnuC9/XghC9W9o6+nM12d2uoRnwM/bgb
         65lg==
X-Gm-Message-State: APjAAAXU1YUH6LHMrURa+4z0dN+bj6KPGiYKAOE7hmVaweUhp4/tlhQC
        ctklRTaNkmlMoiXbeko6LuOBvkkA6+Q=
X-Google-Smtp-Source: APXvYqyBtM2N+3HwxFXNW6DGEYbdRFu83s9E7P9acYtHTHEcbc7lIlWICkXx6hG/kzl+qUIqXO+DEA==
X-Received: by 2002:a63:d205:: with SMTP id a5mr8285505pgg.279.1560962397772;
        Wed, 19 Jun 2019 09:39:57 -0700 (PDT)
Received: from mn.cs.uvic.ca (S01061cabc0a516f3.gv.shawcable.net. [24.69.190.94])
        by smtp.gmail.com with ESMTPSA id a21sm2346855pjh.10.2019.06.19.09.39.56
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 09:39:56 -0700 (PDT)
Received: by mn.cs.uvic.ca (Postfix, from userid 1000)
        id DB8914650F4; Wed, 19 Jun 2019 09:39:55 -0700 (PDT)
References: <20190618153529.11418-1-dmg@turingmachine.org> <20190618160658.GA27611@kroah.com> <87imt2kdub.fsf@mn.cs.uvic.ca> <20190618181326.GA19012@kroah.com>
User-agent: mu4e 1.0; emacs 26.1
From:   dmg <dmg@turingmachine.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: Replace a < b ? a : b construct with min_t(type, a, b) in adutux driver
Organization: turingMachine
In-reply-to: <20190618181326.GA19012@kroah.com>
Reply-To: dmg@turingmachine.org
Address: dmg@turingmachine.org
Date:   Wed, 19 Jun 2019 09:39:55 -0700
Message-ID: <87d0j9jzqc.fsf@mn.cs.uvic.ca>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Greg KH <gregkh@linuxfoundation.org> writes:

> On Tue, Jun 18, 2019 at 10:22:52AM -0700, dmg wrote:
>>
>> Greg KH <gregkh@linuxfoundation.org> writes:
>>
>> >> diff --git a/drivers/usb/misc/adutux.c b/drivers/usb/misc/adutux.c
>> >> index 9465fb95d70a..4a9fa3152f2a 100644
>> >> --- a/drivers/usb/misc/adutux.c
>> >> +++ b/drivers/usb/misc/adutux.c
>> >> @@ -379,7 +379,7 @@ static ssize_t adu_read(struct file *file, __user char *buffer, size_t count,
>> >>
>> >>  		if (data_in_secondary) {
>> >>  			/* drain secondary buffer */
>> >> -			int amount = bytes_to_read < data_in_secondary ? bytes_to_read : data_in_secondary;
>> >> +			int amount = min_t(size_t, bytes_to_read, data_in_secondary);
>> >
>> > Shouldn't amount and data_in_secondary be of size_t type?  Then you can
>> > just use min() here, right?
>>
>>
>> I looked at the code.
>>
>> there is an implicit assertion that
>>
>>    dev->secondary_tail >=  dev->secondary_head
>>
>>
>> (which are pointers to the secondary buffer)
>
> No, those are integers for the buffer, secondary_tail seems just to be
> the "length" of the buffer, and secondary_head is the current "start" of
> the buffer that has not been sent yet.
>
> So these can not ever "wrap", thank goodness.

I looked at the code and yes, the cannot wrap.

>
> But really, ick ick ick, this code is odd.  Seems like they are trying
> to go with a "flip buffer" scheme when there are many simpler ways to do
> all of this...
>
> Oh well, we deal with what we have...
>
>> 	while (bytes_to_read) {
>> 		int data_in_secondary = dev->secondary_tail - dev->secondary_head;
>> 		dev_dbg(&dev->udev->dev,
>> 			"%s : while, data_in_secondary=%d, status=%d\n",
>> 			__func__, data_in_secondary,
>> 			dev->interrupt_in_urb->status);
>>
>> 		if (data_in_secondary) {
>> 			/* drain secondary buffer */
>> 			int amount = bytes_to_read < data_in_secondary ? bytes_to_read : data_in_secondary;
>> 			i = copy_to_user(buffer, dev->read_buffer_secondary+dev->secondary_head, amount);
>> 			if (i) {
>> 				retval = -EFAULT;
>> 				goto exit;
>> 			}
>> 			dev->secondary_head += (amount - i);
>> 			bytes_read += (amount - i);
>> 			bytes_to_read -= (amount - i);
>> 		} else {
>> 			/* we check the primary buffer */
>>
>> As computed, data_in_secondary is the number of bytes left in the secondary
>> buffer and hence, it should always be larger or equal 0.
>
> Yes.
>
>> The if statement seems to imply this fact. There is no handling of the case
>> where data_in_secondary is negative--if that was the case, copy_to_user will be
>> called with a negative number, which I assume will return an error.
>
> Looking at the code, it never can be.
>
> And no, copy_to_user() with a negative number is just a really BIG
> number, and bad things happen, we never want to do that as it's usually
> a security issue then.
>
>> This is interesting. It means that if the pointers are incorrect (head points
>> after tail), the current code will probably be able to recover from the bug with
>> an error (i assume copy_to_user will return != 0 if called with a negative
>> number).
>>
>> If we change data_in_secondary to size_t, and the head points after the tail,
>> the data_in_secondary will be invalid (but positive) and copy_to_user will try
>> to read those number of bytes. I don't know what would happen in that case.
>
> Looking at the code, I do not see how this can happen, do you?

I agree. No, it cannot.

>
>> Amount is number of bytes to read from this buffer, so it does not make sense for it to be
>> negative. So it being size_t sounds ok.
>>
>> Barring that potential bug in the values of the pointers of the head and the
>> tail,  it appears it is safe to change the type of both data_in_secondary and
>> amount to size_t, and use min instead. It will also require to change the printf-style
>> modifier  (%d => %lu)
>>
>> Also,  note the use of "amount -i" the end of the if statement. At this point i
>> is equal to zero. the "- i" can be dropped from all these computations.
>
> That is someone who did not know what copy_to_user() returned and
> assumed it was the number of bytes copied :(
>
>> please let me know if this is something that sounds ok, and I'll prepare it and
>> submit a new patch.
>
> It sounds ok.  And if you want to fix anything else up here in this
> mess, it's always appreciated.  Odds are no one uses this driver
> anymore, but that's no reason to keep it being such a mess :)


I have created a new patch. But I am not sure what is the best way to 'connect'
my new patch to this one. I am currently using git-send-mail to avoid
interference from my mail client. Unless you think there is a better way, I'll
send it as I have before.

thank you again,

--dmg

>
> Oh, and great report, that was nicely done.
>
> thanks,
>
> greg k-h


--
Daniel M. German                  "Wrong turns are part
   Adam Savage ->                  of every journey."
http://turingmachine.org/
http://silvernegative.com/
dmg (at) uvic (dot) ca
replace (at) with @ and (dot) with .

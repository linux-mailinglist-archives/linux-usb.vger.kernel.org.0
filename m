Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5984A82D
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2019 19:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729395AbfFRRWz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 13:22:55 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42457 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728572AbfFRRWy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jun 2019 13:22:54 -0400
Received: by mail-pf1-f195.google.com with SMTP id q10so8042396pff.9
        for <linux-usb@vger.kernel.org>; Tue, 18 Jun 2019 10:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:references:user-agent:from:to:cc:subject:organization
         :in-reply-to:reply-to:address:date:message-id:mime-version;
        bh=Tyq9sHkG+NecWTMMmpvHboVQxez7d53xOYYFhpSlnWQ=;
        b=GeISfIKaqs+ZRzKy5NKtOVKz5a/OY17rDNiWbZk8aPJtzOgtbHTQ1rAjXvSoo4ogoA
         HPw9ULmqPd7XAmvbzxSa3wcE3AiAF/U36MmVNgk59Qo3ppNNWGMJyTnm3KQwyTjr86P0
         eoLTt4VWny0qCOhcY8a6N6Fork9Pr4W0kMaLTBSZVCJS/O2Tp/bjRIyyZQhRLi+13uqC
         vHmEaExce7+rhaGZPxRU6NbHPz6UTTXWpCHC5ZzXh33V8xP6Iggsddd4p9UkZfm2egQc
         vadbtppDUr3+tVkQtwr//AfvGDtzEMkZIyGA89arWOI5CIYcdD0E/EsbSaLSJDyCrhtE
         VNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:references:user-agent:from:to:cc:subject
         :organization:in-reply-to:reply-to:address:date:message-id
         :mime-version;
        bh=Tyq9sHkG+NecWTMMmpvHboVQxez7d53xOYYFhpSlnWQ=;
        b=PEC1H/x34cy7BilhIwZiTnrwKjKKhJy1jfjCyOLr2X38AIGk3NAzr1KLb/w8NEpZnv
         Q2z8Ov+H4lRq/6YplQuSMVxOb9SROcaCSkGx6p/PddC7xQWaPTCGUF7BeX+94RfyivO+
         v8xNvpGfBSL4j1354OQz1mNXuuRTtSPHDB3vnzJGQfsLiDjjKflF26yAkCTE52lUWACv
         XqvKGGhfqPNFDUxLDpVx7yEdZVP1x3cY/pbh23rLZ8ijabCjerYUvdF2VV8daegUlDb+
         /U4q3xA5+gYcuy2e8hPTTThO/BKJHtgDw+/nORzT0wi0UFoENc8F+P1SOmra1tpfM9M8
         czjg==
X-Gm-Message-State: APjAAAV9DKDvyXXiTLY6NA7xF6KI0uaK5x+8f2GM0hzfq20HwKendMl2
        PNCrzCYpLdoQknsKNkspKD2ZHBwG0MM=
X-Google-Smtp-Source: APXvYqwNBvIoygS0BsSlKTQ7AfcJGI84354z6grOmFMJQoiwU0mttaR2NYPzoNooQVyUkoPf/og3qQ==
X-Received: by 2002:aa7:9407:: with SMTP id x7mr79469347pfo.163.1560878574025;
        Tue, 18 Jun 2019 10:22:54 -0700 (PDT)
Received: from mn.cs.uvic.ca (S01061cabc0a516f3.gv.shawcable.net. [24.69.190.94])
        by smtp.gmail.com with ESMTPSA id g13sm15311508pfi.93.2019.06.18.10.22.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 10:22:53 -0700 (PDT)
Received: by mn.cs.uvic.ca (Postfix, from userid 1000)
        id 8FDA54650F3; Tue, 18 Jun 2019 10:22:52 -0700 (PDT)
References: <20190618153529.11418-1-dmg@turingmachine.org> <20190618160658.GA27611@kroah.com>
User-agent: mu4e 1.0; emacs 26.1
From:   dmg <dmg@turingmachine.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: Replace a < b ? a : b construct with min_t(type, a, b) in adutux driver
Organization: turingMachine
In-reply-to: <20190618160658.GA27611@kroah.com>
Reply-To: dmg@turingmachine.org
Address: dmg@turingmachine.org
Date:   Tue, 18 Jun 2019 10:22:52 -0700
Message-ID: <87imt2kdub.fsf@mn.cs.uvic.ca>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Greg KH <gregkh@linuxfoundation.org> writes:

>> diff --git a/drivers/usb/misc/adutux.c b/drivers/usb/misc/adutux.c
>> index 9465fb95d70a..4a9fa3152f2a 100644
>> --- a/drivers/usb/misc/adutux.c
>> +++ b/drivers/usb/misc/adutux.c
>> @@ -379,7 +379,7 @@ static ssize_t adu_read(struct file *file, __user char *buffer, size_t count,
>>
>>  		if (data_in_secondary) {
>>  			/* drain secondary buffer */
>> -			int amount = bytes_to_read < data_in_secondary ? bytes_to_read : data_in_secondary;
>> +			int amount = min_t(size_t, bytes_to_read, data_in_secondary);
>
> Shouldn't amount and data_in_secondary be of size_t type?  Then you can
> just use min() here, right?


I looked at the code.

there is an implicit assertion that

   dev->secondary_tail >=  dev->secondary_head


(which are pointers to the secondary buffer)

	while (bytes_to_read) {
		int data_in_secondary = dev->secondary_tail - dev->secondary_head;
		dev_dbg(&dev->udev->dev,
			"%s : while, data_in_secondary=%d, status=%d\n",
			__func__, data_in_secondary,
			dev->interrupt_in_urb->status);

		if (data_in_secondary) {
			/* drain secondary buffer */
			int amount = bytes_to_read < data_in_secondary ? bytes_to_read : data_in_secondary;
			i = copy_to_user(buffer, dev->read_buffer_secondary+dev->secondary_head, amount);
			if (i) {
				retval = -EFAULT;
				goto exit;
			}
			dev->secondary_head += (amount - i);
			bytes_read += (amount - i);
			bytes_to_read -= (amount - i);
		} else {
			/* we check the primary buffer */

As computed, data_in_secondary is the number of bytes left in the secondary
buffer and hence, it should always be larger or equal 0.

The if statement seems to imply this fact. There is no handling of the case
where data_in_secondary is negative--if that was the case, copy_to_user will be
called with a negative number, which I assume will return an error.

This is interesting. It means that if the pointers are incorrect (head points
after tail), the current code will probably be able to recover from the bug with
an error (i assume copy_to_user will return != 0 if called with a negative
number).

If we change data_in_secondary to size_t, and the head points after the tail,
the data_in_secondary will be invalid (but positive) and copy_to_user will try
to read those number of bytes. I don't know what would happen in that case.

Amount is number of bytes to read from this buffer, so it does not make sense for it to be
negative. So it being size_t sounds ok.

Barring that potential bug in the values of the pointers of the head and the
tail,  it appears it is safe to change the type of both data_in_secondary and
amount to size_t, and use min instead. It will also require to change the printf-style
modifier  (%d => %lu)

Also,  note the use of "amount -i" the end of the if statement. At this point i
is equal to zero. the "- i" can be dropped from all these computations.

please let me know if this is something that sounds ok, and I'll prepare it and
submit a new patch.

>
> thanks,
>
> greg k-h


--
Daniel M. German                  "The fear is not losing.
   Phil Jackson ->                 The fear is not producing the effort needed."
http://turingmachine.org/
http://silvernegative.com/
dmg (at) uvic (dot) ca
replace (at) with @ and (dot) with .

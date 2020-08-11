Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70DCE241F3A
	for <lists+linux-usb@lfdr.de>; Tue, 11 Aug 2020 19:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729324AbgHKR3m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Aug 2020 13:29:42 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:48795 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729258AbgHKR3g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Aug 2020 13:29:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1597166974;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/kCCiP1A994GEPhfTMliHq1uK+Sv/vNDYIXMua8VMzw=;
        b=IqDuLgB6JJNeR0UFLOWa+giGAEu2+7S1ZRnVivBFGZEbewfUjRrQAnRG12cJjwF7TFt6Eu
        wHQ1do3sBMR1J6aD/tuz9H6GlecmHeebI2mFspeJrPQpmssjLMiK/UgxIhjcFQ6HgUVLaz
        bsatkcLL428CRS2XQa0/Q/SBxS92AGQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-2nyRLVfBMhGmF44vPv2c0Q-1; Tue, 11 Aug 2020 13:29:32 -0400
X-MC-Unique: 2nyRLVfBMhGmF44vPv2c0Q-1
Received: by mail-qt1-f200.google.com with SMTP id w15so10302425qtv.11
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 10:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=/kCCiP1A994GEPhfTMliHq1uK+Sv/vNDYIXMua8VMzw=;
        b=iTUiZhkrHZwk0jL5wKJ9ya9yFt69o9Yh1B5BTmI0JIEX8D67AS0wrvsQZmslSOdR0i
         C8uVgsHXUx1uFIZc/db/qTEOwsBmL1UIX/Ll77gXD960zQQmw5LGm7HKtPvq9A/56dVP
         CtyRp5Mg19omgh2IANm1vRvxFYYo2BpkYJGPOVUUyI8h+CkuymOS+COQBYMrGusy0vTZ
         tUlJrK9aIFgVmvnRNyztOdQu3w89R5s5SkLHqxE26isa2Wax81ksX7EqKgRNddb9L4yH
         gVMk2PwQFbmG8qtxKMhq0Czs/6xM8ACI09+Rfvyi4rLO6qEVzH1aaV1mxvwf3Q0vurJQ
         RBBA==
X-Gm-Message-State: AOAM530iYlpFREG5K+dy2iBN/9tGNWhWZVNRYQ9xpkEEq7UQpr9PoVw9
        uP7vOlthRK0jHrbe2aatShISvRoWXn4wQnQm8wXPKjAmb+e4RZpMgvWcwo2XkG1xtaRZhnjgoYe
        ARKtcJgUEJvDR5U5/Wijt
X-Received: by 2002:ac8:6e87:: with SMTP id c7mr2347335qtv.62.1597166971940;
        Tue, 11 Aug 2020 10:29:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyL8bEYELl1qXi1MXs8Z4bGDTdMzjg5IXgTDDjBowuqwx+PFGWiyKTQTphCbSqHo0N18EI7IQ==
X-Received: by 2002:ac8:6e87:: with SMTP id c7mr2347311qtv.62.1597166971642;
        Tue, 11 Aug 2020 10:29:31 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id g55sm20376876qta.94.2020.08.11.10.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2020 10:29:31 -0700 (PDT)
Subject: Re: [PATCH] USB: realtek_cr: fix return check for dma functions
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     gregkh@linuxfoundation.org, acozzette@cs.hmc.edu,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        linux-kernel@vger.kernel.org
References: <20200811151505.12222-1-trix@redhat.com>
 <20200811160348.GD335280@rowland.harvard.edu>
From:   Tom Rix <trix@redhat.com>
Message-ID: <1f7d5a64-f264-4fed-bf90-b64e2693652d@redhat.com>
Date:   Tue, 11 Aug 2020 10:29:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200811160348.GD335280@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 8/11/20 9:03 AM, Alan Stern wrote:
> On Tue, Aug 11, 2020 at 08:15:05AM -0700, trix@redhat.com wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> clang static analysis reports this representative problem
>>
>> realtek_cr.c:639:3: warning: The left expression of the compound
>>   assignment is an uninitialized value. The computed value will
>>   also be garbage
>>     SET_BIT(value, 2);
>>     ^~~~~~~~~~~~~~~~~
>>
>> value is set by a successful call to rts51x_read_mem()
>>
>> 	retval = rts51x_read_mem(us, 0xFE77, &value, 1);
>> 	if (retval < 0)
>> 		return -EIO;
>>
>> A successful call to rts51x_read_mem returns 0, failure can
>> return positive and negative values.  This check is wrong
>> for a number of functions.  Fix the retval check.
>>
>> Fixes: 065e60964e29 ("ums_realtek: do not use stack memory for DMA")
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>  drivers/usb/storage/realtek_cr.c | 36 ++++++++++++++++----------------
>>  1 file changed, 18 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/usb/storage/realtek_cr.c b/drivers/usb/storage/realtek_cr.c
>> index 3789698d9d3c..b983753e2368 100644
>> --- a/drivers/usb/storage/realtek_cr.c
>> +++ b/drivers/usb/storage/realtek_cr.c
>> @@ -481,16 +481,16 @@ static int enable_oscillator(struct us_data *us)
>>  	u8 value;
>>  
>>  	retval = rts51x_read_mem(us, 0xFE77, &value, 1);
>> -	if (retval < 0)
>> +	if (retval != STATUS_SUCCESS)
>>  		return -EIO;
> Instead of changing all these call sites, wouldn't it be a lot easier 
> just to change rts51x_read_mem() to make it always return a negative 
> value (such as -EIO) when there's an error?
>
> Alan Stern

I thought about that but there was already existing (retval != STATUS_SUCCESS) checks for these calls.

Tom

>


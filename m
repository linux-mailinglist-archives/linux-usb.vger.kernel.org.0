Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FCA424FE99
	for <lists+linux-usb@lfdr.de>; Mon, 24 Aug 2020 15:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbgHXNNY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Aug 2020 09:13:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43255 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726354AbgHXNNT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Aug 2020 09:13:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598274795;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=M3sp5HeiSrgOhqJfi4HssybU/jSQO1GIn85W057WAgg=;
        b=ASYVkF0TY4xv1FFuFAdguwIE0N9lq0YNsAE1lS8yTuV+uevPZABMRoVw5nPPa1BWR6//oM
        tfkFYNZHRkcO4AGsjSOnA6+xJvzb1LONP1LJEIeU7UVOnouTCL5LZcapOIJ8uuQA72H0mF
        DiLKHQf0QpxpYMY1cTRMKUqM15dnelo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-bf6pCtJ2PGu6ltxG2URseA-1; Mon, 24 Aug 2020 09:13:12 -0400
X-MC-Unique: bf6pCtJ2PGu6ltxG2URseA-1
Received: by mail-qv1-f69.google.com with SMTP id y12so6276669qva.8
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 06:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=M3sp5HeiSrgOhqJfi4HssybU/jSQO1GIn85W057WAgg=;
        b=bgQiTjS2EkaaIMTSEfKOZJPiKnOsL+Y7ropJp75pybR6AXS1+JeZG9cZp7I3/SDM73
         qVZTyaQReLxBKzOXiGkiRrjHEAsMMUAxDh0o2CyZfpN3/kKduhDU7f72/yK7hlNRtUNw
         8oYj852hUJy5+vJcAhdHkxmUo8AVzp6ioj7RTdfPx5YibbOZ8tHV8FWrvDYctieeEzho
         cgmZ/mQP4389gx+wuXLRrb6IAdii03Wt8t6sZIePCBDNngioNWG0q7Mh6/fUA5dx+JSp
         LyWS4PthfeB/QJXDeDI3WSOiP0PQZXzQc6HgDJ+2JeDtBG5/YINvLkbquohTVo90R3e9
         lYVQ==
X-Gm-Message-State: AOAM532I1r/ZZeUiD5zWsNGWp41633MeP+rY8Pq9oAOVwaW8DjOo/Rze
        iR0jgoZKrpJKIlycnW0IgtYJOTLuoZ+DYKR/s28Y8Og+7CkcWrUjbyJp7lsUslTEeqt4BmY5IYB
        3yK/FgZmAAJA8VxZYjNMN
X-Received: by 2002:ad4:4cc3:: with SMTP id i3mr4785573qvz.17.1598274791876;
        Mon, 24 Aug 2020 06:13:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSPtSwrwYTNDJdpHYixdyM9NxjZZRNyv5Uo1DAak/YtpD6YHO0BZWLW524k0+CXgmnBGugKw==
X-Received: by 2002:ad4:4cc3:: with SMTP id i3mr4785551qvz.17.1598274791593;
        Mon, 24 Aug 2020 06:13:11 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id p34sm11806050qte.79.2020.08.24.06.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2020 06:13:11 -0700 (PDT)
Subject: Re: [PATCH] usb: storage: initialize variable
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org
References: <20200822211839.5117-1-trix@redhat.com>
 <20200823004903.GB292576@rowland.harvard.edu>
From:   Tom Rix <trix@redhat.com>
Message-ID: <34834bbc-12e5-3fe1-7bb3-7a4c03acb03f@redhat.com>
Date:   Mon, 24 Aug 2020 06:13:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200823004903.GB292576@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 8/22/20 5:49 PM, Alan Stern wrote:
> On Sat, Aug 22, 2020 at 02:18:39PM -0700, trix@redhat.com wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> clang static analysis reports this representative problem
>>
>> transport.c:495:15: warning: Assigned value is garbage or
>>   undefined
>>         length_left -= partial;
>>                    ^  ~~~~~~~
>> partial is set only when usb_stor_bulk_transfer_sglist()
>> is successful.
>>
>> So initialize to partial to 0.
>>
>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>  drivers/usb/storage/transport.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
>> index 238a8088e17f..ce920851b1f2 100644
>> --- a/drivers/usb/storage/transport.c
>> +++ b/drivers/usb/storage/transport.c
>> @@ -461,7 +461,7 @@ static int usb_stor_bulk_transfer_sglist(struct us_data *us, unsigned int pipe,
>>  int usb_stor_bulk_srb(struct us_data* us, unsigned int pipe,
>>  		      struct scsi_cmnd* srb)
>>  {
>> -	unsigned int partial;
>> +	unsigned int partial = 0;
>>  	int result = usb_stor_bulk_transfer_sglist(us, pipe, scsi_sglist(srb),
>>  				      scsi_sg_count(srb), scsi_bufflen(srb),
>>  				      &partial);
>> @@ -484,7 +484,7 @@ int usb_stor_bulk_transfer_sg(struct us_data* us, unsigned int pipe,
>>  		void *buf, unsigned int length_left, int use_sg, int *residual)
>>  {
>>  	int result;
>> -	unsigned int partial;
>> +	unsigned int partial = 0;
>>  
>>  	/* are we scatter-gathering? */
>>  	if (use_sg) {
> Yes, this is a bug.  But the right way to fix it is to change 
> usb_stor_bulk_transfer_sglist(): Make it store 0 to *act_len at the 
> start.
>
> That way you change only one localized piece of code, instead of 
> changing multiple callers and leaving a possibility of more errors being 
> added in the future.

I'll respin the patch.

It will exchange the compile time initialization fix for a run time if-check fix.

> Alan Stern
>


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19CFC250AE8
	for <lists+linux-usb@lfdr.de>; Mon, 24 Aug 2020 23:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgHXVbK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Aug 2020 17:31:10 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:47451 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726189AbgHXVbH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Aug 2020 17:31:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598304666;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mo3LWlCNiIOFoCmxEjwdUemS1sJZBLVfxAMsdk/Iu6M=;
        b=YI7fjXzAFzydzivjbhZTh5mhuOuIUWksKJTslmxIkT5/13qqckiKgJucIefYg5qinlu2OU
        6nzMJQbPFOlSF48qgKXElUfSNalZGSV5fuQzZBhp8lUAyxfg2Jt3o97+Nk0zDLe2IcnmjR
        9MH4KkHKXnaJ/UHgIvODaRhdm97AJ2A=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-cPWMpFZkOQetPDTPyWILRw-1; Mon, 24 Aug 2020 17:31:04 -0400
X-MC-Unique: cPWMpFZkOQetPDTPyWILRw-1
Received: by mail-qt1-f200.google.com with SMTP id u17so7856172qtq.13
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 14:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=mo3LWlCNiIOFoCmxEjwdUemS1sJZBLVfxAMsdk/Iu6M=;
        b=XvFnaiGqnTlyhF3YqhFehlkmFpjBYbv9uxhCcb0a54LwmdNXjsoUe1wiwkvFS66sXA
         xc7heNL508D5Vlc/F1/TmL3TMlFT0Zi0higcoANRc14LA1w5Wl/o80Ywa4tQ12UKVFBr
         PFJeyJWQGZ3oQ6m+akQ1oSo/9O3cs1qtDXHNWzAzris0cOaAywnc7QaYa6LipNTpHFJB
         WktPjCcR1bLWbB+RhmpvAhfYuBe0O6eAwjR3EMcGbzLjwlwfcl+iVrggq3LwN5Wp4aPM
         /MBitY//rqFfHHyNHXNRjOZZrLBFs9vNYVW14WwrC3dB3VL1n3H021IQXSyMjmPQC62M
         xNgg==
X-Gm-Message-State: AOAM530YsAn7n0s0045VK1xo7P9YQzqc5be3Ku53FY2IZTaZpjlJIioH
        lFKbe/ARCW+58h8yjOjwgI6M3PRD3mddEHUNYX2913d+NGKjENWezoSsub4K+3YWT3ycdmfMcu1
        zPLoFXUVO5pj4WS+Xd/6a
X-Received: by 2002:ac8:1349:: with SMTP id f9mr6839913qtj.24.1598304664001;
        Mon, 24 Aug 2020 14:31:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8RcZgt0TQyB0V/DUGdZj5UKHWK+5mR9NF506RVPbUZd9Y4USNfgfG3wOPaqhv+HbOrb76jw==
X-Received: by 2002:ac8:1349:: with SMTP id f9mr6839890qtj.24.1598304663686;
        Mon, 24 Aug 2020 14:31:03 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id r5sm136684qtd.87.2020.08.24.14.31.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2020 14:31:03 -0700 (PDT)
Subject: Re: [PATCH v2] usb: storage: initialize variable
To:     Vito Caputo <vcaputo@pengaru.com>
Cc:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        linux-kernel@vger.kernel.org
References: <20200824211027.11543-1-trix@redhat.com>
 <20200824211839.6c7m7yhgd7ffq3g3@shells.gnugeneration.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <c9c4fca2-d04a-1bf9-e90e-9476392c1662@redhat.com>
Date:   Mon, 24 Aug 2020 14:31:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200824211839.6c7m7yhgd7ffq3g3@shells.gnugeneration.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 8/24/20 2:18 PM, Vito Caputo wrote:
> On Mon, Aug 24, 2020 at 02:10:27PM -0700, trix@redhat.com wrote:
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
>> So set partial on entry to 0.
>>
>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>  drivers/usb/storage/transport.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
>> index 238a8088e17f..044429717dcc 100644
>> --- a/drivers/usb/storage/transport.c
>> +++ b/drivers/usb/storage/transport.c
>> @@ -414,6 +414,9 @@ static int usb_stor_bulk_transfer_sglist(struct us_data *us, unsigned int pipe,
>>  {
>>  	int result;
>>  
>> +	if (act_len)
>> +		*act_len = 0;
>> +
>>  	/* don't submit s-g requests during abort processing */
>>  	if (test_bit(US_FLIDX_ABORTING, &us->dflags))
>>  		return USB_STOR_XFER_ERROR;
> At a glance this seems odd to me.  If the caller insists on ignoring
> the return value, shouldn't it just initialize partial to zero?
>
> In my experience it's generally frowned upon for functions to store
> results in error paths.

Then maybe v1 is more appropriate.

Else i can spin a v3.

My preference is v1 as it doesn't add any runtime if-checks.

Tom

> Regards,
> Vito Caputo
>


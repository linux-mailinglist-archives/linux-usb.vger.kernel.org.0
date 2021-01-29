Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA40E3082C7
	for <lists+linux-usb@lfdr.de>; Fri, 29 Jan 2021 02:00:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231486AbhA2A5t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jan 2021 19:57:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbhA2A5l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jan 2021 19:57:41 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2098CC061573
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 16:57:01 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id f16so5638674wmq.5
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 16:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0EQ8oHxswQLReramq9MegxVqQbGVrPNP9ryMhszFjBk=;
        b=jwq8M9JUZCx6Pnwz1HkbsBA2fTitT+cg4tdbXBhP45yNzL13pw+G2HWtAFapRoG7SK
         qyor7CDorsFQsC+9cpI8TPo35+nDzR56NPZukataTMmUNirp+VvY6jYKjZ/dfRWkLwxA
         B3PkJ/2JCcEvFkfC6POrhHi+IZtEEk8X/AL+cg9NrqVFrPaqifCS5ZEBrOFzClf4oLh6
         TU1TlxZ4KnDOSZAikzBzfDX3Lv/urkmVwGzy5d3XDyqOe6WuYPLHt+jz6mXmhHx9cpjU
         PbNW9nlZQbKD9GOABpFXPHlyR/KYPVPI6G5kOOZXxtj3ESCLRjmPAsDsJO0esui+9Rpo
         2TXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0EQ8oHxswQLReramq9MegxVqQbGVrPNP9ryMhszFjBk=;
        b=JNufeYKqmQereVApRRqn+94wC/HGbv6dbkH4rCNhVsNFYUniUVQveKe6ovUKYWRSqp
         dvAQ+CzGR/z2hTYShwjcIf+w5BEESasNS99FpC2HFZ9Sbel1HMLJOVfwgbq/di22MMN0
         y2UbwxrQqovg1lGXc2OLCnwoIc6CpjQsedSrNumK1HC7PrjXICYFGC1dItPIsLP9mCGQ
         4c2Irdi/5smZqhyyv1ehS3i7sZkRy4O3X8VSMzJNO3eNxiB+H/CzoO1teauWLZwqHcB7
         6tMb5SJ6wcAW748tuDQ/2n91TKE6nKv5u51pBN95mrom5M6NGAukLwjqxeGm0oTYlZqp
         mOrg==
X-Gm-Message-State: AOAM53117R6S+qOwTYl/dY5JK6pQ3AfNAJkuEAcg/IT2Xf40Mwuii5fY
        iuPL7ezoRcYJN85u93TeODM18jna4Nfiug==
X-Google-Smtp-Source: ABdhPJys7hSWhUI0t0CZYBMud1VhQErR8P6z+a5CQRh2QM9TbVxDiCmcvce6I0WEcPAc1wKhdSysNg==
X-Received: by 2002:a1c:9850:: with SMTP id a77mr1443768wme.163.1611881819906;
        Thu, 28 Jan 2021 16:56:59 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id z184sm8185018wmg.7.2021.01.28.16.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 16:56:59 -0800 (PST)
Subject: Re: [PATCH] usb: dwc3: gadget: Init only available HW eps
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <3080c0452df14d510d24471ce0f9bb7592cdfd4d.1609866964.git.Thinh.Nguyen@synopsys.com>
 <87eeiycxld.fsf@kernel.org>
 <75d63bab-1cdc-737e-8ae2-64e0ddeeef75@synopsys.com>
 <87k0spay6z.fsf@kernel.org>
 <cacf58e7-e131-2caa-5fb3-1af7db8270b4@synopsys.com>
 <19b685a9-0c25-9b6c-ecaf-ffca4069182b@synopsys.com>
 <87eeivwrb9.fsf@kernel.org>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
Message-ID: <c322742e-271d-e267-f499-3cc8a2dc7df6@nexus-software.ie>
Date:   Fri, 29 Jan 2021 00:58:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <87eeivwrb9.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 08/01/2021 12:23, Felipe Balbi wrote:
> 
> Hi,
> 
> Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
>>>>>> How have you verified this patch? Did you read Bryan's commit log? This
>>>>>> is likely to reintroduce the problem raised by Bryan.
>>>>>>
>>>>> We verified with our FPGA HAPS with various number of endpoints. No
>>>>> issue is seen.
>>>> That's cool. Could you please make sure our understanding of this is
>>>> sound and won't interfere with any designs? If we modify this part of
>>>> the code again, I'd like to see a clear reference to a specific section
>>>> of the databook detailing the expected behavior :-)
>>>>
>>>> cheers
>>>>
>>> Hm... I didn't consider bidirection endpoint other than control endpoint.
>>>
>>> DWC3_USB3x_NUM_EPS specifies the number of device mode for single
>>> directional endpoints. A bidirectional endpoint needs 2 single
>>> directional endpoints, 1 IN and 1 OUT. So, if your setup uses 3
>>> bidirection endpoints and only those, DWC3_USB3x_NUM_EPS should be 6.
>>> DWC3_USB3x_NUM_IN_EPS specifies the maximum number of IN endpoint active
>>> at any time.
>>>
>>> However, I will have to double check and confirm internally regarding
>>> how to determine many endpoint would be available if bidirection
>>> endpoints come into play.
>>>
>>> Thanks for pointing this out. Will get back on this.
>>>
>>> Thinh
>>>
>>
>> Ok. Just had some discussion internally. So, like you said, any endpoint
>> can be configured in either direction. However, we are limited to
>> configuring up to DWC_USB3x_NUM_IN_EPS because each IN endpoint has its
>> own TxFIFO while for OUT, they share the same RxFIFO. So we could have
>> up to DWC_USB3x_NUM_EPS number of OUT endpoints. So, the issue Bryan
>> attempted to address is still there.
>>
>> However, the current code still has some assumption on the number of IN
>> and OUT endpoints, I need to think of a better solution.
> 
> Yes, the assumption still exists because at the time there was no better
> solution :-)
> 

Just found this now.

The commit log is too wordy. You can configure the RTL so that every 
endpoint can be either direction.

So DWC_USB3_NUM == DWC_USB3_NUM_IN_EPS

The old code was predicated on the notion the RTL was configured with 
EP0 IN/OUT basically fixed.

In practice this _should_ be the case but the RTL does not enforce it 
and yes this appears in a real SoC from Imagination.

---
bod

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80BE131B246
	for <lists+linux-usb@lfdr.de>; Sun, 14 Feb 2021 20:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbhBNTl1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 14 Feb 2021 14:41:27 -0500
Received: from avasout02.plus.net ([212.159.14.17]:38024 "EHLO
        avasout02.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbhBNTlZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 14 Feb 2021 14:41:25 -0500
X-Greylist: delayed 540 seconds by postgrey-1.27 at vger.kernel.org; Sun, 14 Feb 2021 14:41:24 EST
Received: from [10.0.2.15] ([147.147.167.73])
        by smtp with ESMTPA
        id BN7JlWwUqjOtyBN7KlyjNE; Sun, 14 Feb 2021 19:31:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1613331099; bh=rbBTkQvF1/bHKKJPCULfkb7AgNO6MtpJ1dpZEYcT4v4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=KgyiiVzXLbMdFHwjT7zzZyt1Q0Ig8zL2Gox3iU2hCMfAbtOVbzEGVt+Uldoo56rwD
         80XucEghPm55KJVYMogSTWC6kWLgrH4Xbb4HGQqz9WIgMbsUxKWOKePtiECQ2Fz6WG
         21nPGQPOL0TxS8Tr63wmN6GJJu1eau5RAta0qUtEtJOC1WWZhHTuevaA3qJbkVSdyV
         h6s5paFEly9fwj0+snCb/kXq11mVVU1YwdfwC7PMT8wpqrogYIr95BpY3IEYVVuljP
         wi9aLD5t5KBdy1ZslTjK0YfnGvDudPztKyFy4IwI9Wso+lQSHiwb385Q7wZH372tX2
         A/0emcUVTNVcw==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=UcTKtJaN c=1 sm=1 tr=0
 a=nK5asC+3lBOC3EoKtwbYYg==:117 a=nK5asC+3lBOC3EoKtwbYYg==:17
 a=IkcTkHD0fZMA:10 a=EBOSESyhAAAA:8 a=Wm_VZl6z05tM19AFg1QA:9 a=QEXdDO2ut3YA:10
 a=yJM6EZoI5SlJf8ks9Ge_:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH v2 2/4] usb: typec: tps6598x: Add trace event for status
 register
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-usb@vger.kernel.org
Cc:     =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Sparse Mailing-list <linux-sparse@vger.kernel.org>
References: <651ac50b9ff6ed3db8cab9f176514900f6a02a0c.1613131413.git.agx@sigxcpu.org>
 <20210213031237.GP219708@shao2-debian> <YClYh7pqDlbXy8qh@bogon.m.sigxcpu.org>
 <6a8eb07f-16d5-f461-cf0b-6c4aaf93b014@ramsayjones.plus.com>
 <CAHk-=wjCAVj7J+KAC1pvtdeM-c76oXZq7k=v40-maKjTo6qfVw@mail.gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <c48e4250-a42a-9f99-1280-69b0b5cfb69d@ramsayjones.plus.com>
Date:   Sun, 14 Feb 2021 19:31:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjCAVj7J+KAC1pvtdeM-c76oXZq7k=v40-maKjTo6qfVw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBvUKy+/UU37fBEWzQ/KjFKosH1t/3bIq/BfPSWlxeukQnoMzNc8lnoL2gM4TAmRVH09SSy8xwu2MHUoVt8SZt8BpHZw6cPCB4Q0EtkJypwRTa6jnXfE
 L3IcorPRfPRAlZdgXvFKYlRLmlwnJUwPsViLTASwRRaScDj6CIBQt9W2snLcj2GEcWtBWQRmafBINw==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 14/02/2021 19:00, Linus Torvalds wrote:
> On Sun, Feb 14, 2021 at 10:42 AM Ramsay Jones
> <ramsay@ramsayjones.plus.com> wrote:
>>
>>>
>>> I looked around but didn't find any hints how to fix this. Any pointers
>>> I missed (added the sparse list to cc:)?
>>
>> This is a limitation of sparse; when using the 'stringize' pre-processor
>> operator #, the maximum size of the resulting string is about 8k (if I
>> remember correctly).
> 
> Well, yes and no.
> 
> The C89 standard actually says that a string literal can be at most
> 509 characters to be portable. C99 increased it to 4095 characters.
> 
> Sparse makes the limit higher, and the limit could easily be expanded
> way past 8kB - but the point is that large string literals are
> actually not guaranteed to be valid C.
> 
> So honestly, it really sounds like that TRACE_EVENT() thing is doing
> something it shouldn't be doing.

Yep, as I said, I didn't submit the patch - rather I changed the source
so as not to need such a long string.

> I don't think there's any fundamental limit why sparse does 8kB as a
> limit (just a few random buffers). Making sparse accept larger ones
> should be as simple as just increasing MAX_STRING, but I really don't
> think the kernel should encourage that kind of excessive string sizes.

I agree, but I wiggled my patch (which doesn't increase MAX_STRING) to
apply to the current codebase, and ... it now fails two tests! ;-)
(It seems, in the intervening 9 years, the show_token_sequence() function
fixed the quoting of double-quotes in the resulting strings, which
my patch fails to do).

Sorry for the noise.

ATB,
Ramsay Jones


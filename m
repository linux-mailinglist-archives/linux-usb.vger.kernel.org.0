Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 512C47904B4
	for <lists+linux-usb@lfdr.de>; Sat,  2 Sep 2023 03:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239030AbjIBB62 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Sep 2023 21:58:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjIBB61 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Sep 2023 21:58:27 -0400
X-Greylist: delayed 596 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 01 Sep 2023 18:58:23 PDT
Received: from h8.fbrelay.privateemail.com (h8.fbrelay.privateemail.com [162.0.218.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0FC7E5F
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 18:58:23 -0700 (PDT)
Received: from MTA-08-4.privateemail.com (mta-08.privateemail.com [198.54.118.215])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by h7.fbrelay.privateemail.com (Postfix) with ESMTPSA id 9A131606F4
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 21:48:25 -0400 (EDT)
Received: from mta-08.privateemail.com (localhost [127.0.0.1])
        by mta-08.privateemail.com (Postfix) with ESMTP id 6ED691800044;
        Fri,  1 Sep 2023 21:48:23 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=pawlicker.com;
        s=default; t=1693619303;
        bh=ph+qH8lPuWBgfkFQc/N/FEWLmq7JvvFj1B1VsulDa2w=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=dqxCgSUKEri+zZqAFYzqbRfSV6iAd/GrteDpJSxYBJCg7ZG5gENxtXVeP/s9N+a1f
         PU+8YqdIkw9fqjMu5pRjCmKXCWxln+6INuIq9kr4zd/0RQ4MthZhJ9VTefZ9Z87eBz
         JrCMENznCjpKtW+W9nq07nublMpgx8CL3WKqdZfPouc7aiBJcK55TiXdRHAS0FYZSq
         JhsYMu+965r6Anivv4MVeaoYUEwOP7mBEyDagCiHJ59D/gGQ23M+XfAl0qC69FMAfv
         Si9YyHcn9dGiJ6ntnMRMNHyXkFLbnF2hC4EDKxkMWiGW6AQMy74mITAfD7pWPWUd4K
         ItPSOZaRwK7ZA==
Received: from [192.168.1.14] (ip-74-83-187-83.dynamic.fuse.net [74.83.187.83])
        by mta-08.privateemail.com (Postfix) with ESMTPA;
        Fri,  1 Sep 2023 21:48:20 -0400 (EDT)
Message-ID: <05725c82-3a08-4c03-a951-af3cea17c86d@pawlicker.com>
Date:   Fri, 1 Sep 2023 21:48:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: alauda_check_media() doubts
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>
Cc:     USB list <linux-usb@vger.kernel.org>
References: <eee774db-0cd1-5870-8909-b616d962791f@suse.com>
 <001562e9-bc84-498f-a15a-8b4a01f172a7@rowland.harvard.edu>
 <16964970-5f7a-c80c-ad30-0a09fef9dc2f@suse.com>
 <16bc533a-d581-4aea-a7b7-6d88a51ca73e@rowland.harvard.edu>
From:   Pawlicker <jake@pawlicker.com>
In-Reply-To: <16bc533a-d581-4aea-a7b7-6d88a51ca73e@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It's interesting that there's semi active discussion about this driver.

I ran into the driver being completely and utterly broken today when I 
bought a Fujifilm DPC-R1 card reader (that was unsold for ages at the 
local camera store to read out my Minolta α-9's exposure info) that uses 
this chipset. It will either generate an oops error or media error 
depending on when the card is inserted into the reader, but it at least 
detects it.

I've submitted a bug (#217862) about this issue. The behavior is a bit 
interesting on older kernels (as in 5.15) as it simply generates the 
"transfer buffer is on stack" error but does not detect any media in the 
slot whatsoever or attempt to.

Jake (aka Pawlicker)

On 8/29/2023 7:28 PM, Alan Stern wrote:
> On Tue, Aug 29, 2023 at 11:42:07PM +0200, Oliver Neukum wrote:
>>
>>
>> On 29.08.23 20:49, Alan Stern wrote:
>>> On Tue, Aug 29, 2023 at 08:14:05PM +0200, Oliver Neukum wrote:
>>>> Hi Alan,
>>>>
>>>> as you did something on this driver, doesn't
>>>> this condition:
>>>>
>>>> (status[0] & 0x80) ||
>>>>                   ((status[0] & 0x1F) == 0x10) || ((status[1] & 0x01) == 0)
>>>>
>>>> look odd to you? Especially the parentheses?
>>>
>>> (The actual text in my copy of the file is:
>>
>> Yes, I rearranged it by the parantheses.
>>
>>> 	if ((status[0] & 0x80) || ((status[0] & 0x1F) == 0x10)
>>> 		|| ((status[1] & 0x01) == 0)) {
>>>
>>> This probably doesn't affect your point...)
>>>
>>> Certainly the layout is a little peculiar, and the extra parentheses
>>> don't help any.  But they don't really hurt, either, and the meaning is
>>> clear.  It doesn't look obviously wrong.
>>
>> Ok, then this is just me. THe parantheses would make perfect sense
>> if the actual intent were:
>>
>> (status[0] & 0x80) ||
>> 		((status[0] & 0x1F) == 0x10) && ((status[1] & 0x01) == 0)
> 
> In fact, if I were writing that expression, I would do:
> 
> (status[0] & 0x80) ||
> 		((status[0] & 0x1F) == 0x10 && (status[1] & 0x01) == 0)
> 
> simply because I don't like relying on the relative precedence of || and
> &&.  That's just my own neurosis.  (On the other hand I have no qualms
> about the relative precedence of && and ==, because that combination of
> operators gets used all the time.  Maybe Daniel Drake preferred not to
> rely on it?)
> 
> For all we know, this is what the code _should_ be.  Without any
> documentation on the meaning of the status bits, there's no way to tell.
> 
>>> Those two lines go back to the original version of the driver, added in
>>> 2005 by commit e80b0fade09e ("[PATCH] USB Storage: add alauda support"),
>>> written by Daniel Drake and edited by Matt Dharm.  So it's been around
>>> for quite a while and there may not be many devices left that need this
>>> driver.
>>
>> Yes, I know. Hence my question.
>>
>>> Did you want to change it?
>>
>> Nope. I just looked through the log and saw your patch for the
>> failure of the transfer and the subsequent test looked
>> messed up.
> 
> At this point, I don't think it matters much.
> 
> Alan Stern

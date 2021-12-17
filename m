Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3DAF4792C9
	for <lists+linux-usb@lfdr.de>; Fri, 17 Dec 2021 18:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239794AbhLQRZN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Dec 2021 12:25:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233875AbhLQRZN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Dec 2021 12:25:13 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4215FC061574
        for <linux-usb@vger.kernel.org>; Fri, 17 Dec 2021 09:25:13 -0800 (PST)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1myGyl-0001hn-79; Fri, 17 Dec 2021 18:25:11 +0100
Message-ID: <f1e9d624-100d-d7af-d716-1ca57474aa97@leemhuis.info>
Date:   Fri, 17 Dec 2021 18:25:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] usb: typec: ucsi: Only check the contract if there is a
 connection
Content-Language: en-BS
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Chris Hixon <linux-kernel-bugs@hixontech.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <20211217140327.31921-1-heikki.krogerus@linux.intel.com>
 <1d90a23b-fe2f-6892-1641-7a13e38a00dc@leemhuis.info>
 <YbypYo4Ohii4fSNx@kuha.fi.intel.com>
From:   Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <YbypYo4Ohii4fSNx@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1639761913;73a19a97;
X-HE-SMSGID: 1myGyl-0001hn-79
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 17.12.21 16:14, Heikki Krogerus wrote:
> Hi,
> 
> On Fri, Dec 17, 2021 at 03:32:59PM +0100, Thorsten Leemhuis wrote:
>> Lo! Thx for working out a fix this quickly!
>>
>> I'm just the regression tracker, but I think there are a few minor
>> details to improve here.
>>
>> On 17.12.21 15:03, Heikki Krogerus wrote:
>>> The driver must make sure there is an actual connection
>>> before checking details about the USB Power Delivery
>>> contract. Those details are not valid unless there is a
>>> connection.
>>>
>>> This fixes NULL pointer dereference that is caused by an
>>> attempt to register bogus partner alternate mode that the
>>> firmware on some platform may report before the actual
>>> connection.
>>>
>>> Fixes: 6cbe4b2d5a3f ("usb: typec: ucsi: Check the partner alt modes always if there is PD contract")
>>> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=215117
>> BugLink? Is that a tag we really use? Then I'm unaware of it. Greg is
>> the expert and can likely clarify, but that line afaik needs to replaced
>> by this:
> 
> Although not yet documented, it is the appropriate tag for the link to
> the bug.

For you maybe. But it kind of becomes a mess if various people create
different tags, as they do now (you are just one of them).

> It makes it clear that the link is to the bug and not to
> the discussion on the list.

I agree that some clarification is needed, that's why I recently
proposed something:
https://lore.kernel.org/lkml/cover.1639042966.git.linux@leemhuis.info/

Maybe chime in there.

>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=215117
>> Link:
>> https://lore.kernel.org/linux-usb/bug-215117-208809@https.bugzilla.kernel.org%2F/
>>
>> Normally the last line would need a 's!linux-usb!r!', but seems the
>> kernel.org redirector doesn't work well in this particular case, so I
>> guess it's better this way than not at all :-/
>>
>> The second line will also make the regression tracking bot automatically
>> close the issue (but I fear it might also fail due to the slash at the
>> end of the message-id :-/)
> 
> Greg will add the "Link" tag to the commit when, and if, he actually
> takes the patch.

No, that is another Link tag. Let me quote
Documentation/process/submitting-patches.rst:

```
If related discussions or any other background information behind the
change can be found on the web, add 'Link:' tags pointing to it. In case
your patch fixes a bug, for example, add a tag with a URL referencing
the report in the mailing list archives or a bug tracker;
```

This concept is old, but the text was reworked recently to make this use
case for the Link: tag clearer.
For details see: https://git.kernel.org/linus/1f57bd42b77c

As the issue was discussed in a bug tracker and on the list, please add
Link tags to both places.

> I do not add it because I do not want any bots to
> react to the patch before it has actually been accepted.
> 
> The bug shouldn't be closed before the fix has really been accepted.
> 
>> I think this line should be there as well:
>>
>> Reported-by: Chris Hixon <linux-kernel-bugs@hixontech.com>
> 
> +Chris
> 
> This is true. I'll add the Reported-by tag if it's OK to you Chris?

thx!

Ciao, Thorsten

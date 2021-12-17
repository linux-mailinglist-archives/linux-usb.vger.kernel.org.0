Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6254796B1
	for <lists+linux-usb@lfdr.de>; Fri, 17 Dec 2021 23:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbhLQWAg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Dec 2021 17:00:36 -0500
Received: from sender3-op-o12.zoho.com ([136.143.184.12]:17865 "EHLO
        sender3-op-o12.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbhLQWAf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Dec 2021 17:00:35 -0500
X-Greylist: delayed 904 seconds by postgrey-1.27 at vger.kernel.org; Fri, 17 Dec 2021 17:00:35 EST
ARC-Seal: i=1; a=rsa-sha256; t=1639777522; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=m1EN6GlycFuU2k+d2VH33fnbnHpWunxhtidVcx+qtuCUOYsDYsKzCbYzB2+ZaelXDz/hSUcPxlTX6/5xnKtRY5K8y6BKQ3WnQhfuHYNpBaWYPSAsy55vsspLTNkQiSBxEjenCA+N7sVqt6v+7ruBDphQk/r7tanTdRxMT5rzFIo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1639777522; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=kaNebS0UtVoGsOxAchCwqnaBlgK7wVitOc8I0f6hSdw=; 
        b=njZFRXLGpsvO9WisiqO+gXzSYc8GsOBs+78FK6TTnWZFyT1ILUswduqPfkq4UfDIdARSlFtCyuABxInv07hkMKxZmQnL56vE4f/dJx+CDL1+7ISiYTJWfCfbtcsy6C2nEUeXh+P5n84Ms5ayPKpN9YGdkIBoaJjrsGE6JsyRS0o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=hixontech.com;
        spf=pass  smtp.mailfrom=linux-kernel-bugs@hixontech.com;
        dmarc=pass header.from=<linux-kernel-bugs@hixontech.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1639777522;
        s=zoho; d=hixontech.com; i=linux-kernel-bugs@hixontech.com;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=kaNebS0UtVoGsOxAchCwqnaBlgK7wVitOc8I0f6hSdw=;
        b=g1D4VKYdBaTRza6b8g82kpyMur5DtS/HDxAEvizQVXqXReMZjx1aobPCdZsIdfXl
        Wle3sea1pATrxsRJoY9wh9hX1HZNEL2KGnxrW3VbSfxCb1RPHZIpyXokHp/Dv2sobT2
        EF7x66cOWegdWrpVDmk8fY8euxLS0n7hh40r6DpU=
Received: from droplet5.hixontech.com (droplet5.hixontech.com [164.90.159.118]) by mx.zohomail.com
        with SMTPS id 1639777519811532.2501877550594; Fri, 17 Dec 2021 13:45:19 -0800 (PST)
Message-ID: <1c569077-86e9-e3ab-1a78-8e0af2e38031@hixontech.com>
Date:   Fri, 17 Dec 2021 14:45:17 -0700
MIME-Version: 1.0
Subject: Re: [PATCH] usb: typec: ucsi: Only check the contract if there is a
 connection
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Thorsten Leemhuis <regressions@leemhuis.info>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <20211217140327.31921-1-heikki.krogerus@linux.intel.com>
 <1d90a23b-fe2f-6892-1641-7a13e38a00dc@leemhuis.info>
 <YbypYo4Ohii4fSNx@kuha.fi.intel.com>
From:   Chris Hixon <linux-kernel-bugs@hixontech.com>
In-Reply-To: <YbypYo4Ohii4fSNx@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/17/21 8:14 AM, Heikki Krogerus wrote:

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
> Although not yet documented, it is the appropriate tag for the link to
> the bug. It makes it clear that the link is to the bug and not to
> the discussion on the list.
>
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
> Greg will add the "Link" tag to the commit when, and if, he actually
> takes the patch. I do not add it because I do not want any bots to
> react to the patch before it has actually been accepted.
>
> The bug shouldn't be closed before the fix has really been accepted.
>
>> I think this line should be there as well:
>>
>> Reported-by: Chris Hixon <linux-kernel-bugs@hixontech.com>
> +Chris
>
> This is true. I'll add the Reported-by tag if it's OK to you Chris?
>
> thanks,
>

Yes, that's fine with me. Please add the tag:

Reported-by: Chris Hixon <linux-kernel-bugs@hixontech.com>

Thanks


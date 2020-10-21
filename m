Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1EF42953A0
	for <lists+linux-usb@lfdr.de>; Wed, 21 Oct 2020 22:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439642AbgJUUtg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 16:49:36 -0400
Received: from aibo.runbox.com ([91.220.196.211]:50688 "EHLO aibo.runbox.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405190AbgJUUtg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Oct 2020 16:49:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
         s=selector1; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
        bh=Ti3Yby7LITr4keP6019r5O4s555v8iv4/q5zPVExxGs=; b=SyzI2j9HqtViccaaWicwBO2kQH
        pkQrnzRyX+EMnmUf3Qz6TggW5G8RYEB8IFI0zgxUyvXKvIE526QPSUCVhMVHAAzFyniZwYQQ8Z4+D
        zk3M7RleQ9h7v2lhGaDJzxARlRfTL0mkXULaPkjPBYg/S1Tr8dSyRf6FAP0VtMu4ECqPSPt6IEOMT
        Hii61kHH8F+3mhGwKzSLa6FuVKIhQQYmtUr7+0PfmgKTDAIh4Ci1tFq3FNLV1ys+SomHvUCI9hTjM
        TqWzEcFKSowbfQ3A9qQrvksxuepdzxGw7iI/jOMu1m/qNccecxqOkv+wiN3DiBfDF4hCy4m7O9xRA
        1W8HOrzA==;
Received: from [10.9.9.73] (helo=submission02.runbox)
        by mailtransmit02.runbox with esmtp (Exim 4.86_2)
        (envelope-from <m.v.b@runbox.com>)
        id 1kVL37-0001Gz-SQ; Wed, 21 Oct 2020 22:49:34 +0200
Received: by submission02.runbox with esmtpsa  [Authenticated alias (536975)]  (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        id 1kVL2x-0004ZZ-6Q; Wed, 21 Oct 2020 22:49:23 +0200
Subject: Re: Bug caused by 53965c79c2db (USB: Fix device driver race)
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Bastien Nocera <hadess@hadess.net>, Pany <pany@fedoraproject.org>,
        linux-usb@vger.kernel.org
References: <CAE3RAxt0WhBEz8zkHrVO5RiyEOasayy1QUAjsv-pB0fAbY1GSw@mail.gmail.com>
 <20201017200200.GB842001@rowland.harvard.edu>
 <CAE3RAxvNUvzqKT+GK3A4cQ7Tm_tFRQJKfJ01r0ic-5066fikDA@mail.gmail.com>
 <20201019174028.GF898631@rowland.harvard.edu>
 <cf1e7059-e1d2-2e7a-89c1-0c162850fbb4@runbox.com>
 <20201020152859.GA945128@rowland.harvard.edu>
 <74e25095-53fa-b98c-6baf-c97eea574d1c@runbox.com>
 <e7ecea72755147dc3252e8d5c1735903993caa1e.camel@hadess.net>
 <83bd4ab7-15a6-73c2-decd-1da1c393bad0@runbox.com>
 <5d2dc161951d0717d1ccfc88049c241c8ce8d1e6.camel@hadess.net>
 <20201021201127.GA1002979@rowland.harvard.edu>
From:   "M. Vefa Bicakci" <m.v.b@runbox.com>
Message-ID: <06c5912d-5448-3670-d497-8f7dfaf42a34@runbox.com>
Date:   Wed, 21 Oct 2020 16:49:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201021201127.GA1002979@rowland.harvard.edu>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21/10/2020 16.11, Alan Stern wrote:
> On Wed, Oct 21, 2020 at 03:18:06PM +0200, Bastien Nocera wrote:
>> On Wed, 2020-10-21 at 09:08 -0400, M. Vefa Bicakci wrote:
>>> On 21/10/2020 07.53, Bastien Nocera wrote:
>>> [Snipped by Vefa]
>>>>
>>>> I have no idea why there isn't a match function. Patch v1 had a
>>>> huge
>>>> table:
>>>> https://marc.info/?l=linux-usb&m=157062863431186&w=2
>>>> and v2 already didn't had that comment, but no .match function:
>>>> https://marc.info/?l=linux-usb&m=157114990905421&w=2
>>>>
>>>> I'll prepare a patch that adds a match function. I'll let you
>>>> (Vefa)
>>>> look at which of your patches need backporting though, as I'm
>>>> really
>>>> quite a bit lost in the different patch sets and branches :/
>>>
>>> Hello Bastien,
>>>
>>> Having found the root cause of the issue by going through Pany's
>>> logs and having proposed a solution, I was hoping to get credit
>>> for the resolution of the issue by authoring the patch.
>>
>> I don't care either way. Attached are the 2 patches I had made and was
>> in the process of compiling and testing, feel free to adapt them,
>> change the authorship, etc.
>>
>> Note that you mentioned you'd need to "replace the ID table with
>> a match function", which will mean that the driver isn't automatically
>> loaded when a device gets plugged in. So that wouldn't have worked.
>>
>> Let me know when you've made your patch, as I'll need to update this
>> bug when there's something to test:
>> https://bugzilla.redhat.com/show_bug.cgi?id=1878347
>>
>> Cheers
> 
>>  From 6652af5b46f39d9690d72dc11902b36a44c242a1 Mon Sep 17 00:00:00 2001
>> From: Bastien Nocera <hadess@hadess.net>
>> Date: Wed, 21 Oct 2020 14:31:58 +0200
>> Subject: [PATCH 2/2] USB: apple-mfi-fastcharge: don't probe unhandled devices
>>
>> Contrary to the comment above the id table, we didn't implement a match
>> function. This meant that every single Apple device that was already
>> plugged in to the computer would have its device driver reprobed
>> when the apple-mfi-fastcharge driver was loaded, eg. the SD card reader
>> could be reprobed when the apple-mfi-fastcharge after pivoting root
>> during boot up and the module became available.
>>
>> Make sure that the driver probe isn't being run for unsupported
>> devices by adding a match function that checks the product ID, in
>> addition to the id_table checking the vendor ID.
>>
>> Fixes: 249fa8217b84 ("USB: Add driver to control USB fast charge for iOS devices")
>> Signed-off-by: Bastien Nocera <hadess@hadess.net>
>> ---
> 
> Another note: The patch description should include a pointer to Pany's
> RedHat Bugzilla bug report.
> 
> Alan Stern

Hello Alan,

Thank you for the feedback. I will make sure that a link to the bug report
is in the patch description.

Vefa

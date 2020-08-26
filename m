Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55169252E03
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 14:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729679AbgHZMIM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 08:08:12 -0400
Received: from blockout.pre-sense.de ([213.238.39.74]:51571 "EHLO
        mail.pre-sense.de" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729426AbgHZMB5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Aug 2020 08:01:57 -0400
X-Greylist: delayed 528 seconds by postgrey-1.27 at vger.kernel.org; Wed, 26 Aug 2020 08:01:56 EDT
Received: from smtp.pre-sense.de (tetris_b.pre-sense.de [10.9.0.76])
        by mail.pre-sense.de (Postfix) with ESMTP id 2E7135E558;
        Wed, 26 Aug 2020 13:53:04 +0200 (CEST)
Received: from atlan.none (unknown [212.12.60.67])
        by smtp.pre-sense.de (Postfix) with ESMTPS id 08C38164B;
        Wed, 26 Aug 2020 13:52:12 +0200 (CEST)
Subject: Re: Ext. HDDs not working under Linux via USB 3.0 but under Windows
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
References: <20200523154817.GA7091@rowland.harvard.edu>
 <34933b01-e4b0-10da-c935-9e6a9a6ae427@pre-sense.de>
 <20200523203349.GA12853@rowland.harvard.edu>
 <5bd5e8be-f8a9-9456-cced-c2bc75455556@pre-sense.de>
 <20200617163734.GC11314@rowland.harvard.edu>
 <763037ac-d8fa-8697-7f75-c0bf958b4308@pre-sense.de>
 <ce4d0606-b398-d23b-1a5f-25611eb4338f@pre-sense.de>
 <364ac09a-a877-c04e-5f2f-d5a559406590@pre-sense.de>
 <20200619150527.GA49731@rowland.harvard.edu>
 <c6fe1288-08a1-4d0a-37f5-c1ca44d46c25@pre-sense.de>
 <20200825184504.GC375466@rowland.harvard.edu>
From:   =?UTF-8?Q?Till_D=c3=b6rges?= <doerges@pre-sense.de>
Autocrypt: addr=doerges@pre-sense.de; prefer-encrypt=mutual; keydata=
 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
Organization: PRESENSE Technologies GmbH
Message-ID: <0c7a4975-596e-9c5a-062f-df77e8ebe969@pre-sense.de>
Date:   Wed, 26 Aug 2020 13:51:58 +0200
User-Agent: Thunderbird
MIME-Version: 1.0
In-Reply-To: <20200825184504.GC375466@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am 25.08.20 um 20:45 schrieb Alan Stern:
> On Fri, Jun 19, 2020 at 08:01:57PM +0200, Till Dörges wrote:
>> Am 19.06.20 um 17:05 schrieb Alan Stern:
>>
>>> Can you build and test a kernel with the patch below, to make sure it does 
>>> what you want?
>>
>> I was afraid you might say that. ;-)
>>
>> I don't have a kernel dev environment handy (that was the main reason why I was happy
>> with your offer of writing the patch).
>>
>> I'll try setting one up, but it may take a moment.
> 
> It has been a couple of months.  Did you make any progress on this?


Thanks for the reminder and sorry for the delay.


I just tested your patch and it works like a charm.


Testing was performed on:

--- snip ---
user@box:~> lsb-release -d
Description:    openSUSE Leap 15.1

user@box:~> uname -a
Linux box.none 4.12.14-lp151.28.59-default #1 SMP Wed Aug 5 10:58:34 UTC 2020
(337e42e) x86_64 x86_64 x86_64 GNU/Linux
--- snip ---


against the Kernel distributed by openSUSE:

--- snip ---
user@box:~> rpm -q kernel-source
kernel-source-4.12.14-lp151.28.59.1.noarch
--- snip ---


The patch applied and after loading the new uas.ko the HDDs which didn't work before
worked just fine.


I understand the openSUSE Leap Kernel is somewhat different from Kernel HEAD but I'd
assume that for the purpose of this test these differences are acceptable.


Is there anything else I can do to help?


Thanks again and regards -- Till
-- 
Dipl.-Inform. Till Dörges                  doerges@pre-sense.de
PRESENSE Technologies GmbH             Nagelsweg 41, D-20097 HH
Geschäftsführer/Managing Directors       AG Hamburg, HRB 107844
Till Dörges, Jürgen Sander               USt-IdNr.: DE263765024

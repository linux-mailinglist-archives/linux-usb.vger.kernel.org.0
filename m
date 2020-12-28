Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 098362E6653
	for <lists+linux-usb@lfdr.de>; Mon, 28 Dec 2020 17:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2632989AbgL1QME (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Dec 2020 11:12:04 -0500
Received: from ns3.fnarfbargle.com ([103.4.19.87]:53486 "EHLO
        ns3.fnarfbargle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2632994AbgL1QMD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Dec 2020 11:12:03 -0500
Received: from srv.home ([10.8.0.1] ident=heh13359)
        by ns3.fnarfbargle.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.84_2)
        (envelope-from <brad@fnarfbargle.com>)
        id 1ktv63-0004xd-9h; Tue, 29 Dec 2020 00:10:11 +0800
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fnarfbargle.com; s=mail;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=ZaznVjjp6qYIi9ky8LiJpRUtCsc//zqhL9lgDUoKVn8=;
        b=cqocJ8B2J75+c5eOz8Vzc8YjoJqndfeb1YlCVD4Jp21fUB0d6no02gYGGy5+lIgbe260xNsr6MV8zDfEbC/cbLKFEP4c0fN7B5ekRRDKIzavgWEU75AeXhhMQwWaRHHCFc8zvu0GQEltV2n05ceijyykleS8q1KPbmvFf7C4LH4=;
Subject: Re: Patch "usb: hcd: Try MSI interrupts on PCI devices" breaks
 usb-audio on my machine
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
References: <ad10644a-ac7f-d2e5-304c-edb5d2f0d0a0@fnarfbargle.com>
 <20201228144230.GW4077@smile.fi.intel.com>
From:   Brad Campbell <brad@fnarfbargle.com>
Message-ID: <8ad8125b-533c-c42f-ecff-6d073d8d2eb6@fnarfbargle.com>
Date:   Tue, 29 Dec 2020 00:10:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20201228144230.GW4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 28/12/20 10:42 pm, Andy Shevchenko wrote:
> On Mon, Dec 28, 2020 at 07:19:49PM +0800, Brad Campbell wrote:
>> G'day Andy,
>>
>> Commit 306c54d0edb6ba94d39877524dddebaad7770cf2 in kernel 5.9 breaks
>> usb-audio on my machine.
>>
>> I have a 2011 iMac with a pair of Apple Thunderbolt displays. Both Thunderbolt
>> displays have internal usb-audio devices. This patch causes the audio to stutter
>> terribly. Reverting it resolves the issue on any kernel up to and
>> including 5.10.3.
>>
>> Booting with pci=nomsi fixes the audio issues, but causes all sorts of
>> other problems (like broken Thunderbolt display routing), so that's a non-starter.
>>
>> The usb audio devices would appear to be on the Pericom USB controllers in the displays.
>> It wouldn't be the first peculiarity I've had on this machine due to the early Thunderbolt
>> implementation.
>>
>> The issue is pretty much identical with the sound card on both monitors.
> 
> Thanks for the report!
> 
> Funny that previous mail in my mailbox is exactly about this issue for
> PI7C9X440SL, i.e. fix [1] I made for v5.11 and Sasha ported to v5.10
> (mentioned previous mail). Can you try to apply [1] and confirm issue gone?

G'day Andy,

Can't ask for better than that. Yes, that patch on 5.10.3 solves the problem nicely.

Now I know what to look for, it's in 5.10.4.

Regards,
Brad
-- 
An expert is a person who has found out by his own painful
experience all the mistakes that one can make in a very
narrow field. - Niels Bohr

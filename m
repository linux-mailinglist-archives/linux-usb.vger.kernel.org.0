Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7597325DEC1
	for <lists+linux-usb@lfdr.de>; Fri,  4 Sep 2020 17:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbgIDP53 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Sep 2020 11:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbgIDP52 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Sep 2020 11:57:28 -0400
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050::465:101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4828C061244;
        Fri,  4 Sep 2020 08:57:27 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Bjj4202B3zKmgZ;
        Fri,  4 Sep 2020 17:57:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-language:content-transfer-encoding:content-type
        :content-type:in-reply-to:mime-version:date:date:message-id:from
        :from:references:subject:subject:received; s=mail20150812; t=
        1599235038; bh=IfbqbAynnmqph8MOdKpdNnD6H2jlmEmAh/USR0WprNQ=; b=J
        vHApvPT+4EMxw6SriHQ/P9Fnd6/XIqD37ZcMH/Nih4tMYqBx2x+IamTY3uEDYAt8
        skSRkKnHAmL2MeJVSDBmJUejgcMDHI9vVLAFhhynMEnayFfDOYwS7yA21kRq29CM
        R5ALAaAkgAB/LYZ3EEjNZdx+7F3y3p6/vR8ib2jnvWUX4o632hP/VPpcjjvloHdd
        h3xRBcqjZWb8W5hSvkJkwgTTgmZRGEnJv8QXyanhkC8wFfHyHUJQA0eT7NjcbafR
        fAJN5YU+kJDN+XiWdG6iPTsSR9RzKyeht0sPA1f6e8KQ3s84wQxOxIgiCcnCLEXl
        VeAHykOg9Fap3RPft3i5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1599235040;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zpbGrYXWP/yGCKsnNdD8K9eAP1BmEsLdGpvnWaHq9rI=;
        b=bmt+oMpuCBXaASht7+BBjNGx6BVxlcZiBEQl7R2mdwqFSIXGO//tJep7BNls1dtL3qtsxF
        yAcAvUJlJAMauTOWJtg0wj3JRD26nMY/2sSPa/1oPjaY5NTxDFFhFe5L2E5pcWICVKyUBH
        fxJj2hUngCu1DVJAHW40aiaEYLGjoN8lBpP+yk5M210jadeoY75prly0CkO4FXHwyag0B7
        8iFpNwbic26uhHY5WhNcg1vgM9C10VTmf7mLjgXt3cK/yNRfP9Y+Gvlthe6TZ/r/glulMq
        1rd8jDDsprHJj6LRpk0FZYvrrN7VU7IDuG+I3691jev+3AZxkU5G+kLPQ8AQ0g==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de [80.241.56.123]) (amavisd-new, port 10030)
        with ESMTP id F7yNVVoBbHKf; Fri,  4 Sep 2020 17:57:18 +0200 (CEST)
Subject: Re: kworker/0:3+pm hogging CPU
To:     Michal Hocko <mhocko@suse.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Salvatore Bonaccorso <carnil@debian.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>
References: <20200720173807.GJ1228057@rowland.harvard.edu>
 <20200720174530.GB4061@dhcp22.suse.cz>
 <20200720174812.GK1228057@rowland.harvard.edu>
 <20200720181605.GC4061@dhcp22.suse.cz>
 <20200720200243.GA1244989@rowland.harvard.edu>
 <20200721055917.GD4061@dhcp22.suse.cz>
 <20200721143325.GB1272082@rowland.harvard.edu>
 <20200829095003.GA2446485@eldamar.local>
 <20200829155949.GA499295@rowland.harvard.edu>
 <38dfdef4-f9ab-1755-8418-2285d843af86@linux.intel.com>
 <20200901152728.GI16650@dhcp22.suse.cz>
From:   Dirk Kostrewa <dirk.kostrewa@mailbox.org>
Message-ID: <f723f5a7-1b2e-e8d1-3b0b-201069b7a40c@mailbox.org>
Date:   Fri, 4 Sep 2020 17:57:16 +0200
MIME-Version: 1.0
In-Reply-To: <20200901152728.GI16650@dhcp22.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -2.84 / 15.00 / 15.00
X-Rspamd-Queue-Id: A6E0A179E
X-Rspamd-UID: 7fae64
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

meanwhile, I convinced Dell that I have a hardware issue (and not a 
Linux issue), and Dell has replaced the mainboard of my laptop. After 
that, both the USB over-current kernel messages and the kworker 
processes with permanent high CPU load are gone. So, this was indeed a 
hardware issue!

Many thanks for your feedback and help!

Best regards,

Dirk.

Am 01.09.20 um 17:27 schrieb Michal Hocko:

> On Mon 31-08-20 14:37:10, Mathias Nyman wrote:
> [...]
>> I can't come up with any good solution to this right now.
>> Only bad ideas such as
>> a. Add a sleep to the over-current case,
>>     doesn't solve anything else than the ~100% cpu hogging part of the problem
> This sounds like a better thing from the user space point of view. I do
> not have any insight on what kind of other side effects this might have
> so I didn't dare to try that on my piece of (broken) HW. I do not see
> the problem all the time and I plan to replace it soon anyway.
>
> Considering that tweaking the power management helps maybe that could be
> done automagically after many consecutive failures.
>
> Just my 2c

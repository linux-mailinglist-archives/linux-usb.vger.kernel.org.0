Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C2BE1943F5
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 17:04:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728490AbgCZQEL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 12:04:11 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:57934 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbgCZQEK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 12:04:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=SjqGe/PfsTwB75sDyMIZzrw9yeSjjPiU0L6OnDshOn0=; b=L5lH2bOxAqDRdXH2E8bt0aDOnB
        EqXL1oZxNnUYVWVCEVShUeTAwOLBC5DmFFq7Y1LRDRO1rM3dpX29mldW/CRR0p1w+93UGQnyFwxov
        GNYArxX2ov7fUm0o4rcpsyFO9CMGPeuv+3ouITUKco+CK467zMFKiMv/KMmrp0m/UCP+bXXlKKHZz
        SZaLo/cYFStxMPftxn6kwfNwCU6dygO9BVXlKVfdsGzPZ/cAlZOjF00GWqGU+CMugETPHUJBZ0p1J
        Mlges9Crxtfi8qsqHI3zM5Cg+lKvupj1SaKN+4BT3wg+X1XrPRENhXDisj2zkQp1AVSKQrhCC4U7K
        HRP+ASGA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jHUzK-0004Pw-BT; Thu, 26 Mar 2020 16:04:10 +0000
Subject: Re: Beginner query regarding usbhid
To:     Rohit Sarkar <rohitsarkar5398@gmail.com>
Cc:     Hubert CHAUMETTE <hubert.chaumette@kolabnow.com>,
        Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
        linux-newbie@vger.kernel.org
References: <5e7b5fbc.1c69fb81.cace7.7aa1@mx.google.com>
 <1585147543.3831.8.camel@suse.com>
 <5e7b6f15.1c69fb81.d92d3.facb@mx.google.com>
 <b799aa1720fecb94d832264b4561eb8a@kolabnow.com>
 <5e7b9127.1c69fb81.f2f8b.582c@mx.google.com>
 <cfda560c-ad5f-5e71-ab22-d8639688722b@infradead.org>
 <5e7c3e48.1c69fb81.7da14.34ab@mx.google.com>
 <fdc818d7-842c-cfef-3654-0478e74bfa73@infradead.org>
 <5e7c969c.1c69fb81.37131.654a@mx.google.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f6b96246-5821-9e54-e816-96f2e1a16cc4@infradead.org>
Date:   Thu, 26 Mar 2020 09:04:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <5e7c969c.1c69fb81.37131.654a@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3/26/20 4:48 AM, Rohit Sarkar wrote:
> Hi,
> On Wed, Mar 25, 2020 at 11:07:55PM -0700, Randy Dunlap wrote:
>>
>> So /home/rohit/kernels/staging is the top-level kernel source directory?
>>
>> "M=dir" is for external modules to be built.  AFAICT you are not building any
>> external modules.
>>
>> Just run
>> $ cd <top of kernel source tree>
>> $ make all
>> $ sudo make install
> 
> Wow it worked now.
> I ran make and make modules_install install. After that I restarted the
> system.
> 
> Does this mean everytime I do some changes to an intree module I need to
> reboot my system?

No, that should not be necessary.

-- 
~Randy


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 155DF13BB9F
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 09:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729141AbgAOI5r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 03:57:47 -0500
Received: from smtp.qindel.com ([89.140.90.34]:56840 "EHLO thor.qindel.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729044AbgAOI5q (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Jan 2020 03:57:46 -0500
X-Greylist: delayed 300 seconds by postgrey-1.27 at vger.kernel.org; Wed, 15 Jan 2020 03:57:46 EST
Received: from localhost (localhost [127.0.0.1])
        by thor.qindel.com (Postfix) with ESMTP id D551B602CB;
        Wed, 15 Jan 2020 09:52:44 +0100 (CET)
Received: from thor.qindel.com ([127.0.0.1])
        by localhost (thor.qindel.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id kfg-ZpTGDLIC; Wed, 15 Jan 2020 09:52:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by thor.qindel.com (Postfix) with ESMTP id 9F19A602CC;
        Wed, 15 Jan 2020 09:52:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at thor.qindel.com
Received: from thor.qindel.com ([127.0.0.1])
        by localhost (thor.qindel.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id EuQOVuYwOyNN; Wed, 15 Jan 2020 09:52:44 +0100 (CET)
Received: from superman.qindel.com (superman.qindel.com [172.26.4.138])
        by thor.qindel.com (Postfix) with ESMTP id 297BC602CB;
        Wed, 15 Jan 2020 09:52:41 +0100 (CET)
Date:   Wed, 15 Jan 2020 09:52:40 +0100 (CET)
From:   Vadim Troshchinskiy <vtroshchinskiy@qindel.com>
To:     shuah <shuah@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Valentina Manea <valentina.manea.m@gmail.com>
Message-ID: <783453790.2802069.1579078360600.JavaMail.zimbra@qindel.com>
In-Reply-To: <86e6dfbf-cf51-1467-3a78-fd72377385b7@kernel.org>
References: <5176009.64u6Zm7RkX@gverdu.qindel.com> <86e6dfbf-cf51-1467-3a78-fd72377385b7@kernel.org>
Subject: Re: [PATCH] usbip: Remove unaligned pointer usage from usbip tools
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.26.0.51]
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - GC77 (Linux)/8.0.6_GA_5922)
Thread-Topic: usbip: Remove unaligned pointer usage from usbip tools
Thread-Index: +rhF6qW7fw7UqOfMwhrOIKL4HzRpvA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



----- Mensaje original -----
> De: "shuah" <shuah@kernel.org>
> Para: "Vadim Troshchinskiy" <vtroshchinskiy@qindel.com>, linux-usb@vger.kernel.org
> CC: "Valentina Manea" <valentina.manea.m@gmail.com>, "shuah" <shuah@kernel.org>
> Enviados: Jueves, 2 de Enero 2020 1:01:24
> Asunto: Re: [PATCH] usbip: Remove unaligned pointer usage from usbip tools
> 
> Hi Vadim,
> 


Hello! Sorry for the late reply, I was on vacation.


> On 12/10/19 8:50 AM, Vadim Troshchinskiy wrote:
> > The usbip tools use packed structs for network communication. Taking the
> > address of a packed member of a struct can crash the program with SIGBUS
> > on architectures with strict alignment requirements.
> > 
> 
> Can you be more specific on which architectures?


To my knowledge, older ARM processors, SPARC, probably others mostly of the low
power/embedded kinds. I personally work with x86, so this isn't a critical issue
for me, but I'm noting it's a portability concern.

On architectures which don't produce an error it's typically a significant
performance penalty (though it wouldn't be that big of a deal in this case in
particular)

In my case the main issue is that recent versions of GCC warn about this and
fail when -Werror is used. Sure, one could disable the warning or remove -Werror,
but that would obscure the issue and could cause hard to figure out problems
for somebody else down the line.



> >   
> > -void usbip_net_pack_uint16_t(int pack, uint16_t *num)
> > +void usbip_net_pack_uint16_t(int pack, uint8_t *num)
> 
> Is there a reason to change this to uint8_t?
> 


On architectures that require alignment, access must be done on multiples
of the data size. So for instance a 16 bit value must be located at byte
addresses 0, 2, 4, 6, etc, and a 32 bit value would have to be at addresses
0, 4, 8, etc.

So taking a pointer to a 16 bit value located at address 3 is a problem, but
accessing a byte at the same address is just fine.

malloc always aligns allocations to the maximum amount necessary for any
value on the architecture, but that only goes for the first byte. If you take
the address of the second one you're not in alignment anymore.

So what the patch does is to copy a value byte by byte into a temporary
variable the compiler has made sure is correctly aligned, do the 16/32 bit
operation on that, then copy it back. For that to work it has to operate on
uint8_t.





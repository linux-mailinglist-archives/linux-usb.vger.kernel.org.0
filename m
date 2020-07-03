Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2A93213F61
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 20:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbgGCSpw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 14:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbgGCSpu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 14:45:50 -0400
Received: from smtp2.hosting90.cz (smtp2.hosting90.cz [IPv6:2a03:b780:1:0:216:3eff:fe00:24c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 041A3C061794
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 11:45:49 -0700 (PDT)
Received: from [46.229.122.58] (helo=[10.10.0.107])
        by smtp2.hosting90.cz with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <Jerry@jrr.cz>)
        id 1jrQh0-0005mi-DP; Fri, 03 Jul 2020 20:45:46 +0200
Subject: Re: [PATCH v4] usbserial: cp210x - icount support for parity error
 checking
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <20200621085816.GB95977@kroah.com>
 <03712b5a-ecb6-ae42-ff8e-8d5d6f2ed918@jrr.cz>
 <20200621095509.GA120230@kroah.com>
 <470484c8-7afc-c593-5ca9-cdb97dba39e1@jrr.cz>
 <20200621135838.GA125568@kroah.com>
 <7bdff86f-0988-2afc-e1a6-35df2931fd5b@jrr.cz>
 <20200622053146.GB134804@kroah.com>
 <838f09f9-4063-1c2c-8b4d-c18dee6c18de@jrr.cz>
 <20200701154257.GF3334@localhost>
 <13482d69-b286-b20e-ee3a-f8c5f12aad18@jrr.cz>
 <20200703074539.GB3453@localhost>
From:   Jerry <Jerry@jrr.cz>
Message-ID: <8a501a7f-68fa-c6a3-30aa-c941f5c2a66f@jrr.cz>
Date:   Fri, 3 Jul 2020 20:45:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 SeaMonkey/2.53.2
MIME-Version: 1.0
In-Reply-To: <20200703074539.GB3453@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Antivirus: Clamav/CLEAN
X-Scan-Signature: 9ac42a2ccaf5c48bc7e928793261b071
X-Authenticated-Id: jerry@jrr.cz
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Johan Hovold wrote on 7/3/20 9:45 AM:
> Heh, yeah, it tends to be that way. :) But thanks for the great summary
> of your findings!
>
> I think it probably makes most sense to keep the error in as it's a
> quirk of the device rather than risk missing an actual overrun.
OK
> The problem here is that we're sort of violating the API and turning
> TIOCGICOUNT into a polling interface instead of just returning our error
> and interrupt counters. This means will always undercount any errors for
> a start.
>
> The chip appears to have a mechanism for reporting errors in-band, but
> that would amount to processing every character received to look for the
> escape char, which adds overhead. I'm guessing that interface would also
> insert an overrun error when returning the first character.
Yes, it is posible to use EMBED_EVENTS and chip will insert event codes 
into stream of data bytes. But it will cost some processing power and if 
transmitted data contains ESC char it will be escaped so it will cost some 
additional bandwidth. In the worst case (all received data = ESC) it means 
double bandwidth.

I have found such solution here:
https://github.com/fortian/cp210x/blob/master/cp210x.c
but it is quite complex and I expected argument that it costs too much 
(especially when using maximum baudrate) so I suggested simple way which 
doesn't have an impact until ioctl is called.
> But perhaps that it was we should be using as it allows parity the
> errors to be reported using the normal in-band methods. If we only
> enable it when parity checking is enabled then the overhead seems
> justified.
>
> I did a quick test here and the event insertion appears to work well for
> parity errors. Didn't manage to get it to report break events yet, and
> modem-status changes are being buffered and not reported until the next
> character. But in theory we could expand the implementation to provide
> more features later.
>
> I'll see if I can cook something up quickly.

>> I suppose that GET_COMM_STATUS reads and CLEAR pending error flags (not
>> explained in datasheet but behaves that way). So if some errors are
>> reported during cp210x_tx_empty() it can be either counted immediately or
>> lost. I'm not sure if cp210x_tx_empty() is called ONLY during close but
>> seems be more consistent to count every detected error regardless who calls
>> GET_COMM_STATUS.
> tx_empty() is called when waiting for data to be drained for example
> during close but also on when changing terminal settings with TCSADRAIN
> or on tcdrain().
But losing an error during tcdrain() is definitely wrong. It is common to 
send (write) some request, then call tcdrain to be sure that whole request 
was transmitted and then receive response. Calling tcdrain is necessary in 
combination with GPIO manipulation but it can also be useful to measure 
correct timeout because I need to know that data was already transmitted to 
target (it can take long time for slow baudrate). There is no reason to 
discard error flags during such waiting.

> Correct.
>
> It's quite possible that that's missing elsewhere, but at least those
> counters are updated in completion callbacks which do not run in
> parallel unlike ioctls(), which are not serialised.
>
> Johan

Jerry


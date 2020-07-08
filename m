Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 765882191F0
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 23:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbgGHVFf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 8 Jul 2020 17:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgGHVFf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jul 2020 17:05:35 -0400
Received: from smtp2.hosting90.cz (smtp2.hosting90.cz [IPv6:2a03:b780:1:0:216:3eff:fe00:24c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37BA1C061A0B
        for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2020 14:05:34 -0700 (PDT)
Received: from [46.229.122.58] (helo=[10.10.0.107])
        by smtp2.hosting90.cz with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <Jerry@jrr.cz>)
        id 1jtHFy-000435-UK; Wed, 08 Jul 2020 23:05:31 +0200
Subject: Re: [PATCH v4] usbserial: cp210x - icount support for parity error
 checking
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <470484c8-7afc-c593-5ca9-cdb97dba39e1@jrr.cz>
 <20200621135838.GA125568@kroah.com>
 <7bdff86f-0988-2afc-e1a6-35df2931fd5b@jrr.cz>
 <20200622053146.GB134804@kroah.com>
 <838f09f9-4063-1c2c-8b4d-c18dee6c18de@jrr.cz>
 <20200701154257.GF3334@localhost>
 <13482d69-b286-b20e-ee3a-f8c5f12aad18@jrr.cz>
 <20200703074539.GB3453@localhost> <20200703150104.GE3453@localhost>
 <61febd93-400b-d1f9-6fd9-82de0e799f3e@jrr.cz>
 <20200706135904.GJ3453@localhost>
From:   Jerry <Jerry@jrr.cz>
Message-ID: <3fc7bd0e-6cf6-140c-592f-b8c69d483309@jrr.cz>
Date:   Wed, 8 Jul 2020 23:05:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 SeaMonkey/2.53.2
MIME-Version: 1.0
In-Reply-To: <20200706135904.GJ3453@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
X-Antivirus: Clamav/CLEAN
X-Scan-Signature: 08f7bf3336dc390afce6d66a498c2669
X-Authenticated-Id: jerry@jrr.cz
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Johan Hovold wrote on 7/6/20 3:59 PM:
> On Mon, Jul 06, 2020 at 01:47:50PM +0200, Jerry wrote:
>> Johan Hovold wrote on 7/3/20 5:01 PM:
>>> Also, could try and see if your device detects breaks properly? Mine
>>> just return a NUL char.
I've done some experiments with CP2102 receiving a break.
It seems that chip always receives 0x00 for the start of break (with 
correct parity when even parity set, wrong for odd parity) and later 
(probably after 250 ms) it also sets break flag in GET_COMM_STATUS.
I don't see any indication of the break event in data. I tried to change 
some things in your solution but without success.

I also haven't ever seen Frame error (neither way). I tried several ways 
(different tx/rx baudrate, receive a parity data without parity enabled, 
generating shorter breaks) and I suppose that CP2102 can't indicate framing 
error.

Luckily I haven't found any problem with parity checking.  :-)

> I noticed that I can get comm-status to report a break condition when
> event-insertion mode is disabled, but it just results in a NUL char in
> event mode (the error flag isn't set then).
>
> Perhaps buggy firmware, unless there's some other command for masking
> events. Haven't quite understood how the EVENTMASK requests are supposed
> to be used. Replacing the break char (SET_CHAR) didn't help at least.
Neither I understand EVENTMASK in AN571 but I suppose that it is used for 
W32 API WaitCommEvent() because of very similar flag list
https://docs.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-waitcommevent
maybe somebody else can explain possible usage...
>> An interesting thing that your patch don't report any overrun. I'm not able
>> to create a real overrun (any idea?) but it doesn't report any fake overrun
>> compared to GET_COMM_STATUS.
> Yeah, I noticed that too, although I had a feeling the fake overrun
> didn't even always show up when sending while closed here either.
You are right, the fake HW overrun in GET_COMM_STATUS isn't reported always 
but very often.
>
> Thanks,
> Johan

Jerry



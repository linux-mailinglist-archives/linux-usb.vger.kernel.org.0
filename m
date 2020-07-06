Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2103C2156B0
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 13:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729018AbgGFLr5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 07:47:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728933AbgGFLr4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 07:47:56 -0400
Received: from smtp2.hosting90.cz (smtp2.hosting90.cz [IPv6:2a03:b780:1:0:216:3eff:fe00:24c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52E35C08C5DF
        for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2020 04:47:55 -0700 (PDT)
Received: from [46.229.122.58] (helo=[10.10.0.107])
        by smtp2.hosting90.cz with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <Jerry@jrr.cz>)
        id 1jsPbE-0008LW-Gn; Mon, 06 Jul 2020 13:47:52 +0200
Subject: Re: [PATCH v4] usbserial: cp210x - icount support for parity error
 checking
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <03712b5a-ecb6-ae42-ff8e-8d5d6f2ed918@jrr.cz>
 <20200621095509.GA120230@kroah.com>
 <470484c8-7afc-c593-5ca9-cdb97dba39e1@jrr.cz>
 <20200621135838.GA125568@kroah.com>
 <7bdff86f-0988-2afc-e1a6-35df2931fd5b@jrr.cz>
 <20200622053146.GB134804@kroah.com>
 <838f09f9-4063-1c2c-8b4d-c18dee6c18de@jrr.cz>
 <20200701154257.GF3334@localhost>
 <13482d69-b286-b20e-ee3a-f8c5f12aad18@jrr.cz>
 <20200703074539.GB3453@localhost> <20200703150104.GE3453@localhost>
From:   Jerry <Jerry@jrr.cz>
Message-ID: <61febd93-400b-d1f9-6fd9-82de0e799f3e@jrr.cz>
Date:   Mon, 6 Jul 2020 13:47:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 SeaMonkey/2.53.2
MIME-Version: 1.0
In-Reply-To: <20200703150104.GE3453@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Antivirus: Clamav/CLEAN
X-Scan-Signature: 3a975e3ea9ca075f870a3f43e6a1e4a4
X-Authenticated-Id: jerry@jrr.cz
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Johan Hovold wrote on 7/3/20 5:01 PM:
> On Fri, Jul 03, 2020 at 09:45:39AM +0200, Johan Hovold wrote:
> Would you mind giving the below a try and see how that works in your
> setup?
>
> With this patch you'd be able to use PARMRK to be notified of any parity
> errors, but I also wired up TIOCGICOUNT if you prefer to use that.
>
> Also, could try and see if your device detects breaks properly? Mine
> just return a NUL char.
>
> Johan
>
I tried your patch. It detects the parity error correctly for my 
application. Unfortunately I'm not able currently to verify a break 
reception due to holiday, I'll probably try it next week when back at work 
(I need to recompile the device firmware).

An interesting thing that your patch don't report any overrun. I'm not able 
to create a real overrun (any idea?) but it doesn't report any fake overrun 
compared to GET_COMM_STATUS.

The question could be a value of CP210X_ESCCHAR. You selected 0xFF and this 
value can be quite common in received data because an erased flash memory 
is full of 0xFF. When I read an empty memory it means double USB bandwidth 
so for example 0xFE seems be better... but I understand that it depend on 
application and it is hard to globally select this value.

I'll do some more tests but your solution seems be fully acceptable for my 
needs. For me TIOCGICOUNT is enough (I just resend request when an error 
detected) but for other situation it would be very nice to know exactly 
which byte was malformed through PARMRK.

Jerry


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E913203D1A
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jun 2020 18:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729815AbgFVQvA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jun 2020 12:51:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729811AbgFVQvA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Jun 2020 12:51:00 -0400
Received: from smtp2.hosting90.cz (smtp2.hosting90.cz [IPv6:2a03:b780:1:0:216:3eff:fe00:24c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0CE8C061573
        for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2020 09:50:59 -0700 (PDT)
Received: from [46.229.122.58] (helo=[10.10.0.107])
        by smtp2.hosting90.cz with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <Jerry@jrr.cz>)
        id 1jnPeq-0002hJ-R6; Mon, 22 Jun 2020 18:50:57 +0200
Subject: Re: [PATCH 1/1] usbserial: cp210x - icount support for parity error
 checking
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
References: <b4cd2557-9a61-5ccd-32ad-48b0c68bef6b@jrr.cz>
 <20200621085816.GB95977@kroah.com>
 <03712b5a-ecb6-ae42-ff8e-8d5d6f2ed918@jrr.cz>
 <20200621095509.GA120230@kroah.com>
 <470484c8-7afc-c593-5ca9-cdb97dba39e1@jrr.cz>
 <20200621135838.GA125568@kroah.com>
 <c9b58c7f-e40a-0988-6b7d-15beac7219de@jrr.cz>
 <20200622053054.GA134804@kroah.com>
From:   Jerry <Jerry@jrr.cz>
Message-ID: <101f9e7e-0231-29af-fe40-e5eb8f2ea7bd@jrr.cz>
Date:   Mon, 22 Jun 2020 18:50:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 SeaMonkey/2.53.2
MIME-Version: 1.0
In-Reply-To: <20200622053054.GA134804@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Antivirus: Clamav/CLEAN
X-Scan-Signature: ddc8c852d5f6e0c6d1dc4ecdfaa5412c
X-Authenticated-Id: jerry@jrr.cz
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greg Kroah-Hartman wrote on 6/22/20 7:30 AM:
>> I tried it and it seems that www.spinics.net understand UTF-8 but at
>> marc.info it doesn't work correctly.
>> https://marc.info/?l=linux-usb&m=159279589104617
> Why care about marc.info?  We don't control that, nor do we use it.
>
> If lore.kernel.org does not work, please let us know, we can fix that.
When I subscribed to linux-usb mailing list, I received an e-mail from 
Majordomo@vger.kernel.org. And in this mail, there were only two links for 
archives:
http://marc.info/?l=linux-usb
http://www.spinics.net/lists/linux-usb/

So I supposed that these servers are officially connected with Kernel.org.

I didn't know about an existence of lore.kernel.org until now. If I post a 
message to somewhere I want to be correctly displayed to all users...
>> It seems that this page don't send correct encoding to web browser so
>> Firefox uses windows-1252 and insted of capital S with caron I can see A
>> with ring. Similarily insted of I with acute accent the browser shows A with
>> tilda... it looks horible. And even if I force UTF8 encoding for view, it
>> corrects mail From but my name at Signed-off-by line stays damaged.
>>
>> So UTF-8 seems be a bad idea for kernel mailling list.
> It should not be, again, if lore.kernel.org does not work, please let
> us know.
>
> thanks,
>
> greg k-h

Anyway, thanks a lot for your patience.
Jerry


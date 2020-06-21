Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD3232029D9
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jun 2020 11:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729599AbgFUJpP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 21 Jun 2020 05:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgFUJpP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Jun 2020 05:45:15 -0400
X-Greylist: delayed 3063 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 21 Jun 2020 02:45:15 PDT
Received: from smtp2.hosting90.cz (smtp2.hosting90.cz [IPv6:2a03:b780:1:0:216:3eff:fe00:24c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C9C1C061794
        for <linux-usb@vger.kernel.org>; Sun, 21 Jun 2020 02:45:15 -0700 (PDT)
Received: from [46.229.122.58] (helo=[10.10.0.107])
        by smtp2.hosting90.cz with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <Jerry@jrr.cz>)
        id 1jmwXJ-0002u4-7y; Sun, 21 Jun 2020 11:45:13 +0200
Subject: Re: [PATCH 1/1] usbserial: cp210x - icount support for parity error
 checking
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
References: <b4cd2557-9a61-5ccd-32ad-48b0c68bef6b@jrr.cz>
 <20200621085816.GB95977@kroah.com>
From:   Jerry <Jerry@jrr.cz>
Message-ID: <03712b5a-ecb6-ae42-ff8e-8d5d6f2ed918@jrr.cz>
Date:   Sun, 21 Jun 2020 11:45:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 SeaMonkey/2.53.2
MIME-Version: 1.0
In-Reply-To: <20200621085816.GB95977@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
X-Antivirus: Clamav/CLEAN
X-Scan-Signature: c6374a04af50a10fd93232cdab733853
X-Authenticated-Id: jerry@jrr.cz
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greg Kroah-Hartman wrote on 6/21/20 10:58 AM:
> On Sat, Jun 20, 2020 at 09:58:40PM +0200, Jerry wrote:
>> usbserial: add cp210x support for icount to detect parity error in received data
> Why is this here?
>
Because it seems be mandatory?
https://www.kernel.org/doc/html/latest/process/5.Posting.html#patch-formatting-and-changelogs

"A one-line description of what the patch does. This message should be 
enough for a reader who sees it with no other context to figure out the 
scope of the patch; it is the line that will show up in the “short form” 
changelogs. This message is usually formatted with the relevant 
subsystem name first, followed by the purpose of the patch. For example:
gpio: fix build on CONFIG_GPIO_SYSFS=n"

Did I misunderstand your rule or used wrong name of subsystem? Should I 
type?
USB serial: add cp210x support for icount to detect parity error in 
received data

>> Motivation - current version of cp210x driver doesn't provide any way to detect
>> a parity error in received data from userspace. Some serial protocols like STM32
>> bootloader protect data only by even parity so application needs to detect
>> whether parity error happened to read again peripheral data.
>>
>> I created a simple patch which adds support for icount (ioctl TIOCGICOUNT) which
>> sends GET_COMM_STATUS command to CP210X and according received flags increments
>> fields for parity error, frame error, break and overrun.
>> So application can detect an error condition after reading data from ttyUSB
>> and repeat operation. There is no impact for applications which don't
>> call ioctl TIOCGICOUNT.
>> This patch is also placed at http://yyy.jrr.cz/cp210x.patch (my first patch)
> Please read the section entitled "The canonical patch format" in the
> kernel file, Documentation/SubmittingPatches for what is needed in order
> to properly describe the change.
I read it, but still not sure what exactly was wrong? Yes, I wrapped lines
of description to 80 colums and now I noticed that only 75 columns is
allowed but I doubt that it is all?
Sorry for my bad English, it is hard to guess whether you see a problem 
in function of patch, patch formatting, tab/spaces, description content, 
spelling, line wrapping, mail client identification, something else or 
all of them?
>> Signed-off-by: Jaromir Skorpil <Jerry@jrr.cz>
> This does not match your From: line :(
I supposed that only mail address in From line matter?
I understand that real name is mandatory only for Signed-off-by field?
>
> thanks,
>
> greg k-h
Jerry



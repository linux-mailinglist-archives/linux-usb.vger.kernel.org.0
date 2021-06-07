Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B07CA39E00F
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 17:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbhFGPSZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 11:18:25 -0400
Received: from mail.palosanto.com ([181.39.87.190]:47082 "EHLO palosanto.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230212AbhFGPSZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Jun 2021 11:18:25 -0400
Received: from localhost (mail.palosanto.com [127.0.0.1])
        by palosanto.com (Postfix) with ESMTP id 8450513C19E2;
        Mon,  7 Jun 2021 10:16:30 -0500 (-05)
X-Virus-Scanned: Debian amavisd-new at mail.palosanto.com
Received: from palosanto.com ([127.0.0.1])
        by localhost (mail.palosanto.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id VYufB_82ZZfU; Mon,  7 Jun 2021 10:16:28 -0500 (-05)
Received: from [192.168.0.2] (unknown [191.99.2.15])
        by palosanto.com (Postfix) with ESMTPSA id F00B313C19DC;
        Mon,  7 Jun 2021 10:16:27 -0500 (-05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=palosanto.com;
        s=mail; t=1623078988;
        bh=jHkUR74YMEa/TvS8gf5nMWM7GbWjVUo41DZQYmgcLOM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=SbzTQe/aw1FAI6eoLf124wEQvLMVJO8F/pH/IRYWVRjO5A8bDvmZNYy+DU3ac0hlm
         0iYnZ0okkfmd9Vq/F8WrH40Dy3BBbFsQY7tVz5VN2jURzvAIsHjFq8Dt14stt3bf2o
         ZEjgWv0RsSF3abtVDMRyvw3+1TKkFiH47Xa53wdE=
Subject: Re: cp210x module broken in 5.12.5 and 5.12.6, works in 5.11.21 (with
 bisection)
To:     Johan Hovold <johan@kernel.org>, David Frey <dpfrey@gmail.com>
Cc:     linux-usb@vger.kernel.org, Pho Tran <pho.tran@silabs.com>,
        Tung Pham <tung.pham@silabs.com>, Hung.Nguyen@silabs.com
References: <465ef3ac-4291-6392-e52b-26cc0c34dd7c@palosanto.com>
 <YLXmrmW9/fB1WbzR@hovoldconsulting.com>
 <2881bd97-f790-c4d6-aed6-de9ab8cd1a9e@palosanto.com>
 <YLZVAmYxFZ1Q/nrH@hovoldconsulting.com>
 <60705932-860a-701c-1019-16f9e16c39dd@palosanto.com>
 <YLeapcNbvExeGKuE@hovoldconsulting.com>
 <cb99a25e-5758-051c-afb6-29d8ef26ee0b@palosanto.com>
 <YLpJzTmAnfsrE7UP@hovoldconsulting.com>
 <CAAvkfd-vmi_VJrCQg-ktF+sZZUfb5J+DJfjHv=TdVafyj1m1Ew@mail.gmail.com>
 <YLtOL5aZUnntfqWB@hovoldconsulting.com>
From:   =?UTF-8?Q?Alex_Villac=c3=ads_Lasso?= <a_villacis@palosanto.com>
Message-ID: <7b8c5109-3654-7e65-0b94-f6b861ff78f5@palosanto.com>
Date:   Mon, 7 Jun 2021 10:16:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YLtOL5aZUnntfqWB@hovoldconsulting.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

El 5/6/21 a las 05:13, Johan Hovold escribió:
> On Fri, Jun 04, 2021 at 04:16:26PM -0700, David Frey wrote:
>> I'm not sure if this matters, but I have been told that the failing
>> boards have CP2102N chips with"A01" firmware.  I tried to install
>> SIlicon Labs Simplicity Studio on Windows because I read that it would
>> be able to identify the firmware version of the device, but I couldn't
>> actually figure out how to find the information. If someone can tell
>> me a way to get the firmware version, I can check to see if it's
>> different between the device that does exhibit this failure and the
>> one that doesn't.
> That is definitely worth pursuing. The A01 is apparently EOLed and
> there's a later A02 and possibly even A03:
>
> 	https://www.silabs.com/community/interface/knowledge-base.entry.html/2020/03/31/how_to_determinecp2102nrevisiona01vsa02-DCJI
>
> That page refers to that vendor tool "Simplicity Studio" as well as a
> Windows library described by
>
> 	https://www.silabs.com/documents/public/application-notes/AN978-cp210x-usb-to-uart-api-specification.pdf
>
> that can be used to read out the firmware version on CP2102N and CP2108
> (three bytes). We just need to figure out which vendor request the
> library (and tool) uses and we could key off of this in the driver if
> this turns out to be related to the firmware revision.

I modified the patch that added cp210x_dump_props() function, to dump 
the raw buffer received using the print_hex_dump() kernel function. For 
my device, I get this output:

jun 07 10:00:51 karlalex-asus kernel: cp210x propdata: 00000000: 42 00 
00 01 01 00 00 00 00 00 00 00 80 02 00 00  B...............
jun 07 10:00:51 karlalex-asus kernel: cp210x propdata: 00000010: 80 02 
00 00 c0 c6 2d 10 01 00 00 00 3f 01 00 00  ......-.....?...
jun 07 10:00:51 karlalex-asus kernel: cp210x propdata: 00000020: 7f 00 
00 00 ff ff 07 10 0f 00 07 1f 80 02 00 00  ................
jun 07 10:00:51 karlalex-asus kernel: cp210x propdata: 00000030: 80 02 
00 00 00 00 00 00 00 00 00 00 33 00 2e 00  ............3...
jun 07 10:00:51 karlalex-asus kernel: cp210x propdata: 00000040: 30 
00                                            0.
jun 07 10:00:51 karlalex-asus kernel: cp210x ttyUSB0: wLength = 66
jun 07 10:00:51 karlalex-asus kernel: cp210x ttyUSB0: ulMaxTxQueue = 640
jun 07 10:00:51 karlalex-asus kernel: cp210x ttyUSB0: ulMaxRxQueue = 640
jun 07 10:00:51 karlalex-asus kernel: cp210x ttyUSB0: ulProvSubType = 1
jun 07 10:00:51 karlalex-asus kernel: cp210x ttyUSB0: ulProvCapabilities 
= 0x13f
jun 07 10:00:51 karlalex-asus kernel: cp210x ttyUSB0: ulSettableParams = 
0x7f
jun 07 10:00:51 karlalex-asus kernel: cp210x ttyUSB0: ulCurrentTx-Queue 
= 640
jun 07 10:00:51 karlalex-asus kernel: cp210x ttyUSB0: ulCurrentRx-Queue 
= 640

According to the datasheet at 
https://www.silabs.com/documents/public/application-notes/AN571.pdf , 
the data at offset 60 should be an Unicode string containing the device 
vendor, with the last 3 characters denoting the version. The datasheet 
gives an example of "SILABS USB Vx.y". However, my actual output decodes 
to just "3.0". Is this enough for a blacklisting decision?


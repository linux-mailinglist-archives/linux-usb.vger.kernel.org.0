Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD84F39EA68
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jun 2021 01:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbhFGXwE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 19:52:04 -0400
Received: from mail.palosanto.com ([181.39.87.190]:34392 "EHLO palosanto.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230209AbhFGXwE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Jun 2021 19:52:04 -0400
Received: from localhost (mail.palosanto.com [127.0.0.1])
        by palosanto.com (Postfix) with ESMTP id 01ECB13C1BC4;
        Mon,  7 Jun 2021 18:50:09 -0500 (-05)
X-Virus-Scanned: Debian amavisd-new at mail.palosanto.com
Received: from palosanto.com ([127.0.0.1])
        by localhost (mail.palosanto.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7H-5nJ4S9NZS; Mon,  7 Jun 2021 18:50:05 -0500 (-05)
Received: from [192.168.0.2] (unknown [191.99.2.15])
        by palosanto.com (Postfix) with ESMTPSA id C924513C175B;
        Mon,  7 Jun 2021 18:50:03 -0500 (-05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=palosanto.com;
        s=mail; t=1623109805;
        bh=KItwyjvh+YCdp8ElncY8DXbsSIpx+c/+xQL0vqEMikM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ESlVytpTKbzhWdcv6WvuFx/3tERKambYZZLDWfoScI3gm7dMRAosU1uu/OBbc5KhM
         HkKMt7kqf115S/CdWBCBDk7PCUb0hWsHbJC0B2Sb1BiKdPXBf6IkuuvVgI2gXxQlSc
         djFvS3nKjuIZ0HO5pRhnT9uLVKDT7+NS9cA3FXHQ=
Subject: Re: cp210x module broken in 5.12.5 and 5.12.6, works in 5.11.21 (with
 bisection)
To:     David Frey <dpfrey@gmail.com>, Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Pho Tran <pho.tran@silabs.com>,
        Tung Pham <tung.pham@silabs.com>, Hung.Nguyen@silabs.com
References: <YLXmrmW9/fB1WbzR@hovoldconsulting.com>
 <2881bd97-f790-c4d6-aed6-de9ab8cd1a9e@palosanto.com>
 <YLZVAmYxFZ1Q/nrH@hovoldconsulting.com>
 <60705932-860a-701c-1019-16f9e16c39dd@palosanto.com>
 <YLeapcNbvExeGKuE@hovoldconsulting.com>
 <cb99a25e-5758-051c-afb6-29d8ef26ee0b@palosanto.com>
 <YLpJzTmAnfsrE7UP@hovoldconsulting.com>
 <CAAvkfd-vmi_VJrCQg-ktF+sZZUfb5J+DJfjHv=TdVafyj1m1Ew@mail.gmail.com>
 <YLtOL5aZUnntfqWB@hovoldconsulting.com>
 <CAAvkfd-o+g2_uc-HqK8svrU_E3NB1m03md8J_F_eTc8pDkXmdQ@mail.gmail.com>
 <YL5O6/GrlnpNwGjT@hovoldconsulting.com>
 <CAAvkfd91cdQ-6RwGErJuBTwQh9=8cajbngcOgjsThnFruz27DQ@mail.gmail.com>
 <CAAvkfd-mnb-g_ANwXeMn03rDfOSJrFkCREtPMGB=KZOUDg4gKg@mail.gmail.com>
From:   =?UTF-8?Q?Alex_Villac=c3=ads_Lasso?= <a_villacis@palosanto.com>
Message-ID: <9f7e4dac-dc1c-2011-2ddd-5debd32539fb@palosanto.com>
Date:   Mon, 7 Jun 2021 18:50:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAAvkfd-mnb-g_ANwXeMn03rDfOSJrFkCREtPMGB=KZOUDg4gKg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

El 7/6/21 a las 15:44, David Frey escribió:
> On Mon, Jun 7, 2021 at 11:02 AM David Frey <dpfrey@gmail.com> wrote:
>> I made a bit of progress.  I found that CP210xManufacturing.dll was
>> bundled with Simplicity Studio and in the same folder as the DLL was
>> inspect_usbxpress.exe.  It looks like that tool is able to report the
>> firmware version of the device.  In the output below, the first run is
>> against the device that I am able to program successfully on any
>> kernel and that shows firmware 1.0.6.  The second run is against a
>> device that I can't program and it shows firmware version 1.0.4.  I
>> recall reading some information that 1.0.6 is A02 and that 1.0.4 is
>> A01, but I think there might have been another firmware revision
>> that's also A01 (maybe 1.0.2?).  I can't find the source of this
>> information anymore.  I'm going to try to figure out how to use
>> wireshark to capture USB traffic now.
>>
>> C:\SiliconLabs\SimplicityStudio\v5\developer\adapter_packs\inspect_usbxpress>.\inspect_usbxpress.exe
>> -slist
>> serial_no =
>> deviceCount = 1
>> device (0) {
>>    SoftIndex = 0
>>    adapterLabel = CP2102N USB to UART Bridge Controller (ID:0)
>>    SerialNo = 1017bfe99d98e8118ea47540c3e5cfbd
>>    Vid = 0
>>    Pid = 0
>>    PartNumber = 32
>>    BoardID =
>>    BoardCount = 0
>>    FirmwareVersion = 1.0.6
>>    Name = cp2102N version 1.0.6
>>    Type = CP210x
>>    Family = USBXpress
>>    Locked = 1
>> }
>>
>> C:\SiliconLabs\SimplicityStudio\v5\developer\adapter_packs\inspect_usbxpress>.\inspect_usbxpress.exe
>> -slist
>> serial_no =
>> deviceCount = 1
>> device (0) {
>>    SoftIndex = 0
>>    adapterLabel = CP2102N USB to UART Bridge Controller (ID:0)
>>    SerialNo = f06e721e74e1ea11bd9ddc2d9a583cc7
>>    Vid = 0
>>    Pid = 0
>>    PartNumber = 32
>>    BoardID =
>>    BoardCount = 0
>>    FirmwareVersion = 1.0.4
>>    Name = cp2102N version 1.0.4
>>    Type = CP210x
>>    Family = USBXpress
>>    Locked = 1
>> }
> I configured wireshark on Windows to capture the USB traffic and I ran
> the inspect_usbxpress.exe.  I believe the request/response where the
> firmware version is provided is in packets 38/39 in the attached
> trace.  Perhaps the mailing list will strip the trace, so I will
> describe it a bit.
>
> Setup packet:
>    bmRequestType: 0xC0 (device-to-host, vendor, device recipient)
>    bRequest: 255
>    wValue: 0x0010
>    wIndex: 0
>    wLength: 3
>
> Response Data: {0x01, 0x00, 0x04}
>
> When I captured the trace for the other device, the response data was
> {0x01, 0x00, 0x06} indicating firmware version 1.0.6.
>
> Let me know if there is any other information I can provide.

Yes! This is exactly the information required to query the firmware. Now 
a patch should be made that calls cp210x_read_vendor_block(), which 
internally uses CP210X_VENDOR_SPECIFIC (0xFF) with a #define 
CP210X_READ_FIRMWARE_VER    0x0010, and a 3-byte buffer that will 
contain the firmware version. Then the driver will refrain from 
programming the XON/XOFF limits if the firmware version is not the fixed 
one.


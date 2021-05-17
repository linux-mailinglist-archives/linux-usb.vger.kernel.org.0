Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDC2F382332
	for <lists+linux-usb@lfdr.de>; Mon, 17 May 2021 05:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232040AbhEQD7S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 May 2021 23:59:18 -0400
Received: from smtp3.avnet.com ([12.9.139.123]:10184 "EHLO smtp3.avnet.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229910AbhEQD7R (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 16 May 2021 23:59:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Avnet.com;
        s=20201119; t=1621223881;
        bh=nBJimvkochhb2g3luLojcXPAuIF/zW8vpl0WV/oarlQ=;
        h=From:To:Subject:Date:References:In-Reply-To;
        b=SZI5RnXbcf1iuGlb+asj7JXOeEw/UXTFDoqdRxhUgj0AQ6pauq99RxNJzsOlNKalS
         D/Lci+cfvzl7v9oGAx0ok3L3hhzC3tmQCnw1Wdt+BlAdYpMWGWSQ2XDTaIew7GsH9F
         662ciKrNBqbUXaYqRNVI7yYIQ57KQfOYfWGHwAoXGJY70vOxBYFmjF6OPkyvUewCxn
         z6xf41WhqRA5HzwTyQq5qCq0o2C7OhvFImZN4WF6d/oJftwK1VkI9YhRcoNllLQy/D
         M9z90e4jYXsf1ennTFn4tniXf4z7vpYbQ0ypokTGxUj15IC+taRCFZ+Z/Ffm8Wyc5T
         n9PuqXH/ChNCQ==
Received: from CMX2401EX1604.AVNET.COM (Not Verified[172.16.125.26]) by smtp3.avnet.com with Trustwave SEG (v8,2,6,11305) (using TLS: TLSv1.2, AES256-GCM-SHA384)
        id <B60a1e9c90000>; Sun, 16 May 2021 20:58:01 -0700
Received: from CMX2401EX1604.AVNET.COM (172.16.125.26) by
 CMX2401EX1604.AVNET.COM (172.16.125.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Sun, 16 May 2021 20:58:01 -0700
Received: from CMX2401EX1604.AVNET.COM ([fe80::3838:ad6:3b52:4f83]) by
 CMX2401EX1604.AVNET.COM ([fe80::3838:ad6:3b52:4f83%2]) with mapi id
 15.01.2242.008; Sun, 16 May 2021 20:58:01 -0700
From:   "Chow, Watson" <Watson.Chow@Avnet.com>
To:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [BUG REPORT] usb: dwc3: Bug while setting the USB transfer
 bandwidth on UVC gadget driver
Thread-Topic: [BUG REPORT] usb: dwc3: Bug while setting the USB transfer
 bandwidth on UVC gadget driver
Thread-Index: AddIcAtgBDXAgCQbQXSu/5dHZ1drkQAW67SAAA5jNfD//8N/AP/8MtWA
Date:   Mon, 17 May 2021 03:58:01 +0000
Message-ID: <9e8d9a55a0e64ab092ceb464db5f0119@Avnet.com>
References: <6bc8ab9c4e3f4bafae13a7574b1ae0e3@Avnet.com>
 <87r1i97pkk.fsf@kernel.org> <4c354460a55e40c9938a1fdedfa62144@Avnet.com>
 <878s4h7giv.fsf@kernel.org>
In-Reply-To: <878s4h7giv.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.125.136]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=QMUWuTDL c=1 sm=1 tr=0 a=lcmS3RsgbsgHW2lJplWpEQ==:117 a=xqWC_Br6kY4A:10 a=6yu5SQbkyS8A:10 a=kj9zAlcOel0A:10 a=5FLXtPjwQuUA:10 a=npiypiU9AAAA:8 a=VwQbUJbxAAAA:8 a=nUQWEdk1IH_wDgyZA0MA:9 a=CjuIK1q_8ugA:10 a=U5QfeDdlIO9jQLzCQbpp:22 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

>Hi,
>
>(please don't top-post :-)
I have tried my best to meet the format requirement

>
>"Chow, Watson" <Watson.Chow@Avnet.com> writes:
>> Balbi,
>>
>> Thanks for your quick reply.
>>
>> Some questions
>>
>> 1. You mentioned that the max bandwidth in isoc mode (USB3.0) should be=
=20
>> around 4Gbps. =20
>>
>> I have the below calcuation on bandwidth:
>> In USB3.0, 1 micro frame would take 125us and can transfer max 45000 byt=
es
>> So, in 1 sec, we will have 8000 micro frames
>>
>> Max bandwidth =3D 8000 x 4500 x 8 =3D 2.88Gbps
>>
>> Is my understanding correct?
>
>probably, It's been a while since I've dug through the spec, to be frank
>
>> 2. To achieve the max throughput, I need to configure the uvc gadget dri=
ver=20
>> with below parameters. Am I right?
>>
>> # modprobe g_webcam streaming_maxpacket=3D3072 streaming_maxburst=3D15=20
>> streaming_interval=3D1
>
>right, but there's an assumption here that the gadget will be able to
>feed data in a timely manner.
How does the DWC3 driver or the gadget driver handle the case with intermit=
tent
drop of the input video streaming?

Any recover mechanism?

>
>> 3. You suggest me to try on kernel v5.12 or the latest v5.13-rc. It look=
s not
>> easy in my side to upgrade the kernel version. It would affect those oth=
er=20
>> device drivers I'm currently using. So, do you think there's any short c=
ut=20
>> to fix this problem under my current kernel version - v5.4?
>
>In that case, you need to ask for support from whoever forces you to
>stay with such an old kernel. I believe that would be Xilinx.

I have a thought to back port those changes around the dwc3 and gadget driv=
er
from the latest kernel version to my kernel (v5.4). Do you think this is=20
feasible?

>
>> 4. I read through the procedures to capture debug info by debugfs. Howev=
er,
>> in my test with "streaming_maxburst" set to 10 or above, my system would=
=20
>> crash and I can't pick the log from that point. Any suggestion?
>
>have a look at ftrace_dump_on_oops.

I will explore how to enable this

>

Btw, do you know which SoC platform can run the UVC gadget in max throughpu=
t.
Raspberry Pi/TI Beaglebone/i.MX ???


best regards,

Watson
-----Original Message-----
From: Felipe Balbi <balbi@kernel.org>=20
Sent: Friday, May 14, 2021 6:32 PM
To: Chow, Watson <Watson.Chow@Avnet.com>; linux-usb@vger.kernel.org
Subject: RE: [BUG REPORT] usb: dwc3: Bug while setting the USB transfer ban=
dwidth on UVC gadget driver


Hi,

(please don't top-post :-)

"Chow, Watson" <Watson.Chow@Avnet.com> writes:
> Balbi,
>
> Thanks for your quick reply.
>
> Some questions
>
> 1. You mentioned that the max bandwidth in isoc mode (USB3.0) should be=20
> around 4Gbps. =20
>
> I have the below calcuation on bandwidth:
> In USB3.0, 1 micro frame would take 125us and can transfer max 45000 byte=
s
> So, in 1 sec, we will have 8000 micro frames
>
> Max bandwidth =3D 8000 x 4500 x 8 =3D 2.88Gbps
>
> Is my understanding correct?

probably, It's been a while since I've dug through the spec, to be frank

> 2. To achieve the max throughput, I need to configure the uvc gadget driv=
er=20
> with below parameters. Am I right?
>
> # modprobe g_webcam streaming_maxpacket=3D3072 streaming_maxburst=3D15=20
> streaming_interval=3D1

right, but there's an assumption here that the gadget will be able to
feed data in a timely manner.

> 3. You suggest me to try on kernel v5.12 or the latest v5.13-rc. It looks=
 not
> easy in my side to upgrade the kernel version. It would affect those othe=
r=20
> device drivers I'm currently using. So, do you think there's any short cu=
t=20
> to fix this problem under my current kernel version - v5.4?

In that case, you need to ask for support from whoever forces you to
stay with such an old kernel. I believe that would be Xilinx.

> 4. I read through the procedures to capture debug info by debugfs. Howeve=
r,
> in my test with "streaming_maxburst" set to 10 or above, my system would=
=20
> crash and I can't pick the log from that point. Any suggestion?

have a look at ftrace_dump_on_oops.

--=20
balbi

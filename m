Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96E3439B09A
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jun 2021 04:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbhFDCzG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Jun 2021 22:55:06 -0400
Received: from smtp2.avnet.com ([12.9.139.122]:7240 "EHLO smtp2.avnet.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229576AbhFDCzG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Jun 2021 22:55:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Avnet.com;
        s=20201119; t=1622775200;
        bh=wW/G5bDXRto/12EonndkpExkdEAg4xXxovPlmOCOOWo=;
        h=From:To:Subject:Date:References:In-Reply-To;
        b=Zph27ek6iYMZLKQlPJEmQtrdEXkfbYVmtxxMsvsL/P7jZomf8BmGsAy7JfLwJ26jv
         YF5k80mpHCDh+Nu2S5WEkANegyjiIdGMoFi1XA9S3es4N3tubImiQM/oLal7GjCpc1
         XOPd6PcumM7iR4izyOVMw8Wfn+63foQqPsZkyZ5x1dlpbe3dfhraxcXmI0Jz0tNQm9
         nPAOjKLY5EGV/k3xjdK1nQTuBo157e176woC7YBRise0AF/Lj2/C6rAbTQ8tSR+Mls
         KeGsH8f7x5rlcAmbZoYbr/T85kUhGmPuOHVaYznz6nLeqql0YJ5jNaPpfp1T8sADLd
         eI90FSnPzMNmQ==
Received: from CMX2401EX1603.AVNET.COM (Not Verified[172.16.125.20]) by smtp2.avnet.com with Trustwave SEG (v8,2,6,11305) (using TLS: TLSv1.2, AES256-GCM-SHA384)
        id <B60b995a00000>; Thu, 03 Jun 2021 19:53:20 -0700
Received: from CMX2401EX1604.AVNET.COM (172.16.125.26) by
 CMX2401EX1603.AVNET.COM (172.16.125.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 3 Jun 2021 19:53:19 -0700
Received: from CMX2401EX1604.AVNET.COM ([fe80::3838:ad6:3b52:4f83]) by
 CMX2401EX1604.AVNET.COM ([fe80::3838:ad6:3b52:4f83%2]) with mapi id
 15.01.2242.010; Thu, 3 Jun 2021 19:53:19 -0700
From:   "Chow, Watson" <Watson.Chow@Avnet.com>
To:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [BUG REPORT] usb: dwc3: Bug while setting the USB transfer
 bandwidth on UVC gadget driver
Thread-Topic: [BUG REPORT] usb: dwc3: Bug while setting the USB transfer
 bandwidth on UVC gadget driver
Thread-Index: AddIcAtgBDXAgCQbQXSu/5dHZ1drkQAW67SAAA5jNfD//8N/AP/8MtWAgAgwaoD/5FguwA==
Date:   Fri, 4 Jun 2021 02:53:19 +0000
Message-ID: <c64f050b25d445ec8342ac25f7a563a4@Avnet.com>
References: <6bc8ab9c4e3f4bafae13a7574b1ae0e3@Avnet.com>
 <87r1i97pkk.fsf@kernel.org> <4c354460a55e40c9938a1fdedfa62144@Avnet.com>
 <878s4h7giv.fsf@kernel.org> <9e8d9a55a0e64ab092ceb464db5f0119@Avnet.com>
 <87zgwu53jc.fsf@kernel.org>
In-Reply-To: <87zgwu53jc.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.125.136]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=LIwYv6e9 c=1 sm=1 tr=0 a=BRTLx2zjy18DyBo5AQlLyQ==:117 a=xqWC_Br6kY4A:10 a=6yu5SQbkyS8A:10 a=kj9zAlcOel0A:10 a=r6YtysWOX24A:10 a=npiypiU9AAAA:8 a=VwQbUJbxAAAA:8 a=kEhazIR3kBDXvws1YbIA:9 a=CjuIK1q_8ugA:10 a=U5QfeDdlIO9jQLzCQbpp:22 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Balbi,

>Hi,
>
>"Chow, Watson" <Watson.Chow@Avnet.com> writes:
>> Hi,
>>
>>>Hi,
>>>
>>>(please don't top-post :-)
>> I have tried my best to meet the format requirement
>
>Thanks
>
>>>"Chow, Watson" <Watson.Chow@Avnet.com> writes:
>>>> Balbi,
>>>>
>>>> Thanks for your quick reply.
>>>>
>>>> Some questions
>>>>
>>>> 1. You mentioned that the max bandwidth in isoc mode (USB3.0) should b=
e=20
>>>> around 4Gbps. =20
>>>>
>>>> I have the below calcuation on bandwidth:
>>>> In USB3.0, 1 micro frame would take 125us and can transfer max 45000 b=
ytes
>>>> So, in 1 sec, we will have 8000 micro frames
>>>>
>>>> Max bandwidth =3D 8000 x 4500 x 8 =3D 2.88Gbps
>>>>
>>>> Is my understanding correct?
>>>
>>>probably, It's been a while since I've dug through the spec, to be frank
>>>
>>>> 2. To achieve the max throughput, I need to configure the uvc gadget d=
river=20
>>>> with below parameters. Am I right?
>>>>
>>>> # modprobe g_webcam streaming_maxpacket=3D3072 streaming_maxburst=3D15=
=20
>>>> streaming_interval=3D1
>>>
>>>right, but there's an assumption here that the gadget will be able to
>>>feed data in a timely manner.
>>
>> How does the DWC3 driver or the gadget driver handle the case with inter=
mittent
>> drop of the input video streaming?
>>
>> Any recover mechanism?
>
>yeah, the missed ISOC is reported to the gadget driver and that has to
>queue new requests.
>
>>>> 3. You suggest me to try on kernel v5.12 or the latest v5.13-rc. It lo=
oks not
>>>> easy in my side to upgrade the kernel version. It would affect those o=
ther=20
>>>> device drivers I'm currently using. So, do you think there's any short=
 cut=20
>>>> to fix this problem under my current kernel version - v5.4?
>>>
>>>In that case, you need to ask for support from whoever forces you to
>>>stay with such an old kernel. I believe that would be Xilinx.
>>
>> I have a thought to back port those changes around the dwc3 and gadget d=
river
>> from the latest kernel version to my kernel (v5.4). Do you think this is=
=20
>> feasible?
>
>should be, but it's likely quite a bit of work:
>
>$ git rev-list --count v5.4..linus/master -- drivers/usb/dwc3/
>257
>

Upgraded the kernel version to 5.9, I can set the g_webcam module pararmete=
rs
as follow (for max bandwidth):

streaming_maxpacket=3D3072
streaming_maxburst=3D15
streaming_interval=3D1

Data transfer with above setting is working now - tested with dummy data
generator in the uvc-gadget app.

This concludes that kernel 5.4 is too old for DWC3 and UVC gadget driver
in high bandwidth usage


>>>> 4. I read through the procedures to capture debug info by debugfs. How=
ever,
>>>> in my test with "streaming_maxburst" set to 10 or above, my system wou=
ld=20
>>>> crash and I can't pick the log from that point. Any suggestion?
>>>
>>>have a look at ftrace_dump_on_oops.
>>
>> I will explore how to enable this
>>
>>>
>>
>> Btw, do you know which SoC platform can run the UVC gadget in max throug=
hput.
>> Raspberry Pi/TI Beaglebone/i.MX ???
>
>Raspberry Pi uses dwc2
>Beaglebone uses musb
>i.MX, I think some of them use dwc3 at least.
>

Watson

-----Original Message-----
From: Felipe Balbi <balbi@kernel.org>=20
Sent: Monday, May 17, 2021 1:32 PM
To: Chow, Watson <Watson.Chow@Avnet.com>; linux-usb@vger.kernel.org
Subject: RE: [BUG REPORT] usb: dwc3: Bug while setting the USB transfer ban=
dwidth on UVC gadget driver


Hi,

"Chow, Watson" <Watson.Chow@Avnet.com> writes:
> Hi,
>
>>Hi,
>>
>>(please don't top-post :-)
> I have tried my best to meet the format requirement

Thanks

>>"Chow, Watson" <Watson.Chow@Avnet.com> writes:
>>> Balbi,
>>>
>>> Thanks for your quick reply.
>>>
>>> Some questions
>>>
>>> 1. You mentioned that the max bandwidth in isoc mode (USB3.0) should be=
=20
>>> around 4Gbps. =20
>>>
>>> I have the below calcuation on bandwidth:
>>> In USB3.0, 1 micro frame would take 125us and can transfer max 45000 by=
tes
>>> So, in 1 sec, we will have 8000 micro frames
>>>
>>> Max bandwidth =3D 8000 x 4500 x 8 =3D 2.88Gbps
>>>
>>> Is my understanding correct?
>>
>>probably, It's been a while since I've dug through the spec, to be frank
>>
>>> 2. To achieve the max throughput, I need to configure the uvc gadget dr=
iver=20
>>> with below parameters. Am I right?
>>>
>>> # modprobe g_webcam streaming_maxpacket=3D3072 streaming_maxburst=3D15=
=20
>>> streaming_interval=3D1
>>
>>right, but there's an assumption here that the gadget will be able to
>>feed data in a timely manner.
>
> How does the DWC3 driver or the gadget driver handle the case with interm=
ittent
> drop of the input video streaming?
>
> Any recover mechanism?

yeah, the missed ISOC is reported to the gadget driver and that has to
queue new requests.

>>> 3. You suggest me to try on kernel v5.12 or the latest v5.13-rc. It loo=
ks not
>>> easy in my side to upgrade the kernel version. It would affect those ot=
her=20
>>> device drivers I'm currently using. So, do you think there's any short =
cut=20
>>> to fix this problem under my current kernel version - v5.4?
>>
>>In that case, you need to ask for support from whoever forces you to
>>stay with such an old kernel. I believe that would be Xilinx.
>
> I have a thought to back port those changes around the dwc3 and gadget dr=
iver
> from the latest kernel version to my kernel (v5.4). Do you think this is=
=20
> feasible?

should be, but it's likely quite a bit of work:

$ git rev-list --count v5.4..linus/master -- drivers/usb/dwc3/
257

>>> 4. I read through the procedures to capture debug info by debugfs. Howe=
ver,
>>> in my test with "streaming_maxburst" set to 10 or above, my system woul=
d=20
>>> crash and I can't pick the log from that point. Any suggestion?
>>
>>have a look at ftrace_dump_on_oops.
>
> I will explore how to enable this
>
>>
>
> Btw, do you know which SoC platform can run the UVC gadget in max through=
put.
> Raspberry Pi/TI Beaglebone/i.MX ???

Raspberry Pi uses dwc2
Beaglebone uses musb
i.MX, I think some of them use dwc3 at least.

--=20
balbi

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2362A39DB3B
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 13:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbhFGL2e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 07:28:34 -0400
Received: from smtp2.avnet.com ([12.9.139.122]:9100 "EHLO smtp2.avnet.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231202AbhFGL2d (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Jun 2021 07:28:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Avnet.com;
        s=20201119; t=1623065200;
        bh=AalfpGWFtbz8jI+P+HhDaw+Q0Bct2P9gGXFIOiWDVeo=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=LywGLzen+gs4OPkM4dtYXMoL93f55pNe2vsX1SO8Cltlb+75Ag7B8p9LGmO+MOx38
         Zuhi7MmgLBFezdt5HQCM4EKxgecLmBifQ8yCEOWpxMqTeY4oeN8xiNWym4P5XBvKqs
         Jyk5XHefGKU+EKGZ0bFp+IN4I/Acz8L7v8JCAjbb43TkEHjdaOkpceF7eRccmFl5SM
         hG0ztbKfkRBF//FVKwA1YLGSzJ/g0o3asOGUyjgdWOuwIsM/9YGhlFNU/diT9BjYRN
         rDM1aAv9UzS0vHnM+/Gnv+092muYYZa08mNVSn5wMjeMROm/yrPEJyL9ovqxFzzO04
         DKRJNSir9b0Bw==
Received: from CMX2401EX1603.AVNET.COM (Not Verified[172.16.125.20]) by smtp2.avnet.com with Trustwave SEG (v8,2,6,11305) (using TLS: TLSv1.2, AES256-GCM-SHA384)
        id <B60be02700003>; Mon, 07 Jun 2021 04:26:40 -0700
Received: from CMX2401EX1604.AVNET.COM (172.16.125.26) by
 CMX2401EX1603.AVNET.COM (172.16.125.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 7 Jun 2021 04:26:40 -0700
Received: from CMX2401EX1604.AVNET.COM ([fe80::3838:ad6:3b52:4f83]) by
 CMX2401EX1604.AVNET.COM ([fe80::3838:ad6:3b52:4f83%2]) with mapi id
 15.01.2242.010; Mon, 7 Jun 2021 04:26:40 -0700
From:   "Chow, Watson" <Watson.Chow@Avnet.com>
To:     Peter Chen <peter.chen@kernel.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [BUG REPORT] usb: dwc3: Bug while setting the USB transfer
 bandwidth on UVC gadget driver
Thread-Topic: [BUG REPORT] usb: dwc3: Bug while setting the USB transfer
 bandwidth on UVC gadget driver
Thread-Index: AddIcAtgBDXAgCQbQXSu/5dHZ1drkQAW67SAAA5jNfD//8N/AP/8MtWAgAgwaoD/5FguwIA8s7cAgAAdWVA=
Date:   Mon, 7 Jun 2021 11:26:40 +0000
Message-ID: <d53e8f8bb4c14127aa961037482b1d04@Avnet.com>
References: <6bc8ab9c4e3f4bafae13a7574b1ae0e3@Avnet.com>
 <87r1i97pkk.fsf@kernel.org> <4c354460a55e40c9938a1fdedfa62144@Avnet.com>
 <878s4h7giv.fsf@kernel.org> <9e8d9a55a0e64ab092ceb464db5f0119@Avnet.com>
 <87zgwu53jc.fsf@kernel.org> <c64f050b25d445ec8342ac25f7a563a4@Avnet.com>
 <20210607061116.GA25386@nchen>
In-Reply-To: <20210607061116.GA25386@nchen>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.125.136]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=LIwYv6e9 c=1 sm=1 tr=0 a=BRTLx2zjy18DyBo5AQlLyQ==:117 a=xqWC_Br6kY4A:10 a=6yu5SQbkyS8A:10 a=8nJEP1OIZ-IA:10 a=r6YtysWOX24A:10 a=VwQbUJbxAAAA:8 a=npiypiU9AAAA:8 a=QsCQSZWt2n-8Q3tMN0QA:9 a=wPNLvfGTeEIA:10 a=AjGcO6oz07-iQ99wixmX:22 a=U5QfeDdlIO9jQLzCQbpp:22
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Peter,

>On 21-06-04 02:53:19, Chow, Watson wrote:
>>=20
>> Upgraded the kernel version to 5.9, I can set the g_webcam module pararm=
eters
>> as follow (for max bandwidth):
>>=20
>> streaming_maxpacket=3D3072
>> streaming_maxburst=3D15
>> streaming_interval=3D1
>
>According the spec:
>Maximum number of packet within one SoF:
>(bMaxBurst + 1) * (Mult + 1) =3D (15  + 1) * (2 + 1)=3D 48
>Maximum bandwidth =3D 48 * 1024 * 8 (B/bit) * 8 (125us/1ms) =3D 3.072Gbps
>USB 3.0 is 8/10b coding, the theory maximum bandwidth is 5 * 0.8 =3D 4.096=
Gbps
>So, your setting tells host that your have the capabilities to get the
>maximum bandwidth,but you may can't get it due to the FIFO depth for endpo=
int
>and system bus latency.

This aligns with my thought. Thx!

>
>Peter
>
>>=20
>> Data transfer with above setting is working now - tested with dummy data
>> generator in the uvc-gadget app.
>>=20
>> This concludes that kernel 5.4 is too old for DWC3 and UVC gadget driver
>> in high bandwidth usage
>>=20
>>=20
>> >>>> 4. I read through the procedures to capture debug info by debugfs. =
However,
>> >>>> in my test with "streaming_maxburst" set to 10 or above, my system =
would=20
>> >>>> crash and I can't pick the log from that point. Any suggestion?
>> >>>
>> >>>have a look at ftrace_dump_on_oops.
>> >>
>> >> I will explore how to enable this
>> >>
>> >>>
>> >>
>> >> Btw, do you know which SoC platform can run the UVC gadget in max thr=
oughput.
>> >> Raspberry Pi/TI Beaglebone/i.MX ???
>> >
>> >Raspberry Pi uses dwc2
>> >Beaglebone uses musb
>> >i.MX, I think some of them use dwc3 at least.
>> >
>>=20
>> Watson
>>=20
>> -----Original Message-----
>> From: Felipe Balbi <balbi@kernel.org>=20
>> Sent: Monday, May 17, 2021 1:32 PM
>> To: Chow, Watson <Watson.Chow@Avnet.com>; linux-usb@vger.kernel.org
>> Subject: RE: [BUG REPORT] usb: dwc3: Bug while setting the USB transfer =
bandwidth on UVC gadget driver
>>=20
>>=20
>> Hi,
>>=20
>> "Chow, Watson" <Watson.Chow@Avnet.com> writes:
>> > Hi,
>> >
>> >>Hi,
>> >>
>> >>(please don't top-post :-)
>> > I have tried my best to meet the format requirement
>>=20
>> Thanks
>>=20
>> >>"Chow, Watson" <Watson.Chow@Avnet.com> writes:
>> >>> Balbi,
>> >>>
>> >>> Thanks for your quick reply.
>> >>>
>> >>> Some questions
>> >>>
>> >>> 1. You mentioned that the max bandwidth in isoc mode (USB3.0) should=
 be=20
>> >>> around 4Gbps. =20
>> >>>
>> >>> I have the below calcuation on bandwidth:
>> >>> In USB3.0, 1 micro frame would take 125us and can transfer max 45000=
 bytes
>> >>> So, in 1 sec, we will have 8000 micro frames
>> >>>
>> >>> Max bandwidth =3D 8000 x 4500 x 8 =3D 2.88Gbps
>> >>>
>> >>> Is my understanding correct?
>> >>
>> >>probably, It's been a while since I've dug through the spec, to be fra=
nk
>> >>
>> >>> 2. To achieve the max throughput, I need to configure the uvc gadget=
 driver=20
>> >>> with below parameters. Am I right?
>> >>>
>> >>> # modprobe g_webcam streaming_maxpacket=3D3072 streaming_maxburst=3D=
15=20
>> >>> streaming_interval=3D1
>> >>
>> >>right, but there's an assumption here that the gadget will be able to
>> >>feed data in a timely manner.
>> >
>> > How does the DWC3 driver or the gadget driver handle the case with int=
ermittent
>> > drop of the input video streaming?
>> >
>> > Any recover mechanism?
>>=20
>> yeah, the missed ISOC is reported to the gadget driver and that has to
>> queue new requests.
>>=20
>> >>> 3. You suggest me to try on kernel v5.12 or the latest v5.13-rc. It =
looks not
>> >>> easy in my side to upgrade the kernel version. It would affect those=
 other=20
>> >>> device drivers I'm currently using. So, do you think there's any sho=
rt cut=20
>> >>> to fix this problem under my current kernel version - v5.4?
>> >>
>> >>In that case, you need to ask for support from whoever forces you to
>> >>stay with such an old kernel. I believe that would be Xilinx.
>> >
>> > I have a thought to back port those changes around the dwc3 and gadget=
 driver
>> > from the latest kernel version to my kernel (v5.4). Do you think this =
is=20
>> > feasible?
>>=20
>> should be, but it's likely quite a bit of work:
>>=20
>> $ git rev-list --count v5.4..linus/master -- drivers/usb/dwc3/
>> 257
>>=20
>> >>> 4. I read through the procedures to capture debug info by debugfs. H=
owever,
>> >>> in my test with "streaming_maxburst" set to 10 or above, my system w=
ould=20
>> >>> crash and I can't pick the log from that point. Any suggestion?
>> >>
>> >>have a look at ftrace_dump_on_oops.
>> >
>> > I will explore how to enable this
>> >
>> >>
>> >
>> > Btw, do you know which SoC platform can run the UVC gadget in max thro=
ughput.
>> > Raspberry Pi/TI Beaglebone/i.MX ???
>>=20
>> Raspberry Pi uses dwc2
>> Beaglebone uses musb
>> i.MX, I think some of them use dwc3 at least.
>>=20
>> --=20
>> balbi
>
>--=20
>
>Thanks,
>Peter Chen
>

Watson Chow


-----Original Message-----
From: Peter Chen <peter.chen@kernel.org>=20
Sent: Monday, June 7, 2021 2:11 PM
To: Chow, Watson <Watson.Chow@Avnet.com>
Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
Subject: Re: [BUG REPORT] usb: dwc3: Bug while setting the USB transfer ban=
dwidth on UVC gadget driver

On 21-06-04 02:53:19, Chow, Watson wrote:
>=20
> Upgraded the kernel version to 5.9, I can set the g_webcam module pararme=
ters
> as follow (for max bandwidth):
>=20
> streaming_maxpacket=3D3072
> streaming_maxburst=3D15
> streaming_interval=3D1

According the spec:
Maximum number of packet within one SoF:
(bMaxBurst=A0+ 1) * (Mult + 1) =3D (15=A0=A0+ 1) * (2 + 1)=3D 48
Maximum bandwidth =3D 48 * 1024 * 8 (B/bit) * 8 (125us/1ms) =3D 3.072Gbps
USB 3.0 is 8/10b coding, the theory maximum bandwidth is 5 * 0.8 =3D 4.096G=
bps
So, your setting tells host that your have the capabilities to get the
maximum bandwidth,but you may can't get it due to the FIFO depth for endpoi=
nt
and system bus latency.

Peter

>=20
> Data transfer with above setting is working now - tested with dummy data
> generator in the uvc-gadget app.
>=20
> This concludes that kernel 5.4 is too old for DWC3 and UVC gadget driver
> in high bandwidth usage
>=20
>=20
> >>>> 4. I read through the procedures to capture debug info by debugfs. H=
owever,
> >>>> in my test with "streaming_maxburst" set to 10 or above, my system w=
ould=20
> >>>> crash and I can't pick the log from that point. Any suggestion?
> >>>
> >>>have a look at ftrace_dump_on_oops.
> >>
> >> I will explore how to enable this
> >>
> >>>
> >>
> >> Btw, do you know which SoC platform can run the UVC gadget in max thro=
ughput.
> >> Raspberry Pi/TI Beaglebone/i.MX ???
> >
> >Raspberry Pi uses dwc2
> >Beaglebone uses musb
> >i.MX, I think some of them use dwc3 at least.
> >
>=20
> Watson
>=20
> -----Original Message-----
> From: Felipe Balbi <balbi@kernel.org>=20
> Sent: Monday, May 17, 2021 1:32 PM
> To: Chow, Watson <Watson.Chow@Avnet.com>; linux-usb@vger.kernel.org
> Subject: RE: [BUG REPORT] usb: dwc3: Bug while setting the USB transfer b=
andwidth on UVC gadget driver
>=20
>=20
> Hi,
>=20
> "Chow, Watson" <Watson.Chow@Avnet.com> writes:
> > Hi,
> >
> >>Hi,
> >>
> >>(please don't top-post :-)
> > I have tried my best to meet the format requirement
>=20
> Thanks
>=20
> >>"Chow, Watson" <Watson.Chow@Avnet.com> writes:
> >>> Balbi,
> >>>
> >>> Thanks for your quick reply.
> >>>
> >>> Some questions
> >>>
> >>> 1. You mentioned that the max bandwidth in isoc mode (USB3.0) should =
be=20
> >>> around 4Gbps. =20
> >>>
> >>> I have the below calcuation on bandwidth:
> >>> In USB3.0, 1 micro frame would take 125us and can transfer max 45000 =
bytes
> >>> So, in 1 sec, we will have 8000 micro frames
> >>>
> >>> Max bandwidth =3D 8000 x 4500 x 8 =3D 2.88Gbps
> >>>
> >>> Is my understanding correct?
> >>
> >>probably, It's been a while since I've dug through the spec, to be fran=
k
> >>
> >>> 2. To achieve the max throughput, I need to configure the uvc gadget =
driver=20
> >>> with below parameters. Am I right?
> >>>
> >>> # modprobe g_webcam streaming_maxpacket=3D3072 streaming_maxburst=3D1=
5=20
> >>> streaming_interval=3D1
> >>
> >>right, but there's an assumption here that the gadget will be able to
> >>feed data in a timely manner.
> >
> > How does the DWC3 driver or the gadget driver handle the case with inte=
rmittent
> > drop of the input video streaming?
> >
> > Any recover mechanism?
>=20
> yeah, the missed ISOC is reported to the gadget driver and that has to
> queue new requests.
>=20
> >>> 3. You suggest me to try on kernel v5.12 or the latest v5.13-rc. It l=
ooks not
> >>> easy in my side to upgrade the kernel version. It would affect those =
other=20
> >>> device drivers I'm currently using. So, do you think there's any shor=
t cut=20
> >>> to fix this problem under my current kernel version - v5.4?
> >>
> >>In that case, you need to ask for support from whoever forces you to
> >>stay with such an old kernel. I believe that would be Xilinx.
> >
> > I have a thought to back port those changes around the dwc3 and gadget =
driver
> > from the latest kernel version to my kernel (v5.4). Do you think this i=
s=20
> > feasible?
>=20
> should be, but it's likely quite a bit of work:
>=20
> $ git rev-list --count v5.4..linus/master -- drivers/usb/dwc3/
> 257
>=20
> >>> 4. I read through the procedures to capture debug info by debugfs. Ho=
wever,
> >>> in my test with "streaming_maxburst" set to 10 or above, my system wo=
uld=20
> >>> crash and I can't pick the log from that point. Any suggestion?
> >>
> >>have a look at ftrace_dump_on_oops.
> >
> > I will explore how to enable this
> >
> >>
> >
> > Btw, do you know which SoC platform can run the UVC gadget in max throu=
ghput.
> > Raspberry Pi/TI Beaglebone/i.MX ???
>=20
> Raspberry Pi uses dwc2
> Beaglebone uses musb
> i.MX, I think some of them use dwc3 at least.
>=20
> --=20
> balbi

--=20

Thanks,
Peter Chen


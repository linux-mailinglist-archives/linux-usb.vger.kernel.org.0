Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29C2A3805B9
	for <lists+linux-usb@lfdr.de>; Fri, 14 May 2021 10:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233789AbhENJAi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 May 2021 05:00:38 -0400
Received: from smtp2.avnet.com ([12.9.139.122]:7253 "EHLO smtp2.avnet.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229544AbhENJAh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 May 2021 05:00:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Avnet.com;
        s=20201119; t=1620982766;
        bh=ZwAQmYK55lHygbqjPbrG03gizMdzic4LBtzoZLAacao=;
        h=From:To:Subject:Date:References:In-Reply-To;
        b=OMlGOvUpmEMj1L/TauNAsd30tuEvFfeWr4zzvY/CbIOTRO8uG29c7qYEv5m6J1yz/
         Yc+dpPmCAd6CSZAINLUNFrTdSDzX6ZmK9DpTYjeUZ33809jVBGDwcXjHYULsjX3AbQ
         ja5bIfI6hF91bTf7xzEDL3fJpmNfUbTRDyNol5glEVneN5VSSklhKTp+aAyhdtfo8m
         4IZNX5Z52RGoYVT9ApndMNRAItJwmEwYQFGgWAKq6IjvvNItAeltyM/CXY7LWT/vGb
         IDejUEZQkZuBi2vpFKKv8/OWZad1KckMN+OW5KNtKguHVo/To5J+suMdZD+S0YqN43
         W8Vg8PS2DXYwg==
Received: from CMX2401EX1603.AVNET.COM (Not Verified[172.16.125.20]) by smtp2.avnet.com with Trustwave SEG (v8,2,6,11305) (using TLS: TLSv1.2, AES256-GCM-SHA384)
        id <B609e3bed0000>; Fri, 14 May 2021 01:59:25 -0700
Received: from CMX2401EX1604.AVNET.COM (172.16.125.26) by
 CMX2401EX1603.AVNET.COM (172.16.125.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 14 May 2021 01:59:25 -0700
Received: from CMX2401EX1604.AVNET.COM ([fe80::3838:ad6:3b52:4f83]) by
 CMX2401EX1604.AVNET.COM ([fe80::3838:ad6:3b52:4f83%2]) with mapi id
 15.01.2242.008; Fri, 14 May 2021 01:59:25 -0700
From:   "Chow, Watson" <Watson.Chow@Avnet.com>
To:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [BUG REPORT] usb: dwc3: Bug while setting the USB transfer
 bandwidth on UVC gadget driver
Thread-Topic: [BUG REPORT] usb: dwc3: Bug while setting the USB transfer
 bandwidth on UVC gadget driver
Thread-Index: AddIcAtgBDXAgCQbQXSu/5dHZ1drkQAW67SAAA5jNfA=
Date:   Fri, 14 May 2021 08:59:25 +0000
Message-ID: <4c354460a55e40c9938a1fdedfa62144@Avnet.com>
References: <6bc8ab9c4e3f4bafae13a7574b1ae0e3@Avnet.com>
 <87r1i97pkk.fsf@kernel.org>
In-Reply-To: <87r1i97pkk.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.125.136]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=MMceZ/Rl c=1 sm=1 tr=0 a=BRTLx2zjy18DyBo5AQlLyQ==:117 a=xqWC_Br6kY4A:10 a=6yu5SQbkyS8A:10 a=kj9zAlcOel0A:10 a=5FLXtPjwQuUA:10 a=VwQbUJbxAAAA:8 a=npiypiU9AAAA:8 a=yMhMjlubAAAA:8 a=EG6sGpfcAAAA:20 a=54o8oKSQAAAA:8 a=8hghKbX9AAAA:20 a=6l7CXw3xYMryA4isbLAA:9 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22 a=U5QfeDdlIO9jQLzCQbpp:22
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Balbi,

Thanks for your quick reply.

Some questions

1. You mentioned that the max bandwidth in isoc mode (USB3.0) should be=20
around 4Gbps. =20

I have the below calcuation on bandwidth:
In USB3.0, 1 micro frame would take 125us and can transfer max 45000 bytes
So, in 1 sec, we will have 8000 micro frames

Max bandwidth =3D 8000 x 4500 x 8 =3D 2.88Gbps

Is my understanding correct?

2. To achieve the max throughput, I need to configure the uvc gadget driver=
=20
with below parameters. Am I right?

# modprobe g_webcam streaming_maxpacket=3D3072 streaming_maxburst=3D15=20
streaming_interval=3D1


3. You suggest me to try on kernel v5.12 or the latest v5.13-rc. It looks n=
ot
easy in my side to upgrade the kernel version. It would affect those other=
=20
device drivers I'm currently using. So, do you think there's any short cut=
=20
to fix this problem under my current kernel version - v5.4?


4. I read through the procedures to capture debug info by debugfs. However,
in my test with "streaming_maxburst" set to 10 or above, my system would=20
crash and I can't pick the log from that point. Any suggestion?

best regards,

Watson


-----Original Message-----
From: Felipe Balbi <balbi@kernel.org>=20
Sent: Friday, May 14, 2021 3:16 PM
To: Chow, Watson <Watson.Chow@Avnet.com>; linux-usb@vger.kernel.org
Subject: Re: [BUG REPORT] usb: dwc3: Bug while setting the USB transfer ban=
dwidth on UVC gadget driver


Hi Watson,

(please teach your mailer to break lines at 80 columns)

"Chow, Watson" <Watson.Chow@Avnet.com> writes:
> Hi,
>
> I'm using the SoC (Xilinx MPSoC) with DWC3 USB controller. I need to=20
> emulate my hardware to work like a USB camera and so make use of the=20
> USB UVC gadget driver - g_webcam.

which Kernel version are you running?

> Refer to this link and the driver source code, I find 3 parameters to=20
> configure the ISOC transfer bandwidth.
>
> https://docs.microsoft.com/en-us/windows-hardware/drivers/usbcon/trans
> fer-data-to-isochronous-endpoints#isochronous-transfer-example
>
> They are:
>
> streaming_maxpacket : range [1 - 3072] streaming_maxburst : range [0 -=20
> 15] streaming_interval : [1 - 16]
>
> So, I load the driver in this way
>
> # modprobe g_webcam streaming_maxpacket=3D3072 streaming_maxburst=3D9=20
> streaming_interval=3D2
>
> Create my own app base on
> https://github.com/wlhe/uvc-gadget
>
> Test result
>
> In my evaluation, I can set the combination of parameters up to this.=20
> The streaming is ok.
>
> # modprobe g_webcam streaming_maxpacket=3D3072 streaming_maxburst=3D9=20
> streaming_interval=3D2

streaming_maxburst=3D15 should work here too.

> This should be around 900Mbit/sec. Far less than 5Gbps bandwidth of
> USB3.0

IIRC Isoc endpoints can't take the full bus bandwidth, I don't remember the=
 exact limit but I think it's 80% of full bandwidth. Still, that should be =
around 4Gbit/sec

> When I increase the parameter combination to:
> # modprobe g_webcam streaming_maxpacket=3D3072 streaming_maxburst=3D10=20
> streaming_interval=3D2
>
> I get the below error message and everything stop.
>
> [ 1089.751559] g_webcam gadget: uvc: VS request completed with status -18=
.

> 1. This error is somehow related to the underflow of the transfer=20
> queue. Is my understanding correct?

that means the controller lost an isoc interval. There is still discussion =
going on regarding isoc intervals in dwc3. It turns out the HW doesn't make=
 scheduling super easy for SW :-)

> If so, how to solve?
> 2.	My goal is to utilize the full bandwidth of USB3.0. How can I achive?
>
> [Some background information and my test setup]
>
> I started from the Xilinx TRD here.
>
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/541786361/Zynq+U
> ltraScale+MPSoC+VCU+TRD+2020.1+-+Xilinx+Low+Latency+PS+DDR+NV12+HDMI+A
> udio+Video+Capture+and+Display
>
> With kernel version v5.4:
> https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v5.4_2020.2

v5.4 is super old, please test with v5.12 or the latest v5.13-rc. Also, whe=
n reporting dwc3 bugs, make sure to include regdump and trace events as des=
cribed in dwc3 documentation

--
balbi

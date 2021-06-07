Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C26939D4AC
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 08:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbhFGGNL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 02:13:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:33752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229449AbhFGGNL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Jun 2021 02:13:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94E5961164;
        Mon,  7 Jun 2021 06:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623046280;
        bh=c0J+F+Ybh9qVuxvXFmsVWAXOl3lgD6egdDXXaYLMCIQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=InQZzKN8iTlmDt487UC+t9TxGNYUoLZZz10hHgLOwbvyhV3gpORLlkyLX1LoEYYWO
         ljzqdgmExf4dlPoaosFmzYrtJHxSp3BJVJA37XrnYNrHI1fZyncta6XmJ/6TFDbKB/
         1/beGd6czhId4fhjdTMVSPqZcnNoEXku2YNNk3+rdwap4F7rGWBGtiWPRYU5OBvsRy
         439k4Qn5PIucnv4vtx0JWQ+x2WoAlXHqmaNCcZ82Kx3zfYowwRR+AyU0X/2yzSfj/Z
         SEN/G9z2J4tTucKAYvqOf8yFI39cE0C1UOK675bJ+UTx03tK7dIscQu9xFQoL8GHxZ
         0M7TyjWbELWmw==
Date:   Mon, 7 Jun 2021 14:11:16 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     "Chow, Watson" <Watson.Chow@Avnet.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [BUG REPORT] usb: dwc3: Bug while setting the USB transfer
 bandwidth on UVC gadget driver
Message-ID: <20210607061116.GA25386@nchen>
References: <6bc8ab9c4e3f4bafae13a7574b1ae0e3@Avnet.com>
 <87r1i97pkk.fsf@kernel.org>
 <4c354460a55e40c9938a1fdedfa62144@Avnet.com>
 <878s4h7giv.fsf@kernel.org>
 <9e8d9a55a0e64ab092ceb464db5f0119@Avnet.com>
 <87zgwu53jc.fsf@kernel.org>
 <c64f050b25d445ec8342ac25f7a563a4@Avnet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c64f050b25d445ec8342ac25f7a563a4@Avnet.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-06-04 02:53:19, Chow, Watson wrote:
> 
> Upgraded the kernel version to 5.9, I can set the g_webcam module pararmeters
> as follow (for max bandwidth):
> 
> streaming_maxpacket=3072
> streaming_maxburst=15
> streaming_interval=1

According the spec:
Maximum number of packet within one SoF:
(bMaxBurst + 1) * (Mult + 1) = (15  + 1) * (2 + 1)= 48
Maximum bandwidth = 48 * 1024 * 8 (B/bit) * 8 (125us/1ms) = 3.072Gbps
USB 3.0 is 8/10b coding, the theory maximum bandwidth is 5 * 0.8 = 4.096Gbps
So, your setting tells host that your have the capabilities to get the
maximum bandwidth,but you may can't get it due to the FIFO depth for endpoint
and system bus latency.

Peter

> 
> Data transfer with above setting is working now - tested with dummy data
> generator in the uvc-gadget app.
> 
> This concludes that kernel 5.4 is too old for DWC3 and UVC gadget driver
> in high bandwidth usage
> 
> 
> >>>> 4. I read through the procedures to capture debug info by debugfs. However,
> >>>> in my test with "streaming_maxburst" set to 10 or above, my system would 
> >>>> crash and I can't pick the log from that point. Any suggestion?
> >>>
> >>>have a look at ftrace_dump_on_oops.
> >>
> >> I will explore how to enable this
> >>
> >>>
> >>
> >> Btw, do you know which SoC platform can run the UVC gadget in max throughput.
> >> Raspberry Pi/TI Beaglebone/i.MX ???
> >
> >Raspberry Pi uses dwc2
> >Beaglebone uses musb
> >i.MX, I think some of them use dwc3 at least.
> >
> 
> Watson
> 
> -----Original Message-----
> From: Felipe Balbi <balbi@kernel.org> 
> Sent: Monday, May 17, 2021 1:32 PM
> To: Chow, Watson <Watson.Chow@Avnet.com>; linux-usb@vger.kernel.org
> Subject: RE: [BUG REPORT] usb: dwc3: Bug while setting the USB transfer bandwidth on UVC gadget driver
> 
> 
> Hi,
> 
> "Chow, Watson" <Watson.Chow@Avnet.com> writes:
> > Hi,
> >
> >>Hi,
> >>
> >>(please don't top-post :-)
> > I have tried my best to meet the format requirement
> 
> Thanks
> 
> >>"Chow, Watson" <Watson.Chow@Avnet.com> writes:
> >>> Balbi,
> >>>
> >>> Thanks for your quick reply.
> >>>
> >>> Some questions
> >>>
> >>> 1. You mentioned that the max bandwidth in isoc mode (USB3.0) should be 
> >>> around 4Gbps.  
> >>>
> >>> I have the below calcuation on bandwidth:
> >>> In USB3.0, 1 micro frame would take 125us and can transfer max 45000 bytes
> >>> So, in 1 sec, we will have 8000 micro frames
> >>>
> >>> Max bandwidth = 8000 x 4500 x 8 = 2.88Gbps
> >>>
> >>> Is my understanding correct?
> >>
> >>probably, It's been a while since I've dug through the spec, to be frank
> >>
> >>> 2. To achieve the max throughput, I need to configure the uvc gadget driver 
> >>> with below parameters. Am I right?
> >>>
> >>> # modprobe g_webcam streaming_maxpacket=3072 streaming_maxburst=15 
> >>> streaming_interval=1
> >>
> >>right, but there's an assumption here that the gadget will be able to
> >>feed data in a timely manner.
> >
> > How does the DWC3 driver or the gadget driver handle the case with intermittent
> > drop of the input video streaming?
> >
> > Any recover mechanism?
> 
> yeah, the missed ISOC is reported to the gadget driver and that has to
> queue new requests.
> 
> >>> 3. You suggest me to try on kernel v5.12 or the latest v5.13-rc. It looks not
> >>> easy in my side to upgrade the kernel version. It would affect those other 
> >>> device drivers I'm currently using. So, do you think there's any short cut 
> >>> to fix this problem under my current kernel version - v5.4?
> >>
> >>In that case, you need to ask for support from whoever forces you to
> >>stay with such an old kernel. I believe that would be Xilinx.
> >
> > I have a thought to back port those changes around the dwc3 and gadget driver
> > from the latest kernel version to my kernel (v5.4). Do you think this is 
> > feasible?
> 
> should be, but it's likely quite a bit of work:
> 
> $ git rev-list --count v5.4..linus/master -- drivers/usb/dwc3/
> 257
> 
> >>> 4. I read through the procedures to capture debug info by debugfs. However,
> >>> in my test with "streaming_maxburst" set to 10 or above, my system would 
> >>> crash and I can't pick the log from that point. Any suggestion?
> >>
> >>have a look at ftrace_dump_on_oops.
> >
> > I will explore how to enable this
> >
> >>
> >
> > Btw, do you know which SoC platform can run the UVC gadget in max throughput.
> > Raspberry Pi/TI Beaglebone/i.MX ???
> 
> Raspberry Pi uses dwc2
> Beaglebone uses musb
> i.MX, I think some of them use dwc3 at least.
> 
> -- 
> balbi

-- 

Thanks,
Peter Chen


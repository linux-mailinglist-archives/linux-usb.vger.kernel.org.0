Return-Path: <linux-usb+bounces-5878-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE58849D25
	for <lists+linux-usb@lfdr.de>; Mon,  5 Feb 2024 15:35:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 260761F22A1F
	for <lists+linux-usb@lfdr.de>; Mon,  5 Feb 2024 14:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511EC2C19C;
	Mon,  5 Feb 2024 14:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b="fZl8klb+";
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b="fZl8klb+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.ivitera.com (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7090E2C19A
	for <linux-usb@vger.kernel.org>; Mon,  5 Feb 2024 14:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.101.85.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707143710; cv=none; b=lXqCFTi66EHF76nNsHaZTDeb+AIb6d8qd0PpKh01JOVUxlhY8wTPUG1C3NXYSmU8bHWSh0pqsuWG51fqZdsUYmcvLdtBTrxBB+xINozKz6eTKLdWdmyaomkd6HnVoPGFabMNiClqpNLKvrZVzp6JJ4YSmnGwGBVuVE3AMGg/9tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707143710; c=relaxed/simple;
	bh=3AJ/I+yU2CgcSvMxYmp1cEdCiWWoN4iPsbOujfO0Lbg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=CbarVvqvED07yriyA4B6tE428+OavmXo6woG5SNc9YHamz9wa86ra6ernBOFMJKQop78+B8u+tVimyvuV434hstWk2fnrFyrarYCR3OYpHTwCiVlDCPrbF8sYKX+vSJcLYWdu/rz0zD6FMypYWLdJgyHWjNkg2JNUP50s3FVa7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ivitera.com; spf=pass smtp.mailfrom=ivitera.com; dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b=fZl8klb+; dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b=fZl8klb+; arc=none smtp.client-ip=88.101.85.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ivitera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ivitera.com
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id DF96615B6A1;
	Mon,  5 Feb 2024 15:35:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1707143704; bh=3AJ/I+yU2CgcSvMxYmp1cEdCiWWoN4iPsbOujfO0Lbg=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=fZl8klb+63tpMql/zBwM+Rx5jGhK8GEZJSXMOltUKhMMzzgW7kM+rLo9AdFN+5k+f
	 M6dOlnR82V3a3+x5/PObMS6d65NSoTezCDzTkEscuOwgw3colMF4IZWnim/XoKPvnH
	 xjsCcCa/vENxDlljRhL3E17dOOa2EejdlK8v5V5M=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fb7ScbcJX9oZ; Mon,  5 Feb 2024 15:35:04 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id 1777A15B7BF;
	Mon,  5 Feb 2024 15:35:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1707143704; bh=3AJ/I+yU2CgcSvMxYmp1cEdCiWWoN4iPsbOujfO0Lbg=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=fZl8klb+63tpMql/zBwM+Rx5jGhK8GEZJSXMOltUKhMMzzgW7kM+rLo9AdFN+5k+f
	 M6dOlnR82V3a3+x5/PObMS6d65NSoTezCDzTkEscuOwgw3colMF4IZWnim/XoKPvnH
	 xjsCcCa/vENxDlljRhL3E17dOOa2EejdlK8v5V5M=
Message-ID: <758d6e5d-d5b4-2bcc-bd51-fb7b49356532@ivitera.com>
Date: Mon, 5 Feb 2024 15:35:03 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: usb: gadget: dwc2: RK3308: Transmission to EP OUT stalls at
 larger packet size
Content-Language: en-US
From: Pavel Hofman <pavel.hofman@ivitera.com>
To: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <91811ad2-991e-bd34-b3ec-2b92229bdd8b@ivitera.com>
In-Reply-To: <91811ad2-991e-bd34-b3ec-2b92229bdd8b@ivitera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Dne 05. 02. 24 v 14:43 Pavel Hofman napsal(a):
> Hi Minas,
> 
> I am having issues with dwc2 gadget on RK3308 (Rock Pi S). Kernel 6.6.2.
> 
> When lightly loading EP OUT with UAC2, EP OUT works OK. When increasing 
> the packet size (960 bytes in the iso packet), the data delivery stops 
> completely. Method u_audio.c:u_audio_iso_complete stops being called, 
> it's like as if the incoming stream reception got stuck.
> 
> Only the function f_uac2 is used on the gadget.
> 
> Debug log from gadget.c + u_audio.c (logging all calls of 
> u_audio_iso_complete including !req->status) is attached. Starts of 
> playback on the host are marked with this logs in the dump:
> 
> g_audio gadget.0: start capture with rate 192000
> 
> 
> Other debug files are below.
> 
> The SoC is quite weak (A35, 1GHz), it may be that it's not capable of 
> full HS iso bandwidth. But maybe it's just some suboptimal configuration 
> of DMA/DWC2.
> 
> Of course I am ready to provide any other debug info.
> 
> Thank you very much for any help.
> 
> With regards,
> 
> Pavel.
> 
> 
> This is EPs overview from the host + packetsize:
> 
> Playback:
>    Status: Running
>      Interface = 1
>      Altset = 1
>      Packet Size = 1000
>      Momentary freq = 192000 Hz (0x18.0000)
>      Feedback Format = 16.16
>    Interface 1
>      Altset 1
>      Format: S32_LE
>      Channels: 10
>      Endpoint: 0x02 (2 OUT) (ASYNC)
>      Rates: 192000
>      Data packet interval: 125 us
>      Bits: 32
>      Channel map: FL FR FC LFE RL RR FLC FRC RC SL
>      Sync Endpoint: 0x83 (3 IN)
>      Sync EP Interface: 1
>      Sync EP Altset: 1
>      Implicit Feedback Mode: No
> 
> Capture:
>    Status: Stop
>    Interface 2
>      Altset 1
>      Format: S32_LE
>      Channels: 10
>      Endpoint: 0x85 (5 IN) (ASYNC)
>      Rates: 192000
>      Data packet interval: 125 us
>      Bits: 32
>      Channel map: FL FR FC LFE RL RR FLC FRC RC SL
> 
> 
> 
> 
> root@rock-pi-s:/sys/kernel/debug/usb/ff400000.usb# cat ep2out
> Endpoint index 2, named ep2out,  dir out:
>      DIEPCTL=0x00000400, DOEPCTL=0x800483e8
>      DIEPDMA=0x92b8b5a4, DOEPDMA=0x1ba01008
>      DIEPINT=0x000002a0, DOEPINT=0x00002010
>      DIEPTSIZ=0x00000000, DOEPTSIZ=0x1f27b8c0
> 
> mps 1000
> total_data=0
> request list (00000000f7fd142e,00000000900d6fbc):
>    req 0000000074dc3bc0: 1000 bytes @0000000074c79a73, 0 done, res -115
>    req 00000000980b129b: 1000 bytes @000000006ef8394b, 0 done, res -115
> 
> 
> RXFIFO is large enough for one full HS iso packet (we calculated it in 
> the past to be around 304 bytes minimum). FIFOs fit the 972 bytes of 
> total_fifo_size:
> 
> root@rock-pi-s:/sys/kernel/debug/usb/ff400000.usb# cat fifo
> Non-periodic FIFOs:
> RXFIFO: Size 310
> NPTXFIFO: Size 16, Start 0x00000136
> 
> Periodic TXFIFOs:
>      DPTXFIFO 1: Size 256, Start 0x00000146
>      DPTXFIFO 2: Size 128, Start 0x00000246
>      DPTXFIFO 3: Size 128, Start 0x000002c6
>      DPTXFIFO 4: Size 64, Start 0x00000346
>      DPTXFIFO 5: Size 32, Start 0x00000386
>      DPTXFIFO 6: Size 16, Start 0x000003a6
> 
> 
> root@rock-pi-s:/sys/kernel/debug/usb/ff400000.usb# cat hw_params
> op_mode                       : 0
> arch                          : 2
> dma_desc_enable               : 1
> enable_dynamic_fifo           : 1
> en_multiple_tx_fifo           : 1
> rx_fifo_size                  : 1024
> host_nperio_tx_fifo_size      : 0
> dev_nperio_tx_fifo_size       : 16
> host_perio_tx_fifo_size       : 0
> nperio_tx_q_depth             : 4
> host_perio_tx_q_depth         : 4
> dev_token_q_depth             : 8
> max_transfer_size             : 524287
> max_packet_count              : 1023
> host_channels                 : 9
> hs_phy_type                   : 1
> fs_phy_type                   : 0
> i2c_enable                    : 0
> num_dev_ep                    : 9
> num_dev_perio_in_ep           : 0
> total_fifo_size               : 972
> power_optimized               : 1
> utmi_phy_data_width           : 1
> snpsid                        : 0x4f54310a
> dev_ep_dirs                   : 0x6664
> 
> 
> root@rock-pi-s:/sys/kernel/debug/usb/ff400000.usb# cat params
> otg_caps.hnp_support          : 0
> otg_caps.srp_support          : 0
> otg_caps.otg_rev              : 0
> dma_desc_enable               : 0
> dma_desc_fs_enable            : 0
> speed                         : 0
> enable_dynamic_fifo           : 1
> en_multiple_tx_fifo           : 1
> host_rx_fifo_size             : 525
> host_nperio_tx_fifo_size      : 128
> host_perio_tx_fifo_size       : 256
> max_transfer_size             : 524287
> max_packet_count              : 1023
> host_channels                 : 0
> phy_type                      : 1
> phy_utmi_width                : 16
> phy_ulpi_ddr                  : 0
> phy_ulpi_ext_vbus             : 0
> i2c_enable                    : 0
> ipg_isoc_en                   : 0
> ulpi_fs_ls                    : 0
> host_support_fs_ls_low_power  : 0
> host_ls_low_power_phy_clk     : 0
> activate_stm_fs_transceiver   : 0
> activate_stm_id_vb_detection  : 0
> ts_dline                      : 0
> reload_ctl                    : 1
> ahbcfg                        : 0xe
> uframe_sched                  : 1
> external_id_pin_ctl           : 0
> power_down                    : 0
> lpm                           : 0
> lpm_clock_gating              : 0
> besl                          : 0
> hird_threshold_en             : 0
> hird_threshold                : 4
> service_interval              : 0
> host_dma                      : 0
> g_dma                         : 1
> g_dma_desc                    : 1
> g_rx_fifo_size                : 310
> g_np_tx_fifo_size             : 16
> g_tx_fifo_size[0]             : 0
> g_tx_fifo_size[1]             : 256
> g_tx_fifo_size[2]             : 128
> g_tx_fifo_size[3]             : 128
> g_tx_fifo_size[4]             : 64
> g_tx_fifo_size[5]             : 32
> g_tx_fifo_size[6]             : 16
> g_tx_fifo_size[7]             : 0
> g_tx_fifo_size[8]             : 0
> g_tx_fifo_size[9]             : 0
> g_tx_fifo_size[10]            : 0
> g_tx_fifo_size[11]            : 0
> g_tx_fifo_size[12]            : 0
> g_tx_fifo_size[13]            : 0
> g_tx_fifo_size[14]            : 0
> g_tx_fifo_size[15]            : 0
> 
> 
> root@rock-pi-s:/sys/kernel/debug/usb/ff400000.usb# cat regdump
> GOTGCTL = 0x000d0000
> GOTGINT = 0x00000000
> GAHBCFG = 0x0000002f
> GUSBCFG = 0x4000140f
> GRSTCTL = 0x40000000
> GINTSTS = 0x0438c0ba
> GINTMSK = 0xd88c3c44
> GRXSTSR = 0x51643c02
> GRXFSIZ = 0x00000136
> GNPTXFSIZ = 0x00100136
> GNPTXSTS = 0x00080010
> GI2CCTL = 0x00000000
> GPVNDCTL = 0x00000000
> GGPIO = 0x00000000
> GUID = 0x32000001
> GSNPSID = 0x4f54310a
> GHWCFG1 = 0x00006664
> GHWCFG2 = 0x228e2450
> GHWCFG3 = 0x03cc90e8
> GHWCFG4 = 0xdbf04030
> GLPMCFG = 0x00000000
> GPWRDN = 0x00600010
> GDFIFOCFG = 0x03b603cc
> ADPCTL = 0x00000000
> HPTXFSIZ = 0x00000000
> DPTXFSIZN(1) = 0x01000146
> DPTXFSIZN(2) = 0x00800246
> DPTXFSIZN(3) = 0x008002c6
> DPTXFSIZN(4) = 0x00400346
> DPTXFSIZN(5) = 0x00200386
> DPTXFSIZN(6) = 0x001003a6
> DPTXFSIZN(7) = 0x00200386
> DPTXFSIZN(8) = 0x001003a6
> DPTXFSIZN(9) = 0x01000146
> DPTXFSIZN(10) = 0x00800246
> DPTXFSIZN(11) = 0x008002c6
> DPTXFSIZN(12) = 0x00400346
> DPTXFSIZN(13) = 0x00200386
> DPTXFSIZN(14) = 0x001003a6
> DPTXFSIZN(15) = 0x00200386
> DCFG = 0x008402f0
> DCTL = 0x00000000
> DSTS = 0x001ef900
> DIEPMSK = 0x0000220f
> DOEPMSK = 0x0000023f
> DAINT = 0x02140000
> DAINTMSK = 0x0005000b
> DTKNQR1 = 0x00000000
> DTKNQR2 = 0x00000000
> DTKNQR3 = 0x0c100020
> DTKNQR4 = 0x00000000
> DVBUSDIS = 0x00000b8f
> DVBUSPULSE = 0x000002c6
> DIEPCTL(0) = 0x00028000
> DIEPCTL(1) = 0x018c8006
> DIEPCTL(2) = 0x00000400
> DIEPCTL(3) = 0x01448004
> DIEPCTL(4) = 0x00000400
> DIEPCTL(5) = 0x004603e8
> DIEPCTL(6) = 0x00000400
> DIEPCTL(7) = 0x00000400
> DIEPCTL(8) = 0x00000400
> DIEPCTL(9) = 0x00000400
> DIEPCTL(10) = 0x00000400
> DIEPCTL(11) = 0x00000400
> DIEPCTL(12) = 0x00000400
> DIEPCTL(13) = 0x00000400
> DIEPCTL(14) = 0x00000400
> DIEPCTL(15) = 0x00000400
> DOEPCTL(0) = 0x80028000
> DOEPCTL(1) = 0x00000400
> DOEPCTL(2) = 0x800483e8
> DOEPCTL(3) = 0x00000400
> DOEPCTL(4) = 0x00000400
> DOEPCTL(5) = 0x00000400
> DOEPCTL(6) = 0x00000400
> DOEPCTL(7) = 0x00000400
> DOEPCTL(8) = 0x00000400
> DOEPCTL(9) = 0x00000400
> DOEPCTL(10) = 0x00000400
> DOEPCTL(11) = 0x00000400
> DOEPCTL(12) = 0x00000400
> DOEPCTL(13) = 0x00000400
> DOEPCTL(14) = 0x00000400
> DOEPCTL(15) = 0x00000400
> DIEPINT(0) = 0x00000090
> DIEPINT(1) = 0x00000090
> DIEPINT(2) = 0x000002a0
> DIEPINT(3) = 0x00000090
> DIEPINT(4) = 0x000002a0
> DIEPINT(5) = 0x000000c0
> DIEPINT(6) = 0x000002a0
> DIEPINT(7) = 0x00000080
> DIEPINT(8) = 0x00000080
> DIEPINT(9) = 0x00000080
> DIEPINT(10) = 0x000002a0
> DIEPINT(11) = 0x000002a0
> DIEPINT(12) = 0x000002a0
> DIEPINT(13) = 0x000002a0
> DIEPINT(14) = 0x000002a0
> DIEPINT(15) = 0x000002a0
> DOEPINT(0) = 0x00002000
> DOEPINT(1) = 0x00000000
> DOEPINT(2) = 0x00002010
> DOEPINT(3) = 0x00000000
> DOEPINT(4) = 0x00000020
> DOEPINT(5) = 0x00000000
> DOEPINT(6) = 0x00000000
> DOEPINT(7) = 0x00000000
> DOEPINT(8) = 0x00000000
> DOEPINT(9) = 0x00000220
> DOEPINT(10) = 0x00000000
> DOEPINT(11) = 0x00000000
> DOEPINT(12) = 0x00000000
> DOEPINT(13) = 0x00000000
> DOEPINT(14) = 0x00000000
> DOEPINT(15) = 0x00000000
> DIEPTSIZ(0) = 0x00080052
> DIEPTSIZ(1) = 0x00000000
> DIEPTSIZ(2) = 0x00000000
> DIEPTSIZ(3) = 0x11d81ef7
> DIEPTSIZ(4) = 0x00000000
> DIEPTSIZ(5) = 0x00000000
> DIEPTSIZ(6) = 0x00000000
> DIEPTSIZ(7) = 0x00000000
> DIEPTSIZ(8) = 0x00000000
> DIEPTSIZ(9) = 0x00000000
> DIEPTSIZ(10) = 0x00000000
> DIEPTSIZ(11) = 0x00000000
> DIEPTSIZ(12) = 0x00000000
> DIEPTSIZ(13) = 0x00000000
> DIEPTSIZ(14) = 0x00000000
> DIEPTSIZ(15) = 0x00000000
> DOEPTSIZ(0) = 0x2000005e
> DOEPTSIZ(1) = 0x00000000
> DOEPTSIZ(2) = 0x1f27b8c0
> DOEPTSIZ(3) = 0x00000000
> DOEPTSIZ(4) = 0x00000000
> DOEPTSIZ(5) = 0x00000000
> DOEPTSIZ(6) = 0x00000000
> DOEPTSIZ(7) = 0x00000000
> DOEPTSIZ(8) = 0x00000000
> DOEPTSIZ(9) = 0x00000000
> DOEPTSIZ(10) = 0x00000000
> DOEPTSIZ(11) = 0x00000000
> DOEPTSIZ(12) = 0x00000000
> DOEPTSIZ(13) = 0x00000000
> DOEPTSIZ(14) = 0x00000000
> DOEPTSIZ(15) = 0x00000000
> DIEPDMA(0) = 0x0e693000
> DIEPDMA(1) = 0x86711010
> DIEPDMA(2) = 0x92b8b5a4
> DIEPDMA(3) = 0x1ba02008
> DIEPDMA(4) = 0x92b8b5a4
> DIEPDMA(5) = 0x2fae0710
> DIEPDMA(6) = 0x92b8b5a4
> DIEPDMA(7) = 0x43c7ba7f
> DIEPDMA(8) = 0x0cc64000
> DIEPDMA(9) = 0x57447266
> DIEPDMA(10) = 0x92b8b5a4
> DIEPDMA(11) = 0x92b8b5a4
> DIEPDMA(12) = 0x92b8b5a4
> DIEPDMA(13) = 0x92b8b5a4
> DIEPDMA(14) = 0x92b8b5a4
> DIEPDMA(15) = 0x92b8b5a4
> DOEPDMA(0) = 0x1ba01000
> DOEPDMA(1) = 0xa8800c26
> DOEPDMA(2) = 0x1ba01008
> DOEPDMA(3) = 0xa8800c26
> DOEPDMA(4) = 0x6db46af8
> DOEPDMA(5) = 0xa8800c26
> DOEPDMA(6) = 0x1291dfd8
> DOEPDMA(7) = 0xa8800c26
> DOEPDMA(8) = 0x82d9ef90
> DOEPDMA(9) = 0x0309d816
> DOEPDMA(10) = 0xa8800c26
> DOEPDMA(11) = 0xa8800c26
> DOEPDMA(12) = 0xa8800c26
> DOEPDMA(13) = 0xa8800c26
> DOEPDMA(14) = 0xa8800c26
> DOEPDMA(15) = 0xa8800c26
> DTXFSTS(0) = 0x00000010
> DTXFSTS(1) = 0x00000010
> DTXFSTS(2) = 0x00000010
> DTXFSTS(3) = 0x00000020
> DTXFSTS(4) = 0x00000010
> DTXFSTS(5) = 0x00000100
> DTXFSTS(6) = 0x00000010
> DTXFSTS(7) = 0x00000010
> DTXFSTS(8) = 0x00000010
> DTXFSTS(9) = 0x00000010
> DTXFSTS(10) = 0x00000010
> DTXFSTS(11) = 0x00000010hofman
> DTXFSTS(12) = 0x00000010
> DTXFSTS(13) = 0x00000010
> DTXFSTS(14) = 0x00000010
> DTXFSTS(15) = 0x00000010
> PCGCTL = 0x00000000
> HCFG = 0x008402f0
> HFIR = 0x00000b8f
> HFNUM = 0x0b1803df
> HPTXSTS = 0x00080100
> HAINT = 0x00000002
> HAINTMSK = 0x00000007
> HFLBADDR = 0x00000000
> HPRT0 = 0x00000000
> HCCHAR(0) = 0x018c8006
> HCCHAR(1) = 0x00000400
> HCCHAR(2) = 0x800483e8
> HCCHAR(3) = 0x00000400
> HCCHAR(4) = 0x00000400
> HCCHAR(5) = 0x00000400
> HCCHAR(6) = 0x00000400
> HCCHAR(7) = 0x00000400
> HCCHAR(8) = 0x00000400
> HCCHAR(9) = 0x00000400
> HCCHAR(10) = 0x00000400
> HCCHAR(11) = 0x00000400
> HCCHAR(12) = 0x00000400
> HCCHAR(13) = 0x00000400
> HCCHAR(14) = 0x00000400
> HCCHAR(15) = 0x00000400
> HCSPLT(0) = 0x00000000
> HCSPLT(1) = 0x00000000
> HCSPLT(2) = 0x00000000
> HCSPLT(3) = 0x00000000
> HCSPLT(4) = 0x00000000
> HCSPLT(5) = 0x00000000
> HCSPLT(6) = 0x00000000
> HCSPLT(7) = 0x00000000
> HCSPLT(8) = 0x00000000
> HCSPLT(9) = 0x00000000
> HCSPLT(10) = 0x00000000
> HCSPLT(11) = 0x00000000
> HCSPLT(12) = 0x00000000
> HCSPLT(13) = 0x00000000
> HCSPLT(14) = 0x00000000
> HCSPLT(15) = 0x00000000
> HCINT(0) = 0x00000010
> HCINT(1) = 0x00000000
> HCINT(2) = 0x00002010
> HCINT(3) = 0x00000000
> HCINT(4) = 0x00000020
> HCINT(5) = 0x00000000
> HCINT(6) = 0x00000000
> HCINT(7) = 0x00000000
> HCINT(8) = 0x00000000
> HCINT(9) = 0x00000220
> HCINT(10) = 0x00000000
> HCINT(11) = 0x00000000
> HCINT(12) = 0x00000000
> HCINT(13) = 0x00000000
> HCINT(14) = 0x00000000
> HCINT(15) = 0x00000000
> HCINTMSK(0) = 0x0000020f
> HCINTMSK(1) = 0x00000000
> HCINTMSK(2) = 0x00000000
> HCINTMSK(3) = 0x00000000
> HCINTMSK(4) = 0x00000000
> HCINTMSK(5) = 0x00000000
> HCINTMSK(6) = 0x00000000
> HCINTMSK(7) = 0x00000000
> HCINTMSK(8) = 0x00000000
> HCINTMSK(9) = 0x00000000
> HCINTMSK(10) = 0x00000000
> HCINTMSK(11) = 0x00000000
> HCINTMSK(12) = 0x00000000
> HCINTMSK(13) = 0x00000000
> HCINTMSK(14) = 0x00000000
> HCINTMSK(15) = 0x00000000
> HCTSIZ(0) = 0x00000000
> HCTSIZ(1) = 0x00000000
> HCTSIZ(2) = 0x1f27b8c0
> HCTSIZ(3) = 0x00000000
> HCTSIZ(4) = 0x00000000
> HCTSIZ(5) = 0x00000000
> HCTSIZ(6) = 0x00000000
> HCTSIZ(7) = 0x00000000
> HCTSIZ(8) = 0x00000000
> HCTSIZ(9) = 0x00000000
> HCTSIZ(10) = 0x00000000
> HCTSIZ(11) = 0x00000000
> HCTSIZ(12) = 0x00000000
> HCTSIZ(13) = 0x00000000
> HCTSIZ(14) = 0x00000000
> HCTSIZ(15) = 0x00000000
> HCDMA(0) = 0x1ba01000
> HCDMA(1) = 0xa8800c26
> HCDMA(2) = 0x1ba01008
> HCDMA(3) = 0xa8800c26
> HCDMA(4) = 0x6db46af8
> HCDMA(5) = 0xa8800c26
> HCDMA(6) = 0x1291dfd8
> HCDMA(7) = 0xa8800c26
> HCDMA(8) = 0x82d9ef90
> HCDMA(9) = 0x0309d816
> HCDMA(10) = 0xa8800c26
> HCDMA(11) = 0xa8800c26
> HCDMA(12) = 0xa8800c26
> HCDMA(13) = 0xa8800c26
> HCDMA(14) = 0xa8800c26
> HCDMA(15) = 0xa8800c26
> HCDMAB(0) = 0x069e9ff0
> HCDMAB(1) = 0xa8800c26
> HCDMAB(2) = 0x05eaf3c0
> HCDMAB(3) = 0xa8800c26
> HCDMAB(4) = 0x1f0d193f
> HCDMAB(5) = 0xa8800c26
> HCDMAB(6) = 0x7f72548c
> HCDMAB(7) = 0xa8800c26
> HCDMAB(8) = 0x7795e924
> HCDMAB(9) = 0xc36c019a
> HCDMAB(10) = 0xa8800c26
> HCDMAB(11) = 0xa8800c26
> HCDMAB(12) = 0xa8800c26
> HCDMAB(13) = 0xa8800c26
> HCDMAB(14) = 0xa8800c26
> HCDMAB(15) = 0xa8800c26
> 
It really looks like some DMA performance issue. Stream 980 bytes/ 250us 
(bInterval=2) is bitperfect, no dropped packets. While 24 bytes/125us 
(bInterval=1) gets stuck. IIUC the DMA is not capable of copying packets 
every 125us. Please is there any chance to tweak the performance to 
handle the 125us packets reliably?

Thanks a lot!


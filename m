Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8529E1A7A98
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2020 14:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440034AbgDNMVS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Apr 2020 08:21:18 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:55394 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440031AbgDNMVO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Apr 2020 08:21:14 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 491l2S3WDvz1qsZx;
        Tue, 14 Apr 2020 14:21:04 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 491l2S2KSKz1qtwR;
        Tue, 14 Apr 2020 14:21:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id rNk4_VJNvrpR; Tue, 14 Apr 2020 14:21:01 +0200 (CEST)
X-Auth-Info: 5dzKfWvNBd3NwLKzRXfzOxROzgSSHP0P4Sxb7XQ1rZU=
Received: from [127.0.0.1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue, 14 Apr 2020 14:21:01 +0200 (CEST)
Subject: Re: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     Amelie Delaunay <amelie.delaunay@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20200413143107.181669-1-marex@denx.de>
 <31b679d3-d3e4-0220-ec4b-58eada4d21d4@synopsys.com>
 <b20fb33d-7fdd-5785-8f72-74900eb4d328@denx.de>
 <9906c2da-8a20-eae7-d69e-6947085edf84@synopsys.com>
 <b64f41ac-2d70-55a3-ab6a-77383cd463eb@denx.de>
 <d1b36da4-b506-2f86-f5ad-95bf3aac4485@synopsys.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <c35e95cf-7f72-4a49-a0e1-efc0701d613d@denx.de>
Date:   Tue, 14 Apr 2020 14:18:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d1b36da4-b506-2f86-f5ad-95bf3aac4485@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/14/20 9:14 AM, Minas Harutyunyan wrote:
> Hi,
> 
> On 4/13/2020 9:00 PM, Marek Vasut wrote:
>> On 4/13/20 5:27 PM, Minas Harutyunyan wrote:
>>> Hi,
>>
>> Hi,
>>
>>> On 4/13/2020 6:54 PM, Marek Vasut wrote:
>>>> On 4/13/20 4:45 PM, Minas Harutyunyan wrote:
>>>>> Hi,
>>>>
>>>> Hi,
>>>>
>>>>> On 4/13/2020 6:31 PM, Marek Vasut wrote:
>>>>>> On STM32MP1 without the STUSB1600 USB-C chip (i.e. with plain USB-OTG
>>>>>
>>>>> Could you please provide GSNPSID, GHWCFG1-4 register values for STM32MP1.
>>>>
>>>> GSNPSID = 0x4f54330a
>>>> GHWCFG1 = 0x00000000
>>>> GHWCFG2 = 0x228fe150
>>>> GHWCFG3 = 0x03b892e8
>>>> GHWCFG4 = 0xe3f00030
>>>>
>>> STM32MP1 core doesn't support ACG feature: GHWCFG4_ACG_SUPPORTED = 0.
>>> So, in your patch for STM32MP1 at least these lines are no meaning:
>>>
>>> +	/* Enable ACG feature in device mode,if supported */
>>> +	dwc2_enable_acg(hsotg);
>>
>> The comment says it enables the ACG only if it's supported.
>>
>>> Looks like you just copied this chirp from dwc2_conn_id_status_change()
>>> function.
>>
>> Yes, that's correct, verbatim.
>>
>>> dwc2_hsotg_core_init_disconnected() function is device mode function,
>>> not sure that it's safe to call it for host mode in dwc2_hcd_init().
>>
>> OK well, if I don't use this patch and I plug in a USB cable from the
>> host PC, then the STM32MP1 isn't detected by the host PC. Do you have
>> any idea what the correct fix would be then ?
>>
> 
> Please provide without your patch:
> 1. debugfs: params and hw_params

# cat /sys/kernel/debug/usb/49000000.usb-otg/hw_params
op_mode                       : 0
arch                          : 2
dma_desc_enable               : 1
enable_dynamic_fifo           : 1
en_multiple_tx_fifo           : 1
rx_fifo_size                  : 1024
host_nperio_tx_fifo_size      : 1024
dev_nperio_tx_fifo_size       : 1024
host_perio_tx_fifo_size       : 1024
nperio_tx_q_depth             : 4
host_perio_tx_q_depth         : 4
dev_token_q_depth             : 8
max_transfer_size             : 524287
max_packet_count              : 1023
host_channels                 : 16
hs_phy_type                   : 1
fs_phy_type                   : 1
i2c_enable                    : 0
num_dev_ep                    : 8
num_dev_perio_in_ep           : 0
total_fifo_size               : 952
power_optimized               : 1
utmi_phy_data_width           : 0
snpsid                        : 0x4f54330a
dev_ep_dirs                   : 0x0

# cat /sys/kernel/debug/usb/49000000.usb-otg/params
otg_cap                       : 2
dma_desc_enable               : 0
dma_desc_fs_enable            : 0
speed                         : 0
enable_dynamic_fifo           : 1
en_multiple_tx_fifo           : 1
host_rx_fifo_size             : 440
host_nperio_tx_fifo_size      : 256
host_perio_tx_fifo_size       : 256
max_transfer_size             : 524287
max_packet_count              : 1023
host_channels                 : 16
phy_type                      : 1
phy_utmi_width                : 8
phy_ulpi_ddr                  : 0
phy_ulpi_ext_vbus             : 0
i2c_enable                    : 0
ipg_isoc_en                   : 0
ulpi_fs_ls                    : 0
host_support_fs_ls_low_power  : 0
host_ls_low_power_phy_clk     : 0
ts_dline                      : 0
reload_ctl                    : 1
ahbcfg                        : 0x2
uframe_sched                  : 1
external_id_pin_ctl           : 0
power_down                    : 0
lpm                           : 1
lpm_clock_gating              : 1
besl                          : 1
hird_threshold_en             : 1
hird_threshold                : 4
service_interval              : 0
host_dma                      : 1
g_dma                         : 1
g_dma_desc                    : 1
g_rx_fifo_size                : 256
g_np_tx_fifo_size             : 32
g_tx_fifo_size[0]             : 0
g_tx_fifo_size[1]             : 128
g_tx_fifo_size[2]             : 128
g_tx_fifo_size[3]             : 64
g_tx_fifo_size[4]             : 64
g_tx_fifo_size[5]             : 64
g_tx_fifo_size[6]             : 64
g_tx_fifo_size[7]             : 32
g_tx_fifo_size[8]             : 32
g_tx_fifo_size[9]             : 0
g_tx_fifo_size[10]            : 0
g_tx_fifo_size[11]            : 0
g_tx_fifo_size[12]            : 0
g_tx_fifo_size[13]            : 0
g_tx_fifo_size[14]            : 0
g_tx_fifo_size[15]            : 0

> 2. debug log

What kind of debug log ?

> 3. regdump before and after connecting device to host where issue seen.

Before:
# cat /sys/kernel/debug/usb/49000000.usb-otg/regdump
[  279.158994] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.165324] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.173123] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.180893] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.188640] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.196381] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.204120] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.211944] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.219671] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.227429] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.235172] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.242976] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.250717] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.258493] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.266266] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.273985] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.281769] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.289546] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.297319] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.305032] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.312816] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.320575] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.328357] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.336102] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.343840] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.351622] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.359414] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.367148] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.374886] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.382669] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.390457] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.398194] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.405934] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.413716] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.421494] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.429243] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.437004] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.444746] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.452550] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.460302] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.468055] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.475795] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.483596] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.491344] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.499104] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.506886] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.514608] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.522392] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.530153] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.537934] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.545656] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.553441] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.561208] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.568987] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.576731] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.584470] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.592259] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.600036] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.607782] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.615523] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.623304] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.631082] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.638831] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.646592] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.654334] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.662145] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.669884] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.677643] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.685383] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.693195] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.700928] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.708692] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.716473] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.724195] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.731979] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.739739] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.747519] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.755241] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.763034] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.770783] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.778567] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.786311] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.794050] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.801838] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.809613] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.817358] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.825097] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.832879] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.840657] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.848405] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.856175] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.863907] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.871711] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.879457] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.887217] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.894959] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.902768] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.910507] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.918266] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.926008] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.933810] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.941550] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.949316] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.957105] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.964818] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.972602] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.980365] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.988145] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  279.995867] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  280.003657] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  280.011407] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  280.019192] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  280.026937] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  280.034675] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  280.042458] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  280.050240] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  280.057995] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  280.065727] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  280.073512] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
GOTGCTL = 0x00010000
GOTGINT = 0x00000000
GAHBCFG = 0x00000023
GUSBCFG = 0x00001400
GRSTCTL = 0x80000000
GINTSTS = 0x04000020
GINTMSK = 0xd8000806
GRXSTSR = 0x00000000
GRXFSIZ = 0x00000400
GNPTXFSIZ = 0x04000400
GNPTXSTS = 0x00080400
GI2CCTL = 0x00000000
GPVNDCTL = 0x00000000
GGPIO = 0x00600000
GUID = 0x00004000
GSNPSID = 0x4f54330a
GHWCFG1 = 0x00000000
GHWCFG2 = 0x228fe150
GHWCFG3 = 0x03b892e8
GHWCFG4 = 0xe3f00030
GLPMCFG = 0x00000000
GPWRDN = 0x00200010
GDFIFOCFG = 0x03b80400
ADPCTL = 0x00000000
HPTXFSIZ = 0x00000000
DPTXFSIZN(1) = 0x04000800
DPTXFSIZN(2) = 0x04000c00
DPTXFSIZN(3) = 0x04001000
DPTXFSIZN(4) = 0x04001400
DPTXFSIZN(5) = 0x04001800
DPTXFSIZN(6) = 0x04001c00
DPTXFSIZN(7) = 0x04002000
DPTXFSIZN(8) = 0x04002400
DPTXFSIZN(9) = 0x04000800
DPTXFSIZN(10) = 0x04000c00
DPTXFSIZN(11) = 0x04001000
DPTXFSIZN(12) = 0x04001400
DPTXFSIZN(13) = 0x04001800
DPTXFSIZN(14) = 0x04001c00
DPTXFSIZN(15) = 0x04002000
DCFG = 0x08100000
DCTL = 0x00000002
DSTS = 0x00000002
DIEPMSK = 0x00000000
DOEPMSK = 0x00000000
DAINT = 0x00000000
DAINTMSK = 0x00000000
DTKNQR1 = 0x00000000
DTKNQR2 = 0x00000000
DTKNQR3 = 0x0c100020
DTKNQR4 = 0x00000000
DVBUSDIS = 0x000017d7
DVBUSPULSE = 0x000005b8
DIEPCTL(0) = 0x00008000
DIEPCTL(1) = 0x00000000
DIEPCTL(2) = 0x00000000
DIEPCTL(3) = 0x00000000
DIEPCTL(4) = 0x00000000
DIEPCTL(5) = 0x00000000
DIEPCTL(6) = 0x00000000
DIEPCTL(7) = 0x00000000
DIEPCTL(8) = 0x00000000
DIEPCTL(9) = 0x00000000
DIEPCTL(10) = 0x00000000
DIEPCTL(11) = 0x00000000
DIEPCTL(12) = 0x00000000
DIEPCTL(13) = 0x00000000
DIEPCTL(14) = 0x00000000
DIEPCTL(15) = 0x00000000
DOEPCTL(0) = 0x00008000
DOEPCTL(1) = 0x00000000
DOEPCTL(2) = 0x00000000
DOEPCTL(3) = 0x00000000
DOEPCTL(4) = 0x00000000
DOEPCTL(5) = 0x00000000
DOEPCTL(6) = 0x00000000
DOEPCTL(7) = 0x00000000
DOEPCTL(8) = 0x00000000
DOEPCTL(9) = 0x00000000
DOEPCTL(10) = 0x00000000
DOEPCTL(11) = 0x00000000
DOEPCTL(12) = 0x00000000
DOEPCTL(13) = 0x00000000
DOEPCTL(14) = 0x00000000
DOEPCTL(15) = 0x00000000
DIEPINT(0) = 0x00000080
DIEPINT(1) = 0x00000080
DIEPINT(2) = 0x00000080
DIEPINT(3) = 0x00000080
DIEPINT(4) = 0x00000080
DIEPINT(5) = 0x00000080
DIEPINT(6) = 0x00000080
DIEPINT(7) = 0x00000080
DIEPINT(8) = 0x00000080
DIEPINT(9) = 0x00000080
DIEPINT(10) = 0x00000080
DIEPINT(11) = 0x00000080
DIEPINT(12) = 0x00000080
DIEPINT(13) = 0x00000080
DIEPINT(14) = 0x00000080
DIEPINT(15) = 0x00000080
DOEPINT(0) = 0x00000000
DOEPINT(1) = 0x00000000
DOEPINT(2) = 0x00000000
DOEPINT(3) = 0x00000000
DOEPINT(4) = 0x00000000
DOEPINT(5) = 0x00000000
DOEPINT(6) = 0x00000000
DOEPINT(7) = 0x00000000
DOEPINT(8) = 0x00000000
DOEPINT(9) = 0x00000000
DOEPINT(10) = 0x00000000
DOEPINT(11) = 0x00000000
DOEPINT(12) = 0x00000000
DOEPINT(13) = 0x00000000
DOEPINT(14) = 0x00000000
DOEPINT(15) = 0x00000000
DIEPTSIZ(0) = 0x00000000
DIEPTSIZ(1) = 0x00000000
DIEPTSIZ(2) = 0x00000000
DIEPTSIZ(3) = 0x00000000
DIEPTSIZ(4) = 0x00000000
DIEPTSIZ(5) = 0x00000000
DIEPTSIZ(6) = 0x00000000
DIEPTSIZ(7) = 0x00000000
DIEPTSIZ(8) = 0x00000000
DIEPTSIZ(9) = 0x00000000
DIEPTSIZ(10) = 0x00000000
DIEPTSIZ(11) = 0x00000000
DIEPTSIZ(12) = 0x00000000
DIEPTSIZ(13) = 0x00000000
DIEPTSIZ(14) = 0x00000000
DIEPTSIZ(15) = 0x00000000
DOEPTSIZ(0) = 0x00000000
DOEPTSIZ(1) = 0x00000000
DOEPTSIZ(2) = 0x00000000
DOEPTSIZ(3) = 0x00000000
DOEPTSIZ(4) = 0x00000000
DOEPTSIZ(5) = 0x00000000
DOEPTSIZ(6) = 0x00000000
DOEPTSIZ(7) = 0x00000000
DOEPTSIZ(8) = 0x00000000
DOEPTSIZ(9) = 0x00000000
DOEPTSIZ(10) = 0x00000000
DOEPTSIZ(11) = 0x00000000
DOEPTSIZ(12) = 0x00000000
DOEPTSIZ(13) = 0x00000000
DOEPTSIZ(14) = 0x00000000
DOEPTSIZ(15) = 0x00000000
DIEPDMA(0) = 0x79daaf9c
DIEPDMA(1) = 0xc8ad1317
DIEPDMA(2) = 0xf56293e7
DIEPDMA(3) = 0x7e374f85
DIEPDMA(4) = 0xbe22b68d
DIEPDMA(5) = 0xa60f065a
DIEPDMA(6) = 0xbafafaf5
DIEPDMA(7) = 0x892900fb
DIEPDMA(8) = 0xa2c3caca
DIEPDMA(9) = 0x58d5ed04
DIEPDMA(10) = 0x58d5ed04
DIEPDMA(11) = 0x58d5ed04
DIEPDMA(12) = 0x58d5ed04
DIEPDMA(13) = 0x58d5ed04
DIEPDMA(14) = 0x58d5ed04
DIEPDMA(15) = 0x58d5ed04
DOEPDMA(0) = 0xa167db6c
DOEPDMA(1) = 0x681b357d
DOEPDMA(2) = 0x503148e2
DOEPDMA(3) = 0x9476575a
DOEPDMA(4) = 0xb098e0de
DOEPDMA(5) = 0xb8bc774f
DOEPDMA(6) = 0x58d5ed04
DOEPDMA(7) = 0x8fbaf0d9
DOEPDMA(8) = 0xe7b6af62
DOEPDMA(9) = 0x22f87fc6
DOEPDMA(10) = 0x22f87fc6
DOEPDMA(11) = 0x22f87fc6
DOEPDMA(12) = 0x22f87fc6
DOEPDMA(13) = 0x22f87fc6
DOEPDMA(14) = 0x22f87fc6
DOEPDMA(15) = 0x22f87fc6
DTXFSTS(0) = 0x00000400
DTXFSTS(1) = 0x00000400
DTXFSTS(2) = 0x00000400
DTXFSTS(3) = 0x00000400
DTXFSTS(4) = 0x00000400
DTXFSTS(5) = 0x00000400
DTXFSTS(6) = 0x00000400
DTXFSTS(7) = 0x00000400
DTXFSTS(8) = 0x00000400
DTXFSTS(9) = 0x00000400
DTXFSTS(10) = 0x00000400
DTXFSTS(11) = 0x00000400
DTXFSTS(12) = 0x00000400
DTXFSTS(13) = 0x00000400
DTXFSTS(14) = 0x00000400
DTXFSTS(15) = 0x00000400
PCGCTL = 0x00000000
HCFG = 0x00100000
HFIR = 0x000017d7
HFNUM = 0x00000000
HPTXSTS = 0x00080400
HAINT = 0x00000000
HAINTMSK = 0x00000000
HFLBADDR = 0x00000000
HPRT0 = 0x00000000
HCCHAR(0) = 0x00000000
HCCHAR(1) = 0x00000000
HCCHAR(2) = 0x00000000
HCCHAR(3) = 0x00000000
HCCHAR(4) = 0x00000000
HCCHAR(5) = 0x00000000
HCCHAR(6) = 0x00000000
HCCHAR(7) = 0x00000000
HCCHAR(8) = 0x00000000
HCCHAR(9) = 0x00000000
HCCHAR(10) = 0x00000000
HCCHAR(11) = 0x00000000
HCCHAR(12) = 0x00000000
HCCHAR(13) = 0x00000000
HCCHAR(14) = 0x00000000
HCCHAR(15) = 0x00000000
HCSPLT(0) = 0x00000000
HCSPLT(1) = 0x00000000
HCSPLT(2) = 0x00000000
HCSPLT(3) = 0x00000000
HCSPLT(4) = 0x00000000
HCSPLT(5) = 0x00000000
HCSPLT(6) = 0x00000000
HCSPLT(7) = 0x00000000
HCSPLT(8) = 0x00000000
HCSPLT(9) = 0x00000000
HCSPLT(10) = 0x00000000
HCSPLT(11) = 0x00000000
HCSPLT(12) = 0x00000000
HCSPLT(13) = 0x00000000
HCSPLT(14) = 0x00000000
HCSPLT(15) = 0x00000000
HCINT(0) = 0x00000000
HCINT(1) = 0x00000000
HCINT(2) = 0x00000000
HCINT(3) = 0x00000000
HCINT(4) = 0x00000000
HCINT(5) = 0x00000000
HCINT(6) = 0x00000000
HCINT(7) = 0x00000000
HCINT(8) = 0x00000000
HCINT(9) = 0x00000000
HCINT(10) = 0x00000000
HCINT(11) = 0x00000000
HCINT(12) = 0x00000000
HCINT(13) = 0x00000000
HCINT(14) = 0x00000000
HCINT(15) = 0x00000000
HCINTMSK(0) = 0x00000000
HCINTMSK(1) = 0x00000000
HCINTMSK(2) = 0x00000000
HCINTMSK(3) = 0x00000000
HCINTMSK(4) = 0x00000000
HCINTMSK(5) = 0x00000000
HCINTMSK(6) = 0x00000000
HCINTMSK(7) = 0x00000000
HCINTMSK(8) = 0x00000000
HCINTMSK(9) = 0x00000000
HCINTMSK(10) = 0x00000000
HCINTMSK(11) = 0x00000000
HCINTMSK(12) = 0x00000000
HCINTMSK(13) = 0x00000000
HCINTMSK(14) = 0x00000000
HCINTMSK(15) = 0x00000000
HCTSIZ(0) = 0x00000000
HCTSIZ(1) = 0x00000000
HCTSIZ(2) = 0x00000000
HCTSIZ(3) = 0x00000000
HCTSIZ(4) = 0x00000000
HCTSIZ(5) = 0x00000000
HCTSIZ(6) = 0x00000000
HCTSIZ(7) = 0x00000000
HCTSIZ(8) = 0x00000000
HCTSIZ(9) = 0x00000000
HCTSIZ(10) = 0x00000000
HCTSIZ(11) = 0x00000000
HCTSIZ(12) = 0x00000000
HCTSIZ(13) = 0x00000000
HCTSIZ(14) = 0x00000000
HCTSIZ(15) = 0x00000000
HCDMA(0) = 0xa167db6c
HCDMA(1) = 0x681b357d
HCDMA(2) = 0x503148e2
HCDMA(3) = 0x9476575a
HCDMA(4) = 0xb098e0de
HCDMA(5) = 0xb8bc774f
HCDMA(6) = 0x58d5ed04
HCDMA(7) = 0x8fbaf0d9
HCDMA(8) = 0xe7b6af62
HCDMA(9) = 0x22f87fc6
HCDMA(10) = 0x22f87fc6
HCDMA(11) = 0x22f87fc6
HCDMA(12) = 0x22f87fc6
HCDMA(13) = 0x22f87fc6
HCDMA(14) = 0x22f87fc6
HCDMA(15) = 0x22f87fc6
HCDMAB(0) = 0x22f87fc6
HCDMAB(1) = 0x22f87fc6
HCDMAB(2) = 0x22f87fc6
HCDMAB(3) = 0x22f87fc6
HCDMAB(4) = 0x22f87fc6
HCDMAB(5) = 0x22f87fc6
HCDMAB(6) = 0x22f87fc6
HCDMAB(7) = 0x22f87fc6
HCDMAB(8) = 0x22f87fc6
HCDMAB(9) = 0x22f87fc6
HCDMAB(10) = 0x22f87fc6
HCDMAB(11) = 0x22f87fc6
HCDMAB(12) = 0x22f87fc6
HCDMAB(13) = 0x22f87fc6
HCDMAB(14) = 0x22f87fc6
HCDMAB(15) = 0x22f87fc6

After:
# cat /sys/kernel/debug/usb/49000000.usb-otg/regdump
[  296.213397] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.219841] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.227521] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.235242] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.243052] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.250800] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.258577] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.266340] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.274070] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.281869] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.289618] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.297394] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.305120] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.312909] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.320697] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.328439] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.336215] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.343938] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.351725] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.359503] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.367261] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.374993] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.382798] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.390545] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.398321] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.406046] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.413833] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.421619] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.429362] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.437137] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.444863] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.452651] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.460430] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.468186] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.475920] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.483721] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.491473] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.499249] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.507001] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.514739] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.522551] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.530293] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.538068] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.545794] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.553582] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.561369] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.569117] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.576888] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.584614] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.592403] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.600180] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.607931] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.615672] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.623481] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.631230] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.639010] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.646754] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.654494] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.662296] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.670055] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.677826] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.685554] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.693342] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.701119] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.708871] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.716659] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.724377] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.732166] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.739943] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.747697] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.755436] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.763237] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.770997] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.778769] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.786522] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.794261] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.802062] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.809815] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.817601] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.825319] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.833108] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.840885] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.848635] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.856411] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.864139] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.871933] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.879709] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.887466] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.895195] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.902999] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.910749] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.918535] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.926278] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.934016] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.941818] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.949568] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.957344] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.965069] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.972874] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.980633] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.988388] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  296.996161] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  297.003886] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  297.011676] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  297.019463] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  297.027206] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  297.034944] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  297.042747] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  297.050499] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  297.058276] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  297.066003] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  297.073800] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  297.081572] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  297.089324] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  297.097099] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  297.104826] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  297.112615] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  297.120403] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
[  297.128145] dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently
in Device mode
GOTGCTL = 0x000d0000
GOTGINT = 0x00000000
GAHBCFG = 0x00000023
GUSBCFG = 0x00001400
GRSTCTL = 0x80000000
GINTSTS = 0x04000020
GINTMSK = 0xd8000806
GRXSTSR = 0x00000000
GRXFSIZ = 0x00000400
GNPTXFSIZ = 0x04000400
GNPTXSTS = 0x00080400
GI2CCTL = 0x00000000
GPVNDCTL = 0x00000000
GGPIO = 0x00600000
GUID = 0x00004000
GSNPSID = 0x4f54330a
GHWCFG1 = 0x00000000
GHWCFG2 = 0x228fe150
GHWCFG3 = 0x03b892e8
GHWCFG4 = 0xe3f00030
GLPMCFG = 0x00000000
GPWRDN = 0x00600010
GDFIFOCFG = 0x03b80400
ADPCTL = 0x00000000
HPTXFSIZ = 0x00000000
DPTXFSIZN(1) = 0x04000800
DPTXFSIZN(2) = 0x04000c00
DPTXFSIZN(3) = 0x04001000
DPTXFSIZN(4) = 0x04001400
DPTXFSIZN(5) = 0x04001800
DPTXFSIZN(6) = 0x04001c00
DPTXFSIZN(7) = 0x04002000
DPTXFSIZN(8) = 0x04002400
DPTXFSIZN(9) = 0x04000800
DPTXFSIZN(10) = 0x04000c00
DPTXFSIZN(11) = 0x04001000
DPTXFSIZN(12) = 0x04001400
DPTXFSIZN(13) = 0x04001800
DPTXFSIZN(14) = 0x04001c00
DPTXFSIZN(15) = 0x04002000
DCFG = 0x08100000
DCTL = 0x00000002
DSTS = 0x00000002
DIEPMSK = 0x00000000
DOEPMSK = 0x00000000
DAINT = 0x00000000
DAINTMSK = 0x00000000
DTKNQR1 = 0x00000000
DTKNQR2 = 0x00000000
DTKNQR3 = 0x0c100020
DTKNQR4 = 0x00000000
DVBUSDIS = 0x000017d7
DVBUSPULSE = 0x000005b8
DIEPCTL(0) = 0x00008000
DIEPCTL(1) = 0x00000000
DIEPCTL(2) = 0x00000000
DIEPCTL(3) = 0x00000000
DIEPCTL(4) = 0x00000000
DIEPCTL(5) = 0x00000000
DIEPCTL(6) = 0x00000000
DIEPCTL(7) = 0x00000000
DIEPCTL(8) = 0x00000000
DIEPCTL(9) = 0x00000000
DIEPCTL(10) = 0x00000000
DIEPCTL(11) = 0x00000000
DIEPCTL(12) = 0x00000000
DIEPCTL(13) = 0x00000000
DIEPCTL(14) = 0x00000000
DIEPCTL(15) = 0x00000000
DOEPCTL(0) = 0x00008000
DOEPCTL(1) = 0x00000000
DOEPCTL(2) = 0x00000000
DOEPCTL(3) = 0x00000000
DOEPCTL(4) = 0x00000000
DOEPCTL(5) = 0x00000000
DOEPCTL(6) = 0x00000000
DOEPCTL(7) = 0x00000000
DOEPCTL(8) = 0x00000000
DOEPCTL(9) = 0x00000000
DOEPCTL(10) = 0x00000000
DOEPCTL(11) = 0x00000000
DOEPCTL(12) = 0x00000000
DOEPCTL(13) = 0x00000000
DOEPCTL(14) = 0x00000000
DOEPCTL(15) = 0x00000000
DIEPINT(0) = 0x00000080
DIEPINT(1) = 0x00000080
DIEPINT(2) = 0x00000080
DIEPINT(3) = 0x00000080
DIEPINT(4) = 0x00000080
DIEPINT(5) = 0x00000080
DIEPINT(6) = 0x00000080
DIEPINT(7) = 0x00000080
DIEPINT(8) = 0x00000080
DIEPINT(9) = 0x00000080
DIEPINT(10) = 0x00000080
DIEPINT(11) = 0x00000080
DIEPINT(12) = 0x00000080
DIEPINT(13) = 0x00000080
DIEPINT(14) = 0x00000080
DIEPINT(15) = 0x00000080
DOEPINT(0) = 0x00000000
DOEPINT(1) = 0x00000000
DOEPINT(2) = 0x00000000
DOEPINT(3) = 0x00000000
DOEPINT(4) = 0x00000000
DOEPINT(5) = 0x00000000
DOEPINT(6) = 0x00000000
DOEPINT(7) = 0x00000000
DOEPINT(8) = 0x00000000
DOEPINT(9) = 0x00000000
DOEPINT(10) = 0x00000000
DOEPINT(11) = 0x00000000
DOEPINT(12) = 0x00000000
DOEPINT(13) = 0x00000000
DOEPINT(14) = 0x00000000
DOEPINT(15) = 0x00000000
DIEPTSIZ(0) = 0x00000000
DIEPTSIZ(1) = 0x00000000
DIEPTSIZ(2) = 0x00000000
DIEPTSIZ(3) = 0x00000000
DIEPTSIZ(4) = 0x00000000
DIEPTSIZ(5) = 0x00000000
DIEPTSIZ(6) = 0x00000000
DIEPTSIZ(7) = 0x00000000
DIEPTSIZ(8) = 0x00000000
DIEPTSIZ(9) = 0x00000000
DIEPTSIZ(10) = 0x00000000
DIEPTSIZ(11) = 0x00000000
DIEPTSIZ(12) = 0x00000000
DIEPTSIZ(13) = 0x00000000
DIEPTSIZ(14) = 0x00000000
DIEPTSIZ(15) = 0x00000000
DOEPTSIZ(0) = 0x00000000
DOEPTSIZ(1) = 0x00000000
DOEPTSIZ(2) = 0x00000000
DOEPTSIZ(3) = 0x00000000
DOEPTSIZ(4) = 0x00000000
DOEPTSIZ(5) = 0x00000000
DOEPTSIZ(6) = 0x00000000
DOEPTSIZ(7) = 0x00000000
DOEPTSIZ(8) = 0x00000000
DOEPTSIZ(9) = 0x00000000
DOEPTSIZ(10) = 0x00000000
DOEPTSIZ(11) = 0x00000000
DOEPTSIZ(12) = 0x00000000
DOEPTSIZ(13) = 0x00000000
DOEPTSIZ(14) = 0x00000000
DOEPTSIZ(15) = 0x00000000
DIEPDMA(0) = 0x79daaf9c
DIEPDMA(1) = 0xc8ad1317
DIEPDMA(2) = 0xf56293e7
DIEPDMA(3) = 0x7e374f85
DIEPDMA(4) = 0xbe22b68d
DIEPDMA(5) = 0xa60f065a
DIEPDMA(6) = 0xbafafaf5
DIEPDMA(7) = 0x892900fb
DIEPDMA(8) = 0xa2c3caca
DIEPDMA(9) = 0x58d5ed04
DIEPDMA(10) = 0x58d5ed04
DIEPDMA(11) = 0x58d5ed04
DIEPDMA(12) = 0x58d5ed04
DIEPDMA(13) = 0x58d5ed04
DIEPDMA(14) = 0x58d5ed04
DIEPDMA(15) = 0x58d5ed04
DOEPDMA(0) = 0xa167db6c
DOEPDMA(1) = 0x681b357d
DOEPDMA(2) = 0x503148e2
DOEPDMA(3) = 0x9476575a
DOEPDMA(4) = 0xb098e0de
DOEPDMA(5) = 0xb8bc774f
DOEPDMA(6) = 0x58d5ed04
DOEPDMA(7) = 0x8fbaf0d9
DOEPDMA(8) = 0xe7b6af62
DOEPDMA(9) = 0x22f87fc6
DOEPDMA(10) = 0x22f87fc6
DOEPDMA(11) = 0x22f87fc6
DOEPDMA(12) = 0x22f87fc6
DOEPDMA(13) = 0x22f87fc6
DOEPDMA(14) = 0x22f87fc6
DOEPDMA(15) = 0x22f87fc6
DTXFSTS(0) = 0x00000400
DTXFSTS(1) = 0x00000400
DTXFSTS(2) = 0x00000400
DTXFSTS(3) = 0x00000400
DTXFSTS(4) = 0x00000400
DTXFSTS(5) = 0x00000400
DTXFSTS(6) = 0x00000400
DTXFSTS(7) = 0x00000400
DTXFSTS(8) = 0x00000400
DTXFSTS(9) = 0x00000400
DTXFSTS(10) = 0x00000400
DTXFSTS(11) = 0x00000400
DTXFSTS(12) = 0x00000400
DTXFSTS(13) = 0x00000400
DTXFSTS(14) = 0x00000400
DTXFSTS(15) = 0x00000400
PCGCTL = 0x00000000
HCFG = 0x00100000
HFIR = 0x000017d7
HFNUM = 0x00000000
HPTXSTS = 0x00080400
HAINT = 0x00000000
HAINTMSK = 0x00000000
HFLBADDR = 0x00000000
HPRT0 = 0x00000000
HCCHAR(0) = 0x00000000
HCCHAR(1) = 0x00000000
HCCHAR(2) = 0x00000000
HCCHAR(3) = 0x00000000
HCCHAR(4) = 0x00000000
HCCHAR(5) = 0x00000000
HCCHAR(6) = 0x00000000
HCCHAR(7) = 0x00000000
HCCHAR(8) = 0x00000000
HCCHAR(9) = 0x00000000
HCCHAR(10) = 0x00000000
HCCHAR(11) = 0x00000000
HCCHAR(12) = 0x00000000
HCCHAR(13) = 0x00000000
HCCHAR(14) = 0x00000000
HCCHAR(15) = 0x00000000
HCSPLT(0) = 0x00000000
HCSPLT(1) = 0x00000000
HCSPLT(2) = 0x00000000
HCSPLT(3) = 0x00000000
HCSPLT(4) = 0x00000000
HCSPLT(5) = 0x00000000
HCSPLT(6) = 0x00000000
HCSPLT(7) = 0x00000000
HCSPLT(8) = 0x00000000
HCSPLT(9) = 0x00000000
HCSPLT(10) = 0x00000000
HCSPLT(11) = 0x00000000
HCSPLT(12) = 0x00000000
HCSPLT(13) = 0x00000000
HCSPLT(14) = 0x00000000
HCSPLT(15) = 0x00000000
HCINT(0) = 0x00000000
HCINT(1) = 0x00000000
HCINT(2) = 0x00000000
HCINT(3) = 0x00000000
HCINT(4) = 0x00000000
HCINT(5) = 0x00000000
HCINT(6) = 0x00000000
HCINT(7) = 0x00000000
HCINT(8) = 0x00000000
HCINT(9) = 0x00000000
HCINT(10) = 0x00000000
HCINT(11) = 0x00000000
HCINT(12) = 0x00000000
HCINT(13) = 0x00000000
HCINT(14) = 0x00000000
HCINT(15) = 0x00000000
HCINTMSK(0) = 0x00000000
HCINTMSK(1) = 0x00000000
HCINTMSK(2) = 0x00000000
HCINTMSK(3) = 0x00000000
HCINTMSK(4) = 0x00000000
HCINTMSK(5) = 0x00000000
HCINTMSK(6) = 0x00000000
HCINTMSK(7) = 0x00000000
HCINTMSK(8) = 0x00000000
HCINTMSK(9) = 0x00000000
HCINTMSK(10) = 0x00000000
HCINTMSK(11) = 0x00000000
HCINTMSK(12) = 0x00000000
HCINTMSK(13) = 0x00000000
HCINTMSK(14) = 0x00000000
HCINTMSK(15) = 0x00000000
HCTSIZ(0) = 0x00000000
HCTSIZ(1) = 0x00000000
HCTSIZ(2) = 0x00000000
HCTSIZ(3) = 0x00000000
HCTSIZ(4) = 0x00000000
HCTSIZ(5) = 0x00000000
HCTSIZ(6) = 0x00000000
HCTSIZ(7) = 0x00000000
HCTSIZ(8) = 0x00000000
HCTSIZ(9) = 0x00000000
HCTSIZ(10) = 0x00000000
HCTSIZ(11) = 0x00000000
HCTSIZ(12) = 0x00000000
HCTSIZ(13) = 0x00000000
HCTSIZ(14) = 0x00000000
HCTSIZ(15) = 0x00000000
HCDMA(0) = 0xa167db6c
HCDMA(1) = 0x681b357d
HCDMA(2) = 0x503148e2
HCDMA(3) = 0x9476575a
HCDMA(4) = 0xb098e0de
HCDMA(5) = 0xb8bc774f
HCDMA(6) = 0x58d5ed04
HCDMA(7) = 0x8fbaf0d9
HCDMA(8) = 0xe7b6af62
HCDMA(9) = 0x22f87fc6
HCDMA(10) = 0x22f87fc6
HCDMA(11) = 0x22f87fc6
HCDMA(12) = 0x22f87fc6
HCDMA(13) = 0x22f87fc6
HCDMA(14) = 0x22f87fc6
HCDMA(15) = 0x22f87fc6
HCDMAB(0) = 0x22f87fc6
HCDMAB(1) = 0x22f87fc6
HCDMAB(2) = 0x22f87fc6
HCDMAB(3) = 0x22f87fc6
HCDMAB(4) = 0x22f87fc6
HCDMAB(5) = 0x22f87fc6
HCDMAB(6) = 0x22f87fc6
HCDMAB(7) = 0x22f87fc6
HCDMAB(8) = 0x22f87fc6
HCDMAB(9) = 0x22f87fc6
HCDMAB(10) = 0x22f87fc6
HCDMAB(11) = 0x22f87fc6
HCDMAB(12) = 0x22f87fc6
HCDMAB(13) = 0x22f87fc6
HCDMAB(14) = 0x22f87fc6
HCDMAB(15) = 0x22f87fc6


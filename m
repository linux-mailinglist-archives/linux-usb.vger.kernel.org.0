Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 561F979B491
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 02:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242114AbjIKVik (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 17:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242802AbjIKQVe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 12:21:34 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D4BBCC3
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 09:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=s31663417; t=1694449281; x=1695054081; i=wahrenst@gmx.net;
 bh=NvqO3KC1wNAEk/Jb8bPaBtj9zEeDASpV2PNYb62ULlo=;
 h=X-UI-Sender-Class:Date:To:Cc:From:Subject;
 b=VMTdfWov3RC1UzSXXmsepYOx4d7AclwSKoMIbZDHIhZyHdpeZXUj5Q1h71GF4Ak8HzYvPAu
 h6PUZn1Y8vsY5vw9NJk8X86ZZNwqUyDtxKBxbId68IpalguoKxfUbH/ELiBl3mrIfswD3OV+p
 cCOx7mT0zcD9nyB+svyAfWbsLbTFY7IOy52N6PL1miPTFQOOELQ1D/uJVc7vzvth/F/8RCZc5
 PD6zaef5jryuvpUt1mqDxeujX1ZT5Lgo9mOfOoYMKRCNGzNWLm2i0r2DfL/XDQMfz59uxG2kq
 oNC5Z/h/mV2qc14PvO3qNXsRUFQREEkWY5vy/2hkSp19jcNY2Wnw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4JmN-1qfSgC2FaT-000LML; Mon, 11
 Sep 2023 18:21:21 +0200
Message-ID: <9a95f6f0-d00b-d1ca-3e38-f7436f8558b3@gmx.net>
Date:   Mon, 11 Sep 2023 18:21:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To:     Minas Harutyunyan <hminas@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From:   Stefan Wahren <wahrenst@gmx.net>
Subject: dwc2: USB host broken if device is plugged in during boot
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:exvG2pV3Gt6GevG2pojIRzpvaWxvInTtUMwVDFp82qIuhumpmpy
 GjTEvhnRcKzGQtGrIevNMk67XfP+6NTTt0WF8Qppl6eCkFtBLf3JOjvffDRNAdAgGMQ8bM5
 l9aF8VGZ7oqR9kcWcLCs0sYk9OTLxg80aYZr1vY0NeeKOAPRXcHYTA2NelCO3XY6o8zB7C4
 fkLq43hRiyg8QwGfjz6EQ==
UI-OutboundReport: notjunk:1;M01:P0:GG7l7/cJ7Hs=;GeeSb+aYsvPmgtA95WwjExRUqpT
 snlM5a0S3LCftcV6KwQBovjdkr2+h75H81VrFJJeeKZl80MDH1o4zCnbkuRWWFF6zvbSPT2ii
 3EzH/LAgE3s8ozMMVlavN9JFKu9s2McslNhm3LBOdZhQQyAG0OHdvdA+3LW/dWHH9IG90uzzE
 VVSeBX7sqaeFeq6sH7AjD22j8dSI87GjTBgxsikMBvZ4OTk3mfGpd6XCLbaAVnfuoYWKLxw4t
 pBlofL5EwNUIQdE0DEoyp+h/+q4MsxTJP2SrxN4JMfz3jISFqDlQ/tPxjXzdyr/+69cusAMx7
 yuFQLcsFw8Xnv8jng0GKrp1MUz9fpM6LBR7OgNfJsHr1b/WkXH1cuBlPr+f8pXGj0td7lkF8d
 Tn3CGFtieX0Q19KI7XCCnoMaBO9HMkJFF4v9esHo/vT4p72hEwfWME3pvntGLxyZrjhtJnHk1
 2WbptzfY3ufJ4OfvOHHnGcYPd+I/nMUiHhIBPIPqZmBghvsYvw52gTI63oHagMg4tqdOGRS5F
 bV7lb584ZqeYNfAQNWI/btFLwV+YGHGLXhnfkc7YXupTzQGvAFrJ/NRADmR6lAX638k3OOXCF
 qh6nb/qPCbk35YjS/eGgX6KMes5IX/gLDn9i0iOLdnc35C306flVyoenD1oNt5m+TqNNMTMiw
 tkmq140jq65pfpXVxKCKZBcXYNDiHogK0mtvhUG1OKiC9YucZ9BY9JAl2xoYJLWrk18HPOrAp
 T/c6KydHv6H7PZD5UV/7yE1hu8a0dsIJbeXXenUP6gcK3RZ1JrSuLhpuqDTTVVfzhfPtFjJUj
 MeF5R+3JbMDEm+SnUt7nxBdKFon9iSpVtuLGzqTyBSOBJFM8PE46d9Xw0CEMNZgjYGMNSDemk
 XJNRLl/BFp+OvYUe4GkQsvOzaiZsbtHn9UTQSqn+B/eyDXojidoSVBOW/QqQO8JKyIaHYbJVv
 l9mfhu2nMTYiJFvnZTfwxqrWNS4=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

i want to report an very old issue (AFAIK this never worked) on Rasberry
Pi boards without onboard USB hub (e.g. Rpi 3 A+ or Zero). In case a USB
device like mouse or keyboard was connected during boot of the board,
USB wasn't functional (device powered, but no reaction to input). A
reconnect of the USB device doesn't have any effect.

The other Raspberry Pi boards like Rpi 3 B+ are not affected by this issue=
.

In older Kernel versions there were some log messages which made it
clear something is wrong. Example Linux 5.11 (arm/multi_v7_defconfig on
Raspberry Pi 3 A+):

[=C2=A0=C2=A0=C2=A0 4.585706] dwc2 3f980000.usb: supply vusb_d not found, =
using dummy
regulator
[=C2=A0=C2=A0=C2=A0 4.605224] dwc2 3f980000.usb: supply vusb_a not found, =
using dummy
regulator
[=C2=A0=C2=A0=C2=A0 4.685398] dwc2 3f980000.usb: DWC OTG Controller
[=C2=A0=C2=A0=C2=A0 4.702017] dwc2 3f980000.usb: new USB bus registered, a=
ssigned bus
number 1
[=C2=A0=C2=A0=C2=A0 4.721035] dwc2 3f980000.usb: irq 66, io mem 0x3f980000
[=C2=A0=C2=A0=C2=A0 4.739097] hub 1-0:1.0: USB hub found
[=C2=A0=C2=A0=C2=A0 4.748986] hub 1-0:1.0: 1 port detected
...
[=C2=A0=C2=A0=C2=A0 5.664614] usb 1-1: new full-speed USB device number 2 =
using dwc2
[=C2=A0=C2=A0=C2=A0 5.675148] systemd[1]: Detected architecture arm.
[=C2=A0=C2=A0=C2=A0 5.688658] dwc2 3f980000.usb: dwc2_hc_chhltd_intr_dma: =
Channel 1 -
ChHltd set, but reason is unknown
[=C2=A0=C2=A0=C2=A0 5.714073] dwc2 3f980000.usb: hcint 0x00000002, intsts =
0x04000029
[=C2=A0=C2=A0=C2=A0 5.726850] dwc2 3f980000.usb: dwc2_hc_chhltd_intr_dma: =
Channel 2 -
ChHltd set, but reason is unknown
[=C2=A0=C2=A0=C2=A0 5.742845] dwc2 3f980000.usb: hcint 0x00000002, intsts =
0x04000029
[=C2=A0=C2=A0=C2=A0 5.755884] dwc2 3f980000.usb: dwc2_hc_chhltd_intr_dma: =
Channel 3 -
ChHltd set, but reason is unknown
[=C2=A0=C2=A0=C2=A0 5.771940] dwc2 3f980000.usb: hcint 0x00000002, intsts =
0x04000029
[=C2=A0=C2=A0=C2=A0 5.784869] dwc2 3f980000.usb: dwc2_hc_chhltd_intr_dma: =
Channel 4 -
ChHltd set, but reason is unknown
[=C2=A0=C2=A0=C2=A0 5.800977] dwc2 3f980000.usb: hcint 0x00000002, intsts =
0x04000029
[=C2=A0=C2=A0=C2=A0 5.813999] dwc2 3f980000.usb: dwc2_hc_chhltd_intr_dma: =
Channel 5 -
ChHltd set, but reason is unknown
[=C2=A0=C2=A0=C2=A0 5.830259] dwc2 3f980000.usb: hcint 0x00000002, intsts =
0x04000029
[=C2=A0=C2=A0=C2=A0 5.843498] dwc2 3f980000.usb: dwc2_hc_chhltd_intr_dma: =
Channel 6 -
ChHltd set, but reason is unknown
[=C2=A0=C2=A0=C2=A0 5.859894] dwc2 3f980000.usb: hcint 0x00000002, intsts =
0x04000029
[=C2=A0=C2=A0=C2=A0 5.859906] dwc2 3f980000.usb: dwc2_hc_chhltd_intr_dma: =
Channel 7 -
ChHltd set, but reason is unknown
[=C2=A0=C2=A0=C2=A0 5.859911] dwc2 3f980000.usb: hcint 0x00000002, intsts =
0x04000029
[=C2=A0=C2=A0=C2=A0 5.902928] dwc2 3f980000.usb: dwc2_hc_chhltd_intr_dma: =
Channel 0 -
ChHltd set, but reason is unknown
[=C2=A0=C2=A0=C2=A0 5.919390] dwc2 3f980000.usb: hcint 0x00000002, intsts =
0x04000029
[=C2=A0=C2=A0=C2=A0 5.962043] systemd[1]: Set hostname to <raspberrypi>.
[=C2=A0=C2=A0=C2=A0 6.134632] usb 1-1: device descriptor read/64, error -7=
1

In recent Kernel versions like Linux 6.6-rc1 (arm/multi_v7_defconfig on
Raspberry Pi 3 A+) this issue is more subtle and takes some time or
unplugging to appear in the kernel log:

[=C2=A0=C2=A0=C2=A0 4.045700] dwc2 3f980000.usb: supply vusb_d not found, =
using dummy
regulator
[=C2=A0=C2=A0=C2=A0 4.056537] dwc2 3f980000.usb: supply vusb_a not found, =
using dummy
regulator
[=C2=A0=C2=A0=C2=A0 4.118096] dwc2 3f980000.usb: DWC OTG Controller
[=C2=A0=C2=A0=C2=A0 4.130409] dwc2 3f980000.usb: new USB bus registered, a=
ssigned bus
number 1
[=C2=A0=C2=A0=C2=A0 4.145053] dwc2 3f980000.usb: irq 66, io mem 0x3f980000
[=C2=A0=C2=A0=C2=A0 4.158863] hub 1-0:1.0: USB hub found
[=C2=A0=C2=A0=C2=A0 4.166793] hub 1-0:1.0: 1 port detected
[=C2=A0=C2=A0=C2=A0 4.180552] clk: Disabling unused clocks
...
[=C2=A0=C2=A0 46.124104] irq 66: nobody cared (try booting with the "irqpo=
ll" option)
[=C2=A0=C2=A0 46.124127] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.6.0-r=
c1 #75
[=C2=A0=C2=A0 46.124135] Hardware name: BCM2835
[=C2=A0=C2=A0 46.124147]=C2=A0 unwind_backtrace from show_stack+0x10/0x14
[=C2=A0=C2=A0 46.124169]=C2=A0 show_stack from dump_stack_lvl+0x40/0x4c
[=C2=A0=C2=A0 46.124186]=C2=A0 dump_stack_lvl from __report_bad_irq+0x38/0=
xc0
[=C2=A0=C2=A0 46.124204]=C2=A0 __report_bad_irq from note_interrupt+0x2ac/=
0x2f4
[=C2=A0=C2=A0 46.124222]=C2=A0 note_interrupt from handle_irq_event+0x88/0=
x8c
[=C2=A0=C2=A0 46.124238]=C2=A0 handle_irq_event from handle_level_irq+0xb4=
/0x1ac
[=C2=A0=C2=A0 46.124251]=C2=A0 handle_level_irq from generic_handle_domain=
_irq+0x24/0x34
[=C2=A0=C2=A0 46.124262]=C2=A0 generic_handle_domain_irq from bcm2835_hand=
le_irq+0x78/0x138
[=C2=A0=C2=A0 46.124278]=C2=A0 bcm2835_handle_irq from generic_handle_doma=
in_irq+0x24/0x34
[=C2=A0=C2=A0 46.124291]=C2=A0 generic_handle_domain_irq from
generic_handle_arch_irq+0x34/0x44
[=C2=A0=C2=A0 46.124306]=C2=A0 generic_handle_arch_irq from __irq_svc+0x88=
/0xb0
[=C2=A0=C2=A0 46.124319] Exception stack(0xc1b01f18 to 0xc1b01f60)
[=C2=A0=C2=A0 46.124326]
1f00:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0001edf4
00000001
[=C2=A0=C2=A0 46.124333] 1f20: 00000000 00000000 c1b09800 c1d593e0 c1b04d1=
8
c1a59ea8 c1b04d70 00000000
[=C2=A0=C2=A0 46.124341] 1f40: 00000000 00000000 c1d58cd8 c1b01f68 c114d98=
c
c114ed40 60000013 ffffffff
[=C2=A0=C2=A0 46.124347]=C2=A0 __irq_svc from default_idle_call+0x1c/0xb0
[=C2=A0=C2=A0 46.124361]=C2=A0 default_idle_call from do_idle+0x220/0x288
[=C2=A0=C2=A0 46.124378]=C2=A0 do_idle from cpu_startup_entry+0x18/0x1c
[=C2=A0=C2=A0 46.124392]=C2=A0 cpu_startup_entry from rest_init+0xac/0xb0
[=C2=A0=C2=A0 46.124407]=C2=A0 rest_init from arch_post_acpi_subsys_init+0=
x0/0x8
[=C2=A0=C2=A0 46.124430] handlers:
[=C2=A0=C2=A0 46.124433] [<d1c592c3>] dwc2_handle_common_intr
[=C2=A0=C2=A0 46.124448] [<6d3c6da4>] usb_hcd_irq
[=C2=A0=C2=A0 46.124457] Disabling IRQ #66

Until now the workaround to avoid this issue was to boot the board first
and connect the device later. It would be nice to get some instruction
to narrow this down and solve this issue.

Best regards

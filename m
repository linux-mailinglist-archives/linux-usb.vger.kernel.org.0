Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48ABC14506
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 09:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725846AbfEFHLo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 03:11:44 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35720 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbfEFHLo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 03:11:44 -0400
Received: by mail-wr1-f65.google.com with SMTP id w12so2339174wrp.2
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 00:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=PYcGHYejom3YaJRFG+vdIcIcyzTu+RPad3rfQ5D25Zo=;
        b=PmJsfoyxYE5tO0ZxAHgXqWLHEozunIB1VttG9iWgaw0BfZIGWyiR91K8D9Yw+Ic6YV
         eazL9GqE5htk8n9MuLxmIb+0MbtItGa6/aSWAxnIf2ncgkCAcFcNdCp8VacMjiiVQGKp
         9HoUbon0xRc1HL5Ol5xgFv4U3qoOsowmuRr5+MBSgqhpqkFyNrjsszTWlp+chSrdZGng
         BEMm1SdxcosZaoGOQ4nd8jECIesBb00FstTBmBk9/zJkhW0olcCxQMhEfXDaM2PXzFGf
         GoX2vALWRrxs0aYICkM47u44wwPVXRw3mqSKW4Jaunf2v+pUyl0CCwX9Z+S3mNoipWko
         aTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=PYcGHYejom3YaJRFG+vdIcIcyzTu+RPad3rfQ5D25Zo=;
        b=tXaapZoYbrT+D9V/2macbO58dGxWAOgnKZLcXvi8PggF6L8WpZsJ1STifFYy4aYSgr
         qc0u1hndS/9gGuLRgIpz3p5AnyCJHQWYHjZAUM6j4wP8YyM8sZNsAIXMGK0VKsXoCa6f
         9mSnmN9MMXxDnpu/m+rQKnnugYlb0kGZBxtVc3EcVYOn/vRpgggRTBYu0wCwRNOdXjtg
         YvIfFcOIX4V3naUNEiDMf7+d7L57k2mRaGXOQA8aJUPCMbAiEdVQa43ATyTyVMmei5Qi
         +YNQgU/ex2+Tu8MrXgrhURethJWhHYG00yn7enCco4te5gsVpLXd0VA/k5BEXZt50W99
         JRUA==
X-Gm-Message-State: APjAAAVLY6GBI4Vvasz3tP1fV2/vTikA0H5T8ScBxP3iDs2g0TCZK666
        3A6/IpUia08Y6RjQI0rFmdM=
X-Google-Smtp-Source: APXvYqxiI4+3WJn7efB+arm6Sy90nhNAAA+xUM/5+GX56yd6HJlTu2u6+X+UMO1hr3Sbju/MId+Ttg==
X-Received: by 2002:a5d:67cb:: with SMTP id n11mr16712690wrw.3.1557126702004;
        Mon, 06 May 2019 00:11:42 -0700 (PDT)
Received: from [192.168.99.70] (mail.unidataz.cz. [193.165.148.130])
        by smtp.googlemail.com with ESMTPSA id z14sm1202793wrr.34.2019.05.06.00.11.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 00:11:40 -0700 (PDT)
From:   "StarostaCZ@gmail.com" <starostacz@gmail.com>
X-Google-Original-From: "StarostaCZ@gmail.com" <StarostaCZ@gmail.com>
Subject: Re: Linux crash when using FTDI FT232R USB to serial converter on AMD
 boards.
To:     Joerg Roedel <joro@8bytes.org>, Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
        iommu@lists.linux-foundation.org
References: <04503197-a0a9-8b35-6c65-c10f296aab57@gmail.com>
 <20190429094847.GI26546@localhost> <20190503153716.GE11605@8bytes.org>
Message-ID: <8748125e-f360-ff0e-ea15-699bce9e7747@gmail.com>
Date:   Mon, 6 May 2019 09:10:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503153716.GE11605@8bytes.org>
Content-Type: multipart/mixed;
 boundary="------------ED2EC226B656C966A979755E"
Content-Language: cs
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------ED2EC226B656C966A979755E
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 7bit

New test on kernel Linux version 5.1.0-050100-generic. Same problem, 
system crash after a few seconds.
Full kern.log: https://paste.ee/p/EmLsw
I can do access to my pc through SSH if useful.

starosta

Dne 3.5.2019 v 17:37 Joerg Roedel napsal(a):
> On Mon, Apr 29, 2019 at 11:48:47AM +0200, Johan Hovold wrote:
>> So this is a debian 4.18 kernel seemingly crashing due to a xhci or
>> iommu issue.
>>
>> Can you reproduce this on a mainline kernel?
>>
>> If so, please post the corresponding logs to the lists and CC the xhci
>> and iommu maintainers (added to CC).
> Your kernel is probably missing this upstream fix:
>
> 	4e50ce03976f iommu/amd: fix sg->dma_address for sg->offset bigger than PAGE_SIZE
>
> Regards,
>
> 	Joerg
>


--------------ED2EC226B656C966A979755E
Content-Type: text/plain; charset=UTF-8;
 name="kern.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="kern.log"

May  6 08:35:39 test-ubnt kernel: [    0.000000] Linux version 5.1.0-0501=
00-generic (kernel@gloin) (gcc version 8.3.0 (Ubuntu 8.3.0-7ubuntu1)) #20=
1905052130 SMP Mon May 6 01:32:59 UTC 2019
May  6 08:35:39 test-ubnt kernel: [    0.000000] Command line: BOOT_IMAGE=
=3D/boot/vmlinuz-5.1.0-050100-generic root=3DUUID=3D91232716-4b81-4e1d-9d=
58-c2ad4d090e93 ro
=2E..
May  6 08:37:31 test-ubnt kernel: [  123.968163] usbserial: USB Serial de=
registering driver FTDI USB Serial Device
May  6 08:37:31 test-ubnt kernel: [  123.968416] ftdi_sio ttyUSB0: FTDI U=
SB Serial Device converter now disconnected from ttyUSB0
May  6 08:37:31 test-ubnt kernel: [  123.968438] usbcore: deregistering i=
nterface driver ftdi_sio
May  6 08:37:31 test-ubnt kernel: [  123.968504] ftdi_sio 1-9:1.0: device=
 disconnected
May  6 08:37:36 test-ubnt kernel: [  129.425748] xhci_hcd 0000:01:00.0: W=
ARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
May  6 08:37:36 test-ubnt kernel: [  129.597852] xhci_hcd 0000:01:00.0: A=
MD-Vi: Event logged [IO_PAGE_FAULT domain=3D0x0000 address=3D0xffa02000 f=
lags=3D0x0020]
May  6 08:37:36 test-ubnt kernel: [  129.600253] xhci_hcd 0000:01:00.0: A=
MD-Vi: Event logged [IO_PAGE_FAULT domain=3D0x0000 address=3D0xffa26000 f=
lags=3D0x0020]
May  6 08:37:37 test-ubnt kernel: [  129.985262] xhci_hcd 0000:01:00.0: W=
ARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
May  6 08:37:37 test-ubnt kernel: [  130.157935] xhci_hcd 0000:01:00.0: A=
MD-Vi: Event logged [IO_PAGE_FAULT domain=3D0x0000 address=3D0xffb8a000 f=
lags=3D0x0020]
May  6 08:37:37 test-ubnt kernel: [  130.159739] xhci_hcd 0000:01:00.0: A=
MD-Vi: Event logged [IO_PAGE_FAULT domain=3D0x0000 address=3D0xff9f8000 f=
lags=3D0x0020]
May  6 08:37:37 test-ubnt kernel: [  130.544683] xhci_hcd 0000:01:00.0: W=
ARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
May  6 08:37:37 test-ubnt kernel: [  130.716992] xhci_hcd 0000:01:00.0: A=
MD-Vi: Event logged [IO_PAGE_FAULT domain=3D0x0000 address=3D0xfea16000 f=
lags=3D0x0020]
May  6 08:37:37 test-ubnt kernel: [  130.719369] xhci_hcd 0000:01:00.0: A=
MD-Vi: Event logged [IO_PAGE_FAULT domain=3D0x0000 address=3D0xffbfb000 f=
lags=3D0x0020]
May  6 08:37:38 test-ubnt kernel: [  131.104350] xhci_hcd 0000:01:00.0: W=
ARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
May  6 08:37:38 test-ubnt kernel: [  131.279479] xhci_hcd 0000:01:00.0: A=
MD-Vi: Event logged [IO_PAGE_FAULT domain=3D0x0000 address=3D0xffa3c000 f=
lags=3D0x0020]
May  6 08:37:38 test-ubnt kernel: [  131.664426] xhci_hcd 0000:01:00.0: W=
ARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
May  6 08:37:38 test-ubnt kernel: [  131.837112] xhci_hcd 0000:01:00.0: A=
MD-Vi: Event logged [IO_PAGE_FAULT domain=3D0x0000 address=3D0xffa32000 f=
lags=3D0x0020]
May  6 08:37:38 test-ubnt kernel: [  131.839540] xhci_hcd 0000:01:00.0: A=
MD-Vi: Event logged [IO_PAGE_FAULT domain=3D0x0000 address=3D0xffc5d000 f=
lags=3D0x0020]
May  6 08:37:39 test-ubnt kernel: [  132.223953] xhci_hcd 0000:01:00.0: W=
ARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
May  6 08:37:39 test-ubnt kernel: [  132.397215] xhci_hcd 0000:01:00.0: A=
MD-Vi: Event logged [IO_PAGE_FAULT domain=3D0x0000 address=3D0xffc46000 f=
lags=3D0x0020]
May  6 08:37:39 test-ubnt kernel: [  132.398608] amd_iommu_report_page_fa=
ult: 5 callbacks suppressed
=2E..
May  6 08:38:07 test-ubnt kernel: [  160.289771] xhci_hcd 0000:01:00.0: A=
MD-Vi: Event logged [IO_PAGE_FAULT domain=3D0x0000 address=3D0xfa532000 f=
lags=3D0x0020]
May  6 08:38:07 test-ubnt kernel: [  160.292232] xhci_hcd 0000:01:00.0: A=
MD-Vi: Event logged [IO_PAGE_FAULT domain=3D0x0000 address=3D0xfa53d000 f=
lags=3D0x0020]
May  6 08:38:07 test-ubnt kernel: [  160.677243] xhci_hcd 0000:01:00.0: W=
ARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
May  6 08:38:07 test-ubnt kernel: [  160.849877] xhci_hcd 0000:01:00.0: A=
MD-Vi: Event logged [IO_PAGE_FAULT domain=3D0x0000 address=3D0xfa532000 f=
lags=3D0x0020]
May  6 08:38:07 test-ubnt kernel: [  160.852303] xhci_hcd 0000:01:00.0: A=
MD-Vi: Event logged [IO_PAGE_FAULT domain=3D0x0000 address=3D0xffc70000 f=
lags=3D0x0020]
May  6 08:38:08 test-ubnt kernel: [  161.237342] xhci_hcd 0000:01:00.0: W=
ARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
May  6 08:38:08 test-ubnt kernel: [  161.412400] xhci_hcd 0000:01:00.0: A=
MD-Vi: Event logged [IO_PAGE_FAULT domain=3D0x0000 address=3D0xfe8f0000 f=
lags=3D0x0020]
May  6 08:38:08 test-ubnt kernel: [  161.562930] general protection fault=
: 0000 [#1] SMP NOPTI
May  6 08:38:08 test-ubnt kernel: [  161.563709] CPU: 0 PID: 1632 Comm: r=
eadua Not tainted 5.1.0-050100-generic #201905052130
May  6 08:38:08 test-ubnt kernel: [  161.564493] Hardware name: System ma=
nufacturer System Product Name/PRIME A320M-K, BIOS 4602 03/07/2019
May  6 08:38:08 test-ubnt kernel: [  161.565323] RIP: 0010:__kmalloc+0xa5=
/0x220
May  6 08:38:08 test-ubnt kernel: [  161.566116] Code: 65 49 8b 50 08 65 =
4c 03 05 80 c5 78 79 4d 8b 38 4d 85 ff 0f 84 2e 01 00 00 41 8b 59 20 49 8=
b 39 48 8d 4a 01 4c 89 f8 4c 01 fb <48> 33 1b 49 33 99 38 01 00 00 65 48 =
0f c7 0f 0f 94 c0 84 c0 74 bd
May  6 08:38:08 test-ubnt kernel: [  161.567913] RSP: 0018:ffffa8614237bc=
d0 EFLAGS: 00010202
May  6 08:38:08 test-ubnt kernel: [  161.568840] RAX: 534d1cbf998a8f86 RB=
X: 534d1cbf998a8f86 RCX: 00000000000062cb
May  6 08:38:08 test-ubnt kernel: [  161.569801] RDX: 00000000000062ca RS=
I: 0000000000000cc0 RDI: 0000000000028040
May  6 08:38:08 test-ubnt kernel: [  161.570779] RBP: ffffa8614237bd00 R0=
8: ffff9cfa9ae28040 R09: ffff9cfa9a807c00
May  6 08:38:08 test-ubnt kernel: [  161.571778] R10: 0000000000000009 R1=
1: ffff9cfa36fcc100 R12: 0000000000000cc0
May  6 08:38:08 test-ubnt kernel: [  161.572796] R13: 0000000000000002 R1=
4: ffff9cfa9a807c00 R15: 534d1cbf998a8f86
May  6 08:38:08 test-ubnt kernel: [  161.573825] FS:  0000000000000000(00=
00) GS:ffff9cfa9ae00000(0063) knlGS:00000000f7d01700
May  6 08:38:08 test-ubnt kernel: [  161.574882] CS:  0010 DS: 002b ES: 0=
02b CR0: 0000000080050033
May  6 08:38:08 test-ubnt kernel: [  161.575907] CR2: 00000000ff82280c CR=
3: 00000000b59ec000 CR4: 00000000003406f0
May  6 08:38:08 test-ubnt kernel: [  161.576966] Call Trace:
May  6 08:38:08 test-ubnt kernel: [  161.578028]  ? proc_do_submiturb+0xa=
f1/0xc70
May  6 08:38:08 test-ubnt kernel: [  161.579109]  proc_do_submiturb+0xaf1=
/0xc70
May  6 08:38:08 test-ubnt kernel: [  161.580202]  proc_submiturb_compat+0=
x81/0xb0
May  6 08:38:08 test-ubnt kernel: [  161.581304]  usbdev_do_ioctl+0x930/0=
xd70
May  6 08:38:08 test-ubnt kernel: [  161.582415]  ? _copy_from_user+0x3e/=
0x60
May  6 08:38:08 test-ubnt kernel: [  161.583534]  usbdev_compat_ioctl+0x1=
0/0x20
May  6 08:38:08 test-ubnt kernel: [  161.584622]  __ia32_compat_sys_ioctl=
+0x13d/0x230
May  6 08:38:08 test-ubnt kernel: [  161.585722]  do_fast_syscall_32+0x9b=
/0x210
May  6 08:38:08 test-ubnt kernel: [  161.586831]  entry_SYSCALL_compat_af=
ter_hwframe+0x45/0x4d
May  6 08:38:08 test-ubnt kernel: [  161.587962] RIP: 0023:0xf7f56929
May  6 08:38:08 test-ubnt kernel: [  161.589096] Code: 85 d2 74 02 89 0a =
5b 5d c3 8b 04 24 c3 8b 14 24 c3 8b 34 24 c3 8b 3c 24 c3 90 90 90 90 90 9=
0 90 90 51 52 55 89 cd 0f 05 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 =
00 00 00 8d b4 26 00 00 00 00
May  6 08:38:08 test-ubnt kernel: [  161.591579] RSP: 002b:00000000ff8225=
88 EFLAGS: 00000202 ORIG_RAX: 0000000000000036
May  6 08:38:08 test-ubnt kernel: [  161.592871] RAX: ffffffffffffffda RB=
X: 0000000000000009 RCX: 00000000802c550a
May  6 08:38:08 test-ubnt kernel: [  161.594185] RDX: 0000000057b89bd0 RS=
I: 0000000000000033 RDI: 0000000000000002
May  6 08:38:08 test-ubnt kernel: [  161.595508] RBP: 00000000ff8225e8 R0=
8: 0000000000000000 R09: 0000000000000000
May  6 08:38:08 test-ubnt kernel: [  161.596797] R10: 0000000000000000 R1=
1: 0000000000000000 R12: 0000000000000000
May  6 08:38:08 test-ubnt kernel: [  161.598089] R13: 0000000000000000 R1=
4: 0000000000000000 R15: 0000000000000000
May  6 08:38:08 test-ubnt kernel: [  161.599382] Modules linked in: nls_i=
so8859_1 dm_multipath scsi_dh_rdac scsi_dh_emc scsi_dh_alua edac_mce_amd =
ccp kvm irqbypass crct10dif_pclmul crc32_pclmul snd_hda_codec_realtek gha=
sh_clmulni_intel snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi s=
nd_hda_intel snd_hda_codec k10temp wmi_bmof snd_hda_core joydev eeepc_wmi=
 asus_wmi snd_hwdep sparse_keymap snd_pcm input_leds snd_timer snd soundc=
ore usbserial mac_hid sch_fq_codel ib_iser rdma_cm iw_cm ib_cm ib_core is=
csi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi ip_tables x_tables aut=
ofs4 btrfs zstd_compress raid10 raid456 async_raid6_recov async_memcpy as=
ync_pq async_xor async_tx xor raid6_pq libcrc32c raid1 raid0 multipath li=
near hid_generic usbhid hid amdgpu aesni_intel chash gpu_sched amd_iommu_=
v2 i2c_algo_bit ttm aes_x86_64 crypto_simd cryptd glue_helper drm_kms_hel=
per syscopyarea sysfillrect sysimgblt fb_sys_fops i2c_piix4 drm r8169 ahc=
i realtek libahci wmi video gpio_amdpt gpio_generic [last unloaded: ftdi_=
sio]
May  6 08:38:08 test-ubnt kernel: [  161.610416] ---[ end trace e32a9be49=
aaeee88 ]---
May  6 08:38:08 test-ubnt kernel: [  161.612558] RIP: 0010:__kmalloc+0xa5=
/0x220
May  6 08:38:08 test-ubnt kernel: [  161.614259] Code: 65 49 8b 50 08 65 =
4c 03 05 80 c5 78 79 4d 8b 38 4d 85 ff 0f 84 2e 01 00 00 41 8b 59 20 49 8=
b 39 48 8d 4a 01 4c 89 f8 4c 01 fb <48> 33 1b 49 33 99 38 01 00 00 65 48 =
0f c7 0f 0f 94 c0 84 c0 74 bd
May  6 08:38:08 test-ubnt kernel: [  161.617879] RSP: 0018:ffffa8614237bc=
d0 EFLAGS: 00010202
May  6 08:38:08 test-ubnt kernel: [  161.619761] RAX: 534d1cbf998a8f86 RB=
X: 534d1cbf998a8f86 RCX: 00000000000062cb
May  6 08:38:08 test-ubnt kernel: [  161.621665] RDX: 00000000000062ca RS=
I: 0000000000000cc0 RDI: 0000000000028040
May  6 08:38:08 test-ubnt kernel: [  161.623586] RBP: ffffa8614237bd00 R0=
8: ffff9cfa9ae28040 R09: ffff9cfa9a807c00
May  6 08:38:08 test-ubnt kernel: [  161.625513] R10: 0000000000000009 R1=
1: ffff9cfa36fcc100 R12: 0000000000000cc0
May  6 08:38:08 test-ubnt kernel: [  161.627475] R13: 0000000000000002 R1=
4: ffff9cfa9a807c00 R15: 534d1cbf998a8f86
May  6 08:38:08 test-ubnt kernel: [  161.629383] FS:  0000000000000000(00=
00) GS:ffff9cfa9ae00000(0063) knlGS:00000000f7d01700
May  6 08:38:08 test-ubnt kernel: [  161.631335] CS:  0010 DS: 002b ES: 0=
02b CR0: 0000000080050033
May  6 08:38:08 test-ubnt kernel: [  161.633289] CR2: 00000000ff82280c CR=
3: 00000000b59ec000 CR4: 00000000003406f0


--------------ED2EC226B656C966A979755E--

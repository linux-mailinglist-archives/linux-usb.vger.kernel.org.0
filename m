Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BE48208B8
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2019 15:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727745AbfEPN4Y convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 16 May 2019 09:56:24 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37978 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbfEPN4T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 May 2019 09:56:19 -0400
Received: by mail-lf1-f65.google.com with SMTP id y19so2729494lfy.5
        for <linux-usb@vger.kernel.org>; Thu, 16 May 2019 06:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=GT947YJgK61rkEbvZUVd+aEhQDd+KeqaW8FZjD/yTiE=;
        b=AqEzT1mHjSm6ZsjeQ7KTZFf/xvWwtdcIRwpD6bGA+KgNCxkdwDdQ9LlYHWnXiMeVTL
         pRncRyapXJWA2Np9U0h5XJTQnfIUK+oiV+zNLN1nm3ucPtqIZBy2JYCNHK2PnEieSjMU
         /5GGycXc4JT5zGWDWElVLOfAdnosTOMUtcSigGb3azIGztrs6+qxqUDMGxeLmZmtgDd+
         Rn/WuYHkmmrx3zfPqIi4hDg2sur2OqooKQHAOR7cRJC77hvkSjK8M/5boxcawt4YpsA7
         Xld42l2KT6fl4Ykwv5oP0bgpAhWLmb16sEHynorxI9Ji1f/mr/PKcM6xPpV9RnL4kcoz
         vzjw==
X-Gm-Message-State: APjAAAUWi9012t8eC5sGtigOhPehs0MwusbUEgiCAQCJ+VidxhoWxssx
        Hi/dOqf67bmoGwt13jLi1Yg=
X-Google-Smtp-Source: APXvYqzdhzUo4+LGwQEGge9qnXdvlefBt2p/49vXS3A9s7A5m7jHALVT3+8Vac/E4z9S4lorWwhkxQ==
X-Received: by 2002:a19:760e:: with SMTP id c14mr7380433lff.48.1558014976348;
        Thu, 16 May 2019 06:56:16 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id v21sm890960ljh.83.2019.05.16.06.56.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2019 06:56:15 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hRGrk-0002NZ-Kz; Thu, 16 May 2019 15:56:13 +0200
Date:   Thu, 16 May 2019 15:56:12 +0200
From:   Johan Hovold <johan@kernel.org>
To:     "StarostaCZ@gmail.com" <starostacz@gmail.com>
Cc:     linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: Kernel crash with FTDI FT232R on AMD boards.
Message-ID: <20190516135612.GA28564@localhost>
References: <11678333-2e1a-8c0f-109f-a1aefa54ef9a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <11678333-2e1a-8c0f-109f-a1aefa54ef9a@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 16, 2019 at 03:35:42PM +0200, StarostaCZ@gmail.com wrote:
> Hello,
> when I try to read EEPROM memory from FT232R chip (USB to serial 
> converter), system crash after a seconds.

You should mention that you're using libusb and the vendor's ftdi
library. Specifically, the kernels ftdi_sio driver is not involved.

> 1) Configuration
> ASUS PRIME A320M-K, latest bios version 4801, default settings.
> Ubuntu server 19.04 with kernel 5.1.1-050101-generic: 
> https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.1.1/
> 
> 2) lsusboutput
> Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 003 Device 002: ID 04f3:0103 Elan Microelectronics Corp. ActiveJet 
> K-2024 Multimedia Keyboard
> Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 001 Device 002: ID 0403:6001 Future Technology Devices 
> International, Ltd FT232 Serial (UART) IC
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> 
> 3) kern.log with IOMMU disabled
> https://paste.ee/p/nuCPp

Good that you were able to rule out the iommu, but you forgot to CC the
xhci maintainer (added Mathias again).

It could be good idea to include a link to thread with your initial
report as well:

	https://lkml.kernel.org/r/04503197-a0a9-8b35-6c65-c10f296aab57@gmail.com

> 4) Notes
> - problem is, when FT232R is connected to USB2.0 port, when is connected 
> to USB3 port, this works fine
> - another test - same hardware, Debian 9.8 with kernel 4.19 - system 
> crash too
> 
> -- starosta

Including only the obviously relevant part of your log below.

> May 16 15:06:45 test-ubnt kernel: [    0.000000] Linux version 5.1.1-050101-generic (kernel@kathleen) (gcc version 8.3.0 (Ubuntu 8.3.0-12ubuntu1)) #201905110631 SMP Sat May 11 06:33:50 UTC 2019

...

> May 16 15:07:03 test-ubnt kernel: [   30.042564] usbserial: USB Serial deregistering driver FTDI USB Serial Device
> May 16 15:07:03 test-ubnt kernel: [   30.042759] ftdi_sio ttyUSB0: FTDI USB Serial Device converter now disconnected from ttyUSB0
> May 16 15:07:03 test-ubnt kernel: [   30.042792] usbcore: deregistering interface driver ftdi_sio
> May 16 15:07:03 test-ubnt kernel: [   30.042842] ftdi_sio 1-9:1.0: device disconnected
> May 16 15:07:54 test-ubnt kernel: [   81.751630] xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
> May 16 15:07:54 test-ubnt kernel: [   81.990340] general protection fault: 0000 [#1] SMP NOPTI
> May 16 15:07:54 test-ubnt kernel: [   81.993345] CPU: 3 PID: 1058 Comm: readua Not tainted 5.1.1-050101-generic #201905110631
> May 16 15:07:54 test-ubnt kernel: [   81.996509] Hardware name: System manufacturer System Product Name/PRIME A320M-K, BIOS 4801 04/25/2019
> May 16 15:07:54 test-ubnt kernel: [   81.998598] RIP: 0010:__kmalloc+0xa5/0x220
> May 16 15:07:54 test-ubnt kernel: [   82.000379] Code: 65 49 8b 50 08 65 4c 03 05 90 c5 d8 54 4d 8b 38 4d 85 ff 0f 84 2e 01 00 00 41 8b 59 20 49 8b 39 48 8d 4a 01 4c 89 f8 4c 01 fb <48> 33 1b 49 33 99 38 01 00 00 65 48 0f c7 0f 0f 94 c0 84 c0 74 bd
> May 16 15:07:54 test-ubnt kernel: [   82.004031] RSP: 0018:ffffb415c0f1fcd0 EFLAGS: 00010202
> May 16 15:07:54 test-ubnt kernel: [   82.005847] RAX: 74536432697a6001 RBX: 74536432697a6001 RCX: 0000000000004a47
> May 16 15:07:54 test-ubnt kernel: [   82.007654] RDX: 0000000000004a46 RSI: 0000000000000cc0 RDI: 00000000000281a0
> May 16 15:07:54 test-ubnt kernel: [   82.009463] RBP: ffffb415c0f1fd00 R08: ffff9e259aee81a0 R09: ffff9e259a806b80
> May 16 15:07:54 test-ubnt kernel: [   82.011277] R10: ffff9e258ac616f0 R11: ffff9e2591f3a400 R12: 0000000000000cc0
> May 16 15:07:54 test-ubnt kernel: [   82.013085] R13: 0000000000001000 R14: ffff9e259a806b80 R15: 74536432697a6001
> May 16 15:07:54 test-ubnt kernel: [   82.014878] FS:  0000000000000000(0000) GS:ffff9e259aec0000(0063) knlGS:00000000f6bbeb40
> May 16 15:07:54 test-ubnt kernel: [   82.016670] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> May 16 15:07:54 test-ubnt kernel: [   82.018450] CR2: 00000000f7d23eac CR3: 0000000115b2c000 CR4: 00000000003406e0
> May 16 15:07:54 test-ubnt kernel: [   82.020233] Call Trace:
> May 16 15:07:54 test-ubnt kernel: [   82.021995]  ? proc_do_submiturb+0xaf1/0xc70
> May 16 15:07:54 test-ubnt kernel: [   82.023748]  proc_do_submiturb+0xaf1/0xc70
> May 16 15:07:54 test-ubnt kernel: [   82.025486]  proc_submiturb_compat+0x81/0xb0
> May 16 15:07:54 test-ubnt kernel: [   82.027226]  usbdev_do_ioctl+0x930/0xd70
> May 16 15:07:54 test-ubnt kernel: [   82.028964]  ? call_rwsem_wake+0x1b/0x30
> May 16 15:07:54 test-ubnt kernel: [   82.030681]  ? _copy_from_user+0x3e/0x60
> May 16 15:07:54 test-ubnt kernel: [   82.032359]  usbdev_compat_ioctl+0x10/0x20
> May 16 15:07:54 test-ubnt kernel: [   82.034002]  __ia32_compat_sys_ioctl+0x13d/0x230
> May 16 15:07:54 test-ubnt kernel: [   82.035609]  do_fast_syscall_32+0x9b/0x210
> May 16 15:07:54 test-ubnt kernel: [   82.037178]  entry_SYSCALL_compat_after_hwframe+0x45/0x4d
> May 16 15:07:54 test-ubnt kernel: [   82.038718] RIP: 0023:0xf7f7a929
> May 16 15:07:54 test-ubnt kernel: [   82.040217] Code: 85 d2 74 02 89 0a 5b 5d c3 8b 04 24 c3 8b 14 24 c3 8b 34 24 c3 8b 3c 24 c3 90 90 90 90 90 90 90 90 51 52 55 89 cd 0f 05 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
> May 16 15:07:54 test-ubnt kernel: [   82.043232] RSP: 002b:00000000f6bbe1c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000036
> May 16 15:07:54 test-ubnt kernel: [   82.044708] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 00000000802c550a
> May 16 15:07:54 test-ubnt kernel: [   82.046154] RDX: 00000000f5a00660 RSI: 0000000000000081 RDI: 0000000056dc6a80
> May 16 15:07:54 test-ubnt kernel: [   82.047564] RBP: 00000000f6bbe238 R08: 0000000000000000 R09: 0000000000000000
> May 16 15:07:54 test-ubnt kernel: [   82.048937] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> May 16 15:07:54 test-ubnt kernel: [   82.050267] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> May 16 15:07:54 test-ubnt kernel: [   82.051555] Modules linked in: nls_iso8859_1 dm_multipath scsi_dh_rdac scsi_dh_emc scsi_dh_alua edac_mce_amd ccp kvm irqbypass snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio crct10dif_pclmul crc32_pclmul snd_hda_codec_hdmi ghash_clmulni_intel snd_hda_intel snd_hda_codec eeepc_wmi snd_hda_core asus_wmi sparse_keymap wmi_bmof k10temp snd_hwdep snd_pcm snd_timer snd input_leds joydev usbserial soundcore mac_hid sch_fq_codel ib_iser rdma_cm iw_cm ib_cm ib_core iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi ip_tables x_tables autofs4 btrfs zstd_compress raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c raid1 raid0 multipath linear hid_generic usbhid hid amdgpu chash gpu_sched amd_iommu_v2 i2c_algo_bit aesni_intel ttm aes_x86_64 crypto_simd drm_kms_helper cryptd glue_helper syscopyarea sysfillrect sysimgblt i2c_piix4 fb_sys_fops drm r8169 ahci realtek libahci wmi video gpio_amdpt gpio_generic [last unloaded: ftdi_sio]
> May 16 15:07:54 test-ubnt kernel: [   82.060732] ---[ end trace 0f9fef91319fb2b2 ]---

Johan

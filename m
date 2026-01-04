Return-Path: <linux-usb+bounces-31896-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE9DCF172D
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 00:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 03AC430019C5
	for <lists+linux-usb@lfdr.de>; Sun,  4 Jan 2026 23:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7CCD27F163;
	Sun,  4 Jan 2026 23:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="OVy1MA56"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC393A1E94
	for <linux-usb@vger.kernel.org>; Sun,  4 Jan 2026 23:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767568396; cv=none; b=plnYPdKC6hpcXjPU+gBnhoA17dyBLnN+PyXxkPY+1HV6weuFabFlvgBUnb2o4NTwjDZ1ngX9wFDxWLf2T36SMH+Ie6GBt1W04N9vz4tIhJ51Wb5Y5Nx9elaRLKzD2ZJPb/zdblMbvAQnNOQ8jqVxrL2ECnjjuwptfOCx4b89JUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767568396; c=relaxed/simple;
	bh=fuetiow+ojjAaCFZgPoEMa/6FpsWYCZH0hUXETqpBi8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Qsnk/m4hTh7V+kPRPRG2KlX7CQMC9mVMMX+qOUpaynpA+MHWwyQau/QX37kxlpkN+wsTsqjlwj7pBeo2mlfcmhZTWsGWejbPSMhY4s1Mj1xItDHf6qCb+3AddZ4r+ROrkcz+N6+KYkJCByPkcEDMjSYyKL2NOABDLHNuXHMHXFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=OVy1MA56; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so2120858566b.2
        for <linux-usb@vger.kernel.org>; Sun, 04 Jan 2026 15:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767568393; x=1768173193; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WzFi4r4ltN51Cim3BRtNQcm5/o5VopK3YDgML2QimT4=;
        b=OVy1MA560+j0kZHKWh4ERMcp8URB4RoWwhBm4esbhIzyYo+S6qy5OXxqRHYNxXyesy
         VDAWMMN8UreeEOmPzcGCmVf89NAPrnItLGwHZvBsJA26Pssw/+4tUcZ6/NV+cDS+KapB
         pU3A4LpM5IC0IelZqiVzJlnZrSNE+UM9LAvaAggw53zxj55LoFHHK6wLBBExkrlCcRB+
         6f96VtqR3qmQSse4lZDYN7TC+snv76nq/u/0jwkupXTXzgcq9gLMiftJS8hfElMGnwY4
         /AhZiOmQ1hundTnQmL8EFKrnuezjSUazjPZoz1KwXPltZWMk/g3KfMXgsspHHEl5WqN4
         HIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767568393; x=1768173193;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WzFi4r4ltN51Cim3BRtNQcm5/o5VopK3YDgML2QimT4=;
        b=bdO5yokvEKWcfnksKX/vtlbPyJJ/1K+rTOf8UxFITVdGjtw0laKxd7Z/L77GuRaOAQ
         gu7Ug9em7u45n5An0XjmigM37Bzdz5ESx0hjP74VnCFGKcVKKaXAzveIiD65j3PHU9gt
         wVrUq7/hkFFkZoHv2Dbgxvvj49oSwRwxFNlZAKe6TO9jC1wteWFrHYb5buODCe1IAbpv
         H4EsBKCihY7op07fLVoLngmrTUbzl0MXthTW9fdsYM+uUsRR0WeJbNzGaz+6sG5R+r8N
         rX1cQwTAu1RgD4iuL3oRPJzxLqb7aVZZM+25ZcLgitfTCw0frASo38TY94CfLXGnTEL0
         lf8A==
X-Gm-Message-State: AOJu0YzOLb2ZqbWyvWZWssXQrT4Sg8NKj5uae9v4W6dhxLKEb6d+dAWy
	94Ij59fWrb35MRH33JOyCJxfDnF6yMl1RkCfeyBFWJHJjoe/zSYMBtM8ZFj0PdHDTv+qS1JzZG5
	6zCRpOIY3d8wnQrQ8rCy27br7QWbJoYc=
X-Gm-Gg: AY/fxX6Eb/n/oqJvot6WWzeXwZL0IEywu/oISmpJ6cW7TzoPxDvHrhFrow+p5RtT7RV
	cgub43wFoU854Vc1NKOnxobchiwsZQiqt+8gBrXSu7wvatBlkCZhY/5NP3EA9j8hORyZ/8v/mpp
	E6cxrVwKrZBZ8wyvBJw2+jkS0dhjo9s0ffYNmEj5ClzfNrGULbxRoEq3XOBoC9SaXPFPZOj6KGe
	qkW7zXhcsfwYzhGPQjZw8NYkeU+Qn8pBPJBClELvyQ/01tyQ4YhcvO+aktabjFIAmq/1PWBnEXz
	Dwf4xpmYCf0uRgFhgjr+96+3Qg==
X-Google-Smtp-Source: AGHT+IEym2U47DN3s3+S6c1te1TKH68FSwTefyZLxOufl/QB3VmkHCevXkx7YRl5D2dw02qmq1dwUcvIKwGD7wEeb2g=
X-Received: by 2002:a17:907:7295:b0:b72:d56f:3468 with SMTP id
 a640c23a62f3a-b803718321fmr4470592166b.50.1767568392450; Sun, 04 Jan 2026
 15:13:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Marco Schuschnig <m.schuster91@googlemail.com>
Date: Mon, 5 Jan 2026 00:13:01 +0100
X-Gm-Features: AQt7F2qvMIqVggZhm7PnnokClUye2OszFuQRW7-j0MzxzrOnll9sH1puuaZar-Y
Message-ID: <CAEhB=Bt13wr1+cc1rfzwPxnEEuawMgTew=RJic2FsVb=Gccm+A@mail.gmail.com>
Subject: usbip: Kernel oops when trying to bind devices from Windows client
To: valentina.manea.m@gmail.com, shuah@kernel.org
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello all,

I am trying to get usbip working with a Raspberry Pi Zero 2 W
(Raspberry Pi OS / Debian Trixie, kernel 6.2.47) as host and a Windows
10 machine as client (using usbip-win2 0.9.7.3). The device to be
shared is a "145f:0276 Trust GXT 165 Gaming Mouse".

Upon attaching from the Windows machine, the Raspberry Pi
kernel-oopses pretty much immediately. Sometimes, the Pi locks up hard
until it is either power-cycled or the watchdog kicks in, sometimes it
keeps running. In the latter case, when attempting to detach on the
Windows machine, another kernel oops follows like in the attached
stacktrace (sec. 158).

The issue is fully reproducible, the attached stacktrace was produced
with usbip_debug_flag=0xFFFFFFFF.

An issue with the hardware can be ruled out, as when using a Raspberry
Pi 5 as client (same kernel version) the usbip connection works
flawlessly. Incidentally, when using the Raspberry Pi 5 as host
together with the Windows 10 machine as client, usbip works just fine.
I have tested with the same results an USB keyboard and an Android
smartphone to rule out a misbehaving USB device.

It might be possible that the culprit is something Windows does to USB
devices or a bug in the usbip-win2 package, but even if Windows sends
corrupt USB packets, these should IMHO not lead to a kernel-oops.

If you need any further investigation beyond the crash log (e.g. a
wireshark dump), I'm happy to help out.

Kind regards
Marco

---
$ uname -a
Linux rpi-xxx 6.12.47+rpt-rpi-v8 #1 SMP PREEMPT Debian
1:6.12.47-1+rpt1 (2025-09-16) aarch64 GNU/Linux
$ lsusb -t
/:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=dwc_otg/1p, 480M
    |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/4p, 480M
        |__ Port 001: Dev 003, 1.5M
        |__ Port 003: Dev 004, 12M
$ lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 1a40:0101 Terminus Technology Inc. Hub
Bus 001 Device 003: ID 1a2c:4c5e China Resource Semico Co., Ltd USB Keyboard
Bus 001 Device 004: ID 145f:0276 Trust GXT 165 Gaming Mouse

---
[   84.292485] usbip-host 1-1.3: stub up
[   84.432511] usbip-core00000000: 01000000 03000000 04000100 01000000
[   84.432547] usbip-core00000010: 00000000 00000000 40000000 00000000
[   84.432565] usbip-core00000020: ffffffff 00000000 01000680 00400000
[   84.445978] usbip-core00000000: 01000000 05000000 04000100 01000000
[   84.446009] usbip-core00000010: 00000000 00000000 12000000 00000000
[   84.446026] usbip-core00000020: ffffffff 00000000 01000680 00120000
[   85.050622] usbip-core00000000: 01000000 07000000 04000100 01000000
[   85.050658] usbip-core00000010: 00000000 00000000 40000000 00000000
[   85.050675] usbip-core00000020: ffffffff 00000000 01000680 00400000
[   85.165815] usbip-core00000000: 01000000 09000000 04000100 01000000
[   85.165849] usbip-core00000010: 00000000 00000000 12000000 00000000
[   85.165866] usbip-core00000020: ffffffff 00000000 01000680 00120000
[   85.176263] usbip-core00000000: 01000000 0b000000 04000100 01000000
[   85.176295] usbip-core00000010: 00000000 00000000 ff000000 00000000
[   85.176312] usbip-core00000020: ffffffff 00000000 02000680 00ff0000
[   85.180278] usbip-core00000000: 01000000 0d000000 04000100 01000000
[   85.180309] usbip-core00000010: 00000000 00000000 ff000000 00000000
[   85.180326] usbip-core00000020: ffffffff 00000000 03000680 00ff0000
[   85.183476] usbip-core00000000: 01000000 0f000000 04000100 01000000
[   85.183506] usbip-core00000010: 00000000 00000000 ff000000 00000000
[   85.183523] usbip-core00000020: ffffffff 00000000 03020680 00ff0409
[   85.188020] usbip-core00000000: 01000000 11000000 04000100 01000000
[   85.188050] usbip-core00000010: 00000000 00000000 12000000 00000000
[   85.188067] usbip-core00000020: ffffffff 00000000 01000680 00120000
[   85.194198] usbip-core00000000: 01000000 13000000 04000100 01000000
[   85.194228] usbip-core00000010: 00000000 00000000 12000000 00000000
[   85.194245] usbip-core00000020: ffffffff 00000000 01000680 00120000
[   85.201859] usbip-core00000000: 01000000 15000000 04000100 01000000
[   85.201889] usbip-core00000010: 00000000 00000000 12000000 00000000
[   85.201906] usbip-core00000020: ffffffff 00000000 01000680 00120000
[   85.202644] Unable to handle kernel paging request at virtual
address 0000000200000083
[   85.202687] Mem abort info:
[   85.202704]   ESR = 0x0000000096000005
[   85.202724]   EC = 0x25: DABT (current EL), IL = 32 bits
[   85.202749]   SET = 0, FnV = 0
[   85.202768]   EA = 0, S1PTW = 0
[   85.202787]   FSC = 0x05: level 1 translation fault
[   85.202809] Data abort info:
[   85.202826]   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
[   85.202849]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[   85.202873]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[   85.202899] user pgtable: 4k pages, 39-bit VAs, pgdp=0000000005c94000
[   85.202926] [0000000200000083] pgd=0000000000000000,
p4d=0000000000000000, pud=0000000000000000
[   85.202988] Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
[   85.203020] Modules linked in: rfcomm cmac algif_hash aes_arm64
aes_generic algif_skcipher af_alg bnep binfmt_misc brcmfmac_wcc joydev
brcmfmac vc4 snd_soc_hdmi_codec drm_display_helper cec brcmutil
drm_dma_helper drm_kms_helper cfg80211 hci_uart snd_soc_core btbcm
bcm2835_codec(C) bcm2835_v4l2(C) bcm2835_isp(C) bluetooth snd_compress
bcm2835_mmal_vchiq(C) snd_pcm_dmaengine vc_sm_cma(C) v4l2_mem2mem
videobuf2_vmalloc videobuf2_dma_contig videobuf2_memops videobuf2_v4l2
videodev raspberrypi_hwmon ecdh_generic ecc rfkill videobuf2_common
libaes mc snd_bcm2835(C) snd_pcm raspberrypi_gpiomem snd_timer snd
uio_pdrv_genirq uio sch_fq_codel usbip_host usbip_core zram drm
lz4_compress fuse drm_panel_orientation_quirks backlight nfnetlink
ip_tables x_tables ipv6 i2c_bcm2835
[   85.203605] CPU: 0 UID: 0 PID: 985 Comm: stub_tx Tainted: G
C         6.12.47+rpt-rpi-v8 #1  Debian 1:6.12.47-1+rpt1
[   85.203655] Tainted: [C]=CRAP
[   85.203675] Hardware name: Raspberry Pi Zero 2 W Rev 1.0 (DT)
[   85.203702] pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   85.203737] pc : stub_send_ret_submit+0xd4/0x610 [usbip_host]
[   85.203786] lr : stub_send_ret_submit+0xd4/0x610 [usbip_host]
[   85.203826] sp : ffffffc081aabcd0
[   85.203847] x29: ffffffc081aabd90 x28: 0000000000000000 x27: ffffff8002476200
[   85.203898] x26: 0000000000000000 x25: 0000000000000000 x24: 00000001ffffffff
[   85.203947] x23: ffffff801b77dbb8 x22: 0000000000000000 x21: ffffff801b77db94
[   85.203997] x20: ffffff801b77db00 x19: ffffffc081aabd58 x18: ffffffffffffffff
[   85.204046] x17: 0000000000000000 x16: ffffffd5f6b9bb40 x15: 0000000000000000
[   85.204095] x14: ffffffc081aa3848 x13: 0000000000000000 x12: 0000000000000313
[   85.204144] x11: 00000000000000c0 x10: 0000000000001a40 x9 : ffffffd5adc56264
[   85.204194] x8 : ffffffc081aabd58 x7 : 0000000000000000 x6 : ffffff801b77dbf0
[   85.204243] x5 : ffffff801b77dbf0 x4 : 0000000000000000 x3 : 0000000000000020
[   85.204292] x2 : 0000000000000008 x1 : 0000000000000000 x0 : ffffffc081aabcf0
[   85.204342] Call trace:
[   85.204362]  stub_send_ret_submit+0xd4/0x610 [usbip_host]
[   85.204403]  stub_tx_loop+0x5c/0x158 [usbip_host]
[   85.204441]  kthread+0x118/0x128
[   85.204475]  ret_from_fork+0x10/0x20
[   85.204517] Code: a9007e7f a9017e7f a9027e7f 97fff3d9 (b9408702)
[   85.204549] ---[ end trace 0000000000000000 ]---
[   90.216451] usbip-core00000000: 02000000 16000000 04000100 00000000
[   90.216524] usbip-core00000010: 00000000 15000000 12000000 00000000
[   90.216573] usbip-core00000020: ffffffff 00000000 01000680 00120000
[   90.236005] usbip-core00000000: 01000000 19000000 04000100 01000000
[   90.236066] usbip-core00000010: 00000000 00000000 40000000 00000000
[   90.236101] usbip-core00000020: ffffffff 00000000 01000680 00400000
[  158.004537] usbip-host 1-1.3: recv a header, 0
[  158.005176] Unable to handle kernel paging request at virtual
address 000000020000003f
[  158.005246] Mem abort info:
[  158.005265]   ESR = 0x0000000096000005
[  158.005288]   EC = 0x25: DABT (current EL), IL = 32 bits
[  158.005373]   SET = 0, FnV = 0
[  158.005399]   EA = 0, S1PTW = 0
[  158.005454]   FSC = 0x05: level 1 translation fault
[  158.005480] Data abort info:
[  158.005499]   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
[  158.005525]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[  158.005551]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[  158.005583] user pgtable: 4k pages, 39-bit VAs, pgdp=0000000005cd7000
[  158.005615] [000000020000003f] pgd=0000000000000000,
p4d=0000000000000000, pud=0000000000000000
[  158.005675] Internal error: Oops: 0000000096000005 [#2] PREEMPT SMP
[  158.005708] Modules linked in: rfcomm cmac algif_hash aes_arm64
aes_generic algif_skcipher af_alg bnep binfmt_misc brcmfmac_wcc joydev
brcmfmac vc4 snd_soc_hdmi_codec drm_display_helper cec brcmutil
drm_dma_helper drm_kms_helper cfg80211 hci_uart snd_soc_core btbcm
bcm2835_codec(C) bcm2835_v4l2(C) bcm2835_isp(C) bluetooth snd_compress
bcm2835_mmal_vchiq(C) snd_pcm_dmaengine vc_sm_cma(C) v4l2_mem2mem
videobuf2_vmalloc videobuf2_dma_contig videobuf2_memops videobuf2_v4l2
videodev raspberrypi_hwmon ecdh_generic ecc rfkill videobuf2_common
libaes mc snd_bcm2835(C) snd_pcm raspberrypi_gpiomem snd_timer snd
uio_pdrv_genirq uio sch_fq_codel usbip_host usbip_core zram drm
lz4_compress fuse drm_panel_orientation_quirks backlight nfnetlink
ip_tables x_tables ipv6 i2c_bcm2835
[  158.006301] CPU: 0 UID: 0 PID: 12 Comm: kworker/u16:0 Tainted: G
  D  C         6.12.47+rpt-rpi-v8 #1  Debian 1:6.12.47-1+rpt1
[  158.006355] Tainted: [D]=DIE, [C]=CRAP
[  158.006377] Hardware name: Raspberry Pi Zero 2 W Rev 1.0 (DT)
[  158.006405] Workqueue: usbip_event event_handler [usbip_core]
[  158.006466] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  158.006501] pc : usb_kill_urb+0xc/0x50
[  158.006542] lr : stub_device_cleanup_urbs+0x98/0x180 [usbip_host]
[  158.006589] sp : ffffffc08007bcb0
[  158.006611] x29: ffffffc08007bcb0 x28: 0000000000000000 x27: 0000000000000000
[  158.006662] x26: ffffff801b77db00 x25: ffffff801b77dbb8 x24: ffffff801b77dba8
[  158.006712] x23: ffffff801b77db98 x22: ffffff801b77db94 x21: ffffff801b77db00
[  158.006762] x20: ffffff8002476200 x19: 0000000000000001 x18: 0000000000000000
[  158.006811] x17: ffffff8001f0d800 x16: ffffffd5f67c4e78 x15: 0000000000001000
[  158.006861] x14: 0000000000000000 x13: 0000000000000002 x12: 0000000000000000
[  158.006911] x11: 00000000000000c0 x10: 0000000000001a40 x9 : ffffffd5adc55220
[  158.006961] x8 : ffffffc08007bc20 x7 : ffffffaa13ce9000 x6 : ffffff800af2c880
[  158.007011] x5 : ffffff8001e84200 x4 : ffffff801b77dbb8 x3 : ffffff801b77dbb8
[  158.007061] x2 : ffffff8002476208 x1 : ffffff8003fe2fc0 x0 : 00000001ffffffff
[  158.007112] Call trace:
[  158.007133]  usb_kill_urb+0xc/0x50
[  158.007170]  stub_shutdown_connection+0x84/0x178 [usbip_host]
[  158.007212]  event_handler+0xa4/0x1a0 [usbip_core]
[  158.007257]  process_one_work+0x158/0x3d0
[  158.007294]  worker_thread+0x2c4/0x3e8
[  158.007327]  kthread+0x118/0x128
[  158.007356]  ret_from_fork+0x10/0x20
[  158.007397] Code: ffffffd5 aa1e03e9 d503201f b4000180 (f9402002)
[  158.007430] ---[ end trace 0000000000000000 ]---


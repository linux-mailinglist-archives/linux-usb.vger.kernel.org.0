Return-Path: <linux-usb+bounces-16724-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E97489B1118
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 23:00:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D2421F24E95
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 21:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD9E2161F3;
	Fri, 25 Oct 2024 20:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b="ZfCUGD7W"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D856A2161E7
	for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2024 20:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729889817; cv=none; b=Qj0QCrY+bcM6Zihcp7WImVqG6RSUMPJaqn45XOa1SO8A2+1rBJxyxBZuFPjDtV0vZT3berhMUZHRxpqHSvw/oRoeVCl9gX33G5oYjRE69oxUTbSu/JHVjSpMwqC5Vp91B50hyCXGrvaTgMFNnClQsI7d+GisobgWF5pntdRSMS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729889817; c=relaxed/simple;
	bh=/DtGVoY2mmUa/TRMK2G8t/eOD4dGFzysPfviVApblGI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=UNvo5QtvwvM0i3YeJXu/J6Aoy5iCAlu+HR58KXCIiRNTPfr8pnk3IxV5DHU9Yf4AN2SZu9EWN8rlM/jiSc61kNbD78zDurzbwlO9hTPjkmKQ4/RgwGoLNmerjhOUS1e2b2xKdl5KV/6PLRHW+s40/FqdA4qgVW+9qtk6xlVFlVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org; spf=pass smtp.mailfrom=networkplumber.org; dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b=ZfCUGD7W; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20cf3e36a76so24804025ad.0
        for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2024 13:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1729889812; x=1730494612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nZZkz3Nlyjq6snvntvsEMXPQTymxSGFI9tcwSbS48Kk=;
        b=ZfCUGD7WWZiRfZfKUOZcgZPi0WwxjPr/j/6Sf+WwYF8M3eg/yo350Dmg/wcMx8NSLX
         Co59dsrnxIJrriOpH5MtdM16skT+upJL+DdHYxJBoqxUzLRPclrHKyJDJihH8mKV37X+
         CHeMW8KXpe3fHJuezwaT/f9vxna/9GDS8izAbn9Mjf0sI7SMGUBRvq68XIlqbuvKK3Hj
         GcWgsvYJwbl8sbnfMJw5ANisakU6tQ+TyKqkMno31tffCnl59a47gSUgnK8/l5o1HHCo
         PGV2S56cGzNmOq5ZQVtr35BMEH1WWJTqNuoV9N4k0ID6Jwok0oDBXoVT9KfioKtUxwJF
         gTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729889812; x=1730494612;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZZkz3Nlyjq6snvntvsEMXPQTymxSGFI9tcwSbS48Kk=;
        b=iQ+VP5RhkJezCo1aqnHzaGGlEJiZm0mwN1ghCN/KYYAr6BWB4R8lfMRTWjHT4i8VOx
         YOrlUfUqQE0pmmrY/yNMqiippo0g6Lg0MjJibcWlFzXASdNvYZgATQk9qjny4j8yi4Ui
         BKSx268Er369maMstq1dGdTkojT94LrBNqdBQNxaSiLsyys8cPSualG7w9S3GLvzWnjg
         tQXrU/lraLT14Ds/qun6TuuYjqiPgS6b/ZXRP4pcbErNWw8tbg+/GzVK6J9W6D0y2+HW
         4PtB7RnRHIHqPWJMdzjcmTjWzMWx+NwC/GpwikW66cgZpDtrkJ2r8V9ar9LInFIP8LN1
         u/hA==
X-Gm-Message-State: AOJu0YwFRfoNVcFoq3IM7eT+QQ3aY/3vJ0IpbtDjc9agg8tD/qJpQWuv
	kfFfwEtuDkGNqFRIDEZAY6VZYwOmGZ8/3AYHh/22BOgrCPKhDTal0tN6jWZTQUaT2KF9pYIN5EA
	s
X-Google-Smtp-Source: AGHT+IGzMm4pkIQ8LqDBH53ssWItAEp2bQG8YqVU7MuFJXbiZqtgMiPXcTXiavqbCr5uD0TZs3SZVg==
X-Received: by 2002:a17:902:ea08:b0:20c:8907:90a with SMTP id d9443c01a7336-210c687439emr5813305ad.5.1729889811767;
        Fri, 25 Oct 2024 13:56:51 -0700 (PDT)
Received: from hermes.local (204-195-96-226.wavecable.com. [204.195.96.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02ee38sm13365545ad.215.2024.10.25.13.56.51
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 13:56:51 -0700 (PDT)
Date: Fri, 25 Oct 2024 13:56:49 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: linux-usb@vger.kernel.org
Subject: USB warning on boot
Message-ID: <20241025135649.2d08be87@hermes.local>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

This is on a new AMD based mini-PC with Debian testing (6.11.4-amd64).
Looks like a USB driver bug.

On every boot, this shows up in the log although the system seems to recover ok.

[    2.085710] ACPI: bus type USB registered
[    2.085745] usbcore: registered new interface driver usbfs
[    2.085751] usbcore: registered new interface driver hub
[    2.085765] usbcore: registered new device driver usb
[    2.165810] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, revision 0
[    2.165815] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port selection
[    2.167015] i2c i2c-2: Successfully instantiated SPD at 0x50
[    2.167731] i2c i2c-2: Successfully instantiated SPD at 0x51
[    2.167784] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at 0xb20
[    2.266103] ACPI: bus type drm_connector registered
[    2.334615] nvme nvme1: pci function 0000:05:00.0
[    2.334615] nvme nvme0: pci function 0000:04:00.0
[    2.342517] nvme nvme0: 8/0/0 default/read/poll queues
[    2.345455]  nvme0n1: p1 p2 p3
[    2.346683] nvme nvme1: D3 entry latency set to 10 seconds
[    2.352833] nvme nvme1: 32/0/0 default/read/poll queues
[    2.355430]  nvme1n1: p1 p2 p3
[    2.766023] xhci_hcd 0000:08:00.3: xHCI Host Controller
[    2.766031] xhci_hcd 0000:08:00.3: new USB bus registered, assigned bus number 1
[    2.766378] xhci_hcd 0000:08:00.3: hcc params 0x0120ffc5 hci version 0x120 quirks 0x0000000200000010
[    2.766642] xhci_hcd 0000:08:00.3: xHCI Host Controller
[    2.766644] xhci_hcd 0000:08:00.3: new USB bus registered, assigned bus number 2
[    2.766646] xhci_hcd 0000:08:00.3: Host supports USB 3.1 Enhanced SuperSpeed
[    2.766691] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.11
[    2.766694] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.766695] usb usb1: Product: xHCI Host Controller
[    2.766696] usb usb1: Manufacturer: Linux 6.11.4-amd64 xhci-hcd
[    2.766697] usb usb1: SerialNumber: 0000:08:00.3
[    2.766818] hub 1-0:1.0: USB hub found
[    2.766823] hub 1-0:1.0: 2 ports detected
[    2.766949] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
[    2.766965] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.11
[    2.766967] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.766969] usb usb2: Product: xHCI Host Controller
[    2.766969] usb usb2: Manufacturer: Linux 6.11.4-amd64 xhci-hcd
[    2.766970] usb usb2: SerialNumber: 0000:08:00.3
[    2.767046] hub 2-0:1.0: USB hub found
[    2.767051] hub 2-0:1.0: 2 ports detected
[    2.767175] xhci_hcd 0000:08:00.4: xHCI Host Controller
[    2.767179] xhci_hcd 0000:08:00.4: new USB bus registered, assigned bus number 3
[    2.767536] xhci_hcd 0000:08:00.4: hcc params 0x0120ffc5 hci version 0x120 quirks 0x0000000200000010
[    2.767723] xhci_hcd 0000:08:00.4: xHCI Host Controller
[    2.767725] xhci_hcd 0000:08:00.4: new USB bus registered, assigned bus number 4
[    2.767726] xhci_hcd 0000:08:00.4: Host supports USB 3.1 Enhanced SuperSpeed
[    2.767764] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.11
[    2.767766] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.767767] usb usb3: Product: xHCI Host Controller
[    2.767768] usb usb3: Manufacturer: Linux 6.11.4-amd64 xhci-hcd
[    2.767769] usb usb3: SerialNumber: 0000:08:00.4
[    2.767846] hub 3-0:1.0: USB hub found
[    2.767852] hub 3-0:1.0: 2 ports detected
[    2.767959] usb usb4: We don't know the algorithms for LPM for this host, disabling LPM.
[    2.767983] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.11
[    2.767985] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.767986] usb usb4: Product: xHCI Host Controller
[    2.767986] usb usb4: Manufacturer: Linux 6.11.4-amd64 xhci-hcd
[    2.767987] usb usb4: SerialNumber: 0000:08:00.4
[    2.768051] hub 4-0:1.0: USB hub found
[    2.768057] hub 4-0:1.0: 2 ports detected
[    2.768187] xhci_hcd 0000:09:00.0: xHCI Host Controller
[    2.768190] xhci_hcd 0000:09:00.0: new USB bus registered, assigned bus number 5
[    2.769475] xhci_hcd 0000:09:00.0: USB3 root hub has no ports
[    2.769478] xhci_hcd 0000:09:00.0: hcc params 0x0110ffc5 hci version 0x120 quirks 0x0000000200000010
[    2.769684] xhci_hcd 0000:09:00.0: xHCI Host Controller
[    2.769686] xhci_hcd 0000:09:00.0: new USB bus registered, assigned bus number 6
[    2.769688] xhci_hcd 0000:09:00.0: Host supports USB 3.0 SuperSpeed
[    2.769713] usb usb5: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.11
[    2.769714] usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.769715] usb usb5: Product: xHCI Host Controller
[    2.769716] usb usb5: Manufacturer: Linux 6.11.4-amd64 xhci-hcd
[    2.769717] usb usb5: SerialNumber: 0000:09:00.0
[    2.769782] hub 5-0:1.0: USB hub found
[    2.769786] hub 5-0:1.0: 1 port detected
[    2.769866] usb usb6: We don't know the algorithms for LPM for this host, disabling LPM.
[    2.769889] usb usb6: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.11
[    2.769891] usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.769892] usb usb6: Product: xHCI Host Controller
[    2.769893] usb usb6: Manufacturer: Linux 6.11.4-amd64 xhci-hcd
[    2.769894] usb usb6: SerialNumber: 0000:09:00.0
[    2.769957] hub 6-0:1.0: USB hub found
[    2.769962] hub 6-0:1.0: config failed, hub doesn't have any ports! (err -19)
[    3.024559] usb 5-1: new high-speed USB device number 2 using xhci_hcd
[    3.024587] usb 1-1: new high-speed USB device number 2 using xhci_hcd
[    3.176131] usb 5-1: New USB device found, idVendor=13d3, idProduct=3604, bcdDevice= 1.00
[    3.176136] usb 5-1: New USB device strings: Mfr=5, Product=6, SerialNumber=7
[    3.176138] usb 5-1: Product: Wireless_Device
[    3.176139] usb 5-1: Manufacturer: MediaTek Inc.
[    3.176140] usb 5-1: SerialNumber: 000000000
[    3.177326] usb 1-1: New USB device found, idVendor=2109, idProduct=2817, bcdDevice=90.13
[    3.177327] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    3.177328] usb 1-1: Product: USB2.0 Hub             
[    3.177329] usb 1-1: Manufacturer: VIA Labs, Inc.         
[    3.177330] usb 1-1: SerialNumber: 000000000
[    3.214766] hub 1-1:1.0: USB hub found
[    3.215078] hub 1-1:1.0: 4 ports detected
[    3.309956] usb 2-1: new SuperSpeed USB device number 2 using xhci_hcd
[    3.428703] usb 2-1: New USB device found, idVendor=2109, idProduct=0817, bcdDevice=90.13
[    3.428709] usb 2-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    3.428712] usb 2-1: Product: USB3.0 Hub             
[    3.428714] usb 2-1: Manufacturer: VIA Labs, Inc.         
[    3.428716] usb 2-1: SerialNumber: 000000000
[    3.455128] hub 2-1:1.0: USB hub found
[    3.455380] hub 2-1:1.0: 4 ports detected
[    4.044556] usb 1-1.1: new full-speed USB device number 3 using xhci_hcd
[    4.255602] usb 1-1.1: New USB device found, idVendor=046d, idProduct=c52b, bcdDevice=12.10
[    4.255608] usb 1-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    4.255610] usb 1-1.1: Product: USB Receiver
[    4.255612] usb 1-1.1: Manufacturer: Logitech
[    5.050203] [drm] amdgpu kernel modesetting enabled.
[    5.050321] amdgpu: Virtual CRAT table created for CPU
[    5.050337] amdgpu: Topology: Add CPU node
[    5.050461] amdgpu 0000:03:00.0: enabling device (0006 -> 0007)
[    5.050528] [drm] initializing kernel modesetting (IP DISCOVERY 0x1002:0x7480 0x1F4C:0xB006 0xC7).
[    5.050540] [drm] register mmio base: 0xFC900000
[    5.050542] [drm] register mmio size: 1048576
[    5.054645] [drm] add ip block number 0 <soc21_common>
[    5.054647] [drm] add ip block number 1 <gmc_v11_0>
[    5.054648] [drm] add ip block number 2 <ih_v6_0>
[    5.054650] [drm] add ip block number 3 <psp>
[    5.054651] [drm] add ip block number 4 <smu>
[    5.054652] [drm] add ip block number 5 <dm>
[    5.054653] [drm] add ip block number 6 <gfx_v11_0>
[    5.054654] [drm] add ip block number 7 <sdma_v6_0>
[    5.054656] [drm] add ip block number 8 <vcn_v4_0>
[    5.054657] [drm] add ip block number 9 <jpeg_v4_0>
[    5.054658] [drm] add ip block number 10 <mes_v11_0>
[    5.054670] amdgpu 0000:03:00.0: amdgpu: Fetched VBIOS from VFCT
[    5.054674] amdgpu: ATOM BIOS: 113-BRT138292-001
[    5.055512] amdgpu 0000:03:00.0: amdgpu: CP RS64 enable
[    5.056841] Console: switching to colour dummy device 80x25
[    5.056858] amdgpu 0000:03:00.0: vgaarb: deactivate vga console
[    5.056860] amdgpu 0000:03:00.0: amdgpu: Trusted Memory Zone (TMZ) feature not supported
[    5.056913] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit, fragment size is 9-bit
[    5.056917] amdgpu 0000:03:00.0: amdgpu: VRAM: 8176M 0x0000008000000000 - 0x00000081FEFFFFFF (8176M used)
[    5.056919] amdgpu 0000:03:00.0: amdgpu: GART: 512M 0x00007FFF00000000 - 0x00007FFF1FFFFFFF
[    5.056925] [drm] Detected VRAM RAM=8176M, BAR=8192M
[    5.056926] [drm] RAM width 128bits GDDR6
[    5.056997] [drm] amdgpu: 8176M of VRAM memory ready
[    5.056998] [drm] amdgpu: 32004M of GTT memory ready.
[    5.057008] [drm] GART: num cpu pages 131072, num gpu pages 131072
[    5.057057] [drm] PCIE GART of 512M enabled (table at 0x00000081FEB00000).
[    5.057390] [drm] Loading DMUB firmware via PSP: version=0x07002A00
[    5.057504] [drm] Found VCN firmware Version ENC: 1.21 DEC: 8 VEP: 0 Revision: 1
[    5.114319] amdgpu 0000:03:00.0: amdgpu: reserve 0x1300000 from 0x81fc000000 for PSP TMR
[    5.168267] usb 1-1.2: new full-speed USB device number 4 using xhci_hcd
[    5.208577] amdgpu 0000:03:00.0: amdgpu: RAS: optional ras ta ucode is not available
[    5.216010] amdgpu 0000:03:00.0: amdgpu: RAP: optional rap ta ucode is not available
[    5.216011] amdgpu 0000:03:00.0: amdgpu: SECUREDISPLAY: securedisplay ta ucode is not available
[    5.216045] amdgpu 0000:03:00.0: amdgpu: smu driver if version = 0x00000035, smu fw if version = 0x00000040, smu fw program = 0, smu fw version = 0x00525b00 (82.91.0)
[    5.216047] amdgpu 0000:03:00.0: amdgpu: SMU driver if version not matched
[    5.257112] amdgpu 0000:03:00.0: amdgpu: SMU is initialized successfully!
[    5.257496] [drm] Display Core v3.2.291 initialized on DCN 3.2.1
[    5.257498] [drm] DP-HDMI FRL PCON supported
[    5.259352] [drm] DMUB hardware initialized: version=0x07002A00
[    5.335608] usb 1-1.2: New USB device found, idVendor=046d, idProduct=c548, bcdDevice= 5.01
[    5.335613] usb 1-1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    5.335616] usb 1-1.2: Product: USB Receiver
[    5.335618] usb 1-1.2: Manufacturer: Logitech
[    5.500779] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
[    5.500791] kfd kfd: amdgpu: Total number of KFD nodes to be created: 1
[    5.500816] amdgpu: Virtual CRAT table created for GPU
[    5.500902] amdgpu: Topology: Add dGPU node [0x7480:0x1002]
[    5.500903] kfd kfd: amdgpu: added device 1002:7480
[    5.500915] amdgpu 0000:03:00.0: amdgpu: SE 2, SH per SE 2, CU per SH 8, active_cu_number 32
[    5.500918] amdgpu 0000:03:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng 0 on hub 0
[    5.500920] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on hub 0
[    5.500921] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on hub 0
[    5.500922] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 6 on hub 0
[    5.500923] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 7 on hub 0
[    5.500924] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 8 on hub 0
[    5.500924] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 9 on hub 0
[    5.500925] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 10 on hub 0
[    5.500926] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 11 on hub 0
[    5.500927] amdgpu 0000:03:00.0: amdgpu: ring sdma0 uses VM inv eng 12 on hub 0
[    5.500928] amdgpu 0000:03:00.0: amdgpu: ring sdma1 uses VM inv eng 13 on hub 0
[    5.500929] amdgpu 0000:03:00.0: amdgpu: ring vcn_unified_0 uses VM inv eng 0 on hub 8
[    5.500930] amdgpu 0000:03:00.0: amdgpu: ring jpeg_dec uses VM inv eng 1 on hub 8
[    5.500931] amdgpu 0000:03:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM inv eng 14 on hub 0
[    5.505132] [drm] ring gfx_32768.1.1 was added
[    5.505525] [drm] ring compute_32768.2.2 was added
[    5.505854] [drm] ring sdma_32768.3.3 was added
[    5.505923] [drm] ring gfx_32768.1.1 ib test pass
[    5.505995] [drm] ring compute_32768.2.2 ib test pass
[    5.506047] [drm] ring sdma_32768.3.3 ib test pass
[    5.508950] amdgpu 0000:03:00.0: amdgpu: Using BOCO for runtime pm
[    5.509275] [drm] Initialized amdgpu 3.59.0 for 0000:03:00.0 on minor 0
[    5.516138] fbcon: amdgpudrmfb (fb0) is primary device
[    5.516306] [drm] pre_validate_dsc:1578 MST_DSC dsc precompute is not needed
[    5.644432] usb 2-1.4: new SuperSpeed USB device number 3 using xhci_hcd
[    5.692417] usb 2-1.4: New USB device found, idVendor=2109, idProduct=0815, bcdDevice= 7.04
[    5.692420] usb 2-1.4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    5.692421] usb 2-1.4: Product: USB3.0 Hub             
[    5.692422] usb 2-1.4: Manufacturer: VIA Labs, Inc.         
[    5.710711] hub 2-1.4:1.0: USB hub found
[    5.710890] hub 2-1.4:1.0: 4 ports detected
[    5.820267] usb 1-1.4: new high-speed USB device number 5 using xhci_hcd
[    5.855249] amdgpu 0000:03:00.0: [drm] REG_WAIT timeout 1us * 150000 tries - optc32_disable_crtc line:195
[    5.960301] Console: switching to colour frame buffer device 160x45
[    5.971698] usb 1-1.4: New USB device found, idVendor=2109, idProduct=2815, bcdDevice= 7.04
[    5.971700] usb 1-1.4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    5.971702] usb 1-1.4: Product: USB2.0 Hub             
[    5.971703] usb 1-1.4: Manufacturer: VIA Labs, Inc.         
[    5.995689] amdgpu 0000:03:00.0: [drm] fb0: amdgpudrmfb frame buffer device
[    6.030776] hub 1-1.4:1.0: USB hub found
[    6.031209] hub 1-1.4:1.0: 4 ports detected
[    6.318722] hid: raw HID events driver (C) Jiri Kosina
[    6.351093] usb 2-1.4: reset SuperSpeed USB device number 3 using xhci_hcd
[    6.439699] usbcore: registered new interface driver usbhid
[    6.439704] usbhid: USB HID core driver
[    6.525168] input: Logitech USB Receiver as /devices/pci0000:00/0000:00:08.1/0000:08:00.3/usb1/1-1/1-1.1/1-1.1:1.0/0003:046D:C52B.0001/input/input3
[    6.680676] hid-generic 0003:046D:C52B.0001: input,hidraw0: USB HID v1.11 Keyboard [Logitech USB Receiver] on usb-0000:08:00.3-1.1/input0
[    6.680851] input: Logitech USB Receiver Mouse as /devices/pci0000:00/0000:00:08.1/0000:08:00.3/usb1/1-1/1-1.1/1-1.1:1.1/0003:046D:C52B.0002/input/input4
[    6.680941] input: Logitech USB Receiver Consumer Control as /devices/pci0000:00/0000:00:08.1/0000:08:00.3/usb1/1-1/1-1.1/1-1.1:1.1/0003:046D:C52B.0002/input/input5
[    6.740748] input: Logitech USB Receiver System Control as /devices/pci0000:00/0000:00:08.1/0000:08:00.3/usb1/1-1/1-1.1/1-1.1:1.1/0003:046D:C52B.0002/input/input6
[    6.740874] hid-generic 0003:046D:C52B.0002: input,hiddev0,hidraw1: USB HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:08:00.3-1.1/input1
[    6.741026] hid-generic 0003:046D:C52B.0003: hiddev1,hidraw2: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:08:00.3-1.1/input2
[    6.741138] input: Logitech USB Receiver as /devices/pci0000:00/0000:00:08.1/0000:08:00.3/usb1/1-1/1-1.2/1-1.2:1.0/0003:046D:C548.0004/input/input8
[    6.824309] usb 1-1.4.2: new full-speed USB device number 6 using xhci_hcd
[    6.888681] hub 2-1.4:1.0: hub_ext_port_status failed (err = -71)
[    6.888750] hid-generic 0003:046D:C548.0004: input,hidraw3: USB HID v1.11 Keyboard [Logitech USB Receiver] on usb-0000:08:00.3-1.2/input0
[    6.889146] input: Logitech USB Receiver Mouse as /devices/pci0000:00/0000:00:08.1/0000:08:00.3/usb1/1-1/1-1.2/1-1.2:1.1/0003:046D:C548.0005/input/input9
[    6.889291] input: Logitech USB Receiver Consumer Control as /devices/pci0000:00/0000:00:08.1/0000:08:00.3/usb1/1-1/1-1.2/1-1.2:1.1/0003:046D:C548.0005/input/input10
[    6.897179] hub 2-1.4:1.0: hub_ext_port_status failed (err = -71)
[    6.948638] input: Logitech USB Receiver System Control as /devices/pci0000:00/0000:00:08.1/0000:08:00.3/usb1/1-1/1-1.2/1-1.2:1.1/0003:046D:C548.0005/input/input11
[    6.948724] hid-generic 0003:046D:C548.0005: input,hidraw4: USB HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:08:00.3-1.2/input1
[    6.948866] hid-generic 0003:046D:C548.0006: hiddev2,hidraw5: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:08:00.3-1.2/input2
[    6.998638] usb 1-1.4.2: New USB device found, idVendor=051d, idProduct=0002, bcdDevice= 0.90
[    6.998645] usb 1-1.4.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    6.998647] usb 1-1.4.2: Product: Back-UPS NS 1350M2 FW:954.e3 .D USB FW:e3     
[    6.998649] usb 1-1.4.2: Manufacturer: American Power Conversion
[    6.998651] usb 1-1.4.2: SerialNumber: 3B1741X04129  
[    7.063179] usb 2-1.4: Failed to suspend device, error -71
[    7.064083] hid-generic 0003:051D:0002.0007: hiddev3,hidraw6: USB HID v1.00 Device [American Power Conversion Back-UPS NS 1350M2 FW:954.e3 .D USB FW:e3     ] on usb-0000:08:00.3-1.4.2/input0
[    7.253051] logitech-djreceiver 0003:046D:C52B.0003: hiddev0,hidraw0: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:08:00.3-1.1/input2
[    7.375346] input: Logitech Wireless Device PID:408a Keyboard as /devices/pci0000:00/0000:00:08.1/0000:08:00.3/usb1/1-1/1-1.1/1-1.1:1.2/0003:046D:C52B.0003/0003:046D:408A.0008/input/input12
[    7.488348] input: Logitech Wireless Device PID:408a Mouse as /devices/pci0000:00/0000:00:08.1/0000:08:00.3/usb1/1-1/1-1.1/1-1.1:1.2/0003:046D:C52B.0003/0003:046D:408A.0008/input/input13
[    7.488447] hid-generic 0003:046D:408A.0008: input,hidraw1: USB HID v1.11 Keyboard [Logitech Wireless Device PID:408a] on usb-0000:08:00.3-1.1/input2:2
[    7.614869] usb 2-1.4: reset SuperSpeed USB device number 3 using xhci_hcd
[    7.695030] input: Logitech MX Keys as /devices/pci0000:00/0000:00:08.1/0000:08:00.3/usb1/1-1/1-1.1/1-1.1:1.2/0003:046D:C52B.0003/0003:046D:408A.0008/input/input17
[    7.792307] usb 1-1.4.3: new high-speed USB device number 7 using xhci_hcd
[    7.796465] logitech-hidpp-device 0003:046D:408A.0008: input,hidraw1: USB HID v1.11 Keyboard [Logitech MX Keys] on usb-0000:08:00.3-1.1/input2:2
[    8.162182] usb 1-1.4.3: New USB device found, idVendor=046d, idProduct=0825, bcdDevice= 0.12
[    8.162192] usb 1-1.4.3: New USB device strings: Mfr=0, Product=0, SerialNumber=2
[    8.162195] usb 1-1.4.3: SerialNumber: 1E0B63F0
[   12.800382] usb 2-1.4: can't restore configuration #1 (error=-110)
[   12.800679] hub 2-1.4:1.0: set hub depth failed
[   12.976335] usb 1-1.4.4: new full-speed USB device number 8 using xhci_hcd
[   13.148678] usb 1-1.4.4: New USB device found, idVendor=1532, idProduct=0531, bcdDevice= 1.00
[   13.148687] usb 1-1.4.4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[   13.148690] usb 1-1.4.4: Product: Razer Seiren Mini
[   13.148692] usb 1-1.4.4: Manufacturer: Razer Inc
[   13.148693] usb 1-1.4.4: SerialNumber: UC2116L03302382
[   13.208273] hid-generic 0003:1532:0531.0009: No inputs registered, leaving
[   13.208876] hid-generic 0003:1532:0531.0009: hidraw2: USB HID v1.11 Device [Razer Inc Razer Seiren Mini] on usb-0000:08:00.3-1.4.4/input2
[   13.504573] usb 2-1.4: USB disconnect, device number 3
[   13.604972] usb 2-1.4: Device not responding to setup address.
[   13.820572] usb 2-1.4: Device not responding to setup address.
[   14.028596] usb 2-1.4: device not accepting address 4, error -71
[   14.357259] usb 2-1.4: new SuperSpeed USB device number 5 using xhci_hcd
[   14.406294] usb 2-1.4: New USB device found, idVendor=2109, idProduct=0815, bcdDevice= 7.04
[   14.406304] usb 2-1.4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[   14.406305] usb 2-1.4: Product: USB3.0 Hub             
[   14.406306] usb 2-1.4: Manufacturer: VIA Labs, Inc.         
[   14.431018] hub 2-1.4:1.0: USB hub found
[   14.431150] hub 2-1.4:1.0: 4 ports detected
[   15.071013] usb 2-1.4: reset SuperSpeed USB device number 5 using xhci_hcd
[   15.188260] raid6: avx512x4 gen() 46185 MB/s
[   15.256258] raid6: avx512x2 gen() 46715 MB/s
[   15.324259] raid6: avx512x1 gen() 38221 MB/s
[   15.392259] raid6: avx2x4   gen() 47513 MB/s
[   15.460250] raid6: avx2x2   gen() 42067 MB/s
[   15.528259] raid6: avx2x1   gen() 27728 MB/s
[   15.528260] raid6: using algorithm avx2x4 gen() 47513 MB/s
[   15.585606] ------------[ cut here ]------------
[   15.585607] URB 00000000ed1c678e submitted while active
[   15.585620] WARNING: CPU: 17 PID: 569 at drivers/usb/core/urb.c:379 usb_submit_urb+0x648/0x670 [usbcore]
[   15.585632] Modules linked in: raid6_pq(+) libcrc32c crc32c_generic raid1 raid0 md_mod hid_logitech_hidpp hid_logitech_dj hid_generic usbhid hid amdgpu amdxcp drm_exec gpu_sched drm_buddy i2c_algo_bit drm_suballoc_helper drm_display_helper crct10dif_pclmul cec crc32_pclmul rc_core crc32c_intel drm_ttm_helper ghash_clmulni_intel ttm xhci_pci sha512_ssse3 drm_kms_helper xhci_hcd sha256_ssse3 nvme drm i2c_piix4 usbcore video sha1_ssse3 nvme_core igc crc16 i2c_smbus usb_common wmi button aesni_intel gf128mul crypto_simd cryptd
[   15.585654] CPU: 17 UID: 0 PID: 569 Comm: kworker/17:1 Not tainted 6.11.4-amd64 #1  Debian 6.11.4-1
[   15.585657] Hardware name: Micro Computer (HK) Tech Limited AtomMan G Series/DRBAA, BIOS 1.04 08/01/2024
[   15.585658] Workqueue: events_power_efficient hub_init_func2 [usbcore]
[   15.585665] RIP: 0010:usb_submit_urb+0x648/0x670 [usbcore]
[   15.585672] Code: 6e 69 c0 e8 8a d3 29 ef eb d9 b8 fe ff ff ff e9 0f fd ff ff 48 89 fe 48 c7 c7 70 a9 6b c0 c6 05 41 d6 01 00 01 e8 38 49 c4 ee <0f> 0b eb 9f b8 f8 ff ff ff e9 eb fc ff ff 66 2e 0f 1f 84 00 00 00
[   15.585673] RSP: 0018:ffffa5d101653db8 EFLAGS: 00010282
[   15.585675] RAX: 0000000000000000 RBX: ffff8de07df5c600 RCX: 0000000000000003
[   15.585676] RDX: 0000000000000000 RSI: 0000000000000003 RDI: 0000000000000001
[   15.585677] RBP: 0000000000000000 R08: 0000000000000000 R09: ffffa5d101653c38
[   15.585678] R10: ffff8de07cfbffa8 R11: 0000000000000003 R12: ffff8dd19ebbd000
[   15.585678] R13: ffff8dd1a8551000 R14: 0000000000000000 R15: 0000000000000005
[   15.585679] FS:  0000000000000000(0000) GS:ffff8de07d880000(0000) knlGS:0000000000000000
[   15.585680] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   15.585681] CR2: 0000564b523a70b0 CR3: 000000094ec22000 CR4: 0000000000750ef0
[   15.585682] PKRU: 55555554
[   15.585683] Call Trace:
[   15.585685]  <TASK>
[   15.585686]  ? usb_submit_urb+0x648/0x670 [usbcore]
[   15.585691]  ? __warn.cold+0x8e/0xe8
[   15.585694]  ? usb_submit_urb+0x648/0x670 [usbcore]
[   15.585699]  ? report_bug+0xff/0x140
[   15.585701]  ? console_unlock+0x84/0x130
[   15.585703]  ? handle_bug+0x3c/0x80
[   15.585705]  ? exc_invalid_op+0x17/0x70
[   15.585707]  ? asm_exc_invalid_op+0x1a/0x20
[   15.585710]  ? usb_submit_urb+0x648/0x670 [usbcore]
[   15.585715]  ? usb_submit_urb+0x648/0x670 [usbcore]
[   15.585721]  hub_activate+0x285/0x8a0 [usbcore]
[   15.585726]  ? srso_alias_return_thunk+0x5/0xfbef5
[   15.585729]  process_one_work+0x174/0x330
[   15.585731]  worker_thread+0x252/0x390
[   15.585733]  ? __pfx_worker_thread+0x10/0x10
[   15.585735]  kthread+0xcf/0x100
[   15.585737]  ? __pfx_kthread+0x10/0x10
[   15.585739]  ret_from_fork+0x31/0x50
[   15.585741]  ? __pfx_kthread+0x10/0x10
[   15.585743]  ret_from_fork_asm+0x1a/0x30
[   15.585746]  </TASK>
[   15.585747] ---[ end trace 0000000000000000 ]---
[   15.585748] hub 2-1.4:1.0: activate --> -16

$ lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 2109:2817 VIA Labs, Inc. USB2.0 Hub             
Bus 001 Device 003: ID 046d:c52b Logitech, Inc. Unifying Receiver
Bus 001 Device 004: ID 046d:c548 Logitech, Inc. Logi Bolt Receiver
Bus 001 Device 005: ID 2109:2815 VIA Labs, Inc. USB2.0 Hub             
Bus 001 Device 006: ID 051d:0002 American Power Conversion Uninterruptible Power Supply
Bus 001 Device 007: ID 046d:0825 Logitech, Inc. Webcam C270
Bus 001 Device 008: ID 1532:0531 Razer USA, Ltd Razer Seiren Mini
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 002 Device 002: ID 2109:0817 VIA Labs, Inc. USB3.0 Hub             
Bus 002 Device 022: ID 2109:0815 VIA Labs, Inc. USB3.0 Hub             
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 005 Device 002: ID 13d3:3604 IMC Networks Wireless_Device
Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub

$ lspci
00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14d8
00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Device 14d9
00:01.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14da
00:01.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Device 14db
00:01.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] Device 14db
00:01.3 PCI bridge: Advanced Micro Devices, Inc. [AMD] Device 14db
00:02.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14da
00:02.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Device 14db
00:03.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14da
00:03.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Device 14db
00:04.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14da
00:08.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14da
00:08.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Device 14dd
00:08.3 PCI bridge: Advanced Micro Devices, Inc. [AMD] Device 14dd
00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev 71)
00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge (rev 51)
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14e0
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14e1
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14e2
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14e3
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14e4
00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14e5
00:18.6 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14e6
00:18.7 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14e7
01:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Upstream Port of PCI Express Switch (rev 12)
02:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Downstream Port of PCI Express Switch (rev 12)
03:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Navi 33 [Radeon RX 7600/7600 XT/7600M XT/7600S/7700S / PRO W7600] (rev c7)
03:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Navi 31 HDMI/DP Audio
04:00.0 Non-Volatile memory controller: Intel Corporation SSD 660P Series (rev 03)
05:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe SSD Controller PM9A1/PM9A3/980PRO
06:00.0 Network controller: MEDIATEK Corp. Device 7925
07:00.0 Ethernet controller: Intel Corporation Ethernet Controller I226-V (rev 04)
08:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, Inc. [AMD] Phoenix PCIe Dummy Function (rev d8)
08:00.2 Encryption controller: Advanced Micro Devices, Inc. [AMD] Family 19h PSP/CCP
08:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Device 15b6
08:00.4 USB controller: Advanced Micro Devices, Inc. [AMD] Device 15b7
08:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD] ACP/ACP3X/ACP6x Audio Coprocessor (rev 62)
08:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Family 17h/19h HD Audio Controller
09:00.0 USB controller: Advanced Micro Devices, Inc. [AMD] Device 15b8






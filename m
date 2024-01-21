Return-Path: <linux-usb+bounces-5316-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC96E835711
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jan 2024 18:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DAAD1F21AE0
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jan 2024 17:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68966381B8;
	Sun, 21 Jan 2024 17:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4AV6PDo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB8C22069
	for <linux-usb@vger.kernel.org>; Sun, 21 Jan 2024 17:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705857503; cv=none; b=DYh6C1EkyaYgbN79Xp9KEDXJJOX3lE2YzY1W3jSd+sSNWqz/Blvjq2Uhl2IByOayY01wD24aA6jjDhfKTM/qagYMy1f2TmHbXbrxPfncw7ZTLsv/1NGprnb50denVPSTTTGwO6NR0HDNW2yfuNyXSQKwZXr+AimISJl6Y3L2Tzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705857503; c=relaxed/simple;
	bh=S8FqEjKqVevR5x4Zx6d37b7rsO4zR2IP7d+b/SS0NuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jAfnFxH3RLnpQtiocbXtKSIL6Z1UA9ydLvrWA7iTAK69Jd3MQnctsF+Qnb0WMbXWGYKs1GTrq9cmzZnFOfOrNAtWynLqL0Q39/+UP4rB7auYajh5kkhQBsJG25W1KpS8uOX7oE6BlHwWDIQVDPTLXkOAU2BUpfn/oXj4Ie5UUSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4AV6PDo; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a2c67be31edso278276866b.0
        for <linux-usb@vger.kernel.org>; Sun, 21 Jan 2024 09:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705857499; x=1706462299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FtdA/OaEAsiKwoushprWT7IsQpK7PnZsWk+//YXiKnI=;
        b=V4AV6PDoV1p3i8QeTa/zHdScIxDhgiBFw3SPthjyTREx5hx3LX49Fo8Io6GOw6mMhA
         vqhUkt16v8f8oSeuxbGjQxUa8KOpVEpX+A+PkrbJaN5LW5KfFOsGVWhZJDOZiROXD3lU
         N37gevYInAy/CveJr2uZLKOLHgakOphNYa7h+hReVdNqaOUpHLdKX4LMY5pcyI0+57IL
         qpEbIchm6dtCeSYeRfWoDmybfeVDdXUMyhWwLgjQ8xElgEvKIyGBnw62sERKOjoZJB6c
         T4JXInBTWR3wSUqciVAgYKEPKghMHvzuUSpjUWV5qy9K7X8O/dJgmirMLknZahj6Eu+0
         82pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705857499; x=1706462299;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FtdA/OaEAsiKwoushprWT7IsQpK7PnZsWk+//YXiKnI=;
        b=enj4Q97amizm2A+8YN3seqbWlXfdyO49M2oCftceAItnKpYgRc9m9SKWqanGfEzdGj
         oL4g91f54OEJHp52KZhEDTMVjrm5QOlaU1kYk/DgSSyvtii7usbzN+2iyMyDG2PrVm7E
         R0nI2V6brtrpIbdrSv8Ja3wxpLLOW+vgn9tCZgkGHMw7qpIQ4xfl3jeVPQuDTZsBSELD
         k9vgIfeneodcfEy8j+DWqufmmR/2Bh5gsIabsCX8y0UaXCeTIvX0PnrVuO+ygkhIsxLU
         BeanPPepQ1x6rOv8HjmB/Ox3n45bjNeiwljTHW+6xSGM+0kH7HoNf/RCY6zuWsinCIEm
         4Vng==
X-Gm-Message-State: AOJu0Yya+6pm8J8jNP0oudjnHWMU10Qe2sJJWwIM4O9cZHVBzAZdKnMf
	H0F1M+OKYmb+LldrAfycD05osoDwPWTWDMw3Agat8C166bA+v0RF9q6tSWTK
X-Google-Smtp-Source: AGHT+IFv3n7IhSKHaN/IGRLc8ONcGHa+1yin0c3mpzNtcmT4Jkxoxr0Z7L6lXLII7weGzTMjoD6zsg==
X-Received: by 2002:a17:906:690:b0:a2f:76b8:6956 with SMTP id u16-20020a170906069000b00a2f76b86956mr921234ejb.25.1705857499367;
        Sun, 21 Jan 2024 09:18:19 -0800 (PST)
Received: from foxbook (acgj208.neoplus.adsl.tpnet.pl. [83.9.237.208])
        by smtp.gmail.com with ESMTPSA id vi14-20020a170907d40e00b00a2f1a1259fesm4299719ejc.207.2024.01.21.09.18.18
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 21 Jan 2024 09:18:19 -0800 (PST)
Date: Sun, 21 Jan 2024 18:18:15 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: NULL dereference on disconnection during usb_set_interface()
Message-ID: <20240121181815.4ab01525@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I encountered an interesting race. This USB camera appears to have got
stuck and dropped by the bus during video stream initialization, leading 
to an oops. This is a one time occurrence, not reproducible. Maybe not
a very severe issue due to narrow window of opportunity, but still...

Linux v6.7, the host is XHCI.

The first message below comes from uvc_video_start_transfer(). It is
meant to be followed immediately by a call to usb_set_interface() and
apparently during this call things went weird.

After a half second delay the device was disconnected and another five
seconds later a NULL pointer dereference occured.

The crashing function is usb_ifnum_to_if() and disassembly suggests that
the dereferenced NULL value was config->interface[i], for unknown i.

Thanks,
Michal


[ 7079.664238] usb 9-2: Selecting alternate setting 9 (20480 B/frame bandwidth)
[ 7080.202494] usb 9-2: USB disconnect, device number 2
[ 7085.158804] BUG: kernel NULL pointer dereference, address: 0000000000000000
[ 7085.158814] #PF: supervisor read access in kernel mode
[ 7085.158816] #PF: error_code(0x0000) - not-present page
[ 7085.158818] PGD 0 P4D 0 
[ 7085.158822] Oops: 0000 [#1] PREEMPT SMP
[ 7085.158825] CPU: 0 PID: 12833 Comm: yavta Not tainted 6.7.0 #3
[ 7085.158829] Hardware name: MICRO-STAR INTERNATIONAL CO.,LTD MS-7596/760GM -E51 (MS-7596), BIOS V1.10 02/28/2011
[ 7085.158832] RIP: 0010:usb_ifnum_to_if+0x38/0x50
[ 7085.158839] Code: d2 74 32 0f b6 4a 04 84 c9 74 2e ff c9 48 8d 82 98 00 00 00 48 8d bc ca a0 00 00 00 eb 09 48 83 c0 08 48 39 f8 74 12 48 8b 10 <48> 8b 0a 0f b6 49 02 39 f1 75 e9 48 89 d0 c3 31 d2 48 89 d0 c3 0f
[ 7085.158842] RSP: 0018:ffffc90000d1fba0 EFLAGS: 00010202
[ 7085.158845] RAX: ffff88812deb5898 RBX: ffff88812d78e000 RCX: 0000000000000002
[ 7085.158847] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff88812deb58b0
[ 7085.158849] RBP: 0000000000000000 R08: ffffffff826dad88 R09: ffffffff826dad88
[ 7085.158850] R10: 0000000000000400 R11: 0000000000000000 R12: ffff88812ddfd570
[ 7085.158852] R13: 00000000ffffff92 R14: ffff88812ddfd408 R15: ffff88812ddb7000
[ 7085.158854] FS:  00007f4d672ab740(0000) GS:ffff88820fe00000(0000) knlGS:0000000000000000
[ 7085.158856] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 7085.158858] CR2: 0000000000000000 CR3: 000000014c0f5000 CR4: 00000000000006f0
[ 7085.158860] Call Trace:
[ 7085.158863]  <TASK>
[ 7085.158867]  ? __die+0x2d/0x80
[ 7085.158870]  ? page_fault_oops+0x15d/0x420
[ 7085.158874]  ? fixup_exception+0x36/0x280
[ 7085.158879]  ? exc_page_fault+0x74/0x150
[ 7085.158882]  ? asm_exc_page_fault+0x22/0x30
[ 7085.158887]  ? usb_ifnum_to_if+0x38/0x50
[ 7085.158890]  usb_hcd_alloc_bandwidth+0x208/0x310
[ 7085.158895]  usb_set_interface+0x128/0x400
[ 7085.158899]  uvc_video_start_transfer+0x1c4/0x600 [uvcvideo]
[ 7085.158908]  uvc_video_start_streaming+0x79/0xc0 [uvcvideo]
[ 7085.158914]  uvc_start_streaming+0x41/0x100 [uvcvideo]
[ 7085.158922]  vb2_start_streaming+0x60/0x120 [videobuf2_common]
[ 7085.158928]  vb2_core_streamon+0xc2/0x160 [videobuf2_common]
[ 7085.158934]  uvc_queue_streamon+0x35/0x60 [uvcvideo]
[ 7085.158940]  uvc_ioctl_streamon+0x46/0x70 [uvcvideo]
[ 7085.158947]  __video_do_ioctl+0x38a/0x460 [videodev]
[ 7085.158957]  video_usercopy+0x26c/0x720 [videodev]
[ 7085.158965]  ? v4l_prepare_buf+0x80/0x80 [videodev]
[ 7085.158974]  v4l2_ioctl+0x45/0x50 [videodev]
[ 7085.158982]  __x64_sys_ioctl+0xae/0xd0
[ 7085.158987]  ? exit_to_user_mode_prepare+0x7a/0x120
[ 7085.158991]  do_syscall_64+0x2c/0xd0
[ 7085.158994]  entry_SYSCALL_64_after_hwframe+0x46/0x4e
[ 7085.158998] RIP: 0033:0x7f4d673ba3af
[ 7085.159002] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
[ 7085.159004] RSP: 002b:00007ffeecff6480 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[ 7085.159007] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f4d673ba3af
[ 7085.159009] RDX: 00007ffeecff64e4 RSI: 0000000040045612 RDI: 0000000000000003
[ 7085.159010] RBP: 0000000000000001 R08: 0000000000000078 R09: 000055eca2bc36b0
[ 7085.159012] R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffeecff6640
[ 7085.159014] R13: 000055eca2bc3a68 R14: 00000000003a9800 R15: 00000000003a9800
[ 7085.159017]  </TASK>
[ 7085.159018] Modules linked in: xhci_pci xhci_hcd uvcvideo ccm uvc videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videodev videobuf2_common ext2 ath5k mac80211 libarc4 ath serio_raw cfg80211 snd_pcsp dm_mod nfnetlink ip_tables x_tables [last unloaded: xhci_hcd]
[ 7085.159036] CR2: 0000000000000000
[ 7085.159038] ---[ end trace 0000000000000000 ]---


Disassembly:

0000000000000380 <usb_ifnum_to_if>:
 380:   e8 00 00 00 00          call   385 <usb_ifnum_to_if+0x5>
 385:   48 8b 97 a8 03 00 00    mov    0x3a8(%rdi),%rdx
 38c:   48 85 d2                test   %rdx,%rdx
 38f:   74 32                   je     3c3 <usb_ifnum_to_if+0x43>
 391:   0f b6 4a 04             movzbl 0x4(%rdx),%ecx
 395:   84 c9                   test   %cl,%cl
 397:   74 2e                   je     3c7 <usb_ifnum_to_if+0x47>
 399:   ff c9                   dec    %ecx
 39b:   48 8d 82 98 00 00 00    lea    0x98(%rdx),%rax
 3a2:   48 8d bc ca a0 00 00    lea    0xa0(%rdx,%rcx,8),%rdi
 3a9:   00 
 3aa:   eb 09                   jmp    3b5 <usb_ifnum_to_if+0x35>
 3ac:   48 83 c0 08             add    $0x8,%rax
 3b0:   48 39 f8                cmp    %rdi,%rax
 3b3:   74 12                   je     3c7 <usb_ifnum_to_if+0x47>
 3b5:   48 8b 10                mov    (%rax),%rdx
 3b8:   48 8b 0a                mov    (%rdx),%rcx
 3bb:   0f b6 49 02             movzbl 0x2(%rcx),%ecx
 3bf:   39 f1                   cmp    %esi,%ecx
 3c1:   75 e9                   jne    3ac <usb_ifnum_to_if+0x2c>
 3c3:   48 89 d0                mov    %rdx,%rax
 3c6:   c3                      ret
 3c7:   31 d2                   xor    %edx,%edx
 3c9:   48 89 d0                mov    %rdx,%rax
 3cc:   c3                      ret
 3cd:   0f 1f 00                nopl   (%rax)


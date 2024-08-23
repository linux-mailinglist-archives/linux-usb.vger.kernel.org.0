Return-Path: <linux-usb+bounces-13992-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6A095D5FF
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 21:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8287B2840BE
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 19:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8F41925BA;
	Fri, 23 Aug 2024 19:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b="N6OB1mxn"
X-Original-To: linux-usb@vger.kernel.org
Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90878F6B
	for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2024 19:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.140.72.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724440744; cv=none; b=F9MDw4zS/lmP7eXBmJFyx+Wp+r8b/dSewhW42M23BhoKVcNlhjXn2EKxqF39rJW0iXi6oPvx6xr56HPCD4tl5eKEyYotGLzPpNRcH7u8DoSBV3Yx45I5byWSmI3tHXVKCzq7mfk06mLI3UFD2wGw4L3kJYY7swUdjix3IPaEAR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724440744; c=relaxed/simple;
	bh=xHoofy8BUtq7m0/i4oy5rc3I/ePPHwR6CgXsl66iWuQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CI8A7UVR4omJLSnvgGcvhiFKPHG52ISjZn1Hn7KjYJEX/boHxmsEk6L9HM8mlSrAQ2B/6FRoZm4ruWwaihubMWjBaxhYW5gL5pORnC+ayqtk1oLBXB3tVBWvkBRHkSNBLiZBq3Sdn7inMOtbrPKej3zyGNDhDHT4yVqnGEEvbPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch; spf=pass smtp.mailfrom=alphanet.ch; dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b=N6OB1mxn; arc=none smtp.client-ip=46.140.72.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alphanet.ch
Received: by shakotay.alphanet.ch (Postfix, from userid 1022)
	id 767391241ED7; Fri, 23 Aug 2024 21:18:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
	t=1724440736; bh=xHoofy8BUtq7m0/i4oy5rc3I/ePPHwR6CgXsl66iWuQ=;
	h=Date:From:To:Subject:From;
	b=N6OB1mxnxM1VyDWfk5MscKlr5GnfNH2lXH4lRlbRn+Fjg+YgoOFS8LmXIV0zDoaPm
	 C95vplK1l07XsV57TeeqiVUHztw5OnIaU3i8z9wYjDaH+TWmRjaLLW3H/znXD/h0Dr
	 6KN3poWJPPJYUEllbzX0dDNTT0V2fihPbsZEQgj71sOi7xAsZhltE7d+rX33k64QvB
	 25o8K2DJRR/FtCamCehCWkm7ydfM/Y8KYjN6GX4y4I2RG/ij0gs1ebLlYR5mbUWjJN
	 FwAJEAZi841bX2y6Y/rMzx2GSt+mZjy2AaRocH66jX+n3MMSQxbnqPiGq42ogEEVTd
	 2zkKz3vha0ISw==
Received: from reliant.alphanet.ch (reliant.alphanet.ch [192.168.1.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shakotay.alphanet.ch (Postfix) with ESMTPS id 6F9621241330
	for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2024 21:18:48 +0200 (CEST)
Received: by reliant.alphanet.ch (Postfix, from userid 1000)
	id 6078A76CA64; Fri, 23 Aug 2024 21:18:48 +0200 (CEST)
Date: Fri, 23 Aug 2024 21:18:48 +0200
From: Marc SCHAEFER <schaefer@alphanet.ch>
To: linux-usb@vger.kernel.org
Subject: Strange issues with USB device
Message-ID: <ZsjgmCjHdzck9UKd@alphanet.ch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,
   
Doing a lot of reads on USB devices, I get sometimes these errors (~ every 20 to 30 minutes):
(each time on a different drive)
   
   Aug 23 19:13:02 video kernel: [ 9007.574197] xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd invalid because of stream ID configuration
   Aug 23 19:13:02 video udisksd[967]: Error performing housekeeping for drive /org/freedesktop/UDisks2/drives/WDC_WD40EURX_63BMCY0_WD_WCC7K2RV8LZ4: Error updating SMART data: sk_disk_smart_read_data: Operation not supported (udisks-error-quark, 0)
   Aug 23 19:13:02 video kernel: [ 9007.601188] sd 16:0:0:0: [sdc] tag#0 data cmplt err -75 uas-tag 5 inflight: CMD
   Aug 23 19:13:02 video kernel: [ 9007.601190] DMAR: DRHD: handling fault status reg 3
   Aug 23 19:13:02 video kernel: [ 9007.601194] DMAR: [DMA Write] Request device [01:00.0] PASID ffffffff fault addr f2e69000 [fault reason 05] PTE Write access is not set
   Aug 23 19:13:02 video kernel: [ 9007.601199] sd 16:0:0:0: [sdc] tag#0 CDB: Read(16) 88 00 00 00 00 00 ac d4 30 80 00 00 04 00 00 00
   Aug 23 19:13:02 video kernel: [ 9007.693901] xhci_hcd 0000:01:00.0: WARN Event TRB for slot 10 ep 10 with no TDs queued?
   
   [ many ]
   
   Aug 23 19:13:21 video kernel: [ 9026.706893] xhci_hcd 0000:01:00.0: WARN Set TR deq ptr command for freed stream ID 37025
   Aug 23 19:13:21 video kernel: [ 9026.711876] sd 16:0:0:0: [sdc] tag#0 FAILED Result: hostbyte=DID_OK driverbyte=DRIVER_SENSE cmd_age=19s
   Aug 23 19:13:21 video kernel: [ 9026.711880] sd 16:0:0:0: [sdc] tag#0 Sense Key : Illegal Request [current]
   Aug 23 19:13:21 video kernel: [ 9026.711883] sd 16:0:0:0: [sdc] tag#0 Add. Sense: Invalid command operation code
   Aug 23 19:13:21 video kernel: [ 9026.711887] sd 16:0:0:0: [sdc] tag#0 CDB: Read(16) 88 00 00 00 00 00 ac d4 30 80 00 00 04 00 00 00
   Aug 23 19:13:21 video kernel: [ 9026.711891] blk_update_request: critical target error, dev sdc, sector 2899587200 op 0x0:(READ) flags 0x4000 phys_seg 128 prio class 0
   Aug 23 19:13:21 video kernel: [ 9026.737762] xhci_hcd 0000:01:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 10 comp_code 4
   Aug 23 19:13:21 video kernel: [ 9026.737770] xhci_hcd 0000:01:00.0: Looking for event-dma 00000000ffdce4e0 trb-start 00000000ffdcece0 trb-end 0000000000000000 seg-start 00000000ffdce000 seg-end 00000000ffdceff0
   Aug 23 19:13:21 video kernel: [ 9026.737773] xhci_hcd 0000:01:00.0: Looking for event-dma 00000000ffdce4e0 trb-start 00000000ffdcd000 trb-end 00000000ffdcd4e0 seg-start 00000000ffdcd000 seg-end 00000000ffdcdff0
   Aug 23 19:13:32 video kernel: [ 9037.762813] sd 16:0:0:0: [sdc] tag#5 uas_eh_abort_handler 0 uas-tag 4 inflight: CMD IN
   Aug 23 19:13:32 video kernel: [ 9037.762819] sd 16:0:0:0: [sdc] tag#5 CDB: Read(16) 88 00 00 00 00 00 ac d4 3c 80 00 00 04 00 00 00
   Aug 23 19:13:32 video kernel: [ 9037.763066] sd 16:0:0:0: [sdc] tag#4 uas_eh_abort_handler 0 uas-tag 2 inflight: CMD IN
   Aug 23 19:13:32 video kernel: [ 9037.763072] sd 16:0:0:0: [sdc] tag#4 CDB: Read(16) 88 00 00 00 00 00 ac d4 38 80 00 00 04 00 00 00
   Aug 23 19:13:32 video kernel: [ 9037.763094] xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
   Aug 23 19:13:32 video kernel: [ 9037.763269] sd 16:0:0:0: [sdc] tag#2 uas_eh_abort_handler 0 uas-tag 6 inflight: IN
   Aug 23 19:13:32 video kernel: [ 9037.763272] sd 16:0:0:0: [sdc] tag#2 CDB: Read(16) 88 00 00 00 00 00 ac d4 20 80 00 00 04 00 00 00
   Aug 23 19:13:32 video kernel: [ 9037.763318] xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
   Aug 23 19:13:32 video kernel: [ 9037.763484] xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
   Aug 23 19:13:40 video kernel: [ 9045.792699] usb 4-1.1.2: stat urb: no pending cmd for uas-tag 2
   Aug 23 19:13:40 video smartd[963]: Device: /dev/sdc [SAT], Read SMART Self Test Log Failed
   Aug 23 19:13:40 video smartd[963]: Sending warning via /usr/share/smartmontools/smartd-runner to root ...
   Aug 23 19:13:40 video kernel: [ 9045.792965] xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
   Aug 23 19:13:40 video smartd[963]: Warning via /usr/share/smartmontools/smartd-runner to root: successful
   Aug 23 19:13:52 video kernel: [ 9057.475000] sd 16:0:0:0: [sdc] tag#0 uas_eh_abort_handler 0 uas-tag 5 inflight: CMD IN
   Aug 23 19:13:52 video kernel: [ 9057.475006] sd 16:0:0:0: [sdc] tag#0 CDB: Read(16) 88 00 00 00 00 00 ac d4 40 80 00 00 04 00 00 00
   Aug 23 19:13:52 video kernel: [ 9057.475248] xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
   Aug 23 19:13:52 video kernel: [ 9057.498985] scsi host16: uas_eh_device_reset_handler start
   Aug 23 19:13:52 video kernel: [ 9057.591061] usb 4-1.1.2: reset SuperSpeedPlus Gen 2 USB device number 7 using xhci_hcd
   Aug 23 19:13:52 video kernel: [ 9057.638613] scsi host16: uas_eh_device_reset_handler success

It looks like there is a SMART query which maybe leads to a timeout, but does
it look more like a USB host or target issue?

I found some references to udisksd flooding logs when a disk is idle, but I am
sure it is not idle, there were a lot of reads on that device running according
to saidar.

Should I disable SMART udisksd polling on those drives?  It does not really
look it's easy to disable this with udisksd.

Hardware:
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 10000M
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 10000M       
        |__ Port 1: Dev 4, If 0, Class=Hub, Driver=hub/4p, 10000M  
            |__ Port 2: Dev 7, If 0, Class=Mass Storage, Driver=uas, 10000M  
            |__ Port 3: Dev 8, If 0, Class=Mass Storage, Driver=uas, 10000M 
            |__ Port 1: Dev 6, If 0, Class=Mass Storage, Driver=uas, 10000M
            |__ Port 4: Dev 9, If 0, Class=Mass Storage, Driver=uas, 10000M

An USB enclosure:
   Bus 004 Device 009: ID 2109:0715 VIA Labs, Inc. VL817 SATA Adaptor
   Bus 004 Device 008: ID 2109:0715 VIA Labs, Inc. VL817 SATA Adaptor
   Bus 004 Device 007: ID 2109:0715 VIA Labs, Inc. VL817 SATA Adaptor
   Bus 004 Device 006: ID 2109:0715 VIA Labs, Inc. VL817 SATA Adaptor

   Bus 004 Device 004: ID 2109:8822 VIA Labs, Inc. USB3.1 Hub
   Bus 004 Device 002: ID 2109:0822 VIA Labs, Inc. USB3.1 Hub

the host, I think it's this one:
   01:00.0 USB controller: ASMedia Technology Inc. ASM2142 USB 3.1 Host Controller [1b21:2142]

Smart info on those 4 drives:
   root@video:~# for i in b c d e; do smartctl -a /dev/sd$i|grep Device; done
   Device Model:     WDC WD40EURX-63BMCY0
   LU WWN Device Id: 5 0014ee 2bca07681
   Device is:        Not in smartctl database [for details use: -P showall]
   Device Model:     WDC WD40EURX-63BMCY0
   LU WWN Device Id: 5 0014ee 26720014d
   Device is:        Not in smartctl database [for details use: -P showall]
   Device Model:     WDC WD40EURX-63BMCY0
   LU WWN Device Id: 5 0014ee 267201249
   Device is:        Not in smartctl database [for details use: -P showall]
   Device Model:     WDC WD40EURX-63BMCY0
   LU WWN Device Id: 5 0014ee 2674ab7b3
   Device is:        Not in smartctl database [for details use: -P showall]

Do you have any suggestion?

Thank you.


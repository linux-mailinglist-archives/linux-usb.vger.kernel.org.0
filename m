Return-Path: <linux-usb+bounces-14070-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B7995E7D9
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 07:17:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC315B20D9F
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 05:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036F86E2BE;
	Mon, 26 Aug 2024 05:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b="i6hICHDJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29591CD31
	for <linux-usb@vger.kernel.org>; Mon, 26 Aug 2024 05:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.140.72.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724649448; cv=none; b=WWafaSGdozB1OaoxjYp4flHgiDnFsabvIAC8Tj3eO0jWiqldYilA+ZxC5nhGR1r3XkX6a2nJRTTEDjPB1l4nZNSw1c+tzcvB6dTmym2VCufllCXDlgkJig7Etna5w8D0HegCWWcq29AsUaGi9KNsIdjNi2E0kgUtfKH0GgUq3vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724649448; c=relaxed/simple;
	bh=JdDxuhEWTHQogevrbKRgAKGJR5oBTumlhlkBNVErFdg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ATPG+Ybe/hlbGbshV1Oyq2a/2qod5YXdFgs9UGvDyYIUXwQ0KUT35EOehiC9GE9viu4hiarKpP007gmpZUJQjBoLtTxjTGCiAEVGh7AZVzQurQomSERvjx/bF5dFwqYeTBJqUQh8Kz1iqHY/18VOYJceUmM8vVTRjBupbaFqgY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch; spf=pass smtp.mailfrom=alphanet.ch; dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b=i6hICHDJ; arc=none smtp.client-ip=46.140.72.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alphanet.ch
Received: by shakotay.alphanet.ch (Postfix, from userid 1022)
	id 6C2161240986; Mon, 26 Aug 2024 07:17:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
	t=1724649441; bh=JdDxuhEWTHQogevrbKRgAKGJR5oBTumlhlkBNVErFdg=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=i6hICHDJj+mFROtNTEXDssOK0MiLZmlSpGdYcHXhZsaULiqDo0L0k2WvH8bVsuBdN
	 73AYlI5HDBMR1rpqFnqC873c5r1HaF9PXeT8UbGUiKHc8/BLrIVI6HglsunZ+uS/Ui
	 wbbXFFegf8BVL3YM7KUAjtWUIyjn/H6je+1RINASxRYjVhOGb/pXkjY6ghdQB3d1Sc
	 SJRmi95HXD+GUGvX9guwh41u2Ih2+K6MHMD+fvRpeGE3m162rMg3bp30gbCvnDezcL
	 27TgkVRuhh+sQDUQSh1pcvVtkoDKXRvUXbxa/yBFs5E7gd2TPFBtGXSMB3Rhvc44Dq
	 hJ+RbK+9zf4SQ==
Received: from reliant.alphanet.ch (reliant.alphanet.ch [192.168.1.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shakotay.alphanet.ch (Postfix) with ESMTPS id 1674A1241214
	for <linux-usb@vger.kernel.org>; Mon, 26 Aug 2024 07:17:08 +0200 (CEST)
Received: by reliant.alphanet.ch (Postfix, from userid 1000)
	id 05FBB76CA64; Mon, 26 Aug 2024 07:17:08 +0200 (CEST)
Date: Mon, 26 Aug 2024 07:17:07 +0200
From: Marc SCHAEFER <schaefer@alphanet.ch>
To: linux-usb@vger.kernel.org
Subject: Re: Strange issues with USB device
Message-ID: <ZswP0+cLIqkTF0D/@alphanet.ch>
References: <ZsmC1+ko50RcvE9a@alphanet.ch>
 <20240824104428.593895c9@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240824104428.593895c9@foxbook>

Hello,

On Sat, Aug 24, 2024 at 10:44:28AM +0200, Micha?? Pecio wrote:
> The newer release you can get, the better. Fixes aren't backported

So, I did some tests (around 6 hours, a mdadm array check, read-only, with min
and max speed set to max, leading to 350 MByte/s at the start and around 250
MByte/s at the end) with

Linux video 6.11.0-rc5 #1 SMP PREEMPT_DYNAMIC Sun Aug 25 15:13:35 CEST 2024 x86_64 GNU/Linux

(and UAS activated on the 4 drives, opposite to the previous test):

root@video:~# lsusb -t | grep uas
            |__ Port 3: Dev 8, If 0, Class=Mass Storage, Driver=uas, 10000M
            |__ Port 1: Dev 6, If 0, Class=Mass Storage, Driver=uas, 10000M
            |__ Port 4: Dev 9, If 0, Class=Mass Storage, Driver=uas, 10000M
            |__ Port 2: Dev 7, If 0, Class=Mass Storage, Driver=uas, 10000M

The good news is that there aren't systematic USB issues, what I observed is:

1) very regular SMART errors (every ten minutes):

Aug 25 21:31:59 video udisksd[1004]: Error performing housekeeping for drive /org/freedesktop/UDisks2/drives/WDC_WD40EURX_63BMCY0_WD_WCC7K2RV8LZ4: Error updating SMART data: sk_disk_smart_read_data: Operation not supported (udisks-error-quark, 0)

2) from time to time, USB errors, sometimes maybe linked to the SMART errors:
   (6 times over 6 hours), see below

  [ sometimes the SMART error is NOT loggued just before or after, but the
    times are so similar every 10 minutes that I guess it is linked
  ]

Aug 25 23:11:59 video udisksd[1004]: Error performing housekeeping for drive /org/freedesktop/UDisks2/drives/WDC_WD40EURX_63BMCY0_WD_WCC7K2RV8LZ4: Error updating SMART data: sk_disk_smart_read_data: Operation not supported (udisks-error-quark, 0)
Aug 25 23:11:59 video kernel: [ 7214.544803] xhci_hcd 0000:01:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 10 comp_code 3
Aug 25 23:11:59 video kernel: [ 7214.544824] xhci_hcd 0000:01:00.0: Looking for event-dma 0000000001207ab0 trb-start 0000000001207ac0 trb-end 0000000000000000 seg-start 0000000001207000 seg-end 0000000001207ff0
Aug 25 23:11:59 video kernel: [ 7214.544828] xhci_hcd 0000:01:00.0: Looking for event-dma 0000000001207ab0 trb-start 0000000001208000 trb-end 00000000012082c0 seg-start 0000000001208000 seg-end 0000000001208ff0
Aug 25 23:12:30 video kernel: [ 7245.092841] sd 16:0:0:0: [sdc] tag#4 uas_eh_abort_handler 0 uas-tag 5 inflight: IN
Aug 25 23:12:30 video kernel: [ 7245.092851] sd 16:0:0:0: [sdc] tag#4 CDB: Read(16) 88 00 00 00 00 00 8c 5b 44 00 00 00 04 00 00 00
Aug 25 23:12:30 video kernel: [ 7245.093687] sd 16:0:0:0: [sdc] tag#2 uas_eh_abort_handler 0 uas-tag 3 inflight: CMD IN
Aug 25 23:12:30 video kernel: [ 7245.093704] sd 16:0:0:0: [sdc] tag#2 CDB: Read(16) 88 00 00 00 00 00 8c 5b 64 00 00 00 04 00 00 00
Aug 25 23:12:30 video kernel: [ 7245.094530] sd 16:0:0:0: [sdc] tag#1 uas_eh_abort_handler 0 uas-tag 2 inflight: CMD IN
Aug 25 23:12:30 video kernel: [ 7245.094548] sd 16:0:0:0: [sdc] tag#1 CDB: Read(16) 88 00 00 00 00 00 8c 5b 60 00 00 00 04 00 00 00
Aug 25 23:12:30 video kernel: [ 7245.095370] sd 16:0:0:0: [sdc] tag#0 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD IN
Aug 25 23:12:30 video kernel: [ 7245.095377] sd 16:0:0:0: [sdc] tag#0 CDB: Read(16) 88 00 00 00 00 00 8c 5b 68 00 00 00 04 00 00 00
Aug 25 23:12:30 video kernel: [ 7245.116843] scsi host16: uas_eh_device_reset_handler start
Aug 25 23:12:30 video kernel: [ 7245.209034] usb 3-1.1.2: reset SuperSpeed Plus Gen 2x1 USB device number 7 using xhci_hcd
Aug 25 23:12:30 video kernel: [ 7245.256495] scsi host16: uas_eh_device_reset_handler success
 

Aug 26 01:41:59 video udisksd[1004]: Error performing housekeeping for drive /org/freedesktop/UDisks2/drives/WDC_WD40EURX_63BMCY0_WD_WCC7K7KNYR4H: Error updating SMART data: sk_disk_smart_read_data: Operation not supported (udisks-error-quark, 0)
Aug 26 01:41:59 video kernel: [16214.490054] xhci_hcd 0000:01:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 10 comp_code 3
Aug 26 01:41:59 video kernel: [16214.490077] xhci_hcd 0000:01:00.0: Looking for event-dma 0000000001280f90 trb-start 0000000001280fa0 trb-end 0000000000000000 seg-start 0000000001280000 seg-end 0000000001280ff0
Aug 26 01:41:59 video kernel: [16214.490082] xhci_hcd 0000:01:00.0: Looking for event-dma 0000000001280f90 trb-start 0000000001281000 trb-end 00000000012817a0 seg-start 0000000001281000 seg-end 0000000001281ff0
Aug 26 01:42:31 video kernel: [16246.199014] sd 18:0:0:0: [sde] tag#5 uas_eh_abort_handler 0 uas-tag 6 inflight: CMD IN
Aug 26 01:42:31 video kernel: [16246.199023] sd 18:0:0:0: [sde] tag#5 CDB: Read(16) 88 00 00 00 00 01 25 56 10 00 00 00 04 00 00 00
Aug 26 01:42:31 video kernel: [16246.199839] sd 18:0:0:0: [sde] tag#4 uas_eh_abort_handler 0 uas-tag 5 inflight: CMD IN
Aug 26 01:42:31 video kernel: [16246.199847] sd 18:0:0:0: [sde] tag#4 CDB: Read(16) 88 00 00 00 00 01 25 56 0c 00 00 00 04 00 00 00
Aug 26 01:42:31 video kernel: [16246.200626] sd 18:0:0:0: [sde] tag#3 uas_eh_abort_handler 0 uas-tag 4 inflight: CMD IN
Aug 26 01:42:31 video kernel: [16246.200635] sd 18:0:0:0: [sde] tag#3 CDB: Read(16) 88 00 00 00 00 01 25 56 08 00 00 00 04 00 00 00
Aug 26 01:42:31 video kernel: [16246.201463] sd 18:0:0:0: [sde] tag#1 uas_eh_abort_handler 0 uas-tag 2 inflight: IN
Aug 26 01:42:31 video kernel: [16246.201472] sd 18:0:0:0: [sde] tag#1 CDB: Read(16) 88 00 00 00 00 01 25 55 fc 00 00 00 04 00 00 00
Aug 26 01:42:31 video kernel: [16246.215042] scsi host18: uas_eh_device_reset_handler start
Aug 26 01:42:31 video kernel: [16246.555177] usb 3-1.1.4: reset SuperSpeed Plus Gen 2x1 USB device number 9 using xhci_hcd
Aug 26 01:42:31 video kernel: [16246.602825] scsi host18: uas_eh_device_reset_handler success

Aug 26 02:31:59 video kernel: [19214.813966] xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd invalid because of stream ID configuration
Aug 26 02:31:59 video kernel: [19214.917797] xhci_hcd 0000:01:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 10 comp_code 3
Aug 26 02:31:59 video kernel: [19214.917809] xhci_hcd 0000:01:00.0: Looking for event-dma 0000000001210360 trb-start 0000000001210380 trb-end 0000000001210b70 seg-start 0000000001210000 seg-end 0000000001210ff0
Aug 26 02:32:31 video kernel: [19246.567687] sd 16:0:0:0: [sdc] tag#4 uas_eh_abort_handler 0 uas-tag 3 inflight: IN
Aug 26 02:32:31 video kernel: [19246.567697] sd 16:0:0:0: [sdc] tag#4 CDB: Read(16) 88 00 00 00 00 01 51 34 ec 00 00 00 04 00 00 00
Aug 26 02:32:31 video kernel: [19246.568522] sd 16:0:0:0: [sdc] tag#3 uas_eh_abort_handler 0 uas-tag 2 inflight: IN
Aug 26 02:32:31 video kernel: [19246.568531] sd 16:0:0:0: [sdc] tag#3 CDB: Read(16) 88 00 00 00 00 01 51 34 e8 00 00 00 04 00 00 00
Aug 26 02:32:31 video kernel: [19246.569332] sd 16:0:0:0: [sdc] tag#1 uas_eh_abort_handler 0 uas-tag 6 inflight: CMD IN
Aug 26 02:32:31 video kernel: [19246.569340] sd 16:0:0:0: [sdc] tag#1 CDB: Read(16) 88 00 00 00 00 01 51 35 08 00 00 00 04 00 00 00
Aug 26 02:32:31 video kernel: [19246.570142] sd 16:0:0:0: [sdc] tag#0 uas_eh_abort_handler 0 uas-tag 5 inflight: CMD IN
Aug 26 02:32:31 video kernel: [19246.570151] sd 16:0:0:0: [sdc] tag#0 CDB: Read(16) 88 00 00 00 00 01 51 35 04 00 00 00 04 00 00 00
Aug 26 02:32:31 video kernel: [19246.591712] scsi host16: uas_eh_device_reset_handler start
Aug 26 02:32:31 video kernel: [19246.683819] usb 3-1.1.2: reset SuperSpeed Plus Gen 2x1 USB device number 7 using xhci_hcd
Aug 26 02:32:31 video kernel: [19246.731831] scsi host16: uas_eh_device_reset_handler success
 
Aug 26 03:21:59 video kernel: [22214.861402] xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd invalid because of stream ID configuration
Aug 26 03:21:59 video udisksd[1004]: Error performing housekeeping for drive /org/freedesktop/UDisks2/drives/WDC_WD40EURX_63BMCY0_WD_WCC7K7KNYR4H: Error updating SMART data: sk_disk_smart_read_data: Operation not supported (udisks-error-quark, 0)
Aug 26 03:21:59 video kernel: [22214.881310] xhci_hcd 0000:01:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 10 comp_code 3
Aug 26 03:21:59 video kernel: [22214.881318] xhci_hcd 0000:01:00.0: Looking for event-dma 000000000128ea40 trb-start 000000000128ea50 trb-end 0000000000000000 seg-start 000000000128e000 seg-end 000000000128eff0
Aug 26 03:21:59 video kernel: [22214.881320] xhci_hcd 0000:01:00.0: Looking for event-dma 000000000128ea40 trb-start 000000000128f000 trb-end 000000000128f250 seg-start 000000000128f000 seg-end 000000000128fff0
Aug 26 03:21:59 video udisksd[1004]: Error performing housekeeping for drive /org/freedesktop/UDisks2/drives/WDC_WD40EURX_63BMCY0_WD_WCC7K2RV8LZ4: Error updating SMART data: sk_disk_smart_read_data: Operation not supported (udisks-error-quark, 0)
Aug 26 03:22:29 video kernel: [22244.884466] sd 18:0:0:0: [sde] tag#5 uas_eh_abort_handler 0 uas-tag 5 inflight: IN
Aug 26 03:22:29 video kernel: [22244.884476] sd 18:0:0:0: [sde] tag#5 CDB: Read(16) 88 00 00 00 00 01 79 18 bc 00 00 00 04 00 00 00
Aug 26 03:22:29 video kernel: [22244.912424] sd 18:0:0:0: [sde] tag#1 uas_eh_abort_handler 0 uas-tag 3 inflight: CMD IN
Aug 26 03:22:29 video kernel: [22244.912435] sd 18:0:0:0: [sde] tag#1 CDB: Read(16) 88 00 00 00 00 01 79 18 dc 00 00 00 04 00 00 00
Aug 26 03:22:29 video kernel: [22244.913011] sd 18:0:0:0: [sde] tag#0 uas_eh_abort_handler 0 uas-tag 2 inflight: CMD IN
Aug 26 03:22:29 video kernel: [22244.913016] sd 18:0:0:0: [sde] tag#0 CDB: Read(16) 88 00 00 00 00 01 79 18 d8 00 00 00 04 00 00 00
Aug 26 03:22:29 video kernel: [22244.944420] sd 18:0:0:0: [sde] tag#2 uas_eh_abort_handler 0 uas-tag 4 inflight: CMD IN
Aug 26 03:22:29 video kernel: [22244.944430] sd 18:0:0:0: [sde] tag#2 CDB: Read(16) 88 00 00 00 00 01 79 18 e0 00 00 00 04 00 00 00
Aug 26 03:22:29 video kernel: [22244.964465] scsi host18: uas_eh_device_reset_handler start
Aug 26 03:22:29 video kernel: [22245.056593] usb 3-1.1.4: reset SuperSpeed Plus Gen 2x1 USB device number 9 using xhci_hcd
Aug 26 03:22:29 video kernel: [22245.104078] scsi host18: uas_eh_device_reset_handler success

Aug 26 04:11:59 video udisksd[1004]: Error performing housekeeping for drive /org/freedesktop/UDisks2/drives/WDC_WD40EURX_63BMCY0_WD_WCC7K7KNYR4H: Error updating SMART data: sk_disk_smart_read_data: Operation not supported (udisks-error-quark, 0)
Aug 26 04:11:59 video kernel: [25214.758361] xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd invalid because of stream ID configuration
Aug 26 04:11:59 video udisksd[1004]: Error performing housekeeping for drive /org/freedesktop/UDisks2/drives/WDC_WD40EURX_63BMCY0_WD_WCC7K2RV8LZ4: Error updating SMART data: sk_disk_smart_read_data: Operation not supported (udisks-error-quark, 0)
Aug 26 04:11:59 video kernel: [25214.781786] xhci_hcd 0000:01:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 10 comp_code 3
Aug 26 04:11:59 video kernel: [25214.781797] xhci_hcd 0000:01:00.0: Looking for event-dma 00000000012046b0 trb-start 00000000012046c0 trb-end 0000000001204eb0 seg-start 0000000001204000 seg-end 0000000001204ff0
Aug 26 04:12:30 video kernel: [25245.249595] sd 16:0:0:0: [sdc] tag#5 uas_eh_abort_handler 0 uas-tag 6 inflight: CMD IN
Aug 26 04:12:30 video kernel: [25245.249605] sd 16:0:0:0: [sdc] tag#5 CDB: Read(16) 88 00 00 00 00 01 9d 33 38 00 00 00 04 00 00 00
Aug 26 04:12:30 video kernel: [25245.250410] sd 16:0:0:0: [sdc] tag#4 uas_eh_abort_handler 0 uas-tag 5 inflight: CMD IN
Aug 26 04:12:30 video kernel: [25245.250418] sd 16:0:0:0: [sdc] tag#4 CDB: Read(16) 88 00 00 00 00 01 9d 33 34 00 00 00 04 00 00 00
Aug 26 04:12:30 video kernel: [25245.251185] sd 16:0:0:0: [sdc] tag#1 uas_eh_abort_handler 0 uas-tag 3 inflight: IN
Aug 26 04:12:30 video kernel: [25245.251193] sd 16:0:0:0: [sdc] tag#1 CDB: Read(16) 88 00 00 00 00 01 9d 33 18 00 00 00 04 00 00 00
Aug 26 04:12:30 video kernel: [25245.251990] sd 16:0:0:0: [sdc] tag#0 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD IN
Aug 26 04:12:30 video kernel: [25245.251998] sd 16:0:0:0: [sdc] tag#0 CDB: Read(16) 88 00 00 00 00 01 9d 33 3c 00 00 00 04 00 00 00
Aug 26 04:12:30 video kernel: [25245.277631] scsi host16: uas_eh_device_reset_handler start
Aug 26 04:12:30 video kernel: [25245.373630] usb 3-1.1.2: reset SuperSpeed Plus Gen 2x1 USB device number 7 using xhci_hcd
Aug 26 04:12:30 video kernel: [25245.421419] scsi host16: uas_eh_device_reset_handler success

Aug 26 04:21:59 video kernel: [25815.021994] xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd invalid because of stream ID configuration
Aug 26 04:21:59 video kernel: [25815.040719] xhci_hcd 0000:01:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 10 comp_code 3
Aug 26 04:21:59 video kernel: [25815.040730] xhci_hcd 0000:01:00.0: Looking for event-dma 00000000012836b0 trb-start 00000000012836c0 trb-end 0000000001283eb0 seg-start 0000000001283000 seg-end 0000000001283ff0
Aug 26 04:22:07 video kernel: [25822.291130] sd 18:0:0:0: [sde] tag#2 uas_eh_abort_handler 0 uas-tag 4 inflight: CMD IN
Aug 26 04:22:07 video kernel: [25822.291140] sd 18:0:0:0: [sde] tag#2 CDB: ATA command pass through(12)/Blank a1 08 2e d0 01 00 4f c2 00 b0 00 00
Aug 26 04:22:18 video kernel: [25834.151565] usb 3-1.1.4: stat urb: no pending cmd for uas-tag 4
Aug 26 04:22:30 video kernel: [25845.331588] sd 18:0:0:0: [sde] tag#5 uas_eh_abort_handler 0 uas-tag 5 inflight: CMD IN
Aug 26 04:22:30 video kernel: [25845.331607] sd 18:0:0:0: [sde] tag#5 CDB: Read(16) 88 00 00 00 00 01 a3 b9 1c 00 00 00 04 00 00 00
Aug 26 04:22:30 video kernel: [25845.332384] sd 18:0:0:0: [sde] tag#4 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD IN
Aug 26 04:22:30 video kernel: [25845.332392] sd 18:0:0:0: [sde] tag#4 CDB: Read(16) 88 00 00 00 00 01 a3 b9 24 00 00 00 04 00 00 00
Aug 26 04:22:30 video kernel: [25845.333197] sd 18:0:0:0: [sde] tag#3 uas_eh_abort_handler 0 uas-tag 6 inflight: CMD IN
Aug 26 04:22:30 video kernel: [25845.333205] sd 18:0:0:0: [sde] tag#3 CDB: Read(16) 88 00 00 00 00 01 a3 b9 20 00 00 00 04 00 00 00
Aug 26 04:22:30 video kernel: [25845.334032] sd 18:0:0:0: [sde] tag#1 uas_eh_abort_handler 0 uas-tag 3 inflight: IN
Aug 26 04:22:30 video kernel: [25845.334041] sd 18:0:0:0: [sde] tag#1 CDB: Read(16) 88 00 00 00 00 01 a3 b9 04 00 00 00 04 00 00 00
Aug 26 04:22:30 video kernel: [25845.355520] scsi host18: uas_eh_device_reset_handler start
Aug 26 04:22:30 video kernel: [25845.455779] usb 3-1.1.4: reset SuperSpeed Plus Gen 2x1 USB device number 9 using xhci_hcd
Aug 26 04:22:30 video kernel: [25845.503395] scsi host18: uas_eh_device_reset_handler success


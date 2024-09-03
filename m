Return-Path: <linux-usb+bounces-14569-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0445C969F88
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 15:56:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85CA21F23EA2
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 13:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28422A1D6;
	Tue,  3 Sep 2024 13:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b="YI1CjiMv"
X-Original-To: linux-usb@vger.kernel.org
Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828E917BA1
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 13:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.140.72.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725371763; cv=none; b=DuX2XyAs2646tiSp5Mg1xYmzpXYT9pirTAwI2EWNTt7yM/xODAYqCO7vxbqiRL5GaoXurcNHQByHpuxNJKckCTT/bd7X/LgLC97qCezZfVv/duQ3b1PzjLdVlbkIcCxzYLEOlcTjTQaLmGnwd1mvyO7SWd5UrZvrz4mFG0ETN4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725371763; c=relaxed/simple;
	bh=3b5JMeGVFzR69qyFIkhv8PNFEC19CSbfmCnoAd+ZU2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0UlTM2wweejy/V6vJA6WjYgW+SPhT6afk0pMhW+RtWefzpmrXwpxkzs5JRECPWYfoWlWsG7ryLkVm68L8gxtKUQQhBOB6kiTq5igFidnC6zQFn8fyAdKOxtEGzpauSltJQDdXA6LaEUotdlpf9RqhY0JeMuoxm14Ur2bYwXMp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch; spf=pass smtp.mailfrom=alphanet.ch; dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b=YI1CjiMv; arc=none smtp.client-ip=46.140.72.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alphanet.ch
Received: by shakotay.alphanet.ch (Postfix, from userid 1022)
	id 28BD612443B5; Tue,  3 Sep 2024 15:55:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
	t=1725371758; bh=3b5JMeGVFzR69qyFIkhv8PNFEC19CSbfmCnoAd+ZU2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YI1CjiMvLThqRLi49pVcriHqeqHumf48V258kxR0gd7KsMVdECksn607BH/oTdahX
	 0J71vjMCcTk0EJaMZdTg7vQuc/0je/ZuTagn08WZvU/BkbWfsbiIyJv/xLJ45gmIda
	 pg3BuMl0NtTqNztqow1gZacjhsDxitpOLTwHyj912ntcIAvE8iRLyljayBglYYqBto
	 Da2r/XH2ShfPMXdoRk3YEmRY8fkG1rhlWca9unUeQPw+PByEPjFgifZT1tpNxFJrZZ
	 nKtvAcHFVJ6jzZD14S69h4gWmBg/3eFLrhZ6BFK9lGMT9D+SCbMYmXhrGlp4kkyWdj
	 lHhm3g+vj26Kg==
Received: from reliant.alphanet.ch (reliant.alphanet.ch [192.168.1.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by shakotay.alphanet.ch (Postfix) with ESMTPS id 6E68612414A2;
	Tue,  3 Sep 2024 15:55:42 +0200 (CEST)
Received: by reliant.alphanet.ch (Postfix, from userid 1000)
	id 5F52376D139; Tue,  3 Sep 2024 15:55:42 +0200 (CEST)
Date: Tue, 3 Sep 2024 15:55:42 +0200
From: Marc SCHAEFER <schaefer@alphanet.ch>
To: Micha?? Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Strange issues with UAS URB cancellation
Message-ID: <ZtcVXoI6jNM9Lqbl@alphanet.ch>
References: <ZswP0+cLIqkTF0D/@alphanet.ch>
 <20240903094822.3ae297cb@foxbook>
 <ZtcHOlqlQMMD4LzY@alphanet.ch>
 <20240903152218.74393a9e@foxbook>
 <ZtcUGe0FWxpO6058@alphanet.ch>
 <ZtcUq37F6gqgzifm@alphanet.ch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtcUq37F6gqgzifm@alphanet.ch>

On Tue, Sep 03, 2024 at 03:52:43PM +0200, Marc SCHAEFER wrote:
> Sep  3 15:52:15 video kernel: [  273.889421] scsi host15: uas_eh_device_reset_handler success

and:

Sep  3 15:52:34 video kernel: [  293.012852] xhci_hcd 0000:01:00.0: Stop Endpoint Context Error & Stopped on slot 9 ep 10
Sep  3 15:52:34 video kernel: [  293.012862] xhci_hcd 0000:01:00.0: Stop Endpoint on slot 9 ep 10 failed with comp 19 ctx_state 3
Sep  3 15:52:46 video kernel: [  304.214157] scsi host15: uas_eh_device_reset_handler start
Sep  3 15:52:46 video kernel: [  304.216530] xhci_hcd 0000:01:00.0: Stop Endpoint Context Error & Stopped on slot 9 ep 10
Sep  3 15:52:46 video kernel: [  304.216538] xhci_hcd 0000:01:00.0: Stop Endpoint on slot 9 ep 10 failed with comp 19 ctx_state 3
Sep  3 15:52:46 video kernel: [  304.240297] sd 15:0:0:0: [sdb] tag#1 uas_zap_pending 0 uas-tag 3 inflight: CMD 
Sep  3 15:52:46 video kernel: [  304.240302] sd 15:0:0:0: [sdb] tag#1 CDB: Read(16) 88 00 00 00 00 00 00 d5 14 00 00 00 04 00 00 00
Sep  3 15:52:46 video kernel: [  304.240303] sd 15:0:0:0: [sdb] tag#2 uas_zap_pending 0 uas-tag 4 inflight: CMD 
Sep  3 15:52:46 video kernel: [  304.240304] sd 15:0:0:0: [sdb] tag#2 CDB: Read(16) 88 00 00 00 00 00 00 d5 10 00 00 00 04 00 00 00
Sep  3 15:52:46 video kernel: [  304.240306] sd 15:0:0:0: [sdb] tag#3 uas_zap_pending 0 uas-tag 5 inflight: CMD 
Sep  3 15:52:46 video kernel: [  304.240307] sd 15:0:0:0: [sdb] tag#3 CDB: Read(16) 88 00 00 00 00 00 00 d5 08 00 00 00 04 00 00 00
Sep  3 15:52:46 video kernel: [  304.240308] sd 15:0:0:0: [sdb] tag#4 uas_zap_pending 0 uas-tag 6 inflight: CMD 
Sep  3 15:52:46 video kernel: [  304.240309] sd 15:0:0:0: [sdb] tag#4 CDB: Read(16) 88 00 00 00 00 00 00 d5 0c 00 00 00 04 00 00 00
Sep  3 15:52:46 video kernel: [  304.248055] xhci_hcd 0000:01:00.0: WARN Event TRB for slot 9 ep 10 with no TDs queued?
Sep  3 15:52:46 video kernel: [  304.334450] usb 3-1.1.1: reset SuperSpeed Plus Gen 2x1 USB device number 6 using xhci_hcd
Sep  3 15:52:46 video kernel: [  304.381956] scsi host15: uas_eh_device_reset_handler success
Sep  3 15:53:05 video kernel: [  323.565319] xhci_hcd 0000:01:00.0: Stop Endpoint Context Error & Stopped on slot 9 ep 10
Sep  3 15:53:05 video kernel: [  323.565329] xhci_hcd 0000:01:00.0: Stop Endpoint on slot 9 ep 10 failed with comp 19 ctx_state 3
Sep  3 15:53:05 video kernel: [  323.565691] sd 15:0:0:0: [sdb] tag#4 FAILED Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK cmd_age=173s
Sep  3 15:53:05 video kernel: [  323.565698] sd 15:0:0:0: [sdb] tag#4 Sense Key : Illegal Request [current] 
Sep  3 15:53:05 video kernel: [  323.565701] sd 15:0:0:0: [sdb] tag#4 Add. Sense: Invalid command operation code
Sep  3 15:53:05 video kernel: [  323.565705] sd 15:0:0:0: [sdb] tag#4 CDB: Read(16) 88 00 00 00 00 00 00 d5 00 00 00 00 04 00 00 00
Sep  3 15:53:05 video kernel: [  323.565707] critical target error, dev sdb, sector 13959168 op 0x0:(READ) flags 0x4000 phys_seg 128 prio class 0
Sep  3 15:53:24 video kernel: [  342.838610] xhci_hcd 0000:01:00.0: Stop Endpoint Context Error & Stopped on slot 9 ep 10
Sep  3 15:53:24 video kernel: [  342.838619] xhci_hcd 0000:01:00.0: Stop Endpoint on slot 9 ep 10 failed with comp 19 ctx_state 3
Sep  3 15:53:37 video kernel: [  355.402892] sd 15:0:0:0: [sdb] tag#4 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD IN 
Sep  3 15:53:37 video kernel: [  355.402898] sd 15:0:0:0: [sdb] tag#4 CDB: Read(16) 88 00 00 00 00 00 00 d5 18 00 00 00 04 00 00 00
Sep  3 15:53:37 video kernel: [  355.403050] xhci_hcd 0000:01:00.0: Stop Endpoint Context Error & Stopped on slot 9 ep 10
Sep  3 15:53:37 video kernel: [  355.403054] xhci_hcd 0000:01:00.0: Stop Endpoint on slot 9 ep 10 failed with comp 19 ctx_state 3
Sep  3 15:53:37 video kernel: [  355.426900] scsi host15: uas_eh_device_reset_handler start
Sep  3 15:53:37 video kernel: [  355.434945] sd 15:0:0:0: [sdb] tag#3 uas_zap_pending 0 uas-tag 5 inflight: CMD 
Sep  3 15:53:37 video kernel: [  355.434951] sd 15:0:0:0: [sdb] tag#3 CDB: Read(16) 88 00 00 00 00 00 00 d5 08 00 00 00 04 00 00 00
Sep  3 15:53:37 video kernel: [  355.434953] sd 15:0:0:0: [sdb] tag#5 uas_zap_pending 0 uas-tag 6 inflight: CMD 
Sep  3 15:53:37 video kernel: [  355.434954] sd 15:0:0:0: [sdb] tag#5 CDB: Read(16) 88 00 00 00 00 00 00 d5 0c 00 00 00 04 00 00 00
Sep  3 15:53:37 video kernel: [  355.526944] usb 3-1.1.1: reset SuperSpeed Plus Gen 2x1 USB device number 6 using xhci_hcd
Sep  3 15:53:37 video kernel: [  355.573871] scsi host15: uas_eh_device_reset_handler success
Sep  3 15:53:37 video kernel: [  355.638997] sd 15:0:0:0: [sdb] tag#2 timing out command, waited 180s
Sep  3 15:53:37 video kernel: [  355.639014] sd 15:0:0:0: [sdb] tag#2 FAILED Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK cmd_age=205s
Sep  3 15:53:37 video kernel: [  355.639017] sd 15:0:0:0: [sdb] tag#2 Sense Key : Not Ready [current] 
Sep  3 15:53:37 video kernel: [  355.639019] sd 15:0:0:0: [sdb] tag#2 Add. Sense: Logical unit is in process of becoming ready
Sep  3 15:53:37 video kernel: [  355.639022] sd 15:0:0:0: [sdb] tag#2 CDB: Read(16) 88 00 00 00 00 00 00 d5 10 00 00 00 04 00 00 00
Sep  3 15:53:37 video kernel: [  355.639024] I/O error, dev sdb, sector 13963264 op 0x0:(READ) flags 0x4000 phys_seg 128 prio class 0
Sep  3 15:53:37 video kernel: [  355.639043] sd 15:0:0:0: [sdb] tag#3 timing out command, waited 180s
Sep  3 15:53:37 video kernel: [  355.639046] sd 15:0:0:0: [sdb] tag#3 FAILED Result: hostbyte=DID_RESET driverbyte=DRIVER_OK cmd_age=205s
Sep  3 15:53:37 video kernel: [  355.639048] sd 15:0:0:0: [sdb] tag#3 CDB: Read(16) 88 00 00 00 00 00 00 d5 08 00 00 00 04 00 00 00
Sep  3 15:53:37 video kernel: [  355.639049] I/O error, dev sdb, sector 13961216 op 0x0:(READ) flags 0x4000 phys_seg 128 prio class 0
Sep  3 15:53:37 video kernel: [  355.639059] sd 15:0:0:0: [sdb] tag#5 timing out command, waited 180s
Sep  3 15:53:37 video kernel: [  355.639061] sd 15:0:0:0: [sdb] tag#5 FAILED Result: hostbyte=DID_RESET driverbyte=DRIVER_OK cmd_age=205s
Sep  3 15:53:37 video kernel: [  355.639063] sd 15:0:0:0: [sdb] tag#5 CDB: Read(16) 88 00 00 00 00 00 00 d5 0c 00 00 00 04 00 00 00
Sep  3 15:53:37 video kernel: [  355.639064] I/O error, dev sdb, sector 13962240 op 0x0:(READ) flags 0x4000 phys_seg 128 prio class 0
Sep  3 15:53:56 video kernel: [  374.766217] xhci_hcd 0000:01:00.0: Stop Endpoint Context Error & Stopped on slot 9 ep 10
Sep  3 15:53:56 video kernel: [  374.766227] xhci_hcd 0000:01:00.0: Stop Endpoint on slot 9 ep 10 failed with comp 19 ctx_state 3
Sep  3 15:53:56 video kernel: [  374.766587] sd 15:0:0:0: [sdb] tag#3 FAILED Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK cmd_age=225s
Sep  3 15:53:56 video kernel: [  374.766593] sd 15:0:0:0: [sdb] tag#3 Sense Key : Illegal Request [current] 
Sep  3 15:53:56 video kernel: [  374.766596] sd 15:0:0:0: [sdb] tag#3 Add. Sense: Invalid command operation code
Sep  3 15:53:56 video kernel: [  374.766601] sd 15:0:0:0: [sdb] tag#3 CDB: Read(16) 88 00 00 00 00 00 00 d5 04 00 00 00 04 00 00 00
Sep  3 15:53:56 video kernel: [  374.766603] critical target error, dev sdb, sector 13960192 op 0x0:(READ) flags 0x4000 phys_seg 128 prio class 0


Return-Path: <linux-usb+bounces-14561-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 792B0969ED1
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 15:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 246FF1F216B5
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 13:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E1F1CA690;
	Tue,  3 Sep 2024 13:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b="Bpv76PVY"
X-Original-To: linux-usb@vger.kernel.org
Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADAD1A724E
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 13:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.140.72.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725369346; cv=none; b=niu0+J58iN0lgF3NBtMCQnPqcW/wmk1yuO2mpIb2P1UGTDfNeprWGn5AosjVoIpyRc9e5JvZC04rJxwcLcDr3SeFDna2K7KAKvRS6CF6qD7PGIhGutlLMlAmsIChM/4MPyRAmmuHxaIHpPi31XTC0+5q8rkKwcJneZ0h/em8dsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725369346; c=relaxed/simple;
	bh=2bX9QdNqrwSreDs8XbF2Us9EWS5ZQkEk6/gaORACny0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Klxp4rmjubQKFCLTC+w00xBLxXOms7NKFV4uq/sxyJeuV/40M31Za1TDNHwjs8gF51L4FAstnGTM74e6OMRyLQgqLHM0i6CcT0Zx96LBhFXINXUeAEBs92fRgWX/f78yNkHAYPbdlKynvxu93y7hXPfYcpNyWs9tfW5ETvTXBqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch; spf=pass smtp.mailfrom=alphanet.ch; dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b=Bpv76PVY; arc=none smtp.client-ip=46.140.72.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alphanet.ch
Received: by shakotay.alphanet.ch (Postfix, from userid 1022)
	id BA37112443B5; Tue,  3 Sep 2024 14:55:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
	t=1725368136; bh=2bX9QdNqrwSreDs8XbF2Us9EWS5ZQkEk6/gaORACny0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bpv76PVYyMPBe9Mymzz8vUx4BJl5JUISQiHTXnu/TJJTXZaMxhXXTmdiI5cTyIxVI
	 tdIfccuri3NKllwR6BKGO1vf26ZQCGP+rAGy65vj56OYzeOy3Xaf4DbIcF+UsJzttz
	 k83NC9UbbKbhbw4Rx5Usf0O8TX+v4ecT379iusyUqm9mgYgaVrNvMrLX/PRb1ukgNu
	 TlI0d8vvOR2KWeQrLx00C1yUc022VPDDcR6vy89YtbIyhbnzWZmpohwelRk2Wocgun
	 n3zWRmUUGPhZbIJ/0m4A97oC05UPe3FCGaUg/gEj/rgXHWRziCeW843wMdja0XGaPR
	 h8ftYGgOZEWXQ==
Received: from reliant.alphanet.ch (reliant.alphanet.ch [192.168.1.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shakotay.alphanet.ch (Postfix) with ESMTPS id 7C31612410E8;
	Tue,  3 Sep 2024 14:55:22 +0200 (CEST)
Received: by reliant.alphanet.ch (Postfix, from userid 1000)
	id 6365076D139; Tue,  3 Sep 2024 14:55:22 +0200 (CEST)
Date: Tue, 3 Sep 2024 14:55:22 +0200
From: Marc SCHAEFER <schaefer@alphanet.ch>
To: Micha?? Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Strange issues with UAS URB cancellation
Message-ID: <ZtcHOlqlQMMD4LzY@alphanet.ch>
References: <ZswP0+cLIqkTF0D/@alphanet.ch>
 <20240903094822.3ae297cb@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903094822.3ae297cb@foxbook>

Hello,


On Tue, Sep 03, 2024 at 09:48:22AM +0200, Micha?? Pecio wrote:
> [ I changed the title a little. And please use "reply to all" when

I hope it now works like you want it.

> I can offer this patch for testing (on 6.11-rc5), which tries to:

Thank you, I applied + recompiled.  After a while (~1 hour), I got a lot of
messages in dmesg, slowing down the md raidcheck to a crawl.

So, after about two hours of md raidcheck of the array at ~330 MByte/s:

Sep  3 13:53:43 video kernel: [ 7193.705199] xhci_hcd 0000:01:00.0: Stop Endpoint Context Error & Stopped on slot 12 ep 10
Sep  3 13:53:43 video kernel: [ 7193.705209] xhci_hcd 0000:01:00.0: Stop ep completion ctx error, ep is running
Sep  3 13:53:43 video kernel: [ 7193.705461] xhci_hcd 0000:01:00.0: Stop Endpoint Context Error & Stopped on slot 12 ep 10
Sep  3 13:53:43 video kernel: [ 7193.705469] xhci_hcd 0000:01:00.0: Stop ep completion ctx error, ep is running
Sep  3 13:53:43 video kernel: [ 7193.705754] xhci_hcd 0000:01:00.0: Stop Endpoint Context Error & Stopped on slot 12 ep 10
Sep  3 13:53:43 video kernel: [ 7193.705759] xhci_hcd 0000:01:00.0: Stop ep completion ctx error, ep is running

[ ... and many like this ... ]

then it gets more interesting:

Sep  3 13:53:55 video kernel: [ 7205.983631] sd 18:0:0:0: [sde] tag#5 uas_eh_abort_handler 0 uas-tag 6 inflight: CMD IN 
Sep  3 13:53:55 video kernel: [ 7205.983635] sd 18:0:0:0: [sde] tag#5 CDB: Read(16) 88 00 00 00 00 00 8c cf e4 00 00 00 04 00 00 00
Sep  3 13:54:21 video kernel: [ 7232.213557] usb 3-1.1.4: stat urb: no pending cmd for uas-tag 6

then the kernel complains about:

Sep  3 13:56:41 video kernel: [ 7371.838240] INFO: task smartd:906 blocked for more than 120 seconds.
Sep  3 13:56:41 video kernel: [ 7371.838246]       Tainted: G            E      6.11.0-rc5 #2
Sep  3 13:56:41 video kernel: [ 7371.838248] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
Sep  3 13:56:41 video kernel: [ 7371.838249] task:smartd          state:D stack:0     pid:906   tgid:906   ppid:1      flags:0x00000000

(and a few other utility programs, including the md0_resync kernel task)

then:

Sep  3 14:00:42 video kernel: [ 7613.502312] Future hung task reports are suppressed, see sysctl kernel.hung_task_warnings

Thank you :)


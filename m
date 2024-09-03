Return-Path: <linux-usb+bounces-14598-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C5096A78D
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 21:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D43142865CD
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 19:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B762C18E77D;
	Tue,  3 Sep 2024 19:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b="CfJ51TY/"
X-Original-To: linux-usb@vger.kernel.org
Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D6819146E
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 19:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.140.72.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725392463; cv=none; b=iEE49byncxstkMTyIUipol+20F4KG74wdeSxId4y8sZrweR1dIYBlrYkZYHDLbU1OoO8duaaiIITVhU6dyJQAOjxF9y3HdwB+cguxoG1ZE2G2XD6CWWtWnwUBsnXav9VG9968SWP7HQqPmud5z+vgSJJQkXzcAxvUdp09h6LkM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725392463; c=relaxed/simple;
	bh=5zKrL+btq1pkVC7AtdYVVtyqFaD6OscRQE5eaWgf9Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+PywdUi9vMxkxommsW6hCjmwUaoarxN+K6xElJOWhjp4zmAjnzkmX1NPj36suD62QbtddZ7ra/hpXF5e3BkM8HW+sC5Vg+q/TWwHC7Vd/y+TrRuGKFfpagsW6xpM5EvpngUp7iooQ3125GHHKvhR/uuQEmgKKfJu17M/Bsbg/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch; spf=pass smtp.mailfrom=alphanet.ch; dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b=CfJ51TY/; arc=none smtp.client-ip=46.140.72.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alphanet.ch
Received: by shakotay.alphanet.ch (Postfix, from userid 1022)
	id D8433124439A; Tue,  3 Sep 2024 21:40:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
	t=1725392456; bh=5zKrL+btq1pkVC7AtdYVVtyqFaD6OscRQE5eaWgf9Xg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CfJ51TY/Z56IpDJPzibkgYSlVA1p99lI2C7vtOk3uphfu70YSHUn2lxq2rZntufXo
	 4Ae5FSB6xpZLdW4iOh3W4VwvrRypYBsjNi3GR88bbHd8UfG0m1oQFozCiyH8EzCDU4
	 q6c4KEQTNV77gdCF8qOfGUp+t/Q+jez86zEt3Qd/8iFN56AgafsLqyWerJq0ChjAi/
	 Ww/+ztX/zRU/vm/T7p4BndwB6MzOs1VDmR3vALS+AsT6leESbGJPnj5Ryo1k5/svhX
	 gPOKC25b7D1desclOLQ38ur4AJBl5oVVsG+OGLDvPPNmPJ+PVy6252BbypCPg6d71B
	 qt7fyegfz9orA==
Received: from reliant.alphanet.ch (reliant.alphanet.ch [192.168.1.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shakotay.alphanet.ch (Postfix) with ESMTPS id 3C37C12416CB;
	Tue,  3 Sep 2024 21:40:42 +0200 (CEST)
Received: by reliant.alphanet.ch (Postfix, from userid 1000)
	id 2E31276C9FE; Tue,  3 Sep 2024 21:40:42 +0200 (CEST)
Date: Tue, 3 Sep 2024 21:40:42 +0200
From: Marc SCHAEFER <schaefer@alphanet.ch>
To: Micha?? Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Strange issues with UAS URB cancellation
Message-ID: <ZtdmOiKN6hb2Y82I@alphanet.ch>
References: <ZswP0+cLIqkTF0D/@alphanet.ch>
 <20240903094822.3ae297cb@foxbook>
 <ZtcHOlqlQMMD4LzY@alphanet.ch>
 <20240903152218.74393a9e@foxbook>
 <ZtcUGe0FWxpO6058@alphanet.ch>
 <ZtcUq37F6gqgzifm@alphanet.ch>
 <ZtcVXoI6jNM9Lqbl@alphanet.ch>
 <20240903174535.6e5e581b@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903174535.6e5e581b@foxbook>

Re, 

On Tue, Sep 03, 2024 at 05:45:35PM +0200, Micha?? Pecio wrote:
> Hmm, this is possibly not a coincidence, but it's also not the same
> "ERROR Transfer event TRB DMA ptr not part of current TD" that happened

Got one:

Sep  3 21:32:58 video kernel: [11408.230466] xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd invalid because of stream ID configuration
Sep  3 21:32:58 video udisksd[962]: Error performing housekeeping for drive /org/freedesktop/UDisks2/drives/WDC_WD40EURX_63BMCY0_WD_WCC7K6KTRC7F: Error updating SMART data: sk_disk_smart_read_data: Operation not supported (udisks-error-quark, 0)
Sep  3 21:32:58 video kernel: [11408.247189] xhci_hcd 0000:01:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 10 comp_code 3
Sep  3 21:32:58 video kernel: [11408.247197] xhci_hcd 0000:01:00.0: Looking for event-dma 00000000d9911140 trb-start 00000000d9911150 trb-end 00000000d9911940 seg-start 00000000d9911000 seg-end 00000000d9911ff0
Sep  3 21:32:58 video kernel: [11408.247199] xhci_hcd 0000:01:00.0: last xhci_td_cleanup: first_dma d9911140 last_dma d9911140 status 0 from xhci_handle_cmd_set_deq
Sep  3 21:32:58 video kernel: [11408.247201] xhci_hcd 0000:01:00.0: handle_tx_event log -4: event ffff9e6659920b10 ep_trb_dma d9911910 comp_code 1 len 0 slot 9 ep 10
Sep  3 21:32:58 video kernel: [11408.247203] xhci_hcd 0000:01:00.0: handle_tx_event log -3: event ffff9e66599210b0 ep_trb_dma d9910120 comp_code 1 len 0 slot 9 ep 10
Sep  3 21:32:58 video kernel: [11408.247204] xhci_hcd 0000:01:00.0: handle_tx_event log -2: event ffff9e66599215c0 ep_trb_dma d9910920 comp_code 1 len 0 slot 9 ep 10
Sep  3 21:32:58 video kernel: [11408.247204] xhci_hcd 0000:01:00.0: handle_tx_event log -1: event ffff9e6659921a60 ep_trb_dma d9911130 comp_code 1 len 0 slot 9 ep 10
Sep  3 21:32:58 video kernel: [11408.247205] xhci_hcd 0000:01:00.0: handle_tx_event log  0: event ffff9e6659920440 ep_trb_dma d9911140 comp_code 3 len 0 slot 9 ep 10
Sep  3 21:32:58 video udisksd[962]: Error performing housekeeping for drive /org/freedesktop/UDisks2/drives/WDC_WD40EURX_63BMCY0_WD_WCC7K5ZZ7U4J: Error updating SMART data: sk_disk_smart_read_data: Operation not supported (udisks-error-quark, 0)
Sep  3 21:33:29 video kernel: [11439.353265] sd 15:0:0:0: [sdb] tag#5 uas_eh_abort_handler 0 uas-tag 4 inflight: IN
Sep  3 21:33:29 video kernel: [11439.353283] sd 15:0:0:0: [sdb] tag#5 CDB: Read(16) 88 00 00 00 00 00 ca c1 6c 00 00 00 04 00 00 00
Sep  3 21:33:29 video kernel: [11439.354066] sd 15:0:0:0: [sdb] tag#4 uas_eh_abort_handler 0 uas-tag 2 inflight: CMD IN
Sep  3 21:33:29 video kernel: [11439.354073] sd 15:0:0:0: [sdb] tag#4 CDB: Read(16) 88 00 00 00 00 00 ca c1 88 00 00 00 04 00 00 00
Sep  3 21:33:29 video kernel: [11439.354864] sd 15:0:0:0: [sdb] tag#3 uas_eh_abort_handler 0 uas-tag 3 inflight: CMD IN
Sep  3 21:33:29 video kernel: [11439.354872] sd 15:0:0:0: [sdb] tag#3 CDB: Read(16) 88 00 00 00 00 00 ca c1 8c 00 00 00 04 00 00 00
Sep  3 21:33:29 video kernel: [11439.355647] sd 15:0:0:0: [sdb] tag#0 uas_eh_abort_handler 0 uas-tag 5 inflight: CMD IN
Sep  3 21:33:29 video kernel: [11439.355655] sd 15:0:0:0: [sdb] tag#0 CDB: Read(16) 88 00 00 00 00 00 ca c1 90 00 00 00 04 00 00 00
Sep  3 21:33:29 video kernel: [11439.385194] scsi host15: uas_eh_device_reset_handler start
Sep  3 21:33:29 video kernel: [11439.477362] usb 4-1.1.1: reset SuperSpeed Plus Gen 2x1 USB device number 6 using xhci_hcd
Sep  3 21:33:29 video kernel: [11439.524986] scsi host15: uas_eh_device_reset_handler success


Return-Path: <linux-usb+bounces-18931-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3989FF2C5
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jan 2025 04:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFB267A13E2
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jan 2025 03:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A5CDDCD;
	Wed,  1 Jan 2025 03:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=moonlit-rail.com header.i=@moonlit-rail.com header.b="OKQriKoh";
	dkim=permerror (0-bit key) header.d=moonlit-rail.com header.i=@moonlit-rail.com header.b="V1QAoF25"
X-Original-To: linux-usb@vger.kernel.org
Received: from hua.moonlit-rail.com (hua.moonlit-rail.com [45.79.167.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9B2BA33
	for <linux-usb@vger.kernel.org>; Wed,  1 Jan 2025 03:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.167.250
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735703663; cv=none; b=rzAYzPbQzFRB1xoRXmIxBo3nlpjTyZq8ZaWSv1Q4/KUAQHvj57Mvr75raSqp8N3ToqiMKRxGMz3prdnhtwfCp0DFteOjU7ZG7SVzwXA86ISdQT/z5tgOyfB8UOoi4bAPS6jSbH0stgHa+xHNYc6e0Sc8pkhbV2wCs0RUK1CDJCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735703663; c=relaxed/simple;
	bh=CJkbEH8P9aqZrjBPjoT0d05pFH1jNDDq73r/6KmddfM=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=qh7PUYqvvGBjF7w2C1smv/BuPfFP1ofyrCmMh2FG7nN4KFeIXdSYQBtf/kZbN5vSUMomSzHisb5qAsOpWf3p0dWbxMC0Sp3XsXa538d7CHuHJyYQzNSCJF7rngJTk7eU4Uhszt03evcIb8M3nre/3Ndjza+1Z9/E7BThhONIqU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=moonlit-rail.com; spf=pass smtp.mailfrom=moonlit-rail.com; dkim=pass (2048-bit key) header.d=moonlit-rail.com header.i=@moonlit-rail.com header.b=OKQriKoh; dkim=permerror (0-bit key) header.d=moonlit-rail.com header.i=@moonlit-rail.com header.b=V1QAoF25; arc=none smtp.client-ip=45.79.167.250
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=moonlit-rail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moonlit-rail.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=moonlit-rail.com; s=rsa2021a; h=Content-Transfer-Encoding:Content-Type:
	Subject:To:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nm1gR0HNVOEx6oMUfE1HkGLXPtUDnRQAnGgi2dYR9T4=; t=1735702566; x=1738294566; 
	b=OKQriKohmkF+pj04WHzg7uH0aztOAFuV4vG4CaL6sFAZ4HWPQQ20zxv7nzPJeA+Fex2Hsm613NC
	3M2Pv4cvmXHps+GVpCw1x7iASFB6GUlV1DXfNt2XkTS0BMWC1HUwGaRR8Be6OkbePT0IXzqGt2/r2
	voU3BNINCLx2LTRg6yfa4FgsLCMYa9IxJFDJW/x9xWFPTQBK1gcSVA9gbIWsip08pKKrsfk6NDMRx
	qqAOFzxt5HL9c88v1z8G15qdtOjZvaZNeA4AWtHQMWHIqUHel2oT7KfJeQtTSY/tBTxUKJ1IzU2wl
	cB+qlq67Ho3jJfXG8hzq+j9w7N8Mu3YwyLfQ==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=moonlit-rail.com; s=edd2021a; h=Content-Transfer-Encoding:Content-Type:
	Subject:To:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nm1gR0HNVOEx6oMUfE1HkGLXPtUDnRQAnGgi2dYR9T4=; t=1735702566; x=1738294566; 
	b=V1QAoF25tFuOTw4Qk1FwKWuylrFp7hicgkrho4X2g1/gp4nu5PWFf/IQ8edrXWvnlKhulOWuQF3
	q5cphBh+fBQ==;
Message-ID: <889a576d-60d5-4602-8b10-f11af5bc2107@moonlit-rail.com>
Date: Tue, 31 Dec 2024 22:36:06 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Kris Karas (Bug Reporting)" <bugs-a21@moonlit-rail.com>
Content-Language: en-US, en-GB
To: linux-usb@vger.kernel.org
Subject: [Regression] 3TB USB storage shows as 2TB under kernel 6.12
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Greetings, happy new year,

I have a 3TB (2.7 TiB) drive attached via an Initio USB-to-SATA bridge 
to a server that has been running mainline kernel 6.6.  As the next LTS 
kernel is now out, 6.12, I upgraded; here's how it went:

*  Booting into 6.6, drive shows normally as 3TB.
*  Rebooting into 6.12, drive now shows as 2TB.
*  Rebooting back into 6.6, drive continues to show as 2TB.
*  Yank USB cable and re-plug, drive once again shows as 3TB.

As the errant drive size = 512 byte sectors * 2^32, it appears as though 
the USB-to-SATA initialization code in the more recent kernel is putting 
the adapter into some sort of 32-bit mode.  Resetting it via a 
disconnected cable (or power cycling) is required to get the normal 
behavior back.

The USB-to-SATA adapter lists itself (lsusb) as:
     ID 13fd:1e40 Initio Corporation INIC-1610P SATA bridge
It comes bundled inside a "Vantec NexStar CX" external drive enclosure.

There are no error messages in the dmesg output as the kernel boots. 
The output is the same between 6.6 and 6.12, except for the capacity 
reported, and the failure to properly read the GPT partition table under 
the truncated disk size.

Anybody have any suggestions for something to try?  An hdparm setting 
perhaps?  I could always bisect, but that would take awhile as the 
kernel versions are considerably distant.

Kris


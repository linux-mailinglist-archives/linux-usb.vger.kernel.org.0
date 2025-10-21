Return-Path: <linux-usb+bounces-29487-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 596F6BF6F60
	for <lists+linux-usb@lfdr.de>; Tue, 21 Oct 2025 16:06:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DF6019A0F22
	for <lists+linux-usb@lfdr.de>; Tue, 21 Oct 2025 14:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFD42F39C1;
	Tue, 21 Oct 2025 14:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b="KaD8iTq3"
X-Original-To: linux-usb@vger.kernel.org
Received: from cmsr-t-1.hinet.net (cmsr-t-1.hinet.net [203.69.209.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5241337B97
	for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 14:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.69.209.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761055381; cv=none; b=Y6HhDycWkxcY7Y2bogIVJOgJNmKdV0qtqTNLD79KcZCppo/jud02c18JHfCS65X1X3GgojdmRlCiL8duIi86tdQUnFUhAkJ7w4PS1rS5iUrqRfbJ4rDhkkmg/xjXNhZYNltTHUeRtFSIC7kCiG9sGj0mYm2PlYMBap0NDvoAuJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761055381; c=relaxed/simple;
	bh=ErxuNh1ZeCh5xd2RzkARSEcQDKUmqKph3P8a4rcFeVk=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=QAmf1HqqI8Z8sxWcuzfjtv/AH8gvMzlIE67XHETjYg/3QRxvWmiK/xLipWet0wxW844PXFAuE/MFsiy+H8rcszTqxUF+rplASlLbMtrlIb3CBVnqkx49qfPIwOkysALgc/DWD94UJ4W1L1zJA3EAne9pL/BTRX2PsVQUQln1vnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net; spf=pass smtp.mailfrom=ms29.hinet.net; dkim=pass (2048-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b=KaD8iTq3; arc=none smtp.client-ip=203.69.209.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ms29.hinet.net
Received: from cmsr6.hinet.net ([10.199.216.85])
	by cmsr-t-1.hinet.net (8.15.2/8.15.2) with ESMTPS id 59LDFdkv298309
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 21:15:39 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ms29.hinet.net;
	s=s2; t=1761052540; bh=ErxuNh1ZeCh5xd2RzkARSEcQDKUmqKph3P8a4rcFeVk=;
	h=From:To:Subject:Date;
	b=KaD8iTq3SFD1WviUPcHxjhE1TfkRsTMO2eBjRdNuxTH+rJEhcDEGRy7rBk5NmPObK
	 GW94EuQC7ErCyaqthNF5Spqr6NgTTNr7D6nLsYNjM57DUkEirUAGnGPcUZP0mXsemz
	 kX8OBC9CP+u0EC/qOdKiWvFvKRNYzYTAV2ogl+bQm+EoPBXEzr7H4W/EKt2aQyKRiw
	 VDse9yL2HanpqP8qM7Kche3Hfu1D9HFTfTnxNbkM/vXa2KUhoMK8KpoR074itnp17J
	 OwG06w6utMZcx5iaYSPvs19Z0JvQWm0DvHDLDLLYlrhqUezrKTjAvLhHL76c4UdXd3
	 xOEr5Y3B/ZKdg==
Received: from [127.0.0.1] (125-224-87-96.dynamic-ip.hinet.net [125.224.87.96])
	by cmsr6.hinet.net (8.15.2/8.15.2) with ESMTPS id 59LDFYcT886218
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 21:15:37 +0800
From: "Purchase - PathnSitu 637" <Linux-usb@ms29.hinet.net>
To: linux-usb@vger.kernel.org
Reply-To: "Purchase - PathnSitu." <purchase@pathnsithu.com>
Subject: =?UTF-8?B?TmV3IE9jdG9iZXIgT3JkZXIuIDg5NzYyIFR1ZXNkYXksIE9jdG9iZXIgMjEsIDIwMjUgYXQgMDM6MTU6MzMgUE0=?=
Message-ID: <b94275df-4cfd-5e8c-8204-506e68a55599@ms29.hinet.net>
Content-Transfer-Encoding: 7bit
Date: Tue, 21 Oct 2025 13:15:33 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=I57GR8gg c=1 sm=1 tr=0 ts=68f7877a
	a=YdLU39gR87xPbyr/AVx5OA==:117 a=IkcTkHD0fZMA:10 a=5KLPUuaC_9wA:10
	a=CJ0Vlb4bovGX9bKmfKsA:9 a=QEXdDO2ut3YA:10

Hi Linux-usb,

Please provide a quote for your products:

Include:
1.Pricing (per unit)
2.Delivery cost & timeline
3.Quote expiry date

Deadline: October

Thanks!

Danny Peddinti

PathnSitu Trading


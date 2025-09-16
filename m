Return-Path: <linux-usb+bounces-28136-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8C7B58C73
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 05:40:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B18381B27081
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 03:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0180526159E;
	Tue, 16 Sep 2025 03:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b="chiSqYbm"
X-Original-To: linux-usb@vger.kernel.org
Received: from cdmsr2.hinet.net (210-65-1-144.hinet-ip.hinet.net [210.65.1.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54D61B0F1E
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 03:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.65.1.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757994026; cv=none; b=Nq9ASq8TNP0JFCF+5nTQq1eaG42LeHD+2p9zDjA11hJP0uuaDP6DkA1v4lp6PD7yhklgsXT4ADkoUeP1AMXg36Hp0FJ2xvp8MEtLMx4qoh2x/AELUTDwP/TS93wQGE/UzQba+6YANpnIW+4iJRoQDWP9acVntkQQr+Cy7Ny16ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757994026; c=relaxed/simple;
	bh=o+qLoQAhjBVgxw8p+p/znE8CwPM+2fMcRkqJQKlzslw=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=m2cW9GxqN2cQ5LY4cwL0MGQGTLOqZCsTmREDBLfJQnIy4uu9XsMBabtfVvGbc31rssu4qIiJrLwvOnCTSR5XRtHxW1gP71qZBKVJTE+YW6h2SpuOzxWuoJd4XbqDVOONfr8YV4MIhCY5vVA9tV6h3IYwITOh5G7Sv8dPHbY9p6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net; spf=pass smtp.mailfrom=ms29.hinet.net; dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b=chiSqYbm; arc=none smtp.client-ip=210.65.1.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ms29.hinet.net
Received: from cmsr4.hinet.net ([10.199.216.83])
	by cdmsr2.hinet.net (8.15.2/8.15.2) with ESMTPS id 58G3eIRt953377
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 11:40:22 +0800
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=ms29.hinet.net;
	s=default; t=1757994022; bh=v28bNIItIv9p9u+ELmiBhD/hU/A=;
	h=From:To:Subject:Date;
	b=chiSqYbmTZdsR6rSIr8H1/BErWTRxT3r1xLkLnlulhVTTZDLvJ4fs00Y43fTOF0HA
	 dabXvecN8GVDILiQcss7VEp+dSN2WYb0a8Spl9ghhlTtitKm1EbvQmTxVKw6AyA2Ac
	 IqG1VRY1bXnoa0FF8ezHGGzdW5ir476OH/OPeVRE=
Received: from [127.0.0.1] (36-236-195-60.dynamic-ip.hinet.net [36.236.195.60])
	by cmsr4.hinet.net (8.15.2/8.15.2) with ESMTPS id 58G3XHk7467851
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 11:36:25 +0800
From: "Info - Albinayah 918" <Linux-usb@ms29.hinet.net>
To: linux-usb@vger.kernel.org
Reply-To: "Info - Albinayah." <europe-sales@albinayah-group.com>
Subject: =?UTF-8?B?TmV3IFNlcHRlbWJlciBPcmRlci4gMDE3MTYgVHVlc2RheSwgU2VwdGVtYmVyIDE2LCAyMDI1IGF0IDA1OjM2OjI0IEFN?=
Message-ID: <67cdcda9-674f-ab72-2e48-5c12621ff44a@ms29.hinet.net>
Content-Transfer-Encoding: 7bit
Date: Tue, 16 Sep 2025 03:36:25 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-HiNet-Brightmail: Spam
X-CMAE-Score: 100
X-CMAE-Analysis: v=2.4 cv=UojANPwB c=0 sm=1 tr=0 ts=68c8db3a
	p=OrFXhexWvejrBOeqCD4A:9 a=TmYfLvmP/U7rMixGAGywmA==:117 a=IkcTkHD0fZMA:10
	a=5KLPUuaC_9wA:10

Hi Linux-usb,

Please provide a quote for your products:

Include:
1.Pricing (per unit)
2.Delivery cost & timeline
3.Quote expiry date

Deadline: September

Thanks!

Kamal Prasad

Albinayah Trading


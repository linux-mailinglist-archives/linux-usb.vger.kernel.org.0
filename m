Return-Path: <linux-usb+bounces-27612-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28272B46620
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 23:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D915AC4629
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 21:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB962283C9D;
	Fri,  5 Sep 2025 21:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b="4weWjWEM"
X-Original-To: linux-usb@vger.kernel.org
Received: from cdmsr2.hinet.net (210-65-1-144.hinet-ip.hinet.net [210.65.1.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E601DE2C2
	for <linux-usb@vger.kernel.org>; Fri,  5 Sep 2025 21:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.65.1.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757108835; cv=none; b=eDLCK5sV7XvEJJr0TL/kXJ/y5qLmgSi+NcggMdG3LweAWD5HhTEcHG3xMiD32JqMoGhp1b8z64Z1h1BOHTNL54oALIJg3N9NgwxF6NhK++lUoOgBeED8OPpB25vF3AUkASyt15Brw/AgsbhqNtuNevEu8v3I60ih4MWbDsOO+TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757108835; c=relaxed/simple;
	bh=o+qLoQAhjBVgxw8p+p/znE8CwPM+2fMcRkqJQKlzslw=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=epu6NUSs5jqxW7lYJgg7tlxwlUjPxa3ikIq0rNAk8OQl/ajecA5IYCTaRk9QG66tC005JMX19UdNhyanARXI3N2PcrQMjA236lAaUhS6ygyDR3k5bFYUuRYxKYeu1oI6wuTQB4yNa5iNF/hYCyeOOh6uJNpt/WTY5YVBp9LjzZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net; spf=pass smtp.mailfrom=ms29.hinet.net; dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b=4weWjWEM; arc=none smtp.client-ip=210.65.1.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ms29.hinet.net
Received: from cmsr8.hinet.net ([10.199.216.87])
	by cdmsr2.hinet.net (8.15.2/8.15.2) with ESMTPS id 585Ll8cK896029
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-usb@vger.kernel.org>; Sat, 6 Sep 2025 05:47:10 +0800
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=ms29.hinet.net;
	s=default; t=1757108830; bh=v28bNIItIv9p9u+ELmiBhD/hU/A=;
	h=From:To:Subject:Date;
	b=4weWjWEM+FsfcjlVnDzpT/RgBxSx0X83aDKoYCUJx+f7jiWpWq3clSVm1F9+nV2sp
	 9NiHjfnal3JmiWyjCazY3fOZvcsMxCOWN/cmMLQSc40uxvh12Np77P7vh+iq4Ew9hX
	 eNsmbl50TaSEnb0hrWBO/AlTShZMU8f64y2cRFI8=
Received: from [127.0.0.1] (111-242-93-98.dynamic-ip.hinet.net [111.242.93.98])
	by cmsr8.hinet.net (8.15.2/8.15.2) with ESMTPS id 585Lbqq5102955
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-usb@vger.kernel.org>; Sat, 6 Sep 2025 05:40:51 +0800
From: "Info - Albinayah 032" <Linux-usb@ms29.hinet.net>
To: linux-usb@vger.kernel.org
Reply-To: "Info - Albinayah." <europe-sales@albinayah-group.com>
Subject: =?UTF-8?B?TmV3IFNlcHRlbWJlciBPcmRlci4gMzU2OTcgRnJpZGF5LCBTZXB0ZW1iZXIgNSwgMjAyNSBhdCAxMTo0MDo0OSBQTQ==?=
Message-ID: <aa1f01f4-f8d0-386b-a86b-121b19ac4a78@ms29.hinet.net>
Content-Transfer-Encoding: 7bit
Date: Fri, 05 Sep 2025 21:40:50 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-HiNet-Brightmail: Spam
X-CMAE-Score: 100
X-CMAE-Analysis: v=2.4 cv=V87e0vni c=0 sm=1 tr=0 ts=68bb58e4
	p=OrFXhexWvejrBOeqCD4A:9 a=dz3rte2YA/NWJqL9zhb/1g==:117 a=IkcTkHD0fZMA:10
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


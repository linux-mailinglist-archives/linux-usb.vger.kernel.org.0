Return-Path: <linux-usb+bounces-27904-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 413D1B524C4
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 01:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F30A4465DE3
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 23:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885DA311C20;
	Wed, 10 Sep 2025 23:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b="Gg3Da0LM"
X-Original-To: linux-usb@vger.kernel.org
Received: from cdmsr1.hinet.net (210-65-1-144.hinet-ip.hinet.net [210.65.1.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3E13081DA
	for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 23:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.65.1.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757547581; cv=none; b=pXt/i1dEMDdTijno7WphuBUpgYrfH2CGs1kTFbUrnC1OSNs3Zn6IesAarrhKEOBJBXVUzQUVzL+o6hTuDUyv2P9t+4NZDrec+vJ1e+46fWsNalEDs+ooUkl+7Vyode2EDcxt5IfcK5t/Ph4Xwdy9I4vAb6woFwnyMX9aS0SRY+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757547581; c=relaxed/simple;
	bh=o+qLoQAhjBVgxw8p+p/znE8CwPM+2fMcRkqJQKlzslw=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=mR8XHXNKHhSSvvZDO+9ifI9DtsuUYrHcBul+KTZFw04g7KtzCU+T0gO+mbBrr1QZyEHE8qfjUHLIjDOAfDhoV56nwbHafNQp26vOvbJ6ZDa1P5EwKNSyeRwlPS3Zb7hxy3ZjzZhHuGmttb3GF+kjPEWprXCxVjzOW7ViaeiHaWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net; spf=pass smtp.mailfrom=ms29.hinet.net; dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b=Gg3Da0LM; arc=none smtp.client-ip=210.65.1.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ms29.hinet.net
Received: from cmsr7.hinet.net ([10.199.216.86])
	by cdmsr1.hinet.net (8.15.2/8.15.2) with ESMTPS id 58ANdZEK535597
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 07:39:36 +0800
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=ms29.hinet.net;
	s=default; t=1757547576; bh=v28bNIItIv9p9u+ELmiBhD/hU/A=;
	h=From:To:Subject:Date;
	b=Gg3Da0LMy+bWvDW9wk1lk9T+p/Dr5J7FryaO1FtZ75xCsp5Ipe4svUSQ7CaMq/FL9
	 QfaXfB3TtrNDjXvz/kI2EODmT6AoeozKwxKIEgDU3IEwxnDPonoyt+VMnVXgoYxtIe
	 ObTdRRHDOrH0Ro3W1RGzOw0K3MGCQF/aVuTxhu/Q=
Received: from [127.0.0.1] (36-238-189-91.dynamic-ip.hinet.net [36.238.189.91])
	by cmsr7.hinet.net (8.15.2/8.15.2) with ESMTPS id 58ANR2Hm603022
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 07:30:33 +0800
From: "Info - Albinayah 265" <Linux-usb@ms29.hinet.net>
To: linux-usb@vger.kernel.org
Reply-To: "Info - Albinayah." <europe-sales@albinayah-group.com>
Subject: =?UTF-8?B?TmV3IFNlcHRlbWJlciBPcmRlci4gMjEwMDYgVGh1cnNkYXksIFNlcHRlbWJlciAxMSwgMjAyNSBhdCAwMTozMDozMiBBTQ==?=
Message-ID: <94bf9e61-eeb8-c99f-934b-67dfd1c738a9@ms29.hinet.net>
Content-Transfer-Encoding: 7bit
Date: Wed, 10 Sep 2025 23:30:32 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-HiNet-Brightmail: Spam
X-CMAE-Score: 100
X-CMAE-Analysis: v=2.4 cv=BPEQr0QG c=0 sm=1 tr=0 ts=68c20a1a
	p=OrFXhexWvejrBOeqCD4A:9 a=YvbWmNstdMrzD/T46JPf8g==:117 a=IkcTkHD0fZMA:10
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


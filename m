Return-Path: <linux-usb+bounces-28324-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F40B88D5E
	for <lists+linux-usb@lfdr.de>; Fri, 19 Sep 2025 12:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0084521CDB
	for <lists+linux-usb@lfdr.de>; Fri, 19 Sep 2025 10:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B4430507B;
	Fri, 19 Sep 2025 10:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b="ho3lFKIX"
X-Original-To: linux-usb@vger.kernel.org
Received: from cdmsr2.hinet.net (210-65-1-144.hinet-ip.hinet.net [210.65.1.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1DB279788
	for <linux-usb@vger.kernel.org>; Fri, 19 Sep 2025 10:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.65.1.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758277227; cv=none; b=cvnpCZyQDP88tQ0wmqReF1O5UsNOSFAd5YHqCdhizrAbXtwhV2P+FpNbt6KkJT7VckIx90fiYhKHkPdGoPgx8frIItm834YjcJa0MiHqCm2GmGmz/gCJl07YU7/CFORNBt5n6OAjJ+2NGktFTXCvpscRKrSKHhFt3NNJh3lEq60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758277227; c=relaxed/simple;
	bh=o+qLoQAhjBVgxw8p+p/znE8CwPM+2fMcRkqJQKlzslw=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=l+40K84R0RP7jb6gRR9Lx0zegbfOfH+Lc5IiRNEQ3B4+kO602202+/HSoTo8fD2r4UO02b3ma+/8/hxThwaQjl2dRVa/BRxdmD7f+g1t2sQHCDqUvjasSeFsGogFguQef33R5Ca9lITvGgAk2va2yEDF2wH6SrpPupoT0BfNzqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net; spf=pass smtp.mailfrom=ms29.hinet.net; dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b=ho3lFKIX; arc=none smtp.client-ip=210.65.1.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ms29.hinet.net
Received: from cmsr6.hinet.net ([10.199.216.85])
	by cdmsr2.hinet.net (8.15.2/8.15.2) with ESMTPS id 58JAK8XG798905
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-usb@vger.kernel.org>; Fri, 19 Sep 2025 18:20:17 +0800
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=ms29.hinet.net;
	s=default; t=1758277217; bh=v28bNIItIv9p9u+ELmiBhD/hU/A=;
	h=From:To:Subject:Date;
	b=ho3lFKIXGFesRjMriXux3uwa8a1EwRAfv5Vi6+tDkzTcdL3DcgdA4RvxzbsXgcBV1
	 8wcdFnqRibdBmSSzMAkkX1m4tOOGGGMw4+gL6te+245O9Nur+QVfB0uvsgGGO9J8CV
	 9THJJophp++mKCazuwFw7IHdBY9fOXX4fCsfGvRI=
Received: from [127.0.0.1] (114-26-192-195.dynamic-ip.hinet.net [114.26.192.195])
	by cmsr6.hinet.net (8.15.2/8.15.2) with ESMTPS id 58JAFaBC005645
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-usb@vger.kernel.org>; Fri, 19 Sep 2025 18:17:42 +0800
From: "Info - Albinayah 903" <Linux-usb@ms29.hinet.net>
To: linux-usb@vger.kernel.org
Reply-To: "Info - Albinayah." <sales@albinayah-group.com>
Subject: =?UTF-8?B?TmV3IFNlcHRlbWJlciBPcmRlci4gODUxMDcgRnJpZGF5LCBTZXB0ZW1iZXIgMTksIDIwMjUgYXQgMTI6MTc6NDAgUE0=?=
Message-ID: <643e8c2b-ac1b-70e9-41cf-3dde03374e38@ms29.hinet.net>
Content-Transfer-Encoding: 7bit
Date: Fri, 19 Sep 2025 10:17:41 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-HiNet-Brightmail: Spam
X-CMAE-Score: 100
X-CMAE-Analysis: v=2.4 cv=D/nkKeRj c=0 sm=1 tr=0 ts=68cd2dc8
	p=OrFXhexWvejrBOeqCD4A:9 a=b8RB/zUUWYz0H4HqEF/G2Q==:117 a=IkcTkHD0fZMA:10
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


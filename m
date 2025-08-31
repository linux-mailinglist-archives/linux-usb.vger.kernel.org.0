Return-Path: <linux-usb+bounces-27399-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D791B3D0DA
	for <lists+linux-usb@lfdr.de>; Sun, 31 Aug 2025 05:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 208763A784C
	for <lists+linux-usb@lfdr.de>; Sun, 31 Aug 2025 03:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E1F17A2E6;
	Sun, 31 Aug 2025 03:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b="g1vPgp9A"
X-Original-To: linux-usb@vger.kernel.org
Received: from cmsr-t-8.hinet.net (cmsr-t-8.hinet.net [203.69.209.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E900F38DD3
	for <linux-usb@vger.kernel.org>; Sun, 31 Aug 2025 03:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.69.209.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756612501; cv=none; b=Hzh+Cv36XQvj7QWg75sOj5agRGDRamQUzr6IRemdnUFT/dHbpkC1Fd+sFV4DOGbAlwaR7lgoqmr8MzgJhoc7aySlfbMM7oznsD9FMMX8suPljzftXuhsw7s0LgK26zTXXjhbyuazKu52vnq5j0lmO4c7McfqLb0M0/nOm8gZu7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756612501; c=relaxed/simple;
	bh=o+qLoQAhjBVgxw8p+p/znE8CwPM+2fMcRkqJQKlzslw=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=mDDhYJd4+RNKCBubmuohVTWFjfzb6dbpgsfqGFcAVfL5XR76NYcATn/XwDV8ez0OlJjuCDzXYwOTEJJ5RcT4UiYDupDmn4oJ7r1+jQPz1zZPpy0YqIc1U7BT/HFYM5LynEk69R6MPTQHhaXH6uHug9hqrzm0Fg5/weTGoiK5ZUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net; spf=pass smtp.mailfrom=ms29.hinet.net; dkim=pass (2048-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b=g1vPgp9A; arc=none smtp.client-ip=203.69.209.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ms29.hinet.net
Received: from cmsr10.hinet.net ([10.199.216.89])
	by cmsr-t-8.hinet.net (8.15.2/8.15.2) with ESMTPS id 57V3suoW475532
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-usb@vger.kernel.org>; Sun, 31 Aug 2025 11:54:56 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ms29.hinet.net;
	s=s2; t=1756612496; bh=o+qLoQAhjBVgxw8p+p/znE8CwPM+2fMcRkqJQKlzslw=;
	h=From:To:Subject:Date;
	b=g1vPgp9AUz9kXCD7t2iNgE8XlbJm8jUuBUGTthLvSGCjzVpVvFnHKdV15fEmshfiL
	 bdyKdF6lb2I6arcjdjIMh4Drl44VNVsM4fmE94VAfCkONJ6/SMGnYZeEmkRqaE0NTi
	 aw4w2KS9dXZ79Pd5W5LDQae1YsTehehz1gfir0txYbyDB440DmWkdFDELcHLWzqwgd
	 wEElWelvT0ww9inmRt6doQB36fHtIRiS+Ohhgg0+ENJ16n4n+lYBSS8Wlkjnre9pwp
	 9vqlMhCgeiB2eD5PwkmeLXdIKmsjl2ePoDJ7FSPE0oNwD6GunRS36h+frBU0bkLPA+
	 2dSQmf842Y+jw==
Received: from [127.0.0.1] (1-162-72-247.dynamic-ip.hinet.net [1.162.72.247])
	by cmsr10.hinet.net (8.15.2/8.15.2) with ESMTPS id 57V3q87Z469045
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-usb@vger.kernel.org>; Sun, 31 Aug 2025 11:54:55 +0800
From: "Info - Albinayah 558" <Linux-usb@ms29.hinet.net>
To: linux-usb@vger.kernel.org
Reply-To: "Info - Albinayah." <europe-sales@albinayah-group.com>
Subject: =?UTF-8?B?TmV3IFNlcHRlbWJlciBPcmRlci4gODcwODMgU3VuZGF5LCBBdWd1c3QgMzEsIDIwMjUgYXQgMDU6NTQ6NTQgQU0=?=
Message-ID: <a5788a49-6a14-43fa-3b10-3c9a04cd1d84@ms29.hinet.net>
Content-Transfer-Encoding: 7bit
Date: Sun, 31 Aug 2025 03:54:55 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=S5B6w5sP c=1 sm=1 tr=0 ts=68b3c790
	a=eI+Mn6l7+kMk4+mlcE6G5w==:117 a=IkcTkHD0fZMA:10 a=5KLPUuaC_9wA:10
	a=OrFXhexWvejrBOeqCD4A:9 a=QEXdDO2ut3YA:10

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


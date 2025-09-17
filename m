Return-Path: <linux-usb+bounces-28184-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F00BCB7F592
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 15:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F3353BBD99
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 08:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F187308F2A;
	Wed, 17 Sep 2025 08:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b="yAz1xdU2"
X-Original-To: linux-usb@vger.kernel.org
Received: from cdmsr1.hinet.net (210-65-1-144.hinet-ip.hinet.net [210.65.1.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD510308F0E
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 08:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.65.1.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758097189; cv=none; b=Z3ULsL8sRHJhYP3IvRSRL0p4APbRPGXRFR8/Cc6EXNitLuJSemAyHcs0Ilw1m32OtqfFpHOLv410BG0+Fh6XLPSjVfbZ+ojtzHdYewPX8qmdYKHCDNUB4tr1u1OeJWR0Ise++ZjsJ50dIuj427SlN9HCnE2pK9bCSnqNWhPIZxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758097189; c=relaxed/simple;
	bh=o+qLoQAhjBVgxw8p+p/znE8CwPM+2fMcRkqJQKlzslw=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=rYAGUeedDXPHkSWoifjQ2xqZWjk3VgLQMkb7sCdjHv2vw4PcUqrUYtxiuBib9EEGyDywRsyPc6NqHVChKtwckjaW1hlk+9y7IR1xsYDlKrtRYnRUk3fWzlRHesDX6sGn0U72Yb4I0O7/6FY68XcJd78cePiIBg1AjIDLhO+zKRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net; spf=pass smtp.mailfrom=ms29.hinet.net; dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b=yAz1xdU2; arc=none smtp.client-ip=210.65.1.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ms29.hinet.net
Received: from cmsr7.hinet.net ([10.199.216.86])
	by cdmsr1.hinet.net (8.15.2/8.15.2) with ESMTPS id 58H8JaMT976144
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 16:19:39 +0800
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=ms29.hinet.net;
	s=default; t=1758097179; bh=v28bNIItIv9p9u+ELmiBhD/hU/A=;
	h=From:To:Subject:Date;
	b=yAz1xdU22EMONzdSuKseI20zm0Bksb/etZAwjtAKfA9JJz+KGBaCEUy4DS0ZSLQ1A
	 Qxqkq50dn/EjrPnPCU8CGNvqjHNGem36h79mNuEzca+z4xKoZlZXHcmywslbv0HGxl
	 N8bRrx6iWYOdDhjbjnlQvB6YnYmqrSS+crbF6Qgc=
Received: from [127.0.0.1] (118-171-107-117.dynamic-ip.hinet.net [118.171.107.117])
	by cmsr7.hinet.net (8.15.2/8.15.2) with ESMTPS id 58H8AL6J735834
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 16:13:48 +0800
From: "Info - Albinayah 068" <Linux-usb@ms29.hinet.net>
To: linux-usb@vger.kernel.org
Reply-To: "Info - Albinayah." <sales@albinayah-group.com>
Subject: =?UTF-8?B?TmV3IFNlcHRlbWJlciBPcmRlci4gMTA1NDMgV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMTcsIDIwMjUgYXQgMTA6MTM6NDYgQU0=?=
Message-ID: <b797222a-572c-e375-9ee6-a527c5c126ac@ms29.hinet.net>
Content-Transfer-Encoding: 7bit
Date: Wed, 17 Sep 2025 08:13:47 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-HiNet-Brightmail: Spam
X-CMAE-Score: 100
X-CMAE-Analysis: v=2.4 cv=I/PGR8gg c=0 sm=1 tr=0 ts=68ca6dbd
	p=OrFXhexWvejrBOeqCD4A:9 a=f9u2bkyl1gB0tnSaUEbRzg==:117 a=IkcTkHD0fZMA:10
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


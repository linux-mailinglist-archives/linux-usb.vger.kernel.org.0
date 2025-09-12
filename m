Return-Path: <linux-usb+bounces-28021-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DA6B5497C
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 12:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9AFA7B8003
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 10:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05CDD2F1FD2;
	Fri, 12 Sep 2025 10:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b="A1LX22iq"
X-Original-To: linux-usb@vger.kernel.org
Received: from cdmsr1.hinet.net (210-65-1-144.hinet-ip.hinet.net [210.65.1.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89ED82F1FC8
	for <linux-usb@vger.kernel.org>; Fri, 12 Sep 2025 10:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.65.1.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672219; cv=none; b=CPYLmVCRb1wVMu7m5V2yQlk0euTNFh2+lBtOzKZc0x40NfQpQfluyJyGJ+pXJDFAKnVVkanhMJhAOPECsKDLLY70oDg7ilHVn6xKf37nLj1AnoN7gv/XQ+A3sSg4ubPtI5wFhPhdeocP4spCDrtsdM3fwmVTiMxOMhzTwd2mq18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672219; c=relaxed/simple;
	bh=o+qLoQAhjBVgxw8p+p/znE8CwPM+2fMcRkqJQKlzslw=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=NQP3yjbbhMTJtqQedl1OsVH3P+WJlqHgEAADYy6KURycW29myDBQ/DMyhVOzNdaCii8nGneTxBQOn/NjGQnk/Ufj1c/rP1qp0y1fwIbinLs1T907Astax5OBEnb+dvNIRXUl2WmJuPw2g8y8LysvLOX0BrglJJoKM0EM84NEZM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net; spf=pass smtp.mailfrom=ms29.hinet.net; dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b=A1LX22iq; arc=none smtp.client-ip=210.65.1.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ms29.hinet.net
Received: from cmsr10.hinet.net ([10.199.216.89])
	by cdmsr1.hinet.net (8.15.2/8.15.2) with ESMTPS id 58CAGkkJ860690
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-usb@vger.kernel.org>; Fri, 12 Sep 2025 18:16:49 +0800
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=ms29.hinet.net;
	s=default; t=1757672209; bh=v28bNIItIv9p9u+ELmiBhD/hU/A=;
	h=From:To:Subject:Date;
	b=A1LX22iqCoc9d5PTcLKJK55lrXi1AU1TFRM73LApPCkC62ilTIJDtYJlc1CdUzvkw
	 utEv54C+RfDZoOiReoTfvYKW7o6NV7giI2UozbCZ0zJ1OuztdK7QwlcJHLI1P4M+Kn
	 DuoqrGNTPFidEBL0USa9id3qqN8X6v4GuMOUhcGg=
Received: from [127.0.0.1] (111-246-134-52.dynamic-ip.hinet.net [111.246.134.52])
	by cmsr10.hinet.net (8.15.2/8.15.2) with ESMTPS id 58CA9d8a508151
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-usb@vger.kernel.org>; Fri, 12 Sep 2025 18:12:01 +0800
From: "Info - Albinayah 789" <Linux-usb@ms29.hinet.net>
To: linux-usb@vger.kernel.org
Reply-To: "Info - Albinayah." <europe-sales@albinayah-group.com>
Subject: =?UTF-8?B?TmV3IFNlcHRlbWJlciBPcmRlci4gNzc4MjEgRnJpZGF5LCBTZXB0ZW1iZXIgMTIsIDIwMjUgYXQgMTI6MTE6NTkgUE0=?=
Message-ID: <c5b5b4c5-2e96-1edc-69cc-06f0b56d5af2@ms29.hinet.net>
Content-Transfer-Encoding: 7bit
Date: Fri, 12 Sep 2025 10:12:00 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-HiNet-Brightmail: Spam
X-CMAE-Score: 100
X-CMAE-Analysis: v=2.4 cv=Au5N3/9P c=0 sm=1 tr=0 ts=68c3f1f2
	p=OrFXhexWvejrBOeqCD4A:9 a=ZDli3yJdMke8RanEWuCuFA==:117 a=IkcTkHD0fZMA:10
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


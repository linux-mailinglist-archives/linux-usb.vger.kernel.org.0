Return-Path: <linux-usb+bounces-27271-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B436CB34D51
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 23:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A17E2053A5
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 21:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E7328B7CC;
	Mon, 25 Aug 2025 21:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=msa.hinet.net header.i=@msa.hinet.net header.b="nOg5+fvN"
X-Original-To: linux-usb@vger.kernel.org
Received: from cdmsr1.hinet.net (210-65-1-144.hinet-ip.hinet.net [210.65.1.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157711B041A
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 21:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.65.1.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756155705; cv=none; b=WhKK29NiXQHkzZPm6z+IL59eogMsjaXHeW8H9bGm4oLUCx1VCK5fUBabtX1EkjM2oDVd1cTGsbaZtlmzt6HEoA/3NCDnkZ2SZbVU7TVDB9tBY+VHfdItE6ZDL0y8tlHI957QDEPPrkURzNBP/1pRvkm66TVQK5Usr//OeiV2Nbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756155705; c=relaxed/simple;
	bh=Z1MdS5Urfw7ePm/p1D4MrWWCnqc/pjXbcAkk0qAPJOI=;
	h=Message-ID:From:To:Subject:Date:MIME-Version:Content-Type; b=ZRKQJnXuAVtRnuG8D2Mh20XjWJx+2XJR8GKmgJUgrkpBagxswAC87V7BDOz5yt08pjwsut0B5bh+H5F+4V6xb1ob/bmB5H6DYnqimN2pma9KCymTB9Lu6gs40/B+V0hYf+UGGK/b39DjzZ3XCLTeo3RdljXgmegtTHUp9JvX0Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=msa.hinet.net; spf=pass smtp.mailfrom=msa.hinet.net; dkim=pass (1024-bit key) header.d=msa.hinet.net header.i=@msa.hinet.net header.b=nOg5+fvN; arc=none smtp.client-ip=210.65.1.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=msa.hinet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=msa.hinet.net
Received: from cmsr5.hinet.net ([10.199.216.84])
	by cdmsr1.hinet.net (8.15.2/8.15.2) with ESMTPS id 57PL1egE589991
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-usb@vger.kernel.org>; Tue, 26 Aug 2025 05:01:41 +0800
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=msa.hinet.net;
	s=default; t=1756155701; bh=JBCbLQYoCHeAvUijnyWJT+nTyyE=;
	h=From:To:Subject:Date;
	b=nOg5+fvNrMGYk/WtgALosPrldDOS4EK4GevgcwAAnItptZ60ReiV4imT8ZaGNamgk
	 h8VNAynQwdClYByoXDRUNJK7ASbZPfjxNf3VG7pbG16J+Q9NjoqWb28xjNLrI6jzHh
	 n7kc6sjETZD5mXZcCBhaDIRQl6ECq3xjUTpgAIE0=
Received: from [127.0.0.1] (111-243-194-157.dynamic-ip.hinet.net [111.243.194.157])
	by cmsr5.hinet.net (8.15.2/8.15.2) with ESMTPS id 57PKwQnJ612960
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <linux-usb@vger.kernel.org>; Tue, 26 Aug 2025 04:58:29 +0800
Message-ID: <3b14c93f0f125f1fb3c16c012747da38bd43a7309d2aef7876d307564d104bae@msa.hinet.net>
From: Sales <europe-salesclue@msa.hinet.net>
Reply-To: europe-sales@albinayah-group.com
To: linux-usb@vger.kernel.org
Subject: September Quote - RFQ
Date: Mon, 25 Aug 2025 13:58:28 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=YdAe5BRf c=1 sm=1 tr=0 ts=68acce75
	a=tXRkYN0551lGFtdA1i+rRQ==:117 a=kj9zAlcOel0A:10 a=OrFXhexWvejrBOeqCD4A:9
	a=CjuIK1q_8ugA:10

Hi,

Please provide a quote for your products:

Include:
1.Pricing (per unit)
2.Delivery cost & timeline
3.Quote expiry date

Deadline: September

Thanks!

Kamal Prasad

Albinayah Trading


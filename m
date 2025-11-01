Return-Path: <linux-usb+bounces-29975-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A030DC27C7C
	for <lists+linux-usb@lfdr.de>; Sat, 01 Nov 2025 12:09:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2E21334A7F7
	for <lists+linux-usb@lfdr.de>; Sat,  1 Nov 2025 11:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C6A2F28F2;
	Sat,  1 Nov 2025 11:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=msa.hinet.net header.i=@msa.hinet.net header.b="TsO8Drt6"
X-Original-To: linux-usb@vger.kernel.org
Received: from cdmsr2.hinet.net (210-65-1-144.hinet-ip.hinet.net [210.65.1.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAB81A7AE3
	for <linux-usb@vger.kernel.org>; Sat,  1 Nov 2025 11:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.65.1.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761995344; cv=none; b=DUn/ZSWjJFSfHbb8dOjP2r/2wPGdXUZqnDcVgq7gYF3wNNIvvba03zw3vQlY+UrPQi2Hg9ZUkPYZnXeDm90hsC7eM+CdczupndFkaW0kWPi6BIrRrUg5qfesqqDMyRdnvhkFn/rNLHKPltBv/Ed7waapahdC1JeLo9ziFxx0sco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761995344; c=relaxed/simple;
	bh=ErxuNh1ZeCh5xd2RzkARSEcQDKUmqKph3P8a4rcFeVk=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=nrQhNrEB4WCVFIqgvVm+/aVJfYe/F0c1SKK0ZGGKa8GGTKKS98KiQ/CWKUdn9MKEp+V5e1QvU1pQqHMaOWXjLpx5/n7mkFg/4ZMCMBVOuyCuyeKR/n5FsK6hIMNc/ZNFEeRapt0WoJT6grds407UoMeEYIVOiC5iut2z92yfkAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=msa.hinet.net; spf=pass smtp.mailfrom=msa.hinet.net; dkim=pass (1024-bit key) header.d=msa.hinet.net header.i=@msa.hinet.net header.b=TsO8Drt6; arc=none smtp.client-ip=210.65.1.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=msa.hinet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=msa.hinet.net
Received: from cmsr3.hinet.net ([10.199.216.82])
	by cdmsr2.hinet.net (8.15.2/8.15.2) with ESMTPS id 5A1AKNO0605313
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-usb@vger.kernel.org>; Sat, 1 Nov 2025 18:20:26 +0800
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=msa.hinet.net;
	s=default; t=1761992426; bh=sNIq5lVVqOjBGLSfP8rWALDX9K8=;
	h=From:To:Subject:Date;
	b=TsO8Drt63XjbKzOZHzK4V391fPk6nRqZjnhbqv6dBn1Mhd2OxIlrvucnkDSiLPTo5
	 2qoErorbSZAezq6hJo/NJanTy7IA4lB8vOMaSk2I7JoH+fiqZlc7fj8xE9G3dstufv
	 kWwGTnV9LOhu2g8yFBN67nm+M9WOw75EbjJgV3v8=
Received: from [127.0.0.1] (220-129-64-160.dynamic-ip.hinet.net [220.129.64.160])
	by cmsr3.hinet.net (8.15.2/8.15.2) with ESMTPS id 5A1AFZEU474285
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-usb@vger.kernel.org>; Sat, 1 Nov 2025 18:18:44 +0800
From: Procurement 25995 <Linux-usb@msa.hinet.net>
To: linux-usb@vger.kernel.org
Reply-To: Procurement <purchase@pathnsithu.com>
Subject: =?UTF-8?B?TkVXIFBPIDQxNzgxIFNhdHVyZGF5LCBOb3ZlbWJlciAxLCAyMDI1IGF0IDExOjE4OjQzIEFN?=
Message-ID: <30fb4125-e767-35d5-9439-f1964b6e0af0@msa.hinet.net>
Content-Transfer-Encoding: 7bit
Date: Sat, 01 Nov 2025 10:18:43 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=OKyE3jaB c=1 sm=1 tr=0 ts=6905de85
	a=g/qj5bNDcplWbjIWUREWww==:117 a=IkcTkHD0fZMA:10 a=5KLPUuaC_9wA:10
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


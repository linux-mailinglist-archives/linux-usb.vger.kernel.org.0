Return-Path: <linux-usb+bounces-28746-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E285BA7496
	for <lists+linux-usb@lfdr.de>; Sun, 28 Sep 2025 18:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5EDD3B973E
	for <lists+linux-usb@lfdr.de>; Sun, 28 Sep 2025 16:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5CFB235341;
	Sun, 28 Sep 2025 16:23:48 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from framboos.boetes.org (framboos.boetes.org [185.69.247.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10279134AB
	for <linux-usb@vger.kernel.org>; Sun, 28 Sep 2025 16:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.69.247.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759076628; cv=none; b=Y5EvATGKhD5rYRXT9z/nsB5i8XfkznfTEaFXc83WSGhseixo0BEjRU83i35q3+KqfGON0kwqSV6BsSrmXVz6xsjyyEp7XC9UNfl7zK3rizc868reBNQO8bvxttt9sNWO80K9YH0dQHG6rpvHi8MiRdFFWZDocLQtY8pkg5zA1CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759076628; c=relaxed/simple;
	bh=kKIy+9qaghQwe24KVSY3AazQPqVxJO3y3jQxdmNLm2I=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=ErTm1xlrmga1PVRBGpUKkcj/6qxcjC/rUy88PAcjdL90ZqDhnkGxBScG3Q93q0xvDBoY8bldwtr/sh88EcXZQnKHFMAobD7ScPFdBq82AnFaVtJUF6P+kjGberSFtlOx1PMS8O2KNaau+zGsCnBgYxF8JSjnAG2OIt8408YrDpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=boetes.org; spf=pass smtp.mailfrom=boetes.org; arc=none smtp.client-ip=185.69.247.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=boetes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=boetes.org
Received: from [192.168.254.99] (unknown [192.168.254.99])
	by framboos.boetes.org (Postfix) with ESMTPSA id 3DFD57F52FFB
	for <linux-usb@vger.kernel.org>; Sun, 28 Sep 2025 16:23:39 +0000 (UTC)
Message-ID: <7c7d0b10-9969-45e8-9440-563960645c36@boetes.org>
Date: Sun, 28 Sep 2025 18:22:54 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Content-Language: en-US
To: linux-usb@vger.kernel.org
From: Han Boetes <han@boetes.org>
Subject: As per request
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[Sep29 00:57] [Mon Sep 29 00:57:28 2025] usb 1-2: new high-speed USB 
device number 5 using xhci_hcd
[  +0.127881] [Mon Sep 29 00:57:28 2025] usb 1-2: New USB device found, 
idVendor=0603, idProduct=8611, bcdDevice= 1.00
[  +0.000018] [Mon Sep 29 00:57:28 2025] usb 1-2: New USB device 
strings: Mfr=1, Product=2, SerialNumber=3
[  +0.000005] [Mon Sep 29 00:57:28 2025] usb 1-2: Product: Fly12 Sport
[  +0.000004] [Mon Sep 29 00:57:28 2025] usb 1-2: Manufacturer: Cycliq
[  +0.000004] [Mon Sep 29 00:57:28 2025] usb 1-2: SerialNumber: 
966110000000100
[  +0.645032] [Mon Sep 29 00:57:29 2025] usb-storage 1-2:1.0: USB Mass 
Storage device detected
[  +0.000406] [Mon Sep 29 00:57:29 2025] usb-storage 1-2:1.0: Quirks 
match for vid 0603 pid 8611: 4000
[  +0.000007] [Mon Sep 29 00:57:29 2025] usb-storage 1-2:1.0: This 
device (0603,8611,0100 S 06 P 50) has unneeded SubClass and Protocol 
entries in unusual_devs.h (kernel 6.17.0-0.rc7.56.fc43.x86_64)
                               Please send a copy of this message to 
<linux-usb@vger.kernel.org> and <usb-storage@lists.one-eyed-alien.net>
[  +0.000129] [Mon Sep 29 00:57:29 2025] scsi host0: usb-storage 1-2:1.0
[  +0.000310] [Mon Sep 29 00:57:29 2025] usbcore: registered new 
interface driver usb-storage
[  +0.007605] [Mon Sep 29 00:57:29 2025] usbcore: registered new 
interface driver uas



Return-Path: <linux-usb+bounces-14374-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFBC966170
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 14:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA2BCB27A5B
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 12:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6896D199923;
	Fri, 30 Aug 2024 12:20:45 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from pasta.tip.net.au (pasta.tip.net.au [203.10.76.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0003F1D1312
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 12:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.10.76.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725020445; cv=none; b=F6GCDxxJNtl4jI9gFhSmOKa82b2RCtaITeGi4vnn5nrjBCKHo2N+ax03fsIRhvkp4z5LBxsSPuY9Nz+GSe9ee66Fk9wC6Up3uqy6c8HcuPrSsXPJW7ZY/mm4qosPjRObuIFQIy7fn3eVU8soVGz2mZTpvIig2h3iSmL6XneN+zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725020445; c=relaxed/simple;
	bh=s/9UPoJ2Hcm0QdRM+ifFEI5a4KOIEVGWJ9WYxoYi2YE=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=nIB11HK06o/KD24lmkq3rEqhWmmXem93gHEQbv2bIgLd6I6DWZjlnL331y1MgGzQWzpDRzdUDbazwxH5uq++Pr+R6cC8FCTlbRXSSkRa56NhCEYSskRRXz3HwJCiBRZVGuO6/QcPM2YU0zU+OMn+A17IRy2ewG1PjGneK84D7s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eyal.emu.id.au; spf=pass smtp.mailfrom=eyal.emu.id.au; arc=none smtp.client-ip=203.10.76.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eyal.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eyal.emu.id.au
Received: from [192.168.2.7] (unknown [101.115.81.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailhost.tip.net.au (Postfix) with ESMTPSA id 4WwHBr3y6pz9RKG
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 22:14:28 +1000 (AEST)
Message-ID: <63d4782a-1d83-4252-a0ca-a9b50e6074f0@eyal.emu.id.au>
Date: Fri, 30 Aug 2024 22:14:20 +1000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-usb@vger.kernel.org
Reply-To: eyal@eyal.emu.id.au
Content-Language: en-US
From: Eyal Lebedinsky <eyal@eyal.emu.id.au>
Subject: Understanding 'lsusb -t'
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I assume that the generated list is a tree, so each leaf (Device/If) is on only one point.

I note this output:

$ lsusb -tv
/:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/16p, 480M
     ID 1d6b:0002 Linux Foundation 2.0 root hub
[trimmed]
     |__ Port 004: Dev 004, If 0, Class=Hub, Driver=hub/4p, 480M
[trimmed]
     |__ Port 005: Dev 006, If 0, Class=Hub, Driver=hub/4p, 480M
[trimmed]
     |__ Port 006: Dev 019, If 0, Class=Hub, Driver=hub/4p, 480M
         ID 2109:2817 VIA Labs, Inc.
/:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/10p, 10000M
[trimmed]
     |__ Port 006: Dev 006, If 0, Class=Hub, Driver=hub/4p, 5000M
         ID 2109:0817 VIA Labs, Inc.

I removed some content that is not relevant to my question.

Note the Bus 001.Port 006 and Bus 002.Port 006 entries.

I verified that both are for the same (one) device. They do not show when I disconnect it.
The device is an external 4-port USB3.0 hub. It is listed once as 480M and once as 5000M.
Nothing is plugged into any of the four ports.

Is this correct? Why does this device show twice in the list?

TIA

-- 
Eyal at Home (eyal@eyal.emu.id.au)


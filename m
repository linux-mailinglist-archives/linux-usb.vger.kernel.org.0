Return-Path: <linux-usb+bounces-23248-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F90FA9482B
	for <lists+linux-usb@lfdr.de>; Sun, 20 Apr 2025 17:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CAB016A22A
	for <lists+linux-usb@lfdr.de>; Sun, 20 Apr 2025 15:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB021EB190;
	Sun, 20 Apr 2025 15:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bigon.be header.i=@bigon.be header.b="AihTl4sb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17C71A9B5D
	for <linux-usb@vger.kernel.org>; Sun, 20 Apr 2025 15:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745162318; cv=none; b=f6QXJPpT6dsKvKI+V1Oy73013NaRHg0yVSVWDfX1FxHtKUK8EjAsuKPgdanfYKQyD7wOKYrWqou01k3QFLyeRFrFo91Ntv5V2bf23XGdGW85MdSUZfs5Av40IGp9ABB9kuIr4sqdhtYnrdvGN9LoTNQpBFirrrd29j3jBIpo2A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745162318; c=relaxed/simple;
	bh=MBzRyf3V3Zf1IqfRFbE7iz/Z+UlrBdXJ1r/urWQyWFI=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=uoQVEAaWgKpgs9G+KBMK74l6WqzUnoSjUrqwZ5jbcQk7RHHJNnGKpaTbjd55ZpbKdtfPPkztZZqKSxghhNEtARYQwJURD+Uiz2nAlt+IQZ9ZpSMPxorDMWKEqYOxlykEaDbiUdUbiX+bTz0+4MgTH0LwF+NsDOsHFotgSKZoqQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bigon.be; spf=pass smtp.mailfrom=bigon.be; dkim=pass (2048-bit key) header.d=bigon.be header.i=@bigon.be header.b=AihTl4sb; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bigon.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bigon.be
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZgXFZ2423z9str
	for <linux-usb@vger.kernel.org>; Sun, 20 Apr 2025 17:18:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bigon.be; s=MBO0001;
	t=1745162306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=hIDazPIxB3dqI1MYzgrRjNSH8NmDe1hBH8LJPkqiK2c=;
	b=AihTl4sb90IfrLZlii9gXhpZh5zbJd0M4rX4hFIL5FLWoxBX7yAoCXg12XG1QO5jiGIFMI
	F8QCWqqtIOCz3f9JqCe9OFV8G0vOv14NQbHxV2Sk4HZpquOE1dilVEUhcTthMevIDMmR3w
	GAu7ilwsa9K+ulyn6zFMu0aWrMJQGOFGSTy7zjCS7FxwSrVpDDu+zaVtJui1GVhvR2ZJDz
	8wH6V/gd3xlB7X8SExGZVZA6K35j9+ZwzWy+gsNmbrO/4Hh/6MumjFFRyGhn2tqQixM4EH
	T5r54t7C79qdAqJf4FbJvjeA6bSRoKLHKYAR6X83kbIsNFxgVe/YofpWoxjVUA==
Message-ID: <d6411546-c4e4-4bc0-aec4-3e47ab45301f@bigon.be>
Date: Sun, 20 Apr 2025 17:18:25 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Laurent Bigonville <bigon@bigon.be>
To: linux-usb@vger.kernel.org
Content-Language: en-US, fr-BE, fr
Autocrypt: addr=bigon@bigon.be; keydata=
 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
 Gub8y8YgCrSTibbvx1KRJA==
Subject: rndis_host: Zyxel 5G portable router seen as a WWAN device and not an
 Ethernet one in 6.13
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4ZgXFZ2423z9str

Hello,

I've a Zyxel 5G portable router (NR2301).

Bus 003 Device 002: ID 05c6:9057 Qualcomm, Inc. SDXLEMUR-LITE-MTP _SN:XXXX

With kernel 6.12.22 from debian unstable, when the device is connected 
to the computer by USB, it is seen as a network card and NetworkManager 
(1.52.0) runs DHCP to get a connection.

With 6.13, this is not the case anymore.

dmesg output with 6.12.22:
rndis_host 3-2:1.0 eth0: register 'rndis_host' at usb-0000:00:14.0-2, 
RNDIS device, fc:dd:55:ff:ff:ff
usbcore: registered new interface driver rndis_host
rndis_host 3-2:1.0 enxfcdd55ffffff: renamed from eth0

dmesg output with 6.13:
rndis_host 3-2:1.0 wwan0: register 'rndis_host' at usb-0000:00:14.0-2, 
Mobile Broadband RNDIS device, fc:dd:55:ff:ff:ff
usbcore: registered new interface driver rndis_host
rndis_host 3-2:1.0 wwxfcdd55ffffff: renamed from wwan0

As you can see with 6.12 it's seen as a Ethernet/RNDIS device, but with 
6.13 it's seen as a Mobile Broadband RNDIS device

This seems to be a regression from 67d1a8956d2d62fe6b4c13ebabb57806098511d8

Note that the device is establishing the connection itself and also act 
as a WiFi access point. The computer is not involved in the ppp 
connection at all.

Can something be done?

Kind regards,

Laurent Bigonville



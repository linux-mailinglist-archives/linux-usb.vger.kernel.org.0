Return-Path: <linux-usb+bounces-32634-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNdxDxlDcmnpfAAAu9opvQ
	(envelope-from <linux-usb+bounces-32634-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 16:32:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C635068EA7
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 16:32:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B58730188C1
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 15:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9543392C3D;
	Thu, 22 Jan 2026 15:31:34 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cczrelay02.in2p3.fr (cczrelay02.in2p3.fr [134.158.66.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C7B389E05
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 15:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.158.66.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769095894; cv=none; b=ljk+JmAkkBDTJW5kp9UPMOWgwNMlf9JvSIupU7pA/SFpQHEN9k0qnIV20gN/p7GL8T+Pem/eOqVYG6eqHObBFQ+WqtiwnRxYwWzUCTzHs3xbh65aGeZCof5J6wbE4ZAo+lXkMtfKSVNAuZTsguBOPnEKhkNVoLjJ72Qj99R43Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769095894; c=relaxed/simple;
	bh=Y6YnDth5+QED0EsDkTK+/TcBEmsW8znK3lIYQTXHdhc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=cQlIaB2Jo1Ck4DVKkAP2oT/Wgv05f4seaL0AVdN7GSQOSBu61Ms8WNIQguKTMmyPgi1PZQy3cnXg1dk4E30H8bConpudTukbwlVx6KJmpIh1n0wsjtk/3UxlMKphAo3fVaQb733riip6Xa3Pp7ou3soXlE0XkKUlmPZ1s9J3w0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=clermont.in2p3.fr; spf=pass smtp.mailfrom=clermont.in2p3.fr; arc=none smtp.client-ip=134.158.66.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=clermont.in2p3.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=clermont.in2p3.fr
Received: from [134.158.124.135] (clrelecpo09w.in2p3.fr [134.158.124.135])
	(authenticated bits=0)
	by cczrelay02.in2p3.fr (8.14.4/8.14.4) with ESMTP id 60MFVR8h030067
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 16:31:28 +0100
Message-ID: <a22356cc-4e55-4b09-8b76-5444bc55cb18@clermont.in2p3.fr>
Date: Thu, 22 Jan 2026 16:31:27 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: David Picard <david.picard@clermont.in2p3.fr>
Subject: can't enable UPLI-compatible PHY
To: ML-Linux-USB <linux-usb@vger.kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	DMARC_NA(0.00)[in2p3.fr];
	RCPT_COUNT_ONE(0.00)[1];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david.picard@clermont.in2p3.fr,linux-usb@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,clermont.in2p3.fr:mid];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-32634-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: C635068EA7
X-Rspamd-Action: no action

Hello,

I can't enable a ULPI-compatible USB 2.0 PHY (Microchip's USB3320) on an 
Intel/Altera Cyclone 5 SoC FPGA (ARM core).

The PHY is supposed to set its CPEN pin high to enable a power switch 
that drives Vbus to 5V, but it doesn't.
I was told not to worry about the regulator messages.

GPIO0, the PHY RESET# pin is driven high by the devicetree (checked in 
Barebox).

The Barebox maintainers think it should be easier to fix in Linux. Could 
someone give me some hint?

- board schematic (p1 bottom right: SoC FPGA connection;  p2: PHY; p3: 
"USB load switch"): 
https://filesender.renater.fr/?s=download&token=36b95591-74c7-4a2b-ab7a-b0b1b5b65a82
- PHY: https://www.microchip.com/en-us/product/USB3320
- my configuration: https://paste.debian.net/hidden/77078877
- Buildroot defconfig: https://paste.debian.net/hidden/e8b1d0fc
- Linux defconfig: https://paste.debian.net/hidden/d578d0f9

David



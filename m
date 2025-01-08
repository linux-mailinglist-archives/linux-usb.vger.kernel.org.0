Return-Path: <linux-usb+bounces-19127-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAD5A056EC
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 10:31:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1188E166A08
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 09:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0363C1F1309;
	Wed,  8 Jan 2025 09:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Dcnu9tw4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C4F17C20F;
	Wed,  8 Jan 2025 09:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736328672; cv=none; b=Bw11RIDbVr7+VGvIT4xGDpeBwZWVsVdRWkomBqnhG+h5YwDKrmYDe9A22RgsH4qHS9CLv1XZhOIeI3QrKpzmMgdlqUEdMSrDKs6l9rO1PV0jxUU+N9JvRioXM7BpYOaoetBFlQM8KzefcA62L9eqqD5eouI47iTWKbLUkf0wJRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736328672; c=relaxed/simple;
	bh=vPu0EK82iyI1LCHzBpKXRysNZCftwF/hb15/z5xUj8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mCkE/1FsYncHK6CAgEwUsAOrtANu6G8wB/0dRWqOZXmt9GBh+LV8NE7HufPGr9DNAIy0S4+KuQY8iVMpu5Hzp7lnko1lVsD0tfW84FDXToL2GzfdvmCuW6RWG0IO07ATmuaE0KN12emL5MgFj3TuEsCZZiFE/h/uEWjwISpNbQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Dcnu9tw4; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 210361F92F;
	Wed,  8 Jan 2025 10:31:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1736328665;
	bh=FIjZK29zDE3zmOmE1LUi+L4IaZ18jTOW4mbopw2zhhc=; h=From:To:Subject;
	b=Dcnu9tw4arZTywXT7+QUn1i7nEzswkQGKuFFD9TlQr468AeOLNn0glPAZcMSfnksm
	 TyWsS0pBeoxjolXRa0dtJIHh80myolrGGplh1uS+TfsSyijOPpoKkcE6Jus18mTJ35
	 l+R7ym1GoHKYWdQ6YGpaK9R8Yn3Yk6wAhfBX21s9+FSGZLaWG1XzhvIYHO8ngMZ6DB
	 yUUCmIDlB0lC2Zv2hlcNVfTHmG6ztbZHeKXjl5AClB9u5iKPp6Ea//TGy3UM7xu3qK
	 +qemqKGPslKCefr068t0FSmvBSvFyxOLcpxII09KGRzwp+vCVk+3/78k/P1mnki72e
	 f8pRuTWSUUjFA==
Date: Wed, 8 Jan 2025 10:31:01 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: linux-usb@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>,
	Peter Chen <peter.chen@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, ritesh.kumar@toradex.com
Subject: USB EHCI chipidea regression on NXP i.MX7
Message-ID: <20250108093101.GA22448@francesco-nb>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Xu Yang and all,
commit dda4b60ed70b ("usb: ehci: add workaround for chipidea PORTSC.PEC bug")
introduced a regression on NXP i.MX7 SoC.

If the USB port is connected to a USB HUB, and a device is connected at
boot time to such a hub, the following errors are printed and the USB
port is not functional.

[    1.131847] usbhid: USB HID core driver
[    9.471549] ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus number 1
[    9.516311] ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
[    9.516697] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.06
[    9.516728] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    9.527751] hub 1-0:1.0: USB hub found
[    9.827109] usb 1-1: new high-speed USB device number 2 using ci_hdrc
[   10.029600] usb 1-1: New USB device found, idVendor=0424, idProduct=2514, bcdDevice= b.b3
[   10.071198] usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[   10.111575] hub 1-1:1.0: USB hub found
[   10.741225] usb 1-1: USB disconnect, device number 2
[   10.789292] usb usb1-port1: Cannot enable. Maybe the USB cable is bad?
[   10.843210] usb usb1-port1: Cannot enable. Maybe the USB cable is bad?
[   11.361157] usb 1-1: new high-speed USB device number 5 using ci_hdrc
[   11.891163] usb 1-1: new high-speed USB device number 6 using ci_hdrc
[   12.231248] usb usb1-port1: unable to enumerate USB device

The issue was reproduced on a recent v6.6 kernel.

Ritesh, in Cc, did the bisect and debugged this issue, he might be able
to provide more details if needed.

- Any suggestion?
- Can you please specify with SoCs are affected by this frame babble bug?
- How can I reproduce this frame babble bug? Is there an easy way to test it?

Thanks,
Francesco



Return-Path: <linux-usb+bounces-9580-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB72F8AD3D4
	for <lists+linux-usb@lfdr.de>; Mon, 22 Apr 2024 20:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AD081F21B57
	for <lists+linux-usb@lfdr.de>; Mon, 22 Apr 2024 18:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4942B15443D;
	Mon, 22 Apr 2024 18:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ZRAp4i2Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DA1154BEE
	for <linux-usb@vger.kernel.org>; Mon, 22 Apr 2024 18:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713810236; cv=none; b=GCWuIjpY6vEg5m7BGm+7y80uOZGq+zTIZ6BVWsfR4czqHHyRZiVGEac602IE5+C8RPImq3WG053VEsbknRlAyEPxpJxVsnYC8xwnczx+sfJOIueQHw6ghGiG4W6XwVp0TtaaiPoNvocYmq3ljWwh4/8BZJqIAa4i4LziBKwllUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713810236; c=relaxed/simple;
	bh=aRFNHEEr+zIhu12qbEadFx6uElVplmbKrCRCiJMaVTI=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=i5T4xcX6h4mFHTVnPjmYfRuIr5QUwQ3TYpVvxfzPX1lXhQdMz6+HBprGwZIpfzZpd86TnF9je97FAhfsexjNBE/PwuVUUv3ifMLmS7UKayF4BJvKmqEEWDn4p/jF//m1Nylv9F55fZz7XbpHbcz8mPcqytk5lH4n2aK+3GELAbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ZRAp4i2Q; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1713810224; x=1714069424;
	bh=EtANEXxrSCQKtfzI2WB3nZWCCOJEHo5d4ILxQv4OgUI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ZRAp4i2Q7eWo8BfieA+sbzAInPojUBiZPKkVbu6Ec5BI8GsjEyoluQAM3IW13FCGH
	 UWpx1EkvPVLE2rEhaXj8KWAHvDJriocf/SWrcpA4GBb9TujYRxIWX/BFDh8EE8kqlu
	 WH4adJqE/blxhvxHRmnheIgqiCdemWEQ6mqm4qE4fpzuxQ2AVtkHMgLvbgXsVVr/4Z
	 YHw71lmmCQTogvdYz+ikUIK0GL1+ImoZBSgOxBOxPw1meoqv+M/C2Qc2mkr1/+whHe
	 D2ysOdQiQsiTtDZLjahNX21DgsM/jSu3vK8qYjPlp2Xmft8/wpFs8JTo6XWHyb7o5V
	 snyymwNMGYAFw==
Date: Mon, 22 Apr 2024 18:23:33 +0000
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From: Jerri Lipp <JerriLipp@proton.me>
Cc: "johan+linaro@kernel.org" <johan+linaro@kernel.org>
Subject: chasing a throughput issue the cdc_acm driver does NOT have
Message-ID: <H7wSaXg5qDFzZjLSmSYVmFzB6iBG6XDCISeX4sGiZ-UIFSE0uOKPa1EOKYEiogez9xwcnQbYQFumiKFA733_05w9246qL1Hg_PnlARP2wWg=@proton.me>
Feedback-ID: 107732641:user:proton
X-Pm-Message-ID: 1b7a2e3d495bb11c8f516e2284d7c814f5919233
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I'm working on a project that talks to an STM32 MCU via a Full-Speed USB
CDC_ACM link, which binds to the cdc_acm driver. I initially used dd to
measure throughput and all was well. Then I switched to libusb and found th=
at
throughput dropped by 50%. I traced the root cause to a something the cdc_a=
cm
driver does, which my libusb code didn't. But I don't understand why this
makes a difference and was hoping someone on the list would be kind enough =
to
educate me.

In my test, the traffic was just one way: Host->Device. So I did not bother
to intiate any IN transfers. It turns out that even without any IN traffic,
the absence of any outstanding IN transfers drops the OUT throughput by hal=
f.

Wireshark showed me that using dd to send data to the device actually does
result in some IN transfers showing up at the very start of the trace, thou=
gh
never completing.

I think (could be wrong) I traced these IN transfers to their origin in cdc=
-acm.c.
there's a call to acm_submit_read_urb in acm_port_activate():

"""
    retval =3D acm_submit_read_urbs(acm, GFP_KERNEL);
    if (retval)
        goto error_submit_read_urbs;

    usb_autopm_put_interface(acm->control);
"""

which I read as initiating some read urbs as soon as comms start, exactly w=
hat I saw.

I blamed this line back to 2011, when it showed up after an unrelated refac=
tor
in 088c64f81284. Back then, this call to acm_submit_read_urbs()
lived inside acm_tty_open().

I've looked at the "Complete USB" book, the libusb mailing list and google.=
 I could
not find any explanation of why this behavior is needed - why do pending IN=
 transfers=20
have such an effect on throughput when there is zero IN traffic from the de=
vice?

Your wisdom much appreciated,
Jerri


CC @jhovold (author of 088c64f81284, apologies if that's not ok)


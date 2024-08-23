Return-Path: <linux-usb+bounces-13941-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9002A95C7C6
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 10:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C31A11C256B1
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 08:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D52C13D897;
	Fri, 23 Aug 2024 08:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XO/tTk7Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A26B13D881
	for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2024 08:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724400865; cv=none; b=ISKGs8ert3OoycGkjUfo8u1i1yliOgdhu3KMxoEyZ4K9eTiR1FG8XzjSnFKXuOJfv3RlUv2kxi7qlHlQQncOKodS5ty0msU0mW7MwpKiUVdvCegS4UcmIevfl+4NGIMO9lNM5AwLBoZG5FTHZKO4dhFaBSwnuq12M+n3mzG/Qh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724400865; c=relaxed/simple;
	bh=aNGQbm5SByG9KVF1Htse4RIwLHRlnPVM48nAcALiI9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BDR+mebUOA3s0JtY3iRcqvsPQs5XiJL4WHU/rAJ+/y7Cp3k0fOxJkN5c74Y4toI2Y4cQdQxPIhvzlTnuyn2oY4iJA/0WHTgZBdlzU2DsDDsQbo/7wuqfjClIC42cVP/5EC0DzEn3HRXlos5+BJLDHWqi6saMKcWSqKZhEpFnIi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XO/tTk7Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3DF2C4AF0C;
	Fri, 23 Aug 2024 08:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724400865;
	bh=aNGQbm5SByG9KVF1Htse4RIwLHRlnPVM48nAcALiI9I=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=XO/tTk7QNDXq2LpyPbE1cCqQQh+ZCy2xcPfQrNG0vtgSSrNDE57CAhWDk+ReUb73l
	 3oR08exN45jCQH5A7i1T/v1FnnTND0asls1NubsukQB3H7OwZTOINVYvmjKCE+NmHe
	 CIRP1fCLD3DkPFh+JCGQjelW52gPgnAkoj+Sie5w8OEjJGD1yfmVR4b4yMZ4w1dVxf
	 2G0e8TihsGfiM8LboELl6ZND4PJPhADRCYTwoDC4bTSEKCp5t85tHFyhKKzGDbqHcn
	 clzFxJZq/ysjQhPhV7O/ESbHA3clXZnU8IktEam3qJcAHsRPlzLVs8IIHcp5Ab3Dlv
	 9JEpOZd1VxoEQ==
Date: Fri, 23 Aug 2024 10:14:18 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: linux-firmware@kernel.org
Cc: Vinod Koul <vkoul@kernel.org>, linux-usb@vger.kernel.org
Subject: question about Renesas USB3 host controller firmware license
Message-ID: <mbtpgfzqs5fud7pfrqi6wrzxg5eo47iet5sntdclwdzwo7zzhi@wtn4b55gpcp2>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I have a question related to whether it is possible to add a specific
firmware binary to linux-firmware, due to licensing.

the Renesas upd720202 USB 3 host controller requires a firmware binary
that can be downloaded from Renesas website [1].

This latest version of the firmware (2.0.2.6) is from 2013 and is
available on several places online, including Github.

But the license for this firmware [2], displayed when downloading from
Renesas' website, is different from the other Renesas firmware licesne
that already is in the linux-firmware repository [3].

The license [2] says in paragraph 2.1. that:
  grants to you a personal, non-exclusive, non-transferable, recovable
  license ... to distribute binary versions ... only as incorporated
  into Customer Products or Renesas Products

According to the above it should not be possible to add into
linux-firmware, but then we have paragraphs 6.1 and 6.2:

  6.1. ... the Licensed Software shall not be disclosed by you to any
       third party ...

  6.2. Your confidentiality obligations under Section 6.1, above, do not
       extend to information which you can demonstrate: (i) is or
       becomes generally available in the public domain without fault of
       you, ...; (ii) is rightfully obtained by you from a third party
       without restriction as to use and disclosure and without breach
       of any confidentiality ...

If I understand correctly, according to 6.2. (ii). people who for
example bought a product containing the firmware, but weren't asked to
agree to this license, may have already started redistributing it. The
firmware is generally available on the internet for some time now (for
example on Github).

Can someone who understands legal mojo determine whether it is possible
to add this firmware to linux-firmware?

The drivers/usb/host/xhci-pci-renesas.c code is already written to use
this firmware under the name renesas_usb_fw.mem. The code is there for 4
years already.

Marek

[1] https://www.renesas.com/us/en/products/interface/usb-switches-hubs/upd720202-usb-30-host-controller
[2] https://www.renesas.com/us/en/document/oth/disclaimer8?r=1021051
[3] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/LICENCE.r8a779x_usb3


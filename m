Return-Path: <linux-usb+bounces-2932-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DEE7EE558
	for <lists+linux-usb@lfdr.de>; Thu, 16 Nov 2023 17:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C6642811A5
	for <lists+linux-usb@lfdr.de>; Thu, 16 Nov 2023 16:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8AE9358A0;
	Thu, 16 Nov 2023 16:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HkHpT/iT"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FE6AD5C;
	Thu, 16 Nov 2023 08:42:09 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3591DE0004;
	Thu, 16 Nov 2023 16:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700152927; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=tni4t3HeZYOoXCGlFujdXfP+7OQFDAQizL+X5ze6x40=;
	b=HkHpT/iTLoAUN7BorvxDQXf6ahzJQV3JohuuCIAYJp/cbEixyWqStUBH9o8PAaDcmspi4k
	THSHmZdHg8uDYWpYXGaq9Qly/28HStoUTaZogZzHKcR4M/hYR+BABa3I8goExOv3sGBrFj
	7kX2VBEsryqZC/IwPkEMNSW9JXffVWJSzGj1eQthWx0xtoDul3HKpgjY9Kxj7YYIFXTHXU
	8BXMCtza/49BSGi/9j1YyeFgEhrsAXplntVbctbv/iB+iT2ebG3zxek40Ez2MBoDtfziS3
	TienzVLHYwBWHxxPK7hwArRAUl2a0W9DopqqiMu11uOs8mUTEM8TUNVRI37sMA==
Date: Thu, 16 Nov 2023 17:42:06 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Jisheng Zhang <jszhang@kernel.org>, Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Lu jicong <jiconglu58@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] usb: dwc3: don't reset device side if dwc3 was
 configured as host-only
Message-ID: <20231116174206.1a823aa3@kmaincent-XPS-13-7390>
Reply-To: <20230930074334.1406464-1-jiconglu58@gmail.com>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: kory.maincent@bootlin.com

Hello,

Similar issue with ZynqMP board related to that patch:

xilinx-psgtr fd400000.phy: lane 3 (type 1, protocol 3): PLL lock timeout
phy phy-fd400000.phy.3: phy poweron failed --> -110
dwc3 fe300000.usb: error -ETIMEDOUT: failed to initialize core

With CONFIG_USB_DWC3_DUAL_ROLE and dr_mode =3D "host";

It may not be the correct fix.

--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


Return-Path: <linux-usb+bounces-3532-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 278BB800697
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 10:10:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBB28281983
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 09:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFAD91CAB0;
	Fri,  1 Dec 2023 09:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bkDAD8t0"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA11B10A;
	Fri,  1 Dec 2023 01:09:56 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F82460002;
	Fri,  1 Dec 2023 09:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701421795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L+NKVfOz2Fgbsio6zc8cuhstHjWh59AQsU5LZmUWwnQ=;
	b=bkDAD8t0tE7udB5z5ZdGmW2o/mcENfEYh8t8Tv75sXtRonnh4mvpgu0dsigbZ1B6tB9feX
	dUOJ9u0Ejc1vYVA4jDKFkY6lJ7ZGj0OKbz/YlzchVee3u6xuZ4JNvyruId2hiwgui9xdNi
	Q7aoJCGI7K5GmO1q3mWRKJPKX1n57lHGh7uev6Q+rl1wYWSFTddJ8WRX0OxxkCdkJpgxhc
	XTwDIp9i1+YvPJrdAEV5P+Hn4w0ukjSPkGxjm1ZjgQJWgvPkBjDW1I2p4tyuO7EcdILuB3
	yFVL1wB2+l4Tjs32qOs/0o8Pb0W/V+evoChEWjXhTkfocdcx+/7Y7C8HAkXdkQ==
Date: Fri, 1 Dec 2023 10:09:54 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Lu jicong <jiconglu58@gmail.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] usb: dwc3: don't reset device side if dwc3 was
 configured as host-only
Message-ID: <20231201100954.597bb6de@kmaincent-XPS-13-7390>
In-Reply-To: <20231121104917.0fd67952@kmaincent-XPS-13-7390>
References: <20231116174206.1a823aa3@kmaincent-XPS-13-7390>
	<20231116175959.71f5d060@kmaincent-XPS-13-7390>
	<20231117014038.kbcfnpiefferqomk@synopsys.com>
	<20231117015527.jqoh6i3n4ywg7qui@synopsys.com>
	<20231121104917.0fd67952@kmaincent-XPS-13-7390>
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

On Tue, 21 Nov 2023 10:49:17 +0100
K=C3=B6ry Maincent <kory.maincent@bootlin.com> wrote:

> Hello Thinh,
>=20
> On Fri, 17 Nov 2023 01:55:30 +0000
> Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:

> Still not working on my side.

Hello,

Just wondering if you have received my email as you said having client mail
issue.

regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


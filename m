Return-Path: <linux-usb+bounces-2867-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 434507EAE9E
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 12:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF094281134
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 11:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E37F224D4;
	Tue, 14 Nov 2023 11:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bbntZNgU"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1665E19BAB;
	Tue, 14 Nov 2023 11:10:23 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02CE8187;
	Tue, 14 Nov 2023 03:10:21 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EEDEE1C0005;
	Tue, 14 Nov 2023 11:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699960220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UZk2NG7LMF4weSGGvdqw6ZXKkgHMu8ga7kKv8OtqZLM=;
	b=bbntZNgUvrYTXujYXIPpbH9Qpd8qEzus+iOoYJzgOWMbiWXsGHdPzV8d+fWi2Z69Eu6i8s
	/iFV+vezys8YOQWFpGwTvq0RmuNmugyYopXkVhJXCs2y4+it7g9d4SWVFR397LSmA6zY3g
	ci45ynp9fRVauFc6nzm8QK9JVcYX7u2YdKooNCjo8sDI0iQCoafndVNT5rwPQUNYrpmaar
	CNDKcUdfumwvgDLBfIUkhm6Q+2PXSBER5rYWZlVyhvEBzO67xHwBWtQSOTA86keHYnS6V3
	+amL+d1/HM9Q4J9u5HasCznEUScCm9F0srD7h/iYzaz7nsOUzOV7uazUHHtlkg==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Nov 2023 12:10:18 +0100
Message-Id: <CWYHLRBFE1X1.15330WETL2R7U@tleb-bootlin-xps13-01>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 4/6] usb: cdns3: support power-off of controller when in
 host role
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Roger Quadros" <rogerq@kernel.org>, "Pawel Laszczak" <pawell@cadence.com>,
 "Nishanth Menon" <nm@ti.com>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Tero Kristo" <kristo@kernel.org>, <linux-usb@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
To: "Peter Chen" <peter.chen@kernel.org>
X-Mailer: aerc 0.15.2
References: <20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com>
 <20231113-j7200-usb-suspend-v1-4-ad1ee714835c@bootlin.com>
 <20231114083838.GC64573@nchen-desktop>
In-Reply-To: <20231114083838.GC64573@nchen-desktop>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Tue Nov 14, 2023 at 9:38 AM CET, Peter Chen wrote:
> On 23-11-13 15:26:59, Th=C3=A9o Lebrun wrote:
> > The controller is not being reconfigured at resume. Change resume to
> > redo hardware config if quirk CDNS3_RESET_ON_RESUME is active.
>
> Current logic has power off judgement, see cdns3_controller_resume for
> detail.

Indeed! Thanks for the pointer. I had not noticed that, those patches
come from an older kernel which didn't have it. That'll make for less
changes; patches 4 & 5 can go away.

> > +	if (cdns->pdata && cdns->pdata->quirks & CDNS3_RESET_ON_RESUME)
> > +		cdns->xhci_plat_data->quirks |=3D XHCI_RESET_ON_RESUME | XHCI_SUSPEN=
D_RESUME_CLKS;
> > +
>
> If you set this flag, how could you support the USB remote wakeup
> request? In that case, the USB bus does not expect re-enumeration.

We didn't support remote USB wakeup. Only S2R mattered in our case and
USB remote wakeup wasn't a possibility.

> > +static int cdns_host_resume(struct cdns *cdns, bool hibernated)
> > +{
> > +	return cdns_drd_host_on(cdns);
>
> This one will redo if controller's power is off, please consider both
> on and power situation.

Clearly. Can see that at runtime.

Thanks for the review!

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


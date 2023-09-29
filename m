Return-Path: <linux-usb+bounces-772-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B507B33C4
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 15:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 5F0251C20B48
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 13:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F3D1C688;
	Fri, 29 Sep 2023 13:38:00 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55372154AE;
	Fri, 29 Sep 2023 13:37:58 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 360CFDB;
	Fri, 29 Sep 2023 06:37:56 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6D1D2000E;
	Fri, 29 Sep 2023 13:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695994674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0omUdsyWTKIT8z37/TUf1W2KPzUVttYv5GHq4MLW7Hk=;
	b=NqFkjUnFEWqRKoaUAYwyH+pNYNvBfQooTkZRXFxzHZpz4iSMwUstuVYc2lMq4Y4FLqBADn
	Ud/x2576Ds756gbqgoQl6ZlzNfvlgSyvSFGFO4v40UEYd65d4c7q6ywo5CsDh0ZS+bIIT8
	FZH8nhyyJ9b0kchaTHAcmbiX0jEFuKMGLjPIC2LvGaFM+tfyWHi2OwSar6vGm3zSLSlBEt
	YiXliQKKUxinIYsPN31VhGy3xfzGxS+uSO5DI2C8O+gfxznSCuzth/d8+/gCXlGGcWq+bD
	exOek4IT1pu0wSwNiQs14Pp+JwKM9pTgtUOV23ZPyd85w20vYkjnWCaINqFuig==
Date: Fri, 29 Sep 2023 15:37:48 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Jun Li <jun.li@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	robh+dt@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org,
	Krzysztof@web.codeaurora.org,
	"Kozlowski <krzysztof.kozlowski"@linaro.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [EXT] Re: [PATCH v2 2/3] usb: chipidea: imx: support disabling
 runtime-pm
Message-ID: <20230929153748.63620770@booty>
In-Reply-To: <DB7PR04MB450517AD9F25F47320835A5B8C03A@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230504162312.1506763-1-luca.ceresoli@bootlin.com>
	<PA4PR04MB96405EE2468555EA900B340189739@PA4PR04MB9640.eurprd04.prod.outlook.com>
	<ZFjaNzY32x8o2XG7@francesco-nb.int.toradex.com>
	<20230508151756.785ec07e@booty>
	<20230529121825.71e9b6d6@booty>
	<PA4PR04MB96405138465D215C34285F02894B9@PA4PR04MB9640.eurprd04.prod.outlook.com>
	<ZKaWL3+ClI7iNr/4@francesco-nb.int.toradex.com>
	<20230717184537.6d6ed607@booty>
	<DB7PR04MB450573F8EA936E049F053A258C38A@DB7PR04MB4505.eurprd04.prod.outlook.com>
	<20230718142504.075d0186@booty>
	<DB7PR04MB4505560E7DCBC2523FD7A0FE8C39A@DB7PR04MB4505.eurprd04.prod.outlook.com>
	<20230719184831.75ae8658@booty>
	<DB7PR04MB45050B15EDA7A2A3940840308C3EA@DB7PR04MB4505.eurprd04.prod.outlook.com>
	<20230720144916.01d49adb@booty>
	<DB7PR04MB4505F28957A32F09BB84B27A8C3FA@DB7PR04MB4505.eurprd04.prod.outlook.com>
	<20230721232750.0aea6e0f@booty>
	<DB7PR04MB450517AD9F25F47320835A5B8C03A@DB7PR04MB4505.eurprd04.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hello Xu,

On Tue, 25 Jul 2023 12:23:43 +0000
Xu Yang <xu.yang_2@nxp.com> wrote:
...
> > I tested again now with the 3 patches applied and found that with
> > CONFIG_USB_OTG=y it works, and detects a device when plugged. Good!
> > 
> > However with CONFIG_USB_OTG disabled it is still not working. In this
> > case obviously mxs_phy_is_otg_host() returns always false, even though
> > las_event is 2 (USB_EVENT_ID). This is what I get during boot with no
> > device connected:  
> 
> Yes, I may need to remove CONFIG_USB_OTG condifion. Will handle this later.

Did you manage to make progress with this work? It looked like very
close to be fixed in the proper way with your latest patch iteration.

I'd definitely happy to test new patches as soon as you have any.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


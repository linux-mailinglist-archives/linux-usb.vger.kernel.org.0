Return-Path: <linux-usb+bounces-2869-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4217EAEA7
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 12:13:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CE60B20B5B
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 11:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD7B23741;
	Tue, 14 Nov 2023 11:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Tklh3XJC"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85AB224C7;
	Tue, 14 Nov 2023 11:13:30 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7193DD9;
	Tue, 14 Nov 2023 03:13:29 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6601EC0003;
	Tue, 14 Nov 2023 11:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699960408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/R9B48pZCN9c3ng90NhzhrOB0SxCjUhVVsxdxdwVKGU=;
	b=Tklh3XJCMrk+4MzU9ju3l+yLDIVz5pQuci3HN85cZoosD3azWS6w4TrPc0Cxnc0l18TQkc
	Sy4YHLNQ6LbKuDszmwp+ovxh3W3EsnXQiKi0bfbodgqafoBRIqLaCE+WWRTNi4BKxFmN/o
	puKZbP9v3EXcwLuvtjB0bsfRuWtDa+18jNJof0pHnt8aHVhUXC49PQNLTT+bSBDxAuEeyJ
	elvRmL3CvuE3LJuuWJyIAtuyf6/OAFMPh4rpeMi4JaFY8RznWZ1011eRBKqIhrJjXNtyRY
	jnBbSc3kGviOlJt4PEWIncyw9ELGCkoqtw4yRFO1G9dlqm4P2JQh0HxH1UDenQ==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Nov 2023 12:13:26 +0100
Message-Id: <CWYHO5EGLYQ8.19W6XQHV61VEL@tleb-bootlin-xps13-01>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 3/6] usb: cdns3-ti: add suspend/resume procedures for
 J7200
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
To: "Gregory CLEMENT" <gregory.clement@bootlin.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Roger Quadros" <rogerq@kernel.org>, "Peter Chen"
 <peter.chen@kernel.org>, "Pawel Laszczak" <pawell@cadence.com>, "Nishanth
 Menon" <nm@ti.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo"
 <kristo@kernel.org>
X-Mailer: aerc 0.15.2
References: <20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com>
 <20231113-j7200-usb-suspend-v1-3-ad1ee714835c@bootlin.com>
 <87zfzh64t6.fsf@BL-laptop>
In-Reply-To: <87zfzh64t6.fsf@BL-laptop>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Mon Nov 13, 2023 at 4:39 PM CET, Gregory CLEMENT wrote:
> > diff --git a/drivers/usb/cdns3/cdns3-ti.c b/drivers/usb/cdns3/cdns3-ti.=
c
> > index c331bcd2faeb..50b38c4b9c87 100644
> > --- a/drivers/usb/cdns3/cdns3-ti.c
> > +++ b/drivers/usb/cdns3/cdns3-ti.c
> > @@ -197,6 +197,50 @@ static int cdns_ti_probe(struct platform_device *p=
dev)
> >  	return error;
> >  }
> > =20
> > +#ifdef CONFIG_PM
> > +
> > +static int cdns_ti_suspend(struct device *dev)
> > +{
> > +	struct cdns_ti *data =3D dev_get_drvdata(dev);
> > +
> > +	if (!of_device_is_compatible(dev_of_node(dev), "ti,j7200-usb"))
> > +		return 0;
>
> Just a small remark:
>
> What about adding a boolean in the cdns_ti struct for taking care of
> it ? Then you will go through the device tree only during probe. Moreover
> if this behaviour is needed for more compatible we can just add them in
> the probe too.

Will do. The hardest part will be to pick a good name.

> Besides this you still can add my
>
> Reviewed-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks for the review.

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


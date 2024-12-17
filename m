Return-Path: <linux-usb+bounces-18585-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 461769F4924
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 11:45:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC5C67A05FA
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 10:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592B71EB9FF;
	Tue, 17 Dec 2024 10:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l8Gd+gct"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075681E5726
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 10:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734432315; cv=none; b=qR4rKBuBmurfxyloG88OXralVLTrzQ4FQr7pS4Ret9dDGELZsgUtQDuwwVpJkfXyaPpVDCBhNTPcioss0s7gyjl1L74NsJDql+t3dBD70s3hEKmr1GL5Vy3ufVKkeqB23+Mh50kE3d4NZZ1E8N4cBglQFCBwXI1d74R7hoAvQAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734432315; c=relaxed/simple;
	bh=DoiNDXeSYmuPiZtQYI5FjMp6WgqD6Jy3rx/jNzYzoH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qhek62/inSbNdp/81DtC6dIV2hUuEFo8VL0BxvVRhDoWYDGgsADRQ/I3YzWF661RkO2sJDl4e7bAfYyNbvCQnHjBstqrFu6SrPkUnjlAPH2zncarDbdSgkZyOENHod3mBwIOkAlEPAAtMtvGwfWkQNt7x0jLrwG3v1MesXJCi+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l8Gd+gct; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa69077b93fso766212266b.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 02:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734432312; x=1735037112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mcRctnbApoihRzPdFWaVbg0Lu0K88Zf+TpJvmNIby8Y=;
        b=l8Gd+gctYHSM4Eji+WbZnco+vBlQrT2RMJaTKr8pUHPtsPDO6y5p9HsFmkxmA9k8Fl
         qNQZoJ5nDOqjBRStyilHA8XglLC8mPnPk4eXnOEuK4hzy+CyxBCGL6avGN285DwGsmMF
         UlsmioI2iEs4m6tvuO5diVROC5hcoMTv5f4BBHeyqpRdIXDLx6oGsiMkPFqfvMH32XmY
         gB44ed76cRKilD63QzTUV30/O/FWmiZAseOM8PIGLXnw6hASDUDkiciL1Evah2J8fpKU
         jwYs6SKShrcT37w8IHqxJM8sxX2Id9BrKIdZrenK3yl+Cog8Y8YigrOYHE8aHTxwOqhU
         ve0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734432312; x=1735037112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcRctnbApoihRzPdFWaVbg0Lu0K88Zf+TpJvmNIby8Y=;
        b=JWCo9imoJBtvoI2rGLRatXcGtw7LpsiN4IlU7dSa+MzkBTNIvN/cnGXwEhrcx4BARd
         PFQywtCRWZJBRxc6yLwavattguhMiTw7EboFJn8DvwkK5qXSejL8ufCSYc+yO50m8IBd
         EgJJOTIbREO2IXp2h0iGi8V8ujDUApQEte6cIOzHyDbvYbbvdPewSikNBM8o4r1kPzoq
         dN1j9wambm+04QGUeUbLmtsxbuKMZ3V4DusDVrbQppj7CNdUJKfESlSSrz8ujLXKKBpH
         UZJpwPXbBEDUA18da6bsY/itkE4Kbc1pDKjFA47PuK2+JDupz5+imqjsF9jx5mNQC5vd
         /ldA==
X-Forwarded-Encrypted: i=1; AJvYcCXm7JAnyJ9fM+oUr4NBvrrrxpoVhOGr/VBV5cdJcd5KU1JCwf1Lv1iSPjrn7+JaoejoMJ4T8rakZro=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIq+/BwlBELHLZ55ITfYNu8FRcIg1lGnSc3GyyRF3nR11cl702
	uhpwxIatY2xIiWDqFdVmSh82F8eBr4gLkHDjcF5h3NF4U8gEjR7nbd364JiS6yY=
X-Gm-Gg: ASbGncvxotXxdwHNDR5XUm8Sn1dESfFl++MehB3nMsOr8VFiKrc6UV/QMNSDyleI0Dk
	Sekulh8qR96RUSSosnyVqZg4Wcg+AYaEIBpQXqi8MQzcxPl0cvh0eEp2qGEfjVASMajMwKOv2in
	xjBKKC7HjG9sxZTNuINtla6zUaii+XmH9mphw1NSb/vtuSxfJRM+yr+tiCas/bN2+TPuRE9jtp0
	ouuDCRHyQx6SHBEoVdxzZsj9s/PWKflKMDG3XBDDFf0zTlsid8ZZ6IxImrExQ==
X-Google-Smtp-Source: AGHT+IE33WJtppU7GWo4C9n0KIsjxGKWo9PfZfBga/d9h0pMjOZyyKuoihkIkBrSXWmOKYr+32gMhg==
X-Received: by 2002:a17:907:7d90:b0:aa6:7d82:5414 with SMTP id a640c23a62f3a-aab779b04edmr1665157266b.30.1734432312202;
        Tue, 17 Dec 2024 02:45:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab963b267dsm427913866b.179.2024.12.17.02.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 02:45:11 -0800 (PST)
Date: Tue, 17 Dec 2024 13:45:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	andre.draszik@linaro.org, rdbabiera@google.com,
	m.felsch@pengutronix.de, emanuele.ghidoli@toradex.com,
	parth.pancholi@toradex.com, francesco.dolcini@toradex.com,
	u.kleine-koenig@baylibre.com, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 2/2] usb: typec: tcpci: set ALERT_MASK register after
 devm_request_threaded_irq()
Message-ID: <0e46eee3-332e-4fbf-b6a8-9e645750ecea@stanley.mountain>
References: <20241217091208.2416971-1-xu.yang_2@nxp.com>
 <20241217091208.2416971-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217091208.2416971-2-xu.yang_2@nxp.com>

On Tue, Dec 17, 2024 at 05:12:08PM +0800, Xu Yang wrote:
> With edge irq support, the ALERT event may be missed currently. The reason
> is that ALERT_MASK register is written before devm_request_threaded_irq().
> If ALERT event happens in this time gap, it will be missed and ALERT line
> will not recover to high level. However, we don't meet this issue with
> level irq. To avoid the issue, this will set ALERT_MASK register after
> devm_request_threaded_irq() return.
> 
> Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")

I agree with Francesco that this was introduced by patch 1 so the
patches need to be folded together into one patch.  The commit
message would be something like:

    The ordering of setting up the IRQs is not correct here.
    We need to call tcpci_register_port() devm_request_threaded_irq().
    Otherwise if we recieve an IRQ before tcpci_register_port() has
    completed it leads to a NULL dereference in tcpci_irq() because
    tcpci->regmap and other pointers are NULL.

    However, moving tcpci_register_port() earlier creates a problem
    of its own because there is a potential that tcpci_init() will be
    called before devm_request_threaded_irq().  The tcpci_init()
    writes the ALERT_MASK to the hardware to tell it to start
    generating interrupts but we're not ready to deal with them yet.

    Move the ALERT_MASK stuff until after the call to
    devm_request_threaded_irq() has finished.

Something like that.

regards,
dan carpenter



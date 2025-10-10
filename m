Return-Path: <linux-usb+bounces-29112-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CACBCC53F
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 11:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A80F8404896
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 09:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC60D28153A;
	Fri, 10 Oct 2025 09:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPZbPIPx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E147E277037
	for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 09:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760087752; cv=none; b=PZr+XM75NZGPE8QxVNiD9piDBQsdPGbhmA1lKAW0sv2ubShM74f/0DDidvl4GokhEB1h2TG3yThJ7GBOMBAbbZ9tbiKeqPiYwi6Alw5Dd5meAc0vhNyt7Bfn9gjbFlcEkrYAX0ZUcjxNEBrcQGIFSnTbk3BYbficdRqm0d6nO5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760087752; c=relaxed/simple;
	bh=3V1GT6HyCfVAzf6UNmjb6RIU/RQP8szx5cPwRQyaiE8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=BTsUjYs8gXU6P2F0qreS28PdXMgoBAp06aUalB2E8tNTZzH+XIF4IvsmJ+qmRQwJ5kGwG0mXKgQA0931gNiqgDEczy4ycbN8N8kjrj1MTBaCqmzG+063BQ+Np4ct0VJdUWMe695xu/elGoqLvo3rdWZUBephOgYoKAZ+8lfKAsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPZbPIPx; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b3d5088259eso257025166b.1
        for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 02:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760087749; x=1760692549; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3V1GT6HyCfVAzf6UNmjb6RIU/RQP8szx5cPwRQyaiE8=;
        b=WPZbPIPxH1lGZ2HCQQf9JIbOl4Yf/JpQXSGdRvatm2oBUghC376U+bOmg5aRHshVsW
         vmwQ+2EcBzMGRf7//tDqctK2B7KX3cAq9IDB+1spR0XzalXIPDEgiZBuhjrtMggwNE5f
         Vln+OvRJsdj0oeswt2vi+Cx1EKl4mjw5ZF1DLDqjg9wwk6hxaGINcrylkSGYKP0lufyv
         lMn7HUk0gf4YctMFIeBdwu0ugdwvOFPpU8l9UnLhoLFpd92/UiP+hxvFIk3q+4CdFGPa
         xiNaYMti/2KcjATxnZnUf5mWmOfPMpwKN4DlSQp3l+vxTz+7ekPLPSxajgNcJpASsYcE
         X7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760087749; x=1760692549;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3V1GT6HyCfVAzf6UNmjb6RIU/RQP8szx5cPwRQyaiE8=;
        b=j/U9rmRckl/IFjSYBnOjqcpenEaVO1shFkp0uBzrhneSsepv2uU+V/Ql8XCM0jvmc1
         prWqzbD6/WPJDuxAjlGm6gDIscyuIc88ufSl4NW/medsmKGJ4dNBguJRF5yAn7jooMfR
         HAeRCdYmBYPT/ZZqA7lQP41TLzyIjUlFJL8nvxqi2k5EuSF6GKL8jG5mtucyUO+YXPPa
         6+atsjqmui37Exrhh+7LpffTNWYBVrfyn9M3xcnyl8w0JrlqH+uvIuyK9e7NIKzPOgVo
         T1lF0fEb4WGEq+IRs8N8Z+UBaO/AA1hZTne6lUs/WHaUcpV1zQI1Ms7goBgqGgd6yhxP
         3Yag==
X-Forwarded-Encrypted: i=1; AJvYcCVdOBRsZfOkgMkL1LTDCazoz9CoUFy0BACkxY0mwL5QWOT5VIoVjv5TKUIFKq3CW88o6t8ldnEx2Lc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFsMHx0ayhJjwcRzMfrVdTke2PxuIg209Wyhkumhc9zYbV5yxy
	yYtmJLshm+tUk528SsVROb7d1ETKwZOhrjxymCafjRkb0AMtPPNMyJNx
X-Gm-Gg: ASbGncvavG7Z1296Id1El5w+nFqHLEMQZcBcfaqo6Y83rCeY2Rjj+7NAXWdVvF50g5I
	FKi1ykiMG/xEAvktKMKA6kRYV895lzyNGqDV224RCNEiEIHw60zLRItBfX4V1+DfBM8LjJtCMDL
	sIkALwiQMOW8oVwEWCRM5oFxOLgO75DJAXKMSDYKqv2vJ/LSzB6PpNc1U6RqWNjrOQIq7WztVul
	tqiIB9skNbdN/2cPAFEHgk3kTCJuQBCoCxofjAHBkXGYkiHEflQ23UEeI7qPXp2LOLmeBaZzXro
	qMdGm96MgDsHyClCkHF2G/KcnMnLGvETq4QTmyefupGRXM+JYdvtiliLXP+zWitYeu802kpFlhQ
	aE8ZdXVjPpFb38Y9I/rN6MSO3YxCdD7nU68p93wFNTNKuu+alrbIJWmc5NaMyqvAUHO/vlw4k0h
	QUTXyxxAE/t42o1Mu00WGsQ8Q=
X-Google-Smtp-Source: AGHT+IGWQFNdHpuCNBUeiUNxPRG6gP9B1LAj+/qRnDzEfFPA7WgmtjSYYnA19Y9QTFoVh8fDL8lwOw==
X-Received: by 2002:a17:907:1b1f:b0:b3f:fcc7:6ed8 with SMTP id a640c23a62f3a-b50aae98249mr1081604166b.29.1760087749039;
        Fri, 10 Oct 2025 02:15:49 -0700 (PDT)
Received: from localhost (91-139-16-234.customers.tmcz.cz. [91.139.16.234])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c12b62sm184019466b.48.2025.10.10.02.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 02:15:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Oct 2025 11:15:47 +0200
Message-Id: <DDEJ18VY6I4W.1CDEOV6MAH04A@gmail.com>
From: "Arisa Snowbell" <arisa.snowbell@gmail.com>
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>, "Michal Pecio"
 <michal.pecio@gmail.com>
Cc: "Arisa Snowbell" <arisa.snowbell@gmail.com>,
 <linux-usb@vger.kernel.org>, <regressions@lists.linux.dev>, "Niklas
 Neronin" <niklas.neronin@linux.intel.com>
Subject: Re: [REGRESSION] [REPRO] USB-A devices not working on boot after
 recent USB merge
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com> <20251007231709.6c16802e.michal.pecio@gmail.com> <CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com> <CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com> <20251008082055.5646dadc.michal.pecio@gmail.com> <CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com> <20251008130532.49922d58.michal.pecio@gmail.com> <CABpa4MAsvK68CyQ7bVdie1j2m2O2YAEuFJHq8D-65uFT3FzKzQ@mail.gmail.com> <20251008223406.13f16f19.michal.pecio@gmail.com> <CABpa4MBGW=OJi+j34TbL2g=zyTg7-rxqpHYfAW-1DXTPk=g5Fw@mail.gmail.com> <CABpa4MBDvgJcgJf3_E7k1dBXs7v1tW-79dmc_sQDVM1bES5YDQ@mail.gmail.com> <20251009131444.2c221922.michal.pecio@gmail.com> <90c03eeb-3913-4968-88c0-0de09023a2b5@linux.intel.com> <20251009152703.72e780b4.michal.pecio@gmail.com> <b8c2423f-aa9d-442a-ae2f-3c4d78949b38@linux.intel.com>
In-Reply-To: <b8c2423f-aa9d-442a-ae2f-3c4d78949b38@linux.intel.com>

I am fine with testing another patch.


- Arisa


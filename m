Return-Path: <linux-usb+bounces-29226-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AD8BD34A8
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 15:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3D14B34C7D2
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 13:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DDA02264BB;
	Mon, 13 Oct 2025 13:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h39NtSnC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A5D22332E
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 13:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760363555; cv=none; b=ZHoiBr5k/YuW7A4V3CdD91CqJhjfWW0fX19uu6sw937+mhVlD5JnlX4/9LGPeXFV/VDbW8imEQNyRBG+AC6fQePkbJ+HXqM8RcRQpmTZpXUbaLctZp2peOSNngoGkMl3ud/vtxGvXjKoKHfEjqPxe9/Ny+Dnl0wsESlYwfu79wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760363555; c=relaxed/simple;
	bh=Z9lQqraCfSs8f8OJtdgQ5fBDCz5Q96ENSKPydfYdvks=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=GIaP/z6nMEqrOsUXhpoKhLJihAQ+JRkS8wbY0bpgsXK4mBoh7hxFE09zr+sVVtvf82wMLMxR7r2xgn18eaNLOztEcJ/AQCsXy5SpEyzJS1fLk+IClJIVsjSYGJPDLj6aofmdeRMaHIFs9YEfvxUP4N8KgqRT/USFXGUtTrY0jos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h39NtSnC; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3d50882cc2so787994766b.2
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 06:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760363552; x=1760968352; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9lQqraCfSs8f8OJtdgQ5fBDCz5Q96ENSKPydfYdvks=;
        b=h39NtSnCIHcKhLnTNTu2cT3yrr97juhiZwORtEKKNO1jxZq8y3aV1s8Pa9TdTpI9xe
         fOlTKpDSGvCpodvFmYdyge2mo4U1Ba/XCWErTj23tNzXCDc8GHKqTTCq5mos4Ggj0jTL
         Aogdw5vBG0hKgBbgO4WC9TO8CRd+Kw4zS0HkdhRxN33dsVXGaDgZ0tFCNzBLDL6y/f+E
         /AxHJyLf0h3u/HWqaO12iBT54tGBLIyb3zP/Kkbe0LG32VfTiOOHnclii82LDrm8pE4j
         /QU2bFkbdQBjLnVOMaNV2B97VmGClSdKxIW2FnYcREniv4FoAth2ORh+64zjx0rqjZJ4
         LsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760363552; x=1760968352;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z9lQqraCfSs8f8OJtdgQ5fBDCz5Q96ENSKPydfYdvks=;
        b=pm9sG+JZhsP2cGpW8Uy5BnRXJvL4oJgrepWa/PzhSIaozkgi4SQ6oOiRsfcLXxEVh2
         jrEQDAQNM5nqb5TzwypHL5wi19/pY6iEqMArhcU1ncsHzw+CEcG6hkWnP4bI7LC3595s
         j1V7sNw5Jt6vEKm/u9Qd7AwSKw+fYcaGN3ES5VPRBqoqzhp1Qd6tUNHCHK2D36d6JX4F
         9HcrwpXlhX6bloQfx9Vlp/qnpauaFiIdcrnQOFJxLhvYzbcpEW+IoRDprEk10EazNtUE
         zCkWnzB9xAn0kw3JCfAetY2wQgPP2UlSChUvDfSI515QTrN8uHtGW97DTrWpWq0q3Gnv
         GCbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDAtBCKKi+n7EOoLibT3YVMn/dqC3NHLfixnA+9FFZe3sAJXnQH7X2YyG3LXVPhq+5kqVAchi6BEI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzecm6IGkr9njDnUCfzbkFjHivaSJAIQZFWwC1pYhvY6XOfJlf4
	D8sTkKLYlQ8LC9eyyr4h1WpIrjE+7ixljHvl198CYdif1uirKkqZfljy
X-Gm-Gg: ASbGncs3t7vY6yRTHNzwKp+aAjRwCXN1hwd8a+4fZZmMM4+bEHjG88pKvBDFd9/zdfV
	T3GEH4HocNAEWk4mRaQPAoug+/JpLEKGYiAO1jItXaLN3xeAGJIi4mzDFSRDxoSTiCgCBGgDx9u
	YKJEZd1w3Bgyu0GYeLsjMphZKCc1iMC43UvJcLqUmEcGYzWn49voIoe597Rrnudv92Aqz1J1JIb
	GLxAtPkxlctYIvdEo5vj2jnfQKEkxNnA96F8VhydslitM+/6yN0t4cPSOgeY3DdV8FHaWq398Bq
	Nwu0JHx4W99YTa6lUn7H2VUcqeiZLcc55CZwDo2GkHPO+jV0AJNF45pD17l4ctT/gYGbVkqj/lY
	E94/sDJBMgHSmkB70d5JqzKZF56EOke+GQno6Qu8Uj6WfBPqAzmqw8Hg4NL9vuCc08fU/BN7+V5
	3Jm0z72lAj/fvV
X-Google-Smtp-Source: AGHT+IEVC8MF7la4ICpCPkAJKhW4v9pLS7PHTEzNZOLI9i2D6vp8ilomZ3/m59BW+gshkxQ8RY9Hpg==
X-Received: by 2002:a17:907:3d91:b0:b3f:cc6d:e0a8 with SMTP id a640c23a62f3a-b50aa99e1d2mr2514892366b.17.1760363552264;
        Mon, 13 Oct 2025 06:52:32 -0700 (PDT)
Received: from localhost (91-139-16-234.customers.tmcz.cz. [91.139.16.234])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c12cecsm946177866b.53.2025.10.13.06.52.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 06:52:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Oct 2025 15:52:31 +0200
Message-Id: <DDH8SR59EOOP.1MZ5EJ6PQWFU6@gmail.com>
Cc: "Arisa Snowbell" <arisa.snowbell@gmail.com>,
 <linux-usb@vger.kernel.org>, <regressions@lists.linux.dev>, "Niklas
 Neronin" <niklas.neronin@linux.intel.com>, "Michal Kubecek"
 <mkubecek@suse.cz>
Subject: Re: [PATCH v2 RFT] usb: xhci-pci: Fix USB2-only root hub
 registration
From: "Arisa Snowbell" <arisa.snowbell@gmail.com>
To: "Michal Pecio" <michal.pecio@gmail.com>, "Mathias Nyman"
 <mathias.nyman@linux.intel.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com> <CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com> <CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com> <20251008082055.5646dadc.michal.pecio@gmail.com> <CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com> <20251008130532.49922d58.michal.pecio@gmail.com> <CABpa4MAsvK68CyQ7bVdie1j2m2O2YAEuFJHq8D-65uFT3FzKzQ@mail.gmail.com> <20251008223406.13f16f19.michal.pecio@gmail.com> <CABpa4MBGW=OJi+j34TbL2g=zyTg7-rxqpHYfAW-1DXTPk=g5Fw@mail.gmail.com> <CABpa4MBDvgJcgJf3_E7k1dBXs7v1tW-79dmc_sQDVM1bES5YDQ@mail.gmail.com> <20251009131444.2c221922.michal.pecio@gmail.com> <90c03eeb-3913-4968-88c0-0de09023a2b5@linux.intel.com> <20251009152703.72e780b4.michal.pecio@gmail.com> <b8c2423f-aa9d-442a-ae2f-3c4d78949b38@linux.intel.com> <20251013092250.699bf60f.michal.pecio@gmail.com> <21741b98-4844-4218-8bd9-10b8bf5cd869@linux.intel.com>
 <20251013100424.42d5b9d2.michal.pecio@gmail.com>
In-Reply-To: <20251013100424.42d5b9d2.michal.pecio@gmail.com>

Testing probably wasn't required but I am running this patch right now
and it also works.


- Arisa


Return-Path: <linux-usb+bounces-29087-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE3CBC91DD
	for <lists+linux-usb@lfdr.de>; Thu, 09 Oct 2025 14:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DBCF1A61B46
	for <lists+linux-usb@lfdr.de>; Thu,  9 Oct 2025 12:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC082494D8;
	Thu,  9 Oct 2025 12:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QnjVCpRQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0644BA3F
	for <linux-usb@vger.kernel.org>; Thu,  9 Oct 2025 12:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760014192; cv=none; b=JjE39viqU7vL3ooOwO3WJKHJHjr7EGEQYHDPMmCPNIm9YAJsdYOO4YNB5HcAgqCraL/pD1ChzO7yK+Xy0K9ha4PGHeeaPmClDDR/BDnlZT2XhskRN25/huttwy6kfZYpccWkhb+z6oAFCJqXGFV7zC9I1K0/kYbWIT6uXzqTC1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760014192; c=relaxed/simple;
	bh=VfKKewdOhmPX5s/YjhmEHDiOah7+h6ANqVNbRICAosI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ub2Vs5D1YjgQcsp4J68qoB9YdklSyl7p60I/Lbvkt2WaxnVqzusk67X7Dh0SJIV1r8QBPDp1ONuAbX/O6TYzzNeOzhYSWJ00AE+BmCfJxn3CxvC9iZnwmmrJGaglLNy+jxobbBbLfNNg1suafxcM0yQaL5pB4wsjtVYqKcZpYOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QnjVCpRQ; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-50f8bf5c518so1143616137.3
        for <linux-usb@vger.kernel.org>; Thu, 09 Oct 2025 05:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760014190; x=1760618990; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VfKKewdOhmPX5s/YjhmEHDiOah7+h6ANqVNbRICAosI=;
        b=QnjVCpRQwX2f2xWgmBvFs/nsWNx16k+Mhobfh0p19pxmCMG3yL05brpevjmF0i2DDQ
         I+R0OXna2GT4zrDV1Fdha9CUW6QszQsWrFjKZW571D41/wu7Zq01U6te8nzjyezHBIye
         MK7MU3HZY/B7I0va437dNid5ktq/IiG7qTswuwPyIo/pnlcJZ4gE1M+EdoeejxQVNCLO
         RA/WDeJ1RkYaSMWtVArxnY4doQzKWU9s4eFuDDStVQP+X0fidXiHLQW7SI1Czfqmoirm
         4wO47PLJGKkXQDLUr4QcMMZPM886htE/0xNMJHkNoLHWo4JLv4S4iJ6Iu8EXAq9qinIH
         eWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760014190; x=1760618990;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VfKKewdOhmPX5s/YjhmEHDiOah7+h6ANqVNbRICAosI=;
        b=oYOKU93GUpv8IRFAc23J49iJRjiY8jv8cefFwrd3JMMGw4mFdjcKH0Ta/gRrHTv8EH
         jYvKPb2dlzUbGtWN4YZ+yZ46bIc5grfLa6wxQWFGGkR7zuAG1jceXwZKs1Q8uAqVtMPd
         TmlIzdUfLUFy29zE+7hQ2tPTwpp1q33/gWqy48obV9NU8BLGiJMFK2t5+aUMM7XxYUBq
         euSTsdfqLCH+EPfiGOedO76AwiYM36jD/ulNE7wckRYSL9I4MCf+omFDXmzqY11auQ0q
         LoORuKczpJ8LDAwRHBFLc0pwJEPU1A8rVulC/zDiICt8RK8cjZuJc6hrn3hqWxQEFFlF
         louw==
X-Forwarded-Encrypted: i=1; AJvYcCXrWtYDWuI+XhlqXANtDh+xStvfL4SlILVZ9xRWrezYY8CkRgEJVM7anm/Y3lF7shz73BUFxrdQd5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPbhqQKVh2Sm+6ksYqvQWPonk1+m005V8k9Yhau8Q1fC2XMHtH
	qZOTIfAVmbZLlcFJeCw5TDcs97mGRYBvCddy7FY+Hko/zQget2yacDENHkvr99XzToMbQstJeq8
	YHxj9Jf6KO1IrxXEamimHHPRg4BPalNI=
X-Gm-Gg: ASbGncucAeIRJdsbnJW2pvFa8LWNkALvnQ4apFXEbpy3EQEyz2MJFj0+nIKgpvimxqK
	3iIp15YiDaEvDHGbJAQzjR/c5f7e1zZoA1f07h6LP/B9pepOaaFff/oov3327VUvIbF0ue8SgFx
	g0ED0BJMfpqXCY0h9LZPW+NlZKXKnWckLGqwvALB5bFo+nsWbMpTriqp6t+TKOKnnK9v/cADlgx
	aPbBcG9s1Nycymn5Ja6BNsn4GxG4oU=
X-Google-Smtp-Source: AGHT+IHtfbVNmua8MslhsQYc9gs8tcKd+k+54POc/Qilqx84xvVx6iDIRusKs9Xd1V+V5i4ALhTvYlM34De+UICHVGo=
X-Received: by 2002:a05:6102:32c6:b0:5a4:69bc:a9e with SMTP id
 ada2fe7eead31-5d5e2347589mr3230736137.22.1760014189789; Thu, 09 Oct 2025
 05:49:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
 <20251007231709.6c16802e.michal.pecio@gmail.com> <CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
 <CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
 <20251008082055.5646dadc.michal.pecio@gmail.com> <CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com>
 <20251008130532.49922d58.michal.pecio@gmail.com> <CABpa4MAsvK68CyQ7bVdie1j2m2O2YAEuFJHq8D-65uFT3FzKzQ@mail.gmail.com>
 <20251008223406.13f16f19.michal.pecio@gmail.com> <CABpa4MBGW=OJi+j34TbL2g=zyTg7-rxqpHYfAW-1DXTPk=g5Fw@mail.gmail.com>
 <CABpa4MBDvgJcgJf3_E7k1dBXs7v1tW-79dmc_sQDVM1bES5YDQ@mail.gmail.com>
 <20251009131444.2c221922.michal.pecio@gmail.com> <CABpa4MC-pij0Fczh-mH3zc+Ey2ALX70OfxX=cG4om7R6WMdRBg@mail.gmail.com>
 <20251009142911.6069c164.michal.pecio@gmail.com>
In-Reply-To: <20251009142911.6069c164.michal.pecio@gmail.com>
From: Arisa Snowbell <arisa.snowbell@gmail.com>
Date: Thu, 9 Oct 2025 14:49:37 +0200
X-Gm-Features: AS18NWArSZlpThbhGI6Jq97ozGUANkdAjEtN9Tl8kpJdrzbn2E-s6HZq7QQcWtg
Message-ID: <CABpa4MBAikj508aofG3fodycbriCMYHTZjJm8L5dcEV+JB15xg@mail.gmail.com>
Subject: Re: [PATCH] usb: xhci-pci: Fix USB2-only root hub registration
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	regressions@lists.linux.dev, Niklas Neronin <niklas.neronin@linux.intel.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This also works, thank you

- Arisa


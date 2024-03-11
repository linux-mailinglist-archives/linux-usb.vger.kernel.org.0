Return-Path: <linux-usb+bounces-7806-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3753A877DD4
	for <lists+linux-usb@lfdr.de>; Mon, 11 Mar 2024 11:13:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B27EDB21655
	for <lists+linux-usb@lfdr.de>; Mon, 11 Mar 2024 10:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30349383BF;
	Mon, 11 Mar 2024 10:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iEuDl0CX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3801538DD2
	for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 10:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710151886; cv=none; b=tQNLzWpJYLFNLnjsp50Sn51fSrqKiNKzmO2ZCdQXPkRCBVguDhQQm9MLkLN4B9sfjd6jHlsvtOynSkuO7pWqJ8G511rM6VfRO0aLwD5AAHqMk++jw1iwfYC7SLc2TKJhtagrXLQmD+GlYSTBtGu4Fug1OVf/HwVL9h4ZpQkxDJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710151886; c=relaxed/simple;
	bh=90wxFtc2yl7pC0/MOznw1zbBPujem0U2+kENHa16YIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D0wYOlVdFrunvTddVwpvyEPITbQHeO39ucanEoXdIicu2ecKrJpqzbKEvTNIL3BGft32QwfwC+LmM50NQqgSaxHl1c4I+WSicA+z143f4JSpzaeGfg/CwIbsCthHF2jPO07E82wb1U9KeTkHSCqiMY3B0vRSj6P20V0ZsOYjyuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iEuDl0CX; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-609f4d8551eso29713807b3.1
        for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 03:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710151884; x=1710756684; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OW00I9htwoAsj3xBJZrkbzrUKhGDr0/+mmT+snWwiXg=;
        b=iEuDl0CXWHzvdZYvg2Uqft91dUHE8s4S0nzX2JXi0jbuzaqbP/anhhfShGbtmAbj+6
         dFvbr3wwsVc1l/yaFnWxdW9auVjedAAueOsEYCtd/ModbkuJ87LhwWNhfyYT9XIHG8Rg
         NBXdgt4kfaL/thZyayXXcL5XztQ6r/VYqwHY+b0jAUMzWM+09I0c+AYDpX/iaZWoArCu
         ZDCuk9xxDBrx37I/nCyzCsUY1m8U0Sf/vNFHetvMnoOOowTWDaAIQHxZQGdLCeli+uPI
         QlfLzQ20Zjfb5+AatcjBlMjSEpCqglJQ28Sc25aQosThpL/N1kkhnSaA4YiQrxWazKkS
         WDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710151884; x=1710756684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OW00I9htwoAsj3xBJZrkbzrUKhGDr0/+mmT+snWwiXg=;
        b=ZE8g9Bv/A4ZlvbQZ/w6QJHUxBV+pU2SAbkSYG7ZewsCLRcc3TxB1Y3hERrDzcE0YEK
         Hd7K9C5CkQvL/2dw395yE1Mdl4eCQ5+3CH/Q7ygS7aER+NsAKllKqCd0OAXjgEMz32C+
         jC6TrvbWe02lrpt/pLWZWbG9LC3NkSfBAoH88/8OO5Sw61b+U1o3DTV8qoBX66gR8RZP
         PlNaJTA+AOqVMpqNsltS39acKx5TtU2pNCv2/9rqmxkMR+HRk2KLDhjTOd717zNb6mZx
         J5GXqVj+d/oBd/qplNpyj0T2dic2GQLnFjgA2pIedKY1MGMgvuHICKxfSkcz/KjxuaQw
         ineg==
X-Forwarded-Encrypted: i=1; AJvYcCWMSlbU8lwBcnc0OsrIX+58c+HRSQRw9/b8qAvZUD0aexSkUl5mm3uppEaDWLfmy0XsxIk39M7eqWNWlh66oqGVXmDkDEeRdLBT
X-Gm-Message-State: AOJu0YwYi/r59nYfTvs5CyBy9Q8sqOrOgcpcbLib1XVe/XufBYOZFIvT
	GEwjhC1R1QLQ2b3s+PxvsdM7EPVbA0VmzxaaiKS3V+ipCIak+5G8DYlA/v8/hSY2QBwAS+0hyMN
	BwZfOHLTUD85KdqKiz5IM0yhmmyLp5YEEjDrM
X-Google-Smtp-Source: AGHT+IHeMf2I6e7HKYzUshIicVdYM485nxp+wOAn6CZ5eXC/DS89xt9vl9QxYES8bm7T9Wf6yE9ct4Shlv7P6VhvUsU=
X-Received: by 2002:a25:28a:0:b0:dc6:ca3a:31da with SMTP id
 132-20020a25028a000000b00dc6ca3a31damr5135139ybc.16.1710151884041; Mon, 11
 Mar 2024 03:11:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240311094947.3738200-1-howardyen@google.com> <Ze7W3o67JLTKlLzR@smile.fi.intel.com>
In-Reply-To: <Ze7W3o67JLTKlLzR@smile.fi.intel.com>
From: Howard Yen <howardyen@google.com>
Date: Mon, 11 Mar 2024 18:10:47 +0800
Message-ID: <CAJDAHvbRSm_UYgx0fE7o2dJqcBfBbcFR4DrnVydkwfxGo0O4Rg@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Add support for multiple coherent memory regions
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, mathias.nyman@intel.com, 
	hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, 
	petr.tesarik.ext@huawei.com, broonie@kernel.org, james@equiv.tech, 
	james.clark@arm.com, masahiroy@kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 6:03=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Mar 11, 2024 at 09:49:45AM +0000, Howard Yen wrote:
> > In the system I'm working on, there is an always-on subsystem which
> > includes a small size memory, and several functions need to run and
> > occupy the memory from the small memory if they need to run on the
> > always-on subsystem. These functions must allocate the memory from the
> > small memory region, so that they can get benefit from the always-on
> > subsystem. So the small memory is split for multiple functions which ar=
e
> > satisfied with their generic use cases. But in specific use cases, like
> > USB3 devices which support the stream trasnsfer or multiple devices
> > connect to the host, they required more memory than their pre-allocated
> > memory region. I tried to implement it in a generic way and propose thi=
s
> > patch to give it the ability to get the memory from the other larger
> > memory to solve the issue.
>
> > Changelog
> > --------------------------------------------
> > Changes in v5:
> > - Fix build break.
> > - Use of_property_count_u32_elems() instead of
> >   of_property_count_elems_of_size().
>
> Have you tried to use --histogram diff algo?

Yes, I used the below command to create the patch v5.
`git format-patch --cover-letter --histogram -v5 51b70ff55`

>
> --
> With Best Regards,
> Andy Shevchenko
>
>


--=20
Best Regards,

Howard


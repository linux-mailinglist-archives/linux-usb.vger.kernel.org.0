Return-Path: <linux-usb+bounces-25365-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 365BEAEFD9E
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 17:07:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C6BA3AB6C4
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 15:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352CF275B04;
	Tue,  1 Jul 2025 15:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g1TiYSWI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DFA2741B6
	for <linux-usb@vger.kernel.org>; Tue,  1 Jul 2025 15:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751382338; cv=none; b=QiSnf8LYzO0Ib6z1dihUOhnUwi+HjgrL7smCORlT5ytTPbfuQ2/+UXjy0+Ua4EHBUrrMw6eZZW0avx5S4LltsdIun+pshO7mHr6hIz+S+eY9A+w9qOebwEeKJevoe9Doy5RB7DRxbBrZgUIv5QuSkILmBdRPxjGPbuooFdNpi8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751382338; c=relaxed/simple;
	bh=cC81D9mBHYbYtcJMVF0VKar/7co57B2vWE8jFmfT+Us=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZYWbUzZOXZ0kh4Rl3RSKXRHfEI7nTpWZyygeAKalaKw6zRfFwACIucvXwDhYuitqqVto7mV4UWL3ZqwZ6hw0A1ANEsYCLwnCjZIDUOZ7ifjNpZYcxfX18AuoSTPnYex82lmHyppw6ipKw1KDGHdmIrjz7biwvvi1peLG8yYl0qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g1TiYSWI; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3df2fa612c4so231725ab.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Jul 2025 08:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751382336; x=1751987136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAeW+QO7sIyTqGTIUZ5T6GJ2TGH6wrpJNIN7Yv/NoKg=;
        b=g1TiYSWIZs3mVH7JLhZA854QEXqydIolRfCdM1Is4a/ZPERYkybkgUc/sAeXcPYdea
         wGmJ+oyS34r7P6zqCAbWL672oFrXEa+d6miEzcz3UoDzxEM4NVv3Co5rxKnHTdSFBBfK
         6Xd/bCybp4nBjk5wpc9pj+lwFGSgkMCKYZ/2A7OQa8X1ZjSp5oBDF98GgExA9Dw5sHYm
         affVk2yvo14ldTxjxgwCPxqkk3sOGgC0agpkwz1Q2ttDufCDyGe9SyB7zhU0tUDAO3hn
         LSJK7TVrkfcIBcAMiuMkrZPoCQyGtBP5hrMOA54Ez1o19FwUM8FtpNkLLR3cKMBRYx+M
         ZWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751382336; x=1751987136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAeW+QO7sIyTqGTIUZ5T6GJ2TGH6wrpJNIN7Yv/NoKg=;
        b=Wa6tgiUyQJMXIbJFklY2CfLPhmkF50WUz5Vjfrvx82LWTKQUpC4mwUiBsdcU9S1oPr
         NQY+yLfXpOBCSQQIxjILsdPyH6ZmROfUURN5/NTx0uZg2c6TcV8Yrfbpu76MdUPwMizC
         lue3VAtRDX/xiVUQV19kpVm4aCTeOwJc5/ihw0DqsTVhap6a0KnyRfhI+qNGkIBUCwSH
         NzFlN+WhXcrtw8/46rY3Qk2f3jUUy5+v6HJ8IpRtTrQc19UiSt0vRe1PWxEsadlJN9Ha
         WyzRPwnX6jjWAi5a5MmOGdUGFyMYOxSRyHyXKxOAw0K+hLoRVOiaYFf5AAdfhJUVLVu0
         lWbg==
X-Forwarded-Encrypted: i=1; AJvYcCV9X2xljQgHNEZgQVV3wLxEZ0If6fVY4hh/L3N7gdWKX70CNEizpD3j/a0pMDzqsX7tNQ+aOFs1mDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUbt8ERzLzChn2K4sR7VsF6b+ZDMAO43c6XNlpatPOfHvrP5YZ
	sCm3MdTaueUS0pPqYs0x3dkycVG3Z/NWmhoYSIliFKHJriechFn3Gss8PKc1qXui/5+eUonnivS
	d2WzxX354xU8HaAeoo8dJAAoKavXB1mt5yiDWGEqVu4CJMYUsiF8hVXpH
X-Gm-Gg: ASbGnctNStn9H46CP04U+BRYuUUDGBiHXm7EETTi04mSfVaociPm/Tq1kseDhiuf+jF
	sMcspJHCzYo8YSXdB8IOpz6eA8wYAWi5F3kh89Cf3vfvzo6Bgik2z5iABtqzAhGZ/YIWFkfHN7s
	3X0WeXpt8QjRZBNCdCF4Ug6H9temz6ENlzsfH2bwGEGB3C/qRiNzcAX08v7HbUsx47syqQq/Ofb
	A==
X-Google-Smtp-Source: AGHT+IEcCC0GTWnthgBn4E5DR2h0slceTx2Oizv+khLKkJqEWL6UehzGXwpFPJ5xPOXnQV+0akv4aGjYDR9ESIMhqJI=
X-Received: by 2002:a05:6e02:1b04:b0:3dc:7cc4:3cb0 with SMTP id
 e9e14a558f8ab-3e04a04a0fcmr3015485ab.18.1751382335868; Tue, 01 Jul 2025
 08:05:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604082449.2029156-1-guanyulin@google.com>
 <2025060407-geologic-excuse-9ca5@gregkh> <CAOuDEK1471toXVEiNySQtmrRTSPwzo840Q2d5pw9M4fCOfsgTg@mail.gmail.com>
 <2025061957-daylong-legal-fed1@gregkh>
In-Reply-To: <2025061957-daylong-legal-fed1@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Tue, 1 Jul 2025 23:05:00 +0800
X-Gm-Features: Ac12FXxBjFsDAoOgivLlVGoqGQmIP8GxWeWcWT2DlyAl6K8ndpCHuMUKdEOEMac
Message-ID: <CAOuDEK1mY7++0NxRYR_+fhQB5+74KB-=MHhk4Dx3cpD6XrG93A@mail.gmail.com>
Subject: Re: [PATCH v14 0/4] Support system sleep with offloaded usb transfers
To: Greg KH <gregkh@linuxfoundation.org>, quic_wcheng@quicinc.com
Cc: quic_zijuhu@quicinc.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 5:27=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Jun 04, 2025 at 08:32:00PM +0800, Guan-Yu Lin wrote:
> > On Wed, Jun 4, 2025 at 6:56=E2=80=AFPM Greg KH <gregkh@linuxfoundation.=
org> wrote:
> > >
> > > On Wed, Jun 04, 2025 at 08:23:06AM +0000, Guan-Yu Lin wrote:
> > >
> > > Is there a reason you aren't cc:ing the developers from a "big androi=
d
> > > device company" that is currently testing and finding problems with t=
his
> > > patchset in their device testing?  I will require their signed-off-by=
 or
> > > tested-by in order to even consider accepting this patch series based=
 on
> > > the issues they seem to be finding with it in an
> > > internal-company-bug-reporting-platform that I seem to be also copied
> > > on.
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > I'm not sure if the company wants to reveal its testing right now
> > since the company raised the problem with the internal system. Hence,
> > we still use the internal system to communicate with them. We
> > understand that "signed-off-by"/"tested-by" tags are required to merge
> > the code, so we'll keep working closely with multiple companies to
> > achieve this.
>
> Great, please do so for the next version you post.
>
> thanks,
>
> greg k-h

Hi Wesley,

Right now the system sleep with offloaded usb transfers feature is
pretty much settled. I was wondering if you could test the patch on
your platform? Thanks!

Regards,
Guan-Yu


Return-Path: <linux-usb+bounces-20138-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D32C2A27FB3
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2025 00:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AE017A1B5C
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 23:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6959E21D00B;
	Tue,  4 Feb 2025 23:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sln7n8YD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578E121C9EE
	for <linux-usb@vger.kernel.org>; Tue,  4 Feb 2025 23:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738712202; cv=none; b=LOWMJ7PEyu7RUEfEM/AtDXr4mb8ND1h1akKWeEFDp3rniHquRAIr2GcK6TDptL7hFg+JcMQ4AYoDinbhRQwh61Q2av/6aGWvmH0SNnFBxifG5K7XyRN7r4hrI8jgfYYa6aWyy+6V8k9M0+BIGm4MIS1A/+NVZt+EICnIpTLKa6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738712202; c=relaxed/simple;
	bh=1v1YWtCj7WC7A0RcZPHUb/XtNYgDS+FIsq6RHpMq4ZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XfiqPXST0v72Ml30ZixKx8lsgVQCv0PxntOgglq1hTcD4JyKykxGXbU1s74qN5MuljGOWvU4PL5s6HLPQVYa6bVsOfmfESdOCx5iDlw4tyNqyWRkdBS+y46XDoP1n8m+9OAojCE0Upc88r9bQxGs7RRaVO4KLchBR38kbS8t0vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sln7n8YD; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e2362ea655so47253676d6.3
        for <linux-usb@vger.kernel.org>; Tue, 04 Feb 2025 15:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738712199; x=1739316999; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ycj9u2Dva2MHKVI2wTs7L1cktbKbr3X42oYcY3Nlf18=;
        b=sln7n8YD+pcglBZOlwbcVkbW+sPHG/tKoRjZfrPsp0GHW6j5t15DdLFJMoY2xZJgV3
         BOjio8SqPo8VQsz9j/LBA7V/+OPkYdBW39mDodW7f2zMIEt7ZKWyB+NCVoXaB9HJyty7
         sclLAKJgWwipVfU1U1V/uEt2/W/+cisn6crQN3Zyo6IA8p0bih0Lo4rfDE5spbCchvvB
         slmSmZJLpJVRjrk9pMWFHffX04Yvb/suRcyZH9+aGT4zUWRZ2XdgsiiKhK8im5OP0qfk
         lKoBLu8uvA6at0jfYiIYlSXNaQY1oXOSW4Ns9mDhBc0CPKo+fkHK2z7uVtykol7iUxU6
         t2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738712199; x=1739316999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ycj9u2Dva2MHKVI2wTs7L1cktbKbr3X42oYcY3Nlf18=;
        b=m+hQqk8eBk45KRqo4VLYQloEJ1MYtZI1HsGtf1jDAlvnlKR36S0lRu4dNfZyytB6Ae
         RGoi8+JB6b3YAWwS+PZLvLlef0s4caoALokIGoSfYySe6hrqtUXFLYlzsjYc3aA7PKbN
         6kn1+ajW8OTXg0xjLGT23hqUb8L+NMye5aPgol3IRlCG+ZAWMPn11rACUTHhl5cGKKTc
         3HA8TOYHPMmP4P/rbhYtbtfG4FHCf5BsWrUcZJlYl43UGFqfCQPZFmpi04HqnqWJmlLl
         vw+7QIFzHnEcMdQB/GtZrUfRooCdw/qL2jU2/OeRHA+EPP60L/J8+77MURAKPUQiNVTw
         16cQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5F9a4K80b1soYc/rcXf5w9/sVFXVw2YsRHGP/Ee/lCbQlJVh+7vTZJAb/EgwJzPrJZPtSzbwHHIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkhYL59UMFbOkf4Zc43/G9/6rdrhQOGtwH+fIIqB9ntA0cL1Df
	fRsSZF+gC3lwxrSxFAl6Lprt9nTKGIiguA0vAgwEzQnXKQBoYJyVzRV8AsaTh6tu9CkjjJQcSzx
	Ka3mzZwr+Df5csnpPr8WXV7RPwyeWHyxTivZp
X-Gm-Gg: ASbGnct56LGl/u+EUKmZVlN8JmkmDFQummAvPfLcds4mxOHSX4jawt5scpB4Qy212ct
	KnpXXfFnufJvZDeeT/2qGbO0FkB88KhNvkOjag54OMY938YunmI2SgeaDZ6hUyS1UR6dISK9bmh
	Umrf9POzynezw3/dI8i21JKRtD+A==
X-Google-Smtp-Source: AGHT+IG4N7xPpxY4+Q/365LNkiP0z9kl78Wy7YRrw6YzIgo2GFiiqEAHANRAs2P7VXQNtxqiSLaWT0Bqz2KMyEBmNtQ=
X-Received: by 2002:a05:6214:3198:b0:6d8:b115:76a6 with SMTP id
 6a1803df08f44-6e42f9166b3mr13380306d6.0.1738712198970; Tue, 04 Feb 2025
 15:36:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204000102.3989779-1-royluo@google.com> <20250204005452.fchcwx6ukv2xukiv@synopsys.com>
In-Reply-To: <20250204005452.fchcwx6ukv2xukiv@synopsys.com>
From: Roy Luo <royluo@google.com>
Date: Tue, 4 Feb 2025 15:36:02 -0800
X-Gm-Features: AWEUYZnENPg0UsfP4Soec5_ZkhznW_3qXdvOK0XjfcDVRDETMyK5YD68YgBF1_U
Message-ID: <CA+zupgz3JXoxUEHiezEHenTZXSRJ5A2HHjCTvYoo+DqvL9=C-Q@mail.gmail.com>
Subject: Re: [PATCH v1] usb: gadget: core: flush gadget workqueue after device removal
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"andre.draszik@linaro.org" <andre.draszik@linaro.org>, "elder@kernel.org" <elder@kernel.org>, 
	"stern@rowland.harvard.edu" <stern@rowland.harvard.edu>, "crwulff@gmail.com" <crwulff@gmail.com>, 
	"paul@crapouillou.net" <paul@crapouillou.net>, 
	"jkeeping@inmusicbrands.com" <jkeeping@inmusicbrands.com>, 
	"yuanlinyu@hihonor.com" <yuanlinyu@hihonor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 4:55=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys.=
com> wrote:
>
> On Tue, Feb 04, 2025, Roy Luo wrote:
> > usb_del_gadget() can lead to new work being scheduled in gadget->work
> > workqueue. This is observed, for example, with the dwc3 driver with the
> > following call stack:
> >   device_del()
> >     gadget_unbind_driver()
> >       usb_gadget_disconnect_locked()
> >         dwc3_gadget_pullup()
> >         dwc3_gadget_soft_disconnect()
> >           usb_gadget_set_state()
> >             schedule_work(&gadget->work)
> >
> > Move flush_work() after device_del() to ensure the workqueue is cleaned
> > up.
> >
> > Fixes: 1ff24d40b3c3 ("usb: dwc3: gadget: Fix incorrect UDC state after =
manual deconfiguration")
>
> The reference should be targeting the udc core. Probably want to Cc
> stable also.
>

Thanks for the review, sending out v2.

Regards,
Roy Luo


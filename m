Return-Path: <linux-usb+bounces-27913-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BF6B5277C
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 06:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2791F683EA4
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 04:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B311E22FE18;
	Thu, 11 Sep 2025 04:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TP7aENOH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E4311CBA
	for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 04:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757563989; cv=none; b=Fa11ERwqDQ+dcw5/e/uT1X7wq+9tJZdzO0KyVkvpvX7Kib4Ktbvrbt1GhfHaA8DfGPQOT6EfeZN5D7762vPhD+1gmhIE6LFQ+c/6xKrJB1HSGXV2nhmf+SrpE5mXi5WV0c90kYCAlFxOhJ43KuX5pA9qRI7pZYDgaHdARKT+R9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757563989; c=relaxed/simple;
	bh=4hPqeARqosqWLxCTuKgajaum+hmQ8OE3/VQMa53ni1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NuyjUZKQ4qd1vFVzMhLH4rglIiXlYPrv/R9/y+6EAK2oPu+d1D7odlxRX6LjFi+eGYMj3HEYmrxFYLw3yGv0Bwl4SMrHDDXfnAQRPMLTQ+88BCt0UYv4FSqmuzty+sVPz5pYSjtR2C5tKBXnJGjncrO5BewiBBZDJcoxh9q1MFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TP7aENOH; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-407a4e744ddso86645ab.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 21:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757563987; x=1758168787; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=655H2KsDR2fJVpZxOxrIYfh0mMw4vNi/WkGORS683L0=;
        b=TP7aENOHdNHPU2w9M7uuu/NQ3Eo5VX76pqnDm76uUl6a4/D5j3fCPkbMpQSQ9KoF3E
         N5fV5ckv/xAjHtdSV5CCiFNHb6wl4dJTux/vLLbr1HyRc66UUKJrdkmD7sjoSSoI723E
         LAXSwGw/B5l5K2l3G58TVrPRpdtbqxHE6Zyo7AggU3rlHRHBSZM63+LLOtLStZJNkQ2u
         R825P5KXuna7jKq+Q2dHqDJ2Q4QRkm3IiFJcg/7cJedtgNoz1YizoQvxrZF4zQ5xoEvo
         RsKszRZK5SsXr98SmZOA4yXUOXpDjh2SEuTlaMACZifLbZwVBthZ8f2Wr8GdtOIwv4AY
         77wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757563987; x=1758168787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=655H2KsDR2fJVpZxOxrIYfh0mMw4vNi/WkGORS683L0=;
        b=j95vHDY+z/atmWbS+hUAsupMLkxVMk1hxKN8cvtbkgAcVzTfmPF5C/Yhtu14/jI0FR
         nDE7dilS0J6zmnapEsxych/HH6NhL4BYNIDUmL4cioMn3njcBrmi/fiADJoMutr3eiGv
         7GTpenf1/+6nDgfyza2YTuHEYfyIUEqXNDxzUxtvaOFBB01qA0MzngcGVCM3ZotethhM
         IKQ+Iwh/P2rpPHsO3lOFlmhBHQjdzGH+uJ7udYTKZdr1pLACWgdzchpTYLJGGaILrw76
         hgx0Y0U4vZB2RicdW4QR5yKGhH7/2rzsy5OSmHDSOawH0D+0XdQOPGIpIwZ3BUNrl/PW
         5ZNw==
X-Forwarded-Encrypted: i=1; AJvYcCW6nEA9ay7X2rn0IbieMC1xek7eeOdSPcd8OnuHMxxKbyfqsJCglB1ReqX7gwJ9LeLp47TuqvwQ1WA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWnl7YC4YGk+DXwVI/gRa08fwCei/V00Bz47XEDUlkGx99Oho4
	bd6YiKWFZsXDWTXjO1tmUT7UBDYEtvvVpKcl3MKFu/T7IANTVAHfQl+wt4jT+wrPZT7Kcrud0bA
	OR+K3pFrlbHOAsnUK5225YOoE/hoBSsWd+F76A8mC
X-Gm-Gg: ASbGncs2BaI7+lZ0WzvJki5UCB19HpEVFUDHGVMUCpozZSmf14+0gFRqtlwIL/Q5kWF
	RfGhfpS263I8wJ9Ba46CfvIikBRGHagRGJL24/cTgZG/lad0rE5FLGHIzRqnloGWAQ/6/B2CW1B
	85giFCo5kWEcvKd5+OwtIvJSf97RPgLOnoKanswHPtLgiICDENQudrCkd0MgOscX9ef1BC3Qqe1
	PP9ccfTqgLrVY5j8twda0ZAuJrdvE7UtbAsEa7BTqnreoJZRbqb/02+rFOLq+8pq/FWf6cOpyFE
	Fr4kVdNIudOj
X-Google-Smtp-Source: AGHT+IHv1ItPg0yNbNTAbRbd+dYBW1J+7hh4D9M3hrHAIY9YZPJlVrQTruWC+uuHkhaInaUCnDNzxMkNh4AP1jHfRfA=
X-Received: by 2002:a05:6e02:b2f:b0:405:3b66:9a92 with SMTP id
 e9e14a558f8ab-4170e5ad87dmr9132195ab.7.1757563986398; Wed, 10 Sep 2025
 21:13:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801034004.3314737-1-guanyulin@google.com>
 <20250801034004.3314737-4-guanyulin@google.com> <2025081313-senate-unhearing-4396@gregkh>
 <CAOuDEK2=UyjYbPQeSxVSmiLu6A36m4Tt9xADHyamJHM61-vhmQ@mail.gmail.com> <2025090646-goal-unranked-8bf8@gregkh>
In-Reply-To: <2025090646-goal-unranked-8bf8@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Thu, 11 Sep 2025 12:13:00 +0800
X-Gm-Features: AS18NWBUElxTEKNR08wOLreLTj6AigqMLhYkSvv469cq9sa8UA5hUbv44bWJnKg
Message-ID: <CAOuDEK3Zv0qErDfCaRX_AH3buht4hP3XnuF3+T6-3aLw1_a2Ag@mail.gmail.com>
Subject: Re: [PATCH v15 3/4] xhci: sideband: add api to trace sideband usage
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, hannelotta@gmail.com, zijun.hu@oss.qualcomm.com, 
	xu.yang_2@nxp.com, stern@rowland.harvard.edu, 
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk, 
	quic_wcheng@quicinc.com, krzysztof.kozlowski@linaro.org, 
	dh10.jung@samsung.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 6, 2025 at 9:11=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Tue, Aug 26, 2025 at 12:37:00PM +0800, Guan-Yu Lin wrote:
> > On Wed, Aug 13, 2025 at 10:51=E2=80=AFPM Greg KH <gregkh@linuxfoundatio=
n.org> wrote:
> > >
> > > On Fri, Aug 01, 2025 at 03:39:32AM +0000, Guan-Yu Lin wrote:
> > > > +config USB_XHCI_SIDEBAND_SUSPEND
> > >
> > > Again, why is a new config option needed here?  Why can't we just use
> > > the existing one?  Why would you ever want one and not the other?
> > >
> > USB_XHCI_SIDEBAND focuses on the normal use case where the system is
> > active, while USB_XHCI_SIDEBAND_SUSPEND enables the sideband during
> > system sleep (Suspend-to-RAM). The design allows the user to determine
> > the degree of support for the sideband in the system. We could add the
> > "select" keyword to automatically enable USB_XHCI_SIDEBAND once
> > USB_XHCI_SIDEBAND_SUSPEND is enabled.
>
> But why would you want only one of these options and not both?  The
> whole goal of this feature is for power savings, which means that
> suspend is needed by everyone.  Don't increase the config variable
> combinations for no good reason.
>

Thanks for the suggestions. I'll remove USB_XHCI_SIDEBAND_SUSPEND in
the next version.

> > > > +EXPORT_SYMBOL_GPL(xhci_sideband_check);
> > > > +#endif /* IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND) */
> > >
> > > #ifdef in .c files is generally not a good idea, is it really needed
> > > here?  Maybe it is, it's hard to unwind...
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > Given that CONFIG_USB_XHCI_SIDEBAND_SUSPEND depends on
> > CONFIG_USB_XHCI_SIDEBAND and adds only a single function, I think it
> > is preferable to place the new code in the same file. This approach
> > prevents unnecessary code fragmentation and improves maintainability
> > by keeping related functions together.
>
> We put #ifdefs in .h files.  That's a long-time-rule for decades to
> ensure that we can maintain this codebase for even more decades to come.
> Please do not break that rule just to keep things close if it's not
> required.
>
> thanks,
>
> greg k-h

Thanks for the suggestions. This concern would be addressed once we
use only CONFIG_USB_XHCI_SIDEBAND to control all features.

Regards,
Guan-Yu


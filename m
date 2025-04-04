Return-Path: <linux-usb+bounces-22594-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AA7A7C1E2
	for <lists+linux-usb@lfdr.de>; Fri,  4 Apr 2025 18:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65AFC17D92D
	for <lists+linux-usb@lfdr.de>; Fri,  4 Apr 2025 16:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6148B21019E;
	Fri,  4 Apr 2025 16:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I5tyRrRn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7AF1F181F
	for <linux-usb@vger.kernel.org>; Fri,  4 Apr 2025 16:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743785751; cv=none; b=dcYzHu+puI0SXRvW0vLFaFgpk53SIOyOmfJOUMnijZRz9OhJBrpceH1d3Pg6JUvOMnU4C/S7H2edYUMZUFOas88m0wxJa4dRDk7yzOT02SatBG3sIYK5o/qho3I4cAnS2na/pWciHObtpoWxt8tak+ZH/0+DHiCPBD4tKzdIUSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743785751; c=relaxed/simple;
	bh=7cj2MMmMuMf8oE1KRfHPWv/DTjCLXHvLrYYAiOz/mHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SVbIgzaAPeiWjvnZi4VNce02dx5VfCDeY8sFl/xaeDBTrz1hQrv6PA3/WVExAwCai/WOG4Yjgkd2fKtgsQabfEQwXjJOZmdRE580JVmCn+xBBgZJIR7apvXZMm8Id/4O1tEUs2/k82+6tTH1Sw4VpvQMvvDrTUaY8qiIgsqNIa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I5tyRrRn; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6eaf1b6ce9aso26138416d6.2
        for <linux-usb@vger.kernel.org>; Fri, 04 Apr 2025 09:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743785748; x=1744390548; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Sv2FGqGsOyYEnn7qQfTqmoVzZUCkxYwtKgmbxzYoFw=;
        b=I5tyRrRnFPGrPV7XGIm4NPhuNqxuM6P3IwzfZ+02tx1vry/4IS7AieX+41rakDb5oG
         uR1M7ygU/d6tg14P3wn1WMUl9YdrEjO7wITXgqYwlT5/+4N2hVB/uOs53lxfO/1EESi9
         WfHZ5sypSVQosBwkBbrm9ZipLixMO2ffQxCI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743785748; x=1744390548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Sv2FGqGsOyYEnn7qQfTqmoVzZUCkxYwtKgmbxzYoFw=;
        b=Gxy5Jx0Om3Z5yPMNBX/FJdZ2PwxMBz1mviaHVQSFmjL4NnSHWthzFja317c9g3b5yp
         x/6W8d/tGPy+n7Lbi6AK2YSB7meyQB9H2GntOhvla1DEHnWK15qLe8sHfTPcx1qQc78B
         XjCiZ/l8snJpTD2ryAIBHP8zQ0CJf+++q9PTYkKMtZwE828nWZEw11gKk+0mZjfd7/Fq
         08rfJ5KZvSC+EuIN70X1U/1HZRGrVEzbPVTyBC9eMZ1GwpqcaAcpzUPHk6OQfy0OGyeP
         dVA7vmqe3RoCp5vyqc7Zemps3yHU15hITMT40jJqRMM/KKAhtsu+sO8O9AzhQu16JbvU
         /NMg==
X-Forwarded-Encrypted: i=1; AJvYcCWrg4EEgtDJgYj6k8EfG+X0Xq1KcbI4GKnm0GcIaK59FPylwzM3KlsrltM/rrzfVskFJjlcmQLVfx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU8GBsubmr/26aVnvhsKK72L3kYCCWfAVcfWWKhJFkAIclUbfg
	n3KgEROSMv3CvAd4kxwVfy+4K3b+eYiKyV+qhDLJWqB29LJ+5qfeDpelpUEaI/sekAkZnE/04qE
	=
X-Gm-Gg: ASbGncuaziwlHmxLBkrw5XhShghwTcOm1nMeq3PrpdnNq4fbb1utAqQ44vsN1T7G+9T
	34oA13zFB2cUSqX/y+tQJ8RMlSc2rqUBJtY3px/mfasRX6SlDvnSFPHBHJKfx+yF8MiNR12ymh1
	7YZSzQWAgI49RNZKcHfhUV56mChs0jJCKL2WX2SR/SbmraiiDJviFk8EBmJqo4VL7jIIlTBcHCp
	LhR49KWjgL578piWsjQ3mJmU55yBSy4j0QxR+JKFaA/7/cplhLb0xMLw3mdY5iWnjVRBeI6Ie2z
	TJM3QrbSnF6fMkdHy/Z/wzc2mTrfRoGovfxApG+BguHe3IhFpDIDbWfUNDbJXzkVCDneWvK2EQV
	0ViAGEpA=
X-Google-Smtp-Source: AGHT+IHN/+KfyYoluLm2xQ+hb9AtkFYNuL/9jezn7NE0OkkCEe7bS7nEYGkDfw7ikTPWzZZIFsSgsQ==
X-Received: by 2002:ad4:5b88:0:b0:6e8:97d2:9999 with SMTP id 6a1803df08f44-6f0b74a74aamr114826d6.28.1743785748554;
        Fri, 04 Apr 2025 09:55:48 -0700 (PDT)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com. [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0efc054asm23928256d6.25.2025.04.04.09.55.47
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 09:55:48 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e8fce04655so22184546d6.3
        for <linux-usb@vger.kernel.org>; Fri, 04 Apr 2025 09:55:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3p76ZJj/FdCjO2Gx4pB5xcBXpsX2O2+seeFUd7hYeL77weHKA9iGg+ebfJT9z+3QLNHw+xU9HW54=@vger.kernel.org
X-Received: by 2002:a05:6214:20c6:b0:6e8:f1b6:a122 with SMTP id
 6a1803df08f44-6f0b74a6c80mr69376d6.29.1743785747311; Fri, 04 Apr 2025
 09:55:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ce2048af-1044-4424-bca2-3799baefb9c2@amd.com> <20250404060203.GM3152277@black.fi.intel.com>
 <3b283147-cd32-410e-a163-9e603fd40bc1@gmail.com> <20250404115346.GN3152277@black.fi.intel.com>
 <98539971-3b43-4d64-a105-6790198c46d1@amd.com> <20250404161008.GO3152277@black.fi.intel.com>
 <f9806a24-875f-4c44-9694-96b62a6aefd9@gmail.com> <5f9004aa-9b51-474d-9cb0-c8c4e23b19f4@kernel.org>
In-Reply-To: <5f9004aa-9b51-474d-9cb0-c8c4e23b19f4@kernel.org>
From: Raul Rangel <rrangel@chromium.org>
Date: Fri, 4 Apr 2025 10:55:35 -0600
X-Gmail-Original-Message-ID: <CAHQZ30C=7d1DkHYTixrgmArCwKHzhxBn602P=YY5rP6OcAXuVw@mail.gmail.com>
X-Gm-Features: ATxdqUHHyyFD1U1IJZyy4A0cAZvgNUuI7ON0ZWlC1i_2L4CmqDnmII_wZHSMzQM
Message-ID: <CAHQZ30C=7d1DkHYTixrgmArCwKHzhxBn602P=YY5rP6OcAXuVw@mail.gmail.com>
Subject: Re: Wake on connect / wake on disconnect
To: Mario Limonciello <superm1@kernel.org>, Opal Voravootivat <puthik@google.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	"open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>, "Gong, Richard" <Richard.Gong@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 10:20=E2=80=AFAM Mario Limonciello <superm1@kernel.o=
rg> wrote:
>
>
>
> On 4/4/25 11:16, Mario Limonciello wrote:
> >
> >
> > On 4/4/25 11:10, Mika Westerberg wrote:
> >> On Fri, Apr 04, 2025 at 10:03:18AM -0500, Mario Limonciello wrote:
> >>> On 4/4/2025 6:53 AM, Mika Westerberg wrote:
> >>>> On Fri, Apr 04, 2025 at 06:47:31AM -0500, Mario Limonciello wrote:
> >>>>> On 4/4/25 01:02, Mika Westerberg wrote:
> >>>>>> Hi Mario,
> >>>>>>
> >>>>>> On Thu, Apr 03, 2025 at 01:12:07PM -0500, Mario Limonciello wrote:
> >>>>>>> Mika,
> >>>>>>>
> >>>>>>> Recently there are some conversations about wake-up from connect/
> >>>>>>> disconnect
> >>>>>>> happening and I wanted to get some background from you about the
> >>>>>>> current
> >>>>>>> policy set in tb_switch_suspend().
> >>>>>>>
> >>>>>>> Wake on connect and disconnect are only used for runtime, not for
> >>>>>>> system
> >>>>>>> suspend.  Would you be open to adding wake on connect as well for
> >>>>>>> system
> >>>>>>> suspend?  This should help enable use cases like plugging in a
> >>>>>>> closed laptop
> >>>>>>> to a dock (which works on Windows).
> >>>>>>
> >>>>>> Don't we already have a similar for all usb4_portX devices? That
> >>>>>> does not
> >>>>>> work for you?
> >>>>>>
> >>>>>
> >>>>> I think that will functionally work - but I'll double check.
> >>>>>
> >>>>> However usb_portX power/wakeup defaults are 'disabled' so this
> >>>>> would need a
> >>>>> udev rule.  Could we set the kernel default for those to 'enabled'
> >>>>> instead?
> >>>>
> >>>> No because that would trigger wakeup each time you unplug/plug and
> >>>> this is
> >>>> certainly not good if you close the lid, unplug from dock and throw =
the
> >>>> laptop to your backpack. Chrome uses this with "dark resume" so if
> >>>> this is
> >>>> supported by the userspace then it can also enable these.
> >>>
> >>> Ahhh.  I was thinking specifically with wake on connect that's not a
> >>> problem, but the sysfs knob for the port changes both wake on connect
> >>> and
> >>> wake on disconnect.
> >>>
> >>> Is there actually a use case for chrome with wake on disconnect?  IE
> >>> if we
> >>> didn't turn on wake on disconnect but defaulted to wake on connect wo=
uld
> >>> things be OK?  Or made the sysfs knob control only wake on disconnect=
?
> >>
> >> Good guestion - I don't know ;-) The Chrome folks wanted this so I
> >> suppose
> >> their usecase is specifically that dark resume and I think that's when
> >> you
> >> unplug a device so disconnect. Not so sure about wake on connect.
> >
> > I found the original patch from Rajat [1].
> >
> > Rajat, any comments?  Could you loop in the right people from the Chrom=
e
> > side to ask?    I think my "preference" would be that we make "wake on
> > connect" always enabled and then let the sysfs knob control "wake on
> > disconnect".
> >
> > [1] https://lore.kernel.org/linux-usb/20221101115042.248187-1-
> > rajat.khandelwal@intel.com/
>
> Oh Rajat's email bounced.  The only person I know that I've worked on
> wakeup related stuff is Raul.  I'll add him.
>
> Mika, Raul,
>
> Could you pull in current Chrome people from Intel and Google that could
> comment here?

+ Opal who should be able to answer the question regarding wake on
connect/disconnect.


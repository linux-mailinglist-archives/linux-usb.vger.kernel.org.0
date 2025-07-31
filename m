Return-Path: <linux-usb+bounces-26292-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16016B174B8
	for <lists+linux-usb@lfdr.de>; Thu, 31 Jul 2025 18:09:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 361C616193B
	for <lists+linux-usb@lfdr.de>; Thu, 31 Jul 2025 16:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51862207E1D;
	Thu, 31 Jul 2025 16:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dZegm/RM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA571E25F8
	for <linux-usb@vger.kernel.org>; Thu, 31 Jul 2025 16:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753978184; cv=none; b=SbOuyy/jNPRNaVMmts0ZW8To807p43lOqTo7nVKmYeyfD0X0Sw5JrrkjC+ACUV7J4S0Vn2rFInGnV6ZSMA0FsLECaXlx9+LiZi3WcSXpekYixzM6BZWrjjTDcXWHzzKIqgsbp36+V/6yZlb/CtWVaxMNnzN7yhuwezqll0XEqRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753978184; c=relaxed/simple;
	bh=UUbVgaWG1FBSW2udf9aTCPmOnPAnABB3Ya1UbXyvUfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jsJn23FJm92MazWPljJ9XJz88EFVPp05ZSNO6fO3KOOhJf/inO9NbvKWC3g8Y2qdWh7oo+jnAcVLXROkESVsVV/29T7T9zld3MGeigUgCTh6vI0537Yu6/j0tD0ZT8Y6JdEBu0wgUv87vlw+E6ICISaMRO5D6JfDrGzeSImDIgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dZegm/RM; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-31ecdf5faaeso639461a91.0
        for <linux-usb@vger.kernel.org>; Thu, 31 Jul 2025 09:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753978183; x=1754582983; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8c1vs297OuDQhw1rF/WqVEVYzpa4jaap14+9/4mG/U=;
        b=dZegm/RMZT4fpOJyAljY872rGRhIhTwh/Q1jO1MjTsBJ3CmLDgR9/53u1eWH+/xACa
         bkTIi9Ionq3ckaH83QaMcKwzqLKy9+hWckxale2KwDRAlRFiCyU2ifioRHdjVVSMkZKd
         z5WAX929e2LPu1thpxJ/l5+xarQu0RifzbbDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753978183; x=1754582983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8c1vs297OuDQhw1rF/WqVEVYzpa4jaap14+9/4mG/U=;
        b=JW2TPhOhv015kLAI4L13VM7ASuhE9/uJ/vkFxBn9eAlAiJfNNQ7Ypcvj940JxWBPj4
         CcCosVawOO8uZYnhj3YU5PbMDxMFrVtwxgwm3/nF6SLazXFE9hcGwEjpN/p2BDzC3Lj1
         h6NG3zhQf97x7enKsXBoPbPxWEa6Dt8Qyp8ERyYaIMPv9jPg/nh+8W/++2iwhtdPiK/n
         gj4Mlde+WryLXzByElb/TjCwym8faBYvwd5X92mBH5KIHfgLvwhndGquT585Q4LH9Mj7
         0dN4fpi8PFoqQWn1O6U/QA+Tav1lCAOonQwaxiqlPtv5jpLso+O9LPo2IC41v32sCSni
         lhLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiPbgll0isjKatdsiayAnh+Tr585e5VOJkG8JcGekcLHQIN0P69I7XgdZiVTFI8h7D2Bz01q/WFwM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyvv3Dbj2jCe9GyU2+T+g65nUrqzfNPb9ulOXt72sU1hr6AZOW
	6KcYQeuIAl5HyeGFHM37PrfGzp2b9L6Tda3iN6DsbSGn1V3JPh4HKxPXrUnbZhrxK3jnIq53Bou
	/0RWfxFn0KmSg1djbstTZV4p3YtgIiZtcd8gfDNYPEbRNIBerYrvGGQ==
X-Gm-Gg: ASbGncsIaJawjqI/w3M3FovSutiewUwltFbr+5ow1xfe1gqvAPo4frHrZuLfJUf1JfT
	fgyoVCT5mCB95bFJC5kN67GpVjlEtUGZaGSiwbJwtEOrz9J0QUOdkZS02OJnW8KX7mRAQK+Atsf
	sk+Wbun7MPAQjEl46J7MlXkIdWImnrfOxTvpVGC2maeqwTMcMn5x6DYxNSy6AURVP7jh4WBzINC
	xOu91A90LoXsxfZy+73uhEIuAYfz7a3kg==
X-Google-Smtp-Source: AGHT+IH+w2hB9w50GxzxGlBRwTPS/DAt66aQNsJJcSJh0eSSExp3OpaWYiihvtaGYVhasRRauJvVuomLJpIbicNxMs8=
X-Received: by 2002:a17:90b:3d07:b0:31f:1a3e:fe31 with SMTP id
 98e67ed59e1d1-31f5dde8755mr12579873a91.11.1753978182602; Thu, 31 Jul 2025
 09:09:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630141239.3174390-1-akuchynski@chromium.org>
 <20250630141239.3174390-6-akuchynski@chromium.org> <2025070143-safeness-prewashed-6e9f@gregkh>
 <CAMMMRMeKyi56Pha-X86BaQwcHGCx-xu5F67HCGZg=Yhxuk==OQ@mail.gmail.com> <CAMMMRMf_qc342=azkU-ceg=f-db2Z9NiONOu1_oRk8tmRL4RGg@mail.gmail.com>
In-Reply-To: <CAMMMRMf_qc342=azkU-ceg=f-db2Z9NiONOu1_oRk8tmRL4RGg@mail.gmail.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Thu, 31 Jul 2025 18:09:30 +0200
X-Gm-Features: Ac12FXx94P8Xkhok4AYIXJ8K2qdSo2AVg2OAPp7s8VPn2NpKyCMBWlD2bnynfvo
Message-ID: <CAMMMRMeYG-bvYSiE7K8AutorvyoiXypHXv_1z62Rvh_JNazd9g@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] usb: typec: Implement automated mode selection
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, "Christian A. Ehrhardt" <lk@c--e.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 10:39=E2=80=AFAM Andrei Kuchynski
<akuchynski@chromium.org> wrote:
>
> Proposed sysfs entries for V3:
>
> - portN/portN.M/priority, RW.
> This attribute assigns a unique priority to each mode. If a user
> attempts to input a value that is already in use, the existing mode at
> that priority will have its priority incremented by one to accommodate
> the new input. Users cannot disable a mode via this entry; disabling
> is handled by `active` for altmodes and `usb_capability` for USB4 mode
>
> - portN/mode_priorities, RO.
> Provides a prioritized list of all available modes for the port,
> formatted as a space-separated string (e.g., "USB4 TBT DP").
>
> - portN-partner/mode_selection, RW.
> Write: 1/0 to trigger or cancel mode selection.
> Read:  Provides a prioritized list of all available modes for the
> partner. Modes currently in progress are indicated by parentheses
> (e.g., "USB4 (TBT) DP"). Active modes are enclosed in brackets
> (e.g., "USB4 [TBT] DP").
>
> - portN-partner.M/entry_result, RO.
> Represents a mode state for this altmode, e.g. "none", "active",
> "in progress", "cable error", "timeout".
>
> - portN/usb4_priority, RW.
> - portN-partner/usb4_entry_result, RO.
> USB4 mode, not being part of `typec_altmode_group`, introduces
> additional attributes with the same meaning as alternate modes
> attributes.
>
> Please let me know if you have any questions, require further
> clarification on these proposed sysfs entries, or have objections to
> them.

Regarding the sysfs attributes, Heikki, do you have any suggestions or
disagreements? Please let me know your thoughts.

Additionally, for consistency, it would be beneficial to use names
"DisplayPort" and "Thunderbolt3" since they are already recognized
within the kernel. Using these full names rather than "DP" and "TBT"
would be preferable

Thanks,
Andrei


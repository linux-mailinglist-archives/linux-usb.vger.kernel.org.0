Return-Path: <linux-usb+bounces-24830-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC3CADCBB1
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 14:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4C52171AA9
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 12:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDD82C08C7;
	Tue, 17 Jun 2025 12:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Te6OFRQY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FB922FAF4
	for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 12:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163898; cv=none; b=R4PNY2SOJ0SKzHE+AgfsCqQPYSVhvS4ZHnEcB0wsxV5dv6tqYnZAcMer4K3H+26BBBW8aJJ7mf7Jc1QaqsocEZLRrbcVe4PYFTiY/aCD5hj5FiiBvRExmg3prg7nPpVeeqRRhGFHQiLTh1QZegmB5xnt5O/C79dEbNa97x4tWSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163898; c=relaxed/simple;
	bh=govOO8Sb0lfvYc8/pNG+JSTBvpGt8Xu8LaXV/aZgDiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GSEf0u//nvfqFNi34Ycuf3EDqx7/W5oWgPdcpFEkexvNc0ShGttr22Pjw/qBdVBCqJ3fzfEAbtEfcEOcB1mLABum3fPVD1EuPfMmXlEyieNdnFJotx1vpi83o/+SR1LRkSe0br2Z9xq3vzN8B37fgqi6BoO2Xc4KeMCKK2/7Xhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Te6OFRQY; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-742c7a52e97so4685151b3a.3
        for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 05:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750163896; x=1750768696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MoyRF7Ucv2ZJei5c5Z3iiwvEOE6mahrV6OPr5N+nC6I=;
        b=Te6OFRQYB5StReBdEsNtJZ67xDpSkV+MyXW7jKGOT2kfDBJHR7rLM4B4EZVjfCPAFh
         p+AcL+CTQQBd+Qe3uyJlNz8SRhy8fo16WHXZHwXcosGgDT0SJvZZ8vjRZBbHan3O+QYH
         4yypQuSz5zZ3Dli0fWa+efipt6m2WATy13YpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163896; x=1750768696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MoyRF7Ucv2ZJei5c5Z3iiwvEOE6mahrV6OPr5N+nC6I=;
        b=cwP8I8fXQGLYV7ztB4IMpjUjz+JEf+T8GyHUh9aDiM0W4/OXOjeRogHyI9mGju93Eo
         PZzzSvbjqmT033FlnxXNutJCLfu5J1EKjcaIoskjf3HJdT1shtYdNsMg7GrqhmvYhfHO
         nCGqoCdx1HfVdNjp1ABYfSje/vV61+xNfoQgfINtPYX0XH+6q8fV4Xfpj3eJqDFwFvsg
         xjMSjzCdADXPrHDUGdyJ7ocYloQCrisBabDSW26ap9LvDskhZJnK/PULvibC4UMCrP9q
         4UaONEjiu98/KRPBfLlfIGkJ7dIw8zhUy+bHmIGhcM7Om4POkNNdtYokN3xXDeUULrt0
         yR0A==
X-Forwarded-Encrypted: i=1; AJvYcCUkBzqPTdIU94Yfy1JaQZ0s+3u2pjZIJ6Bc9cbSitroUaQRxOlw6BXmCMYzZPnbgR7MpI6Vfvey9Ho=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVCAugYMHZsULCJjxQIdec97tfNEOi35Lq8zTlm4EZCFGtnhmK
	Z9+4MwmI30zCWuh+QZZOw5+k9Gxx8XZR5DlI+N7WWxMuzhK2VixuCGJQH7o+umzNe+lz+aQj6g8
	M7g3XTOPSt0yIYwdfqLYrzlMr28SWr15gOHsSGhVJ
X-Gm-Gg: ASbGncvZfzzMdarIma0+gNviNdjEJ3HNPYv11uMHLYmSgJ6BZZZT9NJI1AgUz0dj6TT
	Z5P6K6EG9auNe3tM/aiwzhcCxQiKWcohjIo6rbJ6xKBYGGV9g1xl5rw3whus9m48l6KpSFuTKiC
	yfs29ri6HZ0+AyI5x3vgdmKHatZE+xyuirpfhOnoVa961X2Y+azMrNa52TMpaWtiDTiAiK
X-Google-Smtp-Source: AGHT+IGcwG7VCe2N0MX7DXoVynUbfy3BR2JdgAsClrObhggJXBjxy4eU/Z1empHJ7zy1mJYExj1FaQj/LqBg4z9XrUI=
X-Received: by 2002:a05:6a00:1255:b0:748:33f3:8da3 with SMTP id
 d2e1a72fcca58-7489d0335f6mr17213221b3a.19.1750163896212; Tue, 17 Jun 2025
 05:38:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616133147.1835939-1-akuchynski@chromium.org>
 <20250616133147.1835939-5-akuchynski@chromium.org> <aFE6dnxet4_sm8b1@kuha.fi.intel.com>
In-Reply-To: <aFE6dnxet4_sm8b1@kuha.fi.intel.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Tue, 17 Jun 2025 14:38:04 +0200
X-Gm-Features: AX0GCFtqlvORHJFZLdz5McnL-6vzhJjXiWQ9EAC7tyWfPgFhCZapQvWuwd4Rmxk
Message-ID: <CAMMMRMdwUyxdMy42tA_ccYo77nf=6C+KgokDLHBLEYDa5aOHQw@mail.gmail.com>
Subject: Re: [PATCH 04/10] usb: typec: Expose alternate mode priorities via sysfs
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Guenter Roeck <groeck@chromium.org>, Pooja Katiyar <pooja.katiyar@intel.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, RD Babiera <rdbabiera@google.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 11:50=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Mon, Jun 16, 2025 at 01:31:41PM +0000, Andrei Kuchynski wrote:
> > This sysfs attribute specifies the preferred order for enabling
> > DisplayPort alt-mode, Thunderbolt alt-mode, and USB4 mode.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  Documentation/ABI/testing/sysfs-class-typec | 17 ++++
> >  drivers/usb/typec/Makefile                  |  2 +-
> >  drivers/usb/typec/class.c                   | 26 ++++++
> >  drivers/usb/typec/class.h                   |  2 +
> >  drivers/usb/typec/mode_selection.c          | 93 +++++++++++++++++++++
> >  drivers/usb/typec/mode_selection.h          |  5 ++
> >  include/linux/usb/typec_altmode.h           |  7 ++
> >  7 files changed, 151 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/usb/typec/mode_selection.c
> >  create mode 100644 drivers/usb/typec/mode_selection.h
> >
> > diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentatio=
n/ABI/testing/sysfs-class-typec
> > index 38e101c17a00..46eee82042ab 100644
> > --- a/Documentation/ABI/testing/sysfs-class-typec
> > +++ b/Documentation/ABI/testing/sysfs-class-typec
> > @@ -162,6 +162,23 @@ Description:     Lists the supported USB Modes. Th=
e default USB mode that is used
> >               - usb3 (USB 3.2)
> >               - usb4 (USB4)
> >
> > +What:                /sys/class/typec/<port>/altmode_priorities
> > +Date:                June 2025
> > +Contact:     Andrei Kuchynski <akuchynski@chromium.org>
> > +Description: Lists the alternate modes supported by the port and their
> > +             priorities. The priority setting determines the order in =
which
> > +             Displayport alt-mode, Thunderbolt alt-mode and USB4 mode =
will be
> > +             activated, indicating the preferred selection sequence. A=
 value of -1
> > +             disables automatic entry into a specific mode, while lowe=
r numbers
> > +             indicate higher priority. The default priorities can be m=
odified by
> > +             assigning new values. Modes without explicitly set values=
 default to -1,
> > +             effectively disabling them.
> > +
> > +             Example values:
> > +             - "USB4=3D0 TBT=3D1 DP=3D2"
> > +             - "USB4=3D-1 TBT=3D0"
> > +             - "DP=3D-1 USB4=3D-1 TBT=3D-1"
>
> No. If you want to disable entry to a mode by default, then you
> deactivate that mode, so -1 is not needed. USB4 is also not an alt
> mode, so this at the very least should be named differently.
>
> But I'm not sure this is the correct way to handle the modes in
> general. Can you please explain what exactly is the use case you are
> thinking?

Hi Heikki,

This implements the mode selection logic within the kernel, replacing
its userspace counterpart. Implementing this in the kernel offers
advantages, making the process both more robust and far easier to
manage.
This eliminates the need for user space to verify port, partner, or
cable capabilities, and to control the mode entry process. User space
doesn't even need to know if USB4 mode is supported by the port or
partner; unsupported modes are automatically skipped.
User space's role is now limited to high-level tasks like security,
with the kernel managing technical implementation. Mode selection and
activation can occur without user space intervention at all if no
special rules apply and the default policy (USB4 -> TBT -> DP) is
acceptable.

>
> If you just need to prevent for example USB4 entry by default, then
> you write usb3 (or usb2) to the usb_capability. The alt modes you can
> deactivate by default, no?
>
> I can appreciate the convenience that you get from a single file like
> that, but it does not really give much room to move if for example the
> user space needs to behave differently in case of failures to enter a
> specific mode compared to successful entries.
>

You are right, this patch series is proposed for its convenience. It
offers a more convenient method for users to enable or activate any
mode, without altering existing methods. Users can decide whether they
prioritize more control or an easier mode selection method.

Thanks,
Andrei


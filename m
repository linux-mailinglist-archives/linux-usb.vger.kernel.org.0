Return-Path: <linux-usb+bounces-22812-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A81C0A82D88
	for <lists+linux-usb@lfdr.de>; Wed,  9 Apr 2025 19:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFEBD3B7B34
	for <lists+linux-usb@lfdr.de>; Wed,  9 Apr 2025 17:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B69276020;
	Wed,  9 Apr 2025 17:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GjEjxU3j"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3083C78F5D
	for <linux-usb@vger.kernel.org>; Wed,  9 Apr 2025 17:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744219495; cv=none; b=TzQaygriFiqZuAkpf4mFOE8GMFEgxg9wfwvyw5/56MXzy/X6qfscSCHAYw+ekxjRh/LEQNPiOcvr3+/Ro9QMDUU1arZL5J6dfDB0IzJPyVcS30Gz57T0ZIHobOPYF8dOWvTFKZxT6lQZuPcUtwdU/y4f5KilSKgztmDmOb5NgY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744219495; c=relaxed/simple;
	bh=YDzadL7/WN7nrK86D16+jCqBEoNId42ComPeqlR73DM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N1Xqcl38Zt1LvFGSHvCkAyGMqCj+6NZy9ufJKrg40Yrzm4K1aK1qFs3yN5t66V+O5UxFbQLPVzjX3sZgWLBo9zEnoX4n7tyPc2bUgil7MQnGJFjATKVOC6vd/8/Bh089GzeeTXwg4y7BKl+4qryCD2tizHfV5qZRcTHj3OlP6K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GjEjxU3j; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c54b651310so935726485a.0
        for <linux-usb@vger.kernel.org>; Wed, 09 Apr 2025 10:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744219491; x=1744824291; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REdwccDLAjCC250oqs5IGhVVKlH520TIM+1ksxa5+4M=;
        b=GjEjxU3jWOQOXLWp09FviiWlzpjc4fMmNtSiLYSGHwsf6oSxkt4+7ou1YYh8EBL/hw
         iFziDEIvFOjAv1ql2KqOgMVk3ETmc1J3ORZUPlXqOykjdQXICNPCIA0xz9M5UzvfYy5R
         1IPNNCr9s+5HqaKHZGOK/2BwpbDy+5YNQT998=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744219491; x=1744824291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REdwccDLAjCC250oqs5IGhVVKlH520TIM+1ksxa5+4M=;
        b=bG7OCHqkaD/vnFl/zxmEk6MiUi3m8ULXh6Myc0QJCYf0kq/k/fO/M3vwpwAVSm2/k3
         NWfaGZQC7s3dlG9V8AKncp3wKJ2rY80saK79goQnKRmW3vA9BiBiD9rz8aXpwpArcsCB
         /KPRDLJgVZJY807w2sHv3Jhy+1GMYY3Ty+ZY9uU8La7wXt0zoqf3PJ8PmfD+DsWrTRFr
         U0kI2tWwcZUtbKbPstMKogHxqdxnwTnwE96imAzYL4h+YYnhExBbIwBze+z7fJ0ZQL5X
         YtNOGzmxJ2zpzwa5/GwcRfAcciEVRt2NcLET+wKcd8N6JzsckBBMEwC6/vtT722fDz36
         j3CA==
X-Forwarded-Encrypted: i=1; AJvYcCXoWPKk8M+eVXbTI2TlQfQnm9RXQMivminVRrCQ0ISG9JdwvfZZIt/mhVrHBFIAYAB2ViWIrPtF88c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdrmxlPpARlKX7Var3GQ9N3aHcaa/2GxgbBrLS1zQw0L9AEm1w
	kNMIS/wl4gO4zHc5MzFshCimH+u3ogpyeFl2TaDNLWpopWTZ10wpF5lhZ42VY3hLBnbeISgVJCs
	IFA==
X-Gm-Gg: ASbGncvSv1zGZjOLyYiUE7E3hUk3JCT0f24cLzmEA9QIm/hOmVO4hJX2BJEHDQ6rV6F
	4B8SvpxDX/IhaBb4q47ZCVja+Ohwxzk49hQcw85DsegDzX90ltJJpegmQjgzxk+RVeTlhwFWdoV
	QPcUYP4PQrcPASpN5am+vfvYgMdpw77AQfIjoS+Ri5g0wHtEr3sI+0qzLysJsVKUxDEUmmPi3Tb
	PzufNKpoWCWN5dwzN8XojGTCm/G5rdKUG/Q/2/q+oOcPF0C8V8PstXwJSG4T651bufqtawMeNIq
	K32/ylFkSQzYNYMg1twgP2vBfNmLhr55HXY1hl7jhU0bSXl3IdjBq+Nj4LgHVD5tX27cXnKXYBv
	CBz4zx8k=
X-Google-Smtp-Source: AGHT+IEnN1y4RvG11zoJVAh54qLDub2uFohzkPfApJukRb+8dz6rjxB7sm8JiUu/37mdF3I40+ySPA==
X-Received: by 2002:a05:620a:404d:b0:7c5:6140:734f with SMTP id af79cd13be357-7c79ddab42fmr390989585a.18.1744219491403;
        Wed, 09 Apr 2025 10:24:51 -0700 (PDT)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com. [209.85.222.182])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a10ce3basm97497385a.54.2025.04.09.10.24.50
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 10:24:51 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c08fc20194so1342337285a.2
        for <linux-usb@vger.kernel.org>; Wed, 09 Apr 2025 10:24:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWPazUw69qLJWye/mEvfIh831cH8LahL+zW1KOPw4EWwkCwW5JoHmUfc33zzL7l6zSG5Xo//yIqxJQ=@vger.kernel.org
X-Received: by 2002:a05:620a:4481:b0:7c3:d5a4:3df3 with SMTP id
 af79cd13be357-7c79dde625amr396629085a.34.1744219489705; Wed, 09 Apr 2025
 10:24:49 -0700 (PDT)
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
 <CAHQZ30C=7d1DkHYTixrgmArCwKHzhxBn602P=YY5rP6OcAXuVw@mail.gmail.com>
 <20250407055520.GP3152277@black.fi.intel.com> <dcf41124-d693-4b0f-a1d1-7ad7cd914449@kernel.org>
In-Reply-To: <dcf41124-d693-4b0f-a1d1-7ad7cd914449@kernel.org>
From: Raul Rangel <rrangel@chromium.org>
Date: Wed, 9 Apr 2025 11:24:38 -0600
X-Gmail-Original-Message-ID: <CAHQZ30Db-3sA1QVru-Tpwp9ZgJdSrO2UKC5Qpqg1dkqc0O2S2Q@mail.gmail.com>
X-Gm-Features: ATxdqUFRSlWqRpu8YZxXRxnF7-x2pCYYvS-RE8nDyA5ex0nrT45-5TuYKdw_afQ
Message-ID: <CAHQZ30Db-3sA1QVru-Tpwp9ZgJdSrO2UKC5Qpqg1dkqc0O2S2Q@mail.gmail.com>
Subject: Re: Wake on connect / wake on disconnect
To: Mario Limonciello <superm1@kernel.org>, Subrata Banik <subratabanik@google.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Opal Voravootivat <puthik@google.com>, 
	"open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>, "Gong, Richard" <Richard.Gong@amd.com>, 
	Utkarsh Patel <utkarsh.h.patel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 11:03=E2=80=AFAM Mario Limonciello <superm1@kernel.o=
rg> wrote:
>
> On 4/7/2025 12:55 AM, Mika Westerberg wrote:
> > On Fri, Apr 04, 2025 at 10:55:35AM -0600, Raul Rangel wrote:
> >> On Fri, Apr 4, 2025 at 10:20=E2=80=AFAM Mario Limonciello <superm1@ker=
nel.org> wrote:
> >>>
> >>>
> >>>
> >>> On 4/4/25 11:16, Mario Limonciello wrote:
> >>>>
> >>>>
> >>>> On 4/4/25 11:10, Mika Westerberg wrote:
> >>>>> On Fri, Apr 04, 2025 at 10:03:18AM -0500, Mario Limonciello wrote:
> >>>>>> On 4/4/2025 6:53 AM, Mika Westerberg wrote:
> >>>>>>> On Fri, Apr 04, 2025 at 06:47:31AM -0500, Mario Limonciello wrote=
:
> >>>>>>>> On 4/4/25 01:02, Mika Westerberg wrote:
> >>>>>>>>> Hi Mario,
> >>>>>>>>>
> >>>>>>>>> On Thu, Apr 03, 2025 at 01:12:07PM -0500, Mario Limonciello wro=
te:
> >>>>>>>>>> Mika,
> >>>>>>>>>>
> >>>>>>>>>> Recently there are some conversations about wake-up from conne=
ct/
> >>>>>>>>>> disconnect
> >>>>>>>>>> happening and I wanted to get some background from you about t=
he
> >>>>>>>>>> current
> >>>>>>>>>> policy set in tb_switch_suspend().
> >>>>>>>>>>
> >>>>>>>>>> Wake on connect and disconnect are only used for runtime, not =
for
> >>>>>>>>>> system
> >>>>>>>>>> suspend.  Would you be open to adding wake on connect as well =
for
> >>>>>>>>>> system
> >>>>>>>>>> suspend?  This should help enable use cases like plugging in a
> >>>>>>>>>> closed laptop
> >>>>>>>>>> to a dock (which works on Windows).
> >>>>>>>>>
> >>>>>>>>> Don't we already have a similar for all usb4_portX devices? Tha=
t
> >>>>>>>>> does not
> >>>>>>>>> work for you?
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> I think that will functionally work - but I'll double check.
> >>>>>>>>
> >>>>>>>> However usb_portX power/wakeup defaults are 'disabled' so this
> >>>>>>>> would need a
> >>>>>>>> udev rule.  Could we set the kernel default for those to 'enable=
d'
> >>>>>>>> instead?
> >>>>>>>
> >>>>>>> No because that would trigger wakeup each time you unplug/plug an=
d
> >>>>>>> this is
> >>>>>>> certainly not good if you close the lid, unplug from dock and thr=
ow the
> >>>>>>> laptop to your backpack. Chrome uses this with "dark resume" so i=
f
> >>>>>>> this is
> >>>>>>> supported by the userspace then it can also enable these.
> >>>>>>
> >>>>>> Ahhh.  I was thinking specifically with wake on connect that's not=
 a
> >>>>>> problem, but the sysfs knob for the port changes both wake on conn=
ect
> >>>>>> and
> >>>>>> wake on disconnect.
> >>>>>>
> >>>>>> Is there actually a use case for chrome with wake on disconnect?  =
IE
> >>>>>> if we
> >>>>>> didn't turn on wake on disconnect but defaulted to wake on connect=
 would
> >>>>>> things be OK?  Or made the sysfs knob control only wake on disconn=
ect?
> >>>>>
> >>>>> Good guestion - I don't know ;-) The Chrome folks wanted this so I
> >>>>> suppose
> >>>>> their usecase is specifically that dark resume and I think that's w=
hen
> >>>>> you
> >>>>> unplug a device so disconnect. Not so sure about wake on connect.
> >>>>
> >>>> I found the original patch from Rajat [1].
> >>>>
> >>>> Rajat, any comments?  Could you loop in the right people from the Ch=
rome
> >>>> side to ask?    I think my "preference" would be that we make "wake =
on
> >>>> connect" always enabled and then let the sysfs knob control "wake on
> >>>> disconnect".
> >>>>
> >>>> [1] https://lore.kernel.org/linux-usb/20221101115042.248187-1-
> >>>> rajat.khandelwal@intel.com/
> >>>
> >>> Oh Rajat's email bounced.  The only person I know that I've worked on
> >>> wakeup related stuff is Raul.  I'll add him.
> >>>
> >>> Mika, Raul,
> >>>
> >>> Could you pull in current Chrome people from Intel and Google that co=
uld
> >>> comment here?
> >>
> >> + Opal who should be able to answer the question regarding wake on
> >> connect/disconnect.
> >
> > Added Utkarsh from Intel side.
>
> I had another look at usb4_port.c the flows used.  This is the call path:
>
> tb_switch_suspend()
> ->tb_switch_set_wake()
> ->->usb4_switch_set_wake()
>
> The flags for wakeup policy are set in tb_switch_suspend() and then
> passed as arguments down to usb4_switch_set_wake().  This enumerates
> whether wake is set for any usb4_port device and applies the flags to
> that device.
>
> So AFAICT that means that even on ChromeOS there won't be a wake on
> connect or wake on disconnect event for suspend/resume no matter what
> the sysfs files for each port are set to.
>
> In summary; my ask is whether we can do this:
>
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index 6a2116cbb06f9..f2f6a085a742b 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -3599,6 +3599,7 @@ void tb_switch_suspend(struct tb_switch *sw, bool
> runtime)
>                  flags |=3D TB_WAKE_ON_USB4;
>                  flags |=3D TB_WAKE_ON_USB3 | TB_WAKE_ON_PCIE | TB_WAKE_O=
N_DP;
>          } else if (device_may_wakeup(&sw->dev)) {
> +               flags |=3D TB_WAKE_ON_CONNECT;
>                  flags |=3D TB_WAKE_ON_USB4 | TB_WAKE_ON_USB3 |
> TB_WAKE_ON_PCIE;
>          }
>
> That would allow the use case of "plug in a closed laptop to a dock" and
> it wakes up.

+ Subrata since they might have more context on the TB stack.


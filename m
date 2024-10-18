Return-Path: <linux-usb+bounces-16416-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9138C9A3DB1
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2024 14:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAFAC1C253B4
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2024 12:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFB917555;
	Fri, 18 Oct 2024 12:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s68rtUgk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8533B1D545
	for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2024 12:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729252802; cv=none; b=gc8pQENpDhvPrEDbZHZxut8fGZY/1m8vW6EiiDA3nWmeb4Qhh/B18vgpjNFKI0t1dATFDS/z54EbSA/nVpNEI+jLH3gr1dkwjKaNoYk1BIjjTArRo6Vayco3TeyBgrKzSQrF0vI225qbMBrSOA2/Q91VG2vz9lAr1XvOCQ4ht8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729252802; c=relaxed/simple;
	bh=IZ+ktM1q4VjLBkIUgFdG4NXu1mtAQptlV8rWNSJ9QOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f8P8YX6zvBOMsq0c+yKqIaQaqfZ0vQW5fFX3Dm6lf5MFnSGz5gYXowAuGvPr3k3ljoe2q0/V+TfxGuurHVOzLmzr4CGbiG0Sts19IujHvnAdn0pYo9Q4NAvbNDfH7GpksEJIHnnpt+0gQNcTC2CqyqNZghJeuYDIk+FZmnILTh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s68rtUgk; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539e617ef81so8893e87.1
        for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2024 05:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729252799; x=1729857599; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFVJy1qmuzdcCDjWiX1hq6jLw4k+NEA+Um1zz1+jP9c=;
        b=s68rtUgkNbX1p1E40ZOCyuVvSnFNWqp46FsdKDSHWtcKrjpljSIbb3Pe4GevTSoqlL
         ppEFgsgNcSxTwQE0AcnT/YK/wqEjlNJKVxvK3BJ7VCx/mvmsegDfevoiki9VmjzynVhN
         vQz256YumXKcSkBXMZ/kx8zb0J7d4vl+KJ58TzdoxANFnftYWa8Nymu94LDaTp5fh45O
         UG1yc1+9Tscythw+5g2QNCOArU1RUZB6HI7pLOJir3cW8yxWjMlCtHXi69+/GtGGLsZs
         FLnk5api5G9D0O0S/cQxbUgplEXo42DWKWoXw86dNJv4LRmCPMVm45OosetEP4m2kouz
         0MuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729252799; x=1729857599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFVJy1qmuzdcCDjWiX1hq6jLw4k+NEA+Um1zz1+jP9c=;
        b=jVj4Igf/Xe0TvPF2ECjDVJ8EItFOJLUsJM8v4s0vjRmskzP5qqEn1xIISn3/wpzShJ
         +BzvARtDe382/HL13F1+AYpHjlvMpAIZxuKhJMa/EK0AORqfQ84YuG46cC8IATmtp4Jj
         ao4ha4X0O+WWYEzXbPnwljgFEtY5k20SNaXeeouWUvtexHt4ZFQ1m5X1YWBayMR75Mxq
         VwBTpWYwUhTKI2NfLKi/G+7iM0jfGuKJPD0x5oxR4bnaHPWtpHzx7wGJQFGF1/sRaiYL
         JJdbmz5gcFWRhZ2wLjaBYTNAlQgVth+qinOvjhyQuNfP5R0WkV2UFu59zuFHvDsPBc2R
         cfIw==
X-Forwarded-Encrypted: i=1; AJvYcCUJFxzdQ9S84tHAVjIrnu8YqXlEZLRoxAqaWCVkTcqA5rsa/f3CxknK+TtBSR9Er8549dX6vWx7veI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtqWt5d1Ximnm7cGzKkcG7ncfVh+8tETyEQymOeMU4t5TdzPQq
	CzKux7qK4MXxrtzHeMBGXJeQ38sbqSLTqNiUshSqplLZ6Kuyb9awcZgE4b83eERZiHRtymt0Qf8
	13XwpHi8DA7Wdmor55E4B5+jfV+qwh42tB0Ek
X-Google-Smtp-Source: AGHT+IFMpq1BY2E3+83Zu4jQvyCMGZh1ayMrgGbPO35zQuto/FrYqXwDdz8RQvz525bpc+0e4k6UsPfpkEZSfRt6ITA=
X-Received: by 2002:a05:6512:1294:b0:536:52dc:291f with SMTP id
 2adb3069b0e04-53a1575907amr148028e87.1.1729252798334; Fri, 18 Oct 2024
 04:59:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014085816.1401364-1-guanyulin@google.com>
 <20241014085816.1401364-6-guanyulin@google.com> <9b5fe5d2-77a7-40b7-b260-856c35d9dcec@rowland.harvard.edu>
 <CAOuDEK2f_mtfiye7MdnOqEkq3pYW1kcdkwEMMBC5CkkQ1OGu3A@mail.gmail.com>
 <fddf19f6-d03a-469e-a56f-ef390c099902@rowland.harvard.edu>
 <CAOuDEK3mmR9052FWEJAVBkUanVJ1MLLebZoANiasUpD9TDBjfg@mail.gmail.com> <003263c8-c901-496b-ae04-7cccd7f3cfa2@rowland.harvard.edu>
In-Reply-To: <003263c8-c901-496b-ae04-7cccd7f3cfa2@rowland.harvard.edu>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Fri, 18 Oct 2024 19:59:00 +0800
Message-ID: <CAOuDEK2U1Ok=a=X36R_xjkW7MJm2kQ=G7ohh_oC=+f=rGa2eiA@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] usb: host: enable sideband transfer during system sleep
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	mathias.nyman@intel.com, yajun.deng@linux.dev, sumit.garg@linaro.org, 
	kekrby@gmail.com, oneukum@suse.com, dianders@chromium.org, perex@perex.cz, 
	tiwai@suse.com, niko.mauno@vaisala.com, andreyknvl@gmail.com, 
	christophe.jaillet@wanadoo.fr, tj@kernel.org, stanley_chang@realtek.com, 
	quic_jjohnson@quicinc.com, ricardo@marliere.net, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, badhri@google.com, 
	albertccwang@google.com, quic_wcheng@quicinc.com, pumahsu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 10:45=E2=80=AFPM Alan Stern <stern@rowland.harvard.=
edu> wrote:
>
> On Wed, Oct 16, 2024 at 03:40:00PM +0800, Guan-Yu Lin wrote:
> > On Tue, Oct 15, 2024 at 10:43=E2=80=AFPM Alan Stern <stern@rowland.harv=
ard.edu> wrote:
> > >
> > > On Tue, Oct 15, 2024 at 11:56:00AM +0800, Guan-Yu Lin wrote:
> > > > On Mon, Oct 14, 2024 at 11:56=E2=80=AFPM Alan Stern <stern@rowland.=
harvard.edu> wrote:
> > > > > I'm not so sure about this.  By returning early, you prevent the =
drivers
> > > > > bound to this device from suspending.  But they can't operate pro=
perly
> > > > > when the system is in a low-power mode.  Won't that cause problem=
s?
> > > > >
> > > > > Maybe this really belongs in usb_suspend_device(), and its counte=
rpart
> > > > > belongs in usb_resume_device().
> > > > >
> > > >
> > > > To my understanding, after the system is suspended, the USB driver
> > > > will do nothing as the main processor has been suspended. May I che=
ck
> > > > what forms of low power mode and operation we are discussing here?
> > >
> > > S3 suspend.  You are right that the driver will do nothing while the
> > > CPU is suspended.  But what about the times before and after that,
> > > while the suspend and resume procedures are underway?  The driver
> > > needs to be told to cancel any ongoing transfers while the system
> > > suspends and then restart them while the system resumes.
> > >
> >
> > Regarding the cancellation of ongoing transfers during suspend, I
> > believe usb_hcd_flush_endpoint() handles this as discussed below.
>
> There's more to it than that.  If you cancel ongoing transfers by
> calling usb_hcd_flush_endpoint() without informing the driver first, the
> driver will get very confused and think the device has failed.
>
> > Besides calling usb_hcd_flush_endpoint(), are there any other
> > necessary changes before suspending the driver in our scenario? Maybe
> > we could discuss setting usb_device_state to USB_STATE_SUSPENDED.
> > However, my understanding is that this variable reflects the actual
> > device state. Since the device remains active via the sideband in our
> > case,  changing usb_device_state seems unnecessary.
>
> That's right.
>
> I don't think anything else is needed.  Just call
> usb_suspend_interface() like the normal pathway in usb_suspend_both()
> does, but skip calling usb_suspend_device().
>
> Alan Stern

Thanks for the suggestions, let me address them in the next version.
After some local development, our experiments suggest it may be
necessary to skip usb_suspend_interface() & usb_hcd_flush_endpoint()
for connection changes behind a hub and HID events in our scenario.

Typically, when the system sleeps, the hub uses remote wakeup to
reactivate upstream devices and resume the interface to handle
connection changes. However, our current conclusion is to maintain the
device in an active state while suspending the interface. This
deviates from the norm, as remote wakeup is designed to function when
devices and links are suspended. We're concerned that this discrepancy
might interfere with the remote wakeup mechanism.
To address this, we're currently bypassing usb_suspend_interface() and
usb_hcd_flush_endpoint(). This effectively simulates an "active
system" state, allowing the USB controller to notify the kernel about
connection changes via interrupts. This workaround applies to HID
events as well.

Which approach do you recommend? Should we invest in integrating with
the remote wakeup framework, or is it acceptable to keep necessary
components active, mirroring an "active system" state?

Regards,
Guan-Yu


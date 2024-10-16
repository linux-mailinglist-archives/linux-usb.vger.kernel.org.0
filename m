Return-Path: <linux-usb+bounces-16297-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 596B89A02CD
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 09:40:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D44101F2700A
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 07:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147DB1B6D00;
	Wed, 16 Oct 2024 07:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O9QcEgLU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB501C07C7
	for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2024 07:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729064407; cv=none; b=hAd2F6iaijX7pPLD+SQM+zqN/dPmt4EiiB6Xa2oNqNtuA5KgLcMV9wKs2CheameDsZueyO49LemYKZkaaC7AacRHXDgpBEE+4+74c0PXBj2+Jpyy6rnSX12M3R/MQ2WB7MQ5c8kbdfNlNhiw86YAOWcoqKClfC2hiemL2oVwhnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729064407; c=relaxed/simple;
	bh=rcYzwefzKTgPK3mB86FXObjcdy9RYBz+8Enp8eDLiqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fe8XOs52TwJG4PGKFYJpXBdcqG86ezBpdA1ZWNtF3/MOMWg29UVIXRJ3JyyHxYrPfCpkycm2/IeTxrNqcKOxKnDmHOb1XXacKlM6fBabb9pQqWYWMl0TzZw8Ci9O76yaV+VZ2sLzEinZIaw6f4Ifs4kkGL0fnKWFGzFUJVgPqj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O9QcEgLU; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539e681ba70so5685e87.1
        for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2024 00:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729064404; x=1729669204; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ehTktfLGz6twLu/5oBplmy0RG+dW6zbCHDSQvLGj34=;
        b=O9QcEgLUy49dCdv5ZOhb5rgPLIb4V3tdKxOJMDXOZkVukcv3SjzrbMSXy5oJ1HFvKh
         Trm2ZlTKQWBio+r4pjuMMO9QE8VptyULNw0o1I3uu5v90brYC+3kcvXyycgwgzklnqFJ
         5Ce3ZBu0QeituC5obozZgGQZZC+EGagM3G/Iv6vATkBmpWNuIHN4dCs0hwGUV1dWGWlI
         PrPf4LWVVsXM9tsZL+90Q1RdavwUPafLaH46y8OtJts1N99I/dszfDKVs1/HbZOmTYk7
         XgZUosHTK7/hAhdEGn2kgVFya6YH/XFAPZcImSbogN9smm+iFwotjEfFS7culMi2yQLR
         Uo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729064404; x=1729669204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ehTktfLGz6twLu/5oBplmy0RG+dW6zbCHDSQvLGj34=;
        b=l4Lb1SL1OupgIS1klAyrqs07wbnDZRsWXHyPgFwMvoeX96IRyJjqoyESPcCX6lk0DE
         0fXOKeyuwkDY2CV+o10Tu9ZerM+3LM+w5gPvuLheR1IGPPNPV3I6snvfhLG5f+/nSspe
         dm+55NKe987Xg3XieXlFuhvoh20EyMLczP7RbSQB0bGxO8ItyMpGVEBcbiPR+eXsOnmr
         RpAQ6jT7gU75yB0MFx/f4Psxp/BTTloSlmd3+y1TuMY7LxpnzupEea/mxXRTQDJQC2BU
         8vKxUYqZcyOxFDF6WrO+falyBgOAvFx4WFag9RjbFdQRvlYy22ZiArArxfd3FTsKdcjt
         M++Q==
X-Forwarded-Encrypted: i=1; AJvYcCWY4IQzqwrdtjCdIC8j/75OuIt7ScYXq41CN9gsgqHZqeAtvcdAtXsDApxWxrqEVFmoeczIXT9QIMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEL3/b//cXeQUQVA0TjTidrHzdK4tVBAK1fAwpv6xMy0guwrk5
	Mo6HqtaSIN6hqxO2YwNBC/jk9d34xjrA7d75tyPTWnY79dAFNR6zpBCue3k9ALXNHSGFE8SdYTp
	Z4bMLwaaZd6n4TgInG23BTWYSoicDnqiBTOob
X-Google-Smtp-Source: AGHT+IF5Uo+ip/0IVhP7Pd4XrUlYyoWYSwUDIYM9E+pUSFy/eEfINVsRLlW6lVJRybb2mEhD/UI0LJqdNWhb2s5k+zA=
X-Received: by 2002:a05:6512:2206:b0:530:ae18:810e with SMTP id
 2adb3069b0e04-53a05f2e6d2mr232691e87.5.1729064403721; Wed, 16 Oct 2024
 00:40:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014085816.1401364-1-guanyulin@google.com>
 <20241014085816.1401364-6-guanyulin@google.com> <9b5fe5d2-77a7-40b7-b260-856c35d9dcec@rowland.harvard.edu>
 <CAOuDEK2f_mtfiye7MdnOqEkq3pYW1kcdkwEMMBC5CkkQ1OGu3A@mail.gmail.com> <fddf19f6-d03a-469e-a56f-ef390c099902@rowland.harvard.edu>
In-Reply-To: <fddf19f6-d03a-469e-a56f-ef390c099902@rowland.harvard.edu>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Wed, 16 Oct 2024 15:40:00 +0800
Message-ID: <CAOuDEK3mmR9052FWEJAVBkUanVJ1MLLebZoANiasUpD9TDBjfg@mail.gmail.com>
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

On Tue, Oct 15, 2024 at 10:43=E2=80=AFPM Alan Stern <stern@rowland.harvard.=
edu> wrote:
>
> On Tue, Oct 15, 2024 at 11:56:00AM +0800, Guan-Yu Lin wrote:
> > On Mon, Oct 14, 2024 at 11:56=E2=80=AFPM Alan Stern <stern@rowland.harv=
ard.edu> wrote:
> > > I'm not so sure about this.  By returning early, you prevent the driv=
ers
> > > bound to this device from suspending.  But they can't operate properl=
y
> > > when the system is in a low-power mode.  Won't that cause problems?
> > >
> > > Maybe this really belongs in usb_suspend_device(), and its counterpar=
t
> > > belongs in usb_resume_device().
> > >
> >
> > To my understanding, after the system is suspended, the USB driver
> > will do nothing as the main processor has been suspended. May I check
> > what forms of low power mode and operation we are discussing here?
>
> S3 suspend.  You are right that the driver will do nothing while the
> CPU is suspended.  But what about the times before and after that,
> while the suspend and resume procedures are underway?  The driver
> needs to be told to cancel any ongoing transfers while the system
> suspends and then restart them while the system resumes.
>

Regarding the cancellation of ongoing transfers during suspend, I
believe usb_hcd_flush_endpoint() handles this as discussed below.
Besides calling usb_hcd_flush_endpoint(), are there any other
necessary changes before suspending the driver in our scenario? Maybe
we could discuss setting usb_device_state to USB_STATE_SUSPENDED.
However, my understanding is that this variable reflects the actual
device state. Since the device remains active via the sideband in our
case,  changing usb_device_state seems unnecessary.

> > usb_suspend_device() did close the required port/bus to maintain usb
> > transfer.
>
> I don't know what you mean by that.
>

Nothing special here, I'm just echoing what you've mentioned and
trying to bring up the discussion about usb_hcd_flush_endpoint().

> >  However, there are additional usb_hcd_flush_endpoint() calls
> > aside from usb_suspend_device(). Maybe we should consider not doing
> > those also since some of the endpoints are now handled by the
> > sideband.
>
> Those calls should not be skipped.  If the sideband controller wants
> to handle the endpoints on its own, it can go right ahead.  The main
> controller and the USB core need to know that they shouldn't use the
> endpoint while the system is suspending.
>
> Alan Stern

Got it, let me update the patch and put the related changes into
usb_suspend_device()/usb_resume_device().

Regards,
Guan-Yu


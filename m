Return-Path: <linux-usb+bounces-24019-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D26AB9553
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 06:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DACAB1BC077F
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 04:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E33C19CC3D;
	Fri, 16 May 2025 04:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JYrQ7mk1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52D010E4
	for <linux-usb@vger.kernel.org>; Fri, 16 May 2025 04:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747370819; cv=none; b=o+I67ibhF0AuUvubQWdlJGvkucCsVrwOhLvFsYH4vG6OJHn8zwwVC9OMPR3tiMB/VT7I8itLeFSqXUy8jBdrzxRS0TyCiMe1xC+ZIKgI1il86WL5eeTnHSBfjN5sb30IYWWoCvEnCt/T/iQkx9LgDXw+MJLr+zC2HyYdKowcshU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747370819; c=relaxed/simple;
	bh=YVuTc2bSEf4nvi4SFTWj2WF2nu6sLlHBK3XBb/RYm80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XrI6d4Lm3SRTRCksqRh1RHD/x9/mhCxVVR0DQrlb5h/+OWhQQS3iNaakCG/IqVpvsjeZM9Y5BLRPA3rZeyqpwoLbWJbMZ0Kd8o+0XJPeE7lUWwY10rexTYR942Z9qpwEG4FOCS609z1g5MipT/hvq8ApD7jZM1ADz3ae43xf/oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JYrQ7mk1; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5fce6c7598bso6658a12.0
        for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 21:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747370816; x=1747975616; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2p0J63BoeaEvteCr8KS2NoqHGRsgMBWEa842OReu8K8=;
        b=JYrQ7mk1ucg2AijvN4hL4ITFM31ibFWr3SRJ027uMMA7uMMJsvWrrLe464PXCzf6aK
         uqHryffKOQR7BgITf9YT0wDpL49c8RLkcn3pHRQ/DfDDkxr0D8XkFCret+Y4+JUTBLWz
         v01Tm18if45qqCJDBYgRE/PZ9eASV6If8NRMAq9YTdUR127ozFoIxGOslxHN/IS+m0hB
         TsWvzc4Wy4nC05UiCRaB6Wv4bVmV1XdyYCegbTwmyBz7+Mrdrhf0xtwmkxtopG/hXqE7
         mDqnI4TsZVT2VYjL58eyOLQg/LRg4YxG48ZoIFqVdLTNFlrnQk3BeFluQo/y50c86Smz
         SaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747370816; x=1747975616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2p0J63BoeaEvteCr8KS2NoqHGRsgMBWEa842OReu8K8=;
        b=bVMui3QsoS3fP9+fcKkBxwQNDY0eTYFrqAhCQnSsBWpjNv9ecJqZxfXbxxPVnilsOU
         hcQnTJmReQ9vc1PY+2Fk7YYgECpqfBWjf5TbEWJ1jV6FqnabEtck7nBsV/tqDSQUzHn7
         vkhHZ6htvGD4fLTe1zMbsSlhJpmeLTmyO4djPnwIUIAXSa7q7NQ1G2obrFkdJB0Xz8YZ
         4ybK42jLYQMWgxoin3GbuLGy/dqSmwftTE/gteegPmX9qAvI0o1Fs17a7gxOJHojHQn6
         kLC5795HuTqgPrfuLWSEeAqc/iy4qHqlA2QlWeukdvQPrUBS739ktUhsY5XC1NhzX1o4
         /SCg==
X-Forwarded-Encrypted: i=1; AJvYcCVg8dO1ZcAtrIZGCjQktyN37orR3XIhivq4yhjzL4+5w4HQwiUrd0uvuV9RBHpk+D4FBK8lirBx/Po=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNGf9/mYIvVCTSJaP2r0rHwca2ASjXO9xaFV/VsSDpECnvVgYe
	krJkPu0BuMgc9dBbKSqgZ8lYAerI2PycbUCycO413JU63VlFOqE83F2SMg3FyMHLWXizk16DkSZ
	NEs9O2kPO00SaXyBj/0spFBbhDk+INhRt2qdfBami
X-Gm-Gg: ASbGncsLJoSbbkV+CKpN+JmgnGiyshpHCSIb1AAnL59ycmSOutq6Cp1PJVUqK8jXtkn
	kNxUkOnJtTtaK7EdOtmLeopSMAtJdy7+9EtRTEaUFfdxJJjNJZkuuKI/pnXFvqzkoMWGKfJi1KG
	+dqGQAOqDucq9vPIF62pZTXT2Wd72on1fu3CiudpPe0DsR6xwsWY/0K60=
X-Google-Smtp-Source: AGHT+IFnmoFOBw17NS2NeC02qMp4/ejkZq6GrfrN6F7Vp/sqYPTFxrI/Eg+hDjqnmiO4OTE0pVaJT9sRsUCUWjBbxJ4=
X-Received: by 2002:a50:c049:0:b0:5fd:28:c3f6 with SMTP id 4fb4d7f45d1cf-5ffc9dbe5b8mr187295a12.4.1747370815935;
 Thu, 15 May 2025 21:46:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416144917.16822-1-guanyulin@google.com> <20250416144917.16822-3-guanyulin@google.com>
 <2025042540-implode-yelp-b8e5@gregkh>
In-Reply-To: <2025042540-implode-yelp-b8e5@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Fri, 16 May 2025 12:45:00 +0800
X-Gm-Features: AX0GCFtgmPfhoBhTfthJn2kGFoSwJy9bgtoOW1SPfO4jiDRojCDEDAC7W0affGo
Message-ID: <CAOuDEK1SUMBdxq49G6UxB_DubbM78xUe3w4V062AJ1Ok1NfCHg@mail.gmail.com>
Subject: Re: [PATCH v12 2/4] usb: add apis for offload usage tracking
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, stern@rowland.harvard.edu, sumit.garg@kernel.org, 
	gargaditya08@live.com, kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, 
	quic_zijuhu@quicinc.com, andriy.shevchenko@linux.intel.com, 
	ben@decadent.org.uk, broonie@kernel.org, quic_wcheng@quicinc.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 7:12=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Apr 16, 2025 at 02:43:02PM +0000, Guan-Yu Lin wrote:
> > +int usb_offload_put(struct usb_device *udev)
> > +{
> > +     int ret;
> > +
> > +     if (udev->state =3D=3D USB_STATE_NOTATTACHED ||
> > +                     udev->state =3D=3D USB_STATE_SUSPENDED)
> > +             return -EAGAIN;
>
> What's to prevent the state of the device from changing right after you
> check for this?
>

The caller of usb_offload_put() should hold the device lock, so I
think the state of the usb device will remain the same within
usb_offload_put().

> And why -EAGAIN, you don't mention that in the comment for the function.
>
> Also, to pile on, sorry, the coding style needs to be fixed up here :)
>

I'll separate these 2 states into two error handling checks and
provide appropriate error code respectively. Thanks for your advice.

> > +bool usb_offload_check(struct usb_device *udev)
> > +{
> > +     struct usb_device *child;
> > +     bool active;
> > +     int port1;
> > +
> > +     usb_hub_for_each_child(udev, port1, child) {
>
> No locking is needed for this loop at all?  What happens if a device is
> added or removed while it is looping?
>

Currently the expectation is that all the downstream usb devices
should either go to suspend or be marked as "offload_at_suspend".
Based on this, is there still a chance that usb devices are being
added or removed? My understanding is device addition/removal requires
locks for the upstream usb device, which we've already acquired before
entering usb_offload_check().

> > +             device_lock(&child->dev);
> > +             active =3D usb_offload_check(child);
> > +             device_unlock(&child->dev);
> > +             if (active)
> > +                     return true;
> > +     }
> > +
> > +     return !!udev->offload_usage;
>
> But the state can change right afterwards, so no one can do anything
> with this value, right?  What is is used for?
>
> thanks,
>
> greg k-h

If we could ensure that all the downstream usb devices satisfy the
following conditions, could the state still change?
1. usb devices either are suspended or marked as "offload_at_suspend".
2. "offload_usage" could only be modified when the usb device is
neither suspended nor marked as "offload_at_suspend".
Regarding point 1, I'll update the function description to state the
function should only be called after we ensure the downstream usb
devices are either suspended or marked as "offload_at_suspend".
Regarding point 2, I'll update the usb_offload_get()/usb_offload_put()
so that "offload_usage" changes only when the device is active and not
marked as "offload_at_suspend".

Regards,
Guan-Yu


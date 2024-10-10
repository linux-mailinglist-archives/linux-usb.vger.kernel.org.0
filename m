Return-Path: <linux-usb+bounces-15969-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A04997C68
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2024 07:30:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CA411C20FD9
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2024 05:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D336819E836;
	Thu, 10 Oct 2024 05:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z2HHIU/n"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B286717BB32
	for <linux-usb@vger.kernel.org>; Thu, 10 Oct 2024 05:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728538230; cv=none; b=Zkr3tNepiq4IAg69mO2E9HGDTai9Gm4P6o+JLFsG27sH18/vl65ZsD/TMhg2iZGtYfaPR8CHixs7009PjXGhE5skOKXy1Vy3KBbmQZTF3b1fSv9tCqsi9wMFWUdgeMcTuL59IJuc16cuV0aSl+yXB0+F/hZktT/zwoV1Dvy3AUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728538230; c=relaxed/simple;
	bh=8vrimWluOky7+aW1AAmoRPcEh4YVHM2VIY8aApW/HZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sIEsE8WgLeMc/pHtxU3FEzbIcqP0W54iiRJxu1mg4xUMZ7nOFR3A9LA32KSXxIHqP3yQCdcuqqtoo2rybsRFTGX9N4gfXz4JeXo0CQvOvBLe/PfOxOUqtHAfAMUAiWIp4GUIDSXU2+iSgpXH32BPc6nFEcBSubWp0AZjQxfq+/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z2HHIU/n; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43111d23e29so94605e9.1
        for <linux-usb@vger.kernel.org>; Wed, 09 Oct 2024 22:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728538226; x=1729143026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Vsbn1te+zu6FOdxZ9pZKFB7CXsrSwAH4ylvWDXfwvY=;
        b=z2HHIU/n2aBAKKWCVeuWNYwBobqKgIz4HQ6ZiX8GDLe9iaTDCqU73JRYNkTrUv1WHs
         3EhoR2rK1nEh2q+H5ShTlt0QrW0MqNo/qShNozrDxrW9xM4Y2Pa8uFrIN0RxM1ow7szK
         WU3EwPR8BWLODS4qmptJE5pFSf5/hZEFtjkQqyamx7AuNcoh3X53IFeOuJGx7ArRROq0
         wHPQhAmGqlLOsTMtrMxo9gP+dZ+nlsxcNo1rNJTSXK6WVogW9GcpjwQ0GjXvsfPWvhWH
         m9QqFcefl3ZFRDircUHVkcUCvazxLoF1ubYHLhIJuSfg5yog2ke+tN6FjUl1aq9IrCb5
         jN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728538226; x=1729143026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Vsbn1te+zu6FOdxZ9pZKFB7CXsrSwAH4ylvWDXfwvY=;
        b=JoEHVujT+VmkjvxBN9uo5gKHfVD7mjwDxhBdZnqspEB2qK9Igm/DrCbUzNIMHk/w9H
         P5CFb1UCsQ5mXsp43k0vW8Wh1D0THfrLoQirRmJyZ7DfsX0SvqN/g7OIQzU4BWy/7XJo
         fLyzOfpnh0qtV+vJjpAZ/dHbLGhIY7PH0gJY6w+obvyRKCx3wUdfNczNKCU1t3z7JhXs
         8m3BeOljxiRaCQan942tXFlcmUIQv8PodAwDsfNvG0wauSREfWA1HXanjnF+Nf9FJ2Gb
         vZlhhbbTQnjMrkMfqKT+yDCW66VQiZEhyizsXH9ZI74qK8eJ/nLuvFFmNtTN3eQ+NBQ9
         jIzg==
X-Forwarded-Encrypted: i=1; AJvYcCVjQ+KC17ab3Il5+l3kKNalIBZgAiMcaoaXLXHEIovMK4aPtplW+GvpJ/V03kVw0UftBGluQmXOgME=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/eiBKlP0k1LxPCc+9Gg6nFKpb5Dbeex/F1r+3Nz1cqbjD/0gc
	uNoxWQwLxBULHgIcAJxAC47BrSx1krdnTFi7XOwj9egSAj/35b8SoqFEE1AGQxDl8qHaDlxMKQt
	MV5TBcXMZJtN7zLm7ArdN2gNYhPgVVP5B/zsc
X-Google-Smtp-Source: AGHT+IExR+gZgJ9+ZjEm/14g9BXJdiE3901d7DoQIau1dkDL3xiK2Bq9ZBBLMMTnoABIwrRyI5YGN5iG92XsC0UWHcA=
X-Received: by 2002:a05:600c:3d88:b0:42c:9e35:cde6 with SMTP id
 5b1f17b1804b1-431161221eemr2758015e9.2.1728538225796; Wed, 09 Oct 2024
 22:30:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009054429.3970438-1-guanyulin@google.com>
 <20241009054429.3970438-4-guanyulin@google.com> <2024100941-limping-dislodge-5c74@gregkh>
In-Reply-To: <2024100941-limping-dislodge-5c74@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Thu, 10 Oct 2024 13:30:00 +0800
Message-ID: <CAOuDEK0a43yLhCoA8iq=stj+QQAmKTCVWGKHvKM6-GPEaN9C3g@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] usb: add apis for sideband uasge tracking
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thinh.Nguyen@synopsys.com, mathias.nyman@intel.com, 
	stern@rowland.harvard.edu, elder@kernel.org, oneukum@suse.com, 
	yajun.deng@linux.dev, dianders@chromium.org, kekrby@gmail.com, perex@perex.cz, 
	tiwai@suse.com, tj@kernel.org, stanley_chang@realtek.com, 
	andreyknvl@gmail.com, christophe.jaillet@wanadoo.fr, 
	quic_jjohnson@quicinc.com, ricardo@marliere.net, grundler@chromium.org, 
	niko.mauno@vaisala.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, badhri@google.com, 
	albertccwang@google.com, quic_wcheng@quicinc.com, pumahsu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 8:44=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Wed, Oct 09, 2024 at 05:42:57AM +0000, Guan-Yu Lin wrote:
> > +void usb_sideband_get(struct usb_device *udev)
> > +{
> > +     struct usb_device *parent =3D udev;
> > +
> > +     do {
> > +             atomic_inc(&parent->sb_usage_count);
>
> As this is a reference count, use refcount_t please.

Acknowledged, will change it in the next patch. Thanks for the guidance.

>
> > +             parent =3D parent->parent;
> > +     } while (parent);
>
> Woah, walking up the device chain?  That should not be needed, or if so,
> then each device's "usage count" is pointless.
>

Say a hub X with usb devices A,B,C attached on it, where usb device A
is actively used by sideband now. We'd like to introduce a mechanism
so that hub X won't have to iterate through all its children to
determine sideband activities under this usb device tree. This problem
is similar to runtime suspending a device, where rpm uses
power.usage_count for tracking activity of the device itself and
power.child_count to check the children's activity. In our scenario,
we don't see the need to separate activities on the device itself or
on its children. So we combine two counters in rpm as sb_usage_count,
denoting the sideband activities under a specific usb device. We have
to keep a counter in each device so that we won't influence the usb
devices that aren't controlled by a sideband.
When sideband activity changes on a usb device, its usb device parents
should all get notified to maintain the correctness of sb_usage_count.
This notifying process creates the procedure to walk up the device
chain.

> > +bool usb_sideband_check(struct usb_device *udev)
> > +{
> > +     return !!atomic_read(&udev->sb_usage_count);
>
> And what happens if it changes right after you make this call?  This
> feels racy and broken.
>

Seems like we need a mechanism to block any new sideband access after
the usb device has been suspended. How about adding a lock during the
period when the usb device is suspended? Do you think this is the
correct direction to address the race condition?

> > @@ -731,6 +732,8 @@ struct usb_device {
> >
> >       u16 hub_delay;
> >       unsigned use_generic_driver:1;
> > +
> > +     atomic_t sb_usage_count;
>
> Why is this on the device and not the interface that is bound to the
> driver that is doing this work?
>
> thanks,
>
> greg k-h

If the count is bound on the usb interface, I'm afraid that the
sideband information couldn't be broadcasted across its usb device
parents. Do you have some insight on how we can achieve this?

Regards,
Guan-Yu


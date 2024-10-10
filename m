Return-Path: <linux-usb+bounces-15986-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 531EE998D2D
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2024 18:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1513EB2AF35
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2024 16:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF6D1CDFAE;
	Thu, 10 Oct 2024 16:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wNkYgeIA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1071CEADB
	for <linux-usb@vger.kernel.org>; Thu, 10 Oct 2024 16:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728576891; cv=none; b=E7whB123w5fOCcVqXEKfqLo55RrlT4dbWM7bzrgowGlJR8KKmCyUp3iaeXyXw5UhbrYLvOl3oXrQ3UUoUgzPWl1dHj0EMvFpamaLDjXvDjWktrdoRulkmt7UT2xUq94sr7iQ5e0X5SE5RRJ2V2CBvm2scVGofrAc0zV35M8ITwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728576891; c=relaxed/simple;
	bh=OBL7S4ZPXi4nh1gvreOkVV7mExAlKQxlmb2J6M+OuX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K7vQGvlD/1K3Mvn3beQTd3c3X0Wx9sAXrgYvtpoduUDQXNgeKRu+N6M4TgwXLZLYXkGfioOhMFRaNxx3EhKEQY40JG4+8YQLXf84aQKuCCe4c2JM5Y8DHTqfq8hpqhAKNLgFkdfRAcr3vWgYMV6QmaDVrDxZpTdD/EAtManeRog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wNkYgeIA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-431157f7e80so260655e9.1
        for <linux-usb@vger.kernel.org>; Thu, 10 Oct 2024 09:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728576887; x=1729181687; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2rpMQ1Sj1SZzdAaEbTPTB8P6Feg0PtFH01l/+GOddc=;
        b=wNkYgeIAV8GYFz8IN2oNbgbQYWvs7VUHUOH564FUPY1PEHR+qUYtf8xaVxeP2RG5FL
         d3gS14H4heTcdjVfQM7kpSjAMFdOPXWy2D9yRyRrBJV9mDH2UDKwzxCzxYejUJddp/WO
         fA86wHLgeQ9egHqcjxqwzb+SZKOSaDsEu50IpW44+IdC78y43sgGxdIkbww3URPQa7V3
         RPVrhh9vNOEHPV2GZFT3Sk85k4aMe8TZfm42KbwnX9JpVNR5MnxOx1lqmgWW2LtMGA+v
         lECgf4U9GvsHzQp3KuTtaeMWY78zuMkszfdz4k6qmkMGlhB1AGQfbqWZhCxeSUcjaI+i
         nMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728576887; x=1729181687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2rpMQ1Sj1SZzdAaEbTPTB8P6Feg0PtFH01l/+GOddc=;
        b=Q9SLq14+pO66FXDcPDJxZE+nBL9vd5b3dwJlOO/RkyAxMvpyrMiwSACw+N/LSAscal
         KOqYx3uRbmbz+Ddtwx+D64bhQHdTwUma5QHoRdBvCE6kx2pdy2QCbNlHoNQ8D6tQYhl4
         jjy0K3cZfmFe0xtx09Hjh69KubpklbP3pvd9Rn0403BkSIIrOEJfdC0Yb88BY7+1yISr
         QJBmhGU9FDih2+SsdVS0rRfPwGe0xV3Joj3zyDrGURUTq+3QIoEKmV6S6iH2fgrvo3tg
         jslHEuXjiASxTbKGRDbMP0tnsaBkwUFrNwzbVdI3jUwZoMoDwFtPM6uPDZUa1m9aA1lI
         1g/w==
X-Forwarded-Encrypted: i=1; AJvYcCVoHxW+Txa1eUTpjtzkswUZwFuqoLzNC5jMVYYypVSAb/94ro/IpX9IC6sLBMrcHWSlp3Ejcuqnk3k=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb7feHpMOaUd5dlzRTxM4gLV83RUFT5CbkLAmnGQ32vJaqpWRP
	9fFf4Mdywh8ZFSbS0g9qXetgRWd2wD2O3yXlEQ0Cwbctz2/vAeggXxWYCG3KPmB/zz7N5y2jIK4
	1phWKFLf1zCJS5OzXM4VScWgQTDTTl2HLMi9/
X-Google-Smtp-Source: AGHT+IFCoXuxIhYmSezUFTHTbGhBv5UKJoGGRBf5ZC/uoCvUww9Rczr0gkl6wURytQVhyXkN7Iku3rEVM5JKdKcfHbc=
X-Received: by 2002:a05:600c:3482:b0:426:66a0:6df6 with SMTP id
 5b1f17b1804b1-431160a6792mr5412705e9.0.1728576887148; Thu, 10 Oct 2024
 09:14:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009054429.3970438-1-guanyulin@google.com>
 <20241009054429.3970438-4-guanyulin@google.com> <2024100941-limping-dislodge-5c74@gregkh>
 <CAOuDEK0a43yLhCoA8iq=stj+QQAmKTCVWGKHvKM6-GPEaN9C3g@mail.gmail.com> <2024101021-vertigo-gopher-e487@gregkh>
In-Reply-To: <2024101021-vertigo-gopher-e487@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Fri, 11 Oct 2024 00:14:00 +0800
Message-ID: <CAOuDEK01Ke9KZqPf6KOfXaAQRRvw-y0Vagd9NrP8e8_EG-w52g@mail.gmail.com>
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

On Thu, Oct 10, 2024 at 2:33=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Oct 10, 2024 at 01:30:00PM +0800, Guan-Yu Lin wrote:
> > On Wed, Oct 9, 2024 at 8:44=E2=80=AFPM Greg KH <gregkh@linuxfoundation.=
org> wrote:
> > >
> > > On Wed, Oct 09, 2024 at 05:42:57AM +0000, Guan-Yu Lin wrote:
> > > > +             parent =3D parent->parent;
> > > > +     } while (parent);
> > >
> > > Woah, walking up the device chain?  That should not be needed, or if =
so,
> > > then each device's "usage count" is pointless.
> > >
> >
> > Say a hub X with usb devices A,B,C attached on it, where usb device A
> > is actively used by sideband now. We'd like to introduce a mechanism
> > so that hub X won't have to iterate through all its children to
> > determine sideband activities under this usb device tree.
>
> Why would a hub care?
>

Without the information of sideband activities on the usb devices
connected to the hub, the hub couldn't determine if it could suspend
or not.

> > This problem
> > is similar to runtime suspending a device, where rpm uses
> > power.usage_count for tracking activity of the device itself and
> > power.child_count to check the children's activity. In our scenario,
> > we don't see the need to separate activities on the device itself or
> > on its children.
>
> But that's exactly what is needed here, if a hub wants to know what is
> happening on a child device, it should just walk the list of children
> and look :)
>
> > So we combine two counters in rpm as sb_usage_count,
>
> Combining counters is almost always never a good idea and will come back
> to bite you in the end.  Memory isn't an issue here, speed isn't an
> issue here, so why not just do it properly?
>

By combining the two comments above, my understanding is that we should eit=
her:
1. separating the counter to one recording the sideband activity of
itself, one for its children.
2. walk the list of children to check sideband activities on demand.
Please correct me if I mistake your messages.

> > denoting the sideband activities under a specific usb device. We have
> > to keep a counter in each device so that we won't influence the usb
> > devices that aren't controlled by a sideband.
>
> I can understand that for the device being "controlled" by a sideband,
> but that's it.
>
> > When sideband activity changes on a usb device, its usb device parents
> > should all get notified to maintain the correctness of sb_usage_count.
>
> Why "should" they?  They shouldn't really care.
>

Hubs need the sideband activity information on downstream usb devices,
so that the hub won't suspend the upstream usb port when there is a
sideband accessing the usb device connected to it.

> > This notifying process creates the procedure to walk up the device
> > chain.
>
> You aren't notifying anyone, you are just incrementing a count that can
> change at any moment in time.
>

Apologies for the misleading word selection, by notify I mean changing
the counter.

> > > > +bool usb_sideband_check(struct usb_device *udev)
> > > > +{
> > > > +     return !!atomic_read(&udev->sb_usage_count);
> > >
> > > And what happens if it changes right after you make this call?  This
> > > feels racy and broken.
> > >
> >
> > Seems like we need a mechanism to block any new sideband access after
> > the usb device has been suspended. How about adding a lock during the
> > period when the usb device is suspended? Do you think this is the
> > correct direction to address the race condition?
>
> I don't know, as I don't know exactly what you are going to do with this
> information.  But as-is, you can't just go "let's put an atomic variable
> in there to make it race free" as that's just not going to work.
>

Agree that changing the variable to atomic wouldn't resolve race
conditions. Let me identify and mark critical sections in the next
patchset.

> > > > @@ -731,6 +732,8 @@ struct usb_device {
> > > >
> > > >       u16 hub_delay;
> > > >       unsigned use_generic_driver:1;
> > > > +
> > > > +     atomic_t sb_usage_count;
> > >
> > > Why is this on the device and not the interface that is bound to the
> > > driver that is doing this work?
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > If the count is bound on the usb interface, I'm afraid that the
> > sideband information couldn't be broadcasted across its usb device
> > parents. Do you have some insight on how we can achieve this?
>
> But the driver that is "sideband" is bound to the interface, not the
> device, right?  Or is it the device?
>
> And again, nothing is being "broadcasted" here, it's just a variable to
> be read at random times and can change randomly :)
>
> thanks,
>
> greg k-h

By looking at the comment in xhci-sideband.c, I think the sideband is
bound to an usb device instead of an usb interface. Maybe Mathias or
Wesley could provide more details on this.
/**
 * xhci_sideband_register - register a sideband for a usb device
 * @udev: usb device to be accessed via sideband
...
 */

Regards,
Guan-Yu


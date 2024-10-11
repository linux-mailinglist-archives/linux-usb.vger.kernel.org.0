Return-Path: <linux-usb+bounces-16070-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF425999E03
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 09:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A8BEB20BEE
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 07:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FA120A5C0;
	Fri, 11 Oct 2024 07:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vRPpw9HG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE6B209F35
	for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 07:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728632062; cv=none; b=YzTDoMuM8EbGGKzm/xYdn8wVVHGBJMXG4VVWVEKaCzVOZ49dqRafYW2o8rt9nvBrFpKgB7zQFjCfp9T+RBwrWMI+ZTe3wdJWrZR3VGd2IV8xXU5zfakVmr20bd7ITbccq3u77kJc5CcZ/vnUhflfGjmP/trT44wGTqDnFIlGyX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728632062; c=relaxed/simple;
	bh=Qy0LLFATddTafMJq6Vvfr76VnyiiIqLudnGiW9eZgY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LjzDRrvFmAYi+CxScHBa8hHoPaG3VNjQaIIpOp3yDoNV0180wOz9QyqB4gWZDQD5NLxI1hdL5J/Dr81qoQ5BXgP9Zxdb59FIdFQwLPVwij4E7OiYW5RjIhz9JbpnF2FffaXgcPK6H2vuDINOTKwCYV0UK9JW3gPiRkAcCP+TQR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vRPpw9HG; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539e19d8c41so2423e87.0
        for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 00:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728632059; x=1729236859; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sx60/28KTVTKI0u7/S+E5XKTOA4G0cKv9kRMalOYIYE=;
        b=vRPpw9HGMltWMXqTz6d7lXx17v9SWazrdXRgyE4CtuaKId39RYo4X2WaTSMlsu0Kqy
         YqgvAHVv4w5shmqKA/w2OHQWRs0vJ2+8c+piu9LutGNMzA28I4079eiEyS5KJxf6Dpgu
         MicMEDDeTiwyejsUvo6WqtgbSuHD8raFC8avUNhwvLMpcSnfLauq6DMzvWKRwHNIex7o
         6fQf0+QH3n+pQnOemY7gx5iwrQNp+3jsvm9pHjwP1WORtdIzk/OmYqq2Jo5j9I+/tyQE
         of9yI8ZuAEar8gQNAqDDCo5Fn8Ws6Byrw76+7iP7CMx7bqLW7+9U3j/dmi+7KhEnCxj4
         Qm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728632059; x=1729236859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sx60/28KTVTKI0u7/S+E5XKTOA4G0cKv9kRMalOYIYE=;
        b=kIXg37s0DKi9HXJeN1O7lwuRXoMLdoAUcsVC9Oi2bCQFQ47gjVx+Oz0GdkFgce08W1
         oDuxSGVx777OCGxeD3uoSRxd54YXRC8+jbTvzIAnbISaa0Th8acQ7+Zp6jCFQ4Xm7pq1
         n5zuuMhSL9FpbjagZHVtNDjP6sD87jjz0RyazwCp29BQ+nEkk9M1YWmb2YSILKm03lkg
         bcN3ygxsS5S4j2pvRuygkC/r6+8ByGE0YmcnHLInihJLH/Zxb1rzkLH6sQ0Aa6yv82xe
         vKrG4ojRbYucmxAgsjInBgNfV6yjDSDqgW40rtowLofXAaS9G4RZVES9y9x/19snm7Oy
         oTbg==
X-Forwarded-Encrypted: i=1; AJvYcCVhv0Kg9YbPI9z032Mv+5OQIO5HvHiws7noHecLFHhjBlmwdbNCclbYVzkPi626pDnseWhgLjZDqhI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP+DnFfL5YYlp+b4Awpc81DjHUnuqR21S9xN+HcjY0nSx8KrtO
	pWdEtwgd5nQpdErc/koDlHM72FBjr970bljbkHUmUZJFu70s6pm/3rQU+tfXd6+QKpftTlWwgAe
	RdaHD0NizuCa96qnJirp53rtTgasYu0co87np
X-Google-Smtp-Source: AGHT+IGfpV3qxc4qsAXRPVCDs83VmLUNubRxLI1Q6MjJF024wIwXo3BWk5JLGxKzUPesHt77J9m5jl1i6vVJInSUXG8=
X-Received: by 2002:a05:6512:a87:b0:536:52dc:291f with SMTP id
 2adb3069b0e04-539da5be9e9mr64292e87.1.1728632059010; Fri, 11 Oct 2024
 00:34:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009054429.3970438-1-guanyulin@google.com>
 <20241009054429.3970438-4-guanyulin@google.com> <2024100941-limping-dislodge-5c74@gregkh>
 <CAOuDEK0a43yLhCoA8iq=stj+QQAmKTCVWGKHvKM6-GPEaN9C3g@mail.gmail.com>
 <2024101021-vertigo-gopher-e487@gregkh> <CAOuDEK01Ke9KZqPf6KOfXaAQRRvw-y0Vagd9NrP8e8_EG-w52g@mail.gmail.com>
 <2024101104-feminist-gulf-97e3@gregkh>
In-Reply-To: <2024101104-feminist-gulf-97e3@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Fri, 11 Oct 2024 15:33:00 +0800
Message-ID: <CAOuDEK1B6cz58vcL=xx60C9Mdy57QqahRgFvRRLW-SHpuYDDHA@mail.gmail.com>
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

On Fri, Oct 11, 2024 at 12:40=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Fri, Oct 11, 2024 at 12:14:00AM +0800, Guan-Yu Lin wrote:
> > On Thu, Oct 10, 2024 at 2:33=E2=80=AFPM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Thu, Oct 10, 2024 at 01:30:00PM +0800, Guan-Yu Lin wrote:
> > > > On Wed, Oct 9, 2024 at 8:44=E2=80=AFPM Greg KH <gregkh@linuxfoundat=
ion.org> wrote:
> > > > >
> > > > > On Wed, Oct 09, 2024 at 05:42:57AM +0000, Guan-Yu Lin wrote:
> > > > > > +             parent =3D parent->parent;
> > > > > > +     } while (parent);
> > > > >
> > > > > Woah, walking up the device chain?  That should not be needed, or=
 if so,
> > > > > then each device's "usage count" is pointless.
> > > > >
> > > >
> > > > Say a hub X with usb devices A,B,C attached on it, where usb device=
 A
> > > > is actively used by sideband now. We'd like to introduce a mechanis=
m
> > > > so that hub X won't have to iterate through all its children to
> > > > determine sideband activities under this usb device tree.
> > >
> > > Why would a hub care?
> > >
> >
> > Without the information of sideband activities on the usb devices
> > connected to the hub, the hub couldn't determine if it could suspend
> > or not.
>
> You are talking about an "internal" hub, right?  And isn't this already
> covered by the original sideband patchset?  If not, how is power
> management being handled there?
>

I'm referring to both internal and external hubs. As a sideband is
designed to handle the transfers on specific endpoints, I think
there's a possibility the usb device controlled by the sideband is
connected to the host controller by a hierarchy of usb hubs. The
current proposal of sideband, AFAIK, only supports sideband accessing
usb devices when the system is active, whereas now we're proposing
patchset to enable sideband access when the system is in sleep.

> > > > This problem
> > > > is similar to runtime suspending a device, where rpm uses
> > > > power.usage_count for tracking activity of the device itself and
> > > > power.child_count to check the children's activity. In our scenario=
,
> > > > we don't see the need to separate activities on the device itself o=
r
> > > > on its children.
> > >
> > > But that's exactly what is needed here, if a hub wants to know what i=
s
> > > happening on a child device, it should just walk the list of children
> > > and look :)
> > >
> > > > So we combine two counters in rpm as sb_usage_count,
> > >
> > > Combining counters is almost always never a good idea and will come b=
ack
> > > to bite you in the end.  Memory isn't an issue here, speed isn't an
> > > issue here, so why not just do it properly?
> > >
> >
> > By combining the two comments above, my understanding is that we should=
 either:
> > 1. separating the counter to one recording the sideband activity of
> > itself, one for its children.
> > 2. walk the list of children to check sideband activities on demand.
> > Please correct me if I mistake your messages.
>
> I think 2 is better, as this is infrequent and should be pretty fast to
> do when needed, right?  But I really don't care, just don't combine
> things together that shouldn't be combined.
>

Thanks for the clarification, I'll renew the patchset based on the discussi=
ons.

> > > > denoting the sideband activities under a specific usb device. We ha=
ve
> > > > to keep a counter in each device so that we won't influence the usb
> > > > devices that aren't controlled by a sideband.
> > >
> > > I can understand that for the device being "controlled" by a sideband=
,
> > > but that's it.
> > >
> > > > When sideband activity changes on a usb device, its usb device pare=
nts
> > > > should all get notified to maintain the correctness of sb_usage_cou=
nt.
> > >
> > > Why "should" they?  They shouldn't really care.
> > >
> >
> > Hubs need the sideband activity information on downstream usb devices,
> > so that the hub won't suspend the upstream usb port when there is a
> > sideband accessing the usb device connected to it.
>
> Then why doesn't the sideband code just properly mark the "downstream"
> device a being used like any other normal device?  Why is this acting
> "special"?
>
> thanks,
>
> greg k-h

In runtime power management, sidebands could mark a device active by
runtime pm apis as we usually did. However, there will be
ambiguity when we're doing device power management in system suspend.
A usb device being marked as runtime active could be either:
1) actively function through the existing usb driver stacks.
2) accessed by a sideband, where the usb driver stacks in the linux
system aren't involved.
In 1) system should suspend the devices, ports, controllers as normal
because usb transfers are also suspended during system suspend. On the
other hand, in 2) we should keep the necessary device, port,
controller active to support sideband access during system suspend.
Hence, we need the sideband access information of each usb_device
during system power state transition.

Regards,
Guan-Yu


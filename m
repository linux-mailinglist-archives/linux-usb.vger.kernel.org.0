Return-Path: <linux-usb+bounces-16922-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A9B9B8644
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 23:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 385E1B216F8
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 22:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068211CF7B7;
	Thu, 31 Oct 2024 22:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lw5aNuTO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E4019CC05
	for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 22:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730414944; cv=none; b=g/puwlQlUKFJVsgnTx5y+nBHnmY12D+XEC02yMzaLfiJG7ypzIFzwdH+9QKfCvpre7MVKXLi+x08v5wRJpfN8GKWKl5Hsrn5zlVj/gQcceviPUDCmI5BNPtPaeYGdl6AWj5HHYNpDS/nhHGsOdkWaVJrNL893LbUpOzhCyWiwGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730414944; c=relaxed/simple;
	bh=YMlzBx+z9aaRa2t9CsTC7J8zOTayJPPNSKPZfiTQhdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mho5/oRmb9mmTUCGJPBnigUmRtjQUEhuF5T4wczX6o2/4vBJpwW1LJumb9n9fHebdZc05cjTCywrwx6SHIGouUMnTm8tYRHMupPFUtdGdv/SNnvIp4GAg2OmAtNzbgJdRUajGc+SnS49OVvDzbhYhZjjit+pELDAIe4gpULt9hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Lw5aNuTO; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ea053b5929so12011527b3.0
        for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 15:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730414938; x=1731019738; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6qFeMz2fz5TUQHmgzOfA0YHFIKSZWtlwhdHVsEY4Ls=;
        b=Lw5aNuTOr8iU3Dnw0d0wT82RjGt6DanLqK/+HEyFws1VBhQcROVBEImIusR30piiPK
         pOY5xirDgpFsiSP2vVvUCrjZadK60JI3ZtcIJaXucWkkVj7rDe7/Q/8gK7yH2K3XMfoE
         kZ7jQNJEIflDk6sBkH6LI1Wj9apI/aAt1dmek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730414938; x=1731019738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6qFeMz2fz5TUQHmgzOfA0YHFIKSZWtlwhdHVsEY4Ls=;
        b=SeOId2OlXaQDRxN0aZGmTUxZ2Z5H+1JelwVGut9XnCL89dQ2xjDrhXKJjLqsr51oVW
         LgnVUdSlzzN0bRdVvOySRL6p+jgmPjxaW+/LbK3mbwmO8FUOrZ9/KHnq14lun7o1g9Wu
         3pSMirwaHt0irp/WyB+D1irPylESf6PpkB6nzRUw64FccOAJoB/fd6ewa6xS9zmVs/C8
         iSSDPq+Vvo5NSQUHTpjg7hnFxIpyCasHOvwSqTMRyGUW0wZ1T+mQnO/Q0/RuMia1VdbV
         Puq0s7hzCYc2BocvrAe0YKxUIu+fgrAGEZhh3W8bq/FCbObDLpKu9qaUWie0ZLTiqcCe
         qnzA==
X-Forwarded-Encrypted: i=1; AJvYcCUVf9bNp8hT1SMyfHVpQHz6+r2/at+2gitnn4A1hcCJ86IiLEDJG2M33RBBKapBK6BnU6cwvQ/1ljk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMh6RLYzYjX/STA2U9z+3e2wptsTd8Tfq26NZ8yBlfoMwPQK5T
	/pdZQd4G7SwzH1qxStWHmue4GFmjcHEwAVxN4zMVc+ZN6ilof9egdp8k++iv8/cukf5S0U8be/q
	0cQI6IBsq/zodlxbCTpqYJOv+8+AmZNU3EHUp
X-Google-Smtp-Source: AGHT+IEeT+MuyLEbw9zpD7r5OibCxa+4DfQKki/EuwTyOa3LAohYFUTmEiVK47uXYyOB48zQ65odB1tWbGP1fgXoPyY=
X-Received: by 2002:a05:690c:883:b0:6e5:e714:3bdf with SMTP id
 00721157ae682-6ea64a9f501mr20113947b3.5.1730414937682; Thu, 31 Oct 2024
 15:48:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030212854.998318-1-abhishekpandit@chromium.org>
 <20241030142833.v2.3.I439cffc7bf76d94f5850eb85980f1197c4f9154c@changeid> <ZyOVIKGlrlj7kc9-@kuha.fi.intel.com>
In-Reply-To: <ZyOVIKGlrlj7kc9-@kuha.fi.intel.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Thu, 31 Oct 2024 15:48:45 -0700
Message-ID: <CANFp7mX-DkyFqwoaq_4V1XEDBqK7bj6-nz2aJi7idM=Q2TT49w@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] usb: typec: Auto enter control for alternate modes
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: tzungbi@kernel.org, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, dmitry.baryshkov@linaro.org, 
	jthies@google.com, akuchynski@google.com, pmalani@chromium.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 7:33=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Wed, Oct 30, 2024 at 02:28:34PM -0700, Abhishek Pandit-Subedi wrote:
> > Add controls for whether an alternate mode is automatically entered whe=
n
> > a partner connects. The auto_enter control is only available on ports
> > and applies immediately after a partner connects. The default behavior
> > is to enable auto enter and drivers must explicitly disable it.
> >
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > ---
> >
> > (no changes since v1)
> >
> >  Documentation/ABI/testing/sysfs-bus-typec |  9 +++++++
> >  drivers/usb/typec/altmodes/displayport.c  |  6 +++--
> >  drivers/usb/typec/altmodes/thunderbolt.c  |  3 ++-
> >  drivers/usb/typec/class.c                 | 31 +++++++++++++++++++++++
> >  include/linux/usb/typec.h                 |  2 ++
> >  include/linux/usb/typec_altmode.h         |  2 ++
> >  6 files changed, 50 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/ABI/testing/sysfs-bus-typec b/Documentation/=
ABI/testing/sysfs-bus-typec
> > index 205d9c91e2e1..f09d05727b82 100644
> > --- a/Documentation/ABI/testing/sysfs-bus-typec
> > +++ b/Documentation/ABI/testing/sysfs-bus-typec
> > @@ -12,6 +12,15 @@ Description:
> >
> >               Valid values are boolean.
> >
> > +What:                /sys/bus/typec/devices/.../auto_enter
> > +Date:                September 2024
> > +Contact:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > +Description:
> > +             Controls whether a mode will be automatically entered whe=
n a partner is
> > +             connected.
> > +
> > +             This field is only valid and displayed on a port. Valid v=
alues are boolean.
>
> So, why can't this be controlled with the "active" property of the
> port altmode instead? That's why it's there.
>
> Sorry if I missed something in v1 related to this question.

There was a bit of discussion around this in another patch in v1:
https://patchwork.kernel.org/project/chrome-platform/patch/20240925092505.8=
.Ic14738918e3d026fa2d85e95fb68f8e07a0828d0@changeid/
And this patch is probably a good place to continue that discussion.

With the way altmodes drivers currently work, they will auto-enter
when probed. So if you have a partner that supports both displayport
and thunderbolt, they will both attempt to auto-enter on probe. I
think I could use the `active` field instead so that the port altmode
blocks entry until userspace enables it -- this would avoid the need
to add one more sysfs ABI. I'll actually go ahead and do this for the
next patch series I send up.

However, the underlying problem I'm trying to solve still exists: how
do you choose a specific altmode to enter if there are multiple to
choose from? I tried to implement a method that first tries USB4 and
then Thunderbolt and then DP but I realized that the altmode drivers
don't necessarily bind immediately after a partner altmode is
registered so I can't just call `activate` (since no ops are attached
to the partner altmode yet). Do you have any thoughts about how to
handle multiple modes as well as how to handle fallback mode entry
(i.e. thunderbolt fails so you try DPAM next)?

>
> thanks,
>
> --
> heikki


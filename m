Return-Path: <linux-usb+bounces-23975-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF17AB84F4
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 13:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86108173FD4
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 11:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420C7298CC1;
	Thu, 15 May 2025 11:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ICsdN3L3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1420929671C
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 11:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747308567; cv=none; b=IF0q1nQfL0Z55kqCH7f80ljsTfHqnyFJcQc/eBf+K7p0w6HhNIRaUfipTYKPHzTpqlDdyKa6l5v0+T9/3d2/gjrW8g65TgcYsSpjkcpa1voxmVyzJTPQv+BvP/rwI7tKm+EYStI2l8x7LG560Mef0wrO8lDJP3aRl31ZS13Dli8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747308567; c=relaxed/simple;
	bh=3oRgJw3evCQ0RL3v3GCElsf+gGhnQ22AKjk2UoQk2F8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mz3u1ynvjTuAKhYvpUX1GvJnlwD1zzVFC9LevhmYLxX9JGOzen/kGbT3E0lGefhKB6Xqz/xP9iqTEltaJq7RYQw3nd0xXX0ZiLtDdy5FgUsVZg0Cc++QFT+KH0jkrOG1p3DMik7gkAmXJqPwf7WCtYKbO0IbAGxkO/ZDmvcioaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ICsdN3L3; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso6476a12.1
        for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 04:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747308564; x=1747913364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzRBye7mYNx2WfqoxFyVvS6OH01y5FZb2FkpmaNP4/E=;
        b=ICsdN3L3vgZ4XBd1fV90DXkG1EkHqxBmcYAW+izEluvrVTnFv7iYtSsnda1pjjv3zl
         uP59dWV3+CGq4DJ0vTyrw0D7bhhroXoO6+DJoqY4g1/kFfwCHvMdNTUyQhNs9RWPJv4I
         h6JI+LzPsnxh76zCDRa3zDGbQZ7Kz6W0QQ/zdSlZ3I/YQ8xo35pRk9ICk4YDVpEZjDaC
         zGQOdeVxyzaqgcSCCEMVRLOi9Z4kowLHU5JQmiT/NP/dBYam6Ccg6kNKQvNj1Hfowm+Q
         4uvs5QpiTI0cINTxx+GD/vOf74srAdJzg5cVNKLE//FtHJaKOmBtkAgCp2eMHLAlPwz/
         GoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747308564; x=1747913364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QzRBye7mYNx2WfqoxFyVvS6OH01y5FZb2FkpmaNP4/E=;
        b=Xc+jMsCF+oHtGvbKhatt56ZYBONxTVqfOGx3Nlia5HrJXy1FTMOk6FfOpNUwhw/GEs
         zVgWyzmn11eguno6+OF7CyxYfNg3s922SGElvaCXxbHUY1/2Bp38ag82LyJPtPgbsDT3
         Kc/rZ+Jj+O8R1gkC819s3J7o2c2HuVDx7E2ICIGqjsNWeZNtXqcEelxVflCG+O1/cU+j
         RdSRbYYmuekpyzu46kgJQgyQDrTlH+C2RKDHWYOhFsOEnd5ju5uOXzgOvGNa54PTEQg+
         Es6xW41gRUi9ICJ4D5XYq8FsZjIMj/i2bz9re4pZnSBbo0+QVJGvaqXeSbJkVeGgL6mZ
         sSqg==
X-Forwarded-Encrypted: i=1; AJvYcCWvvSqe+MEQJUfp9FYYseHIyxn2hlwkwDokLrbAIaY99IUfvH15NGaENDK+zKhNjQfrEqkod/g8kZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIXTWfcz888WzcdJK5T5S14Cn8uBW0hOqNim0gFGJX/gKjfU0O
	qhaHkjFYfgCloiZPYyUDESUhbSSdyhpRz4d0YWE9MterSleSZKtnO3cwIQFCgkcZGWbQSLc0UIS
	FP2irZouTlwKeBBUYzomFfQjKh1B/wE0u4ZpKAElN
X-Gm-Gg: ASbGncvV7nR3a2UqLUBFCbVCp15jrin6Xu80hh9qDFgtUQwai89lLJdL1UKOj+8dk0H
	VP5VZdtgmpypP2SmemhzsLyvlJARITOXlwyZQf6LoR8PIK7XBH/1dsGjFVvpPklh53Dm62dxMgg
	QFeWbiV7YU7xzkaQosT4Z81h8yJkZ9tB4B+5FiThpLXDiD+iKwPgdQ6gPTp5NoVtdiWMuUuCA=
X-Google-Smtp-Source: AGHT+IHVy/ik0Nx/Ftwe5i9orvHk49YRQhzFLLv+FVTpZQYefrx20dw09KlgkolIzPgb71jbGRhF3cI3fChWmszAhVs=
X-Received: by 2002:a50:f69a:0:b0:5fb:eab6:cdb0 with SMTP id
 4fb4d7f45d1cf-5ffc9db061dmr101970a12.4.1747308564180; Thu, 15 May 2025
 04:29:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416144917.16822-1-guanyulin@google.com> <20250416144917.16822-4-guanyulin@google.com>
 <2025042518-shoplift-garnish-3a69@gregkh>
In-Reply-To: <2025042518-shoplift-garnish-3a69@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Thu, 15 May 2025 19:28:00 +0800
X-Gm-Features: AX0GCFsv2GU_vLXxmUUrchnxLmrX8mWeu2FTRQWhqt42cQtyn9lmqGje1gCTT-Y
Message-ID: <CAOuDEK3k6Xnev_QUihv+XDMd4YDY5fz+6U7qewo=DSyE7duf_w@mail.gmail.com>
Subject: Re: [PATCH v12 3/4] xhci: sideband: add api to trace sideband usage
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, stern@rowland.harvard.edu, sumit.garg@kernel.org, 
	gargaditya08@live.com, kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, 
	quic_zijuhu@quicinc.com, andriy.shevchenko@linux.intel.com, 
	ben@decadent.org.uk, broonie@kernel.org, quic_wcheng@quicinc.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 7:14=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Apr 16, 2025 at 02:43:03PM +0000, Guan-Yu Lin wrote:
> > +bool xhci_sideband_check(struct usb_hcd *hcd)
> > +{
> > +     struct usb_device *udev =3D hcd->self.root_hub;
> > +     bool active;
> > +
> > +     device_lock(&udev->dev);
> > +     active =3D usb_offload_check(udev);
> > +     device_unlock(&udev->dev);
> > +
> > +     return active;
>
> What happens if the value changes right after reading it?  What are you
> going to do with the value?
>

Currently xhci_sideband_check() is only called when the xhci platform
device is going to suspend. Given that the usb devices should be
either already suspended or being marked as "offload_at_suspend" right
now, it should be safe if we ensure that "offload_usage" doesn't
change at this moment. Let me update
usb_offload_get()/usb_offload_put() to achieve this.

> >
> > +     udev =3D sb->vdev->udev;
> > +     device_lock(&udev->dev);
> > +     ret =3D usb_offload_get(udev);
> > +     device_unlock(&udev->dev);
>
> A "raw" call to device_lock/unlock feels rough, and harsh, why doesn't
> the function do that itself?
>
> thanks,
>
> greg k-h

The design is to align with usb_offload_put(). For usb_offload_put(), we
don't need to lock the device when the device state is
USB_STATE_NOTATTACHED. Hence, we put the device_lock()/device_unlock()
outside of usb_offload_get()/usb_offload_put(). Let me also change the
functions to usb_lock_device()/usb_unlock_device() for better coding
style.

Regards,
Guan-Yu


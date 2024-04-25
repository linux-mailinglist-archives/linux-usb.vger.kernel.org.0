Return-Path: <linux-usb+bounces-9777-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7C18B27A9
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 19:37:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1FCBB2189C
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 17:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37B414EC42;
	Thu, 25 Apr 2024 17:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XJ9PStDT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A23C14D710
	for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2024 17:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714066656; cv=none; b=FMPIhA5LkPTwREdHnz02y4ho5UWV1wAOvMouOHFo21eJk2M0ztiBrbEOoeooaHh1BeRKU7c8q1UjPJYJRE/kOLkGtPvwIg3n8+Qz1H3Fz/tVpIygVCUWC3G7KdK+pG16Bb/00lczCB9cD7fsMxUt5bgsWv+4TnmYLVcHz+MHAO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714066656; c=relaxed/simple;
	bh=B3VQQbOwXZfXUmtHrc/wDZo3lxxcsHSUDqcA5obudZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LE5MGVWGqGStRm4bK4zhqQzCuKhwJ4o2boyC+85gclpvJnCETemF9u25Hn5ZLJVe4NAG1Kbp+ULjcxXZuri6HPq0c7u20ckJk3p0T6uT/WjNd2flYqhUYer9045HZ3aFgAV+IwdwYpTZlw+UYkoVURBSYz6mPct4mv9Q1i+EA68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XJ9PStDT; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-571b5fba660so887a12.1
        for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2024 10:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714066653; x=1714671453; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3VQQbOwXZfXUmtHrc/wDZo3lxxcsHSUDqcA5obudZE=;
        b=XJ9PStDT7Y8jirOyfZyIFA//mDF01QzJ/i1+l2MS4UIu7EfvC/h/s0R5QWRDrzx6LX
         aKKNDx4WYv+O8Lo+AZYp9CNX6ZL3gxV3Css62Sp8S7+8S5IDLODsuWPTgChhHmNE2ViT
         Ca48NN1SbWyc7WEPMrn8WHgnklcjeGi3NIMTesqDGcTp6rjvvKdcNb+9A8hSJYm+CPoV
         HTgnZvJlXSv6bTCSXTIXKqecDgOsmf/eZFeE5ZtYO5ZILA5LlO4rCjejf3lkueObwC6g
         Qi8c87B8DLqXcvmRyf+mENC7jGA2OK9LFd+u0N1DNCIKmj5Sk8hk+507CDaHkuRwv2zE
         Cf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714066653; x=1714671453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3VQQbOwXZfXUmtHrc/wDZo3lxxcsHSUDqcA5obudZE=;
        b=RQsM6J8RAlWXy02qIT3E5pm37n6Ep/7QENoPbbNWkcw7Dhvv6EyMTXa+CO5tPu7fKw
         cZOlhv1psxRH5ozUwjv3eyGa7/HrHILvgfKBKpidCI/MmmKbkS9FOwChTbUaIq0cCbeB
         SrcChM9Umfaj7P3HbD31Fh8kcDd9z4YQ3g1TUhFZxpA5XUCqZcRsmvPG0Q/21xHOUS01
         8kN9alZv4Wd4eSDuIFWGFvJzdCseTcqOLs4QWHmiUZnWgD1dn+WRWiM8BSoaglc2MkHv
         ND7X0SfHDThn99WTnirS+zXfh5SB+Mq/umefBDRf2qyVsLKA9Kz6AhngAPpMHfvh8nQt
         r+hw==
X-Forwarded-Encrypted: i=1; AJvYcCX6oFcfbbVdSpBYpo3ODJ0nKeF7NVUzl1iYiteQCJM+nGj21lWt+H7mmUZFg4LOf5xHzOHdpwA3856tsI3rOGzxlAr3cysNpYoR
X-Gm-Message-State: AOJu0Yz2Me1EWidOtceppxuWTGB4fX1mqpHjvpRuhFQ6tiH+af5WFkKW
	u6+KuMlX5XrqQkNPUmqOFHBxoxjmaEo6Fcj/56kdQQxDTF5/5rBBFhBIvKFkInQgJmINp3WPyRB
	H3ZyYB3FDPJaCSJYnQpSOdY9TinGu9NmwqTS5
X-Google-Smtp-Source: AGHT+IFKlAa7j1Xz4j+lOypC9P67WdmU7m5EBPVuI2N+LZ83FdSHLfjKJjWvf5ZCaKEst8Ct8pg/Q8TRbIRqvXn85RA=
X-Received: by 2002:a05:6402:30a1:b0:572:3fb6:3d0c with SMTP id
 df1-20020a05640230a100b005723fb63d0cmr2428edb.4.1714066653043; Thu, 25 Apr
 2024 10:37:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423202356.3372314-2-rdbabiera@google.com> <ZionHYcUvvc865z4@kuha.fi.intel.com>
In-Reply-To: <ZionHYcUvvc865z4@kuha.fi.intel.com>
From: RD Babiera <rdbabiera@google.com>
Date: Thu, 25 Apr 2024 10:37:21 -0700
Message-ID: <CALzBnUHL4kWTQEncWfzNyze25_Ss_Pf8pyR2FOauyoLwNRrrMA@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: tcpm: enforce ready state when queueing
 alt mode vdm
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux@roeck-us.net, gregkh@linuxfoundation.org, hdegoede@redhat.com, 
	badhri@google.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 2:49=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
> I'm probable missing something, but wouldn't it be safer to check
> port->state after grabbing the lock?

I could have been more explicit in describing the deadlock, my bad.
But there are two
threads here:

Thread A starts in the TCPM. It is the port state machine that
transitions to DR_SWAP
and holds port->lock. When it unregisters DisplayPort Alt Mode, it goes int=
o the
DP Alt Mode driver and hangs until any DP Alt Mode work is finished.

Thread B starts in the DP Alt Mode driver. It attempts to call tcpm_enter_m=
ode
and the call to mutex_lock in tcpm_queue_vdm_unlock hangs because Thread A
holds the lock. Thread A will never drop the lock because it waits for Thre=
ad B
to finish.

So, the check is done before grabbing the lock because the thread needs to =
avoid
grabbing the lock in the first place. If port->state changes between
queueing and
sending the message, the VDM state machine will drop the message anyways
because port->state isn't in the ready state as well.

best,
rd


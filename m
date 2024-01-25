Return-Path: <linux-usb+bounces-5520-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4E983D0C8
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jan 2024 00:37:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FA1428F175
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jan 2024 23:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD90134BE;
	Thu, 25 Jan 2024 23:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZrqYoNaC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4A7134A6
	for <linux-usb@vger.kernel.org>; Thu, 25 Jan 2024 23:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706225846; cv=none; b=eNn1HiStBu3rOpbwgpGU0exV6TZEdENE+8OCojvq1Y0xwITH6k8VJi/G0FA5+vZvrqmVx87sE2eX1twfh3+4zT7hJneKUSNrX/Rj2F1r2j1oBsrYb0fGRXKvC0TBi72i5POZ8Y9vLu/RfsyBm3fPJtKdfYlhKVxJI7fgQyaXfZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706225846; c=relaxed/simple;
	bh=0TT8uDLtgFXFefXC65XRlmCrItr6QtCpzz8mfVfY3xQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oEXHPdm38baXwcKUolE0PZWuWlcsAO36mprj8O1vl8JXo3AUOFAV6+b3NFMkDvKCL4RqTcl+gYQ0wXTrYB1pINNl3xaSxVR9nPQr/AJTbozz6vx9ZdRKbHIz+gybJ8N5eRSSidkjWxESIkeOdGrNtOi1ud8flrGbSpBzYv+XOW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZrqYoNaC; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dc25099b084so5015502276.0
        for <linux-usb@vger.kernel.org>; Thu, 25 Jan 2024 15:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706225843; x=1706830643; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TT8uDLtgFXFefXC65XRlmCrItr6QtCpzz8mfVfY3xQ=;
        b=ZrqYoNaCShcbS5z0fDpzMO6us/wcwnMMR7mLvR7NrManFN5gec6EZVAmrv0ECPZYho
         V9RonlzzEAGLYs05Q0ubbjx/GKDZfuHNVxIdfepGizNXHDFP/OhvmZbKW7Zn62Z8kkXT
         6pKd08T4mxBOHnzAHHYfsmx2sb3oMzRY+pk98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706225843; x=1706830643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0TT8uDLtgFXFefXC65XRlmCrItr6QtCpzz8mfVfY3xQ=;
        b=YH8zYrBWdDm1NmzD7hqkzpyLdQ1WQ0KkHa+KJ15D5294kPhb/tOVEPY/mXPvfSGgKn
         a5i6ZKJHN0PVUDo+3rOmdYNIRW9r3u9+c1pGSTtPwyhU7Re0Ey2NVtqrHSerGh70Swvq
         o66Q850fSP3XIu+5Dg1v5iS5+G6kPU4p5XP2AH+XhSrktzvN3HwFGYwVLTXDxF6m/Nlj
         pBMldgqovq88yOgnDJ+Y7CZFbZHxrUiXH8XYHCn3qBMEds+m8xVLnPMFMdw7JDyVYF6G
         T8xQx3JHkD7jfrnGJiJDYopuLCieW1N1gSQZW0GKKooQlaV2V/G8gEC3BxWEkfBgE3N/
         zocg==
X-Gm-Message-State: AOJu0Yws7fbvbOYwDpKP5QSU4kqPI3omGbZkdOkIa2Tn0cHwcp6tCT4L
	fuwS2dUwxGjqjKoTUJuYohQbrwtDJx3ZJHd0B0g5lx2CfYHEegXFmX7fcvP7CESdpSID4yCFxpf
	MmxidKU2Mo65C3nSXzmlYfyLA9hQW5oALduF7
X-Google-Smtp-Source: AGHT+IGw9fvQRYsU99IPid7NOmblz0Xm7GC6a0LqHLoNtaj1Fgc4myxH48JDKSi0D4GBSOLZ77Hk5XGOmfDEEA49P3M=
X-Received: by 2002:a25:9b09:0:b0:dc6:2d45:621e with SMTP id
 y9-20020a259b09000000b00dc62d45621emr503598ybn.107.1706225843691; Thu, 25 Jan
 2024 15:37:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123223039.1471557-1-abhishekpandit@google.com>
 <20240123143026.v1.1.Iacf5570a66b82b73ef03daa6557e2fc0db10266a@changeid>
 <CACeCKaftJSGba3ebs58=cB5aRLuOnbvhQX2V6+5=t9GPC08_Uw@mail.gmail.com>
 <ZbEV/qp/EhUkHVhA@kuha.fi.intel.com> <2024012405-stung-freckles-e196@gregkh>
 <CANFp7mVEF36TCb_4vGbF-0wM-Vn4agT6NXVOrnnDSC0JVpnLmg@mail.gmail.com> <2024012525-alienate-frown-916b@gregkh>
In-Reply-To: <2024012525-alienate-frown-916b@gregkh>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Thu, 25 Jan 2024 15:37:12 -0800
Message-ID: <CANFp7mVJmrWat4Ph-Sj7=R+e6B+e0wDDrKGWCc4Psvi4Sk5KFw@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] usb: typec: ucsi: Limit read size on v1.2
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Prashant Malani <pmalani@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@google.com>, linux-usb@vger.kernel.org, jthies@google.com, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Hans de Goede <hdegoede@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Saranya Gopal <saranya.gopal@intel.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 3:16=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jan 24, 2024 at 10:59:28AM -0800, Abhishek Pandit-Subedi wrote:
> > Ack. Will make dev_dbg on the next iteration.
> >
> > This seems like a good addition to the style guide too:
> > https://www.kernel.org/doc/html/v6.7/process/coding-style.html#printing=
-kernel-messages.
> > "When drivers are working properly, they are quiet. Prefer to use
> > DEBUG messages unless something is wrong."
> >
> > What do you think Greg?
>
> I think you need to stop top-posting :)
>
> But yes, that would be nice, hopefully people actually notice it there.
> Would you have read this and seen it?
>
> thanks,
>
> greg k-h

I blame gmail web-interface for the top-posting :)

Prashant also mentioned the dev_info when we were reviewing this so I
did a quick search for "kernel coding style" (to see if there was
guidance) before sending this up so I would definitely have noticed it
there.
In Bluetooth (where I've previously contributed), dev_info is used for
printing version info (example:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/bluetooth/btintel.c?h=3Dv6.8-rc1#n337)
and it's very useful for debugging so I assumed it was acceptable.

The added benefit of this guidance being in the coding style guide is
it's a quick change to checkpatch.pl to add a warning for this (and
point to the coding style as the source). I'm fairly sure Chromium
actually has a lint that warns whenever you use LOG_INFO(...) for
similar reasons (too many INFO messages that should be DEBUG).

I will send up a patch with the change soon (both to coding style and
checkpatch.pl).

Thanks,
Abhishek


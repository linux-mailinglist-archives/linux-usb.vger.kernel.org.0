Return-Path: <linux-usb+bounces-15966-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF39997BAF
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2024 06:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4955E28340B
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2024 04:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A435C19ADBF;
	Thu, 10 Oct 2024 04:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c8UTv+fs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B2A19ABDC
	for <linux-usb@vger.kernel.org>; Thu, 10 Oct 2024 04:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728533613; cv=none; b=oYWBwWD4DA5W8QQX8Qh3GddVnbTLGenTUzA5b1bb1kgYU4fAjwVFfrQ1I0jQEbf8kfI5nUK7LvisAOJKEq3P143Tr6rZI5IfUI8gtXOLi69erUEKwTVJ8F031uCIsEtcqZ71OmGj0biGi9tYbiwHIIQUPFl+bw8TeR0IUD8qbUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728533613; c=relaxed/simple;
	bh=Fa3yqUWIKihSvM8Dky3yrhEY+bGlMJzVhZjJlYz0KOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oFY6k2E6fPvY8DJ/ZLYONwBoHu5m2RIUm2GKxzNTlfu5NG2obo7idMk+eXBovqXMUVzfl2PgOxbgphH7Jwmh8DuVUFJup4jWoc4Dsg+Tk00b0TR9D/ZdZAJu1zDEzJH2NOv2JZ+4FKjSpcupO3Hp8ID8Oaxw58qtHlHpCXczSuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c8UTv+fs; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-431141cb4efso144635e9.0
        for <linux-usb@vger.kernel.org>; Wed, 09 Oct 2024 21:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728533610; x=1729138410; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iyc9jvA68dVH8P7BvKMjtZ4Po1WR7+Mp5iLLQbqq2p8=;
        b=c8UTv+fs1ckWgKPTV4BB9wWHtzT5dyyXPhKYnVvwiqnX1WmablKYvQkjYL3alSaJjc
         POCov2pMGGDv6850+xMsxT7P6pnXpfH36aTJHSolExJy/3K1+VJTE1nO0H2eJI2+El9h
         XYUpGsTi8mkkOjfsh1i32uFm3tcN455kCLgdXOsVIW855HtUrbaO6ryaLg4z9aUblHvL
         TPdqb2YAwLGCXvckWC8AvlOyQ9VqGGbJ+Ve8YjVcvCjgjalrVVKhtRlYDsGmVBcSjDuX
         o+e9Gs5kf9o/VgtDAsfnWGiSKqwPj+I8DgQza7qV969xvSq6uc+HsZvbpA7MJGD7RvWA
         ffwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728533610; x=1729138410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iyc9jvA68dVH8P7BvKMjtZ4Po1WR7+Mp5iLLQbqq2p8=;
        b=Zg5XBosCbhoW3b/ZGwI1Da/yd6wAqII2KcRz+nHbqDTMWC+s3Wg3La4Ul//T0bWSeQ
         9UYcxiX/4yclIM9GT/oezztsRcnKAvRwNflOSDcQ6AGqrZC+SVp/fbb7kphuTmi4NQ1x
         GgAdks5YKT7gNFI4+KaHART8wWI3gME4afCWavhpKKrLoxdj0Z86T9bLQSeUB7h6Y9U6
         YFDsrInrjRfmxvNLz+2vzED2n6PNuB5K3mlabY9APAcz0UV6cFy4lpVuPzGs9YI0NOvr
         oVXfP73ZDmYgjAJ5okzn/Z5tZQ2Tn42eYNo6jLwCjWA3vewNoaAvGMN2sMnwG/BQElRM
         V7Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXm2K6wo63TCJL2LkuAlUDJ50DojtV7I70zoOsZVTM1iU7kp2UVhlPzSgMbcaQa/pK2sgf/anQzq5w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQT9R1q1WVV0PLsS8UYU1Z5zlH1vHXK1sEmHoBMITAYjaotlDo
	+a2nmkJ2LVOoDanjPFsApaMBafcTL0G11RIXhPKZNn+LypL/9gATIQnwvN0CLTlPcKiXs8kpJFa
	pwXakmrhfUj2+saRgR9gTmDdMWlSmPQ+bqXRC
X-Google-Smtp-Source: AGHT+IFdTWUmTn70J6M/KPiw48mRgBT/PQg7viT/3MqWWJ4nJxut+FCES5a2TXWuELQHIfFu2HpKQYH/QOZz5aWIejw=
X-Received: by 2002:a05:600c:1e21:b0:42b:a8fc:3937 with SMTP id
 5b1f17b1804b1-431161b4011mr2588745e9.4.1728533609702; Wed, 09 Oct 2024
 21:13:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009054429.3970438-1-guanyulin@google.com>
 <20241009054429.3970438-2-guanyulin@google.com> <2024100943-gallantly-animosity-2822@gregkh>
In-Reply-To: <2024100943-gallantly-animosity-2822@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Thu, 10 Oct 2024 12:12:00 +0800
Message-ID: <CAOuDEK3UqynUa6NSDj_mTcnQAZ2vv7kGt9hDJCtmVrm_+-6vOg@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] usb: dwc3: separate dev_pm_ops for each pm_event
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

On Wed, Oct 9, 2024 at 8:45=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Wed, Oct 09, 2024 at 05:42:55AM +0000, Guan-Yu Lin wrote:
> > +
> > +static int dwc3_poweroff(struct device *dev)
> > +{
> > +     struct dwc3     *dwc =3D dev_get_drvdata(dev);
> > +     int             ret;
> > +
> > +     ret =3D dwc3_suspend_common(dwc, PMSG_HIBERNATE);
>
> Why is power off hibernate?
>
> This needs an ack from the dwc3 maintainer as I can't determine if it's
> correct at all...
>
> thanks,
>
> greg k-h

Described in /include/linux/pm.h, PM_EVENT_HIBERNATE message denotes
the following transition in the PM core code:
"Hibernation image has been saved, call ->prepare() and ->poweroff()
for all devices."
Meantime, the interpretation of the the above description could be
found in /drivers/base/power/main.c:
static pm_callback_t pm_op(const struct dev_pm_ops *ops, pm_message_t state=
)
{
...
        case PM_EVENT_HIBERNATE:
                return ops->poweroff;
...
}
An example in device drivers could be found in usb/drivers/usb/core/usb.c:
static int usb_dev_suspend(struct device *dev)
{
        return usb_suspend(dev, PMSG_SUSPEND);
}

Regards,
Guan-Yu


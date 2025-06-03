Return-Path: <linux-usb+bounces-24448-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3E7ACC250
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jun 2025 10:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42A2E189166F
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jun 2025 08:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC950281524;
	Tue,  3 Jun 2025 08:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H2g6sRKo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB0C281378
	for <linux-usb@vger.kernel.org>; Tue,  3 Jun 2025 08:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748940397; cv=none; b=Xo6WtknIt50FNqLtn18gadPRzhegxNXTLaSV/Grc5B67i2uupBHrvT/LlSARz6O31M7uK9TBmpRCt2zHExJHV1ohosQpeTYeAlDAP0Lti16lyP3CDrUXz7ar2QaT2Zd2SXFGXHaYtaDDb+wIcqPsWJh5TkdEgTPwsjrte8tDh9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748940397; c=relaxed/simple;
	bh=GHyD4CpAhBWwsgVBdk73lj4IVsCmxUf4Mu39EiZILnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S8d74lBYD3D3ssaee+YZBctwPVgpJExqsgXL7IXwTHRf0Jccm4s+f0LR426mPyzkyOdhURexRj/nHFaLjos8sDltyhwQEi6fApKoLOw621gpYUH08/Q+70yH8GN7eaN/2aXuPFIvdGzFX53/I+Otrbm65cbDK4bD+Yi+7x1wTPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H2g6sRKo; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6000791e832so5823a12.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Jun 2025 01:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748940394; x=1749545194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWAWEh/2YYsa14fENY1/1kOhGKvOx6iFO5AiVN3BwTw=;
        b=H2g6sRKoVeVpRvSn2GCL3KOZiRg0QA+VwBjlcUiNZ3Wnu6V34CqkZrNUI1m15AL5B4
         gKlHtBOO8UKuN0t8x6zNIOfNWBSnI4UtFKoZ7QJ/RlTdsRb4e0OkIqV6vhKe8u9OhNBR
         arvsgbs5/d/iBH5wul/0goNI/DRKWdQ0oTh43gbedUKw0CakGJVtLjdn5DKXfGSLk0qN
         YI6AeCBKBqVdeCT8J7oKSOcC52s8tRxBlcrzCh9zMeilrpgXcizHHy9C/k4pP0YlaYqV
         tNMmNd+JNih6hI2rYCcYYGK2cwHdUUZNp/x0a6b68SGTaHtkckQg1U3IMN1hYfWXg4Tz
         7wTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748940394; x=1749545194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWAWEh/2YYsa14fENY1/1kOhGKvOx6iFO5AiVN3BwTw=;
        b=Xfe2LnwtRzYm7VwsZHGmT4U8k4kRrXpbTSzdGwuQuLm8KycckdJ7zzuzmiXN1v0YyR
         1XCxi2NVVHNkSenL6uUCGP2bfilu+JHJcvSokWoIch3QIBMyLXjPqW7BNhIpu1T+ua1i
         aislyWaU9UGRy263rtiiVHg/HGPG1qk87YQbEsQmFtpCJ47s1Gpz1k9BX3/8iNDpEOze
         TRYwqa2wqoch3nMNsESBZ7pdaegPpaGxC8s381+EXhf+Cpy7PcInXt6bfNSRveJghUiJ
         4AJuxPqurt3bcSSD0o9Fhk2rjQLYnQfxVACPbl9bGxLgQJq6/fkRr1F6kzAfu9hb4xb6
         Ptsw==
X-Forwarded-Encrypted: i=1; AJvYcCXlGMBIFjdzBYPsrmkxOwvDfGOQMCKlhVoO0rZ1YlI0s9eXw6lX6CUXmOXWI50TEiL4x60RAGhMdeM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq/q5sjfS02WvMW67zW5ZuYt0EocN01K+EeoFu1IIqDxwt+P54
	sn/l9QbZoeX1JGCynQs52EUrgMjgtkdKY2yQuSUlw0MfBfoqtDCMnZ8aJEHWhfS3le8WNO2AhK8
	f5iRM5dck0TNuj2p7IY7VxVTJi1Nl+zRVqK41Cv1n
X-Gm-Gg: ASbGncsBheggo7rQgxvsQdcOHMO/fvUQrhzlFsz4n4G+kTMAWkH3XrifgoOnX9cth7B
	Z1LfTz2pP0SLwHRP27NkL5aYD9+slREX2PpxRxH/YQ4rKrikEXL4tTz5b+HkOyCFQS1iE84ERDm
	us9I2HQvuvECwdOkJRcH+lrjhBDHEl/4ShaVY4vSeCRnfLNu2/RUnbNSmPdR6lwJx+lI8xkiaKw
	g==
X-Google-Smtp-Source: AGHT+IGHH8Vo149BamuTxG6GaezBYSZirqyxqSNVi3kfQuRKjlrau9iqmOu6TKC54cBRwHP7T9QBTOCF+qcXoVYMeAM=
X-Received: by 2002:aa7:d8da:0:b0:606:b6da:5028 with SMTP id
 4fb4d7f45d1cf-606b6da50b0mr34647a12.0.1748940393661; Tue, 03 Jun 2025
 01:46:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528090849.2095085-1-guanyulin@google.com>
 <20250528090849.2095085-3-guanyulin@google.com> <2025052808-shown-sitting-1ff9@gregkh>
In-Reply-To: <2025052808-shown-sitting-1ff9@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Tue, 3 Jun 2025 16:46:00 +0800
X-Gm-Features: AX0GCFvq5Eo0j-QZZ4AMBsa6Dfa8KmibGHbeMgCDIJvB8M919kj3wpH71zF_c-8
Message-ID: <CAOuDEK28-ruD-DabsD7V0B8M8zZPVDu0vv1aYRnwYq+qTUua6Q@mail.gmail.com>
Subject: Re: [PATCH v13 2/4] usb: add apis for offload usage tracking
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, gargaditya08@live.com, kekrby@gmail.com, 
	jeff.johnson@oss.qualcomm.com, quic_zijuhu@quicinc.com, 
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk, broonie@kernel.org, 
	quic_wcheng@quicinc.com, krzysztof.kozlowski@linaro.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 5:16=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, May 28, 2025 at 09:04:07AM +0000, Guan-Yu Lin wrote:
> > @@ -2036,6 +2036,131 @@ int usb_disable_usb2_hardware_lpm(struct usb_de=
vice *udev)
> >
> >  #endif /* CONFIG_PM */
> >
> > +#if IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND)
>
> ifdef in .c files are messy and hard to maintain.
>
> Also, why is an xhci-specific option enabling/disabling core USB
> functions like this?  Shouldn't it be a generic USB config option name
> instead?
>

To address the above 2 suggestions, I'll move related codes into a new
file offload.c, and create a new config to manage them.

> > +int usb_offload_get(struct usb_device *udev)
> > +{
> > +     int ret;
> > +
> > +     usb_lock_device(udev);
> > +     if (udev->state =3D=3D USB_STATE_NOTATTACHED) {
> > +             ret =3D -ENODEV;
> > +             goto unlock_device;
>
> Shouldn't we using the guard logic here instead?  That would make all of
> this look much simpler and easier to maintain over time.
>

Thanks for the suggestion. Guard logics would be adapted in the next versio=
n.

> > +
> > +     if (ret < 0)
>
> Why the blank line?
>

I'll remove the blank line. Thanks for the heads up.

> > +bool usb_offload_check(struct usb_device *udev)
> > +{
> > +     struct usb_device *child;
> > +     bool active;
> > +     int port1;
> > +
> > +     usb_hub_for_each_child(udev, port1, child) {
> > +             usb_lock_device(child);
> > +             active =3D usb_offload_check(child);
> > +             usb_unlock_device(child);
> > +             if (active)
> > +                     return true;
> > +     }
> > +
> > +     return !!udev->offload_usage;
>
> I think you forgot to mark this function as requiring that the lock be
> held, right?  Just documenting it isn't going to be simple to notice or
> maintain over time...
>
> thanks,
>
> greg k-h

__must_hold marco would be added in the next version. Thanks for the heads =
up.

Regards,
Guan-Yu


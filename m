Return-Path: <linux-usb+bounces-14682-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F9F96CF24
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 08:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D6B31F25878
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 06:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBA31891A3;
	Thu,  5 Sep 2024 06:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="dyUat1Hj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC872BB15
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 06:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725517487; cv=none; b=XKKRGdi1FsMaC3CaAzkP4etVOgnk9iW1Kvy2kwRA/SGZPRnjs2lrXwwmXYHuw0x0Wy9HGpW8Ssk8jN3Wi1WqCQCvQRDfvMCcnaCCbocSHGWRNdrz23JLhcOqTJdGH7VZk8mzHrUsoF2byBrkcGKTdx4fTPkKcTRvFFYp/M2RBDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725517487; c=relaxed/simple;
	bh=8lmB+n7Rjnp4xofHWEN5tiS77Rl/1eS7XFbU/288LGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AebN8b18vrZkrZ30SZ76AdZab1568G9w/uPRbWTO3UwLE4ltEnytgCzedRysrYneVts5y5Q4cJWwlqe1qkmTuAcLWVpEaruNgSANqH5FXtTAvYkTl8o3caG8irHpzsWB1UlTapf4RAZgtDBlu1+hwNxWWhZw+FeS8kW9YIU0Ams=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=dyUat1Hj; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5D97D3F45F
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 06:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1725517484;
	bh=QvQSw/FcI32F9/2Hqvl+MbMh55sK+o2aUhsIACfK4oA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=dyUat1HjCqRetXGYqPaQh8RBi/SYSYJxWy2GfWwNr84TY2uGEJMG519FrgPgtjruN
	 5jWIcuSrxj3cRtdlzXrD/GSCKcXTUFyNg5YjbkJ33HeAFLgVIvFLFRCw95wb1j8xOK
	 lpA0w0wHy4frRqIW0/97s09xZtlCD6qFmQvqwYC1ut78XsDS6q5PhDJPE2D+/ePOTk
	 v4QgSuRS/5VzM0gGUF2UbF7LdQX0lq9U9fxumGTXtZN4/JYSwZ4b0RhTo1YnBsqX5N
	 O8lyFN6emxScpZE3L0jEr0dkecXAviOmtr6hNeoBM9lKROpOBsbWOS4lJwe6OoBXnW
	 aue5Yiev7hLqg==
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5c251a09953so452063a12.3
        for <linux-usb@vger.kernel.org>; Wed, 04 Sep 2024 23:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725517484; x=1726122284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QvQSw/FcI32F9/2Hqvl+MbMh55sK+o2aUhsIACfK4oA=;
        b=MrK/WfeT0/mp8reImiK6vhuKZVrDazzqu4hb+2MSohw3PVliuGQoBuSK304hZMBoAJ
         3k+Sh4k7USOCRz/RZU565rEhO6AqZAl9H10xUXDuumv8D3vx9ljMOLz/KsiC4fPce9wz
         pQKtei/a9ss7ifQQSUEQN6/NM3gTsPsSKqeJW4iBYHeAdavIb85nvlvBjer1st/bh4FQ
         gTHEgraTSlTz7UtpgvOnmKt2r6/es0Tz5ELyYfCJEzYtxNrnGbMhQfRFdk12/1ZujPWh
         gIJJKnRyEjuaB3XbxghZTcW6+H4rJJ0DAhmHjBeKIrK5cB8tJKhuZsN4RfmhSeD+jZ7V
         6aug==
X-Forwarded-Encrypted: i=1; AJvYcCXTCRykDAbhuW77dn8PF+nHHIeoSTQwTOITJDU+W7IKYE3tFLWqeAXlqlcUcjWHYi6Mdu29zVhCazw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCl5PrjbI4zrt4kxd0P0cc1RwmipMWQzGdspFQlvef/aRtxiLR
	O3OJCUwlXy2iULe8t0LA479V+fL2HFUCJV7S/jJq6BZz+OFv+NNdlVl1oaxL/kjQt/+6vC3Wqp+
	XCuUZHLx5YJwUsWo5BNKMHNgK919SMA1ynGI2KA2Sbuo1PRYiFf/KScrBhwXRp5cMRqUJMmESWW
	lamPt74HKsNwnQnH1/OHRJEPpE6UYhJ2vkhG6tvBMbB4Nqcu7T
X-Received: by 2002:a05:6402:4402:b0:5c2:4d9f:60c with SMTP id 4fb4d7f45d1cf-5c24d9f0711mr9904900a12.7.1725517483883;
        Wed, 04 Sep 2024 23:24:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8bZAmkH+ng1iO9QNaWtm37w0YW5A6QA5WAjIKKhJwFrFHxEZ0YKFzfyBmenRnS9cILw/VIgk2T3/MD8IIQGs=
X-Received: by 2002:a05:6402:4402:b0:5c2:4d9f:60c with SMTP id
 4fb4d7f45d1cf-5c24d9f0711mr9904879a12.7.1725517483398; Wed, 04 Sep 2024
 23:24:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905042447.418662-1-kai.heng.feng@canonical.com> <2024090516-battering-prompter-3f53@gregkh>
In-Reply-To: <2024090516-battering-prompter-3f53@gregkh>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Thu, 5 Sep 2024 14:24:31 +0800
Message-ID: <CAAd53p5tGvTh_zP8BdBu1o0t5=s_uBQuctKQcwCNwyHo6Fx7oQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: linux/usb.h: Move USB port definition to usb.h
To: Greg KH <gregkh@linuxfoundation.org>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, jorge.lopez2@hp.com, 
	acelan.kao@canonical.com, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 1:20=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Thu, Sep 05, 2024 at 12:24:46PM +0800, Kai-Heng Feng wrote:
> > Move struct usb_port to linux/usb.h so other subsystems can use it too.
>
> These really are "internal to the usb core" functions and variables, I
> am loath to export them as it requires that you "know" what the device
> type is of something without any recorse if you get it wrong.  I
> commented on patch 2/2 about that.
>
> Could we provide a usb core function for you instead to help out?  What
> exactly are you trying to get access to on the USB bus that you need to
> use here, the port or the device?

The device so the quirk can check its vendor and product id.

That means a function or helper that can return USB port/device from
an ACPI path.

Kai-Heng

>
> thanks,
>
> greg k-h


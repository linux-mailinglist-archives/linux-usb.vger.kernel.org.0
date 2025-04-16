Return-Path: <linux-usb+bounces-23116-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45215A8B54B
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 11:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 183873AF59B
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 09:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB732356BA;
	Wed, 16 Apr 2025 09:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fQgfi9WS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDEB230BDB
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 09:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744795665; cv=none; b=qiICRFwYAa7l91D1FUfoC4W0AWoMIN1cntcTpOQq1CTwwFLVLwlzvEPd7jz7OX+A0uK4xioau1SpUNmoMRSH20Qn+J1kaO/B/uxp2hWfskAne2aAAXgSBvrNRoqk52eEIaqHphxfDzSzEEJdws8T/naRH5qulQcqmoC9Ky6iLOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744795665; c=relaxed/simple;
	bh=ZSAyVPJa+DNSA9XuJEayjEky1UYza5wCLhZqf3SURto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JjUVKQSxiLxENNuC5edmkfrmtDra8uqaSmngRgmBJ9nmq1Igq9myX7hUBhQKt7SbRqwbZUE1ljHH0MYzb3/kqc0hqM8Szk1fTPHSR/Ux76Abni0q8oO3WekpMVyTR2mpFwjV0dM5zIrfYTS2GU/bywWlW7/BFpKNsyxwqe/jeIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fQgfi9WS; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5dbfc122b82so9265a12.0
        for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 02:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744795662; x=1745400462; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CrZlkaDKpY03Yt4YkAABkQhHLXVWR6nTz81SYg7uyo=;
        b=fQgfi9WSBv5VOimBm1X0Jd6TyEIKCu0hRQ6YXlY+jempSqtBK1Xf0/Ig4pQhNbXYF9
         f0Y+aMukSPAFxfQ354p7VCqzR+FDqSTx23Q1IgBXwqsr0crS0NPmTrw/0lsP7HHPdqhu
         3wlMOTZlcrfp4/1j7G0M5yPeq/jskhxsZbM1XXJg/OKd/IEOBI8xZ7pAGsJAFLSh6Nie
         PooHJcwecCQx7zyduL38JmjQ4MOzqWsl53LIs7QJuUvu0Tt3WtrdknI4Y+cgw/bes4v4
         1TkydHGHYTndvXtVKEpGJyd1ZG8dNgiUHsxGRFggEj03jhd8oltkLp9b4nE2+gooIAzx
         vCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744795662; x=1745400462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8CrZlkaDKpY03Yt4YkAABkQhHLXVWR6nTz81SYg7uyo=;
        b=lsCUN9qt789eQQwwfKOJ6W/aq7XBbAWTzHaQ58XUmz8e9NKnxdFn3zg4QMGNYqnuY9
         yoMd+qQH8oNL2LogCwSYpa3IqDi0q9gKJx5LlQ6WtjoGY2pkgmkva6n0baD4OgnjwVFi
         GaHOAlzG3KybTmr8JhJkuieSLeXMqTnVYDzJLn6aeYU9OaY5y4o7zpxkT2q4vR3fSz6o
         4yvRTALtoazdfADFpxppmoTPJMmv3lWE1ZaRT6sG5VIL1Qpx8QG/baKsK7rGij6iivui
         +MCKSDyj8lPRscgfKkjQEUIR2heIBwJb4P8n1PwNRDyaV3jwgoXcUp5+4vwdr3USnICb
         p2Lw==
X-Forwarded-Encrypted: i=1; AJvYcCW4oH4runldLTCnFAoefOW2YXO+5GTVdts8HfsgUPzDxZFClJ3PDsZUQQtv4nDQSFrL4mBkwmLKgaE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu0TX7eoAk0+htfIGxmBnpQcmUt7sBqVWWwhx7zwRZfkmUU9wc
	WTKyzWnKMtdoh9JYC4ttz01Zeyg1979t93UhywuzWas2TqjroIMzkUHkYpY21H70WmPiVxadfW5
	vqGNu0HGaJtwn2nBqQwWstfbbfXBS6b2cZjxA
X-Gm-Gg: ASbGncupOKyuCw1OLOLbfOhFAxs/gyqUMrSAEtafMDLxaYWC3zAgG6g7s5P/1gycntu
	SY/Axei9SkBr1z4QHWkOSmCyCUiSL5P4g8S/jHoM7fVt0L7IuSwtKLQDUxMdiJHqct0RET5zzjZ
	a4jaiCRxJsi0cqIakt1QU7YA9cJboLt0ITHdtM8vsiq5uu6GeETw9v
X-Google-Smtp-Source: AGHT+IEvFptH5xHEGdtt4MJIe2+XGOfTwQGM7EUnJ9iIULwbi4T9KbtIIp6jL86bzXtnC//yJXZZbO6taLcyFU8adQ0=
X-Received: by 2002:aa7:c48a:0:b0:5e4:afad:9a83 with SMTP id
 4fb4d7f45d1cf-5f4b653c428mr38661a12.2.1744795661783; Wed, 16 Apr 2025
 02:27:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408035833.844821-1-guanyulin@google.com> <20250408035833.844821-5-guanyulin@google.com>
 <adc03a95-baa0-4a2a-9b00-39a644bab426@rowland.harvard.edu>
In-Reply-To: <adc03a95-baa0-4a2a-9b00-39a644bab426@rowland.harvard.edu>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Wed, 16 Apr 2025 17:26:00 +0800
X-Gm-Features: ATxdqUEuCCfU8ATcbV828rfpdrpnLClVnv1356aBerj8g_kmnmezO7kTyYNwoag
Message-ID: <CAOuDEK2g-wejkuXUySJLJTo=S1NS=P-isTUTUaNDgGQeWXsoCA@mail.gmail.com>
Subject: Re: [PATCH v11 4/4] usb: host: enable USB offload during system sleep
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, mathias.nyman@intel.com, gargaditya08@live.com, 
	kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, elder@kernel.org, 
	quic_zijuhu@quicinc.com, ben@decadent.org.uk, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 11:17=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Tue, Apr 08, 2025 at 03:57:24AM +0000, Guan-Yu Lin wrote:
> > +                     /*
> > +                      * Don't suspend interfaces with remote wakeup wh=
ile the controller is
> > +                      * active. This preserves pending interrupt urbs,=
 allowing interrupt
> > +                      * events to be handled during system suspend.
> > +                      */
>
> Here and below, please try to limit the line lengths to below 80
> columns, even in comments.
>
> Alan Stern

Thanks for the reminder. I'll address it in the next patch.

Regards,
Guan-Yu


Return-Path: <linux-usb+bounces-27499-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2D4B42741
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 18:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 236CF188CA5E
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 16:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D148D2D46B5;
	Wed,  3 Sep 2025 16:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CQupfZ3B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0277169AD2
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 16:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756918067; cv=none; b=RCHcAbceffiTLdK1d/UJTr1YTHl36Op+HuuR3acuU4mkjjzsjqBY/VIfpt1OpH6jGQqt5DfT71j/O0xpJbavQiPKK5bH5TiCHO2Jd535SzBZCr3N6gQmkmCXC2D5l5zC0/LmTOchxrpREESO+vlCodtbD1V1xTvBTpiNry3iRhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756918067; c=relaxed/simple;
	bh=Wp+Fd1jGDTl5ZT/lUuN1eAjAEBHsNNUZ+7MGxLQ7OV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PyBb6fCa7FvzC4j/b8ZLn/o8JJ2AisAJPdLlhr2Jjac1EAG8nlpuAqX72ad7kP7/8Xbgcfky2lna7R2SoBSr/6ewUQW/f0AU1s+4jZcgXamwLZLRdYpskYA2j/X7BGB3u8zLOhP1WOFrVI1Sjg8D7bTZVemoIyAwXxSSB+syw+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CQupfZ3B; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3f663225929so273825ab.1
        for <linux-usb@vger.kernel.org>; Wed, 03 Sep 2025 09:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756918065; x=1757522865; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ModBFPB6DXHx1zIdfFTCiIllBhLo/YdHbGyYJs6PBOs=;
        b=CQupfZ3BTAyBSPDm9uFtP3c+UkDdE8nCWT1J6xw9cWGdOM/ZBb12pF+XSHFjjXPFbq
         Lt53TOHeqU8Zf7v45yeRojjUuyjg54xwEPPy+8haq3KSxGxqZkN+v4FD6Zd9KZv4uLqg
         jPdeEkKdZAgSjkwZmpqhLBOCCnIuUGaMHPrCajejcBN+jRdJXZf3x2DB8oF0nbUgWm2j
         3Uiq+XNTrSOYIyTuMMaJItFmWfYnzUXvus7+F148vn6wxOLHOA2WHPwvDolzgXj3G2ov
         0zhLnRiCffap7vmr3UrEYeX9gjX6awsvnxgo+BbxO892LvxgbqfG00mIPK31EmBlQ+/v
         av+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756918065; x=1757522865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ModBFPB6DXHx1zIdfFTCiIllBhLo/YdHbGyYJs6PBOs=;
        b=nj51+fr6vy4CGQ/l0FmpCPOO4N8fNk1iIMOx9Hx9jahKVPHxPa+Sd4Yba8byPjeBY7
         P05EuRNrQizdHJlkZHAH+xz9qHfwRGcqLq7yFdDPN2Avi9z4xaVn0T86j94OACueFyyE
         807XZcs0CSqzzzKcUQFJ139RF598gSFbqKnCMr9cZfiFd1Ty1feEf7Kic9sjVCm+f+Gz
         t2vYJKG42rhyxqoGlT/iJVQgFvGg0Ha7aTNy2gD61O5ysvufq6c4M7DKSn8BCRiCYi+u
         t0smS+Aci435touA7fpm7IbwgtiUA1K2Rk6AFVsHzQPX1tCZ5/STcQFJQTOJLOhkb7IK
         penw==
X-Forwarded-Encrypted: i=1; AJvYcCUlRyLFHHbBPtvWPDdJ1mBIV4rsye3icWTUH4CKDCdoVgWItfOxvGeh9ebqImBTy6sRwSSUvufeibI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0MsU6mnIdvUTr6jYwIgctJb3QoXfvN7X+8DBs4C9+FmHs66Zt
	r2VVznom1zQJo/YR9tz/YHhJyexEdDFWe2pJR+6WNcdrcMcbWO/n1aX5F+mXkefM7yoksnbMb3V
	bzgHBCB/H97M1fDbXQ/jixHfo6OKYzQhOnUkRA+ao
X-Gm-Gg: ASbGncvdqdZf5gYr8XGmZO+mR2DDnjqZcAr7Ic5l3FhBnGtJCk5JFLW26dNL/PVsRcs
	QZAV7ngpywDnFKDuyTV8SM+XnqsKH3/7pDt+zk6CsiFaIp1GxYVuElXJrK8DAz+2Hgi4PanoigS
	j+HSH4qRqZb55XRySt7Y68DvsTgF5mhrrrOiwajJ2YbZX/LvH6ohLjvI3QygqZMbZaQ+9O/+C0G
	Hpvel6WZmpwAq/BRubqS5hxosBoshA36gqnKaQSACmSf+Yf2ZzwrQ==
X-Google-Smtp-Source: AGHT+IGXtLIi6AgEJKcldgXLX8Ag4KTO+ArCo6MY3UAb3lDTUoUdTpyShA2LPoifY7mTauboNv9EHBPEO/jB//jgYIc=
X-Received: by 2002:a05:6e02:16cd:b0:3f6:5e25:a5e1 with SMTP id
 e9e14a558f8ab-3f65e25a80amr73287585ab.23.1756918064511; Wed, 03 Sep 2025
 09:47:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821203838.1721581-4-rdbabiera@google.com>
 <20250821203838.1721581-5-rdbabiera@google.com> <aLAk3MJuso1w4Kkl@kuha.fi.intel.com>
In-Reply-To: <aLAk3MJuso1w4Kkl@kuha.fi.intel.com>
From: RD Babiera <rdbabiera@google.com>
Date: Wed, 3 Sep 2025 12:47:32 -0400
X-Gm-Features: Ac12FXzcrqFwsBVFTWKnWmT3vG9KwWoi_LzPlUJTtC6TWXSsicvLH1saw1F0_Bg
Message-ID: <CALzBnUEe5cp1672OSywK1w_cP--+731tKDbOmqjBt2NghK2OGw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] usb: typec: class: add typec_get_data_role symbol
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: gregkh@linuxfoundation.org, badhri@google.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 5:44=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
> > Alt Mode drivers are responsible for sending Enter Mode through the TCP=
M,
> > but only a DFP is allowed to send Enter Mode. typec_get_data_role gets
> > the port's data role, which can then be used in altmode drivers via
> > typec_altmode_get_data_role to know if Enter Mode should be sent.
> The functions are okay by me, but is the above statement correct?
> Are you mixing power role and data role?

The PD Specification lists the DFP as being the USB host when USB
Communication is supported while acting as a DFP; it gives
a charger being a DFP and not supporting USB Communication as an
example.

> > @@ -172,6 +172,18 @@ typec_altmode_get_svdm_version(struct typec_altmod=
e *altmode)
> >       return typec_get_negotiated_svdm_version(typec_altmode2port(altmo=
de));
> >  }
> >
> > +/**
> > + * typec_altmode_get_data_role - Get port data role. Alt Mode drivers =
should only
> > + * issue Enter Mode through the port if they are the DFP.
>
> The second sentence should go below. But I'm not sure it's correct.

The kernel-doc comment guide agrees with that statement. I'll change it,
thanks for the heads up!

---
RD


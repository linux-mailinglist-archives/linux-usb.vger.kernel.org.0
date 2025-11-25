Return-Path: <linux-usb+bounces-30902-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF2AC84A5D
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 12:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09F253ADF40
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 11:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC100314B86;
	Tue, 25 Nov 2025 11:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5D8fJSQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86603148D7
	for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 11:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764069025; cv=none; b=JLKlVJEdtUYMyVM8sIUYfpUKjvNT9P6DOqoquc4ZrZDvQff1LIe9E3ZJwKRh918rvUhIIaiGA06XYFRZfZSuA6JRAtOBBwSUwHCzfnfQWp1nmtXa6ZYrwDcsfsYro8OrDqaQ8JDVv/Z8Go18IKc2tSlHMNZEvFPbrCFdqIVtXeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764069025; c=relaxed/simple;
	bh=AKoeu77Wic8MT/qdu7D50rBLGCQhvxGec25KGS3bXnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k2ca8FUX5gUglj2iE2tNJP/YiAf7+nhgxcJGFxzwXeza96gAtEaqJMm93pirOAo+diSp7OWN9N0F1K5lPYPcEDkwRpqY4nhi0iykpIcGPqF6yi/bsLdboTrdHwXtrAI4Fbw9VJm7El5VfqN6rySYZaaQClECKIFgYfeFK2e3FIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5D8fJSQ; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9374ecdccb4so3035803241.3
        for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 03:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764069023; x=1764673823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKoeu77Wic8MT/qdu7D50rBLGCQhvxGec25KGS3bXnM=;
        b=h5D8fJSQcvwHN9diBVXc0QwaxqcTHeK8wyBQZRKo0VbkP27auuM1MZ3cAGMvdPwxcA
         L8tMI8MUop3yH12NduDTAtb0zaR0H8g8KiPBn7LU4AGLuPYfbqdPlDZGLhDRnxllLmMP
         D52dvkaHDl9SKEjjah+9MzJXMrz6YGLgFKn6mnuKfNEjl+PZOVJpnhFKWrxto87lA9Bt
         xPbpmT2NKQWV8+6/2IhxYYwF6NutN7FTY+2rRlCEd3PQVot87sIi+SlwP27jGA8OYQYc
         d3WEE3nLZ0R6Lea8VE1oseLjV97UUSPvqFYRJVbgAH+bE+vat4vEfrac8Quj+NgaOnhd
         wuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764069023; x=1764673823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AKoeu77Wic8MT/qdu7D50rBLGCQhvxGec25KGS3bXnM=;
        b=Fc9GdDfljyukAvj5UOXqO6s5E+T7KYE+XfHJXel3mY9Uq/mRxE8UTD8qQsDGBbhDbd
         ySZQLS9zAhKnyMXbADnEt2zVpUiXzJSCkMfuuKeWTt7Gx5BcNsTUuFfQVLFLuynzrgQI
         9o1bzeC1KdOCL7wF1Yv83WptiSw2HklVxxutEUX6fnbsuEWPZtt/lAHYC3TfwL/ne1eW
         0XMO0JnLjOQWzkhDD/K7p1tI3LXG4lBfWIjP3/xR44A7LzxCsDYY6r8Qd1frrV3V7PkC
         bIL+6oJUndCzOZgJEQeN2dfCHk5Pygnug2Tmvs937CLckaQynniMJhbxXMcDStcDtbav
         ItEA==
X-Gm-Message-State: AOJu0Yz9BEq5/X3E/sro3K0UAHo12muKkFhXwH8+6BimVYMCs087xbV0
	0l+Ce4AJOq3Gf3MjjQJT1J88G0amkz2qSJz6H+g7BEHHaT8fG4iTh9v3v33auX/AlmP7Up6JPkC
	v79PXfTH8Td74RdfhwEZJklyhk9FXs9c=
X-Gm-Gg: ASbGncsKowMDPdSsk7w2DEGZIvbqbPYV0jfqTAFmmPFDmv+6CpFG1pMr4MErbmfO0oG
	fy/VhTuCm1w+hQz2zvduTVJtIxHx/1ibcmfchjD01qcUoEP9IKsI/pKaPC6Tt//ictEF2PKLkaI
	vDG7Q5zpp43KxFvlA5532CzTbdlI6waWUy582zUxgmO60BPrRHJxf3I2F2zpGuaCynuVqLw0rXW
	qO9l5jCE9nsZkc2GsAZapCoBYH71fbh903bntbFNq1ExMKSvqW7oKuJ+kmDbgFCbHfFNss=
X-Google-Smtp-Source: AGHT+IH/YPNFcuicQhkzX7AmwY/Ss+Ml8wYJNhZ6jDVSotyd4Nm3YIyCalRW3okg3KKbprcsDA5anVcDAr/UMmP24x8=
X-Received: by 2002:a05:6102:50a3:b0:5dd:b2a1:e9a5 with SMTP id
 ada2fe7eead31-5e22424060amr568180137.5.1764069022667; Tue, 25 Nov 2025
 03:10:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125082505.52249-1-duoming@zju.edu.cn>
In-Reply-To: <20251125082505.52249-1-duoming@zju.edu.cn>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Tue, 25 Nov 2025 19:08:34 +0800
X-Gm-Features: AWmQ_bk4zqulrd5OiPilU3XBJpnswnsmadALE0ZhFXe0fl0LHNsXMOU841QYBMw
Message-ID: <CAH2e8h4CBg=PsLmfcSCmfbVo+7mZZFM+GqcpVpZeU_B-gmyfUQ@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: ucsi: fix probe failure in gaokun_ucsi_probe()
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, 
	heikki.krogerus@linux.intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 4:25=E2=80=AFPM Duoming Zhou <duoming@zju.edu.cn> w=
rote:
>
> The gaokun_ucsi_probe() uses ucsi_create() to allocate a UCSI instance.
> The ucsi_create() validates whether ops->poll_cci is defined, and if not,
> it directly returns -EINVAL. However, the gaokun_ucsi_ops structure dose
> not define the poll_cci, causing ucsi_create() always fail with -EINVAL.
> This issue can be observed in the kernel log with the following error:
>
> ucsi_huawei_gaokun.ucsi huawei_gaokun_ec.ucsi.0: probe with driver
> ucsi_huawei_gaokun.ucsi failed with error -22
>
> Fix the issue by adding the missing poll_cci callback to gaokun_ucsi_ops.
>
> Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi dri=
ver")
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>

.poll_cci() was also introduced around that time. I missed it. Thanks
for fixing it up.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>


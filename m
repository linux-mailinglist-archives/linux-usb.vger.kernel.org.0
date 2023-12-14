Return-Path: <linux-usb+bounces-4172-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85146813DEA
	for <lists+linux-usb@lfdr.de>; Fri, 15 Dec 2023 00:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 804921C21EA9
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 23:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A2A66AA4;
	Thu, 14 Dec 2023 23:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kq4u/RXP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6162367214
	for <linux-usb@vger.kernel.org>; Thu, 14 Dec 2023 23:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40c38e520e2so23805e9.0
        for <linux-usb@vger.kernel.org>; Thu, 14 Dec 2023 15:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702595063; x=1703199863; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cphvl2wyh1GyJLsprr0iWOYpnSYMRlz6FGZQv5qE9aY=;
        b=Kq4u/RXPnDaPbgOkiKlHpBcpC7+2xRa0rjYO3149uTr6iLynbgqfp7ZpCILrLYNBqr
         LeGCE8w/qtPUtm0X9gHt8kZcJB2VX9vlLcFmjbni3c1Y4kfhoJYzrZuYopULKg2F3XS7
         hsBWrqGnos+j5i8bVBlPOz4WKXRn3dsuDb424rIlMBvk5gL9NfX7LQK/gmqvrUKYARsk
         qFI2RHfj/2jJj3UcpvGvD6Nd7MV8YJ6jXe8Td/1DfEm2liNV2wEfCDpn/sj34RIt4D8s
         30ZmmySVcPfqilZ37bjjn02mjgRlKiDYkhSUp7iaex6fNIevNW5+zDMCLDCr5npgZjBQ
         9WVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702595063; x=1703199863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cphvl2wyh1GyJLsprr0iWOYpnSYMRlz6FGZQv5qE9aY=;
        b=uGMgLf9GJisxUr17ygwLz9s3AuDGVNsnaEbWgS4fyrRdaA6Z+f1HzHH4E7ud8ht7oj
         crH0zmKl/vnVRa1Kep6rRv82+fEKNm/b3gzwtohVnY2iOlpqeefugJ8spSjmjbpWdtVF
         Pu7fU0aq8wIM/PbWR0E8sNGbj3ykgtYDO8XDVlhEzHy+OlgLeHJRovp2X185wKJwQtH9
         l/iZFhX5R/4wnftRxeGk3sqwiuB25JtbGprChwRl1A+FvBJbfIcQZvuj+b+H/UFbfHJN
         wBaJ7LoP71LApVRAwDDdbsV5D/EQxrtfgnDYFPRUIX4CRUDZHoJoWdivq1B0wMZpA6hC
         I7aA==
X-Gm-Message-State: AOJu0Yxr+v3ZDdGtYGAUU927kBsPr/rMzSHZxZt7EYpiwWTzEkL1nA0R
	eGWlzzrz5UoMdR4da0dO9w14LNqTK6wbGseuQ+8XzmeFdRvjJUz9SA6e922s
X-Google-Smtp-Source: AGHT+IGXb16j/LfeqtBoeO0x3fK0w00V9lsrj7lfha/L4eV4jsQEDQaHUg/9HPGFB+bKX/beNWh7ACqwFXJFkQTQH1Q=
X-Received: by 2002:a50:c082:0:b0:54c:9996:7833 with SMTP id
 k2-20020a50c082000000b0054c99967833mr718937edf.7.1702594641723; Thu, 14 Dec
 2023 14:57:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207090738.15721-12-rdbabiera@google.com> <20231207090738.15721-13-rdbabiera@google.com>
 <ZXGt2drhV/K+qtTG@kuha.fi.intel.com>
In-Reply-To: <ZXGt2drhV/K+qtTG@kuha.fi.intel.com>
From: RD Babiera <rdbabiera@google.com>
Date: Thu, 14 Dec 2023 14:57:10 -0800
Message-ID: <CALzBnUEvKWScSxjE60ONDc7KsUPDwy48rWrSKATyr2D2nQBimg@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] usb: typec: bus: provide transmit type for
 alternate mode drivers
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux@roeck-us.net, gregkh@linuxfoundation.org, pmalani@chromium.org, 
	bleung@chromium.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, badhri@google.com, 
	tzungbi@kernel.org, utkarsh.h.patel@intel.com, 
	andriy.shevchenko@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heikki,

On Thu, Dec 7, 2023 at 3:34=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
> Instead of forcing this change immediately on every existing user of
> that API, why not supply separate API for the cable alt modes?
>
> Although the SOP* communication is the same in most parts, at least
> Attention (and probable some other messages too) is not valid with
> cable plugs. So maybe it would be more clear to just separate SOP
> communication from SOP Prime/Double Prime in the API?

Your idea makes much more sense and simplified implementation, so
I added it to the next version of the patch set.

Thanks a lot!
---
RD


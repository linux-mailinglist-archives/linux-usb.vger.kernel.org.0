Return-Path: <linux-usb+bounces-16074-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A7759999FEE
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 11:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3235EB22ECD
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 09:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E02420B1F3;
	Fri, 11 Oct 2024 09:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FWClB/eK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B14C20A5F0
	for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 09:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728638265; cv=none; b=SyyfhX7G+Vem7PUyCGsckYKKOnRY9wiJmiIWLHaQZy4qFmiaBEBXczEKh/5ReI5xmyWBvTud9QJZJcrAxBxUOQQMjsvxcDfddbwu9u9otOLkwBI5OYrTFiFDx+1kKT/xzKE+Tk/KTZzIJikWrKMu1w8F6KwgObdfDi8vw+c3+Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728638265; c=relaxed/simple;
	bh=V9h6cgSSqmieE+yzxyNDuxnhwPi8c9hh6sKJaUBekAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B4R5RDvRcVRDv1YMWVtfAwACDl5zp8VUI5beomDqO3g7cSD0r9NhuuTJ8CkjpB/duyMFlIScVXsuw2yBGp5KUuOUEpr4WpVbUEVQrJ0UJKbJkkz33vwrDK3fftbl/IuY9ODCA6vvkRt9x+grAFRNqXHizVolnMlzfBQGtoCnc+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FWClB/eK; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5398e58ceebso1682089e87.0
        for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 02:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728638262; x=1729243062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bvx+E0BfVubWu3gLirJRL/C2ZUBQEvuq00nmWeP4ig=;
        b=FWClB/eKYzbg0YDxe7Mg8b3oFsBNSjO7J8Q0LLYJ7foafk9kE0yThVC1EXTxUTLI4N
         8TNSzwaTbUJq/Llt+DB2ZklpOU0h2CPYG52UpJ+HCm0yDd7rMmOH05WQRDp4nR6VPAjm
         fe7nVW0PhVow1MPa0ky7OAj/aOj726uh3G674=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728638262; x=1729243062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5bvx+E0BfVubWu3gLirJRL/C2ZUBQEvuq00nmWeP4ig=;
        b=YJ7E/Gflms6b5La1B8996Ury41HbxXUOrnmmwG+6xm5w8dpEG6jys3zibHEJ7/38EP
         ZT6HvIX/OUqE3taGQgAM6/gunza3ot7CfYTsgURkIeMr7Pc+ZKrhU/mOwdxaiViGQ78U
         WvRMP2VIdZ5yvAdTSgsQL/wqAc1xyZ2TjzkYq0KHqI5tHv0oTaAN5KF2F347W88G1c8S
         C5yJ8NUeDphfKh4es+e3aJ1mdkgUPUpNI3NkBpxxDCXZg0YBAAw2s+EnCjL6Q0d2ryk7
         oFhMWfKqJiwrIXlj+vTkwOH2DFnV8ByEf5fvs/TObHWVnZecEno4Dn4XoVSeJW8q7ZcG
         KzBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHtuI874SOsKXFN5UG3tpKj+XkkRzj9vp4K+8QiAjbE7MPBXqO3BXsJenGvL7gEr9i0DLf8a3/hd4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGNZrZQAEJISht2+jZA/7iw4RaXJUtKGyt9TcFZEFvIgFMgGU1
	5CBRpR0xRfdzWMAk9eL2whhPez07qYqJuifexLTrbO2eZ4N617E75ipFwfo1+Jw9Th3B88zgcyn
	SQ1YyINd/9IA01au9TOXLbjUKvVszCTYFWfw=
X-Google-Smtp-Source: AGHT+IGbKIDooOUp44Dp2/Ke0uZ1PFLO3OKJDqp68HHC1zVKST5rQFT5XZOGMNfgKFhE8FDRc1+NwgIMZ6M6pmCv5Yc=
X-Received: by 2002:a05:6512:3e29:b0:537:a82c:42ec with SMTP id
 2adb3069b0e04-539d6c3d692mr655770e87.4.1728638262131; Fri, 11 Oct 2024
 02:17:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910101527.603452-1-ukaszb@chromium.org> <20240910101527.603452-3-ukaszb@chromium.org>
 <20241011072752.GL661995@google.com>
In-Reply-To: <20241011072752.GL661995@google.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Fri, 11 Oct 2024 11:17:31 +0200
Message-ID: <CALwA+NbX=r964K+zKp0OnYb75W8dP3aMhVZEawbWLzafK3k9eQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/8] platform/chrome: Update EC feature flags
To: Lee Jones <lee@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 9:27=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> On Tue, 10 Sep 2024, =C5=81ukasz Bartosik wrote:
>
> > From: Pavan Holla <pholla@chromium.org>
> >
> > Define EC_FEATURE_UCSI_PPM to enable usage of the cros_ec_ucsi
> > driver. Also, add any feature flags that are implemented by the EC
> > but are missing in the kernel header.
> >
> > Signed-off-by: Pavan Holla <pholla@chromium.org>
> > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > ---
> >  .../linux/platform_data/cros_ec_commands.h    | 32 +++++++++++++++++++
> >  1 file changed, 32 insertions(+)
>
> Looks as though this is only used in the MFD patches which breaks
> without them.  Can I take it without sending out a PR please?
>

Yes please take this patch.

Thank you,
Lukasz

> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]


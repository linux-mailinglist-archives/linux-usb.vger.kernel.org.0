Return-Path: <linux-usb+bounces-6477-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47815856F75
	for <lists+linux-usb@lfdr.de>; Thu, 15 Feb 2024 22:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 734A71C217C6
	for <lists+linux-usb@lfdr.de>; Thu, 15 Feb 2024 21:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F0E13EFE0;
	Thu, 15 Feb 2024 21:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bmuoQToR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E2B13AA32
	for <linux-usb@vger.kernel.org>; Thu, 15 Feb 2024 21:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708033241; cv=none; b=uOU45mLqFitRLNQZMYfqcUypnlmbVeXXbufGxO+UD1+2/H5eSbjV0rm3S1dW5xfoqudJMnbkiyks63AXMCd5FAPBiSBd4zAXg32M9/3/d9YLhlFnUSRwzcZihekZBLnbzEyTf1xq31DsI6F+N/W8Ld69nyqr4Ufn+X2XjljKLNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708033241; c=relaxed/simple;
	bh=EuSAvfTrN6Jpz7JPkQ4Tz14+QLAIlExbrnob8HbYWVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dHfORr5fau/3Q1qGZC9mQITJ33WbP7B9U+IPJi2ereML5i7wJNqdyAUJk2aSxv+w8yd3cL+vQJaf33mYjTr0/kwHoiWLkbSkDfu6+CFWXDfBbOkom9uAMDqz4IfU7toMwlarfJU2QTBvADMy1NVf+EmFJtbOrubY70Qvuw8sJTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bmuoQToR; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-607d9c4fa90so10340577b3.2
        for <linux-usb@vger.kernel.org>; Thu, 15 Feb 2024 13:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708033238; x=1708638038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsnAtjU2mPAAfpNGCz4g3Dm6lnsvArvGReC4ZihyohI=;
        b=bmuoQToRkiV5kMrr/IAaWFqtyr9IyXQ/31HQ5zGKTi38d+qJ3ovqhL2V9UiIIJIBG2
         /jmlvmzNE4K3dT8XHneUa7j2ZvfVJlj89ni0RKrBLTpzseAOm/ihYIRd08XlJlBgZ4GH
         bI0SoTj82aa+/k7syhdTrtulEg3I97n+kKwIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708033238; x=1708638038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YsnAtjU2mPAAfpNGCz4g3Dm6lnsvArvGReC4ZihyohI=;
        b=KcIrJ4P+dnic4DF6kzGBykq24RHiCcw4sir1gfjpXLegsdGSPvW4wzM8i/uK6zRgSC
         Fd89Obu9rBx7b4xqbv48OHsTDc15FZuBPkSPAwEEvQw7ClU8JVSg4i3L5yh+SukxMwI/
         UTYBRMrO8JStOZXqDjnOJRQe7rkLhnCrPuiV+d85JJjgB0ZjnhBjF/97ojV3wEUdEY03
         hbG8Yh05ibfInVaaDKz3P3eoh5XE3Vt/18ifD8xbTBzf/YGvawGLdHqVHN6rYLiNxAK9
         pRSDBDuYdJGGWyMrnEKL7qjGL1JI1nz4KsyxvhF0gWNEUrii3hf8AXO+YJNp7qrY3LL3
         oXqA==
X-Forwarded-Encrypted: i=1; AJvYcCUN2v+rM85oUhz9dFvGZS9XBp7QsY44PPmYjBYGLIKIunqRmMIdQXFHa+cPoOV0EUCFbY3gV52U4GHaA1f7CeSGJps3DUPWZRwR
X-Gm-Message-State: AOJu0YxFeszerJ3FM2SaA8GanjFQ5527PKbJHa59SExaEUnB3mrUEW5J
	2OHq6cM14Qvk9H/ixRoCBJSXkmApWQU/anbLhZnYt2VVnIPErW88NfAEYgAw+Ms+ic8hryvIL3k
	LhTNYmaqEimp1to2I6voaj3gi9BSEOQsBgeQb
X-Google-Smtp-Source: AGHT+IFFJZz1AixfEZPFjbq3GjjAIwjVyELh8m7QgICdJ6b2qqf0qObYoA8ml0cEwJpf0bLI9YyFSUr9jUhO6pHn2L0=
X-Received: by 2002:a05:690c:86:b0:607:d9f7:e884 with SMTP id
 be6-20020a05690c008600b00607d9f7e884mr2877483ywb.4.1708033238558; Thu, 15 Feb
 2024 13:40:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240209223824.622869-1-abhishekpandit@chromium.org>
In-Reply-To: <20240209223824.622869-1-abhishekpandit@chromium.org>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Thu, 15 Feb 2024 13:40:26 -0800
Message-ID: <CANFp7mWoUFZ_J-yYqCj9AE_EymQBR_3czFHxLKvZ7ZmBJe-u7Q@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] usb: typec: ucsi: Adding support for UCSI 3.0
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: pmalani@chromium.org, jthies@google.com, 
	"Christian A. Ehrhardt" <lk@c--e.de>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Hans de Goede <hdegoede@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rajaram Regupathy <rajaram.regupathy@intel.com>, 
	Saranya Gopal <saranya.gopal@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 9, 2024 at 2:38=E2=80=AFPM Abhishek Pandit-Subedi
<abhishekpandit@chromium.org> wrote:
>
>
> Hi Heikki,
>
> This series starts the work adding UCSI 3.0 support to the UCSI driver.
>
> There's a couple of pieces to start here:
> * Add version checks and limit read size on 1.2.
> * Update Connector Status and Connector Capability structures.
> * Expose Partner PD revision from Capability data.
>
> These were tested against on a 6.6 kernel running a usermode PPM against
> a Realtek Evaluation board.
>
> One additional note: there are a lot more unaligned fields in UCSI now
> and the struct definitions are getting a bit out of hand. We can discuss
> alternate mechanisms for defining these structs in the patch that
> changes these structures.
>
> Thanks,
> Abhishek
>
> Changes in v5:
>   - Change min_t to clamp
>
> Changes in v4:
>   - Added missing Tested-By tags from v1 and reviewed-by tags.
>   - Fix BCD translation of PD Major Rev
>   - Replace IS_MIN_VERSION macro and just compare version directly.
>
> Changes in v3:
>   - Change include to asm/unaligned.h and reorder include.
>
> Changes in v2:
>   - Changed log message to DEBUG
>   - Formatting changes and update macro to use brackets.
>   - Fix incorrect guard condition when checking connector capability.
>
> Abhishek Pandit-Subedi (3):
>   usb: typec: ucsi: Limit read size on v1.2
>   usb: typec: ucsi: Update connector cap and status
>   usb: typec: ucsi: Get PD revision for partner
>
>  drivers/usb/typec/ucsi/ucsi.c | 49 +++++++++++++++++++++++--
>  drivers/usb/typec/ucsi/ucsi.h | 67 ++++++++++++++++++++++++++++++++---
>  2 files changed, 110 insertions(+), 6 deletions(-)
>
> --
> 2.43.0.687.g38aa6559b0-goog
>

Hi Greg,

This series should be ready to merge. Please take a look.

Thanks,
Abhishek


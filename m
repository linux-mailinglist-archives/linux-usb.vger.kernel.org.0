Return-Path: <linux-usb+bounces-15103-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 23887978776
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 20:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDFDFB22E20
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 18:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BCBB6F31E;
	Fri, 13 Sep 2024 18:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FPBntywq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E17BA50
	for <linux-usb@vger.kernel.org>; Fri, 13 Sep 2024 18:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726250587; cv=none; b=rVfVsWMUcAUJocpnuMQFSxiYoZnMv+mUOHcBzuj/EgxET9H9W9t3W5IimUZ4TC3DXZ3Sz8SxMjD4zAOfFKun+Y/uPgbjyyfvky+LHUeA54QuZ5h7N2f3YmFC90xL8g74oNDaNxEx7Qa089KT/bYTI68mxcZDREa6zV22ZI+juvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726250587; c=relaxed/simple;
	bh=UXOkfh0KcTju6djH7sIVB89zq8vPdKXMJhkLDkEvaUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eiZ5RjBCd8D17tpUHaB2WYB4Nx0AT6u5s8nk4We2R0T0jjchcLqq4cJDFRBC8OPxJf/9Kserim6HYYqZoRel4XdclzSwK1waTUieO8FbSDTWNydY2XSjb5hUwjQtuBV+8ayIzYhKV4/cq1OajJwfIP7e+Ol0bNm6i9ZxJ4WEhNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FPBntywq; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-710fe5c3b44so707806a34.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Sep 2024 11:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726250585; x=1726855385; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXOkfh0KcTju6djH7sIVB89zq8vPdKXMJhkLDkEvaUs=;
        b=FPBntywqsxArJi54K4PxjZdCs2Y8HU3hhwmDaz2q429m9R25ERQP0zx3BkqV72gsms
         UEhE0VAbKfw01LT9oL2yLHKxoIm7dL36ArSNSkX0KNtPaOlTCBwtpjUQrBVNPIk0R3ph
         +0SkOkOTAYnUGx8YyAkpH9bKioiU6yqRKNvQZjaQ+lDbldo4kzsQ33OdaepJn5hwr9+j
         W0xbTcAH/H/9Bp5q7Omdv4eW0ZTnwupdhkhKr1tMTMpqmlf7J2z5SwAfwRLawC9xvnY1
         4PtRMu13rg4gx1SWVokPOopH2N3AtgfbFAn3/tpKb8Xeri80N8qcrhMhYN+FEMKRX6+z
         aAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726250585; x=1726855385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXOkfh0KcTju6djH7sIVB89zq8vPdKXMJhkLDkEvaUs=;
        b=kUKrl7OBeSb6bXvdKbwoXdoM8DdwTMJh3206tczV7gk22YuJllIgkYP0KPx4ogNQQd
         6mxOW7icrKxQrXD08oP29B8B7OcS1GPjqIOe6gw1Z1rARzUMjhktCfVXF4cLUKEB0SE4
         6vLGiCDoK0C9Hx3H19BIunrj5paYo5FRVuV8syS3PHHvVVEJb5iLNapOWuMlaf65ZY+u
         ihBptHNqfwMm/1nZWlAIKyr7LOIiljaYsZTmZIeZTLigyuKSKHiP4I94kHTJ+oEny+12
         yYyaU32fqK7DyzTxV3vfOU5Kf8tQ6qXav3tryiMZif/gPCw3TGcWpeorVfV/7aQdTfMG
         ImKA==
X-Forwarded-Encrypted: i=1; AJvYcCU3BU7CFJazgoG53aWQDuLj9PSiF+ALMm94fPITyQRaNhX9NZrND5+PUKs2k/8hjwEvDAHrECnDZmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeRqmmdd+VvgoeDZOMzGIWEomRmZI05I5ajp1k9KXmZQdMZIbJ
	ge/3NUZpglAxHU5F+MY0a4ZqByPqopz0m4RzCtdM+t3DRJufEmo/FS6a/Z4KjMww5yYcgn2N+Ui
	cvi7XqqgwY+i2+m9m8bb0u45/2DQxxOsg6BxiTE/VFq9IssLUbQ==
X-Google-Smtp-Source: AGHT+IFrf2QUiZsdEKs4/Sf36WYr8jWjIM29ElW6cJcACEnzKBzgpfdB7Kxl5d/I2hCYcFryV9WuyJMJ0IY43uIBeDQ=
X-Received: by 2002:a05:6358:3a06:b0:1b8:6074:b4e with SMTP id
 e5c5f4694b2df-1bc394937d8mr183875455d.9.1726250584950; Fri, 13 Sep 2024
 11:03:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906005803.1824339-1-royluo@google.com> <20240907005829.ldaspnspaegq5m4t@synopsys.com>
In-Reply-To: <20240907005829.ldaspnspaegq5m4t@synopsys.com>
From: Roy Luo <royluo@google.com>
Date: Fri, 13 Sep 2024 11:02:27 -0700
Message-ID: <CA+zupgxMefawABGDkpRy9XmWJ5S50H1U9AF9V3UqX2b5G3pj-Q@mail.gmail.com>
Subject: Re: [PATCH v1] usb: dwc3: re-enable runtime PM after failed resume
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "badhri@google.com" <badhri@google.com>, 
	"frank.wang@rock-chips.com" <frank.wang@rock-chips.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 5:58=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys.=
com> wrote:
>
> On Fri, Sep 06, 2024, Roy Luo wrote:
> > When dwc3_resume_common() returns an error, runtime pm is left in
> > disabled state in dwc3_resume(). The next dwc3_suspend_common()
>
> What issue did you see when dwc3_suspend_common is not skipped?

Apologies for the delayed response.

To answer your question, if dwc3_suspend_common() isn't skipped, it
can lead to issues because dwc->dev is already in a suspended state.
This could mean its parent devices (like the power domain or glue
driver) are also suspended and may have released resources that dwc
requires.
Consequently, calling dwc3_suspend_common() in this situation could
result in attempts to access unclocked or unpowered registers.

Regards,
Roy Luo


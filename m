Return-Path: <linux-usb+bounces-8447-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DBE88D517
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 04:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB9711C238CE
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 03:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E499022EF3;
	Wed, 27 Mar 2024 03:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="acQVVFBE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E7722616
	for <linux-usb@vger.kernel.org>; Wed, 27 Mar 2024 03:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711510835; cv=none; b=QfkoS60E/TMa25rcgx4sp/c6Tc/3v7NRrOAdWctH4fsZknLSDcYmIAvNMooVV9kKzPAaZoDRAGh2cvxe3bWg6KkwrmPZj8FHgVx3inUx8PLPTv/xeSWUUUL0UQyoxWQ59aPcBy+oWDoQs9U6epHlJJSnO8+/AAWbX2jecSMYfAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711510835; c=relaxed/simple;
	bh=xd68Irl7FMjiKDIsBgFShbHmbskF4+/kOHVxexB+nws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L/ShWgeEIPQVnAkpclVzd5uyg5oZ/zbQR5BIh8cf9vgsmsf0p9DHzsP/EslBBv4ngZcEoCZloHYYuLYXI4rYIzw3AtsbanPoE8nTbHuJOsWpbaV0YX7cQwic7G3Vn12PkdagfceB3MxMIDV+e9bbrnE5PUSSP8VE01Ma/whAPPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=acQVVFBE; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4765cffb446so2706127137.0
        for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 20:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711510833; x=1712115633; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xd68Irl7FMjiKDIsBgFShbHmbskF4+/kOHVxexB+nws=;
        b=acQVVFBEWn0RSwHrj4H12T2aWbOtW+7zWecBLgI/f2An9AVs9A49kRRoco8PsRWwcL
         oybQQGbPgsoa9UqAMZuNHwgfsFExm56H4CBYQ/PuXuMhmgTkubA6MyD8IEt6Gj9yYP2S
         HfWPngnuutuTH8trcTb8S/sHhQlfsa3pvmEWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711510833; x=1712115633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xd68Irl7FMjiKDIsBgFShbHmbskF4+/kOHVxexB+nws=;
        b=RpnCTsOSlNSqGHuqazFZtl8SQvQuAj0zdK7/2ASyjI6Pxyt3agoqwXVRFD0d7oD5kH
         BBLycHAl17DtUg7AN9nT7eywb1MqVtqzxhDrkYWAoXJqpMgvJkKdPPRKYWZFqBoQVXDk
         NndXiunJNebmG/gS4KDaHJ2pji1F/biuB3SQJvTDj3/XuZqqQhWBN8edouHw7jMv/m/w
         lT4zGESVKa+fZqm7AiEK11a0lPymrfF7WwIIytyYIUEEN4xA+q50tYYgV+N4PEkP9iQq
         bwLh8tAJ+0fwdwiEKg0fOuERam5PRbjfLEvlHdQUp6AlZutYa6/QCvIkCFNo53s5MgB2
         M9cg==
X-Forwarded-Encrypted: i=1; AJvYcCVeLmSrKnWQkNvTMJrSCSeWGR/OIZ93ZPjdwI0mJRvSTgdtUnwtNvHMp50k7MbQP+PAMK2f1lto8Zm64yXQVtffGcIOi/1LE+zm
X-Gm-Message-State: AOJu0YycmeE/3OA0cuoipKZeFNK1VyUt7a8QuKDxBShxVvGKrstxHq3m
	RTa0bHfu+pLL7ZjmTTy1ACp/d4wWQubeiBt2gKOtP8YWIirIpxbKkJAzUZiitbCnmsTPt621XIw
	RJ1jBZ7EKS5aqdde81qpRv6F35fZtj4vJt9Xw
X-Google-Smtp-Source: AGHT+IHGCiSeNt+YDldU30wn4bEUUkwnwRNEFj9Oa4heTmCMtNShSI/XEU8q4wWwhvcP+br+a93tjCv/SBIw00jIxIU=
X-Received: by 2002:a05:6102:510c:b0:476:db9b:c60e with SMTP id
 bm12-20020a056102510c00b00476db9bc60emr3593266vsb.24.1711510832875; Tue, 26
 Mar 2024 20:40:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325-public-ucsi-h-v2-0-a6d716968bb1@chromium.org>
 <20240325-public-ucsi-h-v2-3-a6d716968bb1@chromium.org> <62b2c29f-ca1a-4131-910b-7b9b62a5577e@kernel.org>
In-Reply-To: <62b2c29f-ca1a-4131-910b-7b9b62a5577e@kernel.org>
From: Pavan Holla <pholla@chromium.org>
Date: Tue, 26 Mar 2024 20:39:57 -0700
Message-ID: <CAB2FV=7fqsdDuuxZb4dte+Nm4-Pijk20hGzbT8uvzQKsAfup3g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] platform/chrome: cros_ec_ucsi: Implement UCSI PDC driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thanks for the review.

On Tue, Mar 26, 2024 at 1:47=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> Nothing improved.

Yes. I only added maintainers of drivers/platform/chrome in v2. I am
still investigating why MODULE_ALIAS() is required.

> One patchset per 24h. Allow people to actually review your code.

Thanks for letting me know. I will throttle future patch uploads.

Best regards,
Pavan


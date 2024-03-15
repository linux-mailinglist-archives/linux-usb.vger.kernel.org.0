Return-Path: <linux-usb+bounces-7966-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0352087C6C4
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 01:29:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACE33282A4B
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 00:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E91EEC4;
	Fri, 15 Mar 2024 00:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WfVC3ChO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C775645
	for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 00:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710462578; cv=none; b=YPr4kF1sc6xan2d+IgX/IapjtPg7l622OmeNc014n7ht9JT8/G+rVv6kZaIzZ1hD69dnf25HCUv0IuxMnjRPGM1cBSzd/Fjd4NKyR/TBciAoBxBkCUemciDYE+XKQKvD0KsLotDZY4/otUw+73gdtM+KcIAW0N6qr3bF7KOba5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710462578; c=relaxed/simple;
	bh=+8bX23t2xarizQFcQxqmoBbiKjw9SKjnmnIQlaEiIVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BCZwHYRjHOBiYXYtPu9o3SCRj1WZqggkJQeFkrZ57ZFUZzW62Q8bdOkMEZpSlWmqT1G5QuGtgeb2TkncXv5a4N/Q4CopsAND46prZYMHli8iIGG5OZ2HT3eKI9LabdeBnw2G2zzAypr59IT1ZxXCAupLpfmVNIXMkAP5Q+kKGCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WfVC3ChO; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3c1ec2d05feso781852b6e.0
        for <linux-usb@vger.kernel.org>; Thu, 14 Mar 2024 17:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710462576; x=1711067376; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNFfdKqq/05p9oLlTWJ5z9qjECgP4/UvCZ0QuH1OGV8=;
        b=WfVC3ChOzDZnHM0dKeUqMoHkWvKRxAlM7bAfMMXLBelD/BAFPVuwZsEKh96HwHTm5x
         8IRsWtZQgmdToIF1ycojkk7Uq7woJExjDQ6VxOytEhsSuHfFtgGY+38r5QfnFQydhehl
         4YKyYb3ABLM+wdOC99siuvByTiFY/c++Y3G+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710462576; x=1711067376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNFfdKqq/05p9oLlTWJ5z9qjECgP4/UvCZ0QuH1OGV8=;
        b=PPSDkNngJqBzfJDf0ZVQtgS7UXzBMBzmSesBqd59n5Qx3EBRUlXNi9gaMFGkkZGzXG
         z4VPHxiYfQpWc7J15eRZebQ6PF/r4JoUbCmA6pGX0Z+N7fyhpaEPQJq2aqs2kywJumZD
         S2PbjmzMdDrzJg2fym22JJZripSIPYLp/7ublpmrr4GfsXtDCQzbz6ctJJVG+qeIzjfc
         xbvZYWACiq9SFdwCJEp0+eowZZsEfJidWGqnmrjeKri22YHral8EsigiOqPkJaTE8Q9v
         3Ni92JEIjtYcT87rNGG6os2N8bCAgOzNQztsCc5/A5VOquiqL/KLgzJKT2Vgw4QveyXM
         Ob4A==
X-Forwarded-Encrypted: i=1; AJvYcCUEeYeCQ0jpymMLz+T0GSot6AIzpoVWnyEgdwDt9e7HU5WneFrHZtsrN2ufCOG8nD+wnPz8MV5uck3drugsiqkIirGI/dMk9nay
X-Gm-Message-State: AOJu0YwBrP/5hbl8HAxFLrWkZemqq4ZWmTc0tsdgiu/B9zQQvJ/eZ5cf
	V9mlFcrsj19kqHSKxOwoQlMoLZQx7oJGM52nEJp40wkaJwgflIMZBg8UzLMa2FHWtGZ4Ye/CAA/
	AmEGkVR6m7PqofOCqEi6u83h7Cp5HOxaMMfLy
X-Google-Smtp-Source: AGHT+IH+oKeXCOO7kiqZPWJ9T0ruPcBv2Y+wD+2CS70Jv8YymEb5hpl1hJJ8jnJscgEJlY2I8DAMpcDcY3c+aJTjtWQ=
X-Received: by 2002:a05:6808:448a:b0:3c2:1805:8cfc with SMTP id
 eq10-20020a056808448a00b003c218058cfcmr4809915oib.53.1710462576367; Thu, 14
 Mar 2024 17:29:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240314235554.90079-1-jthies@google.com>
In-Reply-To: <20240314235554.90079-1-jthies@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 14 Mar 2024 17:29:24 -0700
Message-ID: <CACeCKafSBVRkzJOKKPSt8rdSS6bsXrjuvr_OW7YXE-Oan7N2Sw@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] usb: typec: ucsi: Check capabilities before discovery
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	bleung@google.com, abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jameson,

On Thu, Mar 14, 2024 at 4:55=E2=80=AFPM Jameson Thies <jthies@google.com> w=
rote:
>
> Hi Heikki,
>
> This patch updates the UCSI driver to better check the appropriate
> capability bit before sending a UCSI command to discovery cable and
> identity information.
>
> These have been tested on a the usb-testing branch merged with a
> chromeOS 6.8-rc2 kernel. Let me know if you have any questions.
>
> Thanks,
> Jameson
>
> Jameson Thies (1):
>   usb: typec: ucsi: Check capabilities before cable and identity
>     discovery

Just something to keep in mind for future patches: it's OK to upload
single patch submissions without a cover letter.

BR,

-Prashant


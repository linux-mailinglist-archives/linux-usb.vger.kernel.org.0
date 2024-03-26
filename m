Return-Path: <linux-usb+bounces-8442-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C3288D2EE
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 00:49:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42D372E1ABB
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 23:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24EB313E3EC;
	Tue, 26 Mar 2024 23:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lZVa/qM1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1044A13E058
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 23:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711496951; cv=none; b=krQdYRwUg8xgv5N/EuVlznPKLkSYePxSak49ggqSyTkRjiBmioxcT35QUZ9IgZ7WrhzQJsUrUp+Hv0fNT3ijSG5JMUiJ0YLQJaRPoxC+cZlJ3X/Hbsf+L2WYiBoJK1FqF0+Pbpwg4XTQ3KNOIKbYurF7FnueZut8FX9ivobmVyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711496951; c=relaxed/simple;
	bh=+lNYPPUuU4qCCfbZl+u/vUnP2u9x2iU8g+hkyYC/s3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mep4h0BLsyhO4KrOB8vg1hrwZnAfxjXSJ9Q7b5oa9BQidft9Af4FTeOsXS320KcN1nP5RiUxQnxT/wv/zfkY4qHXuye75Km0SyyAxP8ePwJUgJmcdMn/UL6cRsZsNBo6Zs6EmIrWiEa3e/tEPmkjoZ9jUe6zDr+1xOA/ySGe1s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lZVa/qM1; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-7e128b1ba75so661886241.3
        for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 16:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711496949; x=1712101749; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgM3qLWsfwfIOap0//JWQ8L3ny8CBVn3j70yjvXP748=;
        b=lZVa/qM1B4R7pnGRLfhqerT7Ngip0KyJGCGaNYdb/QSdQ7w5ANkhrMpK6ZStITD907
         uDj/0B18XUx9YN37mOgoPnvZpQW8ffPjH5qQ1dsmdD/EJdnKrHbANo+TPodedFnwLokw
         gecGW5srNaSSsjaxf+g7V2Sm4yf9pwyS1z/CU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711496949; x=1712101749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgM3qLWsfwfIOap0//JWQ8L3ny8CBVn3j70yjvXP748=;
        b=ifSfCtlDjb1n0u1dfiaMXBt9KTE/KSGfqWJRTT4hPWSRdZB3+rSz7KbRigraggJuRR
         rbA0/Kz7VVeJpU+nCFSUvGaEHXsSEZGqncjsfsw/HF2G6bX/y+Mllj42ltqXluCxN+L9
         MZiFabaSsi/ccKmw4JMdcslR4vqIVQ0gWZ0A8XZKnOuEIgavIBhZcLLrkv6ZNCaCoMqX
         N2c58MOwk8MuM0igJWbOsASQ9I/QG1U8Cx/BZjeSKXN8FjAum6NZtTslkLuxhYhi9YrC
         vVaLB1yCkKSr0oHAnYhpd8lOr0bUwZqbUudrmb9EdqbezLoS8EvVC1TtIxXzXZPj9YcS
         eWDg==
X-Forwarded-Encrypted: i=1; AJvYcCUAljSzcgX/zm6id9TnwQmldjiUV3+KOM6OEheGZVTCBbeZEqVsxEXpSlVWrDNIgmNTOmw0q77JY55LJhM23bUitmuJvcJx/UL6
X-Gm-Message-State: AOJu0YytZp5qAR6J1C/q2e+34TUB630bOuGd5GP21RPQHWrf5a9O99e4
	cwzsS2Zze8gucLWOMNkROn1n7SYJxyPfjxGcOqlLBEOE+GAvhIZweGcKJT/bTZ1Zk1nzW5s74Kh
	hd4vBBXsNcH6pv0mI59YnRM5ebFEDu2Qu0iUQ
X-Google-Smtp-Source: AGHT+IFQR1LE4IGpHWOgN68Bu1/0frk/Z/b02yz/ER26JmP39OA1O2ygzenFSkITtcJvH3+gAKLR9RUPuP7BAUGizPI=
X-Received: by 2002:a05:6102:c2:b0:475:111d:c0dc with SMTP id
 u2-20020a05610200c200b00475111dc0dcmr8786314vsp.14.1711496948974; Tue, 26 Mar
 2024 16:49:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325-public-ucsi-h-v1-0-7c7e888edc0a@chromium.org>
 <20240325-public-ucsi-h-v1-1-7c7e888edc0a@chromium.org> <2024032603-tactful-exes-f2d0@gregkh>
In-Reply-To: <2024032603-tactful-exes-f2d0@gregkh>
From: Pavan Holla <pholla@chromium.org>
Date: Tue, 26 Mar 2024 16:48:33 -0700
Message-ID: <CAB2FV=7MgEUj+sr0UiJ9-Kru2q81g1-Jk0RGUeOZ8XzF6dZ6DQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] usb: typec: ucsi: Provide interface for UCSI transport
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Thanks for the review.

On Tue, Mar 26, 2024 at 2:12=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> No copyright line?  I think your employer would not like it if they saw
> that :(

My employer ( Google ) does not want me to insert a copyright notice
if third party code
was copied verbatim. I plan to squash commit 1 and commit 2 in my next
version so that
the move becomes clearer. I will keep your comment in mind for future CL's.

> Please get review from some internal-to-google developers before
> submitting your next version of this series.

Acknowledged.

Best Regards,
Pavan


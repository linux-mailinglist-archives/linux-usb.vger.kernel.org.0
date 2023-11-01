Return-Path: <linux-usb+bounces-2418-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBF07DDBED
	for <lists+linux-usb@lfdr.de>; Wed,  1 Nov 2023 05:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2FB02818BA
	for <lists+linux-usb@lfdr.de>; Wed,  1 Nov 2023 04:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2843915BB;
	Wed,  1 Nov 2023 04:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HPOr7tlW"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1DD7F
	for <linux-usb@vger.kernel.org>; Wed,  1 Nov 2023 04:42:18 +0000 (UTC)
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6177ED
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 21:42:16 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-4584e93ca8bso2694224137.1
        for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 21:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698813736; x=1699418536; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgH3+HSLjETT5wLuuz9AiA0y3mldkhc/pGAcIcF0398=;
        b=HPOr7tlWDtj1r7EhuTvm6NgawnYJHRhVxrQ1DeukYuYZikSK2ybtSZsvuf8IpVoTur
         /zZ3k8ObgekeLr/qpoqKTczRAphN+rSz86yXkSdBCtHgSacRnfVYI5iusD7XWrNcd/Mr
         oxIZupMjxeBxa/BTceLYDlaTaO/EkbyLwD9CNPwU7cBxB9pCUoxPNuFNgyVaRaQidmGF
         I5VB2JpuMGf9+s6pCiKTe/6ZWEREHofMLMzxr71xYJPGNCe0AxicUTjAo6ZXJwIHTQgB
         ebsjaV3PRSrUof5yrYoF9rMQxzvPJCFIEnkOLwcAV0IA1JDUgFqXIM/2a+Wd5CyQC3te
         rMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698813736; x=1699418536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AgH3+HSLjETT5wLuuz9AiA0y3mldkhc/pGAcIcF0398=;
        b=IMGVUgxJs7raOhMJNjXu3Hy3Ir3mOofGMLGUbYd54TxHd4eQ8gbpJVGuBk2efsi44P
         v47Is3X7fZPN8Feq73A/R2oUtlgKZ0ubvDYelpA/QUbh3l8okX01q6OSXl6MySMyJRop
         km2E0wG7jZjeVSVQKDoNiyY5zK3O/oLK1uHttCbDzlSzvD/4w4kqgHv2ou0nUwIc8MuU
         g8/vOdPJVzbikaH7bFi/f/ji9Prlpa2bzlmbeDpwk8WVQYMAds2B2j0dzRNn5AnlQKsY
         1v2AEi3e7ARp2syPQdO1w1YlDcVkYl1Cxl1UfNLQbidBmzd1cKFqNRRM7qmZ12C+lqAi
         I8Bg==
X-Gm-Message-State: AOJu0YyrohbsN1y2kX+hMClgtG9wH7MR8dBHoZsywaScNxDPrKrx90a2
	/qKZgheIW9XCRDUWofZdJmJzhK4sVays/qV1x1n7LaKdxK9rLMuSezb+fw==
X-Google-Smtp-Source: AGHT+IHwPNtghu32HE5o0YvdXHVy1gAosLlFpssriydow3gFdL0loxYzv/76Zvu0G96qi1rk3zj6nssPQCL3MzyHtjs=
X-Received: by 2002:a05:6102:aca:b0:457:ee76:4317 with SMTP id
 m10-20020a0561020aca00b00457ee764317mr14206176vsh.0.1698813735673; Tue, 31
 Oct 2023 21:42:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231031044021.1162403-1-mnkumar@google.com>
In-Reply-To: <20231031044021.1162403-1-mnkumar@google.com>
From: Naveen Kumar M <mnkumar@google.com>
Date: Wed, 1 Nov 2023 10:12:05 +0530
Message-ID: <CA+Hc5+5ZmywtRdu5KQ=jbgx114c8eJc=TY_KQWWyeuiAC-_7MA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add a quirk in xhci-plat for parent nodes to specify
 no 64 bit support
To: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, royluo@google.com, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding the reviewers/maintainers I missed in the previous mail to this patc=
h

On Tue, Oct 31, 2023 at 10:10=E2=80=AFAM Naveen Kumar <mnkumar@google.com> =
wrote:
>
> From: Naveen Kumar M <mnkumar@google.com>
>
> This patch aims to expose the XHCI_NO_64BIT_SUPPORT flag to the parent
> nodes of xhci for clients to specify if they can not support 64 bit DMA
> memory pointers. This issue was observed with a Google SoC that uses
> a DWC3 controller where the virtual address's higher order bits are
> truncated
>
> Naveen Kumar M (2):
>   usb: host: xhci-plat: Add quirk-no-64-bit-support
>   dt-bindings: usb: add no-64-bit-support property
>
>  Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
>  drivers/usb/host/xhci-plat.c                        | 3 +++
>  2 files changed, 7 insertions(+)
>
> --
> 2.42.0.820.g83a721a137-goog
>


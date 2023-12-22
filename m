Return-Path: <linux-usb+bounces-4513-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E22081C3D9
	for <lists+linux-usb@lfdr.de>; Fri, 22 Dec 2023 05:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B25CF1C2460E
	for <lists+linux-usb@lfdr.de>; Fri, 22 Dec 2023 04:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F901211C;
	Fri, 22 Dec 2023 04:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OOdTWeB/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C61E5395
	for <linux-usb@vger.kernel.org>; Fri, 22 Dec 2023 04:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ccad57dadbso481061fa.1
        for <linux-usb@vger.kernel.org>; Thu, 21 Dec 2023 20:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703219482; x=1703824282; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UBqYUMDRSmD5MTMI1kcx3bvD/seUrQpIK9x37z1DzRk=;
        b=OOdTWeB/Eq7tsafVvRhRGvdimsHswUzkzCXxgW2kBrTij9ZbU7iJUhO0fudsOjFIuJ
         0qEXHZpNp34dpDOZqxpprHihwKMVNu0aCDE3RdEQIDYkKdwnmcKq2pUkB5MI2EXWU6Ke
         FquHucmfA9DIsiUZrz0fF93hbIVfJcShwd0NuwqrCMYRlTEbznL+fFvTAmNyEGVborxr
         6MFuhc2wud7weP3kFEUsYetM3jWud6TXYe6sFi3gcvrYRl0Vdqb1/slcB07nkBteTB/O
         q5kT8MMpF/9cUTPns16/mWDXeYFP4Znk/Vi8Cwuj7Z2mz2yGOHN7j3HnB5RCxv5wVR2b
         89ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703219482; x=1703824282;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBqYUMDRSmD5MTMI1kcx3bvD/seUrQpIK9x37z1DzRk=;
        b=I4VC0ezgugs2g6OBZAzisomIGPVMvPTu2Qrz7QPHF5y8D1Q58f9F9nX07puYSKqGdG
         7U79J5OfJby+CaGynSvuFYOWZjzU1CnQJWK+WDMC9NBJIW+bKKJtEfXSjzE6T1Ukoc7V
         JD+FEWpCcH8p0zFEHFoObGXTmBkbHnFw4EeUoCwLATNkftcYpFu8sQ0oO6ated5KGcL+
         sn2tRgFXKCrNxzVLBY1WOf8p7OyKoBIeFEGm3AOUk70tEQ9b1LayMOprHeplTO/LKBUY
         g1SvqAzgIBFUz2u/mB9OeeGhYsckDhnfpRco+qo6vHXzM95QCMjWNwyghlcXjEbE2tcX
         xINw==
X-Gm-Message-State: AOJu0Yw/EUtIlrRc+mb4eQlFxYFGIg2KGIIxQCJ0vRWbjMm06zbIk91o
	FrARaceGx5mFdkxxstmiNKaYc//2Cc1kWYv7kR+UXikHyJg=
X-Google-Smtp-Source: AGHT+IFIMwO92XAflzm1/Cj/MLp00ZAGA2h5gGzNBcLd8q8xyChc+ZNqCdkzNRH7rGkgAJl/kitx1/qpp+C6dY/3mpI=
X-Received: by 2002:a05:651c:507:b0:2cc:9ec8:fc5a with SMTP id
 o7-20020a05651c050700b002cc9ec8fc5amr350772ljp.39.1703219482295; Thu, 21 Dec
 2023 20:31:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rajaram R <rajaram.officemail@gmail.com>
Date: Fri, 22 Dec 2023 10:01:09 +0530
Message-ID: <CAOiXhaL4E-PwoE2=DK2SQUxAoB+Y6xEw2KZAHjtAjR9=84X65g@mail.gmail.com>
Subject: [ANNOUNCE] libtypec-0.5.0/lstypec-0.5.0 is released
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

libtypec
++++++
=E2=80=9Clibtypec=E2=80=9D is aimed to provide a generic interface abstract=
ing all
platform complexity for user space to develop tools
for efficient USB-C port management. The library can also enable
development of diagnostic and debug tools to
debug system issues around USB-C/USB PD topology.

Tools :
+++++
- ./lstypec : https://github.com/Rajaram-Regupathy/libtypec/wiki/lstypec-:-=
Know-your-USB-C-Ports
- ./typecstatus :
https://github.com/Rajaram-Regupathy/libtypec/wiki/typecstatus---Gauge-your=
-USB-C-port-for-better-UX

New Features
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

libtypec-0.5.0:
-------------------
- New packages in DEB and RPM formats for easy installation.

Release:
=3D=3D=3D=3D=3D=3D=3D

https://github.com/Rajaram-Regupathy/libtypec/releases/download/libtypec-0.=
5.0/libtypec-0.5.0-x86_64.rpm
https://github.com/Rajaram-Regupathy/libtypec/releases/download/libtypec-0.=
5.0/libtypec_0.5.0_amd64.deb


Return-Path: <linux-usb+bounces-17808-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC8A9D6938
	for <lists+linux-usb@lfdr.de>; Sat, 23 Nov 2024 14:18:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 017C016164C
	for <lists+linux-usb@lfdr.de>; Sat, 23 Nov 2024 13:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B8B188583;
	Sat, 23 Nov 2024 13:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNMwNY1o"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2650023098E
	for <linux-usb@vger.kernel.org>; Sat, 23 Nov 2024 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732367902; cv=none; b=WdVDtIKvVMuiuIKLieMoltnBMjEOH1f6CCa373/oHAz0K87KjDsYvjwqhsJj/K99jBFVbXSEQK/ytiN43e8FpPVnWeeh7/LYo9GBgNkwXKsBKssyVxJEk0G7U2S4eNLWg8rId/QTY4gob4hWUnKYNEoBM3aJcfc2LK0yYJSRr3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732367902; c=relaxed/simple;
	bh=jhouNhv1YxbxM0So1ziNb2rhNddly5qP18hILEfCP6I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=p/n2zCei0n9IZD4SpuSRBNWPcLZcZ23XkscDvh4D97i92h5PXjkoVCrbNxhK/jk4fLWf/vS2OyqMdPGVgfENhFO55+GoCOtsStL0th8SH4E44H5lH+HYaZx4aKrjRC1UwuNeL2U7V1x8KEBrzg+AELzmRtqFZDe4ICzwE9Vqvrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNMwNY1o; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7b1505ef7e3so181126585a.0
        for <linux-usb@vger.kernel.org>; Sat, 23 Nov 2024 05:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732367900; x=1732972700; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jhouNhv1YxbxM0So1ziNb2rhNddly5qP18hILEfCP6I=;
        b=JNMwNY1oNmi9JhWjdm0fOPAFGf3VhK6b4TXClV3VM+jqeKoVhvIpouhRDGrjWX61ha
         Crvj3yZHNEa/v5+wRVwLkhVlKUfpsGCYghFKfmTBQhA8ZYUZPhlS9isR+wZv6mdAPqtu
         Tlv5MygS14EoogBRIaR+DVkK/YdWhbcB6jCQlJ1S/Omk5dI614Ll4pw3OvnOmp8KvHRm
         cTgMfxcZ77WOvkOArLEkL0bgfjEM9MUAs26QIQzKwTMn94o8GHB9L0bkfVITKxBHa3mL
         tVzP8Z/oYsOdn9KQVxkNko8mZT74HfgOWJNeE6My1zhLRv0M3r1HzUwbqMeRtkvtoTdP
         1sgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732367900; x=1732972700;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhouNhv1YxbxM0So1ziNb2rhNddly5qP18hILEfCP6I=;
        b=LKi8vSGnX9/I2un5vR/LZutAqmU03/ExVQIEVprhvt/fGlUO2GtgXPhESPMNBdU4nC
         B1UBMaxnoHgJ8ROCUr5dwAEQixSdgWih26OkK0IFtF7qtZtPvjq9k8BfcNiTbWI20nV3
         2kv8iWgcl+gJxgt35MDEUec21K3AXHbIcW4YM+e68fVUDMFAWDglDXItpOpSg0I65qmf
         mkdBiDx/r4yqQwvHlTNvras4+4lcyg0dbi56irXdBhnuJNeylCEqTArQDBUwBa8jtbPF
         GpTrXoiInJQ9PiRP2FMwaE2l2M5Cs6YrDwifvlwG9a1fm+PzEAAzknwd8CwcBhZtltz8
         av+A==
X-Gm-Message-State: AOJu0Yw52ofDNkOotix040u2WH4Hck1fcsOMuermR3GkH1G/lPyFH7s3
	UHKSULPqoqC3LZ1TGw2K9d9XFiNwPYOFREI8aj95X1AgW0DIoysP3yK5gH+HzK/odrJjMO8H2Xb
	TBI0krOKw07WdY5bBYlb8wcbZYCcx0JZhmXs=
X-Gm-Gg: ASbGnct8ICEKYUkiavt+Le3tUhFLYjSuJdQS//REM0WQYcWZie5dQ/2fVz23YdA56et
	qdu4uFv+YTdGcVyuIcKBFoovdzEvK3Vnb
X-Google-Smtp-Source: AGHT+IHhh0qLcZklZ9XpXVJU7PPHHkwVJM5rrxBUenLH8+UVpuEwoygrbbxYkZLMR0lq1n4bNdECCkTpAtxkP6SRpmA=
X-Received: by 2002:a05:620a:4548:b0:7a9:bf9f:5ccb with SMTP id
 af79cd13be357-7b5144e4bb2mr1011061685a.1.1732367899744; Sat, 23 Nov 2024
 05:18:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rajaram Regupathy <rajaram.regupathy@gmail.com>
Date: Sat, 23 Nov 2024 18:48:09 +0530
Message-ID: <CAD039W7srV=koLpQcTFsfkS=i4WSwx_7-eX_G4RxzxuzexkPrg@mail.gmail.com>
Subject: Release : libtypec-0.6.0: Adds "ucsicontrol" & "usbcview" for Linux
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Rajaram Regupathy <rajaram.regupathy@gmail.com>

6:42=E2=80=AFPM (4 minutes ago)
to linux-usb
libtypec (https://github.com/libtypec/libtypec/)
++++++
=E2=80=9Clibtypec=E2=80=9D is aimed to provide a generic interface abstract=
ing all
platform complexity for user space to develop tools for efficient
USB-C port management. The library can also enable development of
diagnostic and debug tools to debug system issues around USB-C/USB PD
topology.

What's New
=3D=3D=3D=3D=3D=3D=3D=3D=3D
Added support for usbcview GTK based UI application
Added support for ucsicontrol utility that let user to send UCSI
commands from user space

What's Changed
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
meson.build: fix 0.5.1 -> 0.5.2 release version by @10ne1 in #2
meson.build: fix soversion 5 -> 0 by @10ne1 in #3
libtypec : Updated declaration and definition in lstypec debugfs by
@madhum031 in #4
ucsicontrol: added ucsicontrol utility to test UCSI commands. by
@madhum031 in #5
libtypec: Fix BCD parsing of version from sysfs by @sipilla3 in #7
libtypec: Init Fixed supply PDO structures by @sipilla3 in #8
libtypec: Fix num alt modes for sysfs by @sipilla3 in #9
libtypec: Fix minor issues related to PDO data by @sipilla3 in #10
ucsicontrol:fix the ucsicontrol build failed by @madhum031 in #11

New Contributors
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@madhum031 made their first contribution in #4
@sipilla3 made their first contribution in #7

Release:
=3D=3D=3D=3D=3D=3D=3D
https://github.com/libtypec/libtypec/releases/download/libtypec-0.6.0/libty=
pec_0.6.0_amd64.deb
https://github.com/libtypec/libtypec/releases/download/libtypec-0.6.0/libty=
pec-0.6.0-x86_64.rpm


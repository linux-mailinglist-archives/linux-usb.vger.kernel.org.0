Return-Path: <linux-usb+bounces-23482-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D685AA9D8EF
	for <lists+linux-usb@lfdr.de>; Sat, 26 Apr 2025 09:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26CCC466056
	for <lists+linux-usb@lfdr.de>; Sat, 26 Apr 2025 07:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89D4224BC1C;
	Sat, 26 Apr 2025 07:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKywoSp5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938E01F4722
	for <linux-usb@vger.kernel.org>; Sat, 26 Apr 2025 07:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745651348; cv=none; b=kqfh9yIdWGpbvLZ9xWLq31fjUWJrpurjQeZQEtmkAgO7GwIsawpD4FWyZDSRO51fj9QJLihijU0zv2rw1nKNNWslGF06FLVBSaAfGLP5/JTLbf7bNwd/6xv+nR9ENZnzO6HGI/jyUaCmnsY8IenvgS/FOIj1FXAxFyVWsY1bnTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745651348; c=relaxed/simple;
	bh=m/YLWpmMM5laA4h3xJSj8kV8LBoPyFvsSHwVgBtoJyc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=CNfgxm7JrN+cvpVhreX3rB/OPNmQTKM3seT2poB2tFLsuhu9srvBI/6uZ4dpSuIYgAUhwGiw1GKhGPpe0Fp4iJ5S0MoBiNFs7L4e2+h+NJoZIuPY23+QeBfiFhn1pMIxrWwgcBpFtMmB4yixlwp1k9n31Zf9SDzcMDosSzN+QfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKywoSp5; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4766631a6a4so36210271cf.2
        for <linux-usb@vger.kernel.org>; Sat, 26 Apr 2025 00:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745651345; x=1746256145; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m/YLWpmMM5laA4h3xJSj8kV8LBoPyFvsSHwVgBtoJyc=;
        b=BKywoSp5rDKOkypNly6b1cdmF/sci8HUiwXlGnzlIj/0dxWKP/+lu1cuW+omafTYlB
         VnyTcyTbh3imeNxBY3+TkE/KVMOqPb4vAsOOzhUMBv2xk1AJ/2LBA12l4GkjqOiswyHT
         Kp6XIWLs6s4jPbAIgPisgGMF3cL4hl81kCJ7mXccAW//lskQVthSWZXZAV5OU14ls0QM
         4A9kyN59kO0n8WacyKWJIeL4riTHFzA6TjmsM9fE4o+Y9C6RUK9sv6NuOdkGrESVZa+t
         7A3mXGie3ieLrSQ1nc2Y6Yyp13u9W/pkSaNCPgZy2OTUqXJZnIRvjkj5cqMosHN3Keha
         K2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745651345; x=1746256145;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/YLWpmMM5laA4h3xJSj8kV8LBoPyFvsSHwVgBtoJyc=;
        b=Zw3TaoEG6tGvYqJFcZrXSdoxPmiA9J66CHjXSBZrRryQLVHU/0INlpElVIGoALEU8g
         miV/fHKXu2OUpokzfOXzekYKaYQlJNnCZlkBkI58BgwNFOPaUl3/SNyNAo574RmdoTqo
         wzj2+O+wGP/mjAPJYB5zhxHxwjXdJqU0mOZMgrG1/VjTmwvEnVnm5DFdExLid40DT1q3
         cr6cIBPkWJrnged6pSaeyzCIwG+cpU64Yx/jKJWihpQwO33MqEgqPkM3p6iUl3j0/kFi
         /iiYVVvQi7hhdUZBuvgbzmzRd+ayv8ngwaCIAsXFXuX7GTzMuw5Xe2C7BrjpfEVx5CWf
         JO2w==
X-Gm-Message-State: AOJu0YwEveH7vJFG5V783E2/SBpXpBaNnrrki8o9TYqegGJ6iSFE6V6l
	SAvLyZ16imPqLeK5tUp/V4nskP7wgBpuDvbcFbPOFoUhxU49Xc6KLZo8HtwdaVEBirOW5xJCrkf
	36UdgM9cZJ17v8KvSCdnMt94zlSQ6eLNv
X-Gm-Gg: ASbGnctJNYX+vOjblOQONkcqWFkdh82i6yZfCwqVBO1aWAG589NqjYQczB3Ss/+lz6Y
	eE5L7Dz5/CcosH/tTSOJpBet7Vcl4FcCveWW1Eydz1Q9cyHeGxOOLJNqmJi5UQgRiwyXtlEEpbp
	YfYh06+lqKMFZ/eEf9XJNtMVc=
X-Google-Smtp-Source: AGHT+IEtxKEYmuaW2omcbKc0tFsne6UuqIl6h3QiNqyW3mEJjxQCt/ao1ohRlz42VJwa6Z0M0xavJaUq48znyGEvIzw=
X-Received: by 2002:a05:622a:153:b0:476:5fd5:4de7 with SMTP id
 d75a77b69052e-4801e4ef5c4mr85224901cf.41.1745651345225; Sat, 26 Apr 2025
 00:09:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rajaram Regupathy <rajaram.regupathy@gmail.com>
Date: Sat, 26 Apr 2025 12:38:53 +0530
X-Gm-Features: ATxdqUGOGNLfGw8w-XFyKPW4dAzx_glK37J6lYxC_NY-_OxXnwNV6btHohoOSls
Message-ID: <CAD039W60_f8+J5-PnVZBSJiab6GnX7M_wuUfHXDetjRxgKisaA@mail.gmail.com>
Subject: Release : libtypec-0.6.1
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

libtypec (https://github.com/libtypec/libtypec/)
++++++
=E2=80=9Clibtypec=E2=80=9D is aimed to provide a generic interface abstract=
ing all
platform complexity for user space to develop tools for efficient
USB-C port management. The library can also enable development of
diagnostic and debug tools to debug system issues around USB-C/USB PD
topology.

Wiki : https://github.com/libtypec/libtypec/wiki/lstypec-:-Know-your-USB-C-=
Ports

What's Changed
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ucsicontrol: Add the new ucsi commands by @madhum031 in #16
Link libtypec to libudev as it uses its symbols by @andrewshadura in #15
Reset soversion to 0 when building with cmake by @andrewshadura in #14
Fixes for usbcview.c by @andrewshadura in #13
Build systems fixes and cleanups by @nullr0ute in #17
Build fixes by @nullr0ute in #18
lstypec: Add decoding for PDO voltages and other units by @richardg867 in #=
20

New Contributors
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@andrewshadura made their first contribution in #15
@nullr0ute made their first contribution in #17
@richardg867 made their first contribution in #20

Release:
=3D=3D=3D=3D=3D=3D=3D

https://github.com/libtypec/libtypec/releases/download/libtypec-0.6.1/libty=
pec_0.6.1_amd64.deb
https://github.com/libtypec/libtypec/releases/download/libtypec-0.6.1/libty=
pec-0.6.1-x86_64.rpm


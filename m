Return-Path: <linux-usb+bounces-26285-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5211B16D7A
	for <lists+linux-usb@lfdr.de>; Thu, 31 Jul 2025 10:27:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26487188D4B6
	for <lists+linux-usb@lfdr.de>; Thu, 31 Jul 2025 08:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1295A244695;
	Thu, 31 Jul 2025 08:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCMzJ+hZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7ED21B18B
	for <linux-usb@vger.kernel.org>; Thu, 31 Jul 2025 08:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753950455; cv=none; b=nJRCtbGFVpm6enkLHX9S+zYuolzlMEuA4iglyZ40M9qkVbsU1iMJD4iXJQp6XoIYEax8aIG/DY3wUtszFsvJLiJmd+Jh0V8Btx14G0cRAW5ijPKMfXwCieCtdReH/WFjRTTLqvrlyerDlcQKKhOgKWrq0AgVuIJpJblQNec+uiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753950455; c=relaxed/simple;
	bh=YNGbUyXHBFeEN8H/yyjxsrvoembPSnZqoKecpfiUhms=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t/kKWasVnMG2qq34pbw1pfBBBFjAcN/e1rrr7pHieMDr56Pt52ef8VOE+N6mduM0qrr+0Q37iDX416HLdzJFNMeRPdUiMH74m4JZcJIZDjmMVYepZmikYh+195Rg1/tMISwXa4M1dleugbuZtd+7GbUEMzcZpLVbIxvDxliP/bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCMzJ+hZ; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-615398dc162so1002868a12.3
        for <linux-usb@vger.kernel.org>; Thu, 31 Jul 2025 01:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753950452; x=1754555252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNGbUyXHBFeEN8H/yyjxsrvoembPSnZqoKecpfiUhms=;
        b=YCMzJ+hZ/2WA6QVefpAseueD4qso6tJ3nuuYr+kqPlMt+ruOXqBMSiasFn+JubyyQi
         AnbLv6dJ2/VkxtuNBbCCBCFefI5tB1XdKraQS3qBAfhHfUgm7NuyAdfirC+6jsBWEs+Z
         jPGBD6DXbMBA7MCUmt3/eeJ/v3qlMaDr/v8aJ8ON0SIaZ+wrA9OLsoI9QHzizyosds/q
         AHrDHk5XMYjFgCSs3FIQ87YDSzT8s7wVoO7xx1x6WM8WzqOtZayqhIPl6ZCNvlGOOhiS
         kmLDvUKYFOBTA/gex3V5OXy0fqKkYiIGJhQiAOuURqrRvkbxO6+SV4MtRepWHTcsOlx8
         9g5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753950452; x=1754555252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNGbUyXHBFeEN8H/yyjxsrvoembPSnZqoKecpfiUhms=;
        b=MEiEoRcG250z3TcIctf8IevGJIHIEVe1jCR8Ki23aaazaTxG5mUIaFrpCR47tJaASR
         r+CD4bNhgCqdhy5m8oSJkPotQRWnXoBVHbKeaBpLI0sDucVZP7ITnUnYQ+K1F7s6WXTB
         0yi/iVuGs4kp6GyUfcGzJ7LSFup8Qum2+b4AimW0qVQGC0pJbY7C0s+2fG5JbwpFKvEL
         +IIHJJ06u5Qsik5Aliyq3F+w8buzbd2ifLO8MzYAnSZzvMkoeyZvLGG8W35Wp4rHLi+P
         otfwBHE/j3zjX1xcQ0VjP0LeJjnLIt7UQmUcifIC6Vsy+ItpXDE/xb4hvR/McOvhhuQz
         ntYQ==
X-Gm-Message-State: AOJu0Yx1TkcHXVtCobnY6NOfm/AlVEbV7qUyJwWZqiODigXqOvSUJLu8
	KwDmC+DE3ToziQGWhxhEXYh1RwtOeBqJF40m0mQ2Nc00LX5xtp/6YMtW
X-Gm-Gg: ASbGnct9qDkhgBPAJPXjUvw+yXDPqWj1UmaLrEt6xIRLp91grN5Kc3Yez3m852aUiMO
	A+ni5Xfw4nehxLjZ2/ymtCB1mM5WU0cBjhWXa1vOcF+BfhS+0AgdZJgokiUbtNkLcRbZ7eEG7u9
	VJflWgu+Gz8joPZGsciC2RqFfcYKEg3APsIqckNGkrnrZSabbyAvPPJUHJEy2yRiGwhOMZz4j0e
	1nqN6TYXR3EI+fURSF7y0LmX2vCzlgcLiegQsqz37AHD74tg52izgQVd9OMqAxJjc/fLCnPikS4
	cXG0xF9JDSUxceyQa3osjMwzM4D8kFlc+O7qd/lbFviSnUsZz7jQpfAoRO/cKWrr0yLitNysYcM
	wDWkOurSHdCRs3kGF+PJDTm5RQex+AZHOkje4kTLT8iVZvA==
X-Google-Smtp-Source: AGHT+IE6tfa8OWi0DB/iNybpT1Z7kN48TNV4MxLLQrrUYoX+7ZBjXSGuewFFA30EVZRS5A+NluoFGA==
X-Received: by 2002:a05:6402:1342:b0:615:6e9a:d0dc with SMTP id 4fb4d7f45d1cf-615870b4505mr5282418a12.20.1753950452062;
        Thu, 31 Jul 2025 01:27:32 -0700 (PDT)
Received: from foxbook (bfk202.neoplus.adsl.tpnet.pl. [83.28.48.202])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8ff9fd1sm752758a12.44.2025.07.31.01.27.31
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 31 Jul 2025 01:27:31 -0700 (PDT)
Date: Thu, 31 Jul 2025 10:27:28 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Bob Ham <rah@settrans.net>
Cc: linux-usb@vger.kernel.org
Subject: Re: Audio interface causing "xhci_hcd ... WARN: buffer overrun
 event" messages
Message-ID: <20250731102728.503cd612@foxbook>
In-Reply-To: <20250731101720.5d10a8f1@foxbook>
References: <ba0ebd17-dade-4a97-b696-5ad19ebfca1d@settrans.net>
	<20250731101720.5d10a8f1@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 31 Jul 2025 10:17:20 +0200, Micha=C5=82 Pecio wrote:
> "ep 2" means "ep index 2", which is USB endpoint 0x81 aka EP 1 IN.
> So this is caused by recording, or maybe by playback while recording,
> but not by playback alone.

Apologies, I forgot that some UAC modes may use additional "feedback"
endpoints so it could still be a playback thing.

Can you post "lsusb -v" for this device?


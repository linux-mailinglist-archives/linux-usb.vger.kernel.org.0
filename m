Return-Path: <linux-usb+bounces-18235-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D44299E87A5
	for <lists+linux-usb@lfdr.de>; Sun,  8 Dec 2024 21:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AB93281967
	for <lists+linux-usb@lfdr.de>; Sun,  8 Dec 2024 20:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E4D145324;
	Sun,  8 Dec 2024 20:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9lfGnGK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F8322318
	for <linux-usb@vger.kernel.org>; Sun,  8 Dec 2024 20:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733689043; cv=none; b=aNT9BGIWXApxv+oN3gcjAnqnRclUFTpqtw74xl5EXE5RLY3Ri9M6EXNyCx/jW2jhwLEE2lkbwXQuYl4vrBoCMEMKizaavAeb48Q2/f0r0aTKweCsOf+2MDe0X+sfSwS8zzXvhmIua3Yu+wFXPoSW+gh8XLKVcyLl6SyTD+eF6Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733689043; c=relaxed/simple;
	bh=zdyNlJjZaTA38GAjkMlMkKOapIEcG6qUnH5pJog0+CY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=egaW/lDUyD+pRANZTbFujGu0otJu/aBknh04KkjXVkHBZS4pF0mbUnTcK+cZcB0k19/boTWC34GqIW2DgCp3nZMQvjFVqxRpZgZigMDLjY7EjnQU3dpx7dQ1zIkl3JfvB9fxM02TqSEqNTbOPdZo04JMH8Jx8Czo8l4K+jfdTbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9lfGnGK; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-540201cfedbso139544e87.3
        for <linux-usb@vger.kernel.org>; Sun, 08 Dec 2024 12:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733689039; x=1734293839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zdyNlJjZaTA38GAjkMlMkKOapIEcG6qUnH5pJog0+CY=;
        b=i9lfGnGKVgbt7PT4ePmD9jxba1CU/S1iMbJdtHcx2rDwf4t7oBmP/zsCW7mkWb2PeI
         0TMe9sY9SeUf4MAEKWCxHp2nwQZGmpgyUprs4vnceHvFfj9+S8ONoHU5WoqHYpsKLtCY
         hTcnK/7Dkg/zJGrH8c3cQilF6w/z21QiaVNZxBh5dWCvgFsEdkjyQeJwlObVqFxPg8mN
         VgrQS2rZ8BEWqau/OVufuR7hboikdFl6x/1+vewr90n3nMxaPRiQINHZqgVMRp9bVPhv
         mIK2eTN8SkrGsH6wkel4RBF+RUxI60jGisAmeYArpj3WiSDiHl6Atssf7FJB4jcW3eKF
         SyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733689039; x=1734293839;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdyNlJjZaTA38GAjkMlMkKOapIEcG6qUnH5pJog0+CY=;
        b=BpObBEY549rzv0eDkLHAw925UVab6x3E0RLMsw3AUr7Xos3X7fu/m/totdHA1SGPq6
         IULbZYC33Qfb+w09PQaFEIIAh8nG5BUpVxc/uhSWaPTE/Pea1iw8CzTjXQNWFaC+Obuj
         jqV6R11kc224na+jsRANSzjKoBjtqzAw9TPCK0zdSiatNnFEj+CB1lZqvK6wQPFISNqK
         1lzwA/7YsRsowkyuQf6zmpX+MFyBX3M34g0soEL/7E1vqHDKY1IAlZKdZ/YTjisHKqDt
         Hl+UtBEjrmdHXFn0FIwD0ikSScb2YRAMPupMTDolcRpVkEGD0F0jLR3FyQhByZUnvpbW
         Ruyw==
X-Forwarded-Encrypted: i=1; AJvYcCUMJ7dZed9pk7BOXkgZUSUhn2GUBGaGgkpL7zuTUgSnflhfnZXRL5y7U42yaUhcAVZeDOXuFUUaSbU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy12jd6dpxyVYu+i87e5BpznKsveenkgf5MYMgswlzhelhT9DjL
	hEREzE/bM75+dl7M1tjMwA4B5pg3sAKPMt32zd2yDuSV2QonlIO8JAEwrg==
X-Gm-Gg: ASbGncv1iIniWaxk9vd58tdkIlgHjdUn5340+NQZ+4RHQvs4JJdDaYHEpDqxW8562pL
	nNXXagQ3gf6dmsd5kxt6APHlK+Haru/e+LnqKwlO5O0epYFhlNrw8R1T1GoYLvo6xYys+ER1c4h
	+VwNyb5u+MJcC/9O1PRd41Rh0V3ppfHIeuv1kxHur0kIeivuuxzr6EXOuxG4shTu5xUsxJd14Tk
	jBOUUiRVYreCHPbznn1l/A3npFnME2tXgWYu0XcT9KH+S5743oZGgLmqHtKgLARBN0=
X-Google-Smtp-Source: AGHT+IH58GIkq2z6/X3xr5OwHRymDj+jggBVNiq3TQQ+2mie8uP0O0Ehq33ciGyQur33x6+4EVC8bg==
X-Received: by 2002:a05:6512:ac4:b0:53e:3a73:fd2c with SMTP id 2adb3069b0e04-53e3a73fdb6mr1942279e87.49.1733689038896;
        Sun, 08 Dec 2024 12:17:18 -0800 (PST)
Received: from foxbook (adtu138.neoplus.adsl.tpnet.pl. [79.185.232.138])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401c0382c5sm287186e87.32.2024.12.08.12.17.16
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 08 Dec 2024 12:17:17 -0800 (PST)
Date: Sun, 8 Dec 2024 21:17:12 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: torvalds@linux-foundation.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com
Subject: Re: USB: workqueues stuck in 'D' state?
Message-ID: <20241208211712.7d475295@foxbook>
In-Reply-To: <CAHk-=wgBm_x2EfaSHvSL3otbcDbw06XW2j9EFNMK2_8XoMHYqA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

> > Are you using any USB devices on this thing, or is that just for
> > internal connections?
>
> All internal motherboard devices. Mostly the usual random hubs, but
> also some "ASRR USB Ethernet" and a "Multifunction Composite Gadget".

Dynamic debug has been suggested, it would tell which ports are being
suspended and how often. Either usbcore and/or this should do:

func xhci_set_link_state +p

Stacktrace looks like this function has just returned and the driver
is waiting for the HW to confirm new link state. (Which confirmation,
or lack thereof, seems to be subsequently ignored by the way.)

Regards,
Michal


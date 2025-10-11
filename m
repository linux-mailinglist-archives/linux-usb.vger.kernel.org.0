Return-Path: <linux-usb+bounces-29140-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CD6BCECB1
	for <lists+linux-usb@lfdr.de>; Sat, 11 Oct 2025 02:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6D4B84E24D2
	for <lists+linux-usb@lfdr.de>; Sat, 11 Oct 2025 00:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C358C2FB;
	Sat, 11 Oct 2025 00:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rim2KHyJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AC1290F
	for <linux-usb@vger.kernel.org>; Sat, 11 Oct 2025 00:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760141429; cv=none; b=gNkCNV3HNjLL7xOpK0ZaH2C8wRz7PxRArYWFWqsnTgz5p9aISb9IlBK9zjUo+Ryy0Al9ssfxFaBiE7ndLitJRLoxDHq6p5b1HhFNFpd09lJVbQi4B0fzizeMYct4hQgaAuX+BwV3x72CIsFFR9LIawgrfYzaKM71ZLJagWV+DjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760141429; c=relaxed/simple;
	bh=vhsuxk96WAH/RhC3vemDEb946RpngHOAqABSwAfzGbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RTjgQ37BDCYA2V6armN59YNVKACZgJhUoVHb9M9M0Lyp0Rxm4VnuJ7POA7syFDhA/esSwWntTEoyp9Ux46ULLWCcmYbisfbXANcZLpe7XP4NUlNXPqbr6Qxk+HDuV/HubRa0dOvwM10bL0DXHAVEtxX2HrM1rV6LtkbEIEqbBTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rim2KHyJ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ece1102998so1508598f8f.2
        for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 17:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760141427; x=1760746227; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vhsuxk96WAH/RhC3vemDEb946RpngHOAqABSwAfzGbw=;
        b=Rim2KHyJ98x00469RxPskdsO24wkT5bUkS/IVMDwqFgXGfDWdCQd87enYHrWLdF6PV
         tACAWst80nC0jp4uSqvSJPTnQOVnEub3hq//b3JHEVipyzPBv0qxCoT/rk6+E5Zuag9O
         /LiN1x5iZ6xlLPVl/6GkmWqDJbUkUQim0esp57vEej28UBxEt/l6nkjDZ8tYckXPH+GS
         idmiADkcshQBExGuX/Pv32Sr6lq8CTxih58YbEfhFdADivnZeGcpSOk13wGrD82nGFHU
         wsBqY94E0e1OyyTnRljsimMRpR6QS8RM3RjnOPfp9h/8WXC7FnuxpP1JlHpwrS5o3bLo
         7Ebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760141427; x=1760746227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vhsuxk96WAH/RhC3vemDEb946RpngHOAqABSwAfzGbw=;
        b=roeYtkf+oxuKk51BBQVgnJhsWKuTWa3vdDh/Q4kRI/3sQNuaZJAa0biSFTstUOvkYg
         GaLJvueq2nXWgs5xo1MKtQYy59OUIE4mQmAGip3BGc4npC0O9NwqLHpkdYwCj+c/uj68
         U+vJOMNhvVmW+cf/EZcdGoTql2RLO5HePW6Acdeg/o9YMLS8UuB/euKn2CloqXMuV+VF
         VMWtZ8Re+jTqsSugjBF6sviNBD4n5bWy4HeJm8kqEYWvLxu0YE7fSnfl9P+lfC5KrRcL
         u7SMbSlkfsf71xir42/vOInEiH6TBLmGBJeCd1+Rz6KV5oSFZLOKq8Z6lXoFQ3N55XGn
         U1wg==
X-Forwarded-Encrypted: i=1; AJvYcCWQLjgA4OfU3LmK7VzGK9Ja2peDANwkumzY4vwLl7SJHmTeh7Wo03Zr7GWVdqZXwuN5sos8DoWR+uY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwocGQYr3mopqhykb5oBR5C14xszhklWzLixa9GjmMCujO19hdm
	muEGIqNzjHC4wK39WvcTtPWzshNvP0eakvxbReEbzmiOgMz7XnQI547jjjQ/zwo3KSKV0HzJQKc
	djryoAzzt26bZ0FcbaDZkDrcPv8SN+353SeINrg2h
X-Gm-Gg: ASbGncvmVaaqFhVtOuW++N/ZMeR1WABIoJRo9ct8rZLnB2wkL/L+TadPZUgTkdWqB7x
	034FBzlAI3b7oOd79niUV4ZA2DA756JKOC+zfwg/UEdF4iPXLIesfAEDr3qT1/ekd6/JB2PI/nu
	iKYLeu9hs7mkfn0MJaY9Ery9hjGx/fz52Jt3yW2w2cE5BOT7TJyp74axiVUVvQUjFVnI0UfMKk9
	xsRJums4UH9ZUIxNXsJhdQGRBXszUixgVPGQwA06mU4iGQuYaPC2gtTIFGSRJiqW3L1XM9iW+dO
	dSVrx7BW
X-Google-Smtp-Source: AGHT+IE+ZGXJMaXhPli5PfF8e59JjiGHyX8ap1P7iYMH4TowQfmU4UEUloQ42CoLYo3lvX2UUV72pFmKUq2N6vrDDqY=
X-Received: by 2002:a05:6000:290d:b0:405:ed47:b22b with SMTP id
 ffacd0b85a97d-42666abb50fmr7632735f8f.10.1760141426475; Fri, 10 Oct 2025
 17:10:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251009010312.2203812-1-jthies@google.com> <20251009010312.2203812-3-jthies@google.com>
 <alnlmxbcv3ivhh7iolfqsurhknnm2o6i6waxq7kuhmzcbeljr5@a4wy3prshu3c>
In-Reply-To: <alnlmxbcv3ivhh7iolfqsurhknnm2o6i6waxq7kuhmzcbeljr5@a4wy3prshu3c>
From: Jameson Thies <jthies@google.com>
Date: Fri, 10 Oct 2025 17:10:13 -0700
X-Gm-Features: AS18NWD3EfN8pP57xJObsE8Nw-y-Yhc8QT1UxXovpeEXkcrZFbmuYOLzuOBOTJU
Message-ID: <CAMFSARdzoZrv4oXxVAYRcZJgxdLcrTMVAVGa=D8H=9c1vZ0zKQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] usb: typec: cros_ec_ucsi: Load driver from OF and
 ACPI definitions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: akuchynski@chromium.org, abhishekpandit@chromium.org, krzk+dt@kernel.org, 
	robh@kernel.org, bleung@chromium.org, heikki.krogerus@linux.intel.com, 
	ukaszb@chromium.org, tzungbi@kernel.org, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,
on early ChromeOS devices using this driver it gets added as a
subdevice of the cros_ec_dev mfd. But, we want to change this to load
the device from OF/ACPI nodes. The issue here is that older devices
which don't define the OF/ACPI nodes to load cros_ec_ucsi will still
need to add the device through cros_ec_dev.

So cros_ec_ucsi needs to support multiple methods of being
instantiated, and going through cros_ec_dev creates an intermediary
device in the path which doesn't exist when the driver is loaded
through OF/ACPI. I'll add a comment explaining this in the v4 series.


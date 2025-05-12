Return-Path: <linux-usb+bounces-23857-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4EAAB3163
	for <lists+linux-usb@lfdr.de>; Mon, 12 May 2025 10:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B89E168950
	for <lists+linux-usb@lfdr.de>; Mon, 12 May 2025 08:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BD2257AFF;
	Mon, 12 May 2025 08:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XoOWIp8I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC342512E8
	for <linux-usb@vger.kernel.org>; Mon, 12 May 2025 08:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747037962; cv=none; b=V+R9I5rVxK3Vds1dosVKEp1MS3ZAzcT9FdanUgFPTn9ilMe8vX4KsSkiSeuygHtEKu1mB3x/9VrBrresgguRP1GTtRchEBvyOC4AS0UuQuRQjWD/vtHshHRnpkmxhXehWf+fBEsd394AnIZGpOlLK3OOxrUemkY/4sj2c64i1AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747037962; c=relaxed/simple;
	bh=QQj5MYhY8NyUeUmMkUK4419dRRHEKQ/GhHbFXe9rDdo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i1HGbEsbYATaS8Cd766djDJpCKZfG5zpJC0fxC4JXKe3gkHkCZ6mSmc6j0nnFzpoQ/qYtSs/ORDBUx5aWIW7vdfXGf/Ln2juqcsDTooIYyKTX57Iw/OZ2rLttkEaKOHRNiNDMLwNrqFmJj8aQF2H9q7Zx6YDJH+YmN3OdnFzW0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XoOWIp8I; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54fd1650b83so1390126e87.2
        for <linux-usb@vger.kernel.org>; Mon, 12 May 2025 01:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747037958; x=1747642758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjvR10M8mzlv2dwQnv7FNheLmTDvT2f5boK6dNM2G00=;
        b=XoOWIp8IJrKmATrwQdRezs4ef+jyV5HBxT67yC37K9qHC2rrbNEtkcxEroKo5Xi1YW
         5qs0IkH+xLuESnsDWBxDiPWkOujLgUOndJxPjjCExridZ+6uOeIqJf4S4MD36hNv1MdK
         bXbvU1XQ9nAKRMV/R6xuOrKq++Vto+Ym3miWWoyJrjI+m7+jRKvLvosSeV3uV49+G7t0
         9mD/WfOwOwhU5nYV7O4wytsbyowDAkdWPtrC8BmE7hijZlFFml5gcO4/0yLGOxPBPILO
         C1Q0U3Dkue+E72Sl+63oUw8vrppYgS1dBMNDcT9ohT4K0JjDX8fxUV21K26QIvUULVEF
         KCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747037958; x=1747642758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjvR10M8mzlv2dwQnv7FNheLmTDvT2f5boK6dNM2G00=;
        b=i/1HGtn6zprhv20aEZ/JrybiLOayuzJJp9zJ0WzQX9WvN6ALQo0LStj3gN1DAHEdpf
         C8IEguQ/Pi9VcWSn5RAKsqao3a5eoUJ0Xc9GaaXzju+wNCmeUS3oCLZV0hKIcl9UjRyY
         TQqHSu8WQOWRQNZDNP/TdupoiDcigNY8XZy4jsnarQZO/ixr3xp2RUKv2tD4sj5FA55j
         8iHArFa+h07WzPz8mVw7+o3RPcoDKY36/57lSrZF1IDhMCVmVpFb65QO20c3gG6JqKdB
         98clIxyc45zyvWH4vZdz3Pz4Voj8+4iQkvHUeYlYbN51PmgmghHX6ln/kGIIcyiTqLDD
         QOsg==
X-Forwarded-Encrypted: i=1; AJvYcCUAVT4n+/KzSGOGbgXh0cIkSrXrez6xecsHnZ6tjoZm6SooJyFx0IxLau3vXvFHMjw5+88k+Rsr3co=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTCni+Fe5J8FTz338bAw+tXkp6/TFAUC2j3mdGSOkYuLxjSaiw
	dVTFI4CROhl/EqkLMMmZ0vm38TEwkL3m0+CW852sZWYEhR+uK4Gm
X-Gm-Gg: ASbGnctLswqXjYDcvsEIRKjd3LgjzwrWPrhcx67UWVRQCUUXwz51oNaZmtKrEFJwoY4
	QH0Zwwhh/wd1fTcbq9jo6fY/VVp1ZWnNu4QBgqt4Wqwzqgq988/gdJFjwQ9YXNxzWjPjbaUlSjO
	9X8B4Ks+JAjhw8smHEFFG0RVrIQDiqAsOu47ogROK3UE2nPE0seHrlDfAm18TdDxvHMx8pjEeGU
	3bxe3sgn6gDQse4YHBhzzuTl8cZIoNYreD2AT/OmRhOSRFc8MYzqL9YR8KZ+0+HUO9NoA5DCj5F
	y86C+3KZ9MufKEVDmJI3pM0sLqzEW6O74DO+L+nmSgp3nPR+nVOINa08Qe8Kon+OaQBn
X-Google-Smtp-Source: AGHT+IF+uXRPo2SD99S+1equuEgPd9K9czftAJpxf4tnbkpPEgcp91oug6K676JDS0XA8a5G30FApA==
X-Received: by 2002:a05:6512:6810:b0:549:8f10:ec48 with SMTP id 2adb3069b0e04-54fc67cd256mr3118405e87.29.1747037957913;
        Mon, 12 May 2025 01:19:17 -0700 (PDT)
Received: from foxbook (adqk186.neoplus.adsl.tpnet.pl. [79.185.144.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64ccd59sm1398772e87.232.2025.05.12.01.19.16
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 12 May 2025 01:19:17 -0700 (PDT)
Date: Mon, 12 May 2025 10:19:13 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Guan Wang <guan.wang.jy@gmail.com>
Cc: mathias.nyman@linux.intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, guan.wang.jy@renesas.com
Subject: Re: [ISSUE REPORT] xHCI infinite endpoint reset loop on full-speed
 after transfer error
Message-ID: <20250512101913.69562fd3@foxbook>
In-Reply-To: <20250512063912.3331082-1-guan.wang.jy@renesas.com>
References: <20250512063912.3331082-1-guan.wang.jy@renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 May 2025 14:39:13 +0800, Guan Wang wrote:
> Using Linux version 6.15.0-rc5-00032, I encountered an issue where
> the xHCI controller enters an infinite loop while attempting to
> recover a USB endpoint. This causes the xHCI driver to get stuck, and
> no USB transfers can proceed.
> 
> This issue appears to only occur with full-speed bulk devices such as
> USB serial adapters(e.g., USB-Serial or CDC-ACM class). I've
> reproduced it using CH340 and CP2102 USB serial devices.
> 
> **Steps to reproduce:**
> 1. Attach the device.
> 2. Start continuous data transfer (e.g., `cat /dev/ttyUSB0`).
> 3. Induce transfer errors via:
>    - EMI interference
>    - Sudden temperature changes
>    - Long USB cables
>    - Briefly shorting DP/DM lines to simulate a transaction error
> 
> After this, the xHCI controller enters an infinite reset loop on the
> affected endpoint. "Transfer error" messages continuously appear in
> the logs, creating a log storm. The issue seems to improve or
> disappear when an external high-speed USB hub is inserted between the
> host and device.

Greg may be asking the right question.

I tried this on 3ce9925823c7, which is linus/master from a few days ago,
with uPD720202 and PL2303HX or CH341A in TX-RX loopback. I temporarily
disconnect D- to get transaction errors without detaching the device.

All characters sent during disconnection are lost, and sometimes one or
two after reconnection too (bug?), but things are back to normal then.

OTOH, it stops working if I insert a high-speed hub upstream of the D-
switch (tried with two hubs). But still no transaction error storm.

In your case, it looks like USB transactions keep failing for some
reason even after the original error-inducing condition is removed.
The rest looks like usual error recovery procedure.

Any chance that some error messages are lost in dynamic debug noise?

Note: "ep 2" is 0x81 interrupt, and "ep 4" is 0x82 bulk.

Michal


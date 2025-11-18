Return-Path: <linux-usb+bounces-30658-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5C6C68AC5
	for <lists+linux-usb@lfdr.de>; Tue, 18 Nov 2025 11:00:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 43F4C3510D9
	for <lists+linux-usb@lfdr.de>; Tue, 18 Nov 2025 09:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB47329E79;
	Tue, 18 Nov 2025 09:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAIaurUS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D255329381
	for <linux-usb@vger.kernel.org>; Tue, 18 Nov 2025 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763459991; cv=none; b=Zovtm6QLyA8tc9sSWCsVO0LdvuCl/3A9WWlmp/L6PXvqzthxxDdGvy6KzBlCirzp/nVV0Y2wzd0Mk7NSChJ7ubdWsvktmvQe5tFgQzcS3nbRqj0GELVPgGVV3IuXVDsmhWNSFniFD8oGGEbhTcGzwNDVFaC/2pywnwcv8A9fBYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763459991; c=relaxed/simple;
	bh=3OTjsyF8jzv5/5B8GX+VKvfXggixdgyd2+Q102JeQ8o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aBNDSDdNsxF2EbhugiRPH0qOi89Epq3ix4N1B2dzA+cVuQ+lRzliDGATVLghxGZyrmRomCm7xZrYDEU9CKI8Umfi2kftksVo4TO2P+xJS3UImbuDCidbh0IYOeT76IrhMqRsldQvqB8Nhf9j5ZvhDMd06FijmFMLJPdoiUo/vcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BAIaurUS; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b739ef3f739so318125366b.1
        for <linux-usb@vger.kernel.org>; Tue, 18 Nov 2025 01:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763459988; x=1764064788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZYnCm/sXxbVHIqtj0TWym4GM93F9lRgfmerGHcbL1Y=;
        b=BAIaurUSc77IzR2iGUXpJibrYp522tHd+Cs3BqdfM9uJRgQQd/ZKuTdY4Qhbuv62MZ
         OWMCKQ3itgVQhlF90ahSihe6FTbPUADpUfPjvwZNuQ9wlWTQe54j9waXsqY9ATnu9zcG
         W4Oiaqjt3NIMCX+WsMIVu+VxetzpoCpwPyGicEPVbUAkw76rxsxwzCEETvOvbFyvWVgr
         L7Rgnv7VpOI0+onF2nw+vvTVbSWMt/VpNI94tqWeq/t0yT1R4qjLNrS5iJ+KWyZb4WrT
         JHXhtstUIre9WY/a/vuMtNCR2vzGMinMn99Y5+uAZcvZ/J2f8kv8Z0JlYctAEkG0XDP6
         xD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763459988; x=1764064788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ZYnCm/sXxbVHIqtj0TWym4GM93F9lRgfmerGHcbL1Y=;
        b=qscdBWT/jfg/EImDVtl+cCgLPvFqozEm8dqeWBq+ngLjMSnVk8sK7xvmSFeqVHDhCU
         +DKH6Yse4u9PBrHBAiZ3DVR4Mn24loNx7ycKxucgG55X5CzavalzUlMRiJFibfzyHx0M
         DIGusYSYMiSe8q+AwJLQez8j2dsYKIVRnArBifEeAaRUckIsfvTuKeESGj1TMUPdCIgT
         KkLugDNIVZdEwCKxgx+o1eQj4wDHJzQcGgefQhQqM9icUOs5CY4efNTRoIXJvKrD5pdn
         sHOFQxtsgrl/6TOrvTnL3d857z88vDw50aNKypo85PusIZcwZkLqyMrvQB9yOOnk7bh+
         uODQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3DaDd9InjHa/ds8PIMMd7+v9zyrxXZJEXKFQvCflvUbrVqQj2PpK/0Ee5HGnSPWVbtO0Tkg7ZYmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSdh3P4vsl8FzgYXZDj3HAwxkRboPixPm/E20/kv3IC5yeVLFG
	nN6gSnVm+RwJ8HAbKMGTG9YJO4TM2HLlOhx0eRWCxncD6+Wc4SM88FW+/WLejA==
X-Gm-Gg: ASbGnct/zlP14VwJR7RR4h4piFGpgJKRrJur+ncuPFzRaahhpvLXOAALfJGh1IfKBqX
	5U/jFZKCMw49sLlcgChGqZH1NfEA5x8W4g7bF5tt1sCvgXv5wE6IFHOSYAo2EkJs2eM3KuU2fNW
	HdDvpWiT1/dlD3+qBycLUl6WOuchdrl2JHoDeRof72vLiBYy/24ai5Lf0RxC2FX2MGSCa43FQgc
	j1qo0C2swrjy54Ih9r/6kzjEAsrLM8CFrBMrG2PKTMOpEexZfq70fZqk3ffUFergTJZ6+hvkShZ
	zp4L6SZ4zJ/I+CWPKF4b+RpCwQrkoe+9CxIQ7LzuTD+CSPTDxh1wxSCeCNdW+GRRm3ejRFGFUel
	OQneSm+vaBglgtCIigKtglo+0Ph8OvITnkvyiuvbdYorvvbhy3RkxTy3GIZVJxMP8QJhMmgWrrl
	Uea6E7Bsa06RHNOnx1zogaENY=
X-Google-Smtp-Source: AGHT+IH27uoFNutlapD0gNjviVN2jZZutdx/ofuInMm4gjmLoJom6smGVoJQwrQi+8LFI4RuRsaYlA==
X-Received: by 2002:a17:907:94ca:b0:b73:709e:a20a with SMTP id a640c23a62f3a-b73709ea300mr1368869066b.47.1763459987333;
        Tue, 18 Nov 2025 01:59:47 -0800 (PST)
Received: from foxbook (bhd138.neoplus.adsl.tpnet.pl. [83.28.93.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd80a06sm1299820966b.38.2025.11.18.01.59.46
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 18 Nov 2025 01:59:46 -0800 (PST)
Date: Tue, 18 Nov 2025 10:59:29 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Forest <forestix@gaga.casa>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Stefan Eichenberger
 <stefan.eichenberger@toradex.com>, Pawel Laszczak <pawell@cadence.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION][BISECTED] usb: hub: total system freeze after
 running adb
Message-ID: <20251118105929.330f0042.michal.pecio@gmail.com>
In-Reply-To: <qc0nhk9c6l0a08bkfeplrm3qjssgrjkvkp@sonic.net>
References: <qc0nhk9c6l0a08bkfeplrm3qjssgrjkvkp@sonic.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 17 Nov 2025 12:18:54 -0800, Forest wrote:
> #regzbot introduced 8f5b7e2bec1c
> 
> Running adb (android debug bridge) commands causes the entire system to
> freeze some time later.
> 
> The freeze usually occurs within two hours of running adb, but not always.
> Stopping adb's persistent background process with `adb kill-server` seems to
> avoid the freeze. (However, this is not always possible, since the system
> sometimes freezes just a few seconds after adb is launched.)
> 
> It occurs even when no android devices are connected to the system.

Hi,

If this is caused by running some demon without much hardware connected
(besides hubs, I guess), I wonder if it might be useful to run strace on
that thing to see what it is even doing to trigger this crash.

> - No messages are written to dmesg or syslog.
> - Virtual console switching no longer works.
> - SysRq key commands no longer work, as far as I can tell.
> - Whatever was on the display remains intact.
> - Any already-playing audio enters a short loop, as though the
>   motherboard's sound device is playing from a ring buffer that
>   no longer gets updated.

How can you know nothing is logged if the machine becomes unresponsive?
For such occasions I keep a PCIe card with a serial port to get logs.
Maybe xHCI debug capability could work too (?), but I've never tried.

Regards,
Michal


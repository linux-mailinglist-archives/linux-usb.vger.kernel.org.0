Return-Path: <linux-usb+bounces-29657-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A92EC09CFE
	for <lists+linux-usb@lfdr.de>; Sat, 25 Oct 2025 19:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 152B4580960
	for <lists+linux-usb@lfdr.de>; Sat, 25 Oct 2025 16:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998BC21E087;
	Sat, 25 Oct 2025 16:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1yD3BpW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68910224AEB
	for <linux-usb@vger.kernel.org>; Sat, 25 Oct 2025 16:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761410869; cv=none; b=amOCuPtWrOSs8LNR4sVq++RkPuOVuVFLGsDrD3DZ1LNP5s6zykoz7QpsqWUGekFld6JkAZniYV7Vtgh61RzRxAI8Flymph/pfI415qed5nX26S2VrBU9DT2Ngy8uMIw9/GMSqokoPO8gMMu2Of7jf977VrMDnb7FAQpp6mjHpUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761410869; c=relaxed/simple;
	bh=MjmsUVHr6NMRcRBnZl5oyGiiFbM8seOg1onkjxTlhSs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fPb/ZI2Pck7MieV/hK5IJ+KtWpwPWFBOHVJrxZsrv1E10vFTouha1UJU5X6ogZ35bleCXJiRZtLQ1Ax6GNLQzwRzbpi3+raKejD3mUPoSpkV63eK6yzNuNxFZQs9jTdHpBPfP7ogo335ivKVfQt7ua1La53TctT+Sy47nzg1rtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1yD3BpW; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-592f29e273bso2969593e87.0
        for <linux-usb@vger.kernel.org>; Sat, 25 Oct 2025 09:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761410865; x=1762015665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdq0pmLhJNTjhaDx3mb1Ru2H4viWHvHrb5MIRLM0trs=;
        b=B1yD3BpWREInVsoFWsNdd5FGmLjZwzxHjQdIIkLxolP3DlslDdB9sZ9MPH0kwpFWkd
         brwj1foCqFmcIWk3XYrWu2N89e3zOuOpSpKforui6TqHj/+iRPujvFEGxhs4k9jcem3n
         asCwX8eWnl7FNs8muY8GJ/VDC0a5VzF2KJ/lqnR1/czbTMAj0sCWhg0uJA5oKnnlFYBT
         0S6D1zuiU7ZdhNehW7h2hdTTEUklak06QYn0FN6Mk1dhby89zV8/fVHZWB6dGLb4aUNO
         5bPJX6LYBHqF+HJN+dm2iLVhAsNsGxc5rKbyfn26CK5NYo8M5mkIlvdx0YTe9W6C7RH3
         DL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761410865; x=1762015665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdq0pmLhJNTjhaDx3mb1Ru2H4viWHvHrb5MIRLM0trs=;
        b=YAFkld1dxfePGJaNJ+to+V0QwLLFBG5kv3NT9LS5O/vHMVSagF7GauDqmS2++NAt7p
         MgOiVHTUO5w4XD/GfGQT/f+mkOYIFxGgKOGM0GnzVLdKeIoOdWxFvFRYCKmjf0oicK7r
         jm+iGqvu0+6iPPrC90Ma2TC4E0xyf3ZVFtFwvNZ3Lnbu6a6LYuBp94oZKX1yJTzFqRpT
         GvddV5TUZfwnSSzF+6AAeKiEzEdvgRc3uDUwW9p2S/lA5Oo+DaG8TQXz2bCbN3zBP1IS
         sV/jpjMJOvycb4vDLWlbDLlZR4jVbgD5G9kDoSsaPdrmb5NhO3D9h2a7uyXxIb/nqnHC
         Oz7g==
X-Forwarded-Encrypted: i=1; AJvYcCXsUhfzdu2LHM1IllFHJN56xjiXOoZVmACv6Cj8VfN5mmW9UYVFQ+hbBXpTBRBXcdb9oHYxoQMlhnI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi5zZTWwKB+9Ous1/uSM5Ewy9tOuuWrGlyJNmzPUVGxhWun6CP
	KrAkeL6mnts1IRmauSymSZNhasKHPBX2Lq7ABMxz6+RT8UHp8U1oz0pL
X-Gm-Gg: ASbGnctrShgGsML+kMGO9bmsnlbDe9E1seX8Xkf4bVh9AHfzpD5LxZFL1MtL9MJiuVT
	5TJ+3HsjR3xxXco0inRnr/dj7d+Mf1Wv1ZJhW0BK86+Ew/KBGdz7bzHD4XK/i1cvCByHkdgAQQ/
	mC3KBVDH1fKlLCXY0h8+l80S5A2Byo0NKxtxSkLlxowX6RDuPzdaI0nFL0gzcUZrRw2t9XorvuY
	f4aQ0WD58B5mxJSG6z4nO4bG1BixmPqTGmmaDHtWlFA8CDm/8YvOc+vgP5NAaqR+a8qKTlBRTRA
	b/4GrdkPAi45FynmZwrBtZ7FZgBgujbt0kZWJFViHeUWGfm79XCdU9VP+EdSuu8ELnsVt70USiN
	tgaLhuTDAh3/y9w4ZI7VBq3S8UvoedLcVKbf+cT0ATmY6qOnl95mkQ1pX9CZLraZNNl+6c69A8i
	5ttaUjbkt4fyOikCke
X-Google-Smtp-Source: AGHT+IHmiyWgOLaCOggvhZPPIwoORQ6P44GeIcmP22SsJkQdAGjOfRUpAYo47TvsrY1gKVuQYt2uuw==
X-Received: by 2002:a05:6512:b95:b0:58b:25f:cbbd with SMTP id 2adb3069b0e04-592f590541amr2974425e87.2.1761410865269;
        Sat, 25 Oct 2025 09:47:45 -0700 (PDT)
Received: from foxbook (bey128.neoplus.adsl.tpnet.pl. [83.28.36.128])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f74ba6sm792838e87.90.2025.10.25.09.47.42
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 25 Oct 2025 09:47:44 -0700 (PDT)
Date: Sat, 25 Oct 2025 18:47:40 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Sasha Levin <sashal@kernel.org>
Cc: patches@lists.linux.dev, stable@vger.kernel.org, Niklas Neronin
 <niklas.neronin@linux.intel.com>, Nick Nielsen <nick.kainielsen@free.fr>,
 grm1 <grm1@mailbox.org>, Mathias Nyman <mathias.nyman@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mathias.nyman@intel.com,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.17-6.12] usb: xhci-pci: add support for hosts
 with zero USB3 ports
Message-ID: <20251025184740.15989ebe.michal.pecio@gmail.com>
In-Reply-To: <20251025160905.3857885-36-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
	<20251025160905.3857885-36-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 25 Oct 2025 11:54:27 -0400, Sasha Levin wrote:
> From: Niklas Neronin <niklas.neronin@linux.intel.com>
> 
> [ Upstream commit 719de070f764e079cdcb4ddeeb5b19b3ddddf9c1 ]
> 
> Add xhci support for PCI hosts that have zero USB3 ports.
> Avoid creating a shared Host Controller Driver (HCD) when there is only
> one root hub. Additionally, all references to 'xhci->shared_hcd' are now
> checked before use.
> 
> Only xhci-pci.c requires modification to accommodate this change, as the
> xhci core already supports configurations with zero USB3 ports. This
> capability was introduced when xHCI Platform and MediaTek added support
> for zero USB3 ports.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220181
> Tested-by: Nick Nielsen <nick.kainielsen@free.fr>
> Tested-by: grm1 <grm1@mailbox.org>
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Link: https://lore.kernel.org/r/20250917210726.97100-4-mathias.nyman@linux.intel.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---

Hi Sasha,

This is completely broken, fix is pending in Greg's usb-linus branch.
(Which is something autosel could perhaps check itself...)

8607edcd1748 usb: xhci-pci: Fix USB2-only root hub registration

Michal


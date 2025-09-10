Return-Path: <linux-usb+bounces-27855-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B4EB51220
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 11:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE6DB188280D
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 09:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD2F311598;
	Wed, 10 Sep 2025 09:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxJnObye"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC6824169F
	for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 09:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757495097; cv=none; b=OjnOVwtyLHaTXnr5Nw10txZEj8qPBYP5ddSdgKUpCcLAMnaoxlUiUXPjiBzTya2e29uC/suHO/ie1SS7OZMkPlMSrqTSmm0uNIETdmTuDwWJNURG8tRBfRL46IXdNKs/uz9/6+QG0QNlbW+uniMOjD9M0l9lrDzXzDy6Fugal3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757495097; c=relaxed/simple;
	bh=1z1u28oN0CpVh0NUsB2m/RZ4W44MczWP5v7+gWZoxaU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bDpXmj176JY3T8qvGUS6QFLFhroETH1gTIWPkXTefFYVC0j4fzOt0DzGO/exSrtRyB0xJgaSqBURW5IIaTBNl8W6yLtHdLDerxecLDrFZsp5BfSEzTeXyBJ8CU7qr+Ls6mxgvVaO7ifQw71WVzRmx3pveTwiNzV+iuhzMPgFbWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxJnObye; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-56088927dcbso8052557e87.3
        for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 02:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757495093; x=1758099893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xy7kv0fahHOxb1rczr11YMJnd2wfLT9RUARK9zYBQW4=;
        b=KxJnObyezyj5VCbJQQFsgU7xfOVmjEvapBddAjXVqtJJsG5HtwluuXcl+2aVkGi2jn
         PtSeqwfdlcpJRJn08SM37smB3njqgx6VRdGVpnWIf8+z/2VHgfLpSrHDrqvtbzbgrzhv
         TpGI9+GkoWBYKAAiF6n7ddg+sMobv62VqgNdrZrk0Nht8NyvT7Z2Wd5Wu421351vvrlX
         +wS7p7EbLSYZuIaTR61ypolT/k95n/MQeO27Ej2vLoPN7h/YwCACZ5yjfDJOBbMwuKI1
         jqW5h+9ZuYnV++GWgICHVp7aPWvvBJ2Rat4pZDI+Sv7OTVeSGM9tTQ/dKU8hwYcBzX0w
         FejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757495093; x=1758099893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xy7kv0fahHOxb1rczr11YMJnd2wfLT9RUARK9zYBQW4=;
        b=es1B8G9Er2zj5jypR78FUt5UvwIMQct/sGAhEi+iIGfWlas/hTwDSvWR58cRHzRhSb
         /p7Gfas9ikOW7Tu4WObf5CInsdAM7jIj/zqf242YnRacMkJ/hn0Z8rUCdwYnvvsKf3NX
         cKrx41GabjwYo7475ZWJbCNrYgyvSBeiwB1UyrzxCHms9vm7neEPbLhzCRgNOhCbtTWG
         +sZNTG8EMKM8ejKpMes+LKlJ/4OleGR+p6VDfsEd2pbLIu+FoivgDIvELYW5jvLGI/6B
         CiTO/SeRm2XxRt6x1dfdXVggQ4+XJkSt1bm/vDqw5pAvKA9XAaJn0Bmq3QBepmpb2Ig0
         grEg==
X-Forwarded-Encrypted: i=1; AJvYcCWgWCVNeJlWnE+vGV2EA4fGX+6GWydigT5rWZT/rjQgmAUgIFA/cpRFA1yd8QBqjf5EF3K7zIQZJyA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVgFxIdhz7J5tJLl43vHdHeyVwNDZhrt51pRxgLiEQPjY/xXCj
	K1bGU7+/BJ5VnFVYiLVlLJGuKeOa52u9XTgAEceu5UU7UcQHg/IluKCJadBSiA==
X-Gm-Gg: ASbGnct1HBwCqhhb+6FR9KzJLuZp9q7lEEKXxjyg6KRYFw0KQurdAgZdv/OxZQMEcTr
	vXhMy6GunzlaSQuYOmwKXdchQa9K9jfuI88iBHDax76a6e3gcYXGs6V1pqYPx86BHgWWSn1S6ve
	hmUcbdd6ucg4NsCM4PwUatR84uHYblvAKrjBTuOl8ywaqWt21bB1FHGdVALhPoJmiC+O5bZRv18
	OZKFDqSeBioSOXHbGxv3LMwClNh0MVP9haEf1QUx9rGmSV6zT8PSOYL29yy7lyxhim2Y2Rruxxs
	ehp89Xy9ziXojSW+Ga99P67m1wRNd/De3Q2x8qkDMDd169O/m+HulOUz+laxZuXtr1VmuehPbmK
	TgBPk0PQMbRhJI5IBP4fAFUXo0XScV0184ymUrRM/cRCs5w==
X-Google-Smtp-Source: AGHT+IHGTE83CJma/2hScbqbMTAtO3YmhrpJ+UWHDquUkm1gHOkftuvBWUsy/dGq/nZVcmMayBeBFA==
X-Received: by 2002:a05:6512:12c8:b0:55f:4760:ffc4 with SMTP id 2adb3069b0e04-56261219ac9mr4656436e87.29.1757495093151;
        Wed, 10 Sep 2025 02:04:53 -0700 (PDT)
Received: from foxbook (bfg216.neoplus.adsl.tpnet.pl. [83.28.44.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56818445507sm1131543e87.109.2025.09.10.02.04.51
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 10 Sep 2025 02:04:51 -0700 (PDT)
Date: Wed, 10 Sep 2025 11:04:48 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 2/7] usb: xhci: use '%pad' specifier for DMA address
 printing
Message-ID: <20250910110448.30e6b906.michal.pecio@gmail.com>
In-Reply-To: <20250903170127.2190730-3-niklas.neronin@linux.intel.com>
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
	<20250903170127.2190730-3-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  3 Sep 2025 19:01:22 +0200, Niklas Neronin wrote:
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index d2ccf19292aa..7d57e2a3abf3 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -781,7 +781,7 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
>  	ep->queued_deq_ptr = new_deq;
>  
>  	xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
> -		       "Set TR Deq ptr 0x%llx, cycle %u\n", addr, new_cycle);
> +		       "Set TR Deq ptr %pad, cycle %u\n", &addr, new_cycle);

This terminating newline shouldn't be here:

[13035.022589] xhci_hcd 0000:00:10.0: Stopped on Transfer TRB for slot 1 ep 2
[13035.022648] xhci_hcd 0000:00:10.0: Removing canceled TD starting at @0x00000000fffae050 (dma) in stream 0 URB ffff88813358a3c0
[13035.022657] xhci_hcd 0000:00:10.0: Set TR Deq ptr @0x00000000fffae060, cycle 1

[13035.022662] xhci_hcd 0000:00:10.0: // Ding dong!
[13035.022666] xhci_hcd 0000:00:10.0: xhci_giveback_invalidated_tds: Keep cancelled URB ffff88813358a3c0 TD as cancel_status is 2
[13035.022835] xhci_hcd 0000:00:10.0: Successful Set TR Deq Ptr cmd, deq = 0xfffae060




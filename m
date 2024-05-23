Return-Path: <linux-usb+bounces-10455-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B09DE8CDBD7
	for <lists+linux-usb@lfdr.de>; Thu, 23 May 2024 23:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E22E31C22FA4
	for <lists+linux-usb@lfdr.de>; Thu, 23 May 2024 21:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D661127E0D;
	Thu, 23 May 2024 21:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mwkCorZZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353D384A22
	for <linux-usb@vger.kernel.org>; Thu, 23 May 2024 21:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716499282; cv=none; b=bX1XvljphqyLGM++Zdg7FZnkbzgkNEmfUwAa5rjB1RP1gNi1XMJ4u+/le/kfsn5DSaQ9sVCut9LShieKZqtmYFyC/g6Sy0Crs/9XQX+FkmgoZN/QUHkS/QNxv13gbMaQrTkySACrghkI5tIwHjtLeuBSsfzLIotoFVjf5dL6JaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716499282; c=relaxed/simple;
	bh=vZ83DITT8+71M9hZZLFbFwj221tiAKCa3CoSsZtHtG0=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fpmiaIKC6wV3N2Rv4u+FxgyiKXritWunbOUPK4x39hXwSkCbarKUdd1OQ/MZw7OS6sylo8hqXnTKibhTLRdai7hScU4dzkk05HFr9NOtOr9O+BpRbObtFmc1xOnRoNkgWdwu/4lb6ZJLPmr6XEioyzPzcjGfWBB9+p2eon8enNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mwkCorZZ; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-794ab0acfbeso9835085a.0
        for <linux-usb@vger.kernel.org>; Thu, 23 May 2024 14:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716499280; x=1717104080; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZ83DITT8+71M9hZZLFbFwj221tiAKCa3CoSsZtHtG0=;
        b=mwkCorZZFgx1BxAueNuTcBOSggPKz0OYGo33ul3jWegyIJkWO8rYWFmX9pss/0dD79
         VfgpcaJjz3NGxOS7+Ho4rFwwo5WwvvFklSHlGMl6Ew8ZeiFFGTXhQfNcBqKTYOq31a/5
         +6YZtrq24JAan4OhhoH0JTKn6noel/VkkV0fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716499280; x=1717104080;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZ83DITT8+71M9hZZLFbFwj221tiAKCa3CoSsZtHtG0=;
        b=RBeGevzJtLjgtKe8Ity5fKc7nvTnHRAeUJ969jI3TH67fGcOoTPaylIwYS4nmmDfQD
         iT+oC4c3QvOzgqgqNyPrFBaT+x+dTripOTqrp3LdL1bM0/Zv9r9NKrlefKfslDX89+0v
         j+DSix9TXNQce7GjhVjZpZC/zr+QROcq0GZ+AGEHOw1TuvsaWg/EfeV02YTsfM3jqAtm
         Kz3Olqsp8RzEumrK8dd6MxeUp7Hd072rKJ35PiL7rbOSl+O/rGHYLlXxR+BJwOESdpsy
         tvw7Agk3J16njMcBVcMIFQiz7Njeuozn/t4FLfQoTPNxoKSfgoAB8dpfCtMXhRE5UHFe
         E6Mw==
X-Gm-Message-State: AOJu0Yzk1lhSOO88us86Y+S5CLiY8aovYbC5vKJnYcqVtu6EBtHwVUam
	PFxnPISultzXybk+NcD2TIDbM2QVJQt+ZgahbIrZikhy0bcoq0bZ84qkbLxtmhB2UpSzVV+ZHRP
	+V0mmbGpRCaJt8bf7nBdLhnxFq6nAqcuY+If4
X-Google-Smtp-Source: AGHT+IFjL+VWQfPxSqxR4aZu/onNvALWc1WiN/6Uf4tzU7N3k9tqKuSjNUhBCdKJsEsHttt47nWNY6CUCfaDhionSzs=
X-Received: by 2002:a05:620a:268f:b0:790:b192:3b9d with SMTP id
 af79cd13be357-794ab0f8350mr45174985a.58.1716499280217; Thu, 23 May 2024
 14:21:20 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 May 2024 17:21:19 -0400
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240523194500.2958192-1-robh@kernel.org>
References: <20240523194500.2958192-1-robh@kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 23 May 2024 17:21:19 -0400
Message-ID: <CAE-0n52UhgxauMgctx903UW=smEiYQSoRWdym2kkKGvODvztQA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: realtek,rts5411: Add missing
 "additionalProperties" on child nodes
To: Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Rob Herring <robh@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Rob Herring (Arm) (2024-05-23 12:44:59)
> All nodes need an explicit additionalProperties or unevaluatedProperties
> unless a $ref has one that's false. As that is not the case with
> usb-device.yaml, "additionalProperties" is needed here.
>
> Fixes: c44d9dab31d6 ("dt-bindings: usb: Add downstream facing ports to realtek binding")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>


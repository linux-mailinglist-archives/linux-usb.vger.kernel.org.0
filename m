Return-Path: <linux-usb+bounces-30518-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA20C5D200
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 13:33:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5AD33B9AF6
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 12:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4C21B87EB;
	Fri, 14 Nov 2025 12:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqw/Z2RG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADBD153BED
	for <linux-usb@vger.kernel.org>; Fri, 14 Nov 2025 12:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763123558; cv=none; b=nrGfahPmaMcH+vjsmf94UpSvGLILYToBfGKyafGniIJps/e+01zNxRc4ktE3B2XtV7eGKMGT7LSzZxUXuz0a6BQBB1qMJiO0P9hJQzOR5cfnUJZarkUC4EUZQuVBcyKsUs3tcFk/IrkkNkIrj3UwmE1Oeg9oUArX8uYHdyI2Eec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763123558; c=relaxed/simple;
	bh=DIJjYjFtI2spgDs2sVP6KIq23gVo71gRQCz0nIFteQE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EgTZuW4qbMSg8mhJWmSET0QoDGfFQmVvJTFcLRxmoG/9eVvdBZVkyo6Jz2NIpF+EPQH0GqcRvanNtS+3CKPlQNrqKyIgzneRK6mLPsZtl2DQ/3jip6uScOQWbwBOGXWiemgvvFFq/8kaBQV0ifu7EMhlPz+xj0jXZqCDskCPyyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqw/Z2RG; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b71397df721so248637966b.1
        for <linux-usb@vger.kernel.org>; Fri, 14 Nov 2025 04:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763123555; x=1763728355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeHeMacQ98VS8jGbNZN3tzdZLAogm9JqSfkYxWWrnr8=;
        b=eqw/Z2RGVfZjKvYnY2MpWn2I/Up6uU1aa9KgKB49H/aVwDSHH1laa/yfvNGBSfZcMm
         X/LIhSQxpZzUhN/oudPw+qTFpTo9mmNBNKpWGAM+f5OKALtaOTuz6MEfG6BZIzoU7BlW
         AEfmbIw8rPuP4+sWpSCJ6rISPlQofq/fYMwc0BXEYctYTMyqfrqd7AJpQbgmOZBIz4fj
         Lfg/jrXM+r2Ndt+DQirjU0CPPXEHlhKy4H1JZRVz62khqdWMKFKL8otN7W69wTVLimES
         N1NZlTzK2lGcdR9thfJH6hglw6VGVmEqYKies8p755OZTfzmKb9PJWPASSMKHuYpuEg8
         Yxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763123555; x=1763728355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QeHeMacQ98VS8jGbNZN3tzdZLAogm9JqSfkYxWWrnr8=;
        b=wPyFkn3HCWtVw7ncp28z5KxrO40VQ7IRn7TKpFt47ZPetC0eR2nbzfg/KjoK7SVV87
         oTTedbM9beVSpix9qOz7xRCVlGL1ZDH31MYIUUjJ9ATjOl2ln8WV8l3zP6lNDpnuxl6J
         2qCQF1mS77ViR7Jckk6rzRpukSM06Ka6eb7kEui5VSxraNOtin2BuYo0nhCSQhG207RV
         kb7iJSwpOVxouvV99vB4naRtiGAFsa6Jxl8J9bT/rZwTpqItmujDbVKYcjuwjb/d/p87
         CDaQpOZ1VeCSbOFWSGr+ESAWhGkTLeVS5Jlwzu64c7IYDcOY1jhOrjFzH4vHfk5Jd4XM
         x8LA==
X-Forwarded-Encrypted: i=1; AJvYcCXP3K4FAPEoE3rT9svoJF8izhv12px0eD8FFDE4jLdDf3Pn76vd83toNPefwOba1Wd5cQR9dCqByKM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+ZUBbfJhtOwonFIymrkeXxLjAn2qzhljaCbvlWcDAnibozNZv
	6qzVLJfgRCz18k3kW9oTwsoWhkLMxnuvMi/j+lqEnTcyZwhVCmuElkWv6X8Czw==
X-Gm-Gg: ASbGncsQo0LoJjMXspcPf1lZ2Vq3ua99XPrDkgu+eLizgkYkpEDTqzhHf47JlDMrUX6
	Auh3MqhQnv3kQqNpvQIpfCrr71boQ1WPV17L0yWCPxleg+ET0Zu7/6zY4rixfPPwPs7lnG/oWJ2
	mrzAErx/ziFPKN7Qb+YrXxxwAX+bo1W//fNzksYERw273ob7LfongkesGW+Rwk8G2RIy6Reoe2E
	ihOM9Z6dZP5wjSkOBKI68jxL6Z65qIsdibwTxDzxO0CKVgyuy4/3cakQ7M4qUXv4jw4b0G/RExj
	tzmK4ZOTIj2pR2GCbW6Khbiqyy13BCzqCgpyjOKZFOYGNUF/nELqJEj+QnBvpOd0zSm+VLLaZi0
	kZDVrMt2B++vbHI9ncptc1U4ZPWn7xqNZ8otecVvM/QrAM4NJuvdP3oxPNwEzsZ33c0cydCMxnr
	vXsJSbDPDv8w==
X-Google-Smtp-Source: AGHT+IHCOXnWh0xyAvkPtNe79UUfkP7BpqznH6RoChqC1GNR7ult8e2DIaStzBV+HDUl/Ydg/BSxWA==
X-Received: by 2002:a17:906:f59c:b0:b73:6534:5984 with SMTP id a640c23a62f3a-b736780bcc3mr269364766b.16.1763123555293;
        Fri, 14 Nov 2025 04:32:35 -0800 (PST)
Received: from foxbook (bfd52.neoplus.adsl.tpnet.pl. [83.28.41.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad3edasm376754766b.17.2025.11.14.04.32.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 14 Nov 2025 04:32:35 -0800 (PST)
Date: Fri, 14 Nov 2025 13:32:31 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Assume that endpoints halt as specified
Message-ID: <20251114133231.3f187b94.michal.pecio@gmail.com>
In-Reply-To: <a5119a19-8660-4f0c-bedd-0a9a0301ef85@linux.intel.com>
References: <20251107111317.69be45a5.michal.pecio@gmail.com>
	<a5119a19-8660-4f0c-bedd-0a9a0301ef85@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 11 Nov 2025 14:13:05 +0200, Mathias Nyman wrote:
> Makes sense, I guess we can only trust hardware to update the state in
> the endpoint context on specific command completions, not transfer events.

Technically, 4.8.3 requires HW to update to Running before writing any
transfer event to the event ring. It says nothing about Halted, though
4.10.2.1 appears to imply similar ordering in case of Stall Error.

But then 4.8.3 explicitly says

  The update of EP State may also be delayed relative to a Doorbell
  ring or error condition (e.g. TRB Error, STALL, or USB Transaction
  Error) that causes an EP State change not generated by a command. 

so the spec is a self-contradictory mess as usual. My hope with this
patch is that maybe other SW vendors follow 4.8.3 recommendation and
HW gets tested to work under such conditions.

The Promontory problem is not even a delay, it's a complete failure.
I added a loop which waits for GET_EP_CTX_STATE(READ_ONCE(ep_ctx)) to
become HALTED and it was still RUNNING after 1.5 second.

I guess it's some stinking internal race condition again, maybe it
halts too quickly after restart and then a delayed update to Running
overwrites the Halted state update. Or something that only happens
if we restart too quickly after previous error. IIRC, it was never
happening the first time the endpoint halts after loss of connection,
only randomly later after some resets.

Regards,
Michal


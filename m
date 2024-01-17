Return-Path: <linux-usb+bounces-5154-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DEB830042
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 07:50:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1B7D1C20D68
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 06:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361DB8F59;
	Wed, 17 Jan 2024 06:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="35bbjln8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6BA4687
	for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 06:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705474215; cv=none; b=R0BHBC5tdogYO4s6ZB5wTQ3uRtNPm/LEMuvQp+PwdHCtfxIIPOVtM/PDLgF0CUcrKKR41/S9pDHBmWfy47RLey0ZjDvSL6WrFFc/+wh8bLpnMwBhU4lWrjeAOYXkSB+6vag3CcycdUFESa1ya7WA16tpu2jOdts9rDN474qutTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705474215; c=relaxed/simple;
	bh=10k5FWdS7+f6jSsDCvnmImCLwYOIlcEv8RTd3ZEsu38=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type; b=D76d58JAg2lTnWdtzZ6HhajdaRpNFQkuZ41eQZYQpBUxFl1HZR7MJrwWoicIy2aBC7IcxtJ0Rb38x91y4YceGpYTg1E925NX6uG31Iq3gDaVKgsoEGaTpDY5ujQ2zwk7O7sGbMC5eGhn/wckRjhBV4bjbIhPP/UBSMJ0UlliCK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=35bbjln8; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-429d2ebdf05so196011cf.0
        for <linux-usb@vger.kernel.org>; Tue, 16 Jan 2024 22:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705474213; x=1706079013; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k+lCUe/aLkoNnSyzSKT97pRhS1APloZBjgjTg48CWNA=;
        b=35bbjln88Weoy2298ELbkI/32r95P7+Ar4cjPW/HWGWNvaOuIiZKqsBpHyewa5zYfw
         eE2OfM0+rHnxobarrxho84kzYdqfLDzW8Ji00eOFqF9m88wjJsqdvHckAR7UzGu6wOdQ
         m6Q2TstNjQw427l5BIFYoLchGkU0kJ/y336cWaVECf0H0Jm8OOViwGn5+ZQabSuL4Me7
         KRDz2bFg7ypir4Z6bT5od1gWEZHn9sLBavfSAcCv8B3MPvgu7yL4COFA4WxkI8BFBOwm
         qAwM4ckJmH87CoubzI2H2/3bCc/hItFIQE4EjUX4/qIThTw5xaGtFyd96I42wY1ttHL2
         Mvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705474213; x=1706079013;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+lCUe/aLkoNnSyzSKT97pRhS1APloZBjgjTg48CWNA=;
        b=L8h3QTKNKPCkK1PvbTh8tfzSFLnZ77Rfb6oaofovTwqSXVgpB+0TVhZz0S77bwXfab
         +xooKKDqDI2KfKBedgC0nK456V6H6HlwylcX9YdtwMIdYm3kwD+tE6G/WV/vQK2noWjy
         rUTduWLhtyHPZAo+nZ7A93YgsDuDEzXjXSeuw/1yeMay6JcYoJm37XddurWlHH5LGfq7
         aCy0jDzX2Pp3urbAzcQriQsq+ho9814oM1LBW+I9ossUa6w3hZrXj8CdwbMm7pK9TALK
         1uts4fTAFy9B8hxGPOG8WwXPwAIHvZOaCDqD8xkAgtwy5IRD1OARtX2cinAkOlrpXp1c
         e7jA==
X-Gm-Message-State: AOJu0YwXgJbFgRIyr7rBnD+cN78QAWcgqaDSoSLwTdluKF+DZlhp/3Kp
	kw8qrBa5u7fo/JbhW/l39KcqnlRoTplamhftlTb5Juzr4yE/wAP3hHrEu62FntBKk2rVoUCtbh/
	OKXs44En2xjDf7L0Enoe5nsMC6+BZmtRUpQo9LDIJWhiZ5J7Q5x/D
X-Google-Smtp-Source: AGHT+IFag8jwzpRQGZt+uJiKJaDndyScS8ausy4lwebG07OLpiTfL/AkPREjfkJIrHMjxWKmdmJpOnZOQ1RXVr0dPkI=
X-Received: by 2002:a05:622a:1992:b0:42a:fac:c929 with SMTP id
 u18-20020a05622a199200b0042a0facc929mr70665qtc.20.1705474213032; Tue, 16 Jan
 2024 22:50:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240110095532.4776-1-quic_uaggarwa@quicinc.com>
 <20240117011859.dv5d27cf7qhwxuxf@synopsys.com> <34621658-0626-82cc-a641-3c25af3ea9f3@quicinc.com>
In-Reply-To: <34621658-0626-82cc-a641-3c25af3ea9f3@quicinc.com>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Wed, 17 Jan 2024 14:49:46 +0800
Message-ID: <CAKzKK0r3P0zbN3ib_qPoGqqbdPSX8YeC=0QwKnZoDbfex8hvHQ@mail.gmail.com>
Subject: Re: [RFC PATCH] usb: dwc3: gadget: Fix NULL pointer dereference in dwc3_gadget_suspend
To: UTTKARSH AGGARWAL <quic_uaggarwa@quicinc.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Uttkarsh and Thinh,

>> Call Stack:
>> CPU1:                             CPU2:
>> gadget_unbind_driver     dwc3_suspend_common
>> dw3_gadget_stop           dwc3_gadget_suspend
>>                                        dwc3_disconnect_gadget

typo: dw3_gadget_stop/dwc3_gadget_stop

> Do you have the dmesg log of this NULL pointer dereference?
> Thanks,
> Thinh

We also encountered similar stack traces.

[    5.130593][  T100] Unable to handle kernel NULL pointer
dereference at virtual address 0000000000000028
[    5.130912][  T100] Call trace:
[    5.130914][  T100]  dwc3_gadget_suspend+0x88/0xf0
[    5.130918][  T100]  dwc3_suspend_common+0x58/0x230
[    5.130921][  T100]  dwc3_runtime_suspend+0x34/0x50
[    5.130925][  T100]  pm_generic_runtime_suspend+0x40/0x58
[    5.130928][  T100]  __rpm_callback+0x94/0x3e0
[    5.130931][  T100]  rpm_suspend+0x2e4/0x720
[    5.130934][  T100]  __pm_runtime_suspend+0x6c/0x100
[    5.130937][  T100]  dwc3_runtime_idle+0x48/0x64
[    5.130941][  T100]  rpm_idle+0x20c/0x310
[    5.130944][  T100]  pm_runtime_work+0x80/0xac
[    5.130947][  T100]  process_one_work+0x1e4/0x43c
[    5.130952][  T100]  worker_thread+0x25c/0x430
[    5.130956][  T100]  kthread+0x104/0x1d4
[    5.130959][  T100]  ret_from_fork+0x10/0x20

(gdb) list *dwc3_gadget_suspend+0x88
0xffffffc0089b2318 is in dwc3_gadget_suspend (drivers/usb/dwc3/gadget.c:3729).
...
3729            if (dwc->async_callbacks && dwc->gadget_driver->disconnect) {
...

Thanks,
Kuen-Han


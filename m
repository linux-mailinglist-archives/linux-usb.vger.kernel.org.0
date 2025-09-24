Return-Path: <linux-usb+bounces-28590-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C1DB98C05
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 10:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0F451B2226D
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 08:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB0D2836B4;
	Wed, 24 Sep 2025 08:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnp4wJ7o"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90616281371
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 08:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758701270; cv=none; b=XzPSqoJPo3sM5+W0duWE5EONptLoHYV4dsoV7WwUwPCjxCcVPe2e8cfvwuOB6RzmmhxoAZ3ueNIm1DLngOJ8bDMYAkQCTKiJiaCylpG/st/GjAsnV1pyRfJYoe8OxGPt1xKvTgtklx0u4En26sOg+L5NRXl9SKXIQAg7DNmRQkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758701270; c=relaxed/simple;
	bh=CPJFhlS86lHjQ8Ti2XaTHsWA+1yz9pSmmfGw3hKwYcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+Ho4NIGVSidJQPKpx1nhTUoRA/tH1qNUVOflZVOP7CGWlm/l6O31cTJsmko9dFGR5OyHkF+LuGXMnlGOHO8E8+v1BUTRdrsfLtvF7Kp+wDld5XDVUi8LVkc6h9ktFh7az4Ltt45MNUm5Q73elRW4b0HFuoYg16EQLw83p4xKnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnp4wJ7o; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b2e0513433bso417868566b.1
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 01:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758701267; x=1759306067; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CPJFhlS86lHjQ8Ti2XaTHsWA+1yz9pSmmfGw3hKwYcE=;
        b=fnp4wJ7opiJX1+q2nsrQptUKXzAnZRKZg4g8saYB/aUadbuHQV18LvkD45Krh3hDRz
         kz+GDpHiyI0VBc+MayLeOnRzjJ7IXYB6Pod2t8XJkOtQfa9qg82Z2JuP+RfPfnf/AiRV
         grH3iZPSRT4EEfNc8/2MZhihK9H/SqM+FC/R1IItW4+i38QU0Ct0Gmkd+ODtRhocuQHz
         ZnK2BRTNDWnEhz+2Hj7LX2agSpMjUgO3tvjUwCRCB9eO4huo5J4iqtcQ7Tz1zMHr9lUP
         1bIGafWHzsGQ39i6FuQDJxluLVIqWk4ws7B/s4sg+kYS1LNgF8vrYmfpLCRCUTj6H+Au
         +Rnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758701267; x=1759306067;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPJFhlS86lHjQ8Ti2XaTHsWA+1yz9pSmmfGw3hKwYcE=;
        b=tohwKMNTTuRmc2W/v1gI9dut+x5dWpSZ1138lpsk3aijQANA74fsnwwbmM3pe52gdR
         fCQGXNlhO/GLPCjeQgel+3FuxB55dij9cmQiA0jvfpqR37CBg2Kx2gVKi5S9/eVrEb8T
         SO8wzy371+dxZ4t9dK7YqvGAkIhyeBFwbMys7COnGEjTX405uDdyqkRZ9m5tUwMoS2KE
         nnhIDISaCZEptsSIFwBmuxhBcPlFREb8wDUwSm5DfNfiTpx//Ai4c7KZXtXCRf673zTs
         oeLouMLJFz9nK4Tz9I7PP3+nzC4CTkbgz5Y8NYroIkETzwDFKFSqWRlWeOtHWrwkGBXb
         zyFg==
X-Forwarded-Encrypted: i=1; AJvYcCV+qJy6D8xJOVHktRGuViC+KhmZ2OPpZJQTgIKals20HOviJKPUbEmrKK2VUWZ0VFuSwXIulox8j88=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHyvBI8LKtcpJDOEZZjFrUt0jyn/PWcciLGf/3334DSSDzAu56
	jmQEQlWDO3aX+5XEhzYhGFIZKdfZXj46JU0MqBMkg+TXXa6Z03FaRzmwWPW3Jx+N2vmNKT5+qIZ
	7o15W77R2UQa76w6EvuyrrzH5JI7Yjv4=
X-Gm-Gg: ASbGncuzAy3TNbEqZZLAsrVwcV2bj0LMU9hRvFY7WQk/gvwqAZQKLU2aG1S3ITmPR6j
	mj3RTiWRF4MUD3wdChD+1tIYEideIydPdDMATlECViOycCtncz3LEPsbv+Mk9je8X+UtnGiQiMx
	LUJJJN9vQ+TJyqiN+87B9DEwtEO3biupnvAU8Ae7/WE+HwSlpbV2dwpBKRiBkN0eUbQK0HhfIW9
	qmj2+H/xw1xk9DIoac4K8PsRWOo3CRvnv3PEm7aQW/8OTgiF1j1dA==
X-Google-Smtp-Source: AGHT+IFWa4lkAHwf/4SArdm61wLTC4F7gQbf86GEjLZLwo2VefWv8FFXmP8OkTgdIk6qtNPTw6EZddqMonym0lxMhp0=
X-Received: by 2002:a17:907:26c4:b0:b2b:a56f:541a with SMTP id
 a640c23a62f3a-b3027260835mr530198366b.7.1758701266609; Wed, 24 Sep 2025
 01:07:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923022205.9075-1-viswanathiyyappan@gmail.com> <20250923164916.5b8c7c28@kernel.org>
In-Reply-To: <20250923164916.5b8c7c28@kernel.org>
From: viswanath <viswanathiyyappan@gmail.com>
Date: Wed, 24 Sep 2025 13:37:33 +0530
X-Gm-Features: AS18NWCT-FjALMCOah9bf_auRuFbM1Q3yx9_Iw8e7RGCWur-FeBhqSVRINH2d0w
Message-ID: <CAPrAcgOzf4XYGA8X6TneRrmVwYVYgF=KvnpmRbT6XA+D9HR6jQ@mail.gmail.com>
Subject: Re: [PATCH net] net: usb: remove rtl8150 driver
To: Jakub Kicinski <kuba@kernel.org>
Cc: petkan@nucleusys.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	david.hunter.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Sept 2025 at 05:19, Jakub Kicinski <kuba@kernel.org> wrote:

> Thanks for sending this one.
> Based on Michal's reply I guess we need to wait a bit longer.

Sorry, this version breaks the build.

I will submit a v2 that removes the driver properly

I hope we won't need to apply it.

Thanks
Viswanath


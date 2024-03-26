Return-Path: <linux-usb+bounces-8428-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 693CC88C8CD
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 17:16:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3550FB23060
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 16:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A5B213C9AE;
	Tue, 26 Mar 2024 16:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dk3VBKc9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ACC13C9B6
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 16:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469794; cv=none; b=fCoIZynvw9T8IZNzPx0quITEjel/dxXDc8RbjtvTqW76NuxpXb0f+LcGoEaTsg7j+mBEoH3UCIrLw/z/OY1qVFyzKIqjnEI1xRm9YJcLHasH7gFoAzaK4/7z33ltlvxUc0Ui6BGp8/hH7sRMBSu5eRcZcALUpofH+8Yndyt1E4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469794; c=relaxed/simple;
	bh=8JqQr82O/WDXuTCV/mAX3xEuzrllWhesmqUjiW3qiVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mPcWVRsk0yDfHhQ2g3F9B8kmLrBcY1DrY+UWUyiFK98ToxZjxoDduPwetQy54JEcjDbqQ2qhgzDd/HfW7RlmPfYsJSn6WPaCMJzMEvKa7pi+I2RnAb8LinJg+egEf0g1Uv92dMeaDu3QbttYPHoYm2g3A6ANpg7p7MGFMJu3ZWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dk3VBKc9; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a472f8c6a55so546484366b.0
        for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 09:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1711469790; x=1712074590; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WAxfTyTcPXKUAhCkiadsMZfL4wqHb8g7lbyOozAT2Eo=;
        b=dk3VBKc9+psIpw+LK2YLyvD3H28Jn+7SZAqGpdxiahWQLNU2trFXAOhz5mjj03ptE8
         +LKfZj0Ci2e2EVvqcs6CABWR0vcULwQGXh3bGTQpT9+7eEREU+aBOO6R2sSRzqtrYtMt
         artGPPF4URH+0vU97wX5ZEF/RUw+MZyC33Ubg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711469790; x=1712074590;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WAxfTyTcPXKUAhCkiadsMZfL4wqHb8g7lbyOozAT2Eo=;
        b=pExaEmP01/DmGa0h2WK//KX8wuspLaYFc/VJqfnjoOxatkYpCxXCDMmL4hH5oMgbe0
         4eD8ncff39jZXgcM298V1JR1IDVYk3+87Z9qVSoLBBBdHYiwEYDv4nLlVn9XsCJCE5kN
         7rvQ3+Ig8pHmKSQ4QiXvIA/C/s/fMRNeO9vQGV542tVPZIbkwzo+WZ54vcq+thLcA1ue
         eoYzvIOdVYFCbXM0T/ciTuW2OAu9F3FnY+Co5wVaq1Vk7kH7jOfMbsgAoZC3iRpbveUN
         RF3dKBQwoFu8IYZ0d1Bljf4zM74TAhxhbuFcLr/XO5SGRgJDUhVwAtma28pRIfrS9ezp
         ny/A==
X-Gm-Message-State: AOJu0Yx79WEtFS5LOHM1iJQB+cbGh3PYs/j4UdUdymL8F5jnLKsT64oZ
	ThR+/NpEFB4xx7IynYFSC/lvBX6cFvbJ7npQygOxDEUS471c4OukF8PhII2btFVkM3yB9dG8FHa
	Ie0iMGw==
X-Google-Smtp-Source: AGHT+IF6/mJSiPzrau7xDETdBZdMGY9oL6GpxiIS6xwuZk5NqDLrdw38IVwAaHInJERL7w0JfVISpA==
X-Received: by 2002:a17:906:5851:b0:a4a:aaa9:8b3b with SMTP id h17-20020a170906585100b00a4aaaa98b3bmr115412ejs.77.1711469790638;
        Tue, 26 Mar 2024 09:16:30 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id c22-20020a1709060fd600b00a4dacd6b8b3sm1451641ejk.68.2024.03.26.09.16.30
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 09:16:30 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a44665605f3so672197566b.2
        for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 09:16:30 -0700 (PDT)
X-Received: by 2002:a17:906:3610:b0:a47:ae0:160 with SMTP id
 q16-20020a170906361000b00a470ae00160mr131774ejb.73.1711469789793; Tue, 26 Mar
 2024 09:16:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326160342.3588864-2-gregkh@linuxfoundation.org>
In-Reply-To: <20240326160342.3588864-2-gregkh@linuxfoundation.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 26 Mar 2024 09:16:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=whpUh+G_DzR1WpgTeELGk2q4fRuFu9BV77XUp7mGX7+oQ@mail.gmail.com>
Message-ID: <CAHk-=whpUh+G_DzR1WpgTeELGk2q4fRuFu9BV77XUp7mGX7+oQ@mail.gmail.com>
Subject: Re: [PATCH] USB: gadget: dummy_hcd: switch char * to u8 *
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, 
	Jakob Koschel <jakobkoschel@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Ira Weiny <ira.weiny@intel.com>, Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Mar 2024 at 09:03, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> The function handle_control_request() casts the urb buffer to a char *,
> and then treats it like a unsigned char buffer when assigning data to
> it.  On some architectures, "char" is really signed, so let's just
> properly set this pointer to a u8 to take away any potential problems as
> that's what is really wanted here.
[..]
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>

Well, I assume this goes back to the discussions almost two years ago
that then just led us to use '-funsigned-char' for the kernel.

So the patch is still correct, but it's not like it's strictly
necessary. I have no idea how this re-surfaced now.

            Linus


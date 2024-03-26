Return-Path: <linux-usb+bounces-8342-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD61E88B735
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 03:11:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 207ACB22CD9
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 02:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD7A5A10F;
	Tue, 26 Mar 2024 02:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eSdp3gjq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A6D1804F
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 02:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711419095; cv=none; b=oX74EpVKgOLcWq6iLOSMStkinqxl47XFzgm0c3A8vgFGtbVT8DNv/iEh/OIlkIQAyx5I+yNq27Iu3i7O+yj/RAh0+1uC/nNBsAFxCWhuakHysf1KtCT8FnGU4e8ne0mGRximk/cKmzhQ9v+x7tiXDfafxkJrnXMEzplJZFZoxHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711419095; c=relaxed/simple;
	bh=2omgm0oVwmFQY0df3M492JuLNwzHdhr921AZ7TN/Hv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MdiWvpu3xSBYqXc+6UeVaKAnkB5NlaRQWZgJsHs573NYWOuVGW80vwXKTPIignkaX1CqRZgpgYjlPYJNJUDY9yxr1BvaPdJu8AG510pdVmlDZILvYBSSXwa2lCIjQe2XLRywUamLuuEgnerv4WRRUzwYWjJClkFd/FtRvBB6qAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eSdp3gjq; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-696315c9da5so39419966d6.2
        for <linux-usb@vger.kernel.org>; Mon, 25 Mar 2024 19:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711419092; x=1712023892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2omgm0oVwmFQY0df3M492JuLNwzHdhr921AZ7TN/Hv4=;
        b=eSdp3gjqsDTO93dxhWHaawckcq75zu/wlY9NyaPJcl9ra1K1NYcgesDueqZ2R3MzIc
         19dP1gVirJ17xEe11y8wYJiRYPnUomJKCIjiW9xVCp2tt5uVfi/bGWuFFjVY2llkXqfJ
         CnfM/aESEjCUfLwfe6J0MaccHfwLnQ70mbbWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711419092; x=1712023892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2omgm0oVwmFQY0df3M492JuLNwzHdhr921AZ7TN/Hv4=;
        b=tBj9xargcwQKgNJbf+JUT3HUQxW4R8xsrvjZoCZ8bOkqXdeST8nCknfmGzvwhN+ji6
         Z0OYKE6dlplUw/dvjQUm92zKMndeqN6Kf4PEI7M5mqGuAxhKF9VUmodlpw8pM3DfJYhc
         4kiz/2nmfekEUDM8x06gCTZP4zQMQLFSigpe8065D2nnyuNFGDQDp2UkFMtses8wvAvq
         A8Rt7Dqkgve28dbHNJjktC9B9WQWbNJSyep5DrzgbvWYQqLoUPaSeB/M0hl6YPVyraqG
         CIXbDkFeDdxC0yk2bafnpEmJA3Pe3Bv6Uh/uascisFfn6kiwnNCRPjKr47x8KWHaIW35
         OnqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyCLIDy0useP+aJg4WVHJdds3gL+VPxa7rVfNhasQ2ydDmIHPe70kbKzuBtgdRxXEihnics8NZaV8jSYYFbGa3b8V0ZpKsu4gh
X-Gm-Message-State: AOJu0Yw/ZzsfbUO18DOcy5ZGo7XXDbfnW9P5a83fPX4GijlMfqUxxP8i
	1VFwUaKynvs0b2/EQKKORzbFqJFKMy5tF/aUsnKFiAbDFRWXXKd/EF2HsLuj7cqGfOq8zEs1cPZ
	gJeXBjDgwbc1dSJ9+3b6W2GWqs/twR88b5TgZ
X-Google-Smtp-Source: AGHT+IFcIOWbn/HGLYRUnQpkj83Ev0HVBfuC4tfZaVnBO+TnfjywB0pWS+oOPTYuoffaX1zwBb9JPwT8JIdQku9O9vk=
X-Received: by 2002:a05:6214:2681:b0:696:51aa:8a6a with SMTP id
 gm1-20020a056214268100b0069651aa8a6amr12396926qvb.18.1711419091839; Mon, 25
 Mar 2024 19:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325-public-ucsi-h-v1-0-7c7e888edc0a@chromium.org> <20240325-public-ucsi-h-v1-2-7c7e888edc0a@chromium.org>
In-Reply-To: <20240325-public-ucsi-h-v1-2-7c7e888edc0a@chromium.org>
From: Prashant Malani <pmalani@chromium.org>
Date: Mon, 25 Mar 2024 19:11:20 -0700
Message-ID: <CACeCKaehH3Qs8y-W_jsyOdnTYWVzgsGj5_wGujjYT2Sr8xxqkA@mail.gmail.com>
Subject: Re: [PATCH 2/3] usb: typec: ucsi: Import interface for UCSI transport
To: Pavan Holla <pholla@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pavan,

On Mon, Mar 25, 2024 at 4:37=E2=80=AFPM Pavan Holla <pholla@chromium.org> w=
rote:
>
> Import include/linux/usb/ucsi.h and remove any duplicate declarations.
>
> Signed-off-by: Pavan Holla <pholla@chromium.org>

Can you squash Patch 1/3 and this Patch (2/3)? It sounds like an
atomic change that doesn't need two patches.

BR,

-Prashant


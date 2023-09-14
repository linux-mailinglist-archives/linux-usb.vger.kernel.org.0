Return-Path: <linux-usb+bounces-96-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A207A1166
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 01:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97ACB1C20BE4
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 23:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8EAD2FF;
	Thu, 14 Sep 2023 23:05:52 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A353C05
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 23:05:50 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D34F2709
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 16:05:49 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9a9d6b98845so583645666b.0
        for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 16:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694732748; x=1695337548; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1ZXNYZuH4kWnk1JCUQ16o1+EQL82qZT05lOEyrXgZ0=;
        b=olDVR5WY8J/l4AxAOsgFefpKEd5pX8GygtEQ/rQvVShJyGnjx/mhReb+c3XcpE0UgX
         WXt6hQbbeD2DGFkVIyBGq2WZydzkEDJvyPnnQ0gRn+tmzW0THUbNNY3SJKb37eAmRGKQ
         VfzkhiSRRCmOjMmVeaIk1685Vi01lO6z4QasVmZf6eqALXgbW/cUEjuNiHifFKHBgGww
         75nwomGdaK5jKNzzVp9STq9PWq++88X7NghTU43ZCI72/cGEnTtIdog5bIhliu/kQIxZ
         ypzsEvi1bHtBZ+KHitzXv75++9bWIYoMHnaQKZqxIbO/cb/NX3WHoJ7KWGGyYNjFf1C3
         WcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694732748; x=1695337548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1ZXNYZuH4kWnk1JCUQ16o1+EQL82qZT05lOEyrXgZ0=;
        b=Wm+/eNULGCTlVOcQX/8UnZVd2F7MTjaZvTfyGCuGdOMa6SoG2FBzcmrYdwLRGTi4iX
         vXPh9I4FHGtrKsszQs/ieeN5G3trGqslzPw9lNHOfNwHpwQDhuFVGqyiAf0QNdsh95An
         wMTDYUEqLZq3ZFqk/nOzjJlQ+02G+04yNMtLydINTWcAmAPvYqGxSmUTjm6xjztaqOzv
         Cg4SKOc1Gzgy/3v3XA/cHocr70KvLLislgXvAXnPMHlSonjJj2yFMcKYivQy9T3yeK8j
         d/j1errqskwHgL0e0I6VrNLCl9r5bxMufNJx8oTrqjBdQvsWsb++9DlWp32edDPGxS3h
         LksA==
X-Gm-Message-State: AOJu0YyALRenyRVg9yc+VqvuiG4kF+q18AwLcq/uOV/aPjEWHrtO5zhE
	/T2tRcSbeMd46m0pT01OEsV77C7w3ZE8pw1z9jqVEDW4BWu5J3iLiFA=
X-Google-Smtp-Source: AGHT+IEYjO7yOeoI4U5uv88zCqAim8OtNIXGMQ0pIFGmP9HBSuvYiXqE5Do5P87Z31kBv1tppdr7V/FnfLnt2Xt0Va0=
X-Received: by 2002:a17:906:8a6b:b0:9a9:d5d1:35a4 with SMTP id
 hy11-20020a1709068a6b00b009a9d5d135a4mr56901ejc.7.1694732747675; Thu, 14 Sep
 2023 16:05:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230912041910.726442-1-arakesh@google.com>
In-Reply-To: <20230912041910.726442-1-arakesh@google.com>
From: Avichal Rakesh <arakesh@google.com>
Date: Thu, 14 Sep 2023 16:05:36 -0700
Message-ID: <CAMHf4WLeSC9m05XOU54yL=2xUcSqbWP0f7evM0rZRsJ=J-btWw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] usb: gadget: uvc: stability fixes when stopping streams
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 11, 2023 at 9:19=E2=80=AFPM Avichal Rakesh <arakesh@google.com>=
 wrote:
>
> We have been seeing two main bugs when stopping stream:
> 1. attempting to queue usb_requests on a disabled usb endpoint, and
> 2. use-after-free problems for inflight requests
>
> Avichal Rakesh (2):
>   usb: gadget: uvc: prevent use of disabled endpoint
>   usb: gadget: uvc: prevent de-allocating inflight usb_requests
>
>  drivers/usb/gadget/function/f_uvc.c     | 11 ++++----
>  drivers/usb/gadget/function/f_uvc.h     |  2 +-
>  drivers/usb/gadget/function/uvc.h       |  5 +++-
>  drivers/usb/gadget/function/uvc_v4l2.c  | 21 ++++++++++++---
>  drivers/usb/gadget/function/uvc_video.c | 34 +++++++++++++++++++++++--
>  5 files changed, 60 insertions(+), 13 deletions(-)
>

Bumping this thread up. Laurent, Dan, and Michael could you take a look?

Thank you!
- Avi.


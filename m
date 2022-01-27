Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFF6749DEB8
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jan 2022 11:06:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238909AbiA0KGa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jan 2022 05:06:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238228AbiA0KG3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jan 2022 05:06:29 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B681BC06173B
        for <linux-usb@vger.kernel.org>; Thu, 27 Jan 2022 02:06:28 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id k18so3685621wrg.11
        for <linux-usb@vger.kernel.org>; Thu, 27 Jan 2022 02:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=iCPc9S/xqKutjtG576RySPC5c4MhlsxdAcWvoCriPRI=;
        b=UXS0cNb0r6A21/Yr+t8ULc7eUWYnKfSr2Xz7F/W4kBv4PxDY2V8IiKS9AVKzoL/A4c
         2QXelZZmI0IvcYButMcGhtQiIwQeVSto8F0tLQS/0i6E39oVBJb4ONuB1wxShRLVAjEd
         qBQfBDs5FDzwXhh+3CWdQE+EinE2wHefcKrMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=iCPc9S/xqKutjtG576RySPC5c4MhlsxdAcWvoCriPRI=;
        b=2JkTwPpLonB5qR9WTrO7syaf4rTR5B6PYsXwQkTgN0dl9cMVpfcaF0weymY33V7rYG
         Thhcho9j+sHG9++B5bAN84lwdczpHmibBHkR9cKxWOM4Q0rDuOvB+dfZhcqb/KSNvTOd
         P35cVK10kohNNt0LG3CqCyX0phQ2r7aRNgl8Sr0g+nMeC2p1FSI9tgYX/U1/yP+maILx
         rkFhSb51qCAU+UcmnHASe1x7pYrgEmiz9Qmg9huxH+JYgYI66jQgpa8Q3zZUQOWySWLP
         7j3hXmOwUNYBD1V9jZOvnUdXwEk5pZeUV4q/WAENPOiFbNtpRqkLfLbbMc/Vx+iLz38D
         ESBA==
X-Gm-Message-State: AOAM531RsbnZkVSf/I8+6QsKzCefNSrEF7mFFwjdG57Hux0EFyVRndms
        X9gpH+/Bu3kYpiwwJ+ZiRmQ58w==
X-Google-Smtp-Source: ABdhPJxbmhEnlOI80raqLeqmBjMueB3L0ut5WVsnvXgW4cJU2nUFg7KyFIWNlDJldrhPELeM37AAEQ==
X-Received: by 2002:adf:fe01:: with SMTP id n1mr2448712wrr.141.1643277987361;
        Thu, 27 Jan 2022 02:06:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id d6sm1681780wrs.85.2022.01.27.02.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 02:06:26 -0800 (PST)
Date:   Thu, 27 Jan 2022 11:06:24 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     tangmeng <tangmeng@uniontech.com>, alexander.deucher@amd.com,
        christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
        jsarha@ti.com, tomi.valkeinen@ti.com, linux@dominikbrodowski.net,
        Peter.Chen@nxp.com, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] drivers: Fix typo in comment
Message-ID: <YfJuoHfKnwm6LmuY@phenom.ffwll.local>
Mail-Followup-To: Greg KH <gregkh@linuxfoundation.org>,
        tangmeng <tangmeng@uniontech.com>, alexander.deucher@amd.com,
        christian.koenig@amd.com, airlied@linux.ie, jsarha@ti.com,
        tomi.valkeinen@ti.com, linux@dominikbrodowski.net,
        Peter.Chen@nxp.com, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20220127065156.22372-1-tangmeng@uniontech.com>
 <YfJCBZuc9mOZkIVJ@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfJCBZuc9mOZkIVJ@kroah.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 27, 2022 at 07:56:05AM +0100, Greg KH wrote:
> On Thu, Jan 27, 2022 at 02:51:56PM +0800, tangmeng wrote:
> > Replace disbale with disable and replace unavaibale with unavailable.
> > 
> > Signed-off-by: tangmeng <tangmeng@uniontech.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c | 2 +-
> >  drivers/gpu/drm/tilcdc/tilcdc_crtc.c  | 2 +-
> >  drivers/pcmcia/rsrc_nonstatic.c       | 2 +-
> >  drivers/usb/chipidea/udc.c            | 2 +-
> >  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> This needs to be broken up per-subsystem, thanks.

For drm please also split it per-driver, so one patch per file you change
here.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

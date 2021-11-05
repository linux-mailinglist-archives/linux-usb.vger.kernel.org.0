Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C38E446203
	for <lists+linux-usb@lfdr.de>; Fri,  5 Nov 2021 11:15:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232981AbhKEKSZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Nov 2021 06:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231682AbhKEKSY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Nov 2021 06:18:24 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E26CDC061205
        for <linux-usb@vger.kernel.org>; Fri,  5 Nov 2021 03:15:44 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id z11-20020a1c7e0b000000b0030db7b70b6bso9185373wmc.1
        for <linux-usb@vger.kernel.org>; Fri, 05 Nov 2021 03:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=akaiHjz6SwOCinQKu7wYHJykKjoOoFfBHbnijPyU0Ok=;
        b=bbyD9Z74N8UQc466GhZUx0314i/bxpZDkMZBSU2fESZ/OjZLFayjfO/9njpxD5Ss2U
         qNNUtf2eHZQ98+1gndAE/MzUGWRKyOcBin5hkvCiiBxq6kbMDsnxBAYqI2vgzj19aEfc
         QPXaYaTrqMQBReJcg4zOuuwJ6MFzAyXXVgCP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=akaiHjz6SwOCinQKu7wYHJykKjoOoFfBHbnijPyU0Ok=;
        b=6hz/q+k7WG3tfyxtF5YOWulUTWe0HrUl2cE0+nCVlYJcHAZjCo98FlaJOWtq3RbjO5
         XQpEPwNThDRZQlOfe6BEoyc3P1eNxt/w2dghpQF4Iu2kbQKWjFGrCpHMa/TVl+yWzuPo
         2NaHngqDhJNhKZIq17LECLXLvKsKYJNo8coihTteLKZTx3Y/jKorf6FaWkPueNvZUQ/U
         INuJtVTltErzsBFbhQW4nNcwEJD0XgYkhRoU4gUWDjkM7UlVHbLONIA3JbhidiO5NLn1
         D6z0Mwt3vkYs+HKxab06z6fZ0p+/cOEzCr8V1Z7a1ojnltqmItXFbccry4rMbnXrSTUR
         zWEg==
X-Gm-Message-State: AOAM532lacl/A1fT+qKi0wyg/KQI7NwJ1SxSaCA1SKyE2RikAnFO6X2L
        t1qgXpwVjU5/RvXOMN5uQW7Cvw==
X-Google-Smtp-Source: ABdhPJzWZ+STVhFoSz5QDe5L//xfNM8RZCNfYYtobwvhw8AXTMjQyzLb3D3WSUyjVEtEdaRStFL/+w==
X-Received: by 2002:a05:600c:40b:: with SMTP id q11mr28640624wmb.185.1636107343470;
        Fri, 05 Nov 2021 03:15:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id w15sm7575820wrk.77.2021.11.05.03.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 03:15:43 -0700 (PDT)
Date:   Fri, 5 Nov 2021 11:15:41 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Johan Hovold <johan@kernel.org>
Cc:     Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/udl: fix control-message timeout
Message-ID: <YYUETYSj7tMnO7fI@phenom.ffwll.local>
Mail-Followup-To: Johan Hovold <johan@kernel.org>,
        Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20211025115353.5089-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211025115353.5089-1-johan@kernel.org>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 25, 2021 at 01:53:53PM +0200, Johan Hovold wrote:
> USB control-message timeouts are specified in milliseconds and should
> specifically not vary with CONFIG_HZ.
> 
> Fixes: 5320918b9a87 ("drm/udl: initial UDL driver (v4)")
> Cc: stable@vger.kernel.org      # 3.4
> Signed-off-by: Johan Hovold <johan@kernel.org>

Thanks for patch, queued up for the merge window.
-Daniel

> ---
>  drivers/gpu/drm/udl/udl_connector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/udl/udl_connector.c b/drivers/gpu/drm/udl/udl_connector.c
> index 3750fd216131..930574ad2bca 100644
> --- a/drivers/gpu/drm/udl/udl_connector.c
> +++ b/drivers/gpu/drm/udl/udl_connector.c
> @@ -30,7 +30,7 @@ static int udl_get_edid_block(void *data, u8 *buf, unsigned int block,
>  		int bval = (i + block * EDID_LENGTH) << 8;
>  		ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
>  				      0x02, (0x80 | (0x02 << 5)), bval,
> -				      0xA1, read_buff, 2, HZ);
> +				      0xA1, read_buff, 2, 1000);
>  		if (ret < 1) {
>  			DRM_ERROR("Read EDID byte %d failed err %x\n", i, ret);
>  			kfree(read_buff);
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

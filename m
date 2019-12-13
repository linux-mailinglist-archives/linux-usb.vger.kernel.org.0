Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBB6A11E1EE
	for <lists+linux-usb@lfdr.de>; Fri, 13 Dec 2019 11:29:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbfLMK3w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Dec 2019 05:29:52 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36902 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfLMK3w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Dec 2019 05:29:52 -0500
Received: by mail-wm1-f66.google.com with SMTP id f129so5994116wmf.2
        for <linux-usb@vger.kernel.org>; Fri, 13 Dec 2019 02:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=GAA9AWcbpfL5wFPcx+vPRQkLnI4DRLbbD+X6sGIxIx8=;
        b=t7H2V86l6EXFUGJvFrg0x6XI6Cfjt/lMSA9WSH5ic1tPWxxOeoFytr6MoOlwREEtTi
         zn9+B0WC9auILQ9oKrnxQMg1ybqRGMLy+Gi3jliTvWIyVGAd6v4m3tMXXML/bp8e7JPJ
         5YswGyvAJqo0KNl5znOByqXKTiJ2ddu6q+oJd+QU3mrHgFiJvv1PZGneVPzN7gpamtY1
         /8/8byEQaM/m/G2mOekDtm82s0i9sA2OAxgqbNd4R3DosVBfCCCDXrlV59rlTZj/EsvR
         i1cKQ75Wm2o52mfXhY8QJnaF35l+mKEQWIaXJaphxtWmYBHPa8uXSQIt3AmxwSrKcP5q
         i2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=GAA9AWcbpfL5wFPcx+vPRQkLnI4DRLbbD+X6sGIxIx8=;
        b=YurIJbpQF6tAq8LIJhry4CQ9WvF2cTjADPMwVwt/SLHxEgwgZCJp3rKTeJIOdSxfFt
         d1Z2jxe9Aw1xRjbWi497/3QxullKANkWwozOYAz3Xqj5/E2SGA64dcpt4ro+YJSJRIRJ
         TWY98bgGLR81Soewa1tdu1WxKrOzFIvMwnH+qK745A8q0AChnmWVHKrO/nQe4zwffo+8
         j3hw1DNamFFEyjv/J7HS7j+JwF+aaD5kTRIrDcrNenkLbh4tga1JCFoxziwkD0JEM8JW
         e4yZJv4A43CFhhgQ50w+U4hd0DkYWmRpPp8ncLYweG2haVpKhl1mcBEchai0v1JdVHos
         7QUg==
X-Gm-Message-State: APjAAAVBeJlceJm2eZ4lUhsLzD9vHl9+rEEfDeNmGXXolH+0+nkO2TrR
        br2gNfDAlw9j62t85b+O76WwlEt/s/4=
X-Google-Smtp-Source: APXvYqyOWlXzJyCYhuY956ywgpj6P/o8keKCdjuMKBmynoxXLQf1KfQ+/CRIKb/5h2xuBBXE25Me0Q==
X-Received: by 2002:a1c:f213:: with SMTP id s19mr13329748wmc.42.1576232990436;
        Fri, 13 Dec 2019 02:29:50 -0800 (PST)
Received: from dell ([95.149.164.71])
        by smtp.gmail.com with ESMTPSA id j130sm4981486wmb.18.2019.12.13.02.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 02:29:49 -0800 (PST)
Date:   Fri, 13 Dec 2019 10:29:46 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] mfd: dln2: more sanity checking for endpoints
Message-ID: <20191213102946.GA3648@dell>
References: <20191121102810.27205-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191121102810.27205-1-oneukum@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 21 Nov 2019, Oliver Neukum wrote:

> It is not enough to check for the number of endpoints.
> The types must also be correct.
> 
> Reported-and-tested-by: syzbot+48a2851be24583b864dc@syzkaller.appspotmail.com
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/mfd/dln2.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)

Applied with Greg's Ack, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

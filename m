Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5F35392957
	for <lists+linux-usb@lfdr.de>; Thu, 27 May 2021 10:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235309AbhE0IRv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 May 2021 04:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235169AbhE0IRq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 May 2021 04:17:46 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA0C4C061574
        for <linux-usb@vger.kernel.org>; Thu, 27 May 2021 01:16:12 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id u4-20020a05600c00c4b02901774b80945cso2027248wmm.3
        for <linux-usb@vger.kernel.org>; Thu, 27 May 2021 01:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=7TBp2/0xrJlvWJe3b3c+wB1BNBOS/CZI3rImo3F3Aj0=;
        b=Q9qUaLd2SSlIYtGjABhfs97HF8AqYbSKHxHZp1Xj3DdJhIjeIGpUikwihEW2p8fK7v
         QGiOsukD19AM0ydVonj9tYrFMJujEw5/1C9ybuPCbUE8WS97UbxOy0QSbrKTpswUO2a6
         v0X1yKfLXZXY8CS4ZzTS94HtIarVXWspx5SruJTLlgJPsy5GAVGF9SdlRcJW4PVq1iJL
         kp8nnpsVV3cKyO3g+1fvW+ejjKaRBAUAkfzBomjWiGpqVC8RcMq2aS7K4eb8v2yLjCOD
         7o3KDxG2PpPYneiW7uDZR8TpmQ572cdq+OQs0ZVh2S83Jfw9n7bq8y+z9x9T5OmD/XwP
         ZUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7TBp2/0xrJlvWJe3b3c+wB1BNBOS/CZI3rImo3F3Aj0=;
        b=JxDRxBX/CVmcKRQQCPIObtdojU9FLfw6KeAVKvrc9Ul70I1XchBSBFPGNsEAth8uHH
         6PZgkgO67sf5X0BwRdkRT1Tu3YYms4ck701GCzyruvdXjUeGlMW5+UzL19cutdAoQsxf
         oYbfgbymvDLWmbPZHSBPOGLDV+9AyJA/++7uK2KsH4LkOL88QlFtahcPg+DNmUXrK+9l
         Z0gp5DgpdKrW0ojlAPTXOen9d3HAQQHkeqZQaOeDZYIeEjyU9IH3IITg3Qw+cXZPF8RP
         GX/lO7+qaujZU6mc8O1wrzHn1UHEc84EXDONuqqusey/6WsxMb9nWxJIUYFd/xDfQ2wo
         ozWg==
X-Gm-Message-State: AOAM530Gtea9La072aap3iXNScb8p8gaOf9vuUiUmhcctUPJb93uX4zb
        rqP+JnhHBSkapuEb5QoD1/5Y+9OC3p4S4A==
X-Google-Smtp-Source: ABdhPJxS8SFnIMZtAp6nIw3ZoQYPPEKQ75hvZVSKz+xUWe2eiaFQQGba7hN18dKaOINvTvR4hBDg8A==
X-Received: by 2002:a7b:c252:: with SMTP id b18mr2234881wmj.32.1622103371490;
        Thu, 27 May 2021 01:16:11 -0700 (PDT)
Received: from dell ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id a11sm2056943wra.96.2021.05.27.01.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 01:16:10 -0700 (PDT)
Date:   Thu, 27 May 2021 09:16:09 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 17/24] usb: host: xhci: Remove unused variable 'len'
Message-ID: <20210527081609.GF543307@dell>
References: <20210526130037.856068-1-lee.jones@linaro.org>
 <20210526130037.856068-18-lee.jones@linaro.org>
 <YK9Ju9/kdaRv1jcT@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YK9Ju9/kdaRv1jcT@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 27 May 2021, Greg Kroah-Hartman wrote:

> On Wed, May 26, 2021 at 02:00:30PM +0100, Lee Jones wrote:
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/usb/host/xhci.c: In function ‘xhci_unmap_temp_buf’:
> >  drivers/usb/host/xhci.c:1349:15: warning: variable ‘len’ set but not used [-Wunused-but-set-variable]
> > 
> > Cc: Mathias Nyman <mathias.nyman@intel.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: linux-usb@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/usb/host/xhci.c | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> > index 27283654ca080..ac2a7d4288883 100644
> > --- a/drivers/usb/host/xhci.c
> > +++ b/drivers/usb/host/xhci.c
> > @@ -1346,7 +1346,6 @@ static bool xhci_urb_temp_buffer_required(struct usb_hcd *hcd,
> >  
> >  static void xhci_unmap_temp_buf(struct usb_hcd *hcd, struct urb *urb)
> >  {
> > -	unsigned int len;
> >  	unsigned int buf_len;
> >  	enum dma_data_direction dir;
> >  
> > @@ -1362,10 +1361,10 @@ static void xhci_unmap_temp_buf(struct usb_hcd *hcd, struct urb *urb)
> >  				 dir);
> >  
> >  	if (usb_urb_dir_in(urb))
> > -		len = sg_pcopy_from_buffer(urb->sg, urb->num_sgs,
> > -					   urb->transfer_buffer,
> > -					   buf_len,
> > -					   0);
> > +		sg_pcopy_from_buffer(urb->sg, urb->num_sgs,
> > +				     urb->transfer_buffer,
> > +				     buf_len,
> > +				     0);
> 
> Sorry, but no, I keep rejecting this over and over, it needs to handle
> the error handling properly and not paper over it like this :(

Will fix.

> All the bots keep tripping up on it, you are not alone.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92BFF2C8CE0
	for <lists+linux-usb@lfdr.de>; Mon, 30 Nov 2020 19:34:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729663AbgK3Sd6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Nov 2020 13:33:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728553AbgK3Sd6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Nov 2020 13:33:58 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB09C0613CF
        for <linux-usb@vger.kernel.org>; Mon, 30 Nov 2020 10:33:12 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id t21so109496pjw.2
        for <linux-usb@vger.kernel.org>; Mon, 30 Nov 2020 10:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yI+6jC2Kx+/kg3LgUbZZAsEC8UmbIwP/HurPWNryeKc=;
        b=Wbts1eoTvwx2t6ZXM6g3ZmKFmIsswJcbh+57wqDZIcp1M3oSSU3eC5NFbOKxzF9bj2
         VUOEw5Y/RFpT56K4ITSTdOW4T19WT9oBST+r6enuowjVj60EuXR3r/KPNV0OMZgSU5IA
         p87ul7BP0SEc3nkAHJ+cIFJjAyZhc0jsg/BFUQNv85bCo4UVRDjTSJm55ibKgcog88Q5
         tHGnR5g/kpf1yFwzmA8KN5zQj5h7H3SRAWSssZFSG9X55VNljHYTTbCJEdCDxDAJKacZ
         hlkMnMmuJQW7/zCD8vLEVMUIbpYySLvCfym94ZqLUUQE+lNKM+krPKh+Ol+z+oX3VMHm
         8WQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yI+6jC2Kx+/kg3LgUbZZAsEC8UmbIwP/HurPWNryeKc=;
        b=OGUia3qrcsRf/U0sUQfdPDSSDkkitauS2n2pWCCirvggKeY7a0AtiRQhiBl6a31vk3
         CQC8bI2FQp7D1ozJgCcW1Fi6Dj6cquaKJLY9cFGsAxj4IWRE+8dyNn9bWkL9aP1R4ywp
         1EkbpEYPPuHeuLUHEnYa+dvB7/aue8pUK1mRombCdD+t1g+gO6i0wEekVvGcI67d/73F
         q2H9xpC+j9CXtqVQexZYJg8TFCsSnbvFPB6xf8QMEXEcPx2YewJbPYWou79sfDik7xlI
         KBFM+1u44YGuJ2ybzwgWXJt0FxQe/mZbRnjbdmd32dxEOyelWjiNFttNUymIeBSmtI4/
         s/4A==
X-Gm-Message-State: AOAM5311ueLQT8TdNbJIgYdFvBCIQwaNfOWvUL85kmYHbPi/q1ugYmFR
        XmduiAsgoAz8u383VHSd0pSygg==
X-Google-Smtp-Source: ABdhPJzWq4EaekVBzFGUCPCD5i3iTkP9Uzkf8gFfNaRYYtiJcLbUaYWYnhwz9csmMzi1iKCCAK1w6g==
X-Received: by 2002:a17:902:ed11:b029:da:3137:2695 with SMTP id b17-20020a170902ed11b02900da31372695mr20258338pld.1.1606761191706;
        Mon, 30 Nov 2020 10:33:11 -0800 (PST)
Received: from google.com (h208-100-161-3.bendor.broadband.dynamic.tds.net. [208.100.161.3])
        by smtp.gmail.com with ESMTPSA id kx12sm93517pjb.50.2020.11.30.10.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 10:33:10 -0800 (PST)
Date:   Mon, 30 Nov 2020 10:33:08 -0800
From:   William Mcvicker <willmcvicker@google.com>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        EJ Hsu <ejh@nvidia.com>, stable <stable@vger.kernel.org>
Subject: Re: [PATCH v2 1/5] USB: gadget: f_rndis: fix bitrate for SuperSpeed
 and above
Message-ID: <20201130183308.GB1116146@google.com>
References: <20201127140559.381351-1-gregkh@linuxfoundation.org>
 <20201127140559.381351-2-gregkh@linuxfoundation.org>
 <20201130062411.GB32154@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130062411.GB32154@b29397-desktop>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 30, 2020 at 06:24:40AM +0000, Peter Chen wrote:
> On 20-11-27 15:05:55, Greg Kroah-Hartman wrote:
> > From: Will McVicker <willmcvicker@google.com>
> > 
> > Align the SuperSpeed Plus bitrate for f_rndis to match f_ncm's ncm_bitrate
> > defined by commit 1650113888fe ("usb: gadget: f_ncm: add SuperSpeed descriptors
> > for CDC NCM").
> > 
> > Cc: Felipe Balbi <balbi@kernel.org>
> > Cc: EJ Hsu <ejh@nvidia.com>
> > Cc: Peter Chen <peter.chen@nxp.com>
> > Cc: stable <stable@vger.kernel.org>
> > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >  drivers/usb/gadget/function/f_rndis.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/gadget/function/f_rndis.c b/drivers/usb/gadget/function/f_rndis.c
> > index 9534c8ab62a8..0739b05a0ef7 100644
> > --- a/drivers/usb/gadget/function/f_rndis.c
> > +++ b/drivers/usb/gadget/function/f_rndis.c
> > @@ -87,8 +87,10 @@ static inline struct f_rndis *func_to_rndis(struct usb_function *f)
> >  /* peak (theoretical) bulk transfer rate in bits-per-second */
> >  static unsigned int bitrate(struct usb_gadget *g)
> >  {
> > +	if (gadget_is_superspeed(g) && g->speed >= USB_SPEED_SUPER_PLUS)
> > +		return 4250000000U;
> 
> Is tested value or spec defined value?
> 
> >  	if (gadget_is_superspeed(g) && g->speed == USB_SPEED_SUPER)
> > -		return 13 * 1024 * 8 * 1000 * 8;
> > +		return 3750000000U;
> 
> 13 * 1024 * 8 * 1000 * 8 = 851,968,000, how 3750000000U is calculated?
> 
> >  	else if (gadget_is_dualspeed(g) && g->speed == USB_SPEED_HIGH)
> >  		return 13 * 512 * 8 * 1000 * 8;
> >  	else
> > -- 
> > 2.29.2
> > 
> 
> -- 
> 
> Thanks,
> Peter Chen

Hi Peter,

Thanks for the reviews! Regarding the updated transfer rates, please refer to
the f_ncm commit email thread by Lorenzo that explains the reasoning behind
these speeds:

https://patchwork.kernel.org/project/linux-usb/patch/20200818165848.4117493-1-lorenzo@google.com/

Thanks,
Will

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22B1E265CC5
	for <lists+linux-usb@lfdr.de>; Fri, 11 Sep 2020 11:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgIKJtH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Sep 2020 05:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbgIKJtE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Sep 2020 05:49:04 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 887D4C061756
        for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2020 02:49:03 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id y15so4170212wmi.0
        for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2020 02:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9A++ewy8sVp6thBcPOOtbsKFvGPTO2SoiU/BMG02wq8=;
        b=MmJgrSMYoiVBokXHZc4aTskAuomxprJ7MaYaG+sU2biRH5WdQ5hvCNYeEhwh1mllhV
         POSHe3VvNWfA2At3j0JoC4OcALmT8yfhnYyfrnUPJzd9qb74FpW84zZwx10r3yl117BZ
         UpdklLK+p44ymorq/xa/2T2/tcdO71IFq4aeTagml7xomDou/T84yJ8lFYkebPG+x2BK
         1Avo0G+iAFcqbV807/eW41JANHtVCbJ0W5BUmo1XWkVV8VmOIrKmLMU2SYU2LichxXjU
         +LvrMQuteq2ezkJQxv4SmFZyCQzgAEbmdm3AkF1aIGXI+9BNcxq+wUfzoLKb1mwSs9Q0
         mCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9A++ewy8sVp6thBcPOOtbsKFvGPTO2SoiU/BMG02wq8=;
        b=EoiOCl1QhsFPLPGhe1tQ7Qoi8Osu7JKq3ZzQ3v+ADWkR8NO0qkWlTirGMpuOt12bHT
         7GAQyCKT7MSSuyBVKtaDk3Vy/Qs7UkOsbwRykDGCxF4d5IgbaRfnpyjqwLdxFJE2EeBS
         2TRQdqVf5Zc2xplJgNIOWcN4WgcpcDOefs5B30BdNJ8486oU48nXMBjBQg1h7aWCPZ7Q
         IvGDBRy6lgslX8slLVB9+ULay0zfPyhazhkq/UHMccrGdMgtLIEg7bQXwG03FBugDx2T
         cWumJLul9wgOaJ3tlgtVfXWHP9Dr691+tzGHdK4ba4R1XGD0qaGNeZ7n4QekC3KV8dm2
         iprA==
X-Gm-Message-State: AOAM533sAu1YPfT61xtgiDJSYLULZ/giAyjDBSlHy+pDUZGkQvdqfP/8
        4QRRtRctlBfKyvLTIZ7zdTT6BQ==
X-Google-Smtp-Source: ABdhPJyFqCl0VUl+g10iEXvosWPQJqdSR+Yit/3/I+53mTW4FRef+/DbhGVSRBxXqQdFvFZhfLapeg==
X-Received: by 2002:a1c:6187:: with SMTP id v129mr1330703wmb.35.1599817742032;
        Fri, 11 Sep 2020 02:49:02 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id b18sm3644841wrn.21.2020.09.11.02.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 02:49:01 -0700 (PDT)
Date:   Fri, 11 Sep 2020 10:48:59 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Lee Jones <lee.jones@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>,
        Jann Horn <jannh@google.com>, Arnd Bergmann <arnd@arndb.de>,
        Jason Yan <yanaijie@huawei.com>,
        Chuhong Yuan <hslester96@gmail.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Saurav Girepunje <saurav.girepunje@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH RESEND v3 04/11] usb: xhci-rcar: convert to
 readl_poll_timeout_atomic()
Message-ID: <20200911094859.tk2jlcjbolsrkeeh@holly.lan>
References: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
 <1599726112-4439-4-git-send-email-chunfeng.yun@mediatek.com>
 <20200910131212.wm7zskxvcesl652c@holly.lan>
 <1599791601.24609.5.camel@mhfsdcap03>
 <20200911083421.g5cidlnwfiksggvk@holly.lan>
 <1599816442.29909.10.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1599816442.29909.10.camel@mhfsdcap03>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 11, 2020 at 05:27:22PM +0800, Chunfeng Yun wrote:
> On Fri, 2020-09-11 at 09:34 +0100, Daniel Thompson wrote:
> > On Fri, Sep 11, 2020 at 10:33:21AM +0800, Chunfeng Yun wrote:
> > > On Thu, 2020-09-10 at 14:12 +0100, Daniel Thompson wrote:
> > > > On Thu, Sep 10, 2020 at 04:21:45PM +0800, Chunfeng Yun wrote:
> > > > > Use readl_poll_timeout_atomic() to simplify code
> > > > > 
> > > > > Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > > > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > > > ---
> > > > > v2~v3: no changes
> > > > > ---
> > > > >  drivers/usb/host/xhci-rcar.c | 43 ++++++++++++-------------------------------
> > > > >  1 file changed, 12 insertions(+), 31 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
> > > > > index c1025d3..74f836f 100644
> > > > > --- a/drivers/usb/host/xhci-rcar.c
> > > > > +++ b/drivers/usb/host/xhci-rcar.c
> > > > > @@ -6,6 +6,7 @@
> > > > >   */
> > > > >  
> > > > >  #include <linux/firmware.h>
> > > > > +#include <linux/iopoll.h>
> > > > >  #include <linux/module.h>
> > > > >  #include <linux/platform_device.h>
> > > > >  #include <linux/of.h>
> > > > > @@ -127,8 +128,7 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
> > > > >  	void __iomem *regs = hcd->regs;
> > > > >  	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
> > > > >  	const struct firmware *fw;
> > > > > -	int retval, index, j, time;
> > > > > -	int timeout = 10000;
> > > > > +	int retval, index, j;
> > > > >  	u32 data, val, temp;
> > > > >  	u32 quirks = 0;
> > > > >  	const struct soc_device_attribute *attr;
> > > > > @@ -166,32 +166,19 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
> > > > >  		temp |= RCAR_USB3_DL_CTRL_FW_SET_DATA0;
> > > > >  		writel(temp, regs + RCAR_USB3_DL_CTRL);
> > > > >  
> > > > > -		for (time = 0; time < timeout; time++) {
> > > > > -			val = readl(regs + RCAR_USB3_DL_CTRL);
> > > > > -			if ((val & RCAR_USB3_DL_CTRL_FW_SET_DATA0) == 0)
> > > > > -				break;
> > > > > -			udelay(1);
> > > > > -		}
> > > > > -		if (time == timeout) {
> > > > > -			retval = -ETIMEDOUT;
> > > > > +		retval = readl_poll_timeout_atomic(regs + RCAR_USB3_DL_CTRL,
> > > > > +				val, !(val & RCAR_USB3_DL_CTRL_FW_SET_DATA0),
> > > > > +				1, 10000);
> > > > > +		if (retval < 0)
> > > > >  			break;
> > > > > -		}
> > > > >  	}
> > > > >  
> > > > >  	temp = readl(regs + RCAR_USB3_DL_CTRL);
> > > > >  	temp &= ~RCAR_USB3_DL_CTRL_ENABLE;
> > > > >  	writel(temp, regs + RCAR_USB3_DL_CTRL);
> > > > >  
> > > > > -	for (time = 0; time < timeout; time++) {
> > > > > -		val = readl(regs + RCAR_USB3_DL_CTRL);
> > > > > -		if (val & RCAR_USB3_DL_CTRL_FW_SUCCESS) {
> > > > > -			retval = 0;
> Here will set it 0 too

Doh...

Thanks.


Daniel.


> 
> > > > > -			break;
> > > > > -		}
> > > > > -		udelay(1);
> > > > > -	}
> > > > > -	if (time == timeout)
> > > > > -		retval = -ETIMEDOUT;
> > > > > +	retval = readl_poll_timeout_atomic((regs + RCAR_USB3_DL_CTRL),
> > > > > +			val, (val & RCAR_USB3_DL_CTRL_FW_SUCCESS), 1, 10000);
> > > > 
> > > > Directly assigning to retval at this point will clobber a previous
> > > > -ETIMEDOUT error.
> > > > 
> > > > In other words if there is a timeout waiting for FW_SET_DATA0, but not for
> > > > DW_SUCCESS, then we will return the wrong return value.
> > >
> > > Yes, agree with you, but seems I keep its original logic unchanged.
> > 
> > I disagree.
> > 
> > Your patch does not preserve the original logic. Your patch explicitly
> > sets retval to zero if the second loop succeeds. The original code does
> > not do this. As a result there is a change of return code for one of the
> > error paths.
> > 
> > 
> > Daniel.
> 

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 212A030CF92
	for <lists+linux-usb@lfdr.de>; Wed,  3 Feb 2021 00:04:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234911AbhBBXC5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 18:02:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236008AbhBBXCw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Feb 2021 18:02:52 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDCE2C0613ED
        for <linux-usb@vger.kernel.org>; Tue,  2 Feb 2021 15:02:11 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id n42so21551262ota.12
        for <linux-usb@vger.kernel.org>; Tue, 02 Feb 2021 15:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XGGgE9xbLQzvIfmDO0cdQ0AC2QlXscqj6q7EJ+IMmFM=;
        b=DT4ONh4pI/pF5jcB4d5SDi6QIrzKbnFB+yX6kaR5IVP+21bDSRorBa8DbuUSfq6u1U
         20+RNjU+DSb2WWP7hR+HFRaK2q8Pr3EwfvF0lN7U7hxLF/arEIL/+TvlX0PNX5KZnHYo
         LXgiAEc5XclfLALiJl/zP1f04hk8GYc6gnjgv1kqvgWOZR6nWkkyNggiPYrWuxVQra8f
         b2C/D7dtgXFyLjhRLeGV7f92a4Oa9y34gSedLOwZz8vjrhfrMGJNMdsAIgdMm2KjI48q
         iSFNBEsELlPpDfQK5lMRKH/UjxUq8JToeTV9Dwz0MvXWB0tW6JgzpUUu1hoEjfpCO0vS
         hoNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XGGgE9xbLQzvIfmDO0cdQ0AC2QlXscqj6q7EJ+IMmFM=;
        b=VURha9hjcJ2+/YPch/yhK+FcFLQTZu5CFIiWT8uSyq32CC4j+hedLtSK1k6gdGdTKu
         2QvNICAIdYMwoMZtgLg/Wd/awFMOstRtsXE0jvoza/QCZXamwBo5ONmIRRbz7IjwA5v/
         Usea5BcflaehdfcRYftpQXcsbUTNPloEeGkaFpkT4wrvZZ/GpuG3x5H7Ghv9vj0PFmAH
         vfKfLNmwuzbeLp8pjFD9bdPGl4V50m/WHJYegOzhZ13XSFuQnbWe39SfaTkU6ihXIxa2
         Xf5Em6SMW/U/sIYh0hV3HbkDF4nDyGeEknqRxMuiEXt4ierWwUGaEb/X5hh6eZx2WE47
         E8CA==
X-Gm-Message-State: AOAM531AC+Jc/YkIpBB79aq0ETaQ54N2zuI8YZ+GzqyzsGG0o+Jfmnhd
        lTfVHYiBZJD7S1CXViTdxkdgcQ==
X-Google-Smtp-Source: ABdhPJzCG++xaEY5rOt60SAJJi86UczJMGRaSnKu5WBUd5ezFl1KTI4M6w++OEHELGtK4wRZYzR3Zg==
X-Received: by 2002:a05:6830:12c7:: with SMTP id a7mr22184otq.103.1612306931321;
        Tue, 02 Feb 2021 15:02:11 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u25sm67993otg.40.2021.02.02.15.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 15:02:10 -0800 (PST)
Date:   Tue, 2 Feb 2021 17:02:08 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/10] usb: dwc3: qcom: Detect DWC3 DT-nodes with
 "usb"-prefixed names
Message-ID: <YBnZ8O+zI/dzrjDQ@builder.lan>
References: <20201205155621.3045-1-Sergey.Semin@baikalelectronics.ru>
 <20201205155621.3045-10-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201205155621.3045-10-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat 05 Dec 09:56 CST 2020, Serge Semin wrote:

> In accordance with the USB HCD/DRD schema all the USB controllers are
> supposed to have DT-nodes named with prefix "^usb(@.*)?".  Since the
> existing DT-nodes will be renamed in a subsequent patch let's first make
> sure the DWC3 Qualcomm driver supports them and second falls back to the
> deprecated naming so not to fail on the legacy DTS-files passed to the
> newer kernels.
> 

Felipe, will you merge this, so that I can merge the dts patch depending
on this into the Qualcomm DT tree?

Regards,
Bjorn

> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index c703d552bbcf..49ad8d507d37 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -630,7 +630,8 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
>  	struct device		*dev = &pdev->dev;
>  	int			ret;
>  
> -	dwc3_np = of_get_child_by_name(np, "dwc3");
> +	dwc3_np = of_get_child_by_name(np, "usb") ?:
> +		  of_get_child_by_name(np, "dwc3");
>  	if (!dwc3_np) {
>  		dev_err(dev, "failed to find dwc3 core child\n");
>  		return -ENODEV;
> -- 
> 2.29.2
> 

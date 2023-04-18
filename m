Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA9A16E6533
	for <lists+linux-usb@lfdr.de>; Tue, 18 Apr 2023 15:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232286AbjDRNBe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Apr 2023 09:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231508AbjDRNBc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Apr 2023 09:01:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A10116DCE
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 06:01:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ED42C63489
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 13:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47AA0C433EF;
        Tue, 18 Apr 2023 13:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681822889;
        bh=jcErAp/zmn6qVNC79O9MgZAgm3tpojjzbvGHoMQlMYI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DFcuQ5CZcDwNLICgl8UJSbl+EqpBGp8vuTa8UinxdXkPL0l8qav/wS2M5luCiqg0W
         qLq2rDVlGjU/3N1NAaD2VndxZ7UI1mAUohm7HyIGUUO6c9fWRoQCvh9d+t2fktAuSE
         3cFBauoIakYP7Q8xyHgw0tyfw8sn1+vsEBy5UnVAJt4XMX7TW5AiTwTAMh5Dn8+Ycp
         Ip8rPkBad/aQlDx5Sk5MUrdLzHQaBum8CKI/6GDhv8mWe9f7TDIG9paN3F8s+6Jmi4
         ozojnw0Omv2QSOicNGw8Dtnt4LQwRwvXmDllw5G2GW0+NE9icIh2CvsgANHHzgIj+w
         bWCXsN+P3mpxg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pokxn-00025j-T3; Tue, 18 Apr 2023 15:01:39 +0200
Date:   Tue, 18 Apr 2023 15:01:39 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, linux-usb@vger.kernel.org,
        Oliver Neukum <oneukum@suse.com>,
        Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v5] usb: dwc3: debugfs: Prevent any register access when
 devices
Message-ID: <ZD6Us2PoD4UfY27S@hovoldconsulting.com>
References: <20230418121835.17550-1-quic_ugoswami@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418121835.17550-1-quic_ugoswami@quicinc.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 18, 2023 at 05:48:35PM +0530, Udipto Goswami wrote:

First, the subject of this patch looks wrong.

> When the dwc3 device is runtime suspended, various required clocks would
> get disabled and it is not guaranteed that access to any registers would
> work. Depending on the SoC glue, a register read could be as benign as
> returning 0 or be fatal enough to hang the system.
> 
> In order to prevent such scenarios of fatal errors, make sure to resume
> dwc3 then allow the function to proceed.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

I did not sign-off on this patch (and neither did Oliver I presume).

You must never add a SoB on behalf on someone else without their
permission. Please read Documentation/process/submitting-patches.rst and
make sure you understand what SoB means before sending any further
patches.

> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> ---
> v5: Reworked the patch to resume dwc3 while accessing the registers.

Please include the full changelog for v6 (and future patches).

>  drivers/usb/dwc3/debugfs.c | 123 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 123 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
> index e4a2560b9dc0..d622b0dfeb76 100644
> --- a/drivers/usb/dwc3/debugfs.c
> +++ b/drivers/usb/dwc3/debugfs.c
> @@ -332,6 +332,13 @@ static int dwc3_lsp_show(struct seq_file *s, void *unused)
>  	unsigned int		current_mode;
>  	unsigned long		flags;
>  	u32			reg;
> +	int			ret;
> +
> +	ret = pm_runtime_get_sync(dwc->dev);
> +	if (!ret || ret < 0) {

This is broken as you would not print anything on success (ret == 0).

Did you test this patch at all?

> +		pm_runtime_put(dwc->dev);
> +		return 0;

Why do you return 'success' on errors?

> +	}

Johan

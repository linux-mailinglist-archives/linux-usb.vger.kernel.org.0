Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4B81545116
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jun 2022 17:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245733AbiFIPlm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jun 2022 11:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240677AbiFIPlk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jun 2022 11:41:40 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58B4415FE3C
        for <linux-usb@vger.kernel.org>; Thu,  9 Jun 2022 08:41:38 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id i15so3781024plr.1
        for <linux-usb@vger.kernel.org>; Thu, 09 Jun 2022 08:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bFs2IUbelOqYg14a8I3dhoLqs2Bgqc5B+E7uIXvQdIw=;
        b=CsDpq3niF7HVVJkr2AGXZrRBA27sHBwYtoUgYA3YAttQ8E4C1MRoKp477ea9D6Iudm
         dv8JPRzH+Yrxiss4TGU/7Pqq8JSqw++QgQFiPE/Ny5BUA8pvXEXgS7uIYK8eqtMTAboI
         Dc0qVEVDOFiyQfydstRFp1r2ZjK265vqAielA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bFs2IUbelOqYg14a8I3dhoLqs2Bgqc5B+E7uIXvQdIw=;
        b=zAdSDmos0ElHQ3DfUFAuGD7EOLSgljBW/o6OPcDL0uwEFE0I+oPwjDQ8MuEHa8xR/o
         mfKO98N2DXP7mplu63a4DSjazf/jxZFeT9Fk0LHN49Zwgu8jskDfHik0II1lCznAWayQ
         N9aA2mu9npFnmP8qcW4pqvNqBDpwHt9glF7jsiw/g7mm6K7gNvDwpgh6zp/JNwCyBdpQ
         aUDN00nFuFT8Fxvrl0pKPHya90qmqvlmB0OQSFuSV6v2fs7KMOETYxE2RvW0XdYi95K7
         PjGtxtmqADV3snsJBO4wUyAgIppIgnrNrDNmI6g4uv//Rxk4oqE8jYQWf39F2In5ry0j
         m5wA==
X-Gm-Message-State: AOAM53244twBgtbommVB7Am7FtFXLQckrzoMNgKZlstIIDvrBaBFPA9k
        lv/hgTTp0SSVFn5DDMxP+UUjyhlErFpdUA==
X-Google-Smtp-Source: ABdhPJz7l2shBD5wm9aHvwcmcGQmYOa3+pR/Q8WoVPHOsEwwyl8ikvu0HNhUNYVg6RRh05dpi20QQg==
X-Received: by 2002:a17:90b:4d81:b0:1e3:33e9:6677 with SMTP id oj1-20020a17090b4d8100b001e333e96677mr3948846pjb.116.1654789297913;
        Thu, 09 Jun 2022 08:41:37 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:c543:2c9:1206:951b])
        by smtp.gmail.com with UTF8SMTPSA id b1-20020a63d301000000b003fbfd5e4ddcsm9314592pgg.75.2022.06.09.08.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 08:41:37 -0700 (PDT)
Date:   Thu, 9 Jun 2022 08:41:36 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     hkallweit1@gmail.com, gregkh@linuxfoundation.org,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        quic_jackp@quicinc.com, tunguyen@apm.com,
        linux-amlogic@lists.infradead.org
Subject: Re: [RFT PATCH] xhci: Fix null pointer dereference in resume if xhci
 has only one roothub
Message-ID: <YqIUsP437G8g75YS@google.com>
References: <c4e9f0d8-c736-1153-3f32-b85e7024b3fe@linux.intel.com>
 <20220609120336.831533-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220609120336.831533-1-mathias.nyman@linux.intel.com>
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 09, 2022 at 03:03:36PM +0300, Mathias Nyman wrote:
> In the re-init path xhci_resume() passes 'hcd->primary_hcd' to hci_init(),
> however this field isn't initialized by __usb_create_hcd() for a HCD
> without secondary controller.
> 
> xhci_resume() is called once per xHC device, not per hcd, so the extra
> checking for primary hcd can be removed.
> 
> Fixes: e0fe986972f5 ("usb: host: xhci-plat: prepare operation w/o shared hcd")
> Reported-by: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>  drivers/usb/host/xhci.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index f0ab63138016..9ac56e9ffc64 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1107,7 +1107,6 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
>  {
>  	u32			command, temp = 0;
>  	struct usb_hcd		*hcd = xhci_to_hcd(xhci);
> -	struct usb_hcd		*secondary_hcd;
>  	int			retval = 0;
>  	bool			comp_timer_running = false;
>  	bool			pending_portevent = false;
> @@ -1214,23 +1213,19 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
>  		 * first with the primary HCD, and then with the secondary HCD.
>  		 * If we don't do the same, the host will never be started.
>  		 */
> -		if (!usb_hcd_is_primary_hcd(hcd))
> -			secondary_hcd = hcd;
> -		else
> -			secondary_hcd = xhci->shared_hcd;
> -
>  		xhci_dbg(xhci, "Initialize the xhci_hcd\n");
> -		retval = xhci_init(hcd->primary_hcd);
> +		retval = xhci_init(hcd);
>  		if (retval)
>  			return retval;
>  		comp_timer_running = true;
>  
>  		xhci_dbg(xhci, "Start the primary HCD\n");

Is the log still correct? IIUC this now isn't necessarily the primary HCD.

> -		retval = xhci_run(hcd->primary_hcd);
> -		if (!retval && secondary_hcd) {
> +		retval = xhci_run(hcd);
> +		if (!retval && xhci->shared_hcd) {
>  			xhci_dbg(xhci, "Start the secondary HCD\n");

ditto

> -			retval = xhci_run(secondary_hcd);
> +			retval = xhci_run(xhci->shared_hcd);
>  		}
> +
>  		hcd->state = HC_STATE_SUSPENDED;
>  		if (xhci->shared_hcd)
>  			xhci->shared_hcd->state = HC_STATE_SUSPENDED;

Tested-by: Matthias Kaehlcke <mka@chromium.org>

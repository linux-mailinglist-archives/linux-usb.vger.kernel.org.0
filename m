Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB03A1E8B24
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2020 00:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgE2WSo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 18:18:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbgE2WSn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 May 2020 18:18:43 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D0D3C03E969
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 15:18:42 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id z26so488589pfk.12
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 15:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h7mQf1zUnRb6gHL3wTcf4YeoP1BGEMI31HIydLPnILY=;
        b=USAZsJLsWXhAcU6LKXbQtRmCFA9/Ke7nTTw+ijg/SbVnug42qu4geHH5IzTNVy3Wv8
         JvkxzpyRJGGMV7wTCdPlr3KkCyGD307bI3bEp6KjCq+5p2NvZDLmrDja4H/eK4/BETuX
         wMiSo/cy6Y22UrQTptrf7qh0cVWZVh8XeZ3uI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h7mQf1zUnRb6gHL3wTcf4YeoP1BGEMI31HIydLPnILY=;
        b=fQiBRL+1UKJ5GRRyrEmtSR8ENN8WiPq/JmjMAcr3xWygGDMZCZu1/O1z3GQvwmL/cU
         otcXJx+GmFPUBjDSQ5Jy5U2dHHsfZA0zgSA5VEm0jTJYVD7+FGx7w4AFia2lUX8J2brd
         TpGt+qeNX0YXwp7+gVv5b/sfw8jybbyaMXn4Md95Cu0nwZNIym4Mo5wn9KCuv8sDRdNc
         DX+ZvO0x5R6uS5hJpnsgQ8kuNlXy2+/N0bYVdve++k+TUCKLge4LRu/XStjb8tTYQ7HY
         gIR2+AhegWuZIaeh4O2Ow/bJPU3s5jVCzQK9RQUs8BlYkwyMiVfU0ADbrWoy1KTSiMmP
         dT5Q==
X-Gm-Message-State: AOAM53084fQ3od84elBQ23vGMKbH0QC0RUcqUKIQainLHTgdxGRbrXMS
        6o4hwdLnf4/VulRvB0NJtF53gQ==
X-Google-Smtp-Source: ABdhPJyNp87OuqKxujr4H9oc2fHCHsLhgZfzz0aNXGqPMApJMeD5BmSXAgoqheChWAR0ejoVHbiByQ==
X-Received: by 2002:a62:e305:: with SMTP id g5mr10988042pfh.144.1590790721868;
        Fri, 29 May 2020 15:18:41 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:476b:691:abc3:38db])
        by smtp.gmail.com with ESMTPSA id h3sm2411244pfr.2.2020.05.29.15.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 15:18:41 -0700 (PDT)
Date:   Fri, 29 May 2020 15:18:40 -0700
From:   Prashant Malani <pmalani@chromium.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Benson Leung <bleung@chromium.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: mux: intel_pmc_mux: Fix DP alternate mode
 entry
Message-ID: <20200529221840.GA109930@google.com>
References: <20200529131753.15587-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529131753.15587-1-heikki.krogerus@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

On Fri, May 29, 2020 at 04:17:53PM +0300, Heikki Krogerus wrote:
> The PMC needs to be notified separately about HPD (hotplug
> detected) signal being high after mode entry. There is a bit
> "HPD High" in the Alternate Mode Request that the driver
> already sets, but that bit is only valid when the
> DisplayPort Alternate Mode is directly entered from
> disconnected state.
> 
> Fixes: 5c4edcdbcd97 ("usb: typec: mux: intel: Fix DP_HPD_LVL bit field")
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Tried this out; my DP monitor seems to enumerate correctly, so:

Tested-by: Prashant Malani <pmalani@chromium.org>
> ---
>  drivers/usb/typec/mux/intel_pmc_mux.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
> index 962bc69a6a59e..70ddc9d6d49e4 100644
> --- a/drivers/usb/typec/mux/intel_pmc_mux.c
> +++ b/drivers/usb/typec/mux/intel_pmc_mux.c
> @@ -148,7 +148,8 @@ pmc_usb_mux_dp_hpd(struct pmc_usb_port *port, struct typec_mux_state *state)
>  	msg[0] = PMC_USB_DP_HPD;
>  	msg[0] |= port->usb3_port << PMC_USB_MSG_USB3_PORT_SHIFT;
>  
> -	msg[1] = PMC_USB_DP_HPD_IRQ;
> +	if (data->status & DP_STATUS_IRQ_HPD)
> +		msg[1] = PMC_USB_DP_HPD_IRQ;
>  
>  	if (data->status & DP_STATUS_HPD_STATE)
>  		msg[1] |= PMC_USB_DP_HPD_LVL;
> @@ -161,6 +162,7 @@ pmc_usb_mux_dp(struct pmc_usb_port *port, struct typec_mux_state *state)
>  {
>  	struct typec_displayport_data *data = state->data;
>  	struct altmode_req req = { };
> +	int ret;
>  
>  	if (data->status & DP_STATUS_IRQ_HPD)
>  		return pmc_usb_mux_dp_hpd(port, state);
> @@ -181,7 +183,14 @@ pmc_usb_mux_dp(struct pmc_usb_port *port, struct typec_mux_state *state)
>  	if (data->status & DP_STATUS_HPD_STATE)
>  		req.mode_data |= PMC_USB_ALTMODE_HPD_HIGH;
>  
> -	return pmc_usb_command(port, (void *)&req, sizeof(req));
> +	ret = pmc_usb_command(port, (void *)&req, sizeof(req));
> +	if (ret)
> +		return ret;
> +
> +	if (data->status & DP_STATUS_HPD_STATE)
> +		return pmc_usb_mux_dp_hpd(port, state);
> +
> +	return 0;
>  }
>  
>  static int
> -- 
> 2.26.2
> 

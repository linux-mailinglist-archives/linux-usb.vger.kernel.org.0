Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4EF30089F
	for <lists+linux-usb@lfdr.de>; Fri, 22 Jan 2021 17:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729645AbhAVQ0l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Jan 2021 11:26:41 -0500
Received: from netrider.rowland.org ([192.131.102.5]:44813 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729699AbhAVQZ2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Jan 2021 11:25:28 -0500
Received: (qmail 45724 invoked by uid 1000); 22 Jan 2021 11:24:47 -0500
Date:   Fri, 22 Jan 2021 11:24:47 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        peter.chen@nxp.com, jackp@codeaurora.org
Subject: Re: [PATCH v6 1/4] usb: gadget: udc: core: Introduce check_config to
 verify USB configuration
Message-ID: <20210122162447.GC43566@rowland.harvard.edu>
References: <1611288100-31118-1-git-send-email-wcheng@codeaurora.org>
 <1611288100-31118-2-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611288100-31118-2-git-send-email-wcheng@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 21, 2021 at 08:01:37PM -0800, Wesley Cheng wrote:
> Some UDCs may have constraints on how many high bandwidth endpoints it can
> support in a certain configuration.  This API allows for the composite
> driver to pass down the total number of endpoints to the UDC so it can verify
> it has the required resources to support the configuration.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>


> --- a/include/linux/usb/gadget.h
> +++ b/include/linux/usb/gadget.h
> @@ -328,6 +328,7 @@ struct usb_gadget_ops {
>  	struct usb_ep *(*match_ep)(struct usb_gadget *,
>  			struct usb_endpoint_descriptor *,
>  			struct usb_ss_ep_comp_descriptor *);
> +	int	(*check_config)(struct usb_gadget *gadget, unsigned long ep_map);
>  };
>  
>  /**
> @@ -607,6 +608,7 @@ int usb_gadget_connect(struct usb_gadget *gadget);
>  int usb_gadget_disconnect(struct usb_gadget *gadget);
>  int usb_gadget_deactivate(struct usb_gadget *gadget);
>  int usb_gadget_activate(struct usb_gadget *gadget);
> +int usb_gadget_check_config(struct usb_gadget *gadget, unsigned long ep_map);
>  #else
>  static inline int usb_gadget_frame_number(struct usb_gadget *gadget)
>  { return 0; }

Don't you also need an entry for the case where CONFIG_USB_GADGET isn't 
enabled?

Alan Stern

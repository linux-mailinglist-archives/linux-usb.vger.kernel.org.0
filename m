Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 444F02B70C4
	for <lists+linux-usb@lfdr.de>; Tue, 17 Nov 2020 22:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726544AbgKQVQZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Nov 2020 16:16:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbgKQVQY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Nov 2020 16:16:24 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4032DC0613CF
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2020 13:16:23 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id f12so1166741pjp.4
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2020 13:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kFhpnG7ItKRkl9t+3slguWZUGnqb2EfB7a1pd57utgo=;
        b=Cp43UXvcun6VvuWOX3KNkLSSWhmuzhmQrRsjxVYRM8spKBjEc3AnwqDySaMoVRU+Df
         0jYuVsXpYctmuK6FQDFfH8zvYFbE0EL14930drGPt5ZJxrayoqeBkF1yKjcYTfMv/0pd
         4rne6CNwqoiZAqyVXbtnkQk8/pkgPrK4icXKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kFhpnG7ItKRkl9t+3slguWZUGnqb2EfB7a1pd57utgo=;
        b=rlYJVKC5DZkLsDSIK1voexGMsle09rWV5FJiw1YxBBevEbAbsBIbHAr7MV/cJIjDgE
         11jU1eOQS9oTNr8Isd9tU/n3x4M+KKvnYz8kXszvMooBnCyLN/04XZ1J+U3FkUKS4ZKb
         IIytFAtbmtNSkiWLYWf4J8mzk4LiyQWQMAP+tocH950VwCBvZVj5L86T3m24zwL5EN1Y
         IODjkWJpVe7sEEoLGPoRI0a7hRT9RrsZ2tEI1TcinPGPchMxzrhimB6380E764rIl8To
         joAcFA38GIBAw6a9XpiGhpQOAXotINA2wp5CXiQyrvFrGzG066RHdSWCQWIoW0w2jRGx
         V6Kg==
X-Gm-Message-State: AOAM533sQfJvKqBkRzdL15zA1vRpAVWpIU2vRlAEpd7mQbfuh4LPG5rW
        Dd8D8eGxnyk+qTLETngZ6S/Vkg==
X-Google-Smtp-Source: ABdhPJxyeIg4uAWzn1zKiszkmAiFSTExo4eOMPjDPjxUXqeYzxo5Prlo/4PU7KH15I7n0sChaYi7Yg==
X-Received: by 2002:a17:902:7b90:b029:d6:ad06:d4c0 with SMTP id w16-20020a1709027b90b02900d6ad06d4c0mr1425725pll.35.1605647781374;
        Tue, 17 Nov 2020 13:16:21 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id q12sm22885708pfc.84.2020.11.17.13.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 13:16:20 -0800 (PST)
Date:   Tue, 17 Nov 2020 13:16:19 -0800
From:   Prashant Malani <pmalani@chromium.org>
To:     Utkarsh Patel <utkarsh.h.patel@intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        heikki.krogerus@linux.intel.com, enric.balletbo@collabora.com,
        rajmohan.mani@intel.com, azhar.shaikh@intel.com
Subject: Re: [PATCH v2 5/8] usb: typec: Use Thunderbolt 3 cable discover mode
 VDO in Enter_USB message
Message-ID: <20201117211619.GD1819103@google.com>
References: <20201113202503.6559-1-utkarsh.h.patel@intel.com>
 <20201113202503.6559-6-utkarsh.h.patel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113202503.6559-6-utkarsh.h.patel@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Utkarsh,

On Fri, Nov 13, 2020 at 12:25:00PM -0800, Utkarsh Patel wrote:
> USB4 also uses same cable properties as Thunderbolt 3 so use Thunderbolt 3
> cable discover mode VDO to fill details such as active cable plug link
> training and cable rounded support.
> 
> Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Utkarsh Patel <utkarsh.h.patel@intel.com>
> 
> --
> Changes in v2:
> - No change.
> --
> ---
>  include/linux/usb/typec.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index 6be558045942..d91e09d9d91c 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -75,6 +75,7 @@ enum typec_orientation {
>  /*
>   * struct enter_usb_data - Enter_USB Message details
>   * @eudo: Enter_USB Data Object
> + * @tbt_cable_vdo: TBT3 Cable Discover Mode Response
>   * @active_link_training: Active Cable Plug Link Training
>   *
>   * @active_link_training is a flag that should be set with uni-directional SBRX
> @@ -83,6 +84,7 @@ enum typec_orientation {
>   */
>  struct enter_usb_data {
>  	u32			eudo;
> +	u32			tbt_cable_vdo;

Can we instead just include a field for the rounded cable support property
, similar to what was done for active_link_training? That way this gets decoupled
from whether a TBT VDO was present in the cable or not

>  	unsigned char		active_link_training:1;
>  };
>  
> -- 
> 2.17.1
> 

Best regards,

-Prashant

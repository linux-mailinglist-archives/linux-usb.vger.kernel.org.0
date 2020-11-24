Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41AC52C3200
	for <lists+linux-usb@lfdr.de>; Tue, 24 Nov 2020 21:34:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731124AbgKXUcj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Nov 2020 15:32:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbgKXUch (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Nov 2020 15:32:37 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB17C0613D6
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2020 12:32:37 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id w202so143721pff.10
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2020 12:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Dq7oNNZ5GchoDrVX/KWnCNthGMlm+tJOTxcTPjxUO+g=;
        b=jfYvUEgBM+MGbPJOizw+j2Z1Que1IgtgShXllmT2ZYn48RBKJnW7UCQ6MfwMFq7CJD
         80ymK/z5m/ZwLRbPjPXnVSabuSzzaaeuOmyfjKHQX/bOaQRY2TiZ0r2o25Pe+N0xFhnP
         dMxP0jAV8DwUe1NvHWLMucP1rDYwvUBJa8BFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Dq7oNNZ5GchoDrVX/KWnCNthGMlm+tJOTxcTPjxUO+g=;
        b=uk/HytcxFUxsUOzGjHFF8YJZ/fHU0Oqo6B3GvM3R+xa/1L+Mm4ASC5Cc/EFnZyzawT
         qE6r6C/LIE1Zm7keUBi3ASy59YF0tIexyJY6LZuRNp409uXuQNTieq99mj/lSd/LC5TA
         VNzJcTaFafzb846A27UpngOEMvnN5neeR/9UpNFcSPnr35OC98bX6060/tjLFcxekd6T
         VALDO3XsVB+AFcAyq7kfLHS7mEhyUg+7mYzVrjq8HPkIOWkrVw2tjxCs5M8OFeuAX8Ka
         rCUH8zUXdaQIcBKVlppJiq/Nk8B7k/T7PD3y4CfCv5vS7xk40QaURbI0tkYNPpCEQgYL
         GF3Q==
X-Gm-Message-State: AOAM530Con1yiu6kc+TyWD9WYk32BdaPuBBfTSelw1DEYrER+Gio8ORf
        jjuShH7zimpZlqHPlG9M2TaJDw==
X-Google-Smtp-Source: ABdhPJye55NLXwofslsBo86IlC+j8yIjAPd0H3BmjPniIS7+uw/oSc6BXR1N/J6Lg7Vv5qRWQv0Oag==
X-Received: by 2002:aa7:8e49:0:b029:197:6f72:2ae4 with SMTP id d9-20020aa78e490000b02901976f722ae4mr2501pfr.21.1606249957029;
        Tue, 24 Nov 2020 12:32:37 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id a4sm169719pjq.0.2020.11.24.12.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 12:32:36 -0800 (PST)
Date:   Tue, 24 Nov 2020 12:32:35 -0800
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com
Cc:     bleung@chromium.org,
        Heikki Krogerus <heikki.krogeurus@linux.intel.com>
Subject: Re: [PATCH v4 1/2] usb: typec: Consolidate sysfs ABI documentation
Message-ID: <20201124203235.GA517388@google.com>
References: <20201124201033.592576-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124201033.592576-1-pmalani@chromium.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Tue, Nov 24, 2020 at 12:10:31PM -0800, Prashant Malani wrote:
> Both partner and cable have identity VDOs. These are listed separately
> in the Documentation/ABI/testing/sysfs-class-typec. Factor these out
> into a common location to avoid the duplication.
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> Acked-by: Heikki Krogerus <heikki.krogeurus@linux.intel.com>
I copied the Acked-by line from v3 [1] as is, but looks like there was a
typo there and the email address should be
"heikki.krogerus@linux.intel.com".

Please let me know if it's fine as is or whether I should send another
patchset.

[1]
https://lore.kernel.org/linux-usb/20201110105225.GH1224435@kuha.fi.intel.com/

> ---
> 
> Changes in v4:
> - Rebased on top of the usb-next tree.
> - Added Acked-by tag from pevious version's review.
> - Corrected a typo ('syfs' -> 'sysfs') in the subject line.
> 
> Patch first introduced in v3.
> 
>  Documentation/ABI/testing/sysfs-class-typec | 59 ++++++---------------
>  1 file changed, 17 insertions(+), 42 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
> index 4eccb343fc7b..88ffc14d4cd2 100644
> --- a/Documentation/ABI/testing/sysfs-class-typec
> +++ b/Documentation/ABI/testing/sysfs-class-typec
> @@ -147,42 +147,6 @@ Description:
>  		during Power Delivery discovery. This file remains hidden until a value
>  		greater than or equal to 0 is set by Type C port driver.
>  
> -What:		/sys/class/typec/<port>-partner>/identity/
> -Date:		April 2017
> -Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
> -Description:
> -		This directory appears only if the port device driver is capable
> -		of showing the result of Discover Identity USB power delivery
> -		command. That will not always be possible even when USB power
> -		delivery is supported, for example when USB power delivery
> -		communication for the port is mostly handled in firmware. If the
> -		directory exists, it will have an attribute file for every VDO
> -		in Discover Identity command result.
> -
> -What:		/sys/class/typec/<port>-partner/identity/id_header
> -Date:		April 2017
> -Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
> -Description:
> -		ID Header VDO part of Discover Identity command result. The
> -		value will show 0 until Discover Identity command result becomes
> -		available. The value can be polled.
> -
> -What:		/sys/class/typec/<port>-partner/identity/cert_stat
> -Date:		April 2017
> -Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
> -Description:
> -		Cert Stat VDO part of Discover Identity command result. The
> -		value will show 0 until Discover Identity command result becomes
> -		available. The value can be polled.
> -
> -What:		/sys/class/typec/<port>-partner/identity/product
> -Date:		April 2017
> -Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
> -Description:
> -		Product VDO part of Discover Identity command result. The value
> -		will show 0 until Discover Identity command result becomes
> -		available. The value can be polled.
> -
>  
>  USB Type-C cable devices (eg. /sys/class/typec/port0-cable/)
>  
> @@ -219,17 +183,28 @@ Description:
>  		This file remains hidden until a value greater than or equal to 0
>  		is set by Type C port driver.
>  
> -What:		/sys/class/typec/<port>-cable/identity/
> +
> +USB Type-C partner/cable Power Delivery Identity objects
> +
> +NOTE: The following attributes will be applicable to both
> +partner (e.g /sys/class/typec/port0-partner/) and
> +cable (e.g /sys/class/typec/port0-cable/) devices. Consequently, the example file
> +paths below are prefixed with "/sys/class/typec/<port>-{partner|cable}/" to
> +reflect this.
> +
> +What:		/sys/class/typec/<port>-{partner|cable}/identity/
>  Date:		April 2017
>  Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
>  Description:
>  		This directory appears only if the port device driver is capable
>  		of showing the result of Discover Identity USB power delivery
>  		command. That will not always be possible even when USB power
> -		delivery is supported. If the directory exists, it will have an
> -		attribute for every VDO returned by Discover Identity command.
> +		delivery is supported, for example when USB power delivery
> +		communication for the port is mostly handled in firmware. If the
> +		directory exists, it will have an attribute file for every VDO
> +		in Discover Identity command result.
>  
> -What:		/sys/class/typec/<port>-cable/identity/id_header
> +What:		/sys/class/typec/<port>-{partner|cable}/identity/id_header
>  Date:		April 2017
>  Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
>  Description:
> @@ -237,7 +212,7 @@ Description:
>  		value will show 0 until Discover Identity command result becomes
>  		available. The value can be polled.
>  
> -What:		/sys/class/typec/<port>-cable/identity/cert_stat
> +What:		/sys/class/typec/<port>-{partner|cable}/identity/cert_stat
>  Date:		April 2017
>  Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
>  Description:
> @@ -245,7 +220,7 @@ Description:
>  		value will show 0 until Discover Identity command result becomes
>  		available. The value can be polled.
>  
> -What:		/sys/class/typec/<port>-cable/identity/product
> +What:		/sys/class/typec/<port>-{partner|cable}/identity/product
>  Date:		April 2017
>  Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
>  Description:
> -- 
> 2.29.2.454.gaff20da3a2-goog
> 

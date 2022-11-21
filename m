Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07E11631A0E
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 08:16:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbiKUHQJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Nov 2022 02:16:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbiKUHQI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 02:16:08 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C72113DFA
        for <linux-usb@vger.kernel.org>; Sun, 20 Nov 2022 23:16:06 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id b11so9664245pjp.2
        for <linux-usb@vger.kernel.org>; Sun, 20 Nov 2022 23:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=07BnDwCzQtGxJqu7WmxiQvLbKkkvRQG8oAd9NqGojZc=;
        b=lxHru+v025FemK23WUln+D51enXsc33BTttn49z6Kxv53bk3XaWQFiFB5bTLFDPp9s
         7jdV5g1dBLVgQcjS3jqdpexiM2SWIouxEY1TnGybPwNHvGUlY4+PajNJOUoSrFVsN5iZ
         o8f2b/mgDa4g8Rc1qtktZQcJHb2+s5vqcW5vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07BnDwCzQtGxJqu7WmxiQvLbKkkvRQG8oAd9NqGojZc=;
        b=Y20JWE9nVkEMwYRFDnIT7++03r0ETKrUp5go0nLf9rSL+mvPeQZiFft6H3H6ySCOj6
         PvLIdn9uSrp/dUCZcoMtfYiTFA2Dv5z6MtoOK02vTx0jGrYoJOMaGUIxP0bAKES+z1Gx
         3Zc0/yhkbxVfjjdewzh6LY8iNrworb4zigMvlyvs+eg/tIm2wfKuOd4eJzQZGWM4ZJdb
         V0E/M8sLF7m5haRl7uKOzXUwDgSkkMs8xBzaDRlRtcG6Udt9iDEHWVcw7qRSbt3TWSid
         aqixOpkdRzVnTsmgK8X0fCYaEkTIRPiXB9cmZ80Tu+jHwYFLrL3mEKNjdB61OHceAzM3
         g6tg==
X-Gm-Message-State: ANoB5pkPYw2KoZ42XvUbimdmUjdhpqyUSCsIcSOLfkvTbG3iGg40MZpb
        Wgg7LHIP/bxBuTuLzU85I8nJzw==
X-Google-Smtp-Source: AA0mqf4EhghUMVNc51VNS/NIi+XBfMwfWwUy19qDUwJ56WfjZh8p2tRJFlyeizVQ/NVPIlRH853GzQ==
X-Received: by 2002:a17:90a:9c18:b0:212:fa9a:12df with SMTP id h24-20020a17090a9c1800b00212fa9a12dfmr25358105pjp.231.1669014965900;
        Sun, 20 Nov 2022 23:16:05 -0800 (PST)
Received: from chromium.org (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id f9-20020a17090a120900b00218722ecac2sm7457867pja.18.2022.11.20.23.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 23:16:05 -0800 (PST)
Date:   Mon, 21 Nov 2022 07:16:03 +0000
From:   Prashant Malani <pmalani@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH] usb: typec: pd: Add symlink to linked device
Message-ID: <Y3sls9+NcQrdjb9y@chromium.org>
References: <20221121062106.2569297-1-pmalani@chromium.org>
 <Y3scND+8DVe8SGeD@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3scND+8DVe8SGeD@kroah.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Thanks for reviewing the patch.

On Nov 21 07:35, Greg Kroah-Hartman wrote:
> On Mon, Nov 21, 2022 at 06:20:39AM +0000, Prashant Malani wrote:
> >  
> > +What:		/sys/class/usb_power_delivery/.../device
> > +Date:		November 2022
> > +Contact:	Prashant Malani <pmalani@chromium.org>
> > +Description:
> > +		Symbolic link to the directory of the device to which the USB PD object is linked.
> 
> Line is way too long.

Sorry about that. I'll try to make it more concise in the next version.

> 
> But wait, a "device" has a specific meaning in a sysfs file, and that is
> not what is happening here.
> 
> Please don't make fake "device" symlinks when these are not really using
> a device here.  Either fix it up to properly use the device structures
> in the code, or call this something else.

Got it, sorry about using that specific term. How about:
1. "linked_device"
2. "base_device" ?

I prefer 1.) but happy to use the other, or any other suggestion.

> 
> What in userspace wants to see this symlink?

ChromeOS's userspace Type-C daemon. It listens for Type-C partner uevents, but the PD objects
can be created later (and destroyed and then recreated again, for PD chargers which dynamically
change their source caps), and this helps determine which partner does those events apply to.

Thanks,

-Prashant

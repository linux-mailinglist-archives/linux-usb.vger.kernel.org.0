Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74FF46977CA
	for <lists+linux-usb@lfdr.de>; Wed, 15 Feb 2023 09:10:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233816AbjBOIKf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Feb 2023 03:10:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233677AbjBOIKe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Feb 2023 03:10:34 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E5253A94
        for <linux-usb@vger.kernel.org>; Wed, 15 Feb 2023 00:10:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 29A0F61A7B
        for <linux-usb@vger.kernel.org>; Wed, 15 Feb 2023 08:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7887C433D2;
        Wed, 15 Feb 2023 08:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1676448632;
        bh=YFlMXsnV73pFksUMSioYKwhXZRleRUW2b37cK9Xe2Nc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tZYFutkXtCeEAJKN/LMqZ7Y0ELUIFS9A53hCl13iuqrlio5T7eHcmwNgKp4K9oENg
         Xe1mKgeCTsWF9M4ZGbuPTELy10l9ViDws3AaSKUWKmQykWb3amBGvTXrqy/Brd0t1E
         5MCZ03MPP2roLvlMwwzYTyypae/qxtVKPVMZDrs8=
Date:   Wed, 15 Feb 2023 09:10:28 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH v4] usb: typec: tcpm: fix create duplicate
 source-capabilities file
Message-ID: <Y+yTdHxWPZSjVYvU@kroah.com>
References: <20230215054951.238394-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215054951.238394-1-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 15, 2023 at 01:49:51PM +0800, Xu Yang wrote:
> The kernel will dump in the below cases:
> sysfs: cannot create duplicate filename
> '/devices/virtual/usb_power_delivery/pd1/source-capabilities'
> 
> 1. After soft reset has completed, an Explicit Contract negotiation occurs.
> The sink device will receive source capabilitys again. This will cause
> a duplicate source-capabilities file be created.
> 2. Power swap twice on a device that is initailly sink role.
> 
> This will unregister existing capabilities when above cases occurs.
> 
> Fixes: 8203d26905ee ("usb: typec: tcpm: Register USB Power Delivery Capabilities")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> changelogs:
> v2: unregister existing capabilities on specific cases
> v3: add changelog and modify commit message
> v4: reset port->partner_source_caps to NULL
> ---

Given the churn on this, and the seemingly lack-of-testing, I'll wait
until after -rc1 is out before applying this, is that ok?

thanks,

greg k-h

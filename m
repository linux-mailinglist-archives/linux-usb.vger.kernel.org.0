Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B34F9506FFF
	for <lists+linux-usb@lfdr.de>; Tue, 19 Apr 2022 16:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236113AbiDSOYT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Apr 2022 10:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237290AbiDSOYQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Apr 2022 10:24:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C0591D30E
        for <linux-usb@vger.kernel.org>; Tue, 19 Apr 2022 07:21:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CBEB760929
        for <linux-usb@vger.kernel.org>; Tue, 19 Apr 2022 14:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91782C385A5;
        Tue, 19 Apr 2022 14:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650378093;
        bh=RG8UQr4hAGaeEY3m6VhGC4bLISA52DC4/GVtv7ffby8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fEbPVsCF5YuRzw+E5xpAFFoRlN9zEeHUXrsOLvHXqAYtntM1P2BJZa10kvI+N8KcZ
         5TkKrv+LuSxaT0/fVMaq5Zvt8jlBXB802gn+rX8rm4zZsHzYcO5bL1bHMsD4ttUhW/
         Xfk5HmpC1wJASNFiTotrAA2iLxwDbateL9VadHfk=
Date:   Tue, 19 Apr 2022 16:21:29 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kieran.bingham@ideasonboard.com,
        nicolas@ndufresne.ca, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH 5/5] usb: gadget: uvc: stop the pump on more conditions
Message-ID: <Yl7FaUj6TYYzUhGz@kroah.com>
References: <20220402233914.3625405-1-m.grzeschik@pengutronix.de>
 <20220402233914.3625405-6-m.grzeschik@pengutronix.de>
 <20220404130758.GB6952@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220404130758.GB6952@pengutronix.de>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 04, 2022 at 03:07:58PM +0200, Michael Grzeschik wrote:
> I think we can skip this patch for now, since it is depending on this series:
> 
> https://lore.kernel.org/linux-usb/20220315143356.3919911-1-m.grzeschik@pengutronix.de/
> 
> The other Patches of this series have no dependencies.

Can you please fix up and resend then?  Our tools want to apply the
whole series at once, for obvious reasons.

thanks,

greg k-h

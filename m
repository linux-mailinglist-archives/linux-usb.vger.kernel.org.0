Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9D6522BD9
	for <lists+linux-usb@lfdr.de>; Wed, 11 May 2022 07:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237140AbiEKFnc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 01:43:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242093AbiEKFn1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 01:43:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5926B245610
        for <linux-usb@vger.kernel.org>; Tue, 10 May 2022 22:43:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B229B616DF
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 05:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA04FC385D1;
        Wed, 11 May 2022 05:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1652247805;
        bh=JUZkdUSRr6SRRguqLIZfivmi1He93RgkOil+cDjvb1U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U7Xrnaao1h1AIMdzPbWM3AmhvxNfpA/caU15j8oLAlhvBOO+kLS8DQImd30Yn8FYZ
         JxMv4JXMpnWqZuySZXeDp899zYNcZJ3UOYPmrN1Ht+1zfblHrxaAHfjf5GjDikH3Hp
         aQ6jgD0eLXWgb2PXBHlEnieRhE9qWd4H1T7sJ3/o=
Date:   Wed, 11 May 2022 07:43:22 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] usb: hub: port: add sysfs entry to switch port power
Message-ID: <YntM+r+rE4AC6SXt@kroah.com>
References: <20220510231317.1874608-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510231317.1874608-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 11, 2022 at 01:13:17AM +0200, Michael Grzeschik wrote:
> This patch adds an sysfs switch to enable/disable a port on an power
> switchable hub. It also ensures that the associated device gets
> disconnected from the logical usb tree.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/usb/core/port.c | 47 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)

No Documentation/ABI/ update as well?  That means I can't take this
change or even properly review it :(


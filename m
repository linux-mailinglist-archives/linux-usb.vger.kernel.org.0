Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 643044D9D6C
	for <lists+linux-usb@lfdr.de>; Tue, 15 Mar 2022 15:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243091AbiCOO0w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Mar 2022 10:26:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233770AbiCOO0v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Mar 2022 10:26:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3930C527C1
        for <linux-usb@vger.kernel.org>; Tue, 15 Mar 2022 07:25:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B9E7860A3C
        for <linux-usb@vger.kernel.org>; Tue, 15 Mar 2022 14:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A501C340E8;
        Tue, 15 Mar 2022 14:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1647354339;
        bh=QkU1WeTUPrfe96/JdrUeonej5ndwjxOK4za66gOqdiI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zkh+9XLnqkNcvzjEMeCzPN12aSEAxU+LYL2rwGKXPeoypfLRHnS1B+0PKboFBmdMU
         IQ7o4VKx8JQ3Bc+hqG+NhlRhF1eqWoICXToxU2JH9lsdOf+ASx31zwOZDYWaOBWCqv
         xSLnqYPQf8zhMBDUR8xFU73u5EL0AAdxDPhWAeJ0=
Date:   Tue, 15 Mar 2022 15:25:32 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, paul.elder@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH v6 1/7] media: v4l: move helper functions for fractions
 from uvc to v4l2-common
Message-ID: <YjCh3Eu821f4FKhO@kroah.com>
References: <20220105115527.3592860-1-m.grzeschik@pengutronix.de>
 <20220105115527.3592860-2-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220105115527.3592860-2-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 05, 2022 at 12:55:21PM +0100, Michael Grzeschik wrote:
> The functions uvc_simplify_fraction and uvc_fraction_to_interval are
> generic helpers which are also useful for other v4l2 drivers. This patch
> moves them to v4l2-common.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> 
> ---
> v1 -> v2: -
> v2 -> v3: -
> v3 -> v4: -
> v4 -> v5: -
> v5 -> v6: -

What ever happened to this series?  Should it be rebased and
resubmitted?

thanks,

greg k-h

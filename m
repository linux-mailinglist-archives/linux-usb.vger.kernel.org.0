Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72E3172917A
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jun 2023 09:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238987AbjFIHrI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Jun 2023 03:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239020AbjFIHqt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Jun 2023 03:46:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45A771FDA
        for <linux-usb@vger.kernel.org>; Fri,  9 Jun 2023 00:46:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D02C8649A0
        for <linux-usb@vger.kernel.org>; Fri,  9 Jun 2023 07:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93C9C433D2;
        Fri,  9 Jun 2023 07:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1686296807;
        bh=NSWxYioClAEIWLHs3QT6KLt9d5O0l1WSA1+TYfnHoSE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xFFxAmHCkUp3Izh+n0YTae9jxgOb0rVmPydw22ywvIiJiCAl7ECv8xeRGDATW893X
         E9m5vkeRK7Pn07x2ajcnb/AvRI+Qgy5VrZO1fExTSRN+gyk6fy7CjJqaGxqpGqHKMg
         3NHimKR/LznauHVuu0hWAAfZVts+6O+vJq8d5fdY=
Date:   Fri, 9 Jun 2023 09:46:44 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Dmitry Antipov <dmantipov@yandex.ru>
Cc:     Michael Jamet <michael.jamet@intel.com>, linux-usb@vger.kernel.org,
        lvc-project@linuxtesting.org
Subject: Re: [PATCH] thunderbolt: handle possible NULL pointer from
 get_device()
Message-ID: <2023060903-unashamed-proactive-8bc9@gregkh>
References: <20230609061619.57756-1-dmantipov@yandex.ru>
 <2023060911-expose-unplanned-964a@gregkh>
 <d68c759a-e44c-0c6f-03cc-1e07418424eb@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d68c759a-e44c-0c6f-03cc-1e07418424eb@yandex.ru>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 09, 2023 at 10:15:36AM +0300, Dmitry Antipov wrote:
> On 6/9/23 09:30, Greg KH wrote:
> 
> > Sorry, but how can that happen?
> 
> Hmmm.. there should be a complete mess in the device tree (e.g. passing
> root device with no parent where the regular device is expected). If
> you're sure that this doesn't worth checking then please disregard this.

Again, how did you test this?

And yes, the driver model guarantees that a child can never have a NULL
parent (except for the root device, but that's a different story...)

thanks,

greg k-h

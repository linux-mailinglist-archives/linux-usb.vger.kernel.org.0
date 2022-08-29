Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 091C05A40C4
	for <lists+linux-usb@lfdr.de>; Mon, 29 Aug 2022 03:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbiH2Bll (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 28 Aug 2022 21:41:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiH2Bli (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 28 Aug 2022 21:41:38 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F35412E9CE;
        Sun, 28 Aug 2022 18:41:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9FD4EB80B62;
        Mon, 29 Aug 2022 01:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48456C433D6;
        Mon, 29 Aug 2022 01:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661737295;
        bh=9sBaqHJaYNgrv+bAfPQsFUbJLNsQUUDQE4lUKdqOL2o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Jy6idKym7Dg4YokkJQwy1wxmVFTRWzf9eh3tQN3peUmhVMTCgTFxed2TO9orjG5TH
         vd8W1jygLvb6oHMk1Vwra+TsJAb2sKemeweDnPPu443G8pjY2BFzm6OXb8AMJUaw0W
         sMxpqUdKvcDH8JPqWBRW7BI1kCDZyxssW9Ltw70RXoY/ceUPorYztc+ZSe+yx9eGfm
         IC0p5haF0MS8Jgaymk9GfBOoD6tAQrOUvLjxF2QyN8wTlyh7IlJXQJ+kk+6jrp5mAN
         ByDwZJMY0L+uFVwAZpPiv4+W9rXS/2TfZ6uF4MUV/r/xZG+iPgKe23NYxO+OCW+pWM
         q7Y0rQzai1Tng==
Date:   Mon, 29 Aug 2022 09:41:30 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-doc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: chipidea: clarify Documentation/ABI text
Message-ID: <20220829014130.GA30785@nchen-desktop>
References: <20220827203217.7837-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220827203217.7837-1-rdunlap@infradead.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22-08-27 13:32:17, Randy Dunlap wrote:
> Fix grammar and improve readability of chipidea-usb2 text.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Peter Chen <peter.chen@kernel.org>
> Cc: linux-usb@vger.kernel.org
> ---
>  Documentation/ABI/testing/sysfs-platform-chipidea-usb2 |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> --- a/Documentation/ABI/testing/sysfs-platform-chipidea-usb2
> +++ b/Documentation/ABI/testing/sysfs-platform-chipidea-usb2
> @@ -2,8 +2,8 @@ What:		/sys/bus/platform/devices/ci_hdrc
>  Date:		Mar 2017
>  Contact:	Peter Chen <peter.chen@nxp.com>
>  Description:
> -		It returns string "gadget" or "host" when read it, it indicates
> -		current controller role.
> +		When read, it returns string "gadget" or "host", indicating
> +		the current controller role.
>  
> -		It will do role switch when write "gadget" or "host" to it.
> +		It will do role switch when "gadget" or "host" is written to it.
>  		Only controller at dual-role configuration supports writing.

Acked-by: Peter Chen <peter.chen@kernel.org>

-- 

Thanks,
Peter Chen

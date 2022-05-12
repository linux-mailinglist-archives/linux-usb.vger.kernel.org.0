Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74E075243E6
	for <lists+linux-usb@lfdr.de>; Thu, 12 May 2022 06:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345943AbiELEKU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 May 2022 00:10:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbiELEKS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 May 2022 00:10:18 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B3AF1E21BF
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 21:10:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id ACB72B82600
        for <linux-usb@vger.kernel.org>; Thu, 12 May 2022 04:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2F8C385B8;
        Thu, 12 May 2022 04:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1652328614;
        bh=vPTo2Orb7XNVl1qk32Bao6e7pNBIyYTw7h7QnvkWkhw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kNj9ESv1V1toMb4dsNe2u6DJqBaPbDzjeeWEZzaA2sDOsDlpwr3g8PRI4E4CwgbQj
         UitreOThYqnMlD1eahaSSe8Rpt2Yvok76kzYM65BtmOv2bqW56oCYPmU+93tcEdU5T
         U+D14Ifkvw0P48P7UK1NpveIstvvPVEDEe9oUmKY=
Date:   Thu, 12 May 2022 06:10:10 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: make f_loopback/f_sourcesink standalone
Message-ID: <YnyIok/ezG9csdJV@kroah.com>
References: <1652322094-20698-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1652322094-20698-1-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 12, 2022 at 10:21:34AM +0800, Linyu Yuan wrote:
> First remove lb_modinit() and lb_modexit() call from f_sourcesink as both
> function belong to f_loopback.c, also there is no need to export
> disable_endpoints() from f_sourcesink, change it to static type.
> 
> After first step, we can use DECLARE_USB_FUNCTION_INIT() macro in
> f_sourcesink to create module init/exit function implicit as it only
> register/unregister one usb function driver.
> 
> In f_loopback disable_loopback() function, just add two usb_ep_disable()
> call, it will safe to remove original disable_endpoints() call
> which belong to f_sourcesink, and it also safe to use macro
> DECLARE_USB_FUNCTION_INIT() for module init/exit purpose.
> 
> Now it is safe to remove function prototype of lb_modinit(),
> lb_modexit() and disable_endpoints() from g_zero.h.
> 
> Change Makefile to build f_loopback/f_sourcesink as standalone module.

This describes a lot of what you are doing, but not why you want to do
any of this.

Please read the kernel documentation for how to write a good kernel
changelog, as-is, I do not understand why this change should be accepted
at all.

thanks,

greg k-h

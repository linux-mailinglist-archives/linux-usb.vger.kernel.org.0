Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFB9651FD67
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 14:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234886AbiEIMxP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 08:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234845AbiEIMxO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 08:53:14 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C72C2A1FC3
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 05:49:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AEEB4B81247
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 12:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED39C385AB;
        Mon,  9 May 2022 12:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1652100558;
        bh=dXYYd3zXXlgu4/TOJcZuRwI0Bf2Gpd9JSqrKbDWDzxU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G4mcV+vaScQUP1lYjUSlkGEdAU94GpuCrHiI1AvivoCGtuwf7Zz3EoDKfmal+gZ0h
         mYvJxcJT+xMddyExWU7UlimAuk14VjheqL7DZQh5rT+2RRqLX2VPiWJg069FavJ+dZ
         aLmr4+k+Bjt17bnidgwr++nYqZQ06R3psWxtiG7g=
Date:   Mon, 9 May 2022 14:49:15 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH v3 2/4] usb: gadget: f_sourcesink: use
 DECLARE_USB_FUNCTION_INIT()
Message-ID: <YnkNy1Wd2lt11kSP@kroah.com>
References: <1652097288-19909-1-git-send-email-quic_linyyuan@quicinc.com>
 <1652097288-19909-3-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1652097288-19909-3-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 09, 2022 at 07:54:46PM +0800, Linyu Yuan wrote:
> First there is no reason call lb_modinit() and lb_modexit()
> which belong to f_loopback.c,
> let's remove them here and remove two function prototype from g_zero.h.

Please properly format your paragraphs.  Why the odd line-break?

> After first step, we can use DECLARE_USB_FUNCTION_INIT() macro
> to create module init/exit function implicit as it only
> register/unregister one usb function driver.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
> v3: new add

What does "new add" mean?

Please be explicit and verbose.

confused,

greg k-h

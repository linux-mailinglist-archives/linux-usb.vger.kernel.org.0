Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2893873A01A
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jun 2023 13:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbjFVLvl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Jun 2023 07:51:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbjFVLvk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Jun 2023 07:51:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEB49197
        for <linux-usb@vger.kernel.org>; Thu, 22 Jun 2023 04:51:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 38526617D1
        for <linux-usb@vger.kernel.org>; Thu, 22 Jun 2023 11:51:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F0AC433C8;
        Thu, 22 Jun 2023 11:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687434698;
        bh=DsM7NXZs7MT+MoHYLTdQfjlb9DJfgsRS4C+JcM4RuaU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YDvyjQwP1ArcF9Pk/3wITytSqZolVAJLzYiz3/rfyXwiBzjwU30VMpz939zXLpCOu
         woV3zfupL9hLzvILow4vYOY80BieLL2tyLiMVzCSwHDE5OuJeeMq9HbXhfREfNpjUr
         OZdDDGsIURQUXGpw9KhFaOd4+aecFhlZWpBBZgouM8LRL+94S+uxS7ipCDzw/MVix6
         59xgubhqC+xJB9/rVDGlJN4n7EbnAmE5yotjhh3A7MbzjdUT6vsRe+wHrrfYlRP5sI
         HG/wl8eqVaiyBsC29Hw2L8yAdkyBjJkbUE1KCwdhnjU5HNwH38vH7w6YI8Y9mFoE59
         qfPkX6wpSmlmw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1qCIqm-0006a5-EY; Thu, 22 Jun 2023 13:51:44 +0200
Date:   Thu, 22 Jun 2023 13:51:44 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Davide Tronchin <davide.tronchin.94@gmail.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        marco.demarco@posteo.net
Subject: Re: [PATCH v2] Add LARA-R6 01B PIDs for three different USB
 compositions.
Message-ID: <ZJQ10DKDic-FEKM6@hovoldconsulting.com>
References: <20230622092921.12651-1-davide.tronchin.94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622092921.12651-1-davide.tronchin.94@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 22, 2023 at 11:29:21AM +0200, Davide Tronchin wrote:
> The new LARA-R6 product variant identified by the "01B" string can be
> configured (by AT interface) in three different USB modes:

> Signed-off-by: Davide Tronchin <davide.tronchin.94@gmail.com>
> ---
> 
> V1 -> V2: change from USB_DEVICE() to USB_DEVICE_INTERFACE_CLASS() in
> LARA-R6 01B CDC-ECM USB mode.
> Move LARA-R6 01B PIDs above LARA-L6 0x1341 PID.
> Change commit message to explain better the common USB interfaces.
> Add here in the comments the usb/devices file of the LARA-R6 01B module
> in all the USB configurations.

Thanks for the update.

You forgot the commit summary prefix so I added that and shortened the
summary to make it more succinct:

	USB: serial: option: add LARA-R6 01B PIDs

I also reduced the indentation of the product comments which appeared
excessive for the first two entries.

End-result is here:

	https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/commit/?h=usb-next&id=ffa5f7a3bf28c1306eef85d4056539c2d4b8eb09

Johan

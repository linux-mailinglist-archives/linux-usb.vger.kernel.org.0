Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0B5E5A4F2D
	for <lists+linux-usb@lfdr.de>; Mon, 29 Aug 2022 16:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbiH2O3W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Aug 2022 10:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiH2O3S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Aug 2022 10:29:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C7EA804BB
        for <linux-usb@vger.kernel.org>; Mon, 29 Aug 2022 07:29:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 20E1960F5B
        for <linux-usb@vger.kernel.org>; Mon, 29 Aug 2022 14:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 779C2C433D6;
        Mon, 29 Aug 2022 14:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661783356;
        bh=BfXkAIg1N6QMD+bdo4JgLUle+eyrKgTg8B1qH5HaFqE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oXkc4JbdfYU6Kq9X7X+zs24XNTSAvGg6MjT28LsymL+3NvQj7NPzlRy41Aq04V/g8
         7tDginNY350ToPfgtWCX39SMAmECfporyaoEhgFX8uIg20yVXFgiG4G+FMpPTQ5rfi
         uSXcfwXKBCJ1TT7pqHnTqXqtg9LOYXwth6l5ciKpqKZneaTV8N4bnHmQLFGeNSKVNo
         juFp3mmUIYWfMJw3QVf7dSeJEmzcgwuu11AsxyYFU7ffikDVfR7jDUzJ7yxwnCDvc3
         IqBIwJ5bR05+6SXTKnQNsBijx1xjYJ1uraPOY8rxoap4fbpGuHsxbiau+wq/rtXsM9
         e7shdiK9Yvjmg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oSflU-0007Bk-Qj; Mon, 29 Aug 2022 16:29:24 +0200
Date:   Mon, 29 Aug 2022 16:29:24 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Radisson97@web.de
Cc:     linux-usb@vger.kernel.org
Subject: Re: new enry for cp210x.c
Message-ID: <YwzNRKndW6G6B4Ko@hovoldconsulting.com>
References: <trinity-819f9db2-d3e1-40e9-a669-9c245817c046-1661523546680@msvc-mesg-web108>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-819f9db2-d3e1-40e9-a669-9c245817c046-1661523546680@msvc-mesg-web108>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 26, 2022 at 04:19:06PM +0200, Radisson97@web.de wrote:
> Hello list,
> i needed a driver to connect a Decagon data logger to my linux system.
> It turned out that the provided cable contained a cp210x chip set.
> 
> So i added to cp210x.c
>     { USB_DEVICE(0x10c4, 0x8414) }, /* Decagon Devices */
> 
> and it worked. BTW the cable in question is a USB2ttl converter.
> If somebody cares Decagon is now merged into "METER Group".
> 
> can somebody make a propper patch from this ? I do not want the whole
> linux git just for one line.

Thanks for the report. I've just posted a patch here:

	https://lore.kernel.org/r/20220829142550.27505-1-johan@kernel.org

Feel free to reply to the patch with a Reported-by tag that I'd add to
the commit message when applying.

Johan

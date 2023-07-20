Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE5475B094
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jul 2023 15:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbjGTN6z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jul 2023 09:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231468AbjGTN6y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jul 2023 09:58:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F2011FD7
        for <linux-usb@vger.kernel.org>; Thu, 20 Jul 2023 06:58:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0A57261B05
        for <linux-usb@vger.kernel.org>; Thu, 20 Jul 2023 13:58:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66064C433C8;
        Thu, 20 Jul 2023 13:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689861532;
        bh=nDnd9hRyt2d/u4obdAVo8bN7Y3MevVlktE/jT1AE86s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BNUUaWrc0hhiZxws7QXtv7Mh28IiyLKK7K5QmCgek85fwhNpR+I3WNvjO6zu+m9eT
         nOYDBG3FP8vLgH017gXNc7aQTpn989GZvZg2+pbXO3r0SwzDoQD+ahlmHWCSo6Iwdi
         zMqv+AOKZPk9MRMAl5p1ubtcPNYO8nd88k9pcvcr3L0dD0gU4OsD4UhqkIHLAiogww
         mtvE8U1ucsf1NNOGCy5qMuQG7XIPDJLkm3Q+74GN23bq2v6WPHaabrY8E1tGIgW/Q2
         yyaRNCHHknJaW6Wo4KbeBPSwUyf8vrF/YA1SXrssuGA55QY6DCuroRzMQZkv2+Ao7V
         WDZearCNMikiA==
Received: from johan by xi.lan with local (Exim 4.96)
        (envelope-from <johan@kernel.org>)
        id 1qMUBI-0007xy-2o;
        Thu, 20 Jul 2023 15:59:00 +0200
Date:   Thu, 20 Jul 2023 15:59:00 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: simple-serial: spell out the ordering
Message-ID: <ZLk9pIBOWoir8pfB@hovoldconsulting.com>
References: <20230720114406.14587-1-oneukum@suse.com>
 <ZLkiITEahEbu3XbJ@hovoldconsulting.com>
 <095626a6-9442-97d8-8b44-dfcef8b47e51@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <095626a6-9442-97d8-8b44-dfcef8b47e51@suse.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 20, 2023 at 02:42:49PM +0200, Oliver Neukum wrote:
> On 20.07.23 14:01, Johan Hovold wrote:
> > On Thu, Jul 20, 2023 at 01:44:06PM +0200, Oliver Neukum wrote:
> 
> >> + * These tables are NOT in order of device id by intention
> >> + *
> >> + * Keep them and add new entries sorted by
> >> + *
> >> + * 1. Alphabetical order of the vendor name
> >> + * 2. Alphabetical order of the product name
> >> + *
> >> + */
> > 
> > No, this is not correct. The tables are sorted alphabetically based on
> > the symbol names, but the entries in each table is sorted by VID/PID as
> > usual.
> 
> OK, I stand corrected. You do understand that this ordering is
> extremely peculiar? I am sorry, but deducing that from the example,
> which the current order is, will just not work. Nobody gets that
> without a clear and present explanation.

It's not peculiar. And if this wasn't implemented using macros, I'm
pretty sure you would not think so. Take a look at io_edgeport.c, for
example, where edgeport_2port_device comes before edgeport_4port_device,
etc.

> This just needs a comment in the text.

I disagree, with the last few entries sorted this should be clear
enough.

Johan

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFAD74B3EA
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jul 2023 17:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233371AbjGGPOh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jul 2023 11:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233010AbjGGPOd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jul 2023 11:14:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76BA1268D
        for <linux-usb@vger.kernel.org>; Fri,  7 Jul 2023 08:14:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 24F28619D3
        for <linux-usb@vger.kernel.org>; Fri,  7 Jul 2023 15:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309F0C433C7;
        Fri,  7 Jul 2023 15:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1688742869;
        bh=J0tIRFDjXgh8hOCAnMKLowkjYfwUFfMDsKIRsXPK/rc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X/bX+MbPHEOi5zlxIuVTu3uxlKxXjUeCDeMIvJmjq6MHVepiJi3g7nwkFVyvJwZ9Z
         LPF0KM4P9y0b/vwaduRCoXZAsDlxmqjwBosOMiYreUx25XFVthhuyJK/XUk0+zdXE5
         XEGWeazt2XaxZXowGnHKZJqNkSvWRBS7tJhmvrI0=
Date:   Fri, 7 Jul 2023 17:14:27 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     USB <linux-usb@vger.kernel.org>
Subject: Re: xHCI maintenance on vacation rest of July
Message-ID: <2023070717-gopher-imprudent-b85d@gregkh>
References: <64df77dc-2c66-4799-0679-b9d1ca9016c5@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64df77dc-2c66-4799-0679-b9d1ca9016c5@linux.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 07, 2023 at 04:35:10PM +0300, Mathias Nyman wrote:
> Hi
> 
> I'm out on vacation rest of July, putting xhci in vacation mode.
> I'll be back in August collecting all missed xHCI patches.

Have a great break!

greg k-h

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC831762A59
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jul 2023 06:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbjGZEjY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jul 2023 00:39:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjGZEjW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jul 2023 00:39:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 197E31995
        for <linux-usb@vger.kernel.org>; Tue, 25 Jul 2023 21:39:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A4E0A6134A
        for <linux-usb@vger.kernel.org>; Wed, 26 Jul 2023 04:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACBD4C433C8;
        Wed, 26 Jul 2023 04:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1690346361;
        bh=8yUdwCy91Mt23SHJNZC0QXx+iDIrX1yn878Ac5Vh1zg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j3emtIFomUMlTrtVaugLU9jaKRHApIs2pL4ke6TLOGe6S45ye9z6zsU6wVBBYwcIK
         USZWZ5wt7P7EjUSqssRRTHkwSS3ikuiuG16NR/gQGhYURhbiQ5mq/5wJGYwu6VcUxJ
         oJ7BnToUwow12/8bfgJGES5YfWI2jTNb+F9AqEOA=
Date:   Wed, 26 Jul 2023 06:39:18 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     kernel test robot <lkp@intel.com>
Cc:     Ladislav Michl <ladis@linux-mips.org>, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org
Subject: Re: [usb:usb-testing 25/42] drivers/usb/dwc3/dwc3-octeon.c:403:10:
 warning: shift count >= width of type
Message-ID: <2023072653-viewable-harmonics-09e0@gregkh>
References: <202307260537.MROrhVNM-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202307260537.MROrhVNM-lkp@intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 26, 2023 at 05:09:56AM +0800, kernel test robot wrote:
> Hi Ladislav,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> head:   ac47051f0bb8ccf1eaedb296a19fcb541474db53
> commit: b3061c5a15fe460502e9574b4663dd7c6ed80b48 [25/42] usb: dwc3: dwc3-octeon: Convert to glue driver

Ladislav, I've dropped your dwc3-octeon patches from my tree now, please
fix up and resend when you have this resolved.

thanks,

greg k-h

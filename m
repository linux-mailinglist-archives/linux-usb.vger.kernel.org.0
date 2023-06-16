Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14FBB73272E
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jun 2023 08:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239852AbjFPGOK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Jun 2023 02:14:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbjFPGOJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Jun 2023 02:14:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC44AB5
        for <linux-usb@vger.kernel.org>; Thu, 15 Jun 2023 23:14:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 83587621FC
        for <linux-usb@vger.kernel.org>; Fri, 16 Jun 2023 06:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71603C433C0;
        Fri, 16 Jun 2023 06:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1686896047;
        bh=flrLQg9vELwK/yMXzeUoNQc9xMZEYfL2a0bBcwN0lyY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e1EkLEFm1YRrkNXn/klExJBKBbFN6acBEua+zdRFeXlnH6I6vM5SBZ/VdATCyKla5
         4SF3Bkcr+SWP4BEGrOq686ldcUoz7WQN0Pj1cS3X1ncT248nOsRlBfIHAYgGdZHrZD
         XoLMjffJL7EpHbWikDhONr6gqZtkfChOrhjLjwDw=
Date:   Fri, 16 Jun 2023 08:14:05 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     kernel test robot <lkp@intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [usb:usb-next] BUILD SUCCESS WITH WARNING
 df49f2a0ac4a34c0cb4b5c233fcfa0add644c43c
Message-ID: <2023061617-unnoticed-snugly-a110@gregkh>
References: <202306160658.E79gCwiR-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306160658.E79gCwiR-lkp@intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 16, 2023 at 06:12:01AM +0800, kernel test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
> branch HEAD: df49f2a0ac4a34c0cb4b5c233fcfa0add644c43c  Revert "usb: common: usb-conn-gpio: Set last role to unknown before initial detection"
> 
> Warning: (recently discovered and may have been fixed)
> 
> drivers/usb/cdns3/cdns3-starfive.c:23: warning: expecting prototype for cdns3(). Prototype was for USB_STRAP_HOST() instead

I keep seeing this "warning" by the test robot for a while, but I do not
understand it at all, and can not duplicate it here locally.  Are you
sure your riscv toolchain is correct as :

> Warning ids grouped by kconfigs:
> 
> gcc_recent_errors
> |-- riscv-allmodconfig
> |   `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead
> `-- riscv-allyesconfig
>     `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead

It only seems to trigger there.

confused,

greg k-h

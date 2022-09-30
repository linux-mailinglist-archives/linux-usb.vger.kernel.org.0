Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89B0F5F0B03
	for <lists+linux-usb@lfdr.de>; Fri, 30 Sep 2022 13:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbiI3Lur (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Sep 2022 07:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231528AbiI3LuU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Sep 2022 07:50:20 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00DFDFAEA
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 04:47:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 7D9D7CE252B
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 11:46:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E466C433C1;
        Fri, 30 Sep 2022 11:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1664538406;
        bh=+QZaDpNiugGbdeyCQSPheP6w1C5KdieIpZ7rgt723K0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wiWrvT6d/AkZWmICH/i43wYm6OooVcXz0W+Dr2tHYJ7tvuoooeu7QyPysPaYIOPtd
         Qlk/4kc+maV6qbMwo+GpyjJ3YaZdobUtgnuSBwy0GARCgcNEsfkxDDVzyfv1SMPpXI
         dEnbL7kAR/0E+/fuaVgnGXh9wE7Fhq4gfYHqDOoA=
Date:   Fri, 30 Sep 2022 13:46:04 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 changes for v6.1 merge window
Message-ID: <YzbW/DK0pzBf4j7e@kroah.com>
References: <YzQdM0/5yFGjBCgY@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzQdM0/5yFGjBCgY@black.fi.intel.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 28, 2022 at 01:08:51PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.1-rc1

Pulled and pushed out, thanks.

greg k-h

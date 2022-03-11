Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C52124D60F9
	for <lists+linux-usb@lfdr.de>; Fri, 11 Mar 2022 12:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241400AbiCKLrI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Mar 2022 06:47:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235207AbiCKLrH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Mar 2022 06:47:07 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EC8A1C2F7F
        for <linux-usb@vger.kernel.org>; Fri, 11 Mar 2022 03:46:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 09E8C61CE7
        for <linux-usb@vger.kernel.org>; Fri, 11 Mar 2022 11:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1968C340E9;
        Fri, 11 Mar 2022 11:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1646999164;
        bh=FojaI9e8fM4810Z4KX3pkfC92F48MkjXBT4cGFIsBFE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PwHp7qVHwvPyqW3Qw5Wn9M/4ElvBi9mkDkEueHCdAbhv14owba/WYhzQ5Ke687jKU
         2UDBcTUrpb80rURHto+mJsrKiikgS0Jo2aVlz+rwsbARseGLh4ZujaASgPI3YhXEFP
         vXqCKBXHWALe6co7MqCN1lkJLUJz92nEvaRB2w6Q=
Date:   Fri, 11 Mar 2022 12:46:01 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 changes for v5.18 merge window
Message-ID: <Yis2eUiooOFy0b46@kroah.com>
References: <YidKEUcphTB4SE0E@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YidKEUcphTB4SE0E@lahna>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 08, 2022 at 02:20:33PM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.18-rc1

The gpg key you used to sign this tag is expired, so my checks fail :(

Please fix this.

thanks,

greg k-h

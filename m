Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0925F7223FD
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jun 2023 12:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjFEK4R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Jun 2023 06:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbjFEK4J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Jun 2023 06:56:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B56B8ED
        for <linux-usb@vger.kernel.org>; Mon,  5 Jun 2023 03:56:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4CFFD62288
        for <linux-usb@vger.kernel.org>; Mon,  5 Jun 2023 10:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E789C433D2;
        Mon,  5 Jun 2023 10:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1685962566;
        bh=iOKvZgtlVkImx1StIE6KdBor9vn3ncLdOOUA53Fa9Po=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C8Bt1bdXOE71dzNQIzHfBJ54xWcEZ12zdUYCoQh47Paec+nHKnomCmZrscCqKxozk
         NlWDV5Z63UrEQacyUFmCL3+T7Rh3fT5tTZJOO5oHdvQunRXFNDXW5Yx38k0IESItIx
         ZpgDmONZVyRsOV54mAIdSB7hBkOT3ssSrjFjpcD8=
Date:   Mon, 5 Jun 2023 12:56:04 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 fixes for v6.4-rc6
Message-ID: <2023060557-retread-spherical-63fd@gregkh>
References: <20230605071923.GS45886@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605071923.GS45886@black.fi.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 05, 2023 at 10:19:23AM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 44c026a73be8038f03dbdeef028b642880cf1511:
> 
>   Linux 6.4-rc3 (2023-05-21 14:05:48 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.4-rc6

Pulled and pushed out, thanks.

greg k-h

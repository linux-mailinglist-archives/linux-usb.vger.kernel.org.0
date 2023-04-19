Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 802DA6E7A46
	for <lists+linux-usb@lfdr.de>; Wed, 19 Apr 2023 15:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232893AbjDSNF6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Apr 2023 09:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232784AbjDSNF4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Apr 2023 09:05:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F83F13C29
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 06:05:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EBE2363ED5
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 13:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 017E6C433EF;
        Wed, 19 Apr 2023 13:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1681909553;
        bh=R2EOZWH7XeHob1QndJTu0Mac+j1DvQ2dKNi35ClBIyI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z0mxpGKb1J8N7f7bhRURnRnZOkz95E69YnVtYkn1KhAdCMKaIYtsrpe/iSD39zJpe
         PymR/4SBOnkvCXkkZ4Zvg5sQZZh7hJuKtECyNvEeHw1ehyRL4iOsftexa9qaE0CwIy
         8Yb1QIFvbWrMXrRaxln3jb1xaZDW61lp9OhMkPVM=
Date:   Wed, 19 Apr 2023 15:05:43 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 changes for v6.4 merge window
Message-ID: <2023041933-spearfish-anime-fad8@gregkh>
References: <20230418112611.GF66750@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418112611.GF66750@black.fi.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 18, 2023 at 02:26:11PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.4-rc1

Pulled and pushed out, thanks.

greg k-h

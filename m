Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93D125EBDCD
	for <lists+linux-usb@lfdr.de>; Tue, 27 Sep 2022 10:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbiI0IwY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Sep 2022 04:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbiI0IwW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Sep 2022 04:52:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72E66979F0
        for <linux-usb@vger.kernel.org>; Tue, 27 Sep 2022 01:52:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 22014B81A61
        for <linux-usb@vger.kernel.org>; Tue, 27 Sep 2022 08:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA17C433D6;
        Tue, 27 Sep 2022 08:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1664268738;
        bh=6v0waooBKG5AchOZoK6v6pXzUInrDKAT3lBTZTTGYco=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ELksTJd/8025MAqPhqqr7C1xhGz0oPTZrih5FzWC+YxLBM2gtv96Kmkor34MivX7O
         Kxjmq1q3wEk/InnI8nttxJF7vo/XrjslzwK/ZDX+cGwkrZhk2yUQXVFFUG6+vxf+F2
         700rQVUOMyODtjotzHuLvqtsq/WamXOeWIBhsbgc=
Date:   Tue, 27 Sep 2022 10:52:16 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 fix for v6.0 final
Message-ID: <YzK5wNZJk2TIHBLd@kroah.com>
References: <YzK21K7xBm0a2Vbo@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzK21K7xBm0a2Vbo@black.fi.intel.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 27, 2022 at 11:39:48AM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 521a547ced6477c54b4b0cc206000406c221b4d6:
> 
>   Linux 6.0-rc6 (2022-09-18 13:44:14 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.0

Pulled and pushed out, thanks.

greg k-h

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D520738A5D
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jun 2023 18:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbjFUQD4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jun 2023 12:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231955AbjFUQDx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jun 2023 12:03:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4940B185
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 09:03:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DA64A615CB
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 16:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5523C433C8;
        Wed, 21 Jun 2023 16:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1687363431;
        bh=nqJ8ZcnJGCMXVwb0z8QXud9UZpr7YlG/cjQn7NX+lP8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iCv/mx/IKmrA/ROiZ2Vpw9zpPn6zBCr/Xg1hAjV5mjNo5yilNB/fJU0kjwa5pN5e6
         2L9HMbQJK1J68WsmgPpxchcGc0dfYx4XzYAOHksQBcc/95ebBE8wjKOQVeY3OfHvKb
         thhto81BpL97tcTTS232rw8VGB5yH81doS8hBUtU=
Date:   Wed, 21 Jun 2023 18:02:38 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 changes for v6.5 merge window
Message-ID: <2023062127-blaming-unboxed-791b@gregkh>
References: <20230621071843.GK45886@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621071843.GK45886@black.fi.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 21, 2023 at 10:18:43AM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 44c026a73be8038f03dbdeef028b642880cf1511:
> 
>   Linux 6.4-rc3 (2023-05-21 14:05:48 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.5-rc1

Pulled and pushed out, thanks.

greg k-h

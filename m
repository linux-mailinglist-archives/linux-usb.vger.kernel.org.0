Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1635B9935
	for <lists+linux-usb@lfdr.de>; Thu, 15 Sep 2022 12:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbiIOK4o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Sep 2022 06:56:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbiIOK4n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Sep 2022 06:56:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F52D8B98D
        for <linux-usb@vger.kernel.org>; Thu, 15 Sep 2022 03:56:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9F523622D3
        for <linux-usb@vger.kernel.org>; Thu, 15 Sep 2022 10:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE05AC433D6;
        Thu, 15 Sep 2022 10:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1663239401;
        bh=BrH7KbtBUmx6IeLSzmatDybqOS++TtDIzM4OCCY5bTI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YXYWS5HE/qHZCb5UooaJEWloxxm7WidBd39FdRsRrMe8ZXIyiLzWwAaDGqOcFY4u7
         FdloSVz8BrCkc9mCFvEX2whO1Yi5UB7GaQUk7ttfn62FlHwb9iY5z0AiBmTxjvOCEH
         oTtxTJa/+gqmQgBB5OH3Fk8jv0JVf4OQRFx8gbSM=
Date:   Thu, 15 Sep 2022 12:57:06 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Gil Fine <gil.fine@intel.com>, Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 fix for v6.0-rc6
Message-ID: <YyMFAsBF01V+rY0G@kroah.com>
References: <YyL9gsk0cFMeJBS3@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyL9gsk0cFMeJBS3@black.fi.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 15, 2022 at 01:25:06PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 7e18e42e4b280c85b76967a9106a13ca61c16179:
> 
>   Linux 6.0-rc4 (2022-09-04 13:10:01 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.0-rc6

Pulled and pushed out, thanks.

greg k-h

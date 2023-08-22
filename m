Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28ABE7840A7
	for <lists+linux-usb@lfdr.de>; Tue, 22 Aug 2023 14:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235564AbjHVMXk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Aug 2023 08:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232256AbjHVMXk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Aug 2023 08:23:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D671199
        for <linux-usb@vger.kernel.org>; Tue, 22 Aug 2023 05:23:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3403362082
        for <linux-usb@vger.kernel.org>; Tue, 22 Aug 2023 12:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 155C7C433C8;
        Tue, 22 Aug 2023 12:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1692707017;
        bh=w0mlxFcu3NTucE0wyuyegm2Tn/T3HrbE5FwsRosRcrQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zoF+2ZWZPrcQysU8QE3kyNEjUMi6VFroZOAMc4kHcA29DSigA1bYOiAZeO/a1IoKc
         Va54e8BQHo8aGy0uDFY+7K8T6HNstlXFHt3Zpz7el/R94DFngjHdVECVk+eFdDvADg
         LHNufGC7Ac3jQZzSEWD2g+lnt7XGDe/AqCzrjKME=
Date:   Tue, 22 Aug 2023 14:23:33 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 changes for v6.6 merge window
Message-ID: <2023082223-detoxify-wilt-322e@gregkh>
References: <20230822094457.GL3465@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822094457.GL3465@black.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 22, 2023 at 12:44:57PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4:
> 
>   Linux 6.5-rc4 (2023-07-30 13:23:47 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.6-rc1

Pulled and pushed out, thanks.

greg k-h

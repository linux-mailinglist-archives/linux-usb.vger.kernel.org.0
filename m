Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B34D77474A
	for <lists+linux-usb@lfdr.de>; Tue,  8 Aug 2023 21:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232065AbjHHTNf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 15:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231717AbjHHTNS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 15:13:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5875351F8
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 09:35:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2AA716233C
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 08:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D88C433C8;
        Tue,  8 Aug 2023 08:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1691481923;
        bh=EUWM4tvXqECShWaNChLZKNEBAtI289wdMGwtbcyB1IY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SF8Q6NxAPLfjusrWkHBWUzmXOc7tXMFGX1lnhBY1r9AYfknHIJ495CAdyKYJoHWUG
         mmEc9NLdpWneT/mDcAIBZqrvnhXG0M8NU9cRcTjwQAOjFPLjiGcooVzbJj8MrlAxIp
         T94Cr2abk4YKnAn1zU1c9rQasNUl9LHvg8XJj1Bo=
Date:   Tue, 8 Aug 2023 10:05:20 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt fixes for v6.5-rc6
Message-ID: <2023080807-routing-maturely-23ae@gregkh>
References: <20230808053001.GF14638@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808053001.GF14638@black.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 08, 2023 at 08:30:01AM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4:
> 
>   Linux 6.5-rc4 (2023-07-30 13:23:47 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.5-rc6

pulled and pushed out, thanks.

greg k-h

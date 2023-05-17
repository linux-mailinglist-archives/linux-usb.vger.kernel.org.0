Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1794A7068C0
	for <lists+linux-usb@lfdr.de>; Wed, 17 May 2023 14:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbjEQM5k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 08:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbjEQM5k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 08:57:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7246A1A4
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 05:57:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 055F16449E
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 12:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5E5C433D2;
        Wed, 17 May 2023 12:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1684328258;
        bh=4a/tnszqcCLXcigSAAnHG1siZUuKsDTSXCo/XTXbvlE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RTF7BHjejCMdUSZlYAqhg6usSIL8Gca55fIcHW/IabPlRWA15FwuWADQ+dNrTZEcB
         Nte5T4209gWeHpKT4EUQ4yWU7Fbm1c5oIkeUsVDVvRk/5ebc7Yjj+YUCeyD9fznazB
         XOoXclfmHjBhKusfa7hAAh6sn/Ia6V6MhP1AU0tk=
Date:   Wed, 17 May 2023 14:57:35 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 fix for v6.4-rc3
Message-ID: <2023051728-decal-epilogue-2c18@gregkh>
References: <20230517071949.GV66750@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517071949.GV66750@black.fi.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 17, 2023 at 10:19:49AM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.4-rc3

Pulled and pushed out, thanks.

greg k-h

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26B9363C019
	for <lists+linux-usb@lfdr.de>; Tue, 29 Nov 2022 13:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234247AbiK2Mds (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Nov 2022 07:33:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234259AbiK2Mdn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Nov 2022 07:33:43 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E021A43847
        for <linux-usb@vger.kernel.org>; Tue, 29 Nov 2022 04:33:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 73533616FF
        for <linux-usb@vger.kernel.org>; Tue, 29 Nov 2022 12:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79732C433D6;
        Tue, 29 Nov 2022 12:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1669725221;
        bh=YzM1D2hC0oewKKPQAaCvocqdsjrk8GC/aqn7gUMwUKY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l3NDN+1DQ7+m9fAa4IO3vMlsvD0MY4ZAG7MBR1eTqa2S8fpDNqwkdFsfGZ/9GzAUC
         oI23DvAlZWzS7VACROrFGII5bXV0tdfSCtQe7MJVzIL4Ic01eFDK6lE91AUTfCMdHo
         9M4bnqQPJ+Bjzc13tf4/D9CCn2y2qavyyO+8GQe0=
Date:   Tue, 29 Nov 2022 13:27:06 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 changes for v6.2 merge window
Message-ID: <Y4X6moYQ/N4aRx1O@kroah.com>
References: <Y4XqZpTx1iC/tShY@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4XqZpTx1iC/tShY@black.fi.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 29, 2022 at 01:17:58PM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.2-rc1

Pulled and pushed out, thanks.

greg k-h

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3C752D9AD
	for <lists+linux-usb@lfdr.de>; Thu, 19 May 2022 18:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241049AbiESQBP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 May 2022 12:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241686AbiESQBJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 May 2022 12:01:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C9CAD13D
        for <linux-usb@vger.kernel.org>; Thu, 19 May 2022 09:01:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D844CB82552
        for <linux-usb@vger.kernel.org>; Thu, 19 May 2022 16:01:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 458A2C385AA;
        Thu, 19 May 2022 16:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1652976065;
        bh=iX/WwDNOjrc6Ju8JpV/Kkym2Clp0YJgF4/KbyDjYIWU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OxxsdGAojUv7bs8BAP3nuvjGjgHiu8hcb6epZ7hvmhS/r/NNxVD1hVRL0o7ez5cug
         O6GlVrhMX+HAQA61TQ5IqJUsIA+5aoPsOIvZJ8x2DMiZUvLCOyOi42yNJ/pa+z5iXu
         Htv4vWdFTmxLVhYCKCsd7f7uxA+ihTZswDbRsBb4=
Date:   Thu, 19 May 2022 18:00:43 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 changes for v5.19 merge window
Message-ID: <YoZpq2m06eWE8JoQ@kroah.com>
References: <YoN2YpxxWTNC6C1D@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoN2YpxxWTNC6C1D@lahna>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 17, 2022 at 01:18:10PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.19-rc1

Pulled and pushed out, thanks,

greg k-h

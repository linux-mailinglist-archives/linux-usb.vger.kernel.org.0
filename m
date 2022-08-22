Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2215059C32C
	for <lists+linux-usb@lfdr.de>; Mon, 22 Aug 2022 17:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236770AbiHVPmD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Aug 2022 11:42:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236730AbiHVPlq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Aug 2022 11:41:46 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E01471EC6B
        for <linux-usb@vger.kernel.org>; Mon, 22 Aug 2022 08:41:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 522F2CE1021
        for <linux-usb@vger.kernel.org>; Mon, 22 Aug 2022 15:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33D0CC4314D;
        Mon, 22 Aug 2022 15:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1661182889;
        bh=ZIyJELPgfgCjeC8NrC+vA9Z4KllJOvCB8TpsxxmCf1o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1Qh+FKXuBC3y9dfRfSidZ7h5F/O1qTdgc2nQLZp+v8vMgn9pxGK8dakQ5RIL24+BV
         7gE7gKJzZcAMpZGd0cTX8WWWb245Fzu/9AZ1lbYZ9jSoFnbfj4cFh59YDxfx9Hd16v
         q9n97Bw75tTgS/lQG3GVh8t0hS7E5rf70+Nj6RSw=
Date:   Mon, 22 Aug 2022 17:41:26 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 fixes for v6.0-rc3
Message-ID: <YwOjprep6fmArTVX@kroah.com>
References: <YwNKHkS3G+vk/J4r@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YwNKHkS3G+vk/J4r@black.fi.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 22, 2022 at 12:19:26PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.0-rc3

Pulled and pushed out, thanks.

greg k-h

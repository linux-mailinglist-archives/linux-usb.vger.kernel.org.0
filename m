Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9376E68EE45
	for <lists+linux-usb@lfdr.de>; Wed,  8 Feb 2023 12:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbjBHLuw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Feb 2023 06:50:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230392AbjBHLuu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Feb 2023 06:50:50 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F48E474C1
        for <linux-usb@vger.kernel.org>; Wed,  8 Feb 2023 03:50:48 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5D6E8B81C09
        for <linux-usb@vger.kernel.org>; Wed,  8 Feb 2023 11:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88368C433EF;
        Wed,  8 Feb 2023 11:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1675857045;
        bh=PAr/wUOcJS4C4rZ/oaic1AWzAXk0QZiuqeVBRt3bo/c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IwPXxsjuS00qmtnuVc9qbaeRoAXF3bHKhxe4Pp62qQ1s8o4RmUwE6cnSKZe+JcD7y
         jc5CyUlNUoGmjcj7O2jrbufdrg/FSPlFoiQPI4xQp2gnpa+Ov9Xel2XyGzIZ8tWWnr
         DmV3yX64xmbEU22zPHFoE7XftFPctk7z/bQc7Gpk=
Date:   Wed, 8 Feb 2023 12:50:04 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 changes for v6.3 merge window
Message-ID: <Y+OMbENEzkSyFwXJ@kroah.com>
References: <Y+NQ7qTXIw5ichzB@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+NQ7qTXIw5ichzB@black.fi.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 08, 2023 at 09:36:14AM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.3-rc1

pulled and pushed out, thanks.

greg k-h

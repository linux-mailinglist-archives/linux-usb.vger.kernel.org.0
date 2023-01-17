Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C320866E241
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jan 2023 16:35:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbjAQPf2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Jan 2023 10:35:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbjAQPf0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Jan 2023 10:35:26 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 729C841B60
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 07:35:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F0FFAB815AA
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 15:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43DB2C433D2;
        Tue, 17 Jan 2023 15:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1673969722;
        bh=c6UEd1NC2NdY4RnQ1S8Rp0204O6QAQxeplBOl+oLta0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HReSRjj3CqlRymv8VzeuxNQNMdeTSggVQXoFnC92GvZxT6HlQCuTO6f9J4bodeCKN
         wYW83VqShGgCVNsgs8uummMzo1mDYZKhTPsRHO9rqUDxyIYHECIoJQC1biOQainybt
         9URdzpdxL3aHFIFh/HCNaO/wgBZGjC5DRvc8YYuU=
Date:   Tue, 17 Jan 2023 16:35:19 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 fixes for v6.2-rc5
Message-ID: <Y8bANxaoMfGPeteG@kroah.com>
References: <Y8UZCZV92voYDxv0@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8UZCZV92voYDxv0@black.fi.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 16, 2023 at 11:29:45AM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.2-rc5

Pulled and pushed out, thanks.

greg k-h

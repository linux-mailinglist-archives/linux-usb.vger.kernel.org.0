Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 457B84AD709
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 12:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359450AbiBHLbg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Feb 2022 06:31:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357036AbiBHLVM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 06:21:12 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 877DFC03FEC9
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 03:21:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 14BC161576
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 11:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90B4C004E1;
        Tue,  8 Feb 2022 11:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1644319270;
        bh=0EBDyWCdj2J0467X/93+UBDpjoKXI2Z2G0PsdgKfF5U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hF9/r39S/Vv5A15WV1f14ZNe09dmsnhn/SP9QD2K4NageqcTX94/evV5nSBmE+y6D
         Qm7Jl4jzzep391FYvmFZHp4IvxXVZ1kQT86sTsYim8WB3GyTP+DR1GMPhWN6gtisHC
         t+RXN/+PDq+t0G93HnkW5FPp/3uSsGgm+WjeS3Es=
Date:   Tue, 8 Feb 2022 12:21:07 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: core: use sysfs_emit() instead of sprintf()
Message-ID: <YgJSI8gbhKeVkgi3@kroah.com>
References: <4248804f-d9eb-5e00-563f-28815cd42b65@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4248804f-d9eb-5e00-563f-28815cd42b65@omp.ru>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 08, 2022 at 02:02:20PM +0300, Sergey Shtylyov wrote:
> sprintf() (still used in the USB core for the sysfs output) is vulnerable
> to the buffer overflow.

Really?  Where?  If we have potential overflows, let's fix them as bug
fixes and properly backport the fixes where needed.

If these really are just using the "old-style" functions instead, then
that's something totally different and you should not say "vulnerable"
if it really is not at all.

> Use the new-fangled sysfs_emit() instead.
> 
> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
> analysis tool.

You mean coccinelle, right?  It's been checking for this for a while.

Also properly wrap your changelog at 72 columns please.

thanks,

greg k-h

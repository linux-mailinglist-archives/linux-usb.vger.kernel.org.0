Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7637C64432C
	for <lists+linux-usb@lfdr.de>; Tue,  6 Dec 2022 13:31:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232572AbiLFMbn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Dec 2022 07:31:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231669AbiLFMbm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Dec 2022 07:31:42 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AD5728E2C
        for <linux-usb@vger.kernel.org>; Tue,  6 Dec 2022 04:31:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 29CCD616FB
        for <linux-usb@vger.kernel.org>; Tue,  6 Dec 2022 12:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB09C433D6;
        Tue,  6 Dec 2022 12:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1670329900;
        bh=76+0QVP3BEzcYKmRdFwbVc478/RVNeVmoqRI4kQNeSA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=McsU9JJxT+RJt2vKuR/dOEeDybDq9JM/wMRV34dU9qPctkHeFxp1TCrmcstQGbGxR
         Eb22DaMjHed30mX/rul8lgCbuRaVT92/bfB4WJEZaFpUjckitsw+JaPlAqPXwkMriB
         lY3His23Qv81E0riMKOwvCBdzIP4o9lFEoSsyBZ0=
Date:   Tue, 6 Dec 2022 13:31:38 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Dan Scally <dan.scally@ideasonboard.com>
Cc:     kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org
Subject: Re: [usb:usb-testing 2/2] drivers/usb/gadget/legacy/webcam.c:174:3:
 error: field designator 'bmInterfaceFlags' does not refer to any field in
 type 'const struct uvc_format_uncompressed'; did you mean
 'bmInterlaceFlags'?
Message-ID: <Y482Krr7Ko49ocEI@kroah.com>
References: <202212060347.MaTRoCo0-lkp@intel.com>
 <926df743-9c43-9471-3c67-3df9f4e18204@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <926df743-9c43-9471-3c67-3df9f4e18204@ideasonboard.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 05, 2022 at 08:20:25PM +0000, Dan Scally wrote:
> Oops, forgot all about the legacy version. Sorry Greg - let me send a v2.

Now dropped from my tree, thanks.

greg k-h

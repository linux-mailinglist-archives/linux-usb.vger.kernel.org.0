Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E20F251F4E2
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 08:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbiEIHBI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 03:01:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234884AbiEIGrx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 02:47:53 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D2611912FA
        for <linux-usb@vger.kernel.org>; Sun,  8 May 2022 23:43:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A4191B80EAF
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 06:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00348C385A8;
        Mon,  9 May 2022 06:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1652078592;
        bh=G186hJPLvB+VGmtmT7qNngtzC20adRWNP+A9wj61Ep8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aYdREP87TquT6nP0J6lD+DjMo2zhjdJGge1FSqB1zF0NX8hiOBBkOCYZDC7I2mo4K
         nHYtEXxrWd2Stn/BZo21rb6WEmM5hExLvPGE4ciWLLYI9hTeB7NWCARczB12jsPfJf
         NthcRhRVxfXrjVjMBFgrUQzanD2I494MP7F6UCVo=
Date:   Mon, 9 May 2022 08:43:09 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH v2] usb: gadget: update DECLARE_USB_FUNCTION(_INIT) macro
Message-ID: <Yni3/cq6LX4lyHVq@kroah.com>
References: <1652077685-30622-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1652077685-30622-1-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 09, 2022 at 02:28:05PM +0800, Linyu Yuan wrote:
> Take DECLARE_USB_FUNCTION_INIT(ffs, ffs_alloc_inst, ffs_alloc) as example,
> it will generate function ffsmod_init/ffsmod_exit()
> and variable ffsusb_func.

I do not think "as example" is needed here, right?

> Add possible character '_' in the macro which will generate
> function/variable name in common format, ffs_mod_init/ffs_mod_exit()
> and ffs_usb_func.

Ok, but why do this?  Why not add any other character?  What problem
does this solve?

> 
> It will apply to all gadget functions which use this macro.

That is a given for any macro, and you do nto needs to state this.

> 
> Also do minor change accordingly to f_loopback.c and f_sourcesink.c.

Why "also"?  What minor change are you making and why?

When you have "also" in a changelog text, that's a huge hint it should
be more than one commit, and I think this should be more than one commit
(hint, the f_loopback.c change can go first).

> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
> v2: fix issue report by kernel test robot <lkp@intel.com>
> 
>  drivers/usb/gadget/function/f_loopback.c   | 12 +-----------
>  drivers/usb/gadget/function/f_sourcesink.c |  6 +++---
>  include/linux/usb/composite.h              | 14 +++++++-------
>  3 files changed, 11 insertions(+), 21 deletions(-)

As the first version showed, you didn't test-build this so I really do
not understand why it is needed as you obviously are not using this
change anywhere..  Why the extra churn for no real advantage?

thanks,

greg k-h

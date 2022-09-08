Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA4025B13F7
	for <lists+linux-usb@lfdr.de>; Thu,  8 Sep 2022 07:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbiIHFUe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Sep 2022 01:20:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbiIHFUc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Sep 2022 01:20:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED298659CF
        for <linux-usb@vger.kernel.org>; Wed,  7 Sep 2022 22:20:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8B0C861B4B
        for <linux-usb@vger.kernel.org>; Thu,  8 Sep 2022 05:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65717C433C1;
        Thu,  8 Sep 2022 05:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1662614430;
        bh=JvA4AUpPKtmQs6CbFGojfRBacVAI2KOQEKqmd3/Lz0g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ARNNaMln6U4LepQoy5tkuI6cuOI02hbdHitK0WW2ViumqlDnsRUtZtJTRGqTIXN/4
         NWz4An9I9oFTEV4CTydVpBCqdRjX9eSzzXmtzkfEGRwB6c2oUdX63wticQFCyK+F9f
         0qhyvmse5FrafkxRb5nOaTLirwsgPwa2pB5mSz/k=
Date:   Thu, 8 Sep 2022 07:20:52 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     chen zhang <chenzhang@kylinos.cn>
Cc:     balbi@kernel.org, chenzhang_0901@163.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: Fix spelling typo in comments
Message-ID: <Yxl7tN7hBHtFfS/7@kroah.com>
References: <20220908032949.17688-1-chenzhang@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908032949.17688-1-chenzhang@kylinos.cn>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 08, 2022 at 11:29:49AM +0800, chen zhang wrote:
> Fix spelling typo in comments.
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: chen zhang <chenzhang@kylinos.cn>
> ---
> change for v2: add k2ci tool explain:
> K2ci (Kylin Continuous Integration) is a code pre-verification tool 
> independently developed by KylinSoft, which is used for ensuring the 
> code quality of code submission. K2ci includes the comment check tool
> notes_check.
> 
> This spelling typo was found using notes_check tool, which reported the following
> warning when check the v5.19 kernel release:
> 
> python3 notes_check.py
> /drivers/usb/gadget/function/f_uac1_legacy.c selecotor
> python3 notes_check.py
> /drivers/usb/gadget/udc/bdc/bdc_ core.c dyanmic

All of this needs to be in the changelog text, not below the --- line.

thanks,

greg k-h

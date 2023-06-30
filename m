Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ADD9743BC4
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jun 2023 14:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232342AbjF3MRz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Jun 2023 08:17:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231886AbjF3MRw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Jun 2023 08:17:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88F95E58
        for <linux-usb@vger.kernel.org>; Fri, 30 Jun 2023 05:17:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2124A61750
        for <linux-usb@vger.kernel.org>; Fri, 30 Jun 2023 12:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28BA1C433C8;
        Fri, 30 Jun 2023 12:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1688127470;
        bh=ERcEROP0mKI8Wm5Lys8HMQuZ4Am+bkr62dcce2Q0dY8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uu6G32Vz4zEi2qrVQH6UHYLZiqVCeO024ACxc4ZWxMtBXcPx8+pTyPdZcLRkAzqdv
         wGwUD2iPip59m7rHMoxAyt7AHKcSKFpDQds2td9F+Rr0cLnc4cO/Zrq1gnZ8343SBO
         t7eEzdu2u7Mmwz0VfH29eiTb1QbhQssZj46AWzCo=
Date:   Fri, 30 Jun 2023 14:17:47 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yiyuan Guo <yguoaz@gmail.com>
Cc:     dan.scally@ideasonboard.com, andriy.shevchenko@linux.intel.com,
        frank.li@nxp.com, christophe.jaillet@wanadoo.fr, jgilab@gmail.com,
        chanh@os.amperecomputing.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: configfs: Prevent buffer overrun in
 usb_string_copy
Message-ID: <2023063013-fanning-crafty-4502@gregkh>
References: <20230630110401.2360746-1-yguoaz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630110401.2360746-1-yguoaz@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 30, 2023 at 07:04:01PM +0800, Yiyuan Guo wrote:
> In usb_string_copy(), when `strlen(s) == 0`, `str[ret - 1]` accesses at
> index -1. Add a check to prevent buffer overrun when `s` is empty.

It's an underrun, right?

And how can strlen(s) ever be 0 here?

How did you test this and how did you trigger it?

And what commit id does this fix?

And how was this found?

thanks,

greg k-h

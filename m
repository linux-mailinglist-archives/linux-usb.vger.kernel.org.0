Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF445B0409
	for <lists+linux-usb@lfdr.de>; Wed,  7 Sep 2022 14:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbiIGMf6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Sep 2022 08:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiIGMf5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Sep 2022 08:35:57 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B97AA8CDA
        for <linux-usb@vger.kernel.org>; Wed,  7 Sep 2022 05:35:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 71492B81C44
        for <linux-usb@vger.kernel.org>; Wed,  7 Sep 2022 12:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6908C433C1;
        Wed,  7 Sep 2022 12:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1662554150;
        bh=fXkjPb8jUgsIkfg1aYljnoRc0RfGzWHnE/2su0nDKS8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LxdSGXMS7IqnSocdzqv9bPHa6ZmQ0tk7qXQxDzSNDPgrSNJBR60sGgO4xAj7VQA4s
         ec3TbO7Ug1uTETmchPq3AgNCwf0v3CieiSqVU6bPrvs5h7cy8t9Ck5ao4Q7c5phyeb
         +gEKZeDc1vlaoKfudxmiIB7NQex2xjDx8+cU8ErI=
Date:   Wed, 7 Sep 2022 14:35:47 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     chen zhang <chenzhang@kylinos.cn>
Cc:     chunfeng.yun@mediatek.com, chenzhang_0901@163.com,
        linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] usb: mtu3: Fix spelling typo in comments
Message-ID: <YxiQIx5AEGDnLzlX@kroah.com>
References: <20220907051436.51703-1-chenzhang@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907051436.51703-1-chenzhang@kylinos.cn>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 07, 2022 at 01:14:36PM +0800, chen zhang wrote:
> Fix spelling typo in comments.
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: chen zhang <chenzhang@kylinos.cn>

What is "k2ci"?

Please follow the Documentation/process/researcher-guidelines.rst rules
when you use tools like this.

thanks,

greg k-h

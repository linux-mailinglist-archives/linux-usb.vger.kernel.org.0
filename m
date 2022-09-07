Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 109025B0408
	for <lists+linux-usb@lfdr.de>; Wed,  7 Sep 2022 14:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbiIGMfn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Sep 2022 08:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiIGMfj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Sep 2022 08:35:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3934832DF
        for <linux-usb@vger.kernel.org>; Wed,  7 Sep 2022 05:35:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5EBC9B81CA8
        for <linux-usb@vger.kernel.org>; Wed,  7 Sep 2022 12:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B591CC433D6;
        Wed,  7 Sep 2022 12:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1662554133;
        bh=KL5Rxh1EJrcAZ7mRnV/PpvGuqhK77ycEA01wUyFfSf0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s/0fi1LX+YciQ1wGyrCFKkClh13k3hIVTj2S6QxRmv5dPMx0RAidb/aGj7p2H6uid
         jdJSgbi7jWs0zm7UrtNAhaus0VExwkfVCXYAtOWHwI0GGenpknClb6Ian/cIq7DP6V
         jconlTzIJin56MH5ziNweUjRq86oUN6vm7RXTYDI=
Date:   Wed, 7 Sep 2022 14:35:30 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     chen zhang <chenzhang@kylinos.cn>
Cc:     balbi@kernel.org, chenzhang_0901@163.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: Fix spelling typo in comments
Message-ID: <YxiQEurGQdg8Klbs@kroah.com>
References: <20220907045840.50540-1-chenzhang@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907045840.50540-1-chenzhang@kylinos.cn>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 07, 2022 at 12:58:40PM +0800, chen zhang wrote:
> Fix spelling typo in comments.
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: chen zhang <chenzhang@kylinos.cn>


What is "k2ci"?

Please follow the Documentation/process/researcher-guidelines.rst rules
when you use tools like this.

thanks,

greg k-h

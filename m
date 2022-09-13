Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 249285B7732
	for <lists+linux-usb@lfdr.de>; Tue, 13 Sep 2022 19:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232408AbiIMRGL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Sep 2022 13:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232039AbiIMRFm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Sep 2022 13:05:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D14D4B0FB;
        Tue, 13 Sep 2022 08:55:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CC010B81002;
        Tue, 13 Sep 2022 15:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E931EC433D6;
        Tue, 13 Sep 2022 15:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663082928;
        bh=YrUHxOpGXMQ+CcAAIAIP/KVdj5zfY8VH1kxTHt3bOjM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P1lHYdk2/ISuWnH9L/UBgazYb6nXLGCeAwerCcAGW3AIAbwoaMpf1pp4f/v+CVwcW
         i4Uix5Z7BlrHhflfMIdO9c+4WRXdCVk/pJrqKiFuf+UuSv2b4WuCGkFv9a/HGp+8R5
         VVKJ8yTExLnOQ5lyLx43HletUZIbDsMchGb+QIb91AUKkE5o85T51o/sD2asFpUnrW
         m6LCmLwTNakgBCzrIkHkm8GveMvsg1VnxxHxDscz61MUtMAU3TC2i4KFsjaIvUQldE
         hJc6gNY6VE7VFSGxNysw6L//cpWSI/UYw7y/b4B0wFliLHpi+JlDNGoUrCaijkpiNF
         AVcLyZ/heZk0Q==
Date:   Tue, 13 Sep 2022 20:58:43 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Wei Yongjun <weiyongjun@huaweicloud.com>
Cc:     Vincent Shih <vincent.sunplus@gmail.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] phy: usb: sunplus: Fix return value check in
 update_disc_vol()
Message-ID: <YyChq1vgN6W5KW0P@matsya>
References: <20220909094709.1790970-1-weiyongjun@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909094709.1790970-1-weiyongjun@huaweicloud.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 09-09-22, 09:47, Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> In case of error, the function nvmem_cell_read() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check
> should be replaced with IS_ERR().

Applied, thanks

-- 
~Vinod

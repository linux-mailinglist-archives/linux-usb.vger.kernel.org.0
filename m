Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62E05667E4C
	for <lists+linux-usb@lfdr.de>; Thu, 12 Jan 2023 19:43:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240532AbjALSnR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Jan 2023 13:43:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232226AbjALSmm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Jan 2023 13:42:42 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 986327825F
        for <linux-usb@vger.kernel.org>; Thu, 12 Jan 2023 10:15:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6647AB81F02
        for <linux-usb@vger.kernel.org>; Thu, 12 Jan 2023 18:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F433C433D2;
        Thu, 12 Jan 2023 18:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673547323;
        bh=qPDSt8i6uFp2NJYu2QUTYE6IloLYkwRsTgE9Cu+vYVU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YBkQZ1TpWGHdwX+KRY/mhEu4C9Cy23MjpcZZeW4e5cSLr/x9f+cY7UAIYPBuptR7E
         Gs7bpZUq/ZsHaoX3YAClVcCF6gJyaj1KKe9HHEuTD6qPcOgpBOxtkSb1BBI66EPsb7
         OkbCDWhC/dTXaXn7KZ6i8ynRyo1FsOWqGSJWn/tImp75VBxqMzHqSalQAeTRfGiUyK
         MxKB5cfKhfUI30msSrFiUicFGJoBlIHxelBfWlextyPGsddbIeCLeq9o0iDkKc5Nmt
         o4SClrgE8sQB5MVOWKFds0JVNgKsIx+MS52yxNDZ3OBSVQ30CZMb+B6sQuu6eEkrgk
         fcw00hwQ8TpYw==
Date:   Thu, 12 Jan 2023 23:44:47 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Shang XiaoJing <shangxiaojing@huawei.com>
Cc:     vincent.sunplus@gmail.com, kishon@ti.com,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH] phy: usb: sunplus: Fix potential null-ptr-deref in
 sp_usb_phy_probe()
Message-ID: <Y8BOF2hrH+dJDBYg@matsya>
References: <20221125021222.25687-1-shangxiaojing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221125021222.25687-1-shangxiaojing@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 25-11-22, 10:12, Shang XiaoJing wrote:
> sp_usb_phy_probe() will call platform_get_resource_byname() that may fail
> and return NULL. devm_ioremap() will use usbphy->moon4_res_mem->start as
> input, which may causes null-ptr-deref. Check the ret value of
> platform_get_resource_byname() to avoid the null-ptr-deref.

Applied, thanks

-- 
~Vinod

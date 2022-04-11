Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C61B4FBF61
	for <lists+linux-usb@lfdr.de>; Mon, 11 Apr 2022 16:41:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347272AbiDKOmW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Apr 2022 10:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347355AbiDKOmU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Apr 2022 10:42:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3343EF4C
        for <linux-usb@vger.kernel.org>; Mon, 11 Apr 2022 07:40:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C0F3B6147E
        for <linux-usb@vger.kernel.org>; Mon, 11 Apr 2022 14:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98B00C385A3;
        Mon, 11 Apr 2022 14:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649688005;
        bh=+saKweDFleiumysXK5QHdl7bdwpKZhGZFXtIhbrZwA8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p9DeTeu+PInhybClsPA8pl3+xfgseVglV3Z9QEzogL7v9uzVqlC5gKFop4ttogNSz
         xqCgfiAKUpyuxt1/zd5TB5D0rJt+ouJLRVUrGsa9hcCiOTjuufdtCTC5zUHGIxgIST
         vrsNNLJRDXg7NJ7Ya1eDjWRKcCS9g3h6n0golq4UFEcXh/uMJVTRd7My9wxTT4X282
         rElwJxlKbZEyDyiLSwXxdDBqGNKTTGLQpfUcAS23fH8fnf28CDEUmi4BonFMMPyWeq
         QJXxb6bWqrcJxZGEpURl07gQOS9lBJEJ4cAH2qZXVl4d0PsbaThyRqOty8ixbslNfG
         ERLp1TEaaa3Pg==
Date:   Mon, 11 Apr 2022 20:10:01 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] phy: ti: tusb1210: Make tusb1210_chg_det_states static
Message-ID: <YlQ9weJMdF2RXg3i@matsya>
References: <20220411135440.558394-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411135440.558394-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11-04-22, 15:54, Hans de Goede wrote:
> Make tusb1210_chg_det_states static, fixing the following sparse warning:
> 
> drivers/phy/ti/phy-tusb1210.c:158:12: sparse: sparse:
>  symbol 'tusb1210_chg_det_states' was not declared. Should it be static?

Applied, thanks

-- 
~Vinod

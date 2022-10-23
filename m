Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 015EB6091D9
	for <lists+linux-usb@lfdr.de>; Sun, 23 Oct 2022 11:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbiJWJKi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Oct 2022 05:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbiJWJKh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Oct 2022 05:10:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E4A4647E3;
        Sun, 23 Oct 2022 02:10:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 124F06068B;
        Sun, 23 Oct 2022 09:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C67C433C1;
        Sun, 23 Oct 2022 09:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666516234;
        bh=GvMqPk97cFGJjjBdP0e4IXMC6+6X2R7gYyOBEmHAU7g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iUpzX4/VPqnzho3Vq4cBHLpFXOGcUWbnxEOPicJB/hEw4QYxNY34bleH5dOETO2Wl
         vpqmgWIm3Zw9EcPO9UukGpkxXW8Sf4EgIUMkcbsF3SAb6aZ0FpkV325B471YIBigNC
         5h7tIJ/YMi0g4EXVXv5pFFn0Qm94eRrmWm0Rp42/If0Mnt7luO/NGmuKd+hYJsl3LH
         ux4XT3zAuEKhdblyeWaUeQKGmGxT2PeEpf9bNkDWeGXUqGdry8m5xJySEhIInPRNO0
         EwUjxnqrIdkjyXE+2NgwJnDbxFQSqHhSM9Hvt3iQK4zQG6Obx2LoAD4Xgz6GAVMoen
         cOya+2WZrC6rA==
Date:   Sun, 23 Oct 2022 17:10:26 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, Li Jun <jun.li@nxp.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/4] arm64: dts: tqma8mpql: add support for 2nd USB
 (host) interface
Message-ID: <20221023091026.GA125525@dragon>
References: <20220915062855.751881-1-alexander.stein@ew.tq-group.com>
 <20220915062855.751881-5-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915062855.751881-5-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 15, 2022 at 08:28:55AM +0200, Alexander Stein wrote:
> The on-board USB hub has a single reset line which needs to be enabled.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!

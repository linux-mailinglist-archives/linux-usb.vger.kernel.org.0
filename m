Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1A1E71641D
	for <lists+linux-usb@lfdr.de>; Tue, 30 May 2023 16:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231466AbjE3O33 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 May 2023 10:29:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231841AbjE3O3X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 May 2023 10:29:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFCF6E5C;
        Tue, 30 May 2023 07:29:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 40B1463145;
        Tue, 30 May 2023 14:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519A8C433EF;
        Tue, 30 May 2023 14:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1685456901;
        bh=Bq55rc2J+HUdltrUUbPsYFHA+48AK8kpYxgdqHpZXrE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HDMWMf7gDcNEXsUd9WcexvgkjNIB4UE7evyc6LZdCaBGPtHJ3zuL2RMebFVhqVp4k
         g+enKCI0ujIW7xO4XJiltNguNjRf1cbPMuFp5B4yWoyc144SkZciBw0ZZQoSMfvdQ0
         rNibuhlA2QimqzGdn3kQCbZ+2iT2Dzt0wcaviQv8=
Date:   Tue, 30 May 2023 15:28:19 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Prashanth K <quic_prashk@quicinc.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] usb: common: usb-conn-gpio: Set last role to unknown
 before initial detection
Message-ID: <2023053058-baffling-unveiling-e597@gregkh>
References: <1685421871-25391-1-git-send-email-quic_prashk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1685421871-25391-1-git-send-email-quic_prashk@quicinc.com>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 30, 2023 at 10:14:31AM +0530, Prashanth K wrote:
> Currently if we bootup a device without cable connected, then
> usb-conn-gpio won't call set_role() since last_role is same as
> current role. This happens because during probe last_role gets
> initialised to zero.
> 
> To avoid this, added a new constant in enum usb_role, last_role
> is set to USB_ROLE_UNKNOWN before performing initial detection.
> 
> While at it, also handle default case for the usb_role switch
> in cdns3 to avoid build warnings.
> 
> Fixes: 4602f3bff266 ("usb: common: add USB GPIO based connection detection driver")
> Signed-off-by: Prashanth K <quic_prashk@quicinc.com>

Breaks the build :(

Please be more careful when submitting stuff, especially on v6 of a
patch :(

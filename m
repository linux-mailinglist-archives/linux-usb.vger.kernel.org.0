Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3AD79CF89
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 13:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234179AbjILLLy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Sep 2023 07:11:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233912AbjILLKv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Sep 2023 07:10:51 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 504CC2702
        for <linux-usb@vger.kernel.org>; Tue, 12 Sep 2023 04:09:54 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F700C433C8;
        Tue, 12 Sep 2023 11:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1694516994;
        bh=bLyLi+faxk7w/LhaEb7Jj9AlCgcR0UU8R7jozk1dfWA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VUJVocaj+xa7EyGHw4eTXFFe2CTFC+NZ15GDQZ78kTveeDK6jtGfGyN7f09ws62mp
         oSY/iU8YlYn3Wb3MF2Y+26melWLQtmqmAWP3+odGYeeG3xbz/oEjmnAs8+R7A/Wi6v
         csnUNlfGe2QkNs6muuO3I0BAymR51m0/otWDZ6rU=
Date:   Tue, 12 Sep 2023 13:09:51 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Neal Liu <neal_liu@aspeedtech.com>,
        Cristian Birsan <cristian.birsan@microchip.com>,
        Bin Liu <b-liu@ti.com>, Kevin Cernekee <cernekee@gmail.com>,
        Justin Chen <justin.chen@broadcom.com>,
        Al Cooper <alcooperx@gmail.com>, Li Yang <leoyang.li@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Herve Codina <herve.codina@bootlin.com>,
        hierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@amd.com>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 10/10] usb: musb: trace: reduce buffer usage of trace
 event
Message-ID: <2023091221-symphonic-vindicate-e7f3@gregkh>
References: <20230912104455.7737-1-quic_linyyuan@quicinc.com>
 <20230912104455.7737-11-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912104455.7737-11-quic_linyyuan@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 12, 2023 at 06:44:55PM +0800, Linyu Yuan wrote:
> Save u32 member into trace event ring buffer and parse it for possible
> bit information.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
> v2: no change
> v3: no change

I asked you to change previous versions of this patch (and other patches
in this series.)  Why you ignored my review comments is odd...


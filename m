Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5E2B79AF46
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 01:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350780AbjIKVlT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 17:41:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238017AbjIKNdp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 09:33:45 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC284106
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 06:33:40 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17811C433C7;
        Mon, 11 Sep 2023 13:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1694439220;
        bh=APU2rPvlGKCplyNOf9MqgAq8riADofmCL/OcF9UgtlI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nK5vpPfwAsRAvZIb7byyRWUcdpDE0kiAJtjj1532mUTsQUnMAzBBvUD8TBk+LUQam
         3TwWw0FTo6eTDswb3XKQvGrlBGGVtnjxjEZJ78esauddI4ZfHcw8UoGPOqudNtlis6
         jLsIBkMYzs1d+6EMgP30ETLYpb+BtczeCags/2NI=
Date:   Mon, 11 Sep 2023 15:33:36 +0200
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
Subject: Re: [PATCH v2 10/11] usb: mtu3: trace: reduce buffer usage of trace
 event
Message-ID: <2023091157-kiwi-skydiver-b030@gregkh>
References: <20230911112446.1791-1-quic_linyyuan@quicinc.com>
 <20230911112446.1791-11-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911112446.1791-11-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 11, 2023 at 07:24:45PM +0800, Linyu Yuan wrote:
> Save u32 members into trace event ring buffer and parse it for possible
> bit information.

Reduce it by how much?  And now you are parsing, which takes more time
right?  Why is this change needed?

I just picked one of the patches in the series here, you need to be able
to answer this for all of them.

thanks,

greg k-h

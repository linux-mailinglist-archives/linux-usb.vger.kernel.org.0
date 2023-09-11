Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9AB79AE4C
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 01:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241100AbjIKVjy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 17:39:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238008AbjIKNcv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 09:32:51 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 284A7CD7
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 06:32:47 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD29C433C7;
        Mon, 11 Sep 2023 13:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1694439166;
        bh=MPApL/+gobvCuCmAJt3xzTUKMEoLbO4uIhWk8WoHyAE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=v8IxIOA6VhQ6Er5h4+zcyWFFR7odSqJFqTEvjLH5sXWDXndeDFacwk8S6txpuy+Qd
         gHCWill+O78Ux8OCMrVHyTAHc2MZTKr/DEJTDNXZnPy/ZFEkLyFTTDcMMXvKx2YoMn
         vstSL5uNC+Pn6siSuTqgbKZEeDAU0TzTYqRuXyRA=
Date:   Mon, 11 Sep 2023 15:32:42 +0200
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
Subject: Re: [PATCH v2 00/11] usb: gadget: reduce usb gadget trace event
 buffer usage
Message-ID: <2023091141-outbound-turmoil-edda@gregkh>
References: <20230911112446.1791-1-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911112446.1791-1-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 11, 2023 at 07:24:35PM +0800, Linyu Yuan wrote:
> some trace event use an interger to to save a bit field info of gadget,
> also some trace save endpoint name in string forat, it all can be
> chagned to other way at trace event store phase.
> 
> bit field can be replace with a union interger member which include
> multiple bit fields.
> 
> ep name stringe can be replace to a interger which contaion number
> and dir info.

Ok, but how much memory did you actually save here?  Is the memory saved
only if tracing is enbaled, or it is always?  Is there a speed penality
for these changes or is it the same?

You are doing a lot of code reorginization without any real explaination
of why this is needed, nor proof about it.

thanks,

greg k-h

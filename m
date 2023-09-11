Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 979CF79B8B6
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 02:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350872AbjIKVl4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 17:41:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238201AbjIKNsL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 09:48:11 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B782F5
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 06:48:04 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E6AC433C8;
        Mon, 11 Sep 2023 13:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1694440084;
        bh=tZjNgp5w5X2nAKm6d529QBvoKD0IYwoOKckVncspda8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Fk3tZGaUA4P4Vstt5keBYL28ZnV9YoCwN0vbkzhDe6sxhs2VFf8Kru68p0zL5sLWU
         Yofxq1//B2niPI+iVtau5bxgYbRREsj9L7CdKZF47E4JPXdNr2yJY5TrTvQa6iAIff
         CffxISpW0jVYLfj6CZIbItyEbbB36V7q8D3BgnTE=
Date:   Mon, 11 Sep 2023 15:48:01 +0200
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
Message-ID: <2023091135-gave-phoniness-bf17@gregkh>
References: <20230911112446.1791-1-quic_linyyuan@quicinc.com>
 <2023091141-outbound-turmoil-edda@gregkh>
 <a75f8d88-4731-9633-8407-b028eba9804b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a75f8d88-4731-9633-8407-b028eba9804b@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 11, 2023 at 09:44:21PM +0800, Linyu Yuan wrote:
> 
> On 9/11/2023 9:32 PM, Greg Kroah-Hartman wrote:
> > On Mon, Sep 11, 2023 at 07:24:35PM +0800, Linyu Yuan wrote:
> > > some trace event use an interger to to save a bit field info of gadget,
> > > also some trace save endpoint name in string forat, it all can be
> > > chagned to other way at trace event store phase.
> > > 
> > > bit field can be replace with a union interger member which include
> > > multiple bit fields.
> > > 
> > > ep name stringe can be replace to a interger which contaion number
> > > and dir info.
> > Ok, but how much memory did you actually save here?  Is the memory saved
> > only if tracing is enbaled, or it is always?  Is there a speed penality
> > for these changes or is it the same?
> 
> yes, it is save trace ring buffer only when tracing enabled, as save less
> data, speed is higher.

Are you sure?  You now have to parse the data, so how is it faster?

> it is help when enable trace for a long period.

Help exactly how?  What is saved exactly, and what about cpu usage?

> for a single trace entry, take struct usb_gadget as example, at worst case,
> it save (19 dword  - 1 dword) / 19dword = 94% buffer.
> 
> for ep name, it only need 4 bytes/  (4bytes + 9bytes ) = 30%.

And this buffer size reduction shows up where?  Are you trading space
for CPU time?  Somehow you are ending up with the same information in
userspace, so where are the tradeoffs?

thanks,

greg k-h

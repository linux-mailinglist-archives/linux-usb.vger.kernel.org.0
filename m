Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA9B79EDE6
	for <lists+linux-usb@lfdr.de>; Wed, 13 Sep 2023 18:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbjIMQDF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Sep 2023 12:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjIMQDE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Sep 2023 12:03:04 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 817C095
        for <linux-usb@vger.kernel.org>; Wed, 13 Sep 2023 09:03:00 -0700 (PDT)
Received: (qmail 959784 invoked by uid 1000); 13 Sep 2023 12:02:57 -0400
Date:   Wed, 13 Sep 2023 12:02:57 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
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
Subject: Re: [PATCH v3 01/10] usb: gadget: add anonymous definition in struct
 usb_gadget
Message-ID: <ef99b328-926c-4696-83bf-9ccd6a38984e@rowland.harvard.edu>
References: <20230912104455.7737-1-quic_linyyuan@quicinc.com>
 <20230912104455.7737-2-quic_linyyuan@quicinc.com>
 <2023091255-unsubtly-daisy-7426@gregkh>
 <d1c34d15-e598-5f86-bc86-cd5e656225c9@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1c34d15-e598-5f86-bc86-cd5e656225c9@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 13, 2023 at 11:46:12AM +0800, Linyu Yuan wrote:
> but Alan Stern have one comment,   do it mean the bit position number is not
> expect and we can't use it ?
> 
> @Alan Stern ,  BIT(0), BIT(1) is not the member we expect ?

They might not be.  If you can avoid making this assumption, you should.

> > This macro usage is a real mess.  Can't you find a better way to do it?
> >
> > For instance, in the code that parses the trace buffer, define a
> > temporary usb_gadget structure and copy the dw1 field from the trace
> > buffer to the temporary structure.  Then you can access the fields in
> > that structure directly by their original names, with no macros.
> 
> do it same idea just move it outside of gadget.h ?

Keep the anonymous union in gadget.h, but get rid of the macros.

Alan Stern

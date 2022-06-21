Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C753B552C9A
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jun 2022 10:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346584AbiFUIGO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jun 2022 04:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348005AbiFUIGN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jun 2022 04:06:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 252212495E
        for <linux-usb@vger.kernel.org>; Tue, 21 Jun 2022 01:06:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B2A76614C9
        for <linux-usb@vger.kernel.org>; Tue, 21 Jun 2022 08:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B8F2C3411D;
        Tue, 21 Jun 2022 08:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655798771;
        bh=KH7ZrN8bC1eUsw5JFazm2S+rUsJRETeKPi5YNlc8wr4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IEFD5TwDDEpScmWFb99oW40rxC/YaQHsllASQtba2EsDV0iziLbD0XlBoE0DHl/TS
         6i0nTPPckcZewIh8vGytRU61t7sDWPQ4vc3l+x/7WQkraTmVgW3fXWDsiPfJeg9G34
         d3c+wWC1mkojhf6sCd7FuB10J6hXKsf+C1v32of8nA7jeMiFGplhkg2082zZ8BN12Y
         5NikCThLt+jc8ANo73JoRu2JhZh+ZjgPHXX9Q9+dd9BbmjukdOEJG1mA5DXLin62v9
         v4sON+gH2gwYju0y6Lbbzd/0xxLlh1jTWMUW9mBuihIvXlRxE/Y/bOSh0OW0GRq+Dd
         /+Eyg+6DcuJ3A==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1o3Yth-0005jl-2M; Tue, 21 Jun 2022 10:06:05 +0200
Date:   Tue, 21 Jun 2022 10:06:05 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        =?utf-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Subject: Re: [PATCH] USB: serial: pl2303: Modify the detection method of
 PL2303HXN (TYPE_HXN)
Message-ID: <YrF77b9DdeumUAee@hovoldconsulting.com>
References: <20220617133514.357-1-charlesyeh522@gmail.com>
 <YrBARs5dfARHW9Rl@hovoldconsulting.com>
 <CAAZvQQ4iHB44=Ug7o+=ZqzTCYSM3igSwfi1xBUGqJS1ChzcbUw@mail.gmail.com>
 <YrBq3+Q4geN0bF5x@hovoldconsulting.com>
 <CAAZvQQ4xy+YSuEipRX=bLXJVKtS2qExOBER3QH3BJw_ATYdXuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAZvQQ4xy+YSuEipRX=bLXJVKtS2qExOBER3QH3BJw_ATYdXuw@mail.gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 21, 2022 at 12:41:39PM +0800, Charles Yeh wrote:
> > Ok, but the above could be handled with two entries or if needed we can
> > just check the major number (i.e. the MSB, 0x03)?
> 
> No , MSB:0x03 represents the HXN_GT (PL2303GT) version,
> but the current HXN version has multiple IC types,
> for example, the bcdDevice_MSB of HXN_GS uses 0x60.

That's precisely what I was referring to.
 
> HXN_GS: PL2303GS_R4 : idProduct : 0x23F3, bcdDevice: 0x0600
> HXN_GS: PL2303GS_R5 : idProduct : 0x23F3, bcdDevice: 0x0605
> HXN_GS: PL2303GS_R5+ : idProduct : 0x23A3, bcdDevice: 0x0605
> 
> The difference between R4 and R5 is that bcdDevice is a different set value.
> The difference between R5 and R5+ is that idProduct is a different set value.
> But PL2303GS_R4 / PL2303GS_R5 / PL2303GS_R5+ all represent HXN_GS chip.

Right.

> > So far I've gathered that
> >
> >         0x100   GC
> >         0x105   GC
> >         0x300   GT / TA
> >         0x305   GT
> >         0x405   GL
> >         0x500   GE / TB
> >         0x605   GS
> >
> > So it look like we could use the major version number.
> >
> > Anything more we need to add to the above list?
> 
> Currently there are HXN ICs on the market:
> PL2303GC : 0x0100 / 0x0105
> PL2303GT : 0x0300 / 0x0305
> PL2303GL : 0x0400 / 0x0405
> PL2303GE : 0x0500 / 0x0505
> PL2303GS : 0x0600 / 0x0605
> PL2303GR : 0x0700 / 0x0705

Thanks for filling in the blanks.

> I think it is not very good to add the above bcdDevice to the list.
> 
> Because the company's PM/Sales are still planning some HXN ICs
> (these ICs will be sold according to market behavior in the future,
> and there will be different bcdDevices: 0x0800 / 0x0805/ 0x0900 / 0x0905.....).
> so in the future Time, it will become to add different bcdDevice values
> from time to time, which will become the patch file is always updated.

That's no problem. We'd be happy to add support for any new types as
well.

It's much easier to get this right from the start than to try to
retrofit it when you realise that you need it (e.g. as we had to do with
the older types).

> In the current newest Linux driver program design,
> using bcdUSB (0x0100 / 0x0200) as a judgment.
> I hope that when bcdUSB==0x0200 is encountered,
> I only need to judge whether it is PL2303TA/PL2303TB chip,
> and the rest is to use HX_Status to judge whether it is HXN_TYPE chip.

I understand, and that would be enough to detect HXN, but not the
individual HXN types which is what I want to do.

> There is no need to use bcdDevice one by one to determine which HXN_TYPE
> (PL2303GC, PL2303GT....)
> 
> At present, if our customers need special functions or
> chip version control in HXN_TYPE IC ,
> we will provide special customized files or patch files

That's not a practice I would recommend, it's better that you add proper
support to the mainline driver so that all users can benefit.

I'm sure your customers would prefer to use a mainline driver as well.

> General customers only need to identify as HXN_TYPE on Linux OS.

I'm afraid I don't agree with that.

I'll prepare a patch that adds support for the missing HXN types.

Johan

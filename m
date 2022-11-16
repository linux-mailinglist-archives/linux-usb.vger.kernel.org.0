Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 435D162B47F
	for <lists+linux-usb@lfdr.de>; Wed, 16 Nov 2022 09:05:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232908AbiKPIFn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Nov 2022 03:05:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232859AbiKPIFk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Nov 2022 03:05:40 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7356F60CF
        for <linux-usb@vger.kernel.org>; Wed, 16 Nov 2022 00:05:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 9945CCE19DE
        for <linux-usb@vger.kernel.org>; Wed, 16 Nov 2022 08:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E41C433C1;
        Wed, 16 Nov 2022 08:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668585935;
        bh=KsvBR1K/gGp40k/jwBJC54/tP3gUZiwGcPQGPQMXs2s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q4UER1tc2cBZ8in37eRiScftKKtuKQGrilA9ue0AgwXWIh2UuOPQveMecf9PpM2eM
         yIlvervL22XypCJ0eaAiIC2NFxXKIXWCq5WWlIdSPUEJG+VubKrL/OkRNU5laFTcb/
         y7mJWtBEl50985ybvzhbyCOG3ZSpq/LmoLsqmuLVfnsYVdXWMSQO+x2tPM2b4QgXW2
         mg6U7RLO+XiH9jqiBxpdQQO3KaB+iSDelQdTMCOKH9jkapdZb39T7weaItdLFf8hh5
         f23fV+CvTTZG39CVQbb9JQA5ozALHg9YDj+M5waK3PeKJQl0d+X4Layl+SXD5+xKUd
         SEj0Exn/U6r6w==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ovDPt-0003nO-K1; Wed, 16 Nov 2022 09:05:05 +0100
Date:   Wed, 16 Nov 2022 09:05:05 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Davide Tronchin <davide.tronchin.94@gmail.com>
Cc:     cesare.marzano@gmail.com, gregkh@linuxfoundation.org,
        larsm17@gmail.com, linux-usb@vger.kernel.org,
        marco.demarco@posteo.net
Subject: Re: [PATCH v5 1/3] USB: serial: option: remove old LARA-R6 PID
Message-ID: <Y3SZsdUk1L9v6SUs@hovoldconsulting.com>
References: <Y3NmKk0Xte04qxwS@hovoldconsulting.com>
 <20221115164654.38632-1-davide.tronchin.94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221115164654.38632-1-davide.tronchin.94@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 15, 2022 at 05:46:54PM +0100, Davide Tronchin wrote:
> My apologies, this is my first attempt to submit a patch to the kernel
> community.
> 
> > We've asked you repeatedly whether you for u-blox or not, but you keep
> > ignoring this question. Knowing this would allow us to better evaluate
> > the reasoning and motivation behind this this change.
> 
> Yes, i am a u-blox employee and i've been asked to integrate LARA-L6 in
> the linux kernel and update the current code for LARA-R6 00B (updating
> the PID from 0x90fa to 0x908b).

Thanks. Was it it also a colleague of yours that submitted the initial
PID then?

> > The above commit message still does not explain why you want to remove
> > it and whether it would be safe to do so. Why was added in the first
> > place? What u-blox products used the old PID?
> 
> The first prototype of LARA-R6 00B had 0x90fa PID but, just before the
> product finalization, it has been decided to adopt a new USB composition
> and consequently a change of PID was necessary.
> The 0x90fa PID has been used only for some internal prototypes, hence
> no u-blox products with that PID have been shipped to customers.
> As pointed out in the discussion, the 0x90fa PID is used by other module
> vendors which sell Qualcomm based modems, hence i proposed to remove the
> association between u-blox (thedefine UBLOX_PRODUCT_R6XX) and 0x90fa,
> moving it directly in the option_ids array.

Thanks, this is the kind of details we've been asking for. Please put
some of this in the commit in some form so that it is obvious from just
reading the commit message that the patch is correct and safe to apply.

Make sure to mention that this Qualcomm PID is used by other products
and that's why you're leaving it in. Perhaps a Link tag with a
reference to Lars message pointing this out is in place. For example:

Link: https://lore.kernel.org/all/6572c4e6-d8bc-b8d3-4396-d879e4e76338@gmail.com/

> > By just removing the define this is less of an issue, but you should
> > not make the life of reviewers harder by ignoring request to properly
> > motivate your changes and explain why they are safe to apply.
> 
> My apologies again, thanks for the patience.
> 
> > You can either put a shared changelog for the whole series in a cover
> > letter, or you describe changes to each individual patch. But mixing the
> > two styles as you do in this entry is just confusing.
> 
> Thanks for the suggestions. In order to simplify the submission process,
> i propose to split the submission for the LARA-L6 patches and the update
> for LARA-R6 00B.
> Do you think could it be feasible?

I don't think that's necessary now that you've provided some more
details. Just respin the series and address the review comments given
so far (either by rejecting a suggestion and explaining why, or by
incorporating it in your next submission).

It seems you only need to tweak some of the commit messages in a v6.

Johan

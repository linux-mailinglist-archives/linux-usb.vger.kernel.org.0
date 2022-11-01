Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0502D615549
	for <lists+linux-usb@lfdr.de>; Tue,  1 Nov 2022 23:51:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbiKAWvD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Nov 2022 18:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiKAWvB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Nov 2022 18:51:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3060813F0F
        for <linux-usb@vger.kernel.org>; Tue,  1 Nov 2022 15:51:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C06986173D
        for <linux-usb@vger.kernel.org>; Tue,  1 Nov 2022 22:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0786CC433D6;
        Tue,  1 Nov 2022 22:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667343060;
        bh=P8BLGo/8kDNCQGzu6cUA23fW6trjCvcGb4vCtJgAwL8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P13UMZVNNNKq7IUW7tl2ToG7rOVnZBhdB6VnfT2iDj182VNEGS01mddngY2+fEY1q
         fiELfn022IBaDHV367hOZP19jN2BjrW7FZrN1zvjUe9dVjGu4bjd0A+dlK0MRXUtdE
         MtLcuRBhGPBSHxC/h80OhULddCd7PfVVYr1NUPHMZd9W3dKChBuC6Gkgb2hBAbCsCE
         CkOGrNDwHajQFTwED39ode+jpCvXmzEpo3PGdKNQSxdChk9Lwn/b8rF/llDR5Lq4O+
         7zu+FmSxgFMsAf6q/9wHmukMRinWZi3Zz8G0gdSjKPiRYJhHD6AwJ+edq8x5HjBHyB
         zwpZR/3/mQo6Q==
Received: by pali.im (Postfix)
        id 3E0377F8; Tue,  1 Nov 2022 23:50:57 +0100 (CET)
Date:   Tue, 1 Nov 2022 23:50:57 +0100
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 3/7] USB: serial: ftdi_sio: Extract SIO divisor code
 to function
Message-ID: <20221101225057.2i2rsh5latrvn4au@pali>
References: <20220924102718.2984-1-pali@kernel.org>
 <20220924102718.2984-4-pali@kernel.org>
 <Yy7gKiMOtYYiW/oe@kroah.com>
 <20221009121707.4o3fjxnec3u4mktz@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221009121707.4o3fjxnec3u4mktz@pali>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sunday 09 October 2022 14:17:07 Pali Rohár wrote:
> On Saturday 24 September 2022 12:47:06 Greg Kroah-Hartman wrote:
> > On Sat, Sep 24, 2022 at 12:27:14PM +0200, Pali Rohár wrote:
> > > In preparation for following changes,
> > 
> > What do you mean by "following changes"?  That doesn't work well when
> > looking in a changelog series.  Spell out what you are going to do in a
> > future change, as to why this is necessary.
> > 
> > thanks,
> > 
> > greg k-h
> 
> Ok. Anything else is needed to address?

Ping?

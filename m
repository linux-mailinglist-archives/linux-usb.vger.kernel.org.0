Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 668C563973D
	for <lists+linux-usb@lfdr.de>; Sat, 26 Nov 2022 17:29:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbiKZQ3h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 26 Nov 2022 11:29:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiKZQ3g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 26 Nov 2022 11:29:36 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53091CFCE
        for <linux-usb@vger.kernel.org>; Sat, 26 Nov 2022 08:29:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 53DEC60B58
        for <linux-usb@vger.kernel.org>; Sat, 26 Nov 2022 16:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93AC0C433C1;
        Sat, 26 Nov 2022 16:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669480174;
        bh=lxO1o5qcWurII5xo529jSiw5+EgVFYJ6PXT+Y0VQbYY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X8pOaTJY8sBIm6a1aFPbkJfaA2SAuS3Usz730mULLAFtYyv8Jaf+BfkAYVRMwQfCz
         61Np1R+/Wa8lRjZ+MYCnQIy9yDgNdzY4YWoCUL7sLpwUfL7HOZGFDqNESzwQ1oJppV
         1l0oPtcZzdV/6bp2FcLolnDxNacckrIta9DFo0GdvH1xkuez1Gggq2EDltOkP4O/lN
         WlD5QeYn6RkMx+LM08+OCewz6g0BpW5+eYEo0gR1xQn9hGxLgPPktIs7/6TVRH5HgO
         37bVmNAY58ZFXNy6lvJ4fZwk90aWuYqvBo9Oe8TnqmHVvTLR1CK1pSWSJ6oHYyGLT/
         4UHoKCGTuBeEw==
Received: by pali.im (Postfix)
        id 3331F7B2; Sat, 26 Nov 2022 17:29:32 +0100 (CET)
Date:   Sat, 26 Nov 2022 17:29:32 +0100
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 3/7] USB: serial: ftdi_sio: Extract SIO divisor code
 to function
Message-ID: <20221126162932.nww4srbf3iydybyj@pali>
References: <20220924102718.2984-1-pali@kernel.org>
 <20220924102718.2984-4-pali@kernel.org>
 <Yy7gKiMOtYYiW/oe@kroah.com>
 <20221009121707.4o3fjxnec3u4mktz@pali>
 <20221101225057.2i2rsh5latrvn4au@pali>
 <Y2HMRrSW0UahOyPB@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y2HMRrSW0UahOyPB@kroah.com>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wednesday 02 November 2022 02:47:50 Greg Kroah-Hartman wrote:
> On Tue, Nov 01, 2022 at 11:50:57PM +0100, Pali Rohár wrote:
> > On Sunday 09 October 2022 14:17:07 Pali Rohár wrote:
> > > On Saturday 24 September 2022 12:47:06 Greg Kroah-Hartman wrote:
> > > > On Sat, Sep 24, 2022 at 12:27:14PM +0200, Pali Rohár wrote:
> > > > > In preparation for following changes,
> > > > 
> > > > What do you mean by "following changes"?  That doesn't work well when
> > > > looking in a changelog series.  Spell out what you are going to do in a
> > > > future change, as to why this is necessary.
> > > > 
> > > > thanks,
> > > > 
> > > > greg k-h
> > > 
> > > Ok. Anything else is needed to address?
> > 
> > Ping?
> 
> We have no idea, sorry, as we have no context here at all and it was
> thousands of patches ago in our reviews.  Please just fix things up
> based on this review and resubmit, you never need to ask.
> 
> greg k-h

It was already done in v3 and it contains only 7 patches, not thousands.

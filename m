Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42DC3615724
	for <lists+linux-usb@lfdr.de>; Wed,  2 Nov 2022 02:47:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbiKBBrB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Nov 2022 21:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbiKBBrA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Nov 2022 21:47:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2DB8205C5
        for <linux-usb@vger.kernel.org>; Tue,  1 Nov 2022 18:46:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 804A0617A7
        for <linux-usb@vger.kernel.org>; Wed,  2 Nov 2022 01:46:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED83C433B5;
        Wed,  2 Nov 2022 01:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1667353617;
        bh=64GStF0rcxqcPiqEiyKdCqwPGvJnnT36MzMtAUgltd4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K9VV1bkOtS2FQQGcQssteqpOpnISYad1hLV43zGTOsdAR42IFBmZRlvFlahYSbvL+
         WcKLHtFK6eVQ0+igIo1lkowUumYiYB5N8jsDMF0MzCI4hmSkDTB1QFzQyh2LXpsfqE
         b3ZbwKXahSlCv8wn3JMURrKl4Cm3UzDpyPkmPyUc=
Date:   Wed, 2 Nov 2022 02:47:50 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
        Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 3/7] USB: serial: ftdi_sio: Extract SIO divisor code
 to function
Message-ID: <Y2HMRrSW0UahOyPB@kroah.com>
References: <20220924102718.2984-1-pali@kernel.org>
 <20220924102718.2984-4-pali@kernel.org>
 <Yy7gKiMOtYYiW/oe@kroah.com>
 <20221009121707.4o3fjxnec3u4mktz@pali>
 <20221101225057.2i2rsh5latrvn4au@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221101225057.2i2rsh5latrvn4au@pali>
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 01, 2022 at 11:50:57PM +0100, Pali Rohár wrote:
> On Sunday 09 October 2022 14:17:07 Pali Rohár wrote:
> > On Saturday 24 September 2022 12:47:06 Greg Kroah-Hartman wrote:
> > > On Sat, Sep 24, 2022 at 12:27:14PM +0200, Pali Rohár wrote:
> > > > In preparation for following changes,
> > > 
> > > What do you mean by "following changes"?  That doesn't work well when
> > > looking in a changelog series.  Spell out what you are going to do in a
> > > future change, as to why this is necessary.
> > > 
> > > thanks,
> > > 
> > > greg k-h
> > 
> > Ok. Anything else is needed to address?
> 
> Ping?

We have no idea, sorry, as we have no context here at all and it was
thousands of patches ago in our reviews.  Please just fix things up
based on this review and resubmit, you never need to ask.

greg k-h

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A86FF600617
	for <lists+linux-usb@lfdr.de>; Mon, 17 Oct 2022 07:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbiJQFAA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Oct 2022 01:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiJQE76 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Oct 2022 00:59:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9772422BCE
        for <linux-usb@vger.kernel.org>; Sun, 16 Oct 2022 21:59:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0E2AA60F1F
        for <linux-usb@vger.kernel.org>; Mon, 17 Oct 2022 04:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F26C433B5;
        Mon, 17 Oct 2022 04:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1665982795;
        bh=9n9BSafbtWdmvezewSUCvfFe4FZBE+gZsi7g8pEShi8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UbSdFRNg6hg5z6YYB+jSEqJ7w6dEll/JRNeICXEGczfphFd4klT7uceka9w2efTjY
         C44yxSezRhUKJYMFFZ+Ov0l5bsz8RlF6btedk5V/C3vV8LKigHATElm3RopZzaGnAY
         SjzlXRq+F2SwxUXF7RSM0qIlWLBCqqHSUo1v9W2w=
Date:   Mon, 17 Oct 2022 07:00:40 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     James <bjlockie@lockie.ca>
Cc:     linux-usb@vger.kernel.org
Subject: Re: is usb.ids used anymore?
Message-ID: <Y0zheI+RSeLNulpx@kroah.com>
References: <8526b38d-64b2-05b0-48e5-a54936f6332f@lockie.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8526b38d-64b2-05b0-48e5-a54936f6332f@lockie.ca>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Oct 16, 2022 at 08:02:59PM -0400, James wrote:
> I am trying to get usb.ids updated.
> 
> There is a link to here:
> http://www.linux-usb.org/usb-ids.html
> 
> It says the text file is updated daily but the last update was Version:
> 2022.05.20.

Maybe that's just the last update that was needed.

> Is that file even used anymore?
> 
> I did the web update and I sent a diff -u to linux.usb.ids@gmail.com

The web form should work, did you try that?

> but I didn't receive a confirmation to the email and the ids show up in the
> web interface but there are no names associated.

What do you mean by this?

> The link to the maintainer is no longer valid. :-(

What link?

> Wouldn't it be easier to keep in a github if it is still used?

Why is github easier?

And yes, it is still used, the hardware database ids in
/lib/udev/hwdb.d/ on your system is based on it.

thanks,

greg k-h

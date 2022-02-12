Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 550904B338C
	for <lists+linux-usb@lfdr.de>; Sat, 12 Feb 2022 08:17:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232371AbiBLHRP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 12 Feb 2022 02:17:15 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbiBLHRO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 12 Feb 2022 02:17:14 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3024EB8
        for <linux-usb@vger.kernel.org>; Fri, 11 Feb 2022 23:17:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C4465B817A3
        for <linux-usb@vger.kernel.org>; Sat, 12 Feb 2022 07:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1D1BC340E7;
        Sat, 12 Feb 2022 07:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1644650229;
        bh=hZHem90BX3Thr0I+3S79fHgr4sKgW8xpMIczSoCJYZQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g9Deft9/9RjNMiVmAg/zvkzdbTJ7vIIyJ2Xrvvf61NT0Mo5mu/fw+TYaAMx2WNqxM
         DcHKUoGO0oSothJwF4TalszeaVMKRwNlE9kEqWC1b8AGFoZCMwi5/EXSoXJW6qtoSU
         fIWDFTRi+nIi5pabMUFIiR05nOFHEci0K6M1svmw=
Date:   Sat, 12 Feb 2022 08:17:02 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Ingo.Rohloff@lauterbach.com" <Ingo.Rohloff@lauterbach.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 1/1] usb: gadget: f_fs: Support zerocopy transfers via
 mmap.
Message-ID: <Ygde7hP9EtrA8tny@kroah.com>
References: <YgZCW2hV8e10kGfe@kroah.com>
 <1043-6206bd00-1-213dc380@137639204>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1043-6206bd00-1-213dc380@137639204>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 11, 2022 at 08:47:01PM +0100, Ingo.Rohloff@lauterbach.com wrote:
> Hello Greg,
> 
> On Friday, 11 February, 2022 12:02 CET, Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > On Wed, Feb 09, 2022 at 06:25:07PM +0100, Ingo Rohloff wrote:
> > > This patch implements the same functionality for FunctionFS as
> > > commit f7d34b445abc00e979b7 ("USB: Add support for usbfs zerocopy.")
> > > did for USB host devio.c
> > > ...
> >
> > No documentation of the new mount option here?
> > It should go somewhere, right?
> 
> You are of course right :-).
> But: Do you have any suggestions where to put it?

Where are other filesystem mount options listed?

> I just searched the "Documentation/" directory, but so far I haven't found
> any  description about the mount options available for FunctionFS
> (including the not so obvious "no_disconnect" option).

What about in Documentation/usb/functionfs.rst?

> Of course I can put some minimal description of the mount option
> in the commit message itself; but I think that's not really useful?

It is better than nothing :)

> So maybe it makes more sense to in general write more about FunctionFS.
> The whole mmap mechanism also might need a description somewhere.
> I have some test code here:
>   https://github.com/trace32/test_usb_ffs
> I can also provide that as a patch (with sign-off) , for example under 
>   tools/usb/ffs-aio-example
> (there already is some test code there).

Yes, test code would be great, can you add it to the self-test
framework?

> Would this make sense to you?  I guess that would make more sense as an
> extra patch; at least as an extra commit?

Yes, a patch series would be good.

thanks,

greg k-h

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F4634AD9F3
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 14:34:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347564AbiBHNeg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Feb 2022 08:34:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244856AbiBHNeb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 08:34:31 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44EA9C03FECE
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 05:34:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D44CB61772
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 13:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C570FC004E1;
        Tue,  8 Feb 2022 13:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1644327270;
        bh=+rjcny99FKVkUzx4YFp88+hReSpFEJH+/00VXhRIg0Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vy+oR2cEaAbCICRl0YPQYlXp/4XoCet8+1DwSuWvOJlFzK98jsTYIYm8yusURnhT6
         H8CWqpV/a3XumU6eXVSSK3VoQLqwKK6foK2utQsiAUTc9iu2mYOaNVu1kN/tq5ag4C
         t3hU0N2rdhmTGUMFw4D96/0t5gzR5KsjkVDPZtNg=
Date:   Tue, 8 Feb 2022 14:34:27 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: core: use sysfs_emit() instead of sprintf()
Message-ID: <YgJxYxH9S/wiNPEp@kroah.com>
References: <4248804f-d9eb-5e00-563f-28815cd42b65@omp.ru>
 <YgJSI8gbhKeVkgi3@kroah.com>
 <fe7888bd-5181-c4fe-3cee-7baec3d6ac71@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe7888bd-5181-c4fe-3cee-7baec3d6ac71@omp.ru>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 08, 2022 at 02:49:37PM +0300, Sergey Shtylyov wrote:
> On 2/8/22 2:21 PM, Greg Kroah-Hartman wrote:
> 
> >> sprintf() (still used in the USB core for the sysfs output) is vulnerable
> >> to the buffer overflow.
> > 
> > Really?  Where?  If we have potential overflows, let's fix them as bug
> > fixes and properly backport the fixes where needed.
> 
>    I must admit I didn't found any real overflows in my quick triage...

Then please do not scare people by saying otherwise.

> 
> > If these really are just using the "old-style" functions instead, then
> > that's something totally different and you should not say "vulnerable"
> > if it really is not at all.
> 
>    Isn't sprint() generally considered harmful? :-)

For sysfs files that have a known size (PAGE_SIZE) with a single value
like this, no, it's not harmful.

> >> Use the new-fangled sysfs_emit() instead.
> >>
> >> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
> >> analysis tool.
> > 
> > You mean coccinelle, right?
> 
>    Do you think coccinelle is the only code analyzer in this world? :-)

No, but it has a built-in rule for this already, why not just use that
to find these types of things?

>    I told you I was using SVACE (made by Russian Institute of the System Programming).

Nice, where is the rule for this with that tool?

thanks,

greg k-h

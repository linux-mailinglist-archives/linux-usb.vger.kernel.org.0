Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F15778D8F8
	for <lists+linux-usb@lfdr.de>; Wed, 30 Aug 2023 20:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234137AbjH3SbL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Aug 2023 14:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243482AbjH3LMK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Aug 2023 07:12:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97350CC9
        for <linux-usb@vger.kernel.org>; Wed, 30 Aug 2023 04:12:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 35C7162828
        for <linux-usb@vger.kernel.org>; Wed, 30 Aug 2023 11:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F73C433C7;
        Wed, 30 Aug 2023 11:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1693393926;
        bh=KWfZcU7AHumv8OyiKX90Nk812YENQ8tGUR6pOhLexCM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DOuf+6WoL33WZ4k0e4+6ad1/t8ovt7ngDPCFE+/e5UQodb3CsnyuzYpCnLrZP7tuH
         5do1973bkVgGY3FhFEBCIKmRhgwO1Vn5S0/uKfT8BYKUOYHNkHfaPtehl096XIWFNH
         b1FBiAtInUpyGHfOR5BxCykydJyU0JU7ptP8D8qg=
Date:   Wed, 30 Aug 2023 13:12:03 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        linux@roeck-us.net, kernel@collabora.com
Subject: Re: [PATCH] usb: hub: Guard against accesses to uninitialized BOS
 descriptors
Message-ID: <2023083048-armrest-subtype-9b6b@gregkh>
References: <20230830100418.1952143-1-ricardo.canuelo@collabora.com>
 <2023083007-vowed-latitude-acef@gregkh>
 <87cyz4hjzq.fsf@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cyz4hjzq.fsf@collabora.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 30, 2023 at 01:01:29PM +0200, Ricardo Cañuelo wrote:
> Re-sending the email, the previous one was bounced, sorry for the noise.
> 
> Hi Greg, thanks for reviewing.
> 
> On mié, ago 30 2023 at 12:13:44, Greg KH <gregkh@linuxfoundation.org> wrote:
> > Did you mean to loose the indentation here?
> 
> This output has probably gone through some processing before I got it,
> so that's likely the cause. I don't have access to the original output,
> sorry. If I need to fix something for a v2 I can try to re-format it to
> add the indentation back in.
> 
> > What commit id does this fix?
> 
> This isn't linked to a particular single commit, it fixes the same
> problem in different parts of the code, introduced by different commits
> over time. The starting point for the fix was the crash output in the
> commit message but, for additional context, these are the original
> commits that introduced the unguarded struct accesses:
> 
>   0cdd49a1d1a4 ("usb: Support USB 3.1 extended port status request")
>   51e0a0120661 ("USB: Calculate USB 3.0 exit latencies for LPM.")
>   25cd2882e2fc ("usb/xhci: Change how we indicate a host supports Link PM.")
>   0299809be415 ("usb: core: Track SuperSpeed Plus GenXxY")
>   ae8963adb4ad ("usb: Don't enable LPM if the exit latency is zero.")

As all of these are older than the oldest supported LTS kernel, we
should be fine in taking it all the way back to 4.14.y then.

I'll queue this up after 6.6-rc1 is out, thanks.

greg k-h

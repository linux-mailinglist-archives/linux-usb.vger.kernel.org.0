Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11FE5551130
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jun 2022 09:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239105AbiFTHPe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jun 2022 03:15:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238339AbiFTHPd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jun 2022 03:15:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0589FE09F
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 00:15:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8F0236112B
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 07:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F00BDC3411B;
        Mon, 20 Jun 2022 07:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655709332;
        bh=DvXckEIO0TOpl+gDFMrw9jTB05X6DR2HXm0uugKNZ9Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kY8k8A4HQDyXkit7vCPZEMPY518lyHGSPm8N9CtQZBEnfVq+UVF4h19RvztkmzSkQ
         8m9+l2FfiDYuvAgUCirkT0Iy2LvatUvo3zzK5sk9dkvamD97WppNF/GbLEG3I4j89a
         IcZoSqaWuVpz2Nlsxta9tIRhHiYsdZgtL6ZeI6mGG38a5jgLg5O0JVgzhCdgYoHFDS
         egoqSxhGUiy38mSL8jecpUD6S1dkgqgJEVQIhiOGpY/I4FrXWvNn0AnNY3UXPsoqx+
         S2W5gxAVv9RejyQu4c+cPycRsrYpHUvQkwomOPhAHba6bpl8o5Z2Zhv64KLOGYKaGg
         lp2tP+u3LFMjQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1o3Bd9-0003Ji-Bh; Mon, 20 Jun 2022 09:15:28 +0200
Date:   Mon, 20 Jun 2022 09:15:27 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Giles Roadnight <giles.roadnight@gmail.com>
Cc:     glance@acc.umu.se, linux-usb@vger.kernel.org
Subject: Re: pl2303 converter detected, unknown device type
Message-ID: <YrAej8OuOC2lvmb6@hovoldconsulting.com>
References: <CAA0uCUZSVmAijR8VkkCbW4nEVo=v__U_sjB0UVSbNQsgPKTxrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA0uCUZSVmAijR8VkkCbW4nEVo=v__U_sjB0UVSbNQsgPKTxrA@mail.gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jun 19, 2022 at 10:10:37AM +0100, Giles Roadnight wrote:
> Was there ever any resolution to this? I am having the same issue and
> have tried multiple combinations of different Raspberry pi os and pi
> and get the same issue.
> 
> Johan - did you add support for this model? If so how to update to the
> latest version so that I can use this usb device?

You appear to have a different device than the one Anton reported (e.g.
PL2303GS instead of PL2303GC), but the fix is similar and was
merged in March as I just mentioned in my other mail.

> (forgive the basic questions, I am not very experienced with linux so
> don't know what bit I need to update to get the latest usb drivers -
> or whatever it is you updated)

Just make sure you update to a recent mainline or stable kernel (e.g.
5.17.2, 5.16.19, 5.15.33 or newer) or wait until your distro kernel
catches up.

The commit you need is

	5b6ab28d0678 ("USB: serial: pl2303: fix GS type detection")

if you want to report it to the distro.

Johan

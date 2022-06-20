Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74BE95510F4
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jun 2022 09:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239071AbiFTHF6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jun 2022 03:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234071AbiFTHF4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jun 2022 03:05:56 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D5010C1
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 00:05:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D9604B80B95
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 07:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ACFDC3411B;
        Mon, 20 Jun 2022 07:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655708752;
        bh=+cMY8xDMMNKj/qIgNnHzk/hMjKgTjNLocSCf1Q17nS4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Yx8deinQn0mz5fvz2KT9Nm9Bqs9Cl/xxV6oNZMlp2acQITsDfq77Fjrypu0jvMwMz
         +aA8ePdmSaeOxKTPCK/5poMFGBLUrxh7J3aRcjgb+HOXpUj92d8ToEvNUKMG+o4gUK
         KpkSJWJQbaL1NJOQ3WPQuyQmLuUE7+E1s4lWf2PAygETESQ6PaqwPZ6XCsiIZdMqy/
         9XKGeuh/7/fcbE1cEYAmgziph8/Chtytlm5MMHZkXCSeRzJAhuFJ2QFc5yOzYZbsdQ
         yhNxa9ZlLh7YwJCCrf4mTalGFxJPHCwKas2QoAPyHrLPRn5Tnu5rtf5SpC2HdgsVvU
         YxVVq8dSIwpSA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1o3BTo-0003Dl-Iu; Mon, 20 Jun 2022 09:05:48 +0200
Date:   Mon, 20 Jun 2022 09:05:48 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Giles Roadnight <giles.roadnight@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Prolific Technology pl2303: unknown device type
Message-ID: <YrAcTDCnEiipWEM3@hovoldconsulting.com>
References: <CAA0uCUZV0Jdc5HJnPg=Rqv06+UVYAudbx5qUNOatE9ZZsP6vsA@mail.gmail.com>
 <CAA0uCUYnMjJxdsxjue3zD2-LZkJbg3imckTrV=4VakPMchdLWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA0uCUYnMjJxdsxjue3zD2-LZkJbg3imckTrV=4VakPMchdLWg@mail.gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jun 18, 2022 at 07:42:43AM +0100, Giles Roadnight wrote:
> Hi
> 
> I am trying to connect a Prolific pl2303 to my raspberry pi 4 running
> raspberry pi os 64 bit. When I look at dmesg I get the following
> output:
> 
> [ 31.714397] cam-dummy-reg: disabling
> [ 44.046197] usb 1-1.1: USB disconnect, device number 3
> [ 47.254348] usb 1-1.1: new full-speed USB device number 4 using xhci_hcd
> [ 47.361386] usb 1-1.1: New USB device found, idVendor=067b,
> idProduct=23a3, bcdDevice= 6.05
> [ 47.361402] usb 1-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [ 47.361407] usb 1-1.1: Product: USB-Serial Controller
> [ 47.361412] usb 1-1.1: Manufacturer: Prolific Technology Inc.
> [ 47.361417] usb 1-1.1: SerialNumber: ALBAb115819
> [ 47.364081] pl2303 1-1.1:1.0: pl2303 converter detected
> [ 47.364106] pl2303 1-1.1:1.0: unknown device type, please report to
> linux-usb@vger.kernel.org
> 
> so I followed the example and emailed this address!
> 
> and with lsusb:

This has been fixed in mainline and backported to the relevant stable
trees (5.17.2, 5.16.19, 5.15.33) at the beginning of April.

You didn't mention which kernel you use, but updating to a more recent
one should fix this.

Johan

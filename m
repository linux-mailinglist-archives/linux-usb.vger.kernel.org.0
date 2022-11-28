Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA6C363AE6C
	for <lists+linux-usb@lfdr.de>; Mon, 28 Nov 2022 18:06:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231959AbiK1RGf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Nov 2022 12:06:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232833AbiK1RGQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Nov 2022 12:06:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33F2D27B29
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 09:05:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E3EA5B80DFA
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 17:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7AC4C433D7;
        Mon, 28 Nov 2022 17:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669655141;
        bh=JUmi37l0f2opHR7U0mwCeXKfUPXwT93KU8EOut4cOX8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b8hx/9LAiKrkefaDMvw5kwSpBwtwBUUDrx+P+xvuMZCALMNi2TwXZnueyBU9gMKx1
         LkOgLz9ImGnNcW8U9J2KYQzXCeh2wi4h7nPwo9mGsGaKclBkRXXKCcgE5MTLbcv0dx
         2WHMS7DcqWRFun9xO1iJuBvmW3DGcAZ0XqHGY1q+i5FwiK4xTGaBP4DYd4l5h33xS7
         c41/1Lym1+EJjpAjA7DK9cPvXwaKd6nccFVjXFgw/+lip1OyiZeh6nRpqK4f2F5WvQ
         6L8sCzNE7iGqF/k4dTLBCLDdHScVvWxykHDNmp+K2ad5n0QZwHgHy6KMB75vadXLPP
         LnsnqfT8ZntYg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ozhZb-0008B0-L9; Mon, 28 Nov 2022 18:05:39 +0100
Date:   Mon, 28 Nov 2022 18:05:39 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 6/7] USB: serial: ftdi_sio: Fix custom_divisor for
 TIOCGSERIAL and c_*speed for TCGETS2
Message-ID: <Y4TqYyPOVV+oD7HO@hovoldconsulting.com>
References: <20220924102718.2984-1-pali@kernel.org>
 <20220924102718.2984-7-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220924102718.2984-7-pali@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Sep 24, 2022 at 12:27:17PM +0200, Pali Rohár wrote:
> When ASYNC_SPD_CUST is used, update custom_divisor field for TIOCGSERIAL
> and c_*speed fields for TCGETS2 so that they correspond to the newly set
> baud rate value.
> 
> So userspace TCGETS2 ioctls in new c_*speed fields will see the true baud
> rate that is being used.
> 
> This is needed for switching userspace applications to use TCGETS2 API as
> currently new c_*speed fields does not report correct values. Without this
> change userspace applications still have to use old deprecated TIOCGSERIAL
> to retrieve current baud rate.

Still no. Not happening.

We should not try to determine the rates used when setting (hardware)
divisors directly through the deprecated SPD_CUST hack. Serial core
does not do so for a reason, including that you can set 38400 once and
then fiddle around with setserial all you want without the magic value
changing.

USB serial regressed at one point by starting to report back the rate it
would try to set. I left it in place because it took a fair while before
anyone noticed and no one should be using this interface anyway.

But if you try to generalise this, I'd rather fix that bug or just rip
this out completely.

Johan

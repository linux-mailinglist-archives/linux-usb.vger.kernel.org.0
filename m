Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36B6763ABA0
	for <lists+linux-usb@lfdr.de>; Mon, 28 Nov 2022 15:54:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbiK1Oyg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Nov 2022 09:54:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230501AbiK1Oyg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Nov 2022 09:54:36 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D1391F9C7
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 06:54:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3F15EB80DEB
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 14:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A76DC433C1;
        Mon, 28 Nov 2022 14:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669647273;
        bh=/4jWaqei5Ua+o90+fK2WRTx19aYP2NxPLNtcDi4DQQE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d22XUZdrpJuC0H7KwJm1Glu1HxcO7Z41MSKhmVDuUER0LA1xOUD4YuxGhyuIm3upt
         b2An8m2oq0tTSmagZqwoK5NMwXLqZPdtC/lhykIiirdRx0ND4mXwQ23pHdLrnE9Owm
         ft+Buu6c+bo7hRogZGFYo0dKrZ6RShSGu+xugMlIuSsaK0J/2zkiMV0CST6Q2am5zZ
         6o6nujqh6ZJf/714wwb6rNNxKLZkxIbUDkTAxE3FZGMctYQZEz7SSzh2hz4EYgfEQ1
         JpEEVZZvBqH/DWCkRiiCpVUe9W0xI2ANcMUKU7k6UqZYx1rw+O4LGu8lYHw3mKYl6d
         VmoQSwWpb7hwQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ozfWg-0002Oj-Q7; Mon, 28 Nov 2022 15:54:30 +0100
Date:   Mon, 28 Nov 2022 15:54:30 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 1/7] USB: serial: ftdi_sio: Fix divisor overflow
Message-ID: <Y4TLpi/M6/A+h1le@hovoldconsulting.com>
References: <20220924102718.2984-1-pali@kernel.org>
 <20220924102718.2984-2-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220924102718.2984-2-pali@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Sep 24, 2022 at 12:27:12PM +0200, Pali Rohár wrote:
> The baud rate generating divisor is a 17-bit wide (14 bits integer part
> and 3 bits fractional part).
> 
> Example:
>   base clock = 48 MHz
>   requested baud rate = 180 Baud
>   divisor = 48,000,000 / (16 * 180) = 0b100000100011010.101
> 
>   In this case the MSB gets discarded because of the overflow, and the
>   actually used divisor will be 0b100011010.101 = 282.625, resulting
>   in baud rate 10615 Baud, instead of the requested 180 Baud.
> 
> The best possible thing to do in this case is to generate lowest possible
> baud rate (in the example it would be 183 Baud), by using maximum possible
> divisor.

As I already commented on v2:

	Actually, the best way to handle this is to add a sanity check
	for the lowest supported check as you do in the next patch. That
	one makes this change superfluous.

> In case of divisor overflow, use maximum possible divisor.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Pali Rohár <pali@kernel.org>
> Tested-by: Marek Behún <kabel@kernel.org>
> Signed-off-by: Marek Behún <kabel@kernel.org>

And as I mentioned the other week, this SoB change is not correct as it
is you who are submitting these patches now and it's not clear whether
you intended that Marek should be attributed as co-author or not.

Johan

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8F0F4BE190
	for <lists+linux-usb@lfdr.de>; Mon, 21 Feb 2022 18:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351919AbiBUJym (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Feb 2022 04:54:42 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352121AbiBUJwv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Feb 2022 04:52:51 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53BDC369C0
        for <linux-usb@vger.kernel.org>; Mon, 21 Feb 2022 01:23:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E3522B80EBA
        for <linux-usb@vger.kernel.org>; Mon, 21 Feb 2022 09:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97521C340FB;
        Mon, 21 Feb 2022 09:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645435395;
        bh=GBXlz6C4MFXKmAKwLpDwWCjQ5X7yqCSN2uGtA2Tvmls=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GZSgE99SirUnJ0AdVuaZemkOsTxiSOiCoGJfetlCHSC/byT+9e/WcJPX6xIzNGbTj
         Jj3NZMxOyd/qUjvEuzuuK4LRBsKZLzvlTYpkr8qeHlaVUrZ6rz/E6LjHyM+/T+zlLO
         /Ho08cKbLw+O4zcwbJDf025MKJWWxht1Ou4wrAA22XkhnV8YXAm6XCMNHsukdOeHEc
         tLowSDWOYNrsKMhua08usNcOiI4m4Mu+Z751NFvKqMIHQgrYW9ZsiL8Zz4/zFFH5ev
         UutE5HhrNcz8GZKfDE/hwC9W3xz2QclrFxVKrKQISLypz7G4XX9yImOr9EH6L4B6CW
         jyKoCniwkO/dA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1nM4uW-00072m-Uj; Mon, 21 Feb 2022 10:23:13 +0100
Date:   Mon, 21 Feb 2022 10:23:12 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/1] USB: serial: option: add Telit LE910R1 compositions
Message-ID: <YhNaACfBD+Q1Dy9r@hovoldconsulting.com>
References: <20220218134552.4051-1-dnlplm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220218134552.4051-1-dnlplm@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 18, 2022 at 02:45:52PM +0100, Daniele Palmas wrote:
> Add support for the following Telit LE910R1 compositions:
> 
> 0x701a: rndis, tty, tty, tty
> 0x701b: ecm, tty, tty, tty
> 0x9201: tty
> 
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>

Applied, thanks!

Johan

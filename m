Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7FE45A4E10
	for <lists+linux-usb@lfdr.de>; Mon, 29 Aug 2022 15:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbiH2N3d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Aug 2022 09:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbiH2N3N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Aug 2022 09:29:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C48C77E81
        for <linux-usb@vger.kernel.org>; Mon, 29 Aug 2022 06:28:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DD160B81084
        for <linux-usb@vger.kernel.org>; Mon, 29 Aug 2022 13:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C1EC433C1;
        Mon, 29 Aug 2022 13:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661779711;
        bh=wba3UPzx58qMU7Hwi6Oa27r1k8ZoQcJuoGGDZRlJMd0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J0X03F1Cwvcl+3SACCVXeeBZcsiPhUYt3Q+9iOG/zdau//p/D2aC4XyCud7eJ70eG
         dWFidxloAzlE5kpobP9Mg0AvGHuvd9JgtqhzaKysyg9d4HJRQBYYhz6hN8va1FFfv1
         gV9i8EE30BEFoaI8lUYnj8BvfZcnf56QEnPNeSlc7zocbxJv//fwCVqQcHSbI6X8H8
         6WmIIHfaXV34gFqcjoU1nwFiJm+v2yIbnw0SykO1BYl6+Ujg+sfyMSX7XOGFXqdcTR
         L3Qb4INoVLIj6zR8lj16OnuRrJw6g83rTwH7SVayKzgFXckBOPel6hiDz3loKDJYa5
         B9B6xg9xb2qJA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oSeoh-0003WB-Kb; Mon, 29 Aug 2022 15:28:40 +0200
Date:   Mon, 29 Aug 2022 15:28:39 +0200
From:   Johan Hovold <johan@kernel.org>
To:     "niek.nooijens@omron.com" <niek.nooijens@omron.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Fw: Linux kernel patch for Omron CS1W-CIF31
Message-ID: <Ywy/B/znHCCLbWCK@hovoldconsulting.com>
References: <OS3P286MB149554090367DE82B0D687FFF69A9@OS3P286MB1495.JPNP286.PROD.OUTLOOK.COM>
 <YuorqOROzWlh8MY9@hovoldconsulting.com>
 <OS3P286MB1495F452606C51D673D2519DF69C9@OS3P286MB1495.JPNP286.PROD.OUTLOOK.COM>
 <OS3P286MB14959D8566969A709A50F2A7F69C9@OS3P286MB1495.JPNP286.PROD.OUTLOOK.COM>
 <Yuzx02AZDD+ReI+r@hovoldconsulting.com>
 <OS3P286MB1495E9C194761F73D84E34DAF6639@OS3P286MB1495.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS3P286MB1495E9C194761F73D84E34DAF6639@OS3P286MB1495.JPNP286.PROD.OUTLOOK.COM>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 08, 2022 at 07:06:59AM +0000, niek.nooijens@omron.com wrote:
> Hi Johan
> 
> I attached it by email.
> Don't worry about the merge window. I'm just glad to help!

Now applied, thanks.

Johan

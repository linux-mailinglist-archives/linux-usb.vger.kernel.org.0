Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B728B5B75D3
	for <lists+linux-usb@lfdr.de>; Tue, 13 Sep 2022 17:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231466AbiIMP4l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Sep 2022 11:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233801AbiIMP4V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Sep 2022 11:56:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D128FD63
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 07:55:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4051F61414
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 14:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F41C433D6;
        Tue, 13 Sep 2022 14:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663080887;
        bh=2H6/bsaalKmz3p1KDmgnyhWsUamffqo0yEK0HYNVz0c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nIRQMqelj5ir5voa5LCrq6nWPG+RFVFlxt5Fm/9ucRn4V5Htw306KuE849kuosvoz
         hILr1RXOvPgwxgN9crIwh3hnI38aoY2VzS3xaEPOBFsa/d9QQOUhuG4cDy47NL08+X
         EUbbJI/Aog4z59T7xvbp0D3RuYwUnCabVfqK4sIk9a3ai4VJhb3lm3eFHV8FoNNyIV
         lqvb1bb+8ss1UrdInGFeiGgLMHP+Ztl56o0BfOhm/EpufP5fDdf+deZVy4Bsno8c82
         6NzLtuoVXbQjw4akxaSa5WuUR0oiixEpkTrDvc8cAIkMcFFtRR6/zUHGPPUo/te6Uw
         uKcipNGfZ4acA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oY7JH-0005QC-Ar; Tue, 13 Sep 2022 16:54:47 +0200
Date:   Tue, 13 Sep 2022 16:54:47 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 4/7] USB: serial: ftdi_sio: Do not reset baud rate to
 9600 Baud on error
Message-ID: <YyCZt1Mtto4hsRKD@hovoldconsulting.com>
References: <20220712115306.26471-1-kabel@kernel.org>
 <20220712115306.26471-5-kabel@kernel.org>
 <Yt05KkAwrkB0EnbN@hovoldconsulting.com>
 <20220818141254.4taurd2x6s273hda@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220818141254.4taurd2x6s273hda@pali>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 18, 2022 at 04:12:54PM +0200, Pali Rohár wrote:
> On Sunday 24 July 2022 14:20:58 Johan Hovold wrote:

> > > @@ -2774,9 +2785,12 @@ static void ftdi_set_termios(struct tty_struct *tty,
> > >  		/* Drop RTS and DTR */
> > >  		clear_mctrl(port, TIOCM_DTR | TIOCM_RTS);
> > >  	} else {
> > > +		speed_t old_baud =
> > > +			old_termios ? tty_termios_baud_rate(old_termios) : 0;
> > 
> > Just use 9600 if you don't have an old termios. The termios rate should
> > be valid in that case.
> 
> Ok

Please trim your replies.

Johan

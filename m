Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0DE57F51E
	for <lists+linux-usb@lfdr.de>; Sun, 24 Jul 2022 14:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232931AbiGXMyw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 Jul 2022 08:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiGXMyv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 24 Jul 2022 08:54:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92DB812AD5
        for <linux-usb@vger.kernel.org>; Sun, 24 Jul 2022 05:54:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3168B6104A
        for <linux-usb@vger.kernel.org>; Sun, 24 Jul 2022 12:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A10DC3411E;
        Sun, 24 Jul 2022 12:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658667289;
        bh=zFSdfHJqT3tw/3hY31XIlAcQ05jzzrpb5/wkaZNPT8U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JxUybO9dhTLm3GweNXJi4vIFCbF05S800b4yeuWsSrUEbAgSsfBXAacxComO9djL5
         +lr7xSdPApdNhAyCNKefPMeLkRB1gWxvH1/ppdWewKj2RHgW6O9iQQbUwvja+ZIiKg
         ieOYBX8lpxO3st5Pqo+2t0o+DxlPCZGmQUUNlrDno6qqtpqdBV7EnwfN/nWoYVzgcN
         STv/ATTXvJ13DXSKkq2C7gOnNOPz15GITHUHHl3XbPw0ZPeaJsqWBvMGE0fmQoFbjb
         WfB59U7x9h2BQvhJE36lXOza+mzxNU/MBZ2xKi09J6JvyZePVkAPrTDo8MteNDembE
         o6tNPJGjiVrGg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oFb8M-0006iS-Bo; Sun, 24 Jul 2022 14:54:58 +0200
Date:   Sun, 24 Jul 2022 14:54:58 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 6/7] USB: serial: ftdi_sio: Fix custom_divisor and
 c_*speed for ASYNC_SPD_CUST
Message-ID: <Yt1BIsPqAVH0ajlf@hovoldconsulting.com>
References: <20220712115306.26471-1-kabel@kernel.org>
 <20220712115306.26471-7-kabel@kernel.org>
 <Yt06+wicNYMt/D7f@hovoldconsulting.com>
 <20220724123351.icqqvvfxjm7ogo5u@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220724123351.icqqvvfxjm7ogo5u@pali>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jul 24, 2022 at 02:33:51PM +0200, Pali Rohár wrote:
> On Sunday 24 July 2022 14:28:43 Johan Hovold wrote:
> > On Tue, Jul 12, 2022 at 01:53:05PM +0200, Marek Behún wrote:
> > > From: Pali Rohár <pali@kernel.org>
> > > 
> > > When ASYNC_SPD_CUST is used, update custom_divisor and c_*speed fields
> > > so that they correspond to the newly set baud rate value, so that
> > > userspace GET ioctls will see the true baud rate that is being used.
> > 
> > No, this is wrong.
> > 
> > In fact, there's a long-standing bug in this driver which started
> > reporting back the actual baud rate when using SPD_CUST.
> 
> Hello! And this commit is fixing also this bug as a side change.

Ah, indeed it is, or at least to some extent.

> > The rate should be left unchanged at 38400 in that case.
> 
> With this change, rate in c_cflag is unchanged and stays at B38400.

Right.

> What is updated is the real baudrate in c_ispeed and c_ospeed
> extensions.
> 
> It is really wrong? I thought that c_cflag should stay unchanged at
> B38400 when ASYNC_SPD_CUST is used.

Yeah, cflags stay unchanged, but you shouldn't touch those fields when
using the deprecated ASYNC_SPD_CUST hack.

Note that this currently only works because the ftdi driver uses
tty_get_baud_rate() instead of c_ospeed directly which is the
recommended (new) way.
 
> > > +	/* Fix deprecated async-compatible custom_divisor hack and update tty baud rate */
> > > +	if (fix_custom_divisor) {
> > > +		priv->custom_divisor = DIV_ROUND_CLOSEST(priv->baud_base, baud);
> > > +		old_baud = baud;
> > > +		baud = 38400;
> > > +	}
> > > +
> > >  	tty_encode_baud_rate(tty, baud, baud);
> > > +
> > > +	/* For async-compatible custom_divisor store into TCGETS2 c_*speed fields real baud rate */
> > > +	if (fix_custom_divisor)
> > > +		tty->termios.c_ispeed = tty->termios.c_ospeed = old_baud;
> > > +
> > >  	return div_value;
> > >  }
> > >  
> > > @@ -2674,6 +2688,8 @@ static void ftdi_set_termios(struct tty_struct *tty,
> > >  		dev_dbg(ddev, "%s: forcing baud rate for this device\n", __func__);
> > >  		tty_encode_baud_rate(tty, priv->force_baud,
> > >  					priv->force_baud);
> > > +		termios->c_ispeed = termios->c_ospeed =
> > > +			DIV_ROUND_CLOSEST(priv->baud_base, priv->custom_divisor);
> > >  	}
> > >  
> > >  	/* Force RTS-CTS if this device requires it. */

Johan

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2DAC39C764
	for <lists+linux-usb@lfdr.de>; Sat,  5 Jun 2021 12:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbhFEK0Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Jun 2021 06:26:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:44200 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229902AbhFEK0Z (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 5 Jun 2021 06:26:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B35EE61248;
        Sat,  5 Jun 2021 10:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622888677;
        bh=zm4lDbdPha8P2ZkCDTwd/Hqs72o9iIEMlIWhfzd2K40=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iwWuJOqC85SXnA5ZhYS3JSXirXJ1JJPYHQIlg835s3NWq++SqZSFhh47thdhp0X3L
         MaQOm43Q7DOlKwzP4ZL5R+o30kg7lBAsHWpm3apdvg3UXE9UPH2xp/XeiVnKAPmNJj
         MXttohmzKSQx6QQMDQxt+tZu7p/TcY70lyCM6bhDXskF5WmYol5hcGk7/STKVvvKFO
         b94Mbp/QksHFo7FTBf3zbJAyDBOZjuDYXxjqFgMjdE36JuOOjL1ZSMCPB6oAnbBs1R
         8/L49KNroET8OAQhuA0LgfnqH4eMOpIITs7VBOurplw2zVbSUqot5oS3NJxhmrvA7V
         a3kWFxA7ty5og==
Received: from johan by xi with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lpTTm-0006PE-95; Sat, 05 Jun 2021 12:24:34 +0200
Date:   Sat, 5 Jun 2021 12:24:34 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alex =?utf-8?B?VmlsbGFjw61z?= Lasso <a_villacis@palosanto.com>
Cc:     linux-usb@vger.kernel.org, David Frey <dpfrey@gmail.com>,
        Pho Tran <pho.tran@silabs.com>,
        Tung Pham <tung.pham@silabs.com>, Hung.Nguyen@silabs.com
Subject: Re: cp210x module broken in 5.12.5 and 5.12.6, works in 5.11.21
 (with bisection)
Message-ID: <YLtQ4pV0JBSOfLRw@hovoldconsulting.com>
References: <465ef3ac-4291-6392-e52b-26cc0c34dd7c@palosanto.com>
 <YLXmrmW9/fB1WbzR@hovoldconsulting.com>
 <2881bd97-f790-c4d6-aed6-de9ab8cd1a9e@palosanto.com>
 <YLZVAmYxFZ1Q/nrH@hovoldconsulting.com>
 <60705932-860a-701c-1019-16f9e16c39dd@palosanto.com>
 <YLeapcNbvExeGKuE@hovoldconsulting.com>
 <cb99a25e-5758-051c-afb6-29d8ef26ee0b@palosanto.com>
 <YLpJzTmAnfsrE7UP@hovoldconsulting.com>
 <a3a37639-0cba-fb3e-96bf-b4c2dae544a7@palosanto.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3a37639-0cba-fb3e-96bf-b4c2dae544a7@palosanto.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 04, 2021 at 01:25:19PM -0500, Alex Villacís Lasso wrote:
> El 4/6/21 a las 10:42, Johan Hovold escribió:

> > I just ran a quick test here and and leaving the ixoff_limit at zero
> > essentially breaks software flow control since XOFF will be sent when
> > there are only 7 characters in the receive buffer.
> >
> > Since software flow control support was only recently added, we may have
> > to accept that for CP2102N to fix the regression, but I'd really like to
> > understand why your devices behave the way they do first and see if
> > there's some other way to work around this.
> >
> > Hopefully Silabs can provide some insight.
> >
> > Also, could you try setting those limits to some other values and see if
> > the SET_MHS (request 0x7) errors go away?
> >
> > Setting both to 513 is supposed to give us 192/64 according to the
> > datasheet which would be good enough, for example. Seems to work as
> > documented here (at least for XOFF).

> I am starting to suspect that the root cause is that the 0x07 command 
> (CP210X_SET_MHS macro in the code) is invalid to send, if the device has 
> been previously programmed with nonzero ulXonLimit/ulXoffLimit. When the 
> patch programs both limits back to 0, the command succeeds.

Right, that's what the bisection and logs seem to suggest.

> I am attaching the patch I used, which is the combination of both debug 
> patches, plus this change:
> 
> @@ -1195,11 +1201,14 @@
>          else
>                  flow_repl &= ~CP210X_SERIAL_AUTO_TRANSMIT;
> 
> -       flow_ctl.ulXonLimit = cpu_to_le32(128);
> -       flow_ctl.ulXoffLimit = cpu_to_le32(128);
> +       flow_ctl.ulXonLimit = (I_IXON(tty)) ? cpu_to_le32(128) : 
> cpu_to_le32(0);
> +       flow_ctl.ulXoffLimit = (I_IXOFF(tty)) ? cpu_to_le32(128) : 
> cpu_to_le32(0);

These are both only needed when IXOFF (input flow control) is used (IXON
is for output flow control and does not use these limits).

And the fact that they cause a mostly unrelated error when set still
indicates a firmware bug. That doesn't mean it may be possible to work
around it somehow of course.

> With this patch, the miniterm.py program sort of keeps running and shows 
> output. Not a perfect patch by any means, since some failures still happen:

> $ miniterm.py /dev/ttyUSB0 115200
> <program waits for input>
> 
> jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_change_speed - setting baud rate to 9600
> jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - BEFORE: ctrl = 0x00, flow = 0x00
> jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - BEFORE: xon_limit = 0, xoff_limit = 0
> jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - AFTER: ctrl = 0x00, flow = 0x01
> jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - AFTER: xon_limit = 128, xoff_limit = 0

Another data point: just setting the XON limit is enough to trigger the
bug.

> jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_tiocmset_port - control = 0x0303
> jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
> 0x7 status: -32

As here SET_MHS fails.

> jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_change_speed - setting baud rate to 115384
> jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - BEFORE: ctrl = 0x00, flow = 0x01
> jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - BEFORE: xon_limit = 128, xoff_limit = 0
> jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - AFTER: ctrl = 0x01, flow = 0x40
> jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - AFTER: xon_limit = 0, xoff_limit = 0
> jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_tiocmset_port - control = 0x0101

And when XON is reset, settings RTS again works.

For completeness you could try setting only the XOFF limit and see if
that alone is sufficient to trigger the issue.

But please also try hardcoding both limits to 513 as I mentioned
above and see if that makes any difference.

Johan

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAA8939E491
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 18:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231410AbhFGQy6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 12:54:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:45056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230446AbhFGQy5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Jun 2021 12:54:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 51E3160FDA;
        Mon,  7 Jun 2021 16:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623084786;
        bh=/tfrK9SqrQkiyu3G5dlDMR6ncPkcSVXzOtse53jthQc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pmB9YcbGuCg0rJhjltEoNfL7o/NFozO5di3+ex1teSStlbQGoQWltQPu8epEVmZp8
         3kkz5vhhl7pUwGZaM8cYMSwsgq+JFJLAoNJh5mBGFb+l/oM6FGf9kDYM3FjysGGjXE
         dWS0K29O53nxix87xprF/26lYeDOR1HuILAIC4mM3mGtrtBYw6dFGF1V+ZJNNb4xKz
         U9zwC+Y7+Gwn4gfw9AB24aG3bYfyrDnmayf3LI5OAy415qmT8xYI5cOL3DA8PZ464b
         4tE/F7q8w0NFeCHlM+QPnwfk7xGKNUsGdC9zHw2FDuvu2H8ARlRuairITlx7AjEYL/
         Xi4S45p7EXteQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lqIUl-0003Cq-N0; Mon, 07 Jun 2021 18:53:00 +0200
Date:   Mon, 7 Jun 2021 18:52:59 +0200
From:   Johan Hovold <johan@kernel.org>
To:     David Frey <dpfrey@gmail.com>
Cc:     Alex =?utf-8?B?VmlsbGFjw61z?= Lasso <a_villacis@palosanto.com>,
        linux-usb@vger.kernel.org, Pho Tran <pho.tran@silabs.com>,
        Tung Pham <tung.pham@silabs.com>, Hung.Nguyen@silabs.com
Subject: Re: cp210x module broken in 5.12.5 and 5.12.6, works in 5.11.21
 (with bisection)
Message-ID: <YL5O6/GrlnpNwGjT@hovoldconsulting.com>
References: <YLXmrmW9/fB1WbzR@hovoldconsulting.com>
 <2881bd97-f790-c4d6-aed6-de9ab8cd1a9e@palosanto.com>
 <YLZVAmYxFZ1Q/nrH@hovoldconsulting.com>
 <60705932-860a-701c-1019-16f9e16c39dd@palosanto.com>
 <YLeapcNbvExeGKuE@hovoldconsulting.com>
 <cb99a25e-5758-051c-afb6-29d8ef26ee0b@palosanto.com>
 <YLpJzTmAnfsrE7UP@hovoldconsulting.com>
 <CAAvkfd-vmi_VJrCQg-ktF+sZZUfb5J+DJfjHv=TdVafyj1m1Ew@mail.gmail.com>
 <YLtOL5aZUnntfqWB@hovoldconsulting.com>
 <CAAvkfd-o+g2_uc-HqK8svrU_E3NB1m03md8J_F_eTc8pDkXmdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAvkfd-o+g2_uc-HqK8svrU_E3NB1m03md8J_F_eTc8pDkXmdQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 07, 2021 at 09:44:59AM -0700, David Frey wrote:
> On Sat, Jun 5, 2021 at 3:13 AM Johan Hovold <johan@kernel.org> wrote:
> >
> > I found an errata for A01 on here, but no mention if this particular
> > bug:
> >
> >         https://www.silabs.com/documents/public/pcns/190315471-CP2102N-Product-Revision-with-Datasheet-and-Errata-Update.pdf
> 
> I believe this document has some more errata details:
> https://www.silabs.com/documents/public/errata/cp2102n-errata.pdf'

Thanks for the link.

This seems to confirm that this is a known issue with A01 that was fixed
in A02:

	3.6 CP2102N_E104 – IO Exception in .NET Applications when
	Manually Controlling RTS

	The CP2102N uses the incorrect byte of the SERIAL_HANDFLOW
	structure
	(https://msdn.microsoft.com/en-us/library/windows/hard-
	ware/jj680685(v=vs.85).aspx) to control the RTS signal. Instead
	of looking at the first byte of FlowReplace, the device is
	reading the first byte of the XonLimit and interpreting that as
	the first byte of FlowReplace.

	Applications written in .NET set the Xon/Xoff limits to 160,
	equal to 0xA0, which the CP2102N interprets as hardware flow
	control, and so it returns an error when manually setting RTS.

Now we just need to figure out how to determine the firmware revision.

Johan

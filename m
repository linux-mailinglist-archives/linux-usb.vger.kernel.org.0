Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C054A39C75E
	for <lists+linux-usb@lfdr.de>; Sat,  5 Jun 2021 12:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbhFEKOz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Jun 2021 06:14:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:41918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230039AbhFEKOz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 5 Jun 2021 06:14:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B039613AA;
        Sat,  5 Jun 2021 10:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622887987;
        bh=8z47Pp9+dRZ076Jp5j9tlV8xX4ov7vI0WlrJ4pH5Rbo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Upq8qQXseZ3ouMtHMzSGQ+U26aV4dRXMswR5vXes1ijweqwO30MBizYnQN0GR1LoI
         cbEJzWYjkfhn7ZTL0q8dOwtlbKvVLA55/mdvj3zkxAj5HJnS8mpORFMZW5hsSG23bW
         pEDBzGhbBuIW5wDwGTFGiKDp1X1F5H73jXj80kbfThCcvM/b4rapyrnfrSrQg5aeKW
         1zIf8xzy6WiYBAe6CNi8njgF43RMKlLzmGHHnqJnmUGi6VyOjCNd9LjhvxlT9arIhI
         rMHhyTyyx4Lknr3X69xj3nvfABWBIMs9rZ6GWqF4dSBLDkePK2CrjDGnbJMbpCappL
         LmKEp9YecUlHQ==
Received: from johan by xi with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lpTId-0006L4-SB; Sat, 05 Jun 2021 12:13:03 +0200
Date:   Sat, 5 Jun 2021 12:13:03 +0200
From:   Johan Hovold <johan@kernel.org>
To:     David Frey <dpfrey@gmail.com>
Cc:     Alex =?utf-8?B?VmlsbGFjw61z?= Lasso <a_villacis@palosanto.com>,
        linux-usb@vger.kernel.org, Pho Tran <pho.tran@silabs.com>,
        Tung Pham <tung.pham@silabs.com>, Hung.Nguyen@silabs.com
Subject: Re: cp210x module broken in 5.12.5 and 5.12.6, works in 5.11.21
 (with bisection)
Message-ID: <YLtOL5aZUnntfqWB@hovoldconsulting.com>
References: <465ef3ac-4291-6392-e52b-26cc0c34dd7c@palosanto.com>
 <YLXmrmW9/fB1WbzR@hovoldconsulting.com>
 <2881bd97-f790-c4d6-aed6-de9ab8cd1a9e@palosanto.com>
 <YLZVAmYxFZ1Q/nrH@hovoldconsulting.com>
 <60705932-860a-701c-1019-16f9e16c39dd@palosanto.com>
 <YLeapcNbvExeGKuE@hovoldconsulting.com>
 <cb99a25e-5758-051c-afb6-29d8ef26ee0b@palosanto.com>
 <YLpJzTmAnfsrE7UP@hovoldconsulting.com>
 <CAAvkfd-vmi_VJrCQg-ktF+sZZUfb5J+DJfjHv=TdVafyj1m1Ew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAvkfd-vmi_VJrCQg-ktF+sZZUfb5J+DJfjHv=TdVafyj1m1Ew@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 04, 2021 at 04:16:26PM -0700, David Frey wrote:
> I'm not sure if this matters, but I have been told that the failing
> boards have CP2102N chips with"A01" firmware.  I tried to install
> SIlicon Labs Simplicity Studio on Windows because I read that it would
> be able to identify the firmware version of the device, but I couldn't
> actually figure out how to find the information. If someone can tell
> me a way to get the firmware version, I can check to see if it's
> different between the device that does exhibit this failure and the
> one that doesn't.

That is definitely worth pursuing. The A01 is apparently EOLed and
there's a later A02 and possibly even A03:

	https://www.silabs.com/community/interface/knowledge-base.entry.html/2020/03/31/how_to_determinecp2102nrevisiona01vsa02-DCJI

That page refers to that vendor tool "Simplicity Studio" as well as a
Windows library described by

	https://www.silabs.com/documents/public/application-notes/AN978-cp210x-usb-to-uart-api-specification.pdf

that can be used to read out the firmware version on CP2102N and CP2108
(three bytes). We just need to figure out which vendor request the
library (and tool) uses and we could key off of this in the driver if
this turns out to be related to the firmware revision.

If anyone's got a Windows installation it may be possible to dump the
USB traffic using Wireshark to determine the request. Unless Silabs can
chime in here of course.

I found an errata for A01 on here, but no mention if this particular
bug:

	https://www.silabs.com/documents/public/pcns/190315471-CP2102N-Product-Revision-with-Datasheet-and-Errata-Update.pdf

> On Fri, Jun 4, 2021 at 8:42 AM Johan Hovold <johan@kernel.org> wrote:

> > This all matches the CP2102N I've got here and which can set RTS just
> > fine also with the IXOFF limits set (unlike your device).
> >
> > Unless there's some other configuration setting causing it would seem
> > your device firmware is just buggy (and bcdDevice was not updated when
> > it was fixed, which seems unlikely).

Johan

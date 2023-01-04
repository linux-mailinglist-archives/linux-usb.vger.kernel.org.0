Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A09365DD7E
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 21:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240230AbjADUPg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Jan 2023 15:15:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240160AbjADUPH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Jan 2023 15:15:07 -0500
X-Greylist: delayed 21672 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 04 Jan 2023 12:14:58 PST
Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 107E83FCA5
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 12:14:57 -0800 (PST)
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by bee.tesarici.cz (Postfix) with ESMTPSA id 6C7B412EAB5;
        Wed,  4 Jan 2023 21:14:54 +0100 (CET)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
        t=1672863294; bh=Lq7zlPZcFNe2baH9AF+bB3hffcVCM2NkFVWqAt6Sa4I=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tngv6bpX6mESPFvxz8X4BADUTJ9qGrjytGd4EwGQNH62p/xZNilz9cCPcLt8UILAG
         8JihqUqldfDxRs6KXQZpaHnyufKya9RCBqewIbamgggLmUr1pzkHidK32O/6gZLMsA
         R2jrHpANRpVUwmMF113RHBo9WiYQ5IHm5v9Tlt/f5dFRSTGoJ2OY+EMfnfXvv3OeF6
         GSMpaxq5f+L1wiMVkJjEmPDtlir41dffwO0eYx4SHTC+ykbBOFL3U/5S+DQ2mONoN+
         1WAB0JDw02cSaU0zPlLeF19MwQFuYgmCl8rx4JUSfaPSyezgNNykuHsEaIPdSMg9Yf
         yJpdoBEcOATjw==
Date:   Wed, 4 Jan 2023 21:14:53 +0100
From:   Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Disabling per-device autosuspend
Message-ID: <20230104211453.4ea6f6cf@meshulam.tesarici.cz>
In-Reply-To: <Y7XWB0GzEL5cv6lM@rowland.harvard.edu>
References: <20230104151341.6f937c0c@meshulam.tesarici.cz>
        <20230104164900.31a3243d@meshulam.tesarici.cz>
        <Y7Wm1UVGMx8ZeqgD@rowland.harvard.edu>
        <20230104174731.5527b1ed@meshulam.tesarici.cz>
        <Y7WxltobCK0zQz9k@rowland.harvard.edu>
        <20230104182750.1529bd78@meshulam.tesarici.cz>
        <Y7XWB0GzEL5cv6lM@rowland.harvard.edu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 4 Jan 2023 14:39:51 -0500
Alan Stern <stern@rowland.harvard.edu> wrote:

> On Wed, Jan 04, 2023 at 06:27:50PM +0100, Petr Tesa=C5=99=C3=ADk wrote:
> > On Wed, 4 Jan 2023 12:04:22 -0500
> > Alan Stern <stern@rowland.harvard.edu> wrote: =20
> > > At this point the host sends a Get-Device-Status request to the devic=
e=20
> > > (not shown in the log).
> > >=20
> > >  [...] =20
> > >=20
> > > The fact that the host is retrying means that the status request got =
an=20
> > > error.  Unfortunately the log message doesn't say sort of error=20
> > > occurred. =20
> >=20
> > OK, I see. The URB indicates success, but there is no data:
> >=20
> > 45	0.432232	host	1.50.0	USB	64	GET STATUS Request
> > 46	0.432659	1.50.0	host	USB	64	GET STATUS Response
> >=20
> > Frame 46: 64 bytes on wire (512 bits), 64 bytes captured (512 bits) on =
interface usbmon1, id 0
> > USB URB
> >     [Source: 1.50.0]
> >     [Destination: host]
> >     URB id: 0xffff98b4383c8d80
> >     URB type: URB_COMPLETE ('C')
> >     URB transfer type: URB_CONTROL (0x02)
> >     Endpoint: 0x80, Direction: IN
> >     Device: 50
> >     URB bus id: 1
> >     Device setup request: not relevant ('-')
> >     Data: present ('\0')
> >     URB sec: 1672851450
> >     URB usec: 569060
> >     URB status: Success (0)
> >     URB length [bytes]: 0
> >     Data length [bytes]: 0
> > -------------------------^
> > This should be 2, and the device should send a 16-bit status word. Hm.
> >=20
> >     [Request in: 45]
> >     [Time from request: 0.000427000 seconds]
> >     Unused Setup Header
> >     Interval: 0
> >     Start frame: 0
> >     Copy of Transfer Flags: 0x00000200, Dir IN
> >     Number of ISO descriptors: 0
> >=20
> > While I do agree that the Samsung phone download mode USB stack
> > implementation is crappy, multiple models and many users are affected. I
> > wonder what would be a sensible workaround in heimdall and/or libusb...
> >=20
> > Setting a global module parameter does not sound great. =20
>=20
> Another option would be to create a short udev script that would write=20
> "on" to the power/control attribute file (thereby turning autosuspend=20
> off) whenever it sees a new USB device with the vendor and product IDs=20
> of your phone.  That seems like a very practical solution.

Yes, that sounds good, because autosuspend is usually not set to zero.
Thank you! FWIW it works for me, and I have also proposed this solution
in the heimdall GitHub issue. They install their own udev rules file
already, so the patch is a one-liner.

BTW manufacturing broken USB devices in large quantities should become
a crime and a federal felony... ;-)

Petr T

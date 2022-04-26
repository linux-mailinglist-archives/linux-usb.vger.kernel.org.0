Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A828550EEBF
	for <lists+linux-usb@lfdr.de>; Tue, 26 Apr 2022 04:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235430AbiDZCaa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 22:30:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233387AbiDZCa3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 22:30:29 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA08113C88
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 19:27:19 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 1A9913200930;
        Mon, 25 Apr 2022 22:27:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 25 Apr 2022 22:27:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1650940035; x=
        1651026435; bh=2/n5GFyB9Vm/0g2bs3DtqcyNVtUxHzHDKhLh25AsC60=; b=G
        wBbh2coxLqJG1WLmkCxpQNs4j4bZOsZj2RutlxxgSdlnZWlGcpnBrbe9DyPNR2q9
        O3CEAvxIc8KvcTmclIGRoMIR84UAJUfEJixe0k6dCTDsDRuAWeXb+kTG6MIoFNrs
        KJ7Gae2G2w1xBWhffTjypWX+SnyqTjdDEepY7buaT/yaBEHdWhDHO1YYP+nfnitQ
        uTY6Ek9u9o7AdCLDRuain007T+IwBgbS6cKtFBg+7urBX3sLXI3Uj4Wwa6r5E8ns
        VPj1WpbiApyIedPoIKFLCYFZ+8s0k/u4drVC/j/+apactcEMqPKPzcc6YtNfCYs+
        MVft4jy3G9QSMwnKpMKhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1650940035; x=1651026435; bh=2/n5GFyB9Vm/0
        g2bs3DtqcyNVtUxHzHDKhLh25AsC60=; b=vNCyFH7f0iOE7MBQKvulZH90lnyBg
        dBpxhJJHZ3M4oV5Bi14kgv2tJu58ZQk9wQU0a9GqRaHFMKDZhHVDZ+hSDD9WA8kG
        tZs6mdfl7a8uBwt7DyLRFK5Pj9K2+wu8tQD9hmJLfPAhwDkPSOSM1IHhkuhZPwVP
        cCTfRP6b6hYu9LHcqLPhzErqkq3zsQQtX8re0J73ZXVrqvZrajTTlpUuUBOI3LGN
        06FMjapumWEYnSFls3vMcEHYAwg0N9AgHMEfPHd5rpZkqkko+g3fZ+n54Aa9aZHC
        SEvVQq/HmSiIsWwj4YDSsW1zlRPWFSAATczXiUOekLD+CFPSiSY3wqoOg==
X-ME-Sender: <xms:g1hnYjmY09fUj2IYIKsQfNceoqG45t4G7nRcZDonHCPMzr5ZI7BXPA>
    <xme:g1hnYm0iXQrqvfYCH0YgmmER_ilPFg3Sfq2pGUCZQx36IZCznPyUbl7jr98D6RydA
    1HMEIkPTYhjXm3ELrw>
X-ME-Received: <xmr:g1hnYprucVBCVwJCxbLL0Oj4JFYTCDcG3Lu5RPEXcKPfOpHoQJCjIP1KpfKjC4B-hQtlx9h50JAr9mgk8-drkz7bYY4Jt5zmXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvgdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheprfgvthgv
    rhcujfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvg
    htqeenucggtffrrghtthgvrhhnpedthefgudekhfduudejveeggefhkeehgedvhfdugfdv
    uddvudehvddvhfejheeltdenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrgh
    dpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepphgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvght
X-ME-Proxy: <xmx:g1hnYrlfvGMOc3bS8Ht5NO97T83S3oUdYJ3r1l0VVBG4bzQgoyPlDg>
    <xmx:g1hnYh28BJ7gTOYkd5gt5lYd-ErvtFDBQNc0BzBkkfM1x9suncVYpQ>
    <xmx:g1hnYqvCqJpt-x9qkPIIEWEU_zodT-KNQ-5Bn_b6Gv_JYRYq71rRvA>
    <xmx:g1hnYqyyCP4EnZfcCkySKvsuwHW6eUaNnGgFsPZ9rzsQoKA1hZyZjQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Apr 2022 22:27:13 -0400 (EDT)
Date:   Tue, 26 Apr 2022 12:27:08 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-usb@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [RFC v1] USB: core: add USBDEVFS_REVOKE ioctl
Message-ID: <YmdYfK5Vi+lEl7FX@quokka>
References: <20220425132315.924477-1-hadess@hadess.net>
 <YmarwaNQYn1GwFbQ@kroah.com>
 <e73035d1bae5d0c355166fb46f0f5f2f07752b3c.camel@hadess.net>
 <Yma3k3lRMIEFypMN@kroah.com>
 <1d82343a5987a308ac9bd3f6fd481bc12a608a24.camel@hadess.net>
 <YmbCBwEMvKO5z0Dh@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YmbCBwEMvKO5z0Dh@kroah.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 25, 2022 at 05:45:11PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Apr 25, 2022 at 05:17:28PM +0200, Bastien Nocera wrote:
> > > > Again, please read the follow-up mail where I talk of the BPF
> > > > support
> > > > patch that would allow revoking USB fds without relying on a
> > > > service in
> > > > the middle to access devices (although that's eventually going to
> > > > be
> > > > the way to do things to allow elevating access to devices).
> > > 
> > > So would bpf be working at the usbfs level here?  I still don't
> > > understand the connection...
> > 
> > The explanation is here (for hidraw):
> > https://gitlab.freedesktop.org/bentiss/logind-hidraw/
> 
> usbfs is not in that explanation at all.  Will there be a logind-libusb
> process as well?

chiming in here: the hidraw ioctl is independent (as already mentioned)
but it's basically the same approach and/or intent. The hidraw revoke ioctl is
"the evdev revoke, but for hidraw", this one is "the evdev revoke, but for
usb". Not very creative, but at least we can point to prior art and say "this
seems to be useful" :)

The primary focus of all this are joystick devices (unless I missed some other
grand plans Bastien had that I'm not aware of), that should put things in
context a bit. 

Neither ioctl requires a new logind process - logind has TakeDevice(path) and
ReleaseDevice() as equivalent to open()/close() and updating the logind
*implementation* allows us to "take" a /dev/$whatever node. The (quite short)
diff to logind for hidraw is here:
https://github.com/systemd/systemd/pull/23140/files
It's basically adding a new enum value and then the check for /dev/hidraw
instead of /dev/input/event. Imagine the same thing for usb devices.

With the ioctls, we need a chain which will require updating libusb etc. so
a sandboxed application would do this:
   application → portal → compositor → logind → open()
and the fd being passed back up from that to be used in the application.
Ideally libusb can abstract this transparently.

This chain is the ideal solution since it allows for tight controls of what
the application can access, including the required "are you sure?" UI inserted
where needed. Both logind and the portal would have a copy of the fd to call
revoke on it when required (e.g. user switch or something interactive in the
portal). Alas, this chain requires updates to how the application opens the
fd.

Benjamin's suggestion of using BPF (in addition to the ioctl) allows us to
implement permission checks without that chain in place. With the right BPF
program loaded, logind can effectively revoke an fd even where logind wasn't
in the actual open() chain. For user-switching this immediately works, we need
no application updates. For the "are you sure?" UI part it's more complicated
but as a thought exercise: the portal could tell logind that $path was ok to
be opened by any application, logind then allows that. If the portal tells
logind that it's not longer ok, it can revoke any open fd. The portal does not
need to know who actually has an fd open. There's some discussion on this
"how's this actually going to work?" issue here:
https://gitlab.freedesktop.org/bentiss/logind-hidraw/-/issues/1
just mentally substitute hidraw with usb. Notably, the application itself does
not need updates.

There are other efforts like that complement all this, like the proposal to
tag "safe enough" joystick devices as such so they can be opened by an
application: https://github.com/systemd/systemd/pull/22860

> But back to the original question, what programs would use this that
> today offer direct access to USB devices through libusb?  I can maybe
> think of some fingerprint scanners and some flatbed scanners (printers?)
> But those are generally rare and the fingerprint scanners only have
> limited access to the device already.
> 
> You're going to have to test this somehow with some program, what are
> you using today for this?

I have a very simple hidraw tester here:
https://github.com/whot/hidiocrevoke-test/blob/master/revoke.c
Updating that to take usb devices can't be that hard :)

hth

Cheers,
  Peter

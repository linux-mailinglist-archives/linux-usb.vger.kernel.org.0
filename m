Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4D853C066
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jun 2022 23:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbiFBVfD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jun 2022 17:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbiFBVe6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jun 2022 17:34:58 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3893A1BA
        for <linux-usb@vger.kernel.org>; Thu,  2 Jun 2022 14:34:56 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nwsT1-0003wy-0i; Thu, 02 Jun 2022 23:34:55 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nwsT0-0001bZ-4U; Thu, 02 Jun 2022 23:34:54 +0200
Date:   Thu, 2 Jun 2022 23:34:54 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2] usb: hub: port: add sysfs entry to switch port power
Message-ID: <20220602213454.GC26638@pengutronix.de>
References: <20220602012731.2942309-1-m.grzeschik@pengutronix.de>
 <YpjLusnGk8ZBlGGd@rowland.harvard.edu>
 <20220602145918.GB26638@pengutronix.de>
 <YpkMi9Se0Unxq1SS@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="V88s5gaDVPzZ0KCq"
Content-Disposition: inline
In-Reply-To: <YpkMi9Se0Unxq1SS@rowland.harvard.edu>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 02, 2022 at 03:16:27PM -0400, Alan Stern wrote:
>On Thu, Jun 02, 2022 at 04:59:18PM +0200, Michael Grzeschik wrote:
>> On Thu, Jun 02, 2022 at 10:39:54AM -0400, Alan Stern wrote:
>> > You might want to disable the new sysfs file (don't create it or have =
it
>> > return -EOPNOTSUPP) if the hub doesn't support per-port power switchin=
g.
>>
>> Is it possible to read out if this feature is not working by the hub?
>
>Actually, I don't think so.  You can get some information about ganged
>power switching, and there's the hub_is_port_power_switchable() test, but
>that's all.  The situation is discussed in section 11.11 (Hub Port Power
>Control) of the USB-2.0 spec.

I think we can skip this check then, since this sysfs file could still
work with hubs, that do not support port power switching by at least
disabling the port connection.

>> The most hubs, that I was working with, did not really toggle the vbus,
>> because the physical logic to switch a regulator was completely missing
>> in the hardware. But with removing the other PORT_FEATURES the hub
>> behaved like the port is just not powered any more.
>
>Yes, that's how most hubs work.  There are a few, however, which really do
>switch port Vbus power on and off.
>
>> Because of that; I am currently curious if we just should rename that
>> property to something more generic like "enable" or "disable". So that
>> as the real vbus power switching is missing, the hubs port switching
>> does still function like intended.
>
>That makes sense.  But the question arises, does this patch really do what
>you want?
>
>The patch description talks about the need to disable devices or
>re-enumerate them.  You can disable a device right now by writing -1 to
>the bConfigurationValue sysfs file, and you can force a device to be
>re-enumerated by resetting it (using the USBDEVFS_RESET usbfs ioctl).
>
>About the only thing you can't currently do is actually turn off power to
>the port.  This patch will allow users to do that, but only if the hub
>supports power switching.
>
>(Okay, there's one other thing: The patch also allows users to disable a
>port, so that devices plugged into that port get ignored.  Maybe that's
>what you really had in mind...?)

Yes, that is what I had in mind. If you agree, I would still keep the
name "port_power" since it is the main function, but skip the
hub_is_port_power_switchable check.

>> > Finally, you should add a test to port_event() in hub.c, probably where
>> > the pm_runtime_active() check is.  If the port is powered off, return
>> > before doing any of the warm_reset or connect_change processing.
>>
>> I don't understand jet why this is needed. In all my tests, the hubs
>> port was just not functioning any more. Regardless if the hub
>> was capable of real vbus switching or not. Just as described above.
>> Is it possible that this is already handled correctly because of the
>> other cleared port_features I mentioned?
>
>The USB spec does say that hubs should ignore connections to ports whose
>port_power feature flag is off.  The test I suggested was meant as a "just
>in case" sort of thing, for hubs that don't comply with the spec's
>requirement.  In the end it may not be necessary, and it can be done in a
>separate patch.

Agreed.

>> In v3 I will also add port_power_show to make it possible for the
>> userspace to read out the current port status but returning the
>> value of test_bit(port1, hub->power_bits);.
>
>Good idea; I should have thought of it.

:)

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--V88s5gaDVPzZ0KCq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmKZLPsACgkQC+njFXoe
LGSkKQ/+K1qBUSburkVgvkph8vlWh2BSDahGay0Rr7+rtRlN3/LdJlkGkVeHIUpL
d4MJIGpiD28yfeQOzo7L/HOtcea7sszCFQCuQUjXo+EDt8b0JRXikjRHuQvfJr4X
HNj+LOknPW8bU0SBzgJl7Y4Bs/sNq3/8iIZCGeO6WHv2werxAMUhor7i1pqLVeQZ
+BAwXKago1+1UqWt8Rp0UVV6AMOvIQPPcjaMNU6JJ4AWru0IkxOKAFUJcmE8noMg
n7aA7fovwT2a56LAgUVI1QnoP6C4vvgmp5GF8jcJmamDoRwwVjXhUp3QXIhygmUF
M/iOyj6Xa51Hy023ifDmiI6IzYvbdtBTmwQ7dQgD0UmHSAUFO8TXGPdpQfGy7XBr
KTseCB1RAsRO4nKq6xwdPsvmknhleWugte51wojrj2edc+cACZWW2YNs0+7w81do
2zFJg6bMn0JloaXHcuyjbZmc4P9igZFTyVkEuXYS9egTl51B0DM/uH5e4PBFTgi8
tTnhFfGD9X9wOZswd9crnP3IAK0nUEKxWFGg9kLSOxmrvUMAEJcwm9sBgLC4ErvZ
xka1ZzW2rmx3wv9z4JDGTdoba11jVHJX2iwb5rrDt+d+cRua+fWf4Nvn1xhrfeoq
mFXmSuoLOJ/dfWIgi5HpxnukjFLHzTMSK4fQoo8spPiYCIXunqE=
=gUWQ
-----END PGP SIGNATURE-----

--V88s5gaDVPzZ0KCq--

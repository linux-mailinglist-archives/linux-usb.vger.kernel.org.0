Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE5CD53D2D0
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jun 2022 22:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347474AbiFCUaC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jun 2022 16:30:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbiFCUaB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jun 2022 16:30:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9268446153
        for <linux-usb@vger.kernel.org>; Fri,  3 Jun 2022 13:30:00 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nxDvi-0000DA-Vg; Fri, 03 Jun 2022 22:29:58 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nxDvi-0008ET-8Q; Fri, 03 Jun 2022 22:29:58 +0200
Date:   Fri, 3 Jun 2022 22:29:58 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v3] usb: hub: port: add sysfs entry to switch port power
Message-ID: <20220603202958.GA29935@pengutronix.de>
References: <20220603115222.2151283-1-m.grzeschik@pengutronix.de>
 <YpovuqKtQBKQoVos@rowland.harvard.edu>
 <20220603172209.GD26638@pengutronix.de>
 <YppjCCJrtxc4lEGc@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
In-Reply-To: <YppjCCJrtxc4lEGc@rowland.harvard.edu>
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


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 03, 2022 at 03:37:44PM -0400, Alan Stern wrote:
>On Fri, Jun 03, 2022 at 07:22:09PM +0200, Michael Grzeschik wrote:
>> On Fri, Jun 03, 2022 at 11:58:50AM -0400, Alan Stern wrote:
>> > On Fri, Jun 03, 2022 at 01:52:22PM +0200, Michael Grzeschik wrote:
>
>> > > +static ssize_t disable_show(struct device *dev,
>> > > +			      struct device_attribute *attr, char *buf)
>> > > +{
>> > > +	struct usb_port *port_dev =3D to_usb_port(dev);
>> > > +	struct usb_device *hdev =3D to_usb_device(dev->parent->parent);
>> > > +	struct usb_hub *hub =3D usb_hub_to_struct_hub(hdev);
>> > > +	int port1 =3D port_dev->portnum;
>> > > +	bool state =3D test_bit(port1, hub->power_bits);
>> > > +
>> > > +	return sprintf(buf, "%s\n", state ? "0" : "1");
>> >
>> > Maybe "false" and "true" instead of "0" and "1"?
>>
>> I prefer 0 and 1 since we also feed this to the file.
>
>Oops -- I was wrong about "true" or "false" (which is a little odd;
>you'd think a parser for boolean values would certainly recognize those
>words).  However, strtobool() does also recognize "yes", "no", "on", and
>"off".
>
>Using "on" and "off" would lead to confusion, since "on" means
>"disable is turned on", which means the port is off!  "Yes" and "no"
>would be okay, though.

I still prefer 1 an 0.

>> Also, I just found out that just parsing power_bits is not enough.
>>
>> E.g. when we use other tools to set clear PORT_POWER on the hub like
>> uhubctl to disable a port. The value does not represent the real state
>> of the port.
>
>The value in power_bits is always supposed to match the real state of
>the port.  How does uhubctl manage to get them to disagree?

https://github.com/mvp/uhubctl/blob/master/uhubctl.c#L1082

It just calls a direct control transfer with rather CLEAR or SET_FEATURE
set. So this will be transfered completely passing the kernel usb core
layer. I actually would expect that the hubs interrupt worker would
trigger. I will have to check if this is the case.

>> I think it is better to use hub_port_status and port_is_power_on from
>> hub.c to test the real state by sending a GET_STATUS command.
>
>Maybe.  But if power_bits is working properly, this should not be
>needed.  It would be better to fix the value stored in power_bits.

I don't know if this is trivial. If it is not, I would prefer to
trigger the GET_STATUS in disable_show for now.

Regards,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmKab0MACgkQC+njFXoe
LGSrRQ//ZabDnlAXj26lSAa+wWKx4HX5KSMb1fuHhxVSTbylg/qM4fhPYloW5K1N
RnQSklOytHgK49EnKC7PFZ6en+hKLMhUQWtFEQUC4YoUxYuPew/OMFk18i939qRM
59p9j4djQU1GDvm2KsiA/Pwv9OKN6sserkXIL0M9m3Q6FHBlbhMuu0KAAzNvihFY
X5Ds/ed/LxLhjQfW2nFVleuAuCQeaQdtoGhU4r3CYZacxgAQT5ePe2RHMDd2pMqT
LqjqUzw3ZSXbYbWB0XefTKP5m0Mk8Ki8V/wWq+MKnuCHCS7MxiZoPn+u9IeIRf7p
1JcqwDEcpQCEhJRhK+jYDTKY57ZqqeFsKJaIXbQXhQ1NSY4eUzBkyP0PnFYHJO3w
VFNVLeR7/r8YLoESPL2prnbhi+B5TboGbYGjWsDILkpFq3PIer517qMHGuEOGBsB
+XmD/XCxZoS4socz49+3DBDWau8a2b+yusB7/kqHrThmb/NBZy7iiRNu8qszLe2B
NNbx4zqAiZLD7eBnz4HW15Nj+Lq5HI0ZseRiPBnOM2LyCWHpl2UjDpSp2hmY3obZ
dbim678A+jts9aizwPanXVNLyWGnhb27Q83Csne5JNlnGEG7RE/v/7ewvfM0BCta
LoLDmwY9mFkXrPRvcyHgDcADIPu5kydPVLAMspX2kELXYCXe2s8=
=0UcU
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD78553BB47
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jun 2022 16:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236298AbiFBO7X (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jun 2022 10:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233126AbiFBO7W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jun 2022 10:59:22 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F01B82B7
        for <linux-usb@vger.kernel.org>; Thu,  2 Jun 2022 07:59:20 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nwmIA-0004VX-TO; Thu, 02 Jun 2022 16:59:18 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nwmIA-00066O-E4; Thu, 02 Jun 2022 16:59:18 +0200
Date:   Thu, 2 Jun 2022 16:59:18 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2] usb: hub: port: add sysfs entry to switch port power
Message-ID: <20220602145918.GB26638@pengutronix.de>
References: <20220602012731.2942309-1-m.grzeschik@pengutronix.de>
 <YpjLusnGk8ZBlGGd@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Content-Disposition: inline
In-Reply-To: <YpjLusnGk8ZBlGGd@rowland.harvard.edu>
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


--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 02, 2022 at 10:39:54AM -0400, Alan Stern wrote:
>On Thu, Jun 02, 2022 at 03:27:31AM +0200, Michael Grzeschik wrote:
>> In some cases the port of an hub needs to be disabled or switched off
>> and on again. E.g. when the connected device needs to be re-enumerated.
>> Or it needs to be explicitly disabled while the rest of the usb tree
>> stays working.
>>
>> For this purpose this patch adds an sysfs switch to enable/disable the
>> port on any hub. In the case the hub is supporting power switching, the
>> power line will be disabled to the connected device.
>>
>> When the port gets disabled, the associated device gets disconnected and
>> removed from the logical usb tree. No further device will be enumerated
>> on that port until the port gets enabled again.
>
>A lot better than the description in the earlier patch version!
>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>
>> ---
>> v1 -> v2:
>>          - improved patch description
>> 	 - moved usb_hub_set_port_power to end of function
>> 	 - renamed value to set
>>          - removed udev variable
>>          - added usb_set_configuration set to -1 before removing device
>>          - calling autosuspend of udev before usb_disconnect, ensuring h=
ub_suspend succeeds
>>          - removed port_dev->child =3D NULL assignment
>>          - directly returning count on no failure success
>>          - removed test for hub->in_reset
>> 	 - using usb_autopm_get_interface/usb_autopm_put_interface around hub h=
andling
>> 	 - locking usb_disconnect call
>> 	 - using &port_dev->child instead of local udev pointer
>> 	 - added Documentation/ABI
>>
>>  Documentation/ABI/testing/sysfs-bus-usb | 13 +++++++
>>  drivers/usb/core/port.c                 | 49 +++++++++++++++++++++++++
>>  2 files changed, 62 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-usb b/Documentation/ABI=
/testing/sysfs-bus-usb
>> index 7efe31ed3a25c7..9c87ca50bcab79 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-usb
>> +++ b/Documentation/ABI/testing/sysfs-bus-usb
>> @@ -253,6 +253,19 @@ Description:
>>  		only if the system firmware is capable of describing the
>>  		connection between a port and its connector.
>>
>> +What:		/sys/bus/usb/devices/.../<hub_interface>/port<X>/port_power
>> +Date:		June 2022
>> +Contact:	Michael Grzeschik <m.grzeschik@pengutronix.de>
>> +Description:
>> +		To disable or enable a hub port the sysfs file port_power exists
>> +		for each hub port. When disabling the hub port it is unusable anymore,
>> +		which means no enumeration will take place on this port until enabled=
 again.
>> +
>> +		When disabling the port set (<hubdev-portX>/port_power to 0) the
>> +		USB_PORT_FEAT_C_CONNECTION, USB_PORT_FEAT_POWER and (for high speed h=
ubs) the
>> +		USB_PORT_FEAT_C_ENABLE port features are cleared. It all gets reverse=
d when the
>> +		port will be enabled again (set <hubdev-portX>/port_power to 1).
>
>This description is rather disorganized.  I'd prefer something like this:
>
>		This file controls Vbus power to USB ports (but only on hubs
>		that support power switching -- most hubs don't support it).
>		When power to a port is turned off, the port is unusable:
>		Devices attached to the port will not be detected,
>		initialized, or enumerated.

Okay, I will keep yours.

>> +
>>  What:		/sys/bus/usb/devices/.../power/usb2_lpm_l1_timeout
>>  Date:		May 2013
>>  Contact:	Mathias Nyman <mathias.nyman@linux.intel.com>
>> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
>> index d5bc36ca5b1f77..3e707db88291e9 100644
>> --- a/drivers/usb/core/port.c
>> +++ b/drivers/usb/core/port.c
>> @@ -17,6 +17,54 @@ static int usb_port_block_power_off;
>>
>>  static const struct attribute_group *port_dev_group[];
>>
>> +static ssize_t port_power_store(struct device *dev, struct device_attri=
bute *attr,
>> +			    const char *buf, size_t count)
>> +{
>> +	struct usb_port *port_dev =3D to_usb_port(dev);
>> +	struct usb_device *hdev =3D to_usb_device(dev->parent->parent);
>> +	struct usb_hub *hub =3D usb_hub_to_struct_hub(hdev);
>> +	struct usb_interface *intf =3D to_usb_interface(hub->intfdev);
>> +	int port1 =3D port_dev->portnum;
>> +	bool set;
>> +	int rc;
>> +
>> +	if (!hub)
>> +		return -EINVAL;
>> +
>> +	rc =3D strtobool(buf, &set);
>> +	if (rc)
>> +		return rc;
>> +
>> +	rc =3D usb_autopm_get_interface(intf);
>> +	if (rc < 0)
>> +		return rc;
>
>You should call usb_lock_device(hdev) here, not later.  And after the hub
>has been locked, you have to check whether hub->disconnected has been set.

Will add in v3.

>> +
>> +	if (!set) {
>> +		usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_CONNECTION);
>> +		if (!port_dev->is_superspeed)
>> +			usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_ENABLE);
>
>These should be cleared after the port power is disabled, not before.

Okay, I will add this to the code.

>> +		if (port_dev->child) {
>> +			usb_set_configuration(port_dev->child, -1);
>> +			usb_autosuspend_device(port_dev->child);
>
>I don't see why either of these is needed.  (In fact, some devices
>malfunction when you try to unconfigure them.)

I will test it with that code removed.

>> +			usb_lock_device(hdev);
>> +			usb_disconnect(&port_dev->child);
>> +			usb_unlock_device(hdev);
>> +		}
>> +	}
>> +
>> +	rc =3D usb_hub_set_port_power(hdev, hub, port1, set);
>
>And call usb_unlock_device(hdev) here, after the port feature flags have
>been cleared.

Will add in v3.

>> +	if (rc) {
>> +		usb_autopm_put_interface(intf);
>> +		return rc;
>> +	}
>> +
>> +	usb_autopm_put_interface(intf);
>> +
>> +	return count;
>
>
>Simpler:
>
>	if (rc =3D=3D 0)
>		rc =3D count;
>
>	usb_autopm_put_interface(intf);
>	return rc;

Good Idea, I will change this.

>> +}
>> +static DEVICE_ATTR_WO(port_power);
>> +
>>  static ssize_t location_show(struct device *dev,
>>  			     struct device_attribute *attr, char *buf)
>>  {
>> @@ -153,6 +201,7 @@ static struct attribute *port_dev_attrs[] =3D {
>>  	&dev_attr_location.attr,
>>  	&dev_attr_quirks.attr,
>>  	&dev_attr_over_current_count.attr,
>> +	&dev_attr_port_power.attr,
>>  	NULL,
>>  };
>
>You might want to disable the new sysfs file (don't create it or have it
>return -EOPNOTSUPP) if the hub doesn't support per-port power switching.

Is it possible to read out if this feature is not working by the hub?

The most hubs, that I was working with, did not really toggle the vbus,
because the physical logic to switch a regulator was completely missing
in the hardware. But with removing the other PORT_FEATURES the hub
behaved like the port is just not powered any more.

Because of that; I am currently curious if we just should rename that
property to something more generic like "enable" or "disable". So that
as the real vbus power switching is missing, the hubs port switching
does still function like intended.

>Finally, you should add a test to port_event() in hub.c, probably where
>the pm_runtime_active() check is.  If the port is powered off, return
>before doing any of the warm_reset or connect_change processing.

I don't understand jet why this is needed. In all my tests, the hubs
port was just not functioning any more. Regardless if the hub
was capable of real vbus switching or not. Just as described above.
Is it possible that this is already handled correctly because of the
other cleared port_features I mentioned?

In v3 I will also add port_power_show to make it possible for the
userspace to read out the current port status but returning the
value of test_bit(port1, hub->power_bits);.

Regards,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmKY0EMACgkQC+njFXoe
LGSFFhAAt7uD7ZLhI7tiF4U7hyFo9RsUTgPdICu8unhPR7IVYirQHFiO587TGgmE
80EC59jp/Vl3yh7nwivH2NI5J/N9+99yITFS8GgoA/hMmYO7lu3T335954A1+Hjg
FPbfMeeXk55psvU3EWaAp0zRvK+Gysy6JS0CRh+te08Jwxu1WqgKbZIWcGhecG3g
yjs9eedEABkx01XYlv1RiQD/DLnv5OUkF++KyahwrnFaa+etQKSNVJpwky3o9ZXD
zy7gEqGmr6hJFQhJwdQfYB80JQOGZXaYOCRkO8ZOgkUCirR3loALC0jx8SvJZa+l
xq0Z+0k0uqxKzh672+vUmI6nwkKJf6ybHsoWPiq3L9/HXfgqtdJs73fD3vj5TUxd
BadLaGYsZVyjU4zi8g7VFvVic2TZ+Ia2g5js8A83NJkfxyV7uNY+ljCObpaK/1s6
EiV+IAykePws3g2luUGCYzFDGQCbWoRmEX3J9e/pB4fTl/a5jNnmVZaP4DjcnYCW
QF5mIVm0/uXAi2deZue7LRGy/xmvlb6NrMctLQZe6hQewlbkpLWiEv0JT0A/EnTl
ebC2Njb8G+e+L/j/CjprurUl0sHalWBcObhx/ypBskzXslVfZ6jy2fld7ZGhptvb
ZXQiOAxTBsQWF9OqQN+zkKWXdmhDPHgwVmkg5JWHzJ8KncjMUD4=
=3UJr
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--

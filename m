Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 661DD53CDFC
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jun 2022 19:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344366AbiFCRWQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jun 2022 13:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344364AbiFCRWP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jun 2022 13:22:15 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4459826F9
        for <linux-usb@vger.kernel.org>; Fri,  3 Jun 2022 10:22:11 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nxAzy-0004C2-3H; Fri, 03 Jun 2022 19:22:10 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nxAzx-0007Qc-AB; Fri, 03 Jun 2022 19:22:09 +0200
Date:   Fri, 3 Jun 2022 19:22:09 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v3] usb: hub: port: add sysfs entry to switch port power
Message-ID: <20220603172209.GD26638@pengutronix.de>
References: <20220603115222.2151283-1-m.grzeschik@pengutronix.de>
 <YpovuqKtQBKQoVos@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UfEAyuTBtIjiZzX6"
Content-Disposition: inline
In-Reply-To: <YpovuqKtQBKQoVos@rowland.harvard.edu>
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


--UfEAyuTBtIjiZzX6
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 03, 2022 at 11:58:50AM -0400, Alan Stern wrote:
>On Fri, Jun 03, 2022 at 01:52:22PM +0200, Michael Grzeschik wrote:
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
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>
>> ---
>
>This is looking a lot better.  I have only a few small comments.
>
>> v1 -> v2:
>>          - improved patch description
>>          - moved usb_hub_set_port_power to end of function
>>          - renamed value to set
>>          - removed udev variable
>>          - added usb_set_configuration set to -1 before removing device
>>          - calling autosuspend of udev before usb_disconnect, ensuring h=
ub_suspend succeeds
>>          - removed port_dev->child =3D NULL assignment
>>          - directly returning count on no failure success
>>          - removed test for hub->in_reset
>>          - using usb_autopm_get_interface/usb_autopm_put_interface aroun=
d hub handling
>>          - locking usb_disconnect call
>>          - using &port_dev->child instead of local udev pointer
>>          - added Documentation/ABI
>>
>> v2 -> v3:
>>          - renamed sysfs file to disable instead of port_power
>>          - added disable_show function to read out the current port state
>>          - moved usb_lock/unlock_device near put/get_interface
>>          - removed unnecessary usb_set_configuration of port_dev->child =
before disconnect
>>          - removed unnecessary usb_autosuspend of port_dev->child before=
 disconnect
>>          - moved clearing of port_feature flags to be done after usb_hub=
_set_port_power
>>          - checking for hub->disconnected after locking hdev
>>          - updated the ABI documentation
>>
>>  Documentation/ABI/testing/sysfs-bus-usb | 11 +++++
>>  drivers/usb/core/port.c                 | 61 +++++++++++++++++++++++++
>>  2 files changed, 72 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-usb b/Documentation/ABI=
/testing/sysfs-bus-usb
>> index 7efe31ed3a25c7..d907123ac5d0f9 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-usb
>> +++ b/Documentation/ABI/testing/sysfs-bus-usb
>> @@ -253,6 +253,17 @@ Description:
>>  		only if the system firmware is capable of describing the
>>  		connection between a port and its connector.
>>
>> +What:		/sys/bus/usb/devices/.../<hub_interface>/port<X>/disable
>> +Date:		June 2022
>> +Contact:	Michael Grzeschik <m.grzeschik@pengutronix.de>
>> +Description:
>> +		This file controls the state to USB ports, including
>
>s/to USB ports/of a USB port/

Okay

>> +		Vbus power output (but only on hubs that support
>> +		power switching -- most hubs don't support it). When
>> +		turning a port off, the port is unusable: Devices
>
>s/When turning a port off/If a port is disabled/

Okay

>> +		attached to the port will not be detected, initialized,
>> +		or enumerated.
>> +
>>  What:		/sys/bus/usb/devices/.../power/usb2_lpm_l1_timeout
>>  Date:		May 2013
>>  Contact:	Mathias Nyman <mathias.nyman@linux.intel.com>
>> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
>> index d5bc36ca5b1f77..8343590c3800f8 100644
>> --- a/drivers/usb/core/port.c
>> +++ b/drivers/usb/core/port.c
>> @@ -17,6 +17,66 @@ static int usb_port_block_power_off;
>>
>>  static const struct attribute_group *port_dev_group[];
>>
>> +static ssize_t disable_show(struct device *dev,
>> +			      struct device_attribute *attr, char *buf)
>> +{
>> +	struct usb_port *port_dev =3D to_usb_port(dev);
>> +	struct usb_device *hdev =3D to_usb_device(dev->parent->parent);
>> +	struct usb_hub *hub =3D usb_hub_to_struct_hub(hdev);
>> +	int port1 =3D port_dev->portnum;
>> +	bool state =3D test_bit(port1, hub->power_bits);
>> +
>> +	return sprintf(buf, "%s\n", state ? "0" : "1");
>
>Maybe "false" and "true" instead of "0" and "1"?

I prefer 0 and 1 since we also feed this to the file.


Also, I just found out that just parsing power_bits is not enough.

E.g. when we use other tools to set clear PORT_POWER on the hub like
uhubctl to disable a port. The value does not represent the real state
of the port.

I think it is better to use hub_port_status and port_is_power_on from
hub.c to test the real state by sending a GET_STATUS command.

For this, the functions need to be unset static and exported via hub.h.

I will add this in v4.

>> +}
>> +
>> +static ssize_t disable_store(struct device *dev, struct device_attribut=
e *attr,
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
>
>Is this test needed?  If it is then it should be present in
>disable_show() as well, and the line above that calls to_usb_interface()
>should not run until after the test has been done.
>
>However, I suspect the test isn't needed.

Okay, I will remove it.

>> +
>> +	rc =3D strtobool(buf, &set);
>> +	if (rc)
>> +		return rc;
>> +
>> +	rc =3D usb_autopm_get_interface(intf);
>> +	if (rc < 0)
>> +		return rc;
>> +
>> +	usb_lock_device(hdev);
>> +	if (unlikely(hub->disconnected))
>
>Add:		rc =3D -ENODEV;
>

Right.

>> +		goto out_hdev_lock;
>> +
>> +	if (set && port_dev->child)
>> +		usb_disconnect(&port_dev->child);
>
>I think the logic will be easier to understand if you rename "set" to
>"disabled".

Much better!

>> +
>> +	rc =3D usb_hub_set_port_power(hdev, hub, port1, !set);
>> +
>> +	if (set) {
>> +		usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_CONNECTION);
>> +		if (!port_dev->is_superspeed)
>> +			usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_ENABLE);
>> +	}
>> +
>> +	if (!rc)
>> +		rc =3D count;
>> +
>> +out_hdev_lock:
>> +	usb_unlock_device(hdev);
>> +	usb_autopm_put_interface(intf);
>> +
>> +	return rc;
>> +}
>> +static DEVICE_ATTR_RW(disable);
>> +
>>  static ssize_t location_show(struct device *dev,
>>  			     struct device_attribute *attr, char *buf)
>>  {
>> @@ -153,6 +213,7 @@ static struct attribute *port_dev_attrs[] =3D {
>>  	&dev_attr_location.attr,
>>  	&dev_attr_quirks.attr,
>>  	&dev_attr_over_current_count.attr,
>> +	&dev_attr_disable.attr,
>>  	NULL,
>>  };
>
>Alan Stern

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--UfEAyuTBtIjiZzX6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmKaQz4ACgkQC+njFXoe
LGQjUBAAr4CTCIeCU0sXVi5MyMjaKV9O0qS7s6gDngGV/7SIySQp78VJFUAgM0E3
/9xLyFVKRfY6bz4tve0lTfo5FjbTq0Cjrh7ERNQibNIujyE0xZbDekU8sIQ/feGi
7Q070rPz8j991xyfegfCaeHlUWFt+LhmpB2do6Eu5MA0OzVXUDqIZ/m00np5nOus
iz3ocgjdRrhpFi9hTIbXI64qAWur9Kbxee/H1MgiivRXC8lkqgQz3uPaz0vZsYuX
NKaqQRQenhZFug+PZ6swoIdCXN5ds4U4FI/lDtV1MRfsd6TGJTYYqNIl0HdfY5Gs
IIDDhlipJUItKKs9qPmVxR+cN67ZurzfRt1w+pceuCujRsngFZp2hHy7lGS7iMQQ
4taP9lcB7Rt7oUgAwq8CAWDCT8aq/K6uynsGg49Pk5bWiZqFIdrJGLQWVpD0/SYs
d+v+p7uacJT6NhkkrvnHg4odz0F3JQ/Ac9ey0K5s6vUQySkXQ9A5XaqfY3RuQcOF
eEpXEs8a9trYFpkDMxNoL78Sla9kLUFQlnoSw9zPdoJr6J0oA+cGs9snroWwm97i
R87Di3L4l/YnyMuMl0HM/uIX4cpzteiC3rjfOxswfWE74+1VTlvbzgpQEi3aEnXS
pCMFUfk33P6Nwx281Ame9T2mFfiCBbl/cWKGBTzcDg1wLhcuw24=
=lfoC
-----END PGP SIGNATURE-----

--UfEAyuTBtIjiZzX6--

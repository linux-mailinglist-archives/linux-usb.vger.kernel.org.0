Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EDBE523EFF
	for <lists+linux-usb@lfdr.de>; Wed, 11 May 2022 22:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347847AbiEKUhf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 16:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240081AbiEKUhd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 16:37:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B53C289A8
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 13:37:31 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1not5M-00046W-NC; Wed, 11 May 2022 22:37:28 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1not5L-0005Ug-Ol; Wed, 11 May 2022 22:37:27 +0200
Date:   Wed, 11 May 2022 22:37:27 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: hub: port: add sysfs entry to switch port power
Message-ID: <20220511203727.GG27481@pengutronix.de>
References: <20220510231317.1874608-1-m.grzeschik@pengutronix.de>
 <YnvDlhlcVGoerhLz@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2E/hm+v6kSLEYT3h"
Content-Disposition: inline
In-Reply-To: <YnvDlhlcVGoerhLz@rowland.harvard.edu>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 21:56:42 up 42 days,  8:26, 76 users,  load average: 0.10, 0.19,
 0.17
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--2E/hm+v6kSLEYT3h
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Wed, May 11, 2022 at 10:09:26AM -0400, Alan Stern wrote:
>On Wed, May 11, 2022 at 01:13:17AM +0200, Michael Grzeschik wrote:
>> This patch adds an sysfs switch to enable/disable a port on an power
>> switchable hub. It also ensures that the associated device gets
>> disconnected from the logical usb tree.
>
>This says what the patch does.  It does not explain why the patch was
>written or why anybody would want to switch the power on a hub's port.

Good point. This goes together with the missing ABI documentation.
I will fix it in the v2.

>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> ---
>>  drivers/usb/core/port.c | 47 +++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 47 insertions(+)
>>
>> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
>> index d5bc36ca5b1f77..abc618d87888f3 100644
>> --- a/drivers/usb/core/port.c
>> +++ b/drivers/usb/core/port.c
>> @@ -17,6 +17,52 @@ static int usb_port_block_power_off;
>>
>>  static const struct attribute_group *port_dev_group[];
>>
>> +static ssize_t port_power_store(struct device *dev, struct device_attri=
bute *attr,
>> +			    const char *buf, size_t count)
>> +{
>> +	struct usb_port *port_dev =3D to_usb_port(dev);
>> +	struct usb_device *udev =3D port_dev->child;
>> +	struct usb_device *hdev =3D to_usb_device(dev->parent->parent);
>> +	struct usb_hub *hub =3D usb_hub_to_struct_hub(hdev);
>> +	int port1 =3D port_dev->portnum;
>> +	bool value;
>> +	int rc =3D 0;
>> +
>> +	if (!hub)
>> +		return -EINVAL;
>> +
>> +	if (hub->in_reset)
>> +		return -EBUSY;
>
>What point is there in doing this test?  The value of hub->in_reset may
>change an instant later.  Unless you acquire the hub's lock first.
>For that matter, you should be holding the hub's lock while you call
>usb_hub_to_struct_hub() -- unless you don't care if the hub gets
>disconnected while this routine is running.  Or if udev does.

I could remove it for the sake of simplicity in the first version.
If this will matter in the future we can add it then.

>> +
>> +	rc =3D strtobool(buf, &value);
>> +	if (rc)
>> +		return rc;
>> +
>> +	if (value)
>> +		usb_remote_wakeup(hdev);
>
>Why call usb_remote_wakeup()?  The function was not intended to be used
>this way; it was meant to be used when a device sends a wakeup request.

I found this function was called when plugging in a device into an
suspended hub. So it seemed to be the right thing to do.

>Furthermore, nothing prevents the hub from going back into runtime
>suspend the moment this function completes.

OK. That needs to be locked than.

Is it with usb_autopm_get_interface and usb_autopm_put_interface?

>If you want to bring a USB device out of runtime suspend, call
>usb_autoresume_device().  And then don't forget to call
>usb_autosuspend_device() when you're done with it.

In case the hub had only one device attached to one one port. When I
called this sysfs function on that port, the hub would suspend
afterwards. Which is probably a correct way to go for a hub with
no active devices attached.

When replacing usb_remote_wakeup with usb_autoresume_device this
works exactly the same. So I will replace it in v2.

The extra usb_autosuspend_device for the hub is probably not necessary.

>> +
>> +	rc =3D usb_hub_set_port_power(hdev, hub, port1, value);
>> +	if (rc)
>> +		return rc;
>
>You probably should acquire the port's lock before doing this.
>Otherwise some other thread might be doing something else to the port at
>the same time.

Yes. I will do that in v2.

>> +
>> +	if (!value) {
>> +		usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_CONNECTION);
>> +		if (!port_dev->is_superspeed)
>> +			usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_ENABLE);
>> +
>> +		if (udev) {
>> +			port_dev->child =3D NULL;
>
>That assignment is not necessary; usb_disconnect() will take care of it.

Here are two things that are in play.

First I have to set port_dev->child =3D NULL before calling
usb_disconnect. Otherwise the following automatic hub_suspend call (in
case this was the last operational port of the hub) will print the
message "device x-y not suspended yet" and will fail the hub to
suspend.

When calling usb_autoresume_device(udev) instead and before calling
usb_disconnect, this is no longer the case. The hub will be succesfully
suspended.

The second thing is the assignment. I still have to explicitly assign NULL =
to
port_dev->child. Otherwise a following enable of this port via this sysfs w=
ill
run into an hub_event with the usb_disonnect for the device on that port. B=
ut
this will spit out a ugly traceback leading with the following error:

[   21.718574] usb 2-1.1: USB disconnect, device number -1

[   21.719100] Unable to handle kernel paging request at virtual address 96=
d628cc24e2e078
[   21.719807] Mem abort info:
[   21.720065]   ESR =3D 0x96000044
[   21.720348]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[   21.720827]   SET =3D 0, FnV =3D 0
[   21.721109]   EA =3D 0, S1PTW =3D 0
[   21.721447]   FSC =3D 0x04: level 0 translation fault
[   21.721891] Data abort info:
[   21.722157]   ISV =3D 0, ISS =3D 0x00000044
[   21.722505]   CM =3D 0, WnR =3D 1
[   21.722779] [96d628cc24e2e078] address between user and kernel address r=
anges
[   21.723429] Internal error: Oops: 96000044 [#1] PREEMPT SMP
[   21.723927] Modules linked in: uio_pdrv_genirq fuse
[   21.724380] CPU: 0 PID: 58 Comm: kworker/0:3 Not tainted 5.18.0-rc6+ #93
[   21.724977] Hardware name: Radxa ROCK3 Model A (DT)
[   21.725412] Workqueue: usb_hub_wq hub_event
[   21.725802] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[   21.726419] pc : usb_disable_endpoint+0x7c/0xdc
[   21.726832] lr : usb_disable_device_endpoints+0xbc/0xe0
[   21.727301] sp : ffffffc009b33b30
[   21.727597] x29: ffffffc009b33b30 x28: ffffff8003ad4ed8 x27: 00000000000=
00001
[   21.728239] x26: ffffff8004344928 x25: 0000000000000000 x24: ffffffc0096=
eb8e0
[   21.728885] x23: ffffff80043448a8 x22: ffffff8003961800 x21: 00000000000=
00001
[   21.729527] x20: 96d628cc24e2e034 x19: ffffff8004344800 x18: fffffffffff=
fffff
[   21.730168] x17: 0000000000000001 x16: 0000000000000001 x15: ffffffc089b=
33857
[   21.730810] x14: 0000000000000000 x13: 312d207265626d75 x12: 6e206563697=
66564
[   21.731452] x11: 00000000fffff7ff x10: 00000000fffff7ff x9 : ffffffc0087=
1b8dc
[   21.732093] x8 : 000000000000bfe8 x7 : ffffffc009b33a38 x6 : 00000000000=
00001
[   21.732733] x5 : ffffffc009569000 x4 : ffffffc009569050 x3 : ffffff80043=
44878
[   21.733374] x2 : 0000000000000001 x1 : 000000000000008f x0 : 00000000000=
00001
[   21.734015] Call trace:
[   21.734235]  usb_disable_endpoint+0x7c/0xdc
[   21.734616]  usb_disable_device_endpoints+0xbc/0xe0
[   21.735054]  usb_disable_device+0x1c0/0x260
[   21.735432]  usb_disconnect+0x108/0x300
[   21.735778]  hub_event+0x1378/0x19c0
[   21.736102]  process_one_work+0x220/0x49c
[   21.736469]  worker_thread+0x154/0x450
[   21.736810]  kthread+0xfc/0x110
[   21.737096]  ret_from_fork+0x10/0x20
[   21.737429] Code: f941c474 340001e0 f901c47f b4ffff14 (b900469f)
[   21.737970] ---[ end trace 0000000000000000 ]---

Did I miss something?

>> +			usb_disconnect(&udev);
>> +		}
>> +	}
>
>Alan Stern

Thanks,
Michael Grzeschik

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--2E/hm+v6kSLEYT3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmJ8HoQACgkQC+njFXoe
LGSunw/7Bq86oW7sMgPU6JUTrAI312+zpucb/gDUNqnHSUiremX3oyRCy2TSeJQ5
YpyWFEYnyB2ZacXQsaQcL3f3Oc0GErpCZTG7ftb7ydgzG6igYnz+7YJnQnwBT1Tq
dBcnTI2iND4Vpr9WvJ8b+Y+Z7ZrQIa4ZljoETIMLfc2qOxmz+0Vv40wSthbVuQP5
fT9uQMYFV9DRhBr+YEFm6mtnkypppXma1oSSEVr/SAIraQfW2+6gLpy1EcDJ3Ghm
Ep/5ciuXQdTliBQmA6TGbR6TMMl9fnaD8Ap+5XUzCXcV6Dk7QodeyYiAuNVLJ1B1
oJT1mtGwirJ/AXhuz3ifAHttE02DyIpaqt2YlYrdhzayzlEcov/h1hRaPs3oNxRE
6PIMG/9FztbifCZWv6SpwqlE+2Ww2C+sryMOEQe/td/rtVyYtb2SksjyuXkxcVud
rhv7wWuqjtNPbtjPerum898lfpZWsOhqlIzdhYTEYeD7pnjKRuuuFUOMrs14sayY
xVoL9MnqTN7EpB05HgPLdePXAk1Ffd/GFqYx5JCVT67i3ip8RWvB/+3CTBwtYTK8
fN50K0cHylGyyA1Ze9KjMqm/LwlJSNPkquoIfvSRN9/voVSE+WN+uW+XOSC1FYRF
ICzwreBq+xKvWRN6fUkQrduiIB3k6gpiENmXvAPh7P0EntMpJew=
=pF1k
-----END PGP SIGNATURE-----

--2E/hm+v6kSLEYT3h--

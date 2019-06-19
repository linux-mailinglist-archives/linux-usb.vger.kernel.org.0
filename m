Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC834B21A
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2019 08:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbfFSG2h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jun 2019 02:28:37 -0400
Received: from mga17.intel.com ([192.55.52.151]:37176 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725892AbfFSG2h (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Jun 2019 02:28:37 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Jun 2019 23:28:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; 
   d="asc'?scan'208";a="358093566"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga005.fm.intel.com with ESMTP; 18 Jun 2019 23:28:34 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        John Youn <John.Youn@synopsys.com>
Cc:     "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [RFC] Sorting out dwc3 ISOC endpoints once and for all
In-Reply-To: <30102591E157244384E984126FC3CB4F63A1230F@us01wembx1.internal.synopsys.com>
References: <87a7etd8s7.fsf@linux.intel.com> <2B3535C5ECE8B5419E3ECBE30077290902E78AF3D7@us01wembx1.internal.synopsys.com> <30102591E157244384E984126FC3CB4F63A11B8A@us01wembx1.internal.synopsys.com> <87fto7gy1o.fsf@linux.intel.com> <30102591E157244384E984126FC3CB4F63A1230F@us01wembx1.internal.synopsys.com>
Date:   Wed, 19 Jun 2019 09:28:30 +0300
Message-ID: <87a7eef5rl.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
>>>>> Would there be any obvious draw-back to going down this route? The th=
ing
>>>>> is that, as it is, it seems like we will *always* have some corner ca=
se
>>>>> where we can't guarantee that we can even start a transfer since ther=
e's
>>>>> no upper-bound between XferNotReady and gadget driver finally queuein=
g a
>>>>> request. Also, I can't simply read DSTS for the frame number because =
of
>>>>> top-most 2 bits.
>>>>>
>>>> For non-affected version of the IP, the xfernotready -> starttransfer
>>>> time will have to be off by more than a couple seconds for the driver
>>>> to produce an incorrect 16-bit frame number. If you're seeing errors
>>>> here, maybe we just need to code review the relevant sections to make
>>>> sure the 14/16-bit and rollover conditions are all handled correctly.
>>> I think what Felipe may see is some delay in the system that causes the
>>> SW to not handle XferNotReady event in time. We already have the "retry"
>>> method handle that to a certain extend.
>>>
>>>> But I can't think of any obvious drawbacks of the quirk, other than
>>>> doing some unnecessary work, which shouldn't produce any bad
>>>> side-effects. But we haven't really tested that.
>>>>
>>> The workaround for the isoc_quirk requires 2 tries sending
>>> START_TRANSFER command. This means that you have to account the delay of
>>> that command completion plus potentially 1 more END_TRANSFER completion.
>>> That's why the quirk gives a buffer of at least 4 uframes of the
>>> scheduled isoc frame. So, it cannot schedule immediately on the next
>>> uframe, that's one of the drawbacks.
>>>
>>>
>>> Hi Felipe,
>>>
>>> Since you're asking this, it means you're still seeing issue with your
>>> setup despite retrying to send START_TRANSFER command 5 times. What's
>>> the worse delay responding to XferNotReady you're seeing in your setup?
>> There's no upper-bound on how long the gadget will take to enqueue a
>> request. We see problems with UVC gadget all the time. It can take a lot
>> of time to decide to enqueue data.
>
> That's why there's a mechanism in the controller to return bus-expiry
> status to let the SW know if it had scheduled isoc too late. SW can do 2
> things: 1) re-schedule at a later timer or 2) send END_TRANSFER command
> to wait for the next XferNotReady to try again.

All of this is still rather flakey. Can I send consecutive END_TRANSFER
commands and get new XferNotReady at any moment? Consider this
situation:

. transfer started
. transfer completes with status Missed ISOC
. driver issues END_TRANSFER (as required by docs)
. XferNotReady fires
. driver updates current frame number
. several mS of nothing
. finally gadget enqueues a transfer
. Start Transfer command
. completes with Bus Expiry

Can I issue *another* END_TRANSFER at this point? I don't even have a
valid transfer resource since transfer wasn't started.

The best "workaround" I can think of would be to delay END_TRASFER until
ep_queue time.

>> Usually I hear this from folks using UVC gadget with a real sensor on
>> the background.
>>
>> I've seen gadget enqueueing as far as 20 intervals in the future. But
>> remember, there's no upper-bound. And that's the problem. If we could
>> just read the frame number from DSTS and use that, we wouldn't have any
>> issues. But since DSTS only contains 14 our of the 16 bits the
>> controller needs, then we can't really use that.
>
> You can create another quirk for devices that have this behavior to use
> frame number in DSTS instead.  As John had pointed out and mentioned,=20
> this will only work if the service interval and the delay in the
> scheduling of isoc is within 2 seconds.

well, that's better than nothing, but there's no upper-bound for the
gadget driver, really.

> You will need to calculate this value along with BIT(15) and BIT(14) of
> XferNotReady for rollovers.
>
>>
>> To me, it seems like this part of the controller wasn't well
>> thought-out. These extra two bits, perhaps, should be internal to the
>> controller and SW should have no knowledge that they exist.
>
> These values are internal. SW should not have knowledge of it. This
> implementation will not follow the programming guide and should be used
> as a quirk for devices that are too slow to handle the XferNotReady
> event but want to schedule isoc immediately after handling the event.

They are *not* internal if SW needs to know that to start a transfer
properly it needs these extra two bits :-) What I meant to say was that
we should never have a 16-bit frame number. Only 14 bits. But in any
case, we can't change the HW now :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl0J1g4ACgkQzL64meEa
mQZ8sQ/+LL5tvOgyttXHPnDteksJTkj7M9MWrl9ImyZai6heIO8Esk2UedRnuJak
t3Q6jZn4evqeH8lwOXFcm+me7XHny0yFRtNS8bLcYgUa867iZ5ylm3ek84kKvgUx
4rkwN8vfwWeXfKJgUX4XL29K5Ex3Tq/4opONaWYXeWTgo3owkkCWQEA3JyWI+NXI
EBqUdQMMYb6V6ETHPOV03tjsgfihrSPPxd4MvSXlW0mF/GZtb+H5keb1YEK/iEtT
7H+9KBI+tFSB1BfBy02j6gEiUAkHuXcmJT2vhJoj69X9vB9dms/sY4LdjS9xUP8C
OYOJUS1oQMserLXURhrl3rWg9gBaqppYJJ614EiAWndzbSJlQQWxC0A0lCaXCwot
U8rTzipqKHj7MnlW1mCzbX8fsFNT6uTbJBr3H5BZpX9j9BvmRb6LY5q5HMnLskx4
PJDJbEunWvclQkeu/XlKxhyfEvKGe5eAtoV+iDef9mT2WKUietpljcSLbuoCkK9R
YJ79AT0K4K3GeaFXZtkCiCBhBpTgs7X0h/a2piY33clAmPLDN2JBnZ0e+asUw0qn
xFR/+aUVB7Rgcl4Zyd9MdONn8l7MqL8heZNFb0Hw23f4mXIv4HoOAa5XbbUZuKiB
44yViGIs+BHXQkGMkgg89xaInMnzoAIYmow06mES4chPQRlOAGY=
=5Svd
-----END PGP SIGNATURE-----
--=-=-=--

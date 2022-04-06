Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56E1E4F5C77
	for <lists+linux-usb@lfdr.de>; Wed,  6 Apr 2022 13:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbiDFLgk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Apr 2022 07:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbiDFLew (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Apr 2022 07:34:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCCF221A0C1
        for <linux-usb@vger.kernel.org>; Wed,  6 Apr 2022 01:26:18 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nc0zX-0005UN-QY; Wed, 06 Apr 2022 10:26:15 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nc0zV-0005wl-0S; Wed, 06 Apr 2022 10:26:13 +0200
Date:   Wed, 6 Apr 2022 10:26:12 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Dan Vacura <w36195@motorola.com>
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>, linux-usb@vger.kernel.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 1/5] usb: gadget: uvc: reset bytesused on queue cancel
Message-ID: <20220406082612.GC6952@pengutronix.de>
References: <20220402233914.3625405-1-m.grzeschik@pengutronix.de>
 <20220402233914.3625405-2-m.grzeschik@pengutronix.de>
 <3a6bb767-a114-1d60-3600-52cef493ed58@omp.ru>
 <YkxZzvbazHEX2EAg@p1g3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WfZ7S8PLGjBY9Voh"
Content-Disposition: inline
In-Reply-To: <YkxZzvbazHEX2EAg@p1g3>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:22:07 up 6 days, 20:51, 66 users,  load average: 0.25, 0.21, 0.20
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


--WfZ7S8PLGjBY9Voh
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dan,


On Tue, Apr 05, 2022 at 10:01:34AM -0500, Dan Vacura wrote:
>Looks like we found the same issue, I submitted the same change the
>other week here:
>https://lore.kernel.org/all/20220331184024.23918-1-w36195@motorola.com/
>
>One difference is you had the reset outside of the queue lock. I figured
>to keep it within the lock since we can get a cancel while the pump
>worker is running and this can negate the reset. Do you agree?

Yes! Your patch is to favour and mine can be dropped from this series.

Thanks,
Michael

>
>On Tue, Apr 05, 2022 at 11:43:16AM +0300, Sergey Shtylyov wrote:
>> Hello!
>>
>> On 4/3/22 2:39 AM, Michael Grzeschik wrote:
>>
>> > On uvcg_queue_cancel the buf_used counter has to be reset. Since the
>> > encode function uses the variable to decide if the encoded data has
>> > reached the end of frame. Intermediate calls of uvcg_queue_cancel can
>> > therefor lead to miscalculations in the encode functions, if buf_used
>>
>>    Therefore?
>>
>> > was not properly reset.
>> >
>> > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> [...]
>>
>> MBR, Sergey
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--WfZ7S8PLGjBY9Voh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmJNTqEACgkQC+njFXoe
LGQ5/hAAwCNPula0FM1GHsGlXg8wtmqZTzM0iPFdvw+zVyZxSdbpOTQqWfU/wBGG
ExrRKVnWw1MuUl9xfts35/09+kRRb2bVKvFI7eC7Jlqy8k8bbLrDyDIQYTvTnlmn
q+zVDQqDTFlli5oyRBh4+L53E/PFib2d8wqpe6l6Wn7QH/PlWO5AVZY0TIiWN80z
wO28HLx3UTwqXViJb7t8RFecNHEplqvB4se6/XTNCryc4bZdeeJjxOrXwF/FHx49
LIOz2ZRUvtIcnbgLJiyMWHJ2w918yri9OVTT3pIf3eKEw74hC1zZdZbokKbYZMxO
sFTAZC2TGd+Bh4Yz98SApLEF84VURnwNLRICixC3ZeWkRyo0J0cShA7S/ZwWnnc6
jpNAQFBcWCU8Lh4mOJmFLnNVqF0QYaEDnP/F0P2J+2rThXjgK89FOSWMX+C81h0z
Skq//ONYxKu9k7wF3z9Lzl3EF9pEGijE80ZfUjBQwgDlOQvKbwE7ltZJtY6DBN95
U0kEhsK7xoHujEVzyDnbwBbocjS58tKLhp/p6N4s+XfAaYC+F8Q+s59wdrEfEWSt
ej6CaoxxxayXGMj24ytXVD3UEuA/6sFdigQGo+JxxU6fY6Gg9Wf14M3ZB61KK+t5
v8RfWQ62yjyKefOlR/fk5nT7uqsCd0hgI84KIKhDkyH7mHeF3Ic=
=RouO
-----END PGP SIGNATURE-----

--WfZ7S8PLGjBY9Voh--

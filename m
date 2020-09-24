Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7E48276AC4
	for <lists+linux-usb@lfdr.de>; Thu, 24 Sep 2020 09:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbgIXH3C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 03:29:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:43060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726655AbgIXH3C (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 24 Sep 2020 03:29:02 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5FA022395B;
        Thu, 24 Sep 2020 07:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600932541;
        bh=C5bOJI2UYsQKKvUHF5ywMqKPwJJnNyoKub/rnhn4go4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=l0GNLsmH1aHGCXGZH4XlsfOH3O9d+qNnqMPjxXEsxC2ld7lHcu/lGhyjTViMcAk6i
         OuofMbXNb3UzhEberjRZzYox2g733kvTO22CL4QDUJXhzhyhv71Xvfa+W0/2TcHgAc
         +HCLq3p1DJvBpaF2IxbU06+pSIUDBej1GYVIctKM=
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Lorenzo Colitti <lorenzo@google.com>
Cc:     linux-usb@vger.kernel.org, zenczykowski@gmail.com
Subject: Re: [PATCH v3 0/3] usb: gadget: f_ncm: support SuperSpeed Plus,
 improve on SuperSpeed
In-Reply-To: <20200909104054.GA615992@kroah.com>
References: <20200825055505.765782-1-lorenzo@google.com>
 <20200909104054.GA615992@kroah.com>
Date:   Thu, 24 Sep 2020 10:28:54 +0300
Message-ID: <87d02beiq1.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi Greg,

Greg KH <gregkh@linuxfoundation.org> writes:
> On Tue, Aug 25, 2020 at 02:55:02PM +0900, Lorenzo Colitti wrote:
>> This patch series makes the NCM gadget usable at SuperSpeed Plus
>> speeds (currently, it crashes with an oops). It also improves the
>> behaviour on SuperSpeed and above by making simple performance
>> improvements and by fixing the speeds that are reported to the
>> host (currently 851 Mbps, which is much below actual throughput).
>>=20
>> Tested on a gadget directly connected to a Linux laptop running
>> 5.6.14 and cdc_ncm, using both 5 Gbps and 10 Gbps cables. iperf3
>> single TCP connection throughput (gadget to host) is > 2 Gbps on
>> SuperSpeed and > 4 Gbps on SuperSpeed Plus.
>>=20
>> Changes since v1:
>> - Set bMaxBurst to 15 on endpoints.
>> - Report more realistic speeds than 851 Mbps.
>>=20
>> Changes since v2:
>> - Remove the separate SuperSpeed Plus descriptors and function
>>   which were just a copy of the SuperSpeed descriptors and
>>   function. Instead, just pass the SuperSpeed function to
>>   usb_assign_descriptors for both SuperSpeed and SuperSpeed
>>   Plus.
>> - Don't set bMaxBurst on the interrupt endpoint. This is
>>   incorrect/useless and forbidden by the spec.
>> - Make the speed constants unsigned literals.
>>=20
>>=20
>
> Felipe, did you miss this series, or is it still in your to-review queue
> you are working your way through?

Just got to this one :-)


=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9sSrYRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQYIsg/7BMYYbH9j+LQrY1Fc+ooTj5ZaphC9JFQ7
CveRhjl/6UlMonnvZeutsyLhwYHMG5+mXiX/vTw9Y6On5KGKCAblJM8frPBVJOXJ
/iJRcPIucxvx6ZdxwOTn12AJS9nelZta/j9xWjeUB0NlOLB6F1CJa7ehJIfDtIhf
R+jCIiIwmV9U/Lae8i/M52YKH9QdvdUkpsJFBCeQhnQV+YNDdUTbR2hbVS8AMMCf
8EKm+0wtXWxVBsJ+n3x5iywO+uLYXrKeq0L0v7bYP3rKW9tUzo4e2hxDg8vDC8SZ
1kH748Cx/U849TE6JirG+2xDJxl+WN2HFOaeHaTKdVmB5PggWcg4Ha6m4/+nF7Md
aBkUdw1+LRB9/Vczf5LpyJWt1/hZtdRSLvBJbvD28kk/DLtGkUw17vg7Tz1XbsLM
jpsH2C52QjqG6hRb9kYt2x0CiF2+S4Ky0IpgqS69MlO5agDyTEQXj3VCmD4DM+Xo
vo1RLtEd7Ee0GjOvRKm1APOT3GIkpKg9dhes2kE8LHo9TSAXHGoCu+ochoChLDOJ
Bf5zVyGzci3kq3UCKafYcVemCxe4bB2mHyVRib38n0ck5jttFAmJMfJW9rdCn5II
CQ+LI4SQSo5KJjS6UeALa3gFyozEtYkk1CV9SEljhaviwrmXftqz6xZDGYjV2Ba7
CTRBe9ZgjDc=
=oi0k
-----END PGP SIGNATURE-----
--=-=-=--

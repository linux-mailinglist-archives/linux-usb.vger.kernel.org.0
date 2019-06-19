Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 195E34B231
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2019 08:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725980AbfFSGgy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jun 2019 02:36:54 -0400
Received: from mga17.intel.com ([192.55.52.151]:37511 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725881AbfFSGgy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Jun 2019 02:36:54 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Jun 2019 23:36:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; 
   d="asc'?scan'208";a="335101391"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga005.jf.intel.com with ESMTP; 18 Jun 2019 23:36:51 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Andrey Konovalov <andreyknvl@google.com>
Cc:     USB list <linux-usb@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: Pass transfer_buffer to gadget drivers
In-Reply-To: <Pine.LNX.4.44L0.1906180948100.1659-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1906180948100.1659-100000@iolanthe.rowland.org>
Date:   Wed, 19 Jun 2019 09:36:47 +0300
Message-ID: <874l4mf5ds.fsf@linux.intel.com>
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

Alan Stern <stern@rowland.harvard.edu> writes:
>> Also, does the gadget subsystem guarantee, that we get the complete()
>> callback for the DATA stage of the OUT control request before we get a
>> setup() callback for the next control request if there's any?
>
> As I recall, this isn't mentioned in the documentation.  But the UDC
> drivers I know of do behave that way, and it's reasonable to assume
> they all do.
>
> After all, a data-stage transfer can't complete _after_ the next Setup
> packet arrives.  Reception of a new Setup packet invalidates all
> ongoing control transfers.

Considering that the gadget API handles one stage at a time, it would be
impossible for this to not be the case :-)

UDCs start a trasnfer only for the setup phase, then process the
control request to decide what to do next.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl0J1/8ACgkQzL64meEa
mQYwNQ//VL16HDNwT5DIyRyS9bIOjkS32luVIphEUrH2dH8SZw3X3YPBnOtF9JY/
BpKW5TgpD6Ek19paqln72MziYoQeiN44v1HGDKNXJiDY/cKKMVFj+a7PPaNdgJjT
3C9U5HqwBH6cb+u5Ubmdj/6tCZnkOin1N98ERV8Y6zfsOWz/qBA7+9GURpODFAmy
jHxgRV60LbzsOtnyrlTuhyILaZMQaDfoJYtnIN/RB3tx/OiwEWElexT+/Fr/VmJ9
ECdTsXPhvHVn9xHXtvjPrIfiHh8XNqWa56tKNvsKGHJQnxdpKYdOgquNUg3wrp7Z
dt2vwx94I4EOF/V6NBURUMwfJenOzmGec4gHdiYL0YFEFDolZnJqh7jvKusev3kf
CSKZf6wrM01jK+s/ak0oy5Sx+w1TekBq+lv/JGkz2G2euvmuxhey86b2/rjwWA5E
0GOc8NHn2uAwq21Rnfsk6BXaJlGpyqgT4dfrZUzcibFIVrzESz2TChIx7i2hoCOz
cah6lK0LXqr5GGPUBwpqXGsNSQ91WpFW5bjk+2B4NUwOQLeNXimSB/+1cBDTqLe0
Yl2to8AAmziMwaIsFhZo81yYQo38KVeo/ZUOSdSuuLNjbO0rFR1zsZPbyn5RXxrx
g4S8g0HsVH3v7ZgpeLwGF7nA9xyyFqAubKLrjbJmUM0odKUz/u0=
=JAQD
-----END PGP SIGNATURE-----
--=-=-=--

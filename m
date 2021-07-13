Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBA703C7052
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jul 2021 14:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236191AbhGMMfs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jul 2021 08:35:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:60896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236042AbhGMMfs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 13 Jul 2021 08:35:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D036661183;
        Tue, 13 Jul 2021 12:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626179578;
        bh=JmP+iZ3VqzDVlOdEg2AZYVwWcQypV8h36tEx043yk3s=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=q72KLW856liQyrovPvm6QUlprbIUwCIbk0AMXhX2fVMPgFIYIMYQIuaDNU8VlVTXB
         rgZdSz0BSLPNr5RbChrKvqG7AP0QWPnxvTQyU9HfF7Ju4fmG4CJQ0JhfrrL7fCW5sn
         8pSxe03Byx3DfYJlH/+neTCd10bQIa3Q7tbBESP9orslFCZ0yfsmXAEYB/8YWWjdYO
         EeLgYqeRUOUqunzFvKCUWN9/FIExrKI9/TaC4X5AhDLndF8nxu0ne6aYUdFezUafVW
         gGm766g2D/VQDRxfR6GYTElGwlCfwmgagpr+1W1voIyTiSB17xPN3fiLUqb6Yf1OQt
         mRx9jfuhvkJzg==
From:   Felipe Balbi <balbi@kernel.org>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Pavel Hofman <pavel.hofman@ivitera.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     Ruslan Bilovol <ruslan.bilovol@gmail.com>
Subject: Re: usb:gadget:u_audio: Regression in [v3,3/3] usb: gadget:
 u_audio: add real feedback implementation - wMaxPacketSize calculation
In-Reply-To: <1j8s2aa071.fsf@starbuckisacylon.baylibre.com>
References: <f861e345-3642-5bfa-0ce7-a5cd34204613@ivitera.com>
 <1j8s2aa071.fsf@starbuckisacylon.baylibre.com>
Date:   Tue, 13 Jul 2021 15:32:50 +0300
Message-ID: <87a6mqz959.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Jerome Brunet <jbrunet@baylibre.com> writes:
>> I am testing the three Ruslan's async feedback patches as modified by
>> Jerome and I hit a regression in windows 10 enumeration.
>>
>> Ruslan posted an already accepted patch
>> https://github.com/torvalds/linux/commit/789ea77310f0200c84002884ffd628e=
2baf3ad8a#diff-876615ece7fb56ce8d45fc70623bef9caa2548e810426f217fb785ffa10b=
33d5=20
>> which allowed win10 enumeration.
>>
>> Ruslan's async feedback patchset kept the change:
>> https://patchwork.kernel.org/project/linux-usb/patch/1614603943-11668-5-=
git-send-email-ruslan.bilovol@gmail.com/
>>
>> diff --git a/drivers/usb/gadget/function/f_uac2.c
>> b/drivers/usb/gadget/function/f_uac2.c
>> index 72b42f8..91b22fb 100644
>> --- a/drivers/usb/gadget/function/f_uac2.c
>> +++ b/drivers/usb/gadget/function/f_uac2.c
>> @@ -506,6 +506,10 @@  static int set_ep_max_packet_size(const struct
>> f_uac2_opts *uac2_opts,
>>
>>  	max_size_bw =3D num_channels(chmask) * ssize *
>>  		((srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1);
>> +
>> +	if (!is_playback && (uac2_opts->c_sync =3D=3D USB_ENDPOINT_SYNC_ASYNC))
>> +		max_size_bw =3D max_size_bw * FBACK_FREQ_MAX / 100;
>> +
>>  	ep_desc->wMaxPacketSize =3D cpu_to_le16(min_t(u16, max_size_bw,
>>  						    max_size_ep));
>>
>>
>> Jerome's rebase patch which was accepted recently changed the functional=
ity
>> to the original code:
>> https://patchwork.kernel.org/project/linux-usb/patch/20210603220104.1216=
001-4-jbrunet@baylibre.com/
>>
>> diff --git a/drivers/usb/gadget/function/f_uac2.c
>> b/drivers/usb/gadget/function/f_uac2.c
>> index 321e6c05ba93..ae29ff2b2b68 100644
>> --- a/drivers/usb/gadget/function/f_uac2.c
>> +++ b/drivers/usb/gadget/function/f_uac2.c
>> @@ -584,8 +584,11 @@  static int set_ep_max_packet_size(const struct
>> f_uac2_opts *uac2_opts,
>>  		ssize =3D uac2_opts->c_ssize;
>>  	}
>>
>> +	if (!is_playback && (uac2_opts->c_sync =3D=3D USB_ENDPOINT_SYNC_ASYNC))
>> +		srate =3D srate * (1000 + uac2_opts->fb_max) / 1000;
>> +
>>  	max_size_bw =3D num_channels(chmask) * ssize *
>> -		((srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1);
>> +		DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
>>  	ep_desc->wMaxPacketSize =3D cpu_to_le16(min_t(u16, max_size_bw,
>>  						    max_size_ep));
>>
>> With this version my Win10 does not enumerate the USB AUDIO device, even=
 if
>> it has only EP-IN capability (i.e. is_playback =3D true). For my setup t=
he
>> EP-IN wMaxPacketSize is 192bytes vs. 196bytes in Ruslan's version, causi=
ng
>> win10 reporting "The specified range could not be found in the range lis=
t."
>>
>
> Maybe I am lacking USB expertize, but is there any reason why a 192bytes
> maximum packet size should be considered invalid ? Just from your
> comment, I can't figure it out.

it sounds to me like one part of the descriptor claims 192 while another
claims 196, then there is a mismatch and Windows is ignoring the
interface. A quick dump of the descriptors would prove this.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmDth/IRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUgWSggAlwJjSYYuwYeMAbpi+oHLAJb5LJZINQrK
fdjRwV0Sj2dWmZF4CxXdF++JSr7aEUeNfPLkc50hJ/bjqp8ozl9h1atSGepcQNmi
eVU1Uuj5CzniJWEjsW/H6AZ1cdrAciV0bWrqVXL9w5nmbGTx5zGW9aAHPDJNBVAs
49BfBVcvFBbaLFIh72x4vyqt7K5e69aPqn6leGm64LNWsC6J/4ZRpXzX4jczyWSU
bRgEZrIK7P0gl5p1Wil9N9wm4x7LrULy29f6E8y2wB1+OTg8gAjjdcdrqGYgHhy8
Smqfu48tnnFoXkRPWswxb4R51I7s73uXT32K/Pi14NB9c87+oCEVPA==
=Zrp6
-----END PGP SIGNATURE-----
--=-=-=--

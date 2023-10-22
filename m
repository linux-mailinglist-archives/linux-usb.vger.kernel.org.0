Return-Path: <linux-usb+bounces-2052-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 613507D22F9
	for <lists+linux-usb@lfdr.de>; Sun, 22 Oct 2023 13:44:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEDA6B20DD2
	for <lists+linux-usb@lfdr.de>; Sun, 22 Oct 2023 11:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775CB6FAE;
	Sun, 22 Oct 2023 11:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fnzYL6zD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBB328F2
	for <linux-usb@vger.kernel.org>; Sun, 22 Oct 2023 11:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3C4C433C8;
	Sun, 22 Oct 2023 11:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697975072;
	bh=NbAy25KCqK3w3UoJB3Gx/Au8ycxK++qAvj0CyStqxUo=;
	h=Date:From:To:Subject:From;
	b=fnzYL6zDj/m7PliHVvaObJ6H9WhKoVnWKz7hCQZk0Gb7nG6t4NAam0jEQxetWKbH3
	 JYe9JkleT4I/DTL2baQZrXc9OCxMqVfY5sTYtqbf3DXWl0BicAHVQ+n8xgH5fMb3wC
	 4N2ddAn3wFmF6HvehOsskkUTvmiZTCx5NW37lsnU=
Date: Sun, 22 Oct 2023 13:44:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: usbutils 016 release
Message-ID: <ZTULHE0PPr2Gvhg3@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SsA1msSVYXt8YyBd"
Content-Disposition: inline


--SsA1msSVYXt8YyBd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

It's been another year, and there have been a number of small fixes and
tweaks to the usbutils programs (including one pretty noticeable fix
where devices just weren't showing up at all in one of the output
modes), so it's time for a new release.

I'd like to announce the usbutils 016 release.

Full details of the changes in this are found below in the shortlog.

Tarballs can be found on kernel.org here:
	https://www.kernel.org/pub/linux/utils/usb/usbutils/

Or you can pull from the following git locations as well:
	https://git.sr.ht/~gregkh/usbutils
	https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usbutils.git
	https://github.com/gregkh/usbutils
	https://github.com/linux-usb/usbutils


thanks,

greg k-h

------------

usbutils 016
============

Alan Stern (1):
      usbutils: lsusb-t: print entries for devices with no interfaces

Aurelien Jarno (1):
      Fix a typo in usb-spec.h

Bob Hyman (1):
      lsusb.py.in: Display (device) power/wakeup via -w option.

Dingyan Li (3):
      Fix an incorrect length value in hid descriptor.
      Fix misalignments in hid device descripptor.
      Use bigger buffer to place speed value string

Greg Kroah-Hartman (19):
      lsusb -h returns an error
      lsusb -h fixups
      lsusb -t: sort in bus order, not reverse order
      lsusb -t: print ports and busses and devices with same width
      lsusb -t: assign_interface_to_parent() fixups
      lsusb.8.in: fix up missing '-' in text
      README.md: add source location
      lsusb.py: fix up wakeup logic for devices that do not support it
      lsusb.py.in: add another default path for usb.ids
      names.c: if a string can not be found in the usb.ids file, return [unknown]
      lsusb-t: if a driver is not bound to an interface, report "[none]"

Hannes Weisbach (1):
      Generate usbutils.pc pkgconfig file

Kristoffer Ellersgaard Koch (1):
      usbreset: Allow idProduct and idVendor to be 0

Lukas Nykryn (1):
      usb-devices: make shellcheck happy

Tan Li Boon (3):
      lsusb: Add function that sorts the output by device ID.
      lsusb: Additional sorting by bus number.
      lsusb: This is a more compact implementation of the device list sort implemented within this pull request. The output remains the same as the one demonstrated in the previous commit.


--SsA1msSVYXt8YyBd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEZH8oZUiU471FcZm+ONu9yGCSaT4FAmU1CxwACgkQONu9yGCS
aT5PohAAuIBhDopKZr7TLgMuuIk9/9N0lr00hbx8W2JhvsXWKULrBZw+jYlMu2IX
QTRS3yV1Xb2YndD7AtALgI+mB1MQKwL+ca3gVDgingUrDA0A6Iy888NzwD0Kl4AK
E7OemTRs87MSuoATPwnziUp6J8b7EsPtCvBILMtYWjeffoQ4P7tVTpnQ/GFoqEkP
XHgeD6lG0XhxCZ10MArWpdnEe00QfofzbU9d23am1dpWx8YSB8lBlAk9vDhV8R+8
rKzFit0XgOz6QnEdd++0kvgvxLmAGwvispBT96eEt5Lq+6aFXVLQQumRIsuQqIZU
Mcs+UTPtweXSGldd3ylf2lOp5kB6ohAk/c6nZUaGsXIaK0LpZiSSKB3cEMPbxo2z
7UgDkobF+F2RIM/vtZ9oD6TsutDN3LcRI+5ErilX/cVUEt5qZpHI737JKTR9F1fo
hcOawsoqkpw/RylowNkDEVkcSgYRjjWohwxuzhNYm2gvTd/rw+XTsnupwQg66DoO
f06rxYAaBWydlZyhJ8t/Mbjb22nkgnS4aOregSZH0LDg7NBl4obOrM9viVW2L6AP
gD8Vs5UGjqLPAD/mlWmP5ThZIskYr+oEK3YwYeZsvKGZkMvEkHiCTWiuls/k1QRG
dqtAL0HWJcgHR+2tMyD22UU6If/5DmGLeb4s7GMKwadE/b4LeLg=
=tyQx
-----END PGP SIGNATURE-----

--SsA1msSVYXt8YyBd--


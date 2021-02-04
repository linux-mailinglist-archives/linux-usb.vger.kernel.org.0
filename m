Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB7730B84F
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 08:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232446AbhBBHFZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 02:05:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232260AbhBBHFD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Feb 2021 02:05:03 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69A15C06174A
        for <linux-usb@vger.kernel.org>; Mon,  1 Feb 2021 23:04:23 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id j2so12637749pgl.0
        for <linux-usb@vger.kernel.org>; Mon, 01 Feb 2021 23:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h2y+K/9iVHXki4SjZE5QNNx7J+jWoGFy9/IpDPTRQ98=;
        b=WRtYXtQ/XmGlEHKBRf10bWrEJsJdvvFzTou6cfMq6W4BtOCVlrLN5GJ/QhDHQ39z1a
         YYKvvWbJeSZBznFg+FjKO/9eq+iZBT6bUxkdPKaHGP1z9PJNKjm7Z25pkXM+EJnz1rcC
         54uDYAwQEL1ZcfcyNXFCm/xbS4Q699y/uzfv72RBk2IKYCC0fflG6AQGkWxEdLwyIDrK
         MyK+3JXVArPqCrfnq8Q8+DaoY4zL8yZpaG0D4l3+FHxdwXtf/y40swCTQRPqc7Y3HN4T
         i7ga3p/xrBREcjOSntejS0gkCs0MvraGVK3tpn35znpuDfWLdOD6l41kLZQBCAQlHwCw
         Bz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h2y+K/9iVHXki4SjZE5QNNx7J+jWoGFy9/IpDPTRQ98=;
        b=UGIwn50UdzVg5JCSLs/VuMZ/f4ddJvBbIFqhaHUeBfrVNGEQX22zAPtmzWITPD5HsM
         GsZ0orR18A/GDTiwGBfvbVB5Yg6es0EjVd532TAgvrYxwf/qS/xhKuUV7tVWns2HtrIm
         M0npvw6q3qpXFdWWJpk9oAxHz5QeKClpz5qVY6dC0Ikj/dAD4Lb2xaTQsBgBps/ap2cV
         1N4ioizOlKAKPvQpX9KuNebZNKJMhTTwI0jQnnLCoULCIj02HAi7gOYteYn+hsQ5x3Up
         yWlnfZpOlWwD4LRtxh1SiNUirqV2++SdlPQKxWew3C/3eu3OunMU+CBEGI9aicT6Cqb/
         P3cw==
X-Gm-Message-State: AOAM53040OtVe0lKvCXj16513rSo3kwlJNCWkQquzROLcdRwe2EPyJ84
        d+Ipc0k5+KUJ7ndqX23OTIUWDg==
X-Google-Smtp-Source: ABdhPJxEN+4yDkAu+AxbfPoOZ/At79M5C2Tkl6dlL/nBOa4a0Zco34N4M7Dg2Qu7gb4TyVm0kep8MQ==
X-Received: by 2002:a63:a10a:: with SMTP id b10mr19935429pgf.121.1612249462516;
        Mon, 01 Feb 2021 23:04:22 -0800 (PST)
Received: from google.com ([2620:15c:202:201:f693:9fff:fef4:fc72])
        by smtp.gmail.com with ESMTPSA id bt21sm1105334pjb.33.2021.02.01.23.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 23:04:20 -0800 (PST)
Date:   Mon, 1 Feb 2021 23:04:15 -0800
From:   Benson Leung <bleung@google.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Benson Leung <bleung@chromium.org>,
        heikki.krogerus@linux.intel.com, enric.balletbo@collabora.com,
        pmalani@chromium.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, groeck@chromium.org
Subject: Re: [PATCH 0/6] usb: typec: and platform/chrome: Add PD revision
 numbers
Message-ID: <YBj5b7O60c6fh/nX@google.com>
References: <20210129061406.2680146-1-bleung@chromium.org>
 <YBgRDwszRs3ULl5J@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1IvyEnSOqD3CMctJ"
Content-Disposition: inline
In-Reply-To: <YBgRDwszRs3ULl5J@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--1IvyEnSOqD3CMctJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Mon, Feb 01, 2021 at 03:32:47PM +0100, Greg KH wrote:
> On Thu, Jan 28, 2021 at 10:14:00PM -0800, Benson Leung wrote:
> > USB Power Delivery has a 3 entity handshake (port, cable, partner), and=
 as
> > of USB PD R3.0, each entity may independently support either Revision 2=
 or
> > Revision 3 signaling and protocol. In order for userspace and the kernel
> > to properly process the data objects received from a particular SOP*, we
> > must know to which revision of the spec each conforms.
> >=20
> > This series adds individual version numbers for the partner and the cab=
le,
> > and exposes them in the appropriate sysfs in /sys/class/typec.
> >=20
> > I provide as a first implementation of this, platform/chrome's cros_ec_=
typec
> > driver, whose underlying status messages convey the SOP and SOP' revisi=
ons
> > already.
>=20
> I've taken the first 3 patches in my tree now, but the last 3 (for the
> chrome_ec_typec.c driver), they do not apply at all.
>=20

Ah, that's because we have some other changes for the cros_ec_typec.c driver
already in platform/chrome for our 5.12 branch.

For 5.12, the changes for cros_ec_typec driver is pretty well contained,
although there is some dependence on typec subsystem changes now.

If I send you a pull request containing all of the changes for this driver =
we
have already merged, plus these last three that depend on both of our trees
would you merge it through usb for 5.12?

Thanks,
Benson

> thanks,
>=20
> greg k-h

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--1IvyEnSOqD3CMctJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCYBj5bwAKCRBzbaomhzOw
wmOeAP9tpkaoJbsMmmBb8CaB4fT4OlvcvCI222T6Xwxilxga3AEAmnf9GyFgKA9l
KJx1cTrAZkAO+qGYZ1WTes/3ZVDYbAQ=
=y8Hq
-----END PGP SIGNATURE-----

--1IvyEnSOqD3CMctJ--

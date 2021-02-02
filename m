Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C87B30C672
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 17:51:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236861AbhBBQsq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 11:48:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236832AbhBBQrQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Feb 2021 11:47:16 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EB9BC061793
        for <linux-usb@vger.kernel.org>; Tue,  2 Feb 2021 08:46:36 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id o63so15235008pgo.6
        for <linux-usb@vger.kernel.org>; Tue, 02 Feb 2021 08:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HlX9WjLA2fX7KzMv4kzPA/gTRvAYQzupJhgpnjS3bao=;
        b=QwGoSvhfHpronz4VD6aLhYwnDEVaZwoLVN+6NxpIVeL6XZoU1IY40jt8AZLFitS1j8
         E+ZHoWdYZ0oImcdxxzVFIdKh5pIqsFBy0WYMKmJJujmhIz2+tbweAUkSh0WucUMk1Yxf
         dWFJJbws2RmLQbx5M/WSkd9jdfhl/xGAqq8xzy1nmUlCDlxYTfgyeuLJS9UneNMPbSqI
         b+ZkGZsA0c8AUB5tycE82+8oE95wxR/3v7llsfn6o4DqdedIJEl21UOV7Yqf9qK9u67V
         dATYtl4jdvbrTrBcSkmQFmwCUfZ8lYs5hlqzHVnw20FE477h9REBmgIUoI4oqDY5jPAj
         1ZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HlX9WjLA2fX7KzMv4kzPA/gTRvAYQzupJhgpnjS3bao=;
        b=Xy8IFkARtx55pJqx1qhGlT2q+EGyaoGVk8GaRBPB8zH+2yk81/w/c5fYIcHPL9D4Wz
         TK6dKL53CudlHShjqA++kD8ruD4fzUji6XUOiyqiiU1hVx34smQJcWyFWcCG404qCWaD
         WfcYY5DYXCTmPgcnDp45sh7buBDXMOfbsPbYEMXCzK4mFacOe3S7e7Nam3an8tD2T9by
         6LL+nb0qVqwNcTtoPa5thGcWNGYdNew14ue6V5wSgzBBpyTqeUDzTITo7adJynBmZZYe
         9jRm4UaoUbUP/2OCBOGd207lx4V1SSv6vGdVuQqfATNYzyCs6Fvlp5zHNXLZnyjkSKKt
         T1tQ==
X-Gm-Message-State: AOAM533HOmCptfFMVRJWS5pxm61wJlyVqbrjclFCvE+RafNHlosvodyM
        95xfkjqnve4KVhxzcf5sIsCixQ==
X-Google-Smtp-Source: ABdhPJwj5JfiHzAo5Q0/hHFe8/EvnRDnc1U9Tq7uvxv5OvYDfLHPnVwj7GITHb4aPUhXAZ8WTFnEBQ==
X-Received: by 2002:a63:f218:: with SMTP id v24mr22842506pgh.244.1612284395284;
        Tue, 02 Feb 2021 08:46:35 -0800 (PST)
Received: from google.com ([2620:15c:202:201:f693:9fff:fef4:fc72])
        by smtp.gmail.com with ESMTPSA id k31sm23820221pgi.5.2021.02.02.08.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 08:46:33 -0800 (PST)
Date:   Tue, 2 Feb 2021 08:46:29 -0800
From:   Benson Leung <bleung@google.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Benson Leung <bleung@chromium.org>,
        heikki.krogerus@linux.intel.com, enric.balletbo@collabora.com,
        pmalani@chromium.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, kyletso@google.com
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Fix call to
 typec_partner_set_pd_revision
Message-ID: <YBmB5QBciYoNRudT@google.com>
References: <20210202163248.3981555-1-bleung@chromium.org>
 <YBl/0C4yc3ST9zLy@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EcoCSIARD0xJJIhb"
Content-Disposition: inline
In-Reply-To: <YBl/0C4yc3ST9zLy@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--EcoCSIARD0xJJIhb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 02, 2021 at 05:37:36PM +0100, Greg KH wrote:
> On Tue, Feb 02, 2021 at 08:32:48AM -0800, Benson Leung wrote:
> > typec_partner_set_pd_revision returns void now.
> >=20
> > Fixes: cefc011f8daf platform/chrome: cros_ec_typec: Set Partner PD revi=
sion from status
>=20
> Can you please use the documented format for the Fixes: tag (and for the
> use of any git id in the kernel changelog)?


D'oh. Thanks. I set up my pretty=3Dfuller now.

Benson
>=20
> If anyone were to commit this change, you would get a nasty-gram email
> from linux-next :)
>=20
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

--EcoCSIARD0xJJIhb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCYBmB5AAKCRBzbaomhzOw
wnNvAQCmAmkTTaVjN89qczWo4cSjKH3z4NYggo+Gq+nvCdvcWQD9Hp/fFtjtVZtI
Elx6J5/4HMgux8AhdhdjF1eZYD68kgM=
=wmoi
-----END PGP SIGNATURE-----

--EcoCSIARD0xJJIhb--

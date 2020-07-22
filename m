Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41C0B228E81
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 05:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731888AbgGVDQs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jul 2020 23:16:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731815AbgGVDQr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jul 2020 23:16:47 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85901C0619DB
        for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2020 20:16:47 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id l63so434964pge.12
        for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2020 20:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pesu-pes-edu.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=73iDvHgZEqxDKHnf/uCOIPrIaeopvlWxbBWmtJPTAqY=;
        b=dCow/A8po4LX8y5ym1eyTRdPQpuQSddIgifUo78KscgUBsEBgoD9Z6ZK5W0bwOsFy7
         R0ppkmcieeG5mkVldNDrgzSVyINZx3PSfv3WJil21IvA+4WblxApO5zcq/jQsi0KTjvF
         RnBctvIv6B6iECXK8c8KmTHKyM+6H2OCAaiuMxb+T1Oev5zZvGWTm9ms+tezBJz5+hJd
         4Pya96n6/Oq4RjHq/STntxi/04/LNCyeUotdgtu6Mduaw/u4gFMM3SfPlIfc/cGgEYgv
         YgPROtEmfxuMJsJ44vSKebVEw9O0cwzZz2nDemUPp27Y1KYOqe74V5uoonwlAGchN/Uv
         YDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=73iDvHgZEqxDKHnf/uCOIPrIaeopvlWxbBWmtJPTAqY=;
        b=uikPmNR4nkNAnYN14vg/qDrqHNWbv6ltsy2Pn452ZVd3RN/brPulhNKojLHLCYJcIG
         NvkFIrpKGOwsbBIwB/9ZXH/KMF02GXjjqdUqdm1Rmn8CcQCr4lQZUEJV84M1GhBY2Ex+
         uPRUFd9mvarPPEGlVnFYDFOwOUDbRTxNwW1REozFU5NApUTc5MY2LgIdf/W6oRBHrvBZ
         h67kfhk3ANRaYVzmbibcWGz1908rObIi9quIsyi8ns/ZZXLxePuYYhnIwa7sXGftCm0G
         bbElPrG1Phpf245gUplb98+L63AlTqU8qr4FrfGStKwvYgATqDAJhyP8upOWyQmJlYgV
         vZUw==
X-Gm-Message-State: AOAM532lc6peA37/EZ+Ahli8yH47Xwk/wgA9guj8SQWuwn5P/ghXC74T
        mu6K5q7tot34Idw0iJRmCCEyMA==
X-Google-Smtp-Source: ABdhPJxiYyKd4Ja+8DRUmZ6C26jpNvrnFt6CdOBi26vP34+ZKUHChtrHDj7JHF2j1PyrHm0xNcZ3Kg==
X-Received: by 2002:a63:5b05:: with SMTP id p5mr24595098pgb.143.1595387807008;
        Tue, 21 Jul 2020 20:16:47 -0700 (PDT)
Received: from localhost ([2406:7400:73:c50a:d055:3e56:d1e4:ce99])
        by smtp.gmail.com with ESMTPSA id c1sm4766225pje.9.2020.07.21.20.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 20:16:45 -0700 (PDT)
Date:   Wed, 22 Jul 2020 08:46:40 +0530
From:   B K Karthik <bkkarthik@pesu.pes.edu>
To:     syzbot <syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com>,
        andreyknvl@google.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>, rafael@kernel.org,
        syzkaller-bugs@googlegroups.com,
        Markus Elfring <Markus.Elfring@web.de>,
        Hillf Danton <hdanton@sina.com>
Subject: [PATCH v2] i2c: fix WARNING in pvr2_i2c_core_done
Message-ID: <20200722031640.nobv2bfgex46sngo@pesu.pes.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="y22zpqil25qtpkyo"
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--y22zpqil25qtpkyo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

#syz test: https://github.com/google/kasan.git usb-fuzzer

fix WARNING in pvr2_i2c_core_done by
unregistering device in the release handler
instead of the disconnect handler, setting the
linked flag after adding adapter to i2c,
and removing a call to acpi_ut_delete_generic_state()

Reported-by: syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com
Signed-off-by: B K Karthik <bkkarthik@pesu.pes.edu>
---
v1 -> v2:
	remove a call to acpi_ut_delete_generic state
	and set linked flag after adding adapter to
	i2c as suggested by Hillf Danton <hdanton@sina.com>

 drivers/acpi/acpica/utdelete.c               | 5 -----
 drivers/i2c/i2c-core-base.c                  | 2 +-
 drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c | 4 ++--
 3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/acpi/acpica/utdelete.c b/drivers/acpi/acpica/utdelete.c
index c365faf4e6cd..e36f51725854 100644
--- a/drivers/acpi/acpica/utdelete.c
+++ b/drivers/acpi/acpica/utdelete.c
@@ -648,11 +648,6 @@ acpi_ut_update_object_reference(union acpi_operand_obj=
ect *object, u16 action)
=20
 	/* Free any stacked Update State objects */
=20
-	while (state_list) {
-		state =3D acpi_ut_pop_generic_state(&state_list);
-		acpi_ut_delete_generic_state(state);
-	}
-
 	return (status);
 }
=20
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 26f03a14a478..2d377d2e89f1 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -462,6 +462,7 @@ static void i2c_device_shutdown(struct device *dev)
=20
 static void i2c_client_dev_release(struct device *dev)
 {
+	i2c_unregister_device(to_i2c_client(dev));
 	kfree(to_i2c_client(dev));
 }
=20
@@ -1527,7 +1528,6 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 		dev_dbg(&adap->dev, "Removing %s at 0x%x\n", client->name,
 			client->addr);
 		list_del(&client->detected);
-		i2c_unregister_device(client);
 	}
 	mutex_unlock(&adap->userspace_clients_lock);
=20
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c b/drivers/media/u=
sb/pvrusb2/pvrusb2-i2c-core.c
index 63db04fe12d3..09b2c878f459 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c
@@ -623,9 +623,9 @@ void pvr2_i2c_core_init(struct pvr2_hdw *hdw)
 	hdw->i2c_adap.dev.parent =3D &hdw->usb_dev->dev;
 	hdw->i2c_adap.algo =3D &hdw->i2c_algo;
 	hdw->i2c_adap.algo_data =3D hdw;
-	hdw->i2c_linked =3D !0;
 	i2c_set_adapdata(&hdw->i2c_adap, &hdw->v4l2_dev);
-	i2c_add_adapter(&hdw->i2c_adap);
+	if (!i2c_add_adapter(&hdw->i2c_adap))
+		hdw->i2c_linked =3D!0;
 	if (hdw->i2c_func[0x18] =3D=3D i2c_24xxx_ir) {
 		/* Probe for a different type of IR receiver on this
 		   device.  This is really the only way to differentiate
--=20
2.20.1


--y22zpqil25qtpkyo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCgAdFiEEIF+jd5Z5uS7xKTfpQZdt+T1HgiEFAl8Xr5gACgkQQZdt+T1H
giF1vQv+P5FnsTUChLkkI/kfULIr4EuocSn7JwwbJacBalZeiu3qmmOY0gzPjq2b
qlJEtiuehaZIGdCB0wp/kKum0umcluCO1nWgd2tNVmOKJv++xx2l/O4Rd4SXv2TD
r72OfvdV72XYLdsnawwDnXqi/2dgQIN4ZozpDv2PqsB9Mi/rkp+pu/i9CxrpMDpM
HukAL9uOn8BpTdubmeU2XZc1cmJcCQzOn5+VdBM8zC3tjy8JEzoNTRlzzBqzDw0P
xITIeW9NYXcujFJeBCr3CHKDxNsmXkCxaIxkZtBuvISMP7hggRaOADUVnKTTbj/4
F+0VhEHxcgevJhiJBZeX2ylYSZhzitG8gHfi23ex0b8rFqccNDE7kHXP6HC2KwyZ
DaIxZ9APw2URMjEHDVVRaH4Pwr+1y14CIV5ae1AsnRrRTGzRjm7kbAPXR8FaF+QG
eyGHv50p/xMjR685SWIfGp4HfXub5c6ok5XZZwmsMrITt8XVtJ3k/qS0+givqsSv
/QNBs8Ti
=z8sj
-----END PGP SIGNATURE-----

--y22zpqil25qtpkyo--

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4744E1227
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 08:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729081AbfJWGba (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 02:31:30 -0400
Received: from mga12.intel.com ([192.55.52.136]:1686 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725874AbfJWGba (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Oct 2019 02:31:30 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Oct 2019 23:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,219,1569308400"; 
   d="asc'?scan'208";a="209854489"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga001.fm.intel.com with ESMTP; 22 Oct 2019 23:31:25 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Vicente Bergas <vicencb@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Will Deacon <will.deacon@arm.com>,
        MarcZyngier <marc.zyngier@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] usb: dwc3: Add shutdown to platform_driver
In-Reply-To: <0edb55d4-3bad-47ac-9d29-8d994d182e67@gmail.com>
References: <4d18d4f7-a00e-bd60-6361-51054eba3bca@arm.com> <20190817174140.6394-1-vicencb@gmail.com> <8d48017a-64c5-4b25-8d85-113ffcf502c9@gmail.com> <87v9uix1sv.fsf@gmail.com> <645526b8-bfed-4cc6-9500-1843c5fe0da9@gmail.com> <0edb55d4-3bad-47ac-9d29-8d994d182e67@gmail.com>
Date:   Wed, 23 Oct 2019 09:31:21 +0300
Message-ID: <877e4wj7ly.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

(sorry for the long delay)

Vicente Bergas <vicencb@gmail.com> writes:

> On Tuesday, August 27, 2019 2:16:20 PM CEST, Vicente Bergas wrote:
>> On Tuesday, August 27, 2019 1:53:04 PM CEST, Felipe Balbi wrote:
>>> Hi,
>>>=20
>>> Vicente Bergas <vicencb@gmail.com> writes:
>>>> On Saturday, August 17, 2019 7:41:40 PM CEST, Vicente Bergas wrote:
>>>>> Otherwise the device keeps writing to memory after kexec and disturbs
>>>>> the next kernel.
>> ...
>>>=20
>>> why don't you just have shutdown use the same exact function as remove?
>>> Frankly, though, I still don't fully understand what's going wrong
>>> here. Why is the device still alive during kexec?
>>>=20
>>> cheers
>>
>> Hi Felipe,
>> the remove and shutdown functions have different prototypes, so
>> shutdown is wrapping remove.
>> Would it be preferable to cast remove as shutdown?
>>
>> The issue with kexec is that the device is being used during the livetime
>> of the first kernel. When the first kernel executes kexec it calls the
>> shutdown function of drivers (instead of remove). Because of this the dw=
c3
>> device keeps doing things like DMA.
>> While the second kernel is taking over, it gets its memory corrupted with
>> such DMA accesses from the device. When the second kernel reaches the po=
int
>> of taking over the dwc3 device, re-initializes it, but it is already too
>> late. Still worse, if the second kernel did not have the dwc3 driver, it
>> would get endless memory corruptions.
>> All in all, devices that can do DMA need to stop doing it on shutdown.
>>
>> Regards,
>>  Vicen=C3=A7.
>
> Hi,
> please, can you provide some feedback on this?

I meant something like this:

diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-s=
imple.c
index bdac3e7d7b18..e64754be47b4 100644
=2D-- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -110,12 +110,9 @@ static int dwc3_of_simple_probe(struct platform_device=
 *pdev)
 	return ret;
 }
=20
=2Dstatic int dwc3_of_simple_remove(struct platform_device *pdev)
+static void __dwc3_of_simple_teardown(struct dwc3_of_simple *simple)
 {
=2D	struct dwc3_of_simple	*simple =3D platform_get_drvdata(pdev);
=2D	struct device		*dev =3D &pdev->dev;
=2D
=2D	of_platform_depopulate(dev);
+	of_platform_depopulate(simple->dev);
=20
 	clk_bulk_disable_unprepare(simple->num_clocks, simple->clks);
 	clk_bulk_put_all(simple->num_clocks, simple->clks);
@@ -126,13 +123,27 @@ static int dwc3_of_simple_remove(struct platform_devi=
ce *pdev)
=20
 	reset_control_put(simple->resets);
=20
=2D	pm_runtime_disable(dev);
=2D	pm_runtime_put_noidle(dev);
=2D	pm_runtime_set_suspended(dev);
+	pm_runtime_disable(simple->dev);
+	pm_runtime_put_noidle(simple->dev);
+	pm_runtime_set_suspended(simple->dev);
+}
+
+static int dwc3_of_simple_remove(struct platform_device *pdev)
+{
+	struct dwc3_of_simple	*simple =3D platform_get_drvdata(pdev);
+
+	__dwc3_of_simple_teardown(simple);
=20
 	return 0;
 }
=20
+static void dwc3_of_simple_shutdown(struct platform_device *pdev)
+{
+	struct dwc3_of_simple	*simple =3D platform_get_drvdata(pdev);
+
+	__dwc3_of_simple_teardown(simple);
+}
+
 static int __maybe_unused dwc3_of_simple_runtime_suspend(struct device *de=
v)
 {
 	struct dwc3_of_simple	*simple =3D dev_get_drvdata(dev);
@@ -190,6 +201,7 @@ MODULE_DEVICE_TABLE(of, of_dwc3_simple_match);
 static struct platform_driver dwc3_of_simple_driver =3D {
 	.probe		=3D dwc3_of_simple_probe,
 	.remove		=3D dwc3_of_simple_remove,
+	.shutdown	=3D dwc3_of_simple_shutdown,
 	.driver		=3D {
 		.name	=3D "dwc3-of-simple",
 		.of_match_table =3D of_dwc3_simple_match,

Can you make sure it works as you intended?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl2v87kACgkQzL64meEa
mQbaxw//YJnKwS6yzWR83UxUA12uq1zvf4FjLM/l6eMrQ9ov/ksOEHccUzcRzbJG
b/yrRZiW6mLXmVMSeaY6Ho6ijJ7RocG8Ry6gVu/+3DIH1myqyZdF095nrZZR4yEY
spCi0Yel29Zc0CMcM2zx9QjgebaAxYleWc752q2yyOMFzNvyGJM0iLdxyBdJ2VKW
K4sF0CrvbhGWhoryvgSM+enjR1nEp3i5em/NLR3tvLrzMWEP6GkEvL4nePoSeW2y
P9N1hh/IHEpnUyTmQKrqIWTW+UW1V09NaLFQhMB4+t80nlp4t2zXIKTSLaf41czC
fo+NYa96hRgcMBnX07dt5wInHPydQEmYaMavWmW2X2KkGwWP58+LrytZbXuJ97Ho
9pCNKzRNmgqr3zpvPbBFMmwwEiqR7Nzzh9c0OmEK5exrsG7M6yxiMG2UrOQsxvRB
E48wnS6yKZvMYakZYM9RcXfV6/GTmlolD++Fh6Eavv3MX9KM6eAFWyAe81r7eMrJ
vEfq8XTaVCFM6uOSym60cPu820lp6C1E4D8AW4gso3ILY5FEdbqabJnCabGjJr+/
plq8mWB6wigew0yYguisoDu8Lr/b/t8e4hem9oIBh96ODpg9pFSaOu7Hp7MtLd9b
I2TnOJtuAXw8KbTa+kbKbhfoPOVEQAWm0q66mN1S7I0HBC5S2Cc=
=7XbG
-----END PGP SIGNATURE-----
--=-=-=--

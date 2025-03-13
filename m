Return-Path: <linux-usb+bounces-21730-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F8BA5FC65
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 17:45:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 594551886D44
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 16:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3893026A086;
	Thu, 13 Mar 2025 16:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakoman-com.20230601.gappssmtp.com header.i=@sakoman-com.20230601.gappssmtp.com header.b="ekqFSkE7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7012690E6
	for <linux-usb@vger.kernel.org>; Thu, 13 Mar 2025 16:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741884307; cv=none; b=WlbilgdEtSBJH82GplPnCn907Q7DVTwP/bvna7rwihkR+Me2yeoDNmhbbwFP7R0U2DmE7V2mhYezcHecTY/i/JLjNQ0PH/olw8BzPUWSmYDJh6VujLn/6JiqXnoTqvkanWjCmjHkwVbCYevrO+mk7dtbRmPSYQkZacAWSq72zEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741884307; c=relaxed/simple;
	bh=HkS1q8y5FqY7o7YJnYnqWet5/skABDd/w5Leo/BqTdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W+YsapTf+OItisd4gUxXcz0ORYbJKg1Xv/yMybkuHVFy5LAKe1XF4nBKJMDWYv3USieQH4dxdF6vEy9xT/spkOuWpmYrnNTlmTEL9mSoKh264m1PnQYJ3gb+x3rN+vIjDbm+PHsOcxfibFLkDweoGP2By4a+vouPjXdUr/FvK4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sakoman.com; spf=fail smtp.mailfrom=sakoman.com; dkim=pass (2048-bit key) header.d=sakoman-com.20230601.gappssmtp.com header.i=@sakoman-com.20230601.gappssmtp.com header.b=ekqFSkE7; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sakoman.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sakoman.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e63504bedd0so867556276.0
        for <linux-usb@vger.kernel.org>; Thu, 13 Mar 2025 09:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741884304; x=1742489104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3RAUHCKi0x77lXSS1nnZ0KC7DP4cZYeVQWVqcGuY5g=;
        b=ekqFSkE7hpAxSEhV4rTHtceVaq9mgkInbfum4PcN3KDXvK5gGye5uwY2KKpgvhMMm2
         mcMqEeisC76ezDet724S/Vl3rZFAmL74MFWko7A2GJkIJlyuafLBR6ApIo/Nm/BDH5H7
         a10l7IrXgFKzbKVyt6/mj2tkqo/fv/56a392PiOxMayrn/8jtQ9BBjF6BBoz6I6MSS2i
         ERCI3IoBWpKyQ4kw6kyt7xgmvSv3NRzZwrekj4HH/0G+7F+9zLBFIVG9+7iUS5bRwdyB
         MUajd+UZ24WbGoUVINMAn+WyuFN6cZn4+ohBR22Nd9n/JDLKUJ+lKEp6cIqJ971rU1uY
         KoTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741884304; x=1742489104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3RAUHCKi0x77lXSS1nnZ0KC7DP4cZYeVQWVqcGuY5g=;
        b=nFuj8XQum32X5wSJomub+HwXTnyKE225q1Px1dcL4vO0nd03qJSAgqtOh+fjdIiuYC
         1Tuzc8VFr1n1MRPc/jmMqtOD/PQPS6D2czUNFhLsAqTV1PbuOh9kXg2tOalusPQjZbVE
         yBhk2PPAUXmX/6nWyQDraU3GlgCu8ARvBMfS+Y0Y9gED6nqW5/1AkkpX6jwZfebbk39j
         huclianp87+yRw/a383pNq3+AJpkyK4YYNRnAQUir+ME6JoQuzNZMo84h+GUKtAwVkLJ
         2qwNr+479Mgxkkbu3pF6yIdmfj4AcIL1UFAiYLHUUs63rD97G6VyBWLOrB6fTn8ikQkK
         oYfg==
X-Forwarded-Encrypted: i=1; AJvYcCXqVNR/QQvDBjm0QSOj0Ws+YHifzbD9TxRMqEK+QAg9eWboSCr+cJeqAfUQFVapOM6iwR0Bv18aAjY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+ZVO7wr9mzhy1/bv9uCP2vZwzrNOff7wh0i/9XK0JKVMIzr1P
	dVkoVpXB+BqIevrRxkqd4L3EVwTkKNYBeY/UT8bMIJkvUGh1D48oRNWv3QgW0r7aih+lp6Ptm8a
	cJkLWtrI+XORE09gPR3nNxIVsEpaRFLBJroN9ITA2iHP8+sDH
X-Gm-Gg: ASbGncvsjO1PRPXhVA3apZ2gQ4C9ZUPqML+M3+xxeOesuIAuPw4xPC4B6JQO0dIsaK+
	bi8IZTZvO31hrDXa4sl2eDq8bxqSM31MF7YAOJCkzuvrQBfr7QhMmUbzkSwwVdIczWT5tFigWUK
	GcoVL2xGDuOeeeCTuQzyH6+622VRA9+jSLvH/zoHTRiflefEloH3eQs8A15Q==
X-Google-Smtp-Source: AGHT+IGutNpkXyficPjJ5h93uA3OSMx2hjYNuGIaAqq2FHYGsyfK2PXKoEhA04wkHW4vzbG9x9dYGnW0O2DSMZWne+E=
X-Received: by 2002:a05:6902:220f:b0:e63:4b42:6940 with SMTP id
 3f1490d57ef6-e63b5158790mr15737633276.2.1741884303797; Thu, 13 Mar 2025
 09:45:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313021247.2615117-1-macpaul.lin@mediatek.com>
In-Reply-To: <20250313021247.2615117-1-macpaul.lin@mediatek.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 13 Mar 2025 09:44:52 -0700
X-Gm-Features: AQ5f1JrX16nqzANaYaVUM0qJ-yUkx7F2Q-dk5l6_7IOhys9xU1SlhUYrfDdkLFU
Message-ID: <CAOSpxdZJjZwGg2oKzjKnbkBnCu4O_2Vr2fOVK7bPTGvmP9GX4w@mail.gmail.com>
Subject: Re: [scarthgap][PATCH] bluez5: upgrade 5.72 -> 5.77
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>, 
	"Alexander Kanavin via lists . openembedded . org" <alex.kanavin=gmail.com@lists.openembedded.org>, 
	openembedded-core@lists.openembedded.org, 
	=?UTF-8?Q?Gu=C3=B0ni_M=C3=A1r_Gilbert?= <gudni.m.g@gmail.com>, 
	Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, 
	Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, linux-usb@vger.kernel.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, I can't take these version bumps since policy only allows
bug/security fix releases.  These version bumps also include new
features and hence aren't allowed.

Steve

On Wed, Mar 12, 2025 at 7:12=E2=80=AFPM Macpaul Lin <macpaul.lin@mediatek.c=
om> wrote:
>
> From: gudnimg <gudni.m.g@gmail.com>
>
> Changelog:
> * https://github.com/bluez/bluez/releases/tag/5.77
> * https://github.com/bluez/bluez/releases/tag/5.76
> * https://github.com/bluez/bluez/releases/tag/5.75
> * https://github.com/bluez/bluez/releases/tag/5.74
> * https://github.com/bluez/bluez/releases/tag/5.73
>
> Changes relevant to the build:
> * One patch file is dropped.
> * /etc/bluetooth is now installed with 555 permission bits when systemd
> is not enabled. The do_install function was edited to change it back to
> 755. This was causing test failure when testing SDK packaging
> * Added a few missing PACKAGECONFIGs which are enabled by default.
> - asha-profiles: new in BlueZ 5.77
> - ccp-profiles: new in BlueZ 5.73
> - micp-profiles: new in BlueZ 5.70
> - csip-profiles: new in BlueZ 5.67
> - bass-profiles: new in BlueZ 5.67
> - vcp-profiles: new in BlueZ 5.66
> - mcp-profiles: new in BlueZ 5.66
> - bap-profiles: new in BlueZ 5.66
>
> (From OE-Core rev: ebbdb7cf5c0a3f0e6773704d4c4cc570358ec611)
>
> Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudni.m.g@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc   | 22 +++++++-
>  ...d-without-systemd-in-the-user-sessio.patch | 56 -------------------
>  .../0001-test-gatt-Fix-hung-issue.patch       |  7 +--
>  ...et-for-building-tests-without-runnin.patch |  7 +--
>  .../bluez5/{bluez5_5.72.bb =3D> bluez5_5.77.bb} |  2 +-
>  5 files changed, 28 insertions(+), 66 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-Allow-us=
ing-obexd-without-systemd-in-the-user-sessio.patch
>  rename meta/recipes-connectivity/bluez5/{bluez5_5.72.bb =3D> bluez5_5.77=
.bb} (94%)
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
> index 39e1bf389ce4..e927d3071e5d 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -18,6 +18,14 @@ PACKAGECONFIG ??=3D "obex-profiles \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
>      a2dp-profiles \
>      avrcp-profiles \
> +    bap-profiles \
> +    bass-profiles \
> +    mcp-profiles \
> +    ccp-profiles \
> +    vcp-profiles \
> +    micp-profiles \
> +    csip-profiles \
> +    asha-profiles \
>      network-profiles \
>      hid-profiles \
>      hog-profiles \
> @@ -39,6 +47,14 @@ PACKAGECONFIG[network-profiles] =3D "--enable-network,=
--disable-network"
>  PACKAGECONFIG[hid-profiles] =3D "--enable-hid,--disable-hid"
>  PACKAGECONFIG[hog-profiles] =3D "--enable-hog,--disable-hog"
>  PACKAGECONFIG[health-profiles] =3D "--enable-health,--disable-health"
> +PACKAGECONFIG[bap-profiles] =3D "--enable-bap,--disable-bap"
> +PACKAGECONFIG[bass-profiles] =3D "--enable-bass,--disable-bass"
> +PACKAGECONFIG[mcp-profiles] =3D "--enable-mcp,--disable-mcp"
> +PACKAGECONFIG[ccp-profiles] =3D "--enable-ccp,--disable-ccp"
> +PACKAGECONFIG[vcp-profiles] =3D "--enable-vcp,--disable-vcp"
> +PACKAGECONFIG[micp-profiles] =3D "--enable-micp,--disable-micp"
> +PACKAGECONFIG[csip-profiles] =3D "--enable-csip,--disable-csip"
> +PACKAGECONFIG[asha-profiles] =3D "--enable-asha,--disable-asha"
>  PACKAGECONFIG[sixaxis] =3D "--enable-sixaxis,--disable-sixaxis"
>  PACKAGECONFIG[tools] =3D "--enable-tools,--disable-tools"
>  PACKAGECONFIG[threads] =3D "--enable-threads,--disable-threads"
> @@ -51,7 +67,6 @@ PACKAGECONFIG[manpages] =3D "--enable-manpages,--disabl=
e-manpages,python3-docutils
>  SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
>             file://init \
>             file://run-ptest \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file:=
//0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
>             file://0001-tests-add-a-target-for-building-tests-without-run=
nin.patch \
>             file://0001-test-gatt-Fix-hung-issue.patch \
>             file://0001-adapter-Fix-up-address-type-when-loading-keys.pat=
ch \
> @@ -107,6 +122,11 @@ do_install:append() {
>         # Patch python tools to use Python 3; they should be source compa=
tible, but
>         # still refer to Python 2 in the shebang
>         sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/bl=
uez/test/*
> +
> +       # Fix the /etc/bluetooth directory permissions when systemd is di=
sabled
> +       if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'false', 'tru=
e', d)}; then
> +               chmod 0755 ${D}${sysconfdir}/bluetooth
> +       fi
>  }
>
>  PACKAGES =3D+ "${PN}-testtools ${PN}-obex ${PN}-noinst-tools"
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obe=
xd-without-systemd-in-the-user-sessio.patch b/meta/recipes-connectivity/blu=
ez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch
> deleted file mode 100644
> index 618ed734a96a..000000000000
> --- a/meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-with=
out-systemd-in-the-user-sessio.patch
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -From f74eb97c9fb3c0ee2895742e773ac6a3c41c999c Mon Sep 17 00:00:00 2001
> -From: Giovanni Campagna <gcampagna-cNUdlRotFMnNLxjTenLetw@public.gmane.o=
rg>
> -Date: Sat, 12 Oct 2013 17:45:25 +0200
> -Subject: [PATCH] Allow using obexd without systemd in the user session
> -
> -Not all sessions run systemd --user (actually, the majority
> -doesn't), so the dbus daemon must be able to spawn obexd
> -directly, and to do so it needs the full path of the daemon.
> -
> -Upstream-Status: Denied
> -
> -Not accepted by upstream maintainer for being a distro specific
> -configuration. See thread:
> -
> -http://thread.gmane.org/gmane.linux.bluez.kernel/38725/focus=3D38843
> -
> -Signed-off-by: Javier Viguera <javier.viguera@digi.com>
> -
> ----
> - Makefile.obexd                                                | 4 ++--
> - .../src/{org.bluez.obex.service =3D> org.bluez.obex.service.in} | 2 +-
> - 2 files changed, 3 insertions(+), 3 deletions(-)
> - rename obexd/src/{org.bluez.obex.service =3D> org.bluez.obex.service.in=
} (76%)
> -
> -diff --git a/Makefile.obexd b/Makefile.obexd
> -index de59d29..73004a3 100644
> ---- a/Makefile.obexd
> -+++ b/Makefile.obexd
> -@@ -1,12 +1,12 @@
> - if SYSTEMD
> - systemduserunitdir =3D $(SYSTEMD_USERUNITDIR)
> - systemduserunit_DATA =3D obexd/src/obex.service
> -+endif
> -
> - dbussessionbusdir =3D $(DBUS_SESSIONBUSDIR)
> - dbussessionbus_DATA =3D obexd/src/org.bluez.obex.service
> --endif
> -
> --EXTRA_DIST +=3D obexd/src/obex.service.in obexd/src/org.bluez.obex.serv=
ice
> -+EXTRA_DIST +=3D obexd/src/obex.service.in obexd/src/org.bluez.obex.serv=
ice.in
> -
> - if OBEX
> -
> -diff --git a/obexd/src/org.bluez.obex.service b/obexd/src/org.bluez.obex=
.service.in
> -similarity index 76%
> -rename from obexd/src/org.bluez.obex.service
> -rename to obexd/src/org.bluez.obex.service.in
> -index a538088..9c815f2 100644
> ---- a/obexd/src/org.bluez.obex.service
> -+++ b/obexd/src/org.bluez.obex.service.in
> -@@ -1,4 +1,4 @@
> - [D-BUS Service]
> - Name=3Dorg.bluez.obex
> --Exec=3D/bin/false
> -+Exec=3D@libexecdir@/obexd
> - SystemdService=3Ddbus-org.bluez.obex.service
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-h=
ung-issue.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fi=
x-hung-issue.patch
> index b1e93dbe19ef..ae113a9a6d7a 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-iss=
ue.patch
> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-iss=
ue.patch
> @@ -1,4 +1,4 @@
> -From fb583a57f9f4ab956a09e9bb96d89aa13553bf21 Mon Sep 17 00:00:00 2001
> +From eeb62ab04b3789a27074236cd0bed7cc64759f4d Mon Sep 17 00:00:00 2001
>  From: Mingli Yu <Mingli.Yu@windriver.com>
>  Date: Fri, 24 Aug 2018 12:04:03 +0800
>  Subject: [PATCH] test-gatt: Fix hung issue
> @@ -21,16 +21,15 @@ no action.
>  Upstream-Status: Submitted [https://marc.info/?l=3Dlinux-bluetooth&m=3D1=
53508881804635&w=3D2]
>
>  Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> -
>  ---
>   unit/test-gatt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/unit/test-gatt.c b/unit/test-gatt.c
> -index 5e06d4e..4864d36 100644
> +index 1613fbc..25dd614 100644
>  --- a/unit/test-gatt.c
>  +++ b/unit/test-gatt.c
> -@@ -4546,7 +4546,7 @@ int main(int argc, char *argv[])
> +@@ -4547,7 +4547,7 @@ int main(int argc, char *argv[])
>                         test_server, service_db_1, NULL,
>                         raw_pdu(0x03, 0x00, 0x02),
>                         raw_pdu(0xbf, 0x00),
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-tar=
get-for-building-tests-without-runnin.patch b/meta/recipes-connectivity/blu=
ez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
> index 881494a3543e..37253b9725b2 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for=
-building-tests-without-runnin.patch
> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for=
-building-tests-without-runnin.patch
> @@ -1,20 +1,19 @@
> -From 738e73b386352fd90f1f26cc1ee75427cf4dc23b Mon Sep 17 00:00:00 2001
> +From c06fecbb009f4c42f01d86383d4571c96ba872f0 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Fri, 1 Apr 2016 17:07:34 +0300
>  Subject: [PATCH] tests: add a target for building tests without running =
them
>
>  Upstream-Status: Inappropriate [oe specific]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> -
>  ---
>   Makefile.am | 3 +++
>   1 file changed, 3 insertions(+)
>
>  diff --git a/Makefile.am b/Makefile.am
> -index e738eb3..dab17dd 100644
> +index 0ae7211..c8bcaca 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
> -@@ -710,6 +710,9 @@ endif
> +@@ -713,6 +713,9 @@ endif
>   TESTS =3D $(unit_tests)
>   AM_TESTS_ENVIRONMENT =3D MALLOC_CHECK_=3D3 MALLOC_PERTURB_=3D69
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.72.bb b/meta/recip=
es-connectivity/bluez5/bluez5_5.77.bb
> similarity index 94%
> rename from meta/recipes-connectivity/bluez5/bluez5_5.72.bb
> rename to meta/recipes-connectivity/bluez5/bluez5_5.77.bb
> index 9fda960ea72e..55264fd6b760 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5_5.72.bb
> +++ b/meta/recipes-connectivity/bluez5/bluez5_5.77.bb
> @@ -1,6 +1,6 @@
>  require bluez5.inc
>
> -SRC_URI[sha256sum] =3D "499d7fa345a996c1bb650f5c6749e1d929111fa6ece0be0e=
98687fee6124536e"
> +SRC_URI[sha256sum] =3D "5d032fdc1d4a085813554f57591e2e1fb0ceb2b3616ee56f=
689bc00e1d150812"
>
>  CVE_STATUS[CVE-2020-24490] =3D "cpe-incorrect: This issue has kernel fix=
es rather than bluez fixes"
>
> --
> 2.45.2
>


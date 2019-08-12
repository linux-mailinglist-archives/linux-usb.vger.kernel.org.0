Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37B1E89EBB
	for <lists+linux-usb@lfdr.de>; Mon, 12 Aug 2019 14:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfHLMtm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Aug 2019 08:49:42 -0400
Received: from mga06.intel.com ([134.134.136.31]:2475 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726219AbfHLMtl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Aug 2019 08:49:41 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Aug 2019 05:49:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,377,1559545200"; 
   d="asc'?scan'208";a="351178345"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga005.jf.intel.com with ESMTP; 12 Aug 2019 05:49:13 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [Patch V6 7/8] usb: gadget: Add UDC driver for tegra XUSB device mode controller
In-Reply-To: <1565613783.23705.49.camel@mhfsdcap03>
References: <1565257046-9890-1-git-send-email-nkristam@nvidia.com> <1565257046-9890-8-git-send-email-nkristam@nvidia.com> <1565613783.23705.49.camel@mhfsdcap03>
Date:   Mon, 12 Aug 2019 15:49:09 +0300
Message-ID: <871rxqtupm.fsf@gmail.com>
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

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
>> +/* XUSB_DEV registers */
>> +#define SPARAM 0x000
>> +#define  SPARAM_ERSTMAX_SHIFT 16
>> +#define  SPARAM_ERSTMAX_MASK GENMASK(4, 0)
>> +#define DB 0x004
>> +#define  DB_TARGET_SHIFT 8
>> +#define  DB_TARGET_MASK GENMASK(7, 0)
>> +#define  DB_STREAMID_SHIFT 16
>> +#define  DB_STREAMID_MASK GENMASK(15, 0)
> To me, define it as :
> #define  DB_STREAMID_MASK GENMASK(31, 16),
> it's more clearer.
> and define another macro
> #define  DB_STREAMID(x) (((x) & 0xffff) << 16)

perhaps?

#define DB_STREAMID(x)	(((x) << 16) & DB_STREAMID_MASK)

Otherwise you end up defining the mask twice.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl1RYEUACgkQzL64meEa
mQZDmQ//dZ9bQYkDcWEiarlDFrRXkwjkzuRRuoygOMHDkMMUHafgu1X+97pBU4KE
WP/6krQOQamECru8SclQczz7QwEgGVTloSTkXqZD64lAKdX6P7SfShVEByVxYShr
4Un/VK5cinZSLoWDKLr5eCHaKMcA7XAoU84ymeofMRVATVZt3r4eeIvdGbKXunnU
pNqxdIKt4OsGv+3yjzjywPTUmyav/DoMJbPbfmbp8ORTmI/+LjESi1coII19Wd6E
loBCLuA6XI/ZPSy1drGys2SZQMvq/IatXWkS9rB3+FxMWnT7xoCvundorB21pzWL
Bhm4L4GCHIzuIu5QFSGyUUuNZu+WRC/zQIWNtam7ItOqorKtNrFXTDBPJHve33Z8
p4ha5fIPIGswNCOY9WSYdmV/68ZAVsO68NHxHSpHWm9NVZ6jF/YqchZv4ZZ2R8uU
wViPHiUxlEZDdI5n/Rvl5wYLZsdMntOQWwcLDBY7KfnNiqOn8k7/Dlfp/ASntJ7G
YTlFKo+WHmCWEht2cyFyxOaupi3e2zzyU3VGZ+t9mXyOkrtoMhlw6OgAM32uAqUr
X+o3jgTYp32buQAeDGSr9tNB+f41V2z2KlcB/LkWnkNpS9dtMVVVKxSgNruh6hEB
il76emBzN+QqVqGEOdFYp0X5NVd5LZfl39atMFFJ21ztCpOZzRE=
=6UzC
-----END PGP SIGNATURE-----
--=-=-=--

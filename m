Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCEF0900FD
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2019 13:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbfHPL4n convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 16 Aug 2019 07:56:43 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:47224 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727022AbfHPL4n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Aug 2019 07:56:43 -0400
IronPort-SDR: pGcdOqT4di5Phl2vKoipHlpXGd1Y9edmv0M5fT7etkE8cQOBb8dGnlYJ/cRF9YiWMoNtUzaIwc
 YkpcKD3AsJMUWLx4CEwW4TvlgIuZ7dVgYO25JaTrU7IJO6urOpr0napGm9atUjCskAwNbergvV
 /vwQZ3Bv4BgKQvkhQoGuCE3iZfVVIAkS7fEFriMVO6cUW++IKp1aM2kRbJvMFHPpU0VQ1CwSd2
 0by9hFO2ZztMF7LgFVy6mURyMWcDXNVUXI1kNgTtBJoBrccghvoMm0oa+QhCqh+5qDGfaWGNev
 ilw=
X-IronPort-AV: E=Sophos;i="5.64,393,1559548800"; 
   d="scan'208";a="40522794"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 16 Aug 2019 03:56:35 -0800
IronPort-SDR: Q3BFy3H5NzfEyw4gXqTyujjxqI0hD5bEqY/DSGpVq/FMiFp/G4/IKcjPV0RD2vnI9psecBmGYw
 /j9x6RgHQ5rrKkarpxCGyu2Pscp05Lsec6Bum+EjzBwf7Adl5qSIg0Z2l5aYFd/BEJsexC1KBy
 YvlxqCNdr44FT/GFh2FwfNm4SAo91T6c0ALpo95q6bG7jCA2dQEoX16b80QxDTelmaMing/HlQ
 LlXjpRQbT6BeUTMbNM7pBIFIrh95/I91KwV36PLl/A/oVJdBuYo6ESI7G7to/UGRMhkkqokfYx
 r5Y=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     Oliver Neukum <oneukum@suse.com>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: AW: AW: Strange behaviour of D-Link DUB-1312 USB 3.0 Adapters
Thread-Topic: AW: Strange behaviour of D-Link DUB-1312 USB 3.0 Adapters
Thread-Index: AdVSeH/taFnFr9I1T4OXjPctlrQ3Ev//86kA///uBTCAAF8egIABinwc//5pRmA=
Date:   Fri, 16 Aug 2019 11:56:30 +0000
Message-ID: <93de327cbfda4cbb930a83aa58274125@SVR-IES-MBX-03.mgc.mentorg.com>
References: <db0e8930ea94408ca7a38192ddfd203f@SVR-IES-MBX-03.mgc.mentorg.com>
         <1565771508.25764.3.camel@suse.com>
         <f5e22fea4e1c4baeb2fc98d324ad9060@SVR-IES-MBX-03.mgc.mentorg.com>,<1565788073.25764.8.camel@suse.com>
 <1565870525382.10504@mentor.com>
In-Reply-To: <1565870525382.10504@mentor.com>
Accept-Language: de-DE, en-IE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> >> I don't think its a regression.
> >
> > It would be better to know than to assume.
> >
> Happens with kernel 4.14.102 also, not only with 4.14.129.
> Looks more HW related.
> 
Confirmed: HW issue.

Best regards
Carsten

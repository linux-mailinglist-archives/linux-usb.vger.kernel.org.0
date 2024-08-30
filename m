Return-Path: <linux-usb+bounces-14369-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C897096603D
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 13:12:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DAB3B2E5FB
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 11:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFFC1A285A;
	Fri, 30 Aug 2024 11:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWinfTNZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C348318C004
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 11:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725016064; cv=none; b=B3cqhgv/XpVunFwWfY/MqwxVvETaQwqXCj/wVskE082TqvI1KD6GP44O9Lcmz1dQ0HRRnUDoWu8h1qdxX/dSXdYTqN3Ni6tYBLHu+8KXudjx2Bslqa3a7oLfKlTh3xFv7dX8h3OcwtIUv6outeix1HXFGcS4FfbP799EX9Aq1rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725016064; c=relaxed/simple;
	bh=ddcZUJP0lCNCsUD6ceogR0mhZnTc+Iic2YylUI2pFkc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=JahLn8ZvIk0KAk3sTQVyxjC9Q4E8ZBEk4pickHblHAZDsAmtX4O8hpOWqCyiHTkoWc1ydxSyUmN+/BLJEFaPdvMFWyb/iAtb11h8sWXt8qlDYFN/w0Vozu+eDYEniDVcS/SJqmM+NnocYCH2N39kT50dAC3ZTVSilCXeisUCP1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWinfTNZ; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-70f645a30dcso808801a34.3
        for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 04:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725016062; x=1725620862; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ySADW4Kq/EaBWp1PPWZaR2Cv2x4kzBk5nUHxU8XVBos=;
        b=iWinfTNZTe+WkgbYeiThf2ASM3AcvvaQlL8jU/ZzOiWqSqejd1IU7LyAnzS8KYyr7I
         /CkDt8e8glXV1bvBC8ewDASv4Xye1Mg9p84ebuNSqc3BtWP54FWB3FJrKK0zlBF2NCZc
         2Kld2LsYt85RW0GRzXRCPyXkHif5cOMxc5RkhO34TOaC0hke3MSX6LSexY4Jn69HWZw0
         3az3zhFYf/H5ePQ2CoexY7gYOTBXHT5081FWPS0p0PcAst8LxLNWNUPxHqFjRShoU8DE
         JRJY3qH5JCsmu3A96nmaY/6Jir/rQC/X/7ONPhXylVDCck5mVJlX/b29v4UvGQ6wihIt
         LInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725016062; x=1725620862;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ySADW4Kq/EaBWp1PPWZaR2Cv2x4kzBk5nUHxU8XVBos=;
        b=HlkGZviT6g6me1NV+zZElsirjit+B2vEzO8TYR3IqTh0wWf5nu36yJk+XTzdcJ6BB5
         dGwAZPo6+nBx/pMZ93oik71cAkF5WojPYnGS676YhFuKmsgS6g4ouXZ0stscP2Lrhixm
         QL04BStvjNstR+XVEnrCwAExwI+AlB2/8TdlG4LvHqLumWWoKVSA+ZivyhiNGNbrzA/3
         OpviaiVQML+6G2zqZp61jBkbzGtOtlg+Ue3BdZACSFZzHq+W/FayB3hxu/NjiUHhd+gJ
         l7TW7lDp7zLCbRzzmDku/oMZNczsF4wfCGMew9cgnvHyeG2TdAdsoQq+7F4VA0n/MhyG
         oQhw==
X-Gm-Message-State: AOJu0YzvnrxdA9hzdZpCMtEUx6IgFWKRPdyCoqOCjHAdPgyAy9w5rrXx
	L99D2EASXFB5POs5yS57FFiJ0AdC57+3/milKElEEBUWBz0TLyURUDtCDXG8racxTnkrsKXOBPa
	QjheN8lRadmRh9RhC/bysxgn3cURy2RWSWO07nw==
X-Google-Smtp-Source: AGHT+IE8QgqqdZ0x5b9jTQAMzhZ1aCxD8LtaDITAc7vWQa+lmiC8BIBsJ/I7bVSHTO5gSCUpfRUd66FaU5oJdnFV6Q8=
X-Received: by 2002:a05:6358:440c:b0:1b5:f95a:5a67 with SMTP id
 e5c5f4694b2df-1b603c3bb99mr744742455d.15.1725016061653; Fri, 30 Aug 2024
 04:07:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Amil Sanan <amilsananak@gmail.com>
Date: Fri, 30 Aug 2024 16:37:29 +0530
Message-ID: <CABprV6ReozmBsi5Db-MQw2iHt1mXXjy735yfHwQdeC6RX92RLw@mail.gmail.com>
Subject: adding a new device in uvc_driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dan.scally@ideasonboard.com
Cc: linux-usb@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000009675300620e49946"

--0000000000009675300620e49946
Content-Type: multipart/alternative; boundary="00000000000096752e0620e49944"

--00000000000096752e0620e49944
Content-Type: text/plain; charset="UTF-8"

adding the webcam of new acer aspire7

output of lsusb: "Bus 001 Device 002: ID 0408:4033 Quanta Computer, Inc.
ACER HD User Facing

"

--00000000000096752e0620e49944
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>adding the webcam of new acer aspire7<br><br></div>ou=
tput of lsusb: &quot;<span style=3D"font-family:monospace"><span style=3D"c=
olor:rgb(0,0,0);background-color:rgb(255,255,255)">Bus 001 Device 002: ID 0=
408:4033 Quanta Computer, Inc. ACER HD User Facing</span><br>
<br></span><div><span style=3D"font-family:monospace">&quot;</span></div><d=
iv><span style=3D"font-family:monospace"><br></span></div><br><br></div>

--00000000000096752e0620e49944--
--0000000000009675300620e49946
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-add-a-device-in-uvc_driver.patch"
Content-Disposition: attachment; 
	filename="0001-add-a-device-in-uvc_driver.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m0glwgdk0>
X-Attachment-Id: f_m0glwgdk0

RnJvbSBkMThhZDNiZjliYmM5M2RhM2VlYjBjYTRlYTY1OTg5NTVhYzA1YTk5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBhbWlsc2FuYW4gPGFtaWxzYW5hbmFrQGdtYWlsLmNvbT4KRGF0
ZTogVGh1LCAyOSBBdWcgMjAyNCAxNzozODoyNSArMDUzMApTdWJqZWN0OiBbUEFUQ0hdIGFkZCBh
IGRldmljZSBpbiB1dmNfZHJpdmVyCgpTaWduZWQtb2ZmLWJ5OiBhbWlsc2FuYW4gPGFtaWxzYW5h
bmFrQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL21lZGlhL3VzYi91dmMvdXZjX2RyaXZlci5jIHwg
OSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL21lZGlhL3VzYi91dmMvdXZjX2RyaXZlci5jIGIvZHJpdmVycy9tZWRpYS91c2Iv
dXZjL3V2Y19kcml2ZXIuYwppbmRleCBmMGZlYmRjMDguLjFhMzIyOWFiNiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9tZWRpYS91c2IvdXZjL3V2Y19kcml2ZXIuYworKysgYi9kcml2ZXJzL21lZGlhL3Vz
Yi91dmMvdXZjX2RyaXZlci5jCkBAIC0yNDQxLDYgKzI0NDEsMTUgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCB1c2JfZGV2aWNlX2lkIHV2Y19pZHNbXSA9IHsKIAkgIC5kcml2ZXJfaW5mbwkJPSAoa2Vy
bmVsX3Vsb25nX3QpJihjb25zdCBzdHJ1Y3QgdXZjX2RldmljZV9pbmZvKXsKIAkJLnV2Y192ZXJz
aW9uID0gMHgwMTBhLAogCSAgfSB9LAorCSAgeyAubWF0Y2hfZmxhZ3MgCT0gVVNCX0RFVklDRV9J
RF9NQVRDSF9ERVZJQ0UKKwkJCXwgVVNCX0RFVklDRV9JRF9NQVRDSF9JTlRfSU5GTywKKwkgIC5p
ZFZlbmRvciA9IDB4MDQwOCwKKwkgIC5pZFByb2R1Y3QgPSAweDQwMzMsCisJICAuYkludGVyZmFj
ZUNsYXNzID0gVVNCX0NMQVNTX1ZJREVPLAorCSAgLmJJbnRlcmZhY2VTdWJDbGFzcyA9IDEsCisJ
ICAuYkludGVyZmFjZVByb3RvY29sID0JVVZDX1BDX1BST1RPQ09MXzE1LAorCSAgLmRyaXZlcl9p
bmZvID0gKGtlcm5lbF91bG9uZ190KSAmKGNvbnN0IHN0cnVjdCB1dmNfZGV2aWNlX2luZm8gKSAK
KwkJey51dmNfdmVyc2lvbiA9IDB4MDEwYSwgfSB9LAogCS8qIExvZ2lMaW5rIFdpcmVsZXNzIFdl
YmNhbSAqLwogCXsgLm1hdGNoX2ZsYWdzCQk9IFVTQl9ERVZJQ0VfSURfTUFUQ0hfREVWSUNFCiAJ
CQkJfCBVU0JfREVWSUNFX0lEX01BVENIX0lOVF9JTkZPLAotLSAKMi40My4wCgo=
--0000000000009675300620e49946--


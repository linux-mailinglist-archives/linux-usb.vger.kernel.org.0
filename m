Return-Path: <linux-usb+bounces-7578-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E89872BA9
	for <lists+linux-usb@lfdr.de>; Wed,  6 Mar 2024 01:15:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC25F1C21961
	for <lists+linux-usb@lfdr.de>; Wed,  6 Mar 2024 00:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D231C02;
	Wed,  6 Mar 2024 00:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=elbertmai.com header.i=@elbertmai.com header.b="F9LteIn3";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="u6YoWFrZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E367C803
	for <linux-usb@vger.kernel.org>; Wed,  6 Mar 2024 00:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709684146; cv=none; b=GnXJ2ara2w8UY92yUuD77eLNiCkl3+w6GEBkLMFcsc7CVOomx4QzWtUfg2Zp5nfC9nbcJd0IdJtWgjiFZOUVz3NUCfp84PMW8jhYsISXPgoQw/h2vj/7rRhArGJGSd0KZlfjhx0YMXyajOhLKYE+rHvFbCEd3uSyhlFJ9B2PRrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709684146; c=relaxed/simple;
	bh=ZGP8ITsnSgvunGZyoMCg11L8zV60Rr1VSRoZJHxlQk4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=kXwzYCWGXSC11OqzZnzTygXJtJNPerlFHzjEbbmkeaHFz3c4gBfnIsNiFnOwPeORxXQiazeLo7A06y+HM21SGwPeeA5ZMv6lZI/fpcvfB3l0bkc5APW5F0t9tWIGu1DxcCHzPBwbbmkBjzC+fAQPabnn1naFr50kB7cGRH4NVzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=elbertmai.com; spf=pass smtp.mailfrom=elbertmai.com; dkim=pass (2048-bit key) header.d=elbertmai.com header.i=@elbertmai.com header.b=F9LteIn3; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=u6YoWFrZ; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=elbertmai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=elbertmai.com
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=F9LteIn3dF4ep8VXUY0iN52qTSxgBwM+Y3Y8Q1ChNeWw6vujXEz2S7bGlCkOmUA6lfx1W1wQVjjgOF6IMe+DfRKuxhZLrq0TRCgCZ84sltkPIXFIZiQzYXcCw/UWzPTMkqoZpaPdtoN6BQ3gRqnphA2Am6s/KOHPG+d+0QjH5K9fYGmAyjS2e+YoUwhfR2n4wgbscfH12ikjOWrFFcusKflVyAUVefOg5CM2Qat8RltO3ClAjGI4WR5ZTk4KCYOWO3UnJqkU4s6x6+keNY4uk1B1EHmIn/RdXdrn9Z1q/V97pNBPHFT+S24TzRqcClELD3ouAnD3oIuWc5S30hoXBg==; s=purelymail2; d=elbertmai.com; v=1; bh=ZGP8ITsnSgvunGZyoMCg11L8zV60Rr1VSRoZJHxlQk4=; h=Received:From:To:Subject;
DKIM-Signature: a=rsa-sha256; b=u6YoWFrZkpxPDjg7Qyj535tfxKUAvhsx1XbMbgrEfi0dTIpUfxt10rfRC5UrpCn1bnctdA+XXy2AUDzxYbGJp7DMSjIV1iavxmbb3KUvRXp8Q70vYrzBMFDK9MjC2tEPGQzk1pYuEl+6r1AjzRDwvL+RUoOAYun5OtprqyJWZohA24hASBklnVDIrV9jN5yxLWYDft5TJNY6bbWlWKbw+zc/X21Ty9jym5NXjxCATosLpWut6+Z0IzkyXo/rrJ5ONX0f763nkRHd5BNhhjUETILEIOR0izptkYlCWl7gBoPy7bJeNlOHSaHqP/XtmlHMi1oWMNb04Oc3FE8BAtIyxA==; s=purelymail2; d=purelymail.com; v=1; bh=ZGP8ITsnSgvunGZyoMCg11L8zV60Rr1VSRoZJHxlQk4=; h=Feedback-ID:Received:From:To:Subject;
Feedback-ID: 5995:1482:null:purelymail
X-Pm-Original-To: linux-usb@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1397573428;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 06 Mar 2024 00:15:25 +0000 (UTC)
From: Elbert Mai <code@elbertmai.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Elbert Mai <code@elbertmai.com>
Subject: [PATCH] usb: Clarify expected behavior of dev_bin_attrs_are_visible()
Date: Tue,  5 Mar 2024 16:15:03 -0800
Message-Id: <20240306001503.313028-1-code@elbertmai.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

The commit "usb: Export BOS descriptor to sysfs" added a binary attribute
group to sysfs. It doesn't check if the descriptors attribute should be
visible, which is by design and not an oversight. Update a comment so that
it better explains this in the dev_bin_attrs_are_visible() function.

Signed-off-by: Elbert Mai <code@elbertmai.com>
---
I had mistakenly written the entry as if it went into stable/sysfs-bus-usb
instead of testing/sysfs-bus-usb, so the "..." shouldn't be there. I see
you have already moved and corrected the bos_descriptors documentation, so
it should be all OK now.

 drivers/usb/core/sysfs.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
index 777526f59720..f98263e21c2a 100644
--- a/drivers/usb/core/sysfs.c
+++ b/drivers/usb/core/sysfs.c
@@ -929,8 +929,11 @@ static umode_t dev_bin_attrs_are_visible(struct kobjec=
t *kobj,
 =09struct device *dev =3D kobj_to_dev(kobj);
 =09struct usb_device *udev =3D to_usb_device(dev);
=20
-=09/* All USB devices have a device descriptor, so the descriptors
-=09 * attribute always exists. No need to check for its visibility.
+=09/*
+=09 * There's no need to check if the descriptors attribute should
+=09 * be visible because all devices have a device descriptor. The
+=09 * bos_descriptors attribute should be visible if and only if
+=09 * the device has a BOS, so check if it exists here.
 =09 */
 =09if (a =3D=3D &bin_attr_bos_descriptors) {
 =09=09if (udev->bos =3D=3D NULL)
--=20
2.34.1



Return-Path: <linux-usb+bounces-3525-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B217FFD84
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 22:29:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3412E281726
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 21:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32AF559143;
	Thu, 30 Nov 2023 21:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frida-re.20230601.gappssmtp.com header.i=@frida-re.20230601.gappssmtp.com header.b="zMiEGmCZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A53561B4
	for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 13:29:16 -0800 (PST)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-1f9e6a8b00aso763571fac.3
        for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 13:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frida-re.20230601.gappssmtp.com; s=20230601; t=1701379756; x=1701984556; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+5hqGf8kyXfavMKKgMbxFZwD2SkzZYb6ewVEBq9RtRs=;
        b=zMiEGmCZBneTgNnOE25BfkCQh9e3bc10WPdyzDvdCTFsSn5743mopZVPXtrMJKW1lc
         yR2pKem7YJh/QVzAbDPRF5PcLrwcRWB2TlE3puLNHAiO/EaY2ETAPyCnSowC86Z29q7n
         OzTARssStLOyISiMuK0L8XBLRVWJsuGYTKQ76RNduaECDsFYCaLXP50GEojHP4soK06Y
         XHtoriD8bkxIBT9i6jPp2t+9B5X7524xt394bkGaqeJMMsdFDqZgbZI16SP6muMqtUcS
         pr8xI9O7ivvJUtiJVLTGY3Dr4NKWrJ68TXrcsL/2Io9uRqrFXNQYjOX2HAjdVIt1fnsr
         6n1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701379756; x=1701984556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+5hqGf8kyXfavMKKgMbxFZwD2SkzZYb6ewVEBq9RtRs=;
        b=gk13G76IyBAYMTDbygogHvwIzUhJeZ32OzHI8uAkLL34qJklC1W4iGid2WlPPxMlEi
         M7gf5YUzDaHcDl3TBhFY42rJrhZAHNw53OKR58+CCk77+shL10hPNAPlqcPW0fPwgEK2
         3q8iBLGqihPElXKZKF0WDu7S0CRjXj+1EHoZQJNArpiF0QNzQsdJ5IGrZl2SfinT+j5T
         Q0PMyOQ4j9jxBDQd0fOAwSHppXfOboP6bjCr0MEi60ktTuxuKRQ2K0hq3qo8fe4p0h4l
         qH1h9RMi5DkJDQRHu7N1OwfLCOQREmjaChiWuxzLNxlqn29qryPaYbEoD/bKIdm5uUYU
         QjIg==
X-Gm-Message-State: AOJu0YyK9+UWp24VKfY62wd7ARmweeftGBs4x0pcX6wci/XhwwwA6Mqa
	LhWHQibixEOLMXFENGxHmMCOxlYRLgRWCfx46bg7RDrjoI3n02F/tHk=
X-Google-Smtp-Source: AGHT+IFBANw++QXxOTl84TPSXuuJ2hIvwSrhy4gz93cU0rkEP3dg24ZjAojA9W/t0VIy3fUmdqTnp0wAzaZdrxWPidE=
X-Received: by 2002:a05:6870:1f0e:b0:1fa:4071:52e with SMTP id
 pd14-20020a0568701f0e00b001fa4071052emr18946988oab.25.1701379755892; Thu, 30
 Nov 2023 13:29:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?T2xlIEFuZHLDqSBWYWRsYSBSYXZuw6Vz?= <oleavr@frida.re>
Date: Thu, 30 Nov 2023 22:29:05 +0100
Message-ID: <CA+DmxX_N2106oTDB9izU8aAQzoVJJUBYm9M0M5d6-sxDyyxJtA@mail.gmail.com>
Subject: [PATCH] CDC-NCM: add support for Apple iDevices
To: linux-usb@vger.kernel.org
Cc: oliver@neukum.org, havard@hsorbo.no
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Which lack a status endpoint, presumably because there isn't a physical
cable that can be unplugged, nor any speed changes to be notified about.

Note that NCM interfaces are not exposed until a mode switch is requested,
which macOS does automatically.

The mode switch can be performed like this:

        uint8_t status;
        libusb_control_transfer(device_handle,
                LIBUSB_RECIPIENT_DEVICE | LIBUSB_REQUEST_TYPE_VENDOR |
                LIBUSB_ENDPOINT_IN,
                82, /* bRequest */
                0,  /* wValue   */
                3,  /* wIndex   */
                &status,
                sizeof(status),
                0);

Co-developed-by: Ha=CC=8Avard S=C3=B8rb=C3=B8 <havard@hsorbo.no>
Signed-off-by: Ha=CC=8Avard S=C3=B8rb=C3=B8 <havard@hsorbo.no>
Signed-off-by: Ole Andr=C3=A9 Vadla Ravn=C3=A5s <oleavr@frida.re>
---
 drivers/net/usb/cdc_ncm.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index db05622f1f70..e97c83b7c51d 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -933,7 +933,8 @@ int cdc_ncm_bind_common(struct usbnet *dev, struct
usb_interface *intf, u8 data_

  cdc_ncm_find_endpoints(dev, ctx->data);
  cdc_ncm_find_endpoints(dev, ctx->control);
- if (!dev->in || !dev->out || !dev->status) {
+ if (!dev->in || !dev->out || (!dev->status &&
+ dev->driver_info->flags & FLAG_LINK_INTR)) {
  dev_dbg(&intf->dev, "failed to collect endpoints\n");
  goto error2;
  }
@@ -1925,6 +1926,20 @@ static const struct driver_info cdc_ncm_zlp_info =3D=
 {
  .set_rx_mode =3D usbnet_cdc_update_filter,
 };

+/* Same as cdc_ncm_info, but without FLAG_LINK_INTR, and with FLAG_SEND_ZL=
P */
+static const struct driver_info idevice_info =3D {
+ .description =3D "Apple iDevice NCM",
+ .flags =3D FLAG_POINTTOPOINT | FLAG_NO_SETINT | FLAG_MULTI_PACKET
+ | FLAG_ETHER | FLAG_SEND_ZLP,
+ .bind =3D cdc_ncm_bind,
+ .unbind =3D cdc_ncm_unbind,
+ .manage_power =3D usbnet_manage_power,
+ .status =3D cdc_ncm_status,
+ .rx_fixup =3D cdc_ncm_rx_fixup,
+ .tx_fixup =3D cdc_ncm_tx_fixup,
+ .set_rx_mode =3D usbnet_cdc_update_filter,
+};
+
 /* Same as cdc_ncm_info, but with FLAG_WWAN */
 static const struct driver_info wwan_info =3D {
  .description =3D "Mobile Broadband Network Device",
@@ -1954,6 +1969,18 @@ static const struct driver_info wwan_noarp_info =3D =
{
 };

 static const struct usb_device_id cdc_devs[] =3D {
+ /* iPhone */
+ { USB_DEVICE_AND_INTERFACE_INFO(0x05ac, 0x12a8, USB_CLASS_COMM,
+ USB_CDC_SUBCLASS_NCM, USB_CDC_PROTO_NONE),
+ .driver_info =3D (unsigned long)&idevice_info,
+ },
+
+ /* iPad */
+ { USB_DEVICE_AND_INTERFACE_INFO(0x05ac, 0x12ab, USB_CLASS_COMM,
+ USB_CDC_SUBCLASS_NCM, USB_CDC_PROTO_NONE),
+ .driver_info =3D (unsigned long)&idevice_info,
+ },
+
  /* Ericsson MBM devices like F5521gw */
  { .match_flags =3D USB_DEVICE_ID_MATCH_INT_INFO
  | USB_DEVICE_ID_MATCH_VENDOR,
--=20
2.43.0


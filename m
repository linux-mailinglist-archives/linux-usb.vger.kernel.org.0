Return-Path: <linux-usb+bounces-3999-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5695A80E06E
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 01:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA630B212A2
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 00:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6F97E3;
	Tue, 12 Dec 2023 00:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=nozomi.space header.i=@nozomi.space header.b="rgXsXynP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.nozomi.space (mail.nozomi.space [139.162.184.125])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40A1499
	for <linux-usb@vger.kernel.org>; Mon, 11 Dec 2023 16:46:33 -0800 (PST)
Date: Tue, 12 Dec 2023 01:46:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nozomi.space; s=mail;
	t=1702341990; bh=cjkge3z+KaAw64Tp+7lotjeEnGyo9RIxiijjuRhseEo=;
	h=From:Subject:To:Cc;
	b=rgXsXynPcumIjg2yOLBCFHpBVh/9ZMpNW+UzmEf/h8Rvl6gwKIMemaXbOnYEAPTER
	 qbgu++PKGVIKu1Jd1kWt51GLsl51vrBIyBxLgStcgkfMiExbzA1lf2lCRwK3UcIqvP
	 JuNS4f5l/5BWn9J2zzCBt7L8QYoxbw477/zQnfousyH2uVHDUsAJq8o+sRouCnZuHV
	 LcxqTotaHmez2NCXeFpouhQqV6kxY8o0z+5DLalLcZIlUWTe8WbvMUE3ChZfqE15Xo
	 wNWAULcaXF4bBxCjGqmiGFQrsMu7O1js6MQIHqXeA2tb0P/lOqKWymJ9Vt5MvQdEeh
	 zmy8NWFrmtLErU9gPci+M0OvNPZDDvYBgmCcpKSVs3M2eLUP/HoTd7G/97sK6f1wr0
	 luiwQd0/VXYt5Ewyi6z3jzWXY/kLx+fGIE8edJjr8ykdU3Mx1ZVKKJtHQ9DKSLQUpv
	 ZIO8ml7Gu5Vtl/XP8/Q2Ka2rwvx7NcpDnhUrIIorRyyUjY2kp7f7h3l5Q0dU6cS+iu
	 tKLSQOfgW8bUYbj1oHapll3YyP0ed7X90nE9kpVvWT8iE3uZJGU37Ev9wgrHY3Z7yr
	 xSh9qw19CA+u7Ld4QWYIyLaNH1JXLUTCUjr9WZgqJYJthuxshEIE1cnl3AN/2ud7QY
	 n5k5+0GSNLaufENCKmvfpUAU=
From: =?iso-8859-2?q?Micha=B3_Kope=E6?= <michal@nozomi.space>
Subject: [PATCH v2] platform/x86: serial-multi-instantiate: allow single
 GpioInt IRQ for INT3515
To: linux-usb <linux-usb@vger.kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Message-Id: <CH3J5S.PJBGAHBM3MBE2@nozomi.space>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: quoted-printable

On some devices, such as the Lenovo ThinkPad T14 Gen1 (AMD), there is
only one GpioInt resource defined for all i2c device instances. Handle
this case appropriately by autodetecting the irq type and allowing
fallback to the first IRQ index for the second, third and fourth=20
tps6598x
instances.

Additionally, to use the `platform_get_irq_optional` function to silence
errors that may not be relevant if the IRQ is optional. In cases where=20
the
IRQ is not optional, `dev_err_probe` is still triggered, so other=20
devices
will not be affected by this change.

v2: fix linewrap in summary

Signed-off-by: Micha=B3 Kope=E6 <michal@nozomi.space>
---
 .../platform/x86/serial-multi-instantiate.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/serial-multi-instantiate.c=20
b/drivers/platform/x86/serial-multi-instantiate.c
index 8158e3cf5d6d..1c4cc44d5a88 100644
--- a/drivers/platform/x86/serial-multi-instantiate.c
+++ b/drivers/platform/x86/serial-multi-instantiate.c
@@ -23,6 +23,8 @@
 #define IRQ_RESOURCE_APIC 2
 #define IRQ_RESOURCE_AUTO 3

+#define IRQ_OPTIONAL BIT(2)
+
 enum smi_bus_type {
  SMI_I2C,
  SMI_SPI,
@@ -59,7 +61,7 @@ static int smi_get_irq(struct platform_device *pdev,=20
struct acpi_device *adev,
    dev_dbg(&pdev->dev, "Using gpio irq\n");
    break;
   }
- ret =3D platform_get_irq(pdev, inst->irq_idx);
+ ret =3D platform_get_irq_optional(pdev, inst->irq_idx);
   if (ret > 0) {
    dev_dbg(&pdev->dev, "Using platform irq\n");
    break;
@@ -69,12 +71,12 @@ static int smi_get_irq(struct platform_device=20
*pdev, struct acpi_device *adev,
   ret =3D acpi_dev_gpio_irq_get(adev, inst->irq_idx);
   break;
  case IRQ_RESOURCE_APIC:
- ret =3D platform_get_irq(pdev, inst->irq_idx);
+ ret =3D platform_get_irq_optional(pdev, inst->irq_idx);
   break;
  default:
   return 0;
  }
- if (ret < 0)
+ if (ret < 0 && !inst->flags & IRQ_OPTIONAL)
   return dev_err_probe(&pdev->dev, ret, "Error requesting irq at index=20
%d\n",
          inst->irq_idx);

@@ -210,6 +212,8 @@ static int smi_i2c_probe(struct platform_device=20
*pdev, struct smi *smi,
   board_info.dev_name =3D name;

   ret =3D smi_get_irq(pdev, adev, &inst_array[i]);
+ if (ret < 0 && inst_array[i].flags & IRQ_OPTIONAL)
+ ret =3D smi_get_irq(pdev, adev, &inst_array[0]);
   if (ret < 0)
    goto error;
   board_info.irq =3D ret;
@@ -309,10 +313,11 @@ static const struct smi_node bsg2150_data =3D {

 static const struct smi_node int3515_data =3D {
  .instances =3D {
- { "tps6598x", IRQ_RESOURCE_APIC, 0 },
- { "tps6598x", IRQ_RESOURCE_APIC, 1 },
- { "tps6598x", IRQ_RESOURCE_APIC, 2 },
- { "tps6598x", IRQ_RESOURCE_APIC, 3 },
+ { "tps6598x", IRQ_RESOURCE_AUTO, 0 },
+ /* On some platforms only one shared GpioInt is defined */
+ { "tps6598x", IRQ_RESOURCE_AUTO | IRQ_OPTIONAL, 1 },
+ { "tps6598x", IRQ_RESOURCE_AUTO | IRQ_OPTIONAL, 2 },
+ { "tps6598x", IRQ_RESOURCE_AUTO | IRQ_OPTIONAL, 3 },
   {}
  },
  .bus_type =3D SMI_I2C,
--=20
2.43.0







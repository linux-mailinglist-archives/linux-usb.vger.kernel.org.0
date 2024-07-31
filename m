Return-Path: <linux-usb+bounces-12756-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08467943723
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 22:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 243951C21C80
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 20:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F01148FF3;
	Wed, 31 Jul 2024 20:32:43 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from maynard.decadent.org.uk (maynard.decadent.org.uk [65.21.191.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED661BDCF
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 20:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.191.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722457962; cv=none; b=uFqxTrhWrFisUE7kWcwEpwHkGRl5h/ypPyYc0Wea7stwmD/a3hOo7bELysZurT+u4QAM8MYgsNsBxwcAxZxOIP8OAv0jGwCjpdefaa4Wxj3rrEziuvR6ebDTvx7wiU9V31H86N3CBEvUNYLBnQhPxfy4rpKnkTxmYVmHe6bh9dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722457962; c=relaxed/simple;
	bh=u+iLKmyMlH0XaIKCTbQXXCT81UQojOU2C8B1w8vvLdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVdhFGEZuIuWwJFavSB1OPpZlnkSc+IW564XmLECgv7O3yPiaM55K3iHfrlajAxuCj/iz2BqUxvfK/2wnHRbcE/09cnB65j2rhTETd/7iQie4LU55M1ZajXeDRXwDqPduxh1P7c+alt9IkRlcZVFwXmgBh4FxNLcIdLYak0d6QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=decadent.org.uk; spf=pass smtp.mailfrom=decadent.org.uk; arc=none smtp.client-ip=65.21.191.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=decadent.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=decadent.org.uk
Received: from [2a02:578:851f:1502:391e:c5f5:10e2:b9a3] (helo=deadeye)
	by maynard with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ben@decadent.org.uk>)
	id 1sZFzr-001UZs-1U;
	Wed, 31 Jul 2024 20:32:30 +0000
Received: from ben by deadeye with local (Exim 4.98)
	(envelope-from <ben@decadent.org.uk>)
	id 1sZFzp-00000000Vod-2reF;
	Wed, 31 Jul 2024 22:32:29 +0200
Date: Wed, 31 Jul 2024 22:32:29 +0200
From: Ben Hutchings <ben@decadent.org.uk>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
	Cyril Brulebois <kibi@debian.org>
Subject: [PATCH v2] xhci-pci: Make xhci-pci-renesas a proper modular driver
Message-ID: <ZqqfXYRJf7kGaqus@decadent.org.uk>
References: <2024073145-curdle-bronco-b9ca@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aRQaP/QeofET2AnD"
Content-Disposition: inline
In-Reply-To: <2024073145-curdle-bronco-b9ca@gregkh>
X-SA-Exim-Connect-IP: 2a02:578:851f:1502:391e:c5f5:10e2:b9a3
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on maynard); SAEximRunCond expanded to false


--aRQaP/QeofET2AnD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

If CONFIG_USB_XHCI_PCI_RENESAS is enabled, xhci-pci conditionally
calls into the xhci-pci-renesas module, which means both modules must
be loaded to use any xHCI PCI controller.

The MODULE_FIRMWARE declaration in the base xhci-pci module causes
initramfs-tools to check for and warn about missing firmware for the
Renesas xHCI controllers, when any xHCI PCI controller is present.
And because of the previous oddity, simply moving this declaration to
xhci-pci-renesas wouldn't help.

To fix this, reverse the relationship between the modules:

- Remove the quirk for the Renesas xHCIs, and the driver_data
  structure used only for them
- In xhci-pci:
  - Rename xhci_pci_probe() to xhci_pci_common_probe()
  - Export xhci_pci_common_probe() and xhci_pci_remove()
  - Use a new probe function that rejects the Renesas xHCIs and then
    calls the common probe function
- In xhci-pci-renesas:
  - Stop exporting renesas_xhci_check_request_fw()
  - Add a probe function that calls renesas_xhci_check_request_fw()
    followed by xhci_pci_common_probe()
  - Add and register a new pci_driver matching only the Renesas xHCIs
    and using its own probe function, but with other operations the
    same as in xhci-pci
- Make CONFIG_USB_XHCI_PCI_RENESAS depend on CONFIG_USB_XHCI_PCI,
  not the other way around

Finally, move the MODULE_FIRMWARE declaration to xhci-pci-renesas.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
v2:
- Fix definition of xhci_pci_probe() to remain static
- Rebase onto v6.11-rc1

 drivers/usb/host/Kconfig            |  2 +-
 drivers/usb/host/xhci-pci-renesas.c | 48 ++++++++++++++++++++----
 drivers/usb/host/xhci-pci.c         | 57 ++++++++++-------------------
 drivers/usb/host/xhci-pci.h         | 19 +---------
 drivers/usb/host/xhci.h             |  2 +-
 5 files changed, 64 insertions(+), 64 deletions(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 4448d0ab06f0..d011d6c753ed 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -40,11 +40,11 @@ config USB_XHCI_DBGCAP
 config USB_XHCI_PCI
 	tristate
 	depends on USB_PCI
-	depends on USB_XHCI_PCI_RENESAS || !USB_XHCI_PCI_RENESAS
 	default y
=20
 config USB_XHCI_PCI_RENESAS
 	tristate "Support for additional Renesas xHCI controller with firmware"
+	depends on USB_XHCI_PCI
 	help
 	  Say 'Y' to enable the support for the Renesas xHCI controller with
 	  firmware. Make sure you have the firmware for the device and
diff --git a/drivers/usb/host/xhci-pci-renesas.c b/drivers/usb/host/xhci-pc=
i-renesas.c
index 247cc7c2ce70..30cc5a1380a5 100644
--- a/drivers/usb/host/xhci-pci-renesas.c
+++ b/drivers/usb/host/xhci-pci-renesas.c
@@ -50,6 +50,8 @@
 #define RENESAS_RETRY	10000
 #define RENESAS_DELAY	10
=20
+#define RENESAS_FW_NAME	"renesas_usb_fw.mem"
+
 static int renesas_fw_download_image(struct pci_dev *dev,
 				     const u32 *fw, size_t step, bool rom)
 {
@@ -573,12 +575,10 @@ static int renesas_load_fw(struct pci_dev *pdev, cons=
t struct firmware *fw)
 	return err;
 }
=20
-int renesas_xhci_check_request_fw(struct pci_dev *pdev,
-				  const struct pci_device_id *id)
+static int renesas_xhci_check_request_fw(struct pci_dev *pdev,
+					 const struct pci_device_id *id)
 {
-	struct xhci_driver_data *driver_data =3D
-			(struct xhci_driver_data *)id->driver_data;
-	const char *fw_name =3D driver_data->firmware;
+	const char fw_name[] =3D RENESAS_FW_NAME;
 	const struct firmware *fw;
 	bool has_rom;
 	int err;
@@ -625,7 +625,41 @@ int renesas_xhci_check_request_fw(struct pci_dev *pdev,
 	release_firmware(fw);
 	return err;
 }
-EXPORT_SYMBOL_GPL(renesas_xhci_check_request_fw);
=20
-MODULE_DESCRIPTION("Support for Renesas xHCI controller with firmware");
+static int
+xhci_pci_renesas_probe(struct pci_dev *dev, const struct pci_device_id *id)
+{
+	int retval;
+
+	retval =3D renesas_xhci_check_request_fw(dev, id);
+	if (retval)
+		return retval;
+
+	return xhci_pci_common_probe(dev, id);
+}
+
+static const struct pci_device_id pci_ids[] =3D {
+	{ PCI_DEVICE(PCI_VENDOR_ID_RENESAS, 0x0014) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_RENESAS, 0x0015) },
+	{ /* end: all zeroes */ }
+};
+MODULE_DEVICE_TABLE(pci, pci_ids);
+
+static struct pci_driver xhci_renesas_pci_driver =3D {
+	.name =3D		"xhci-pci-renesas",
+	.id_table =3D	pci_ids,
+
+	.probe =3D	xhci_pci_renesas_probe,
+	.remove =3D	xhci_pci_remove,
+
+	.shutdown =3D 	usb_hcd_pci_shutdown,
+	.driver =3D {
+		.pm =3D pm_ptr(&usb_hcd_pci_pm_ops),
+	},
+};
+module_pci_driver(xhci_renesas_pci_driver);
+
+MODULE_DESCRIPTION("Renesas xHCI PCI Host Controller Driver");
+MODULE_FIRMWARE(RENESAS_FW_NAME);
+MODULE_IMPORT_NS(xhci);
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index dc1e345ab67e..b5705ed01d83 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -235,15 +235,6 @@ static int xhci_pci_reinit(struct xhci_hcd *xhci, stru=
ct pci_dev *pdev)
 static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 {
 	struct pci_dev                  *pdev =3D to_pci_dev(dev);
-	struct xhci_driver_data         *driver_data;
-	const struct pci_device_id      *id;
-
-	id =3D pci_match_id(to_pci_driver(pdev->dev.driver)->id_table, pdev);
-
-	if (id && id->driver_data) {
-		driver_data =3D (struct xhci_driver_data *)id->driver_data;
-		xhci->quirks |=3D driver_data->quirks;
-	}
=20
 	/* Look for vendor-specific quirks */
 	if (pdev->vendor =3D=3D PCI_VENDOR_ID_FRESCO_LOGIC &&
@@ -572,21 +563,13 @@ static int xhci_pci_update_hub_device(struct usb_hcd =
*hcd, struct usb_device *hd
  * We need to register our own PCI probe function (instead of the USB core=
's
  * function) in order to create a second roothub under xHCI.
  */
-static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id =
*id)
+int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id =
*id)
 {
 	int retval;
 	struct xhci_hcd *xhci;
 	struct usb_hcd *hcd;
-	struct xhci_driver_data *driver_data;
 	struct reset_control *reset;
=20
-	driver_data =3D (struct xhci_driver_data *)id->driver_data;
-	if (driver_data && driver_data->quirks & XHCI_RENESAS_FW_QUIRK) {
-		retval =3D renesas_xhci_check_request_fw(dev, id);
-		if (retval)
-			return retval;
-	}
-
 	reset =3D devm_reset_control_get_optional_exclusive(&dev->dev, NULL);
 	if (IS_ERR(reset))
 		return PTR_ERR(reset);
@@ -651,8 +634,24 @@ static int xhci_pci_probe(struct pci_dev *dev, const s=
truct pci_device_id *id)
 	pm_runtime_put_noidle(&dev->dev);
 	return retval;
 }
+EXPORT_SYMBOL_NS_GPL(xhci_pci_common_probe, xhci);
+
+static const struct pci_device_id pci_ids_reject[] =3D {
+	/* handled by xhci-pci-renesas */
+	{ PCI_DEVICE(PCI_VENDOR_ID_RENESAS, 0x0014) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_RENESAS, 0x0015) },
+	{ /* end: all zeroes */ }
+};
+
+static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id =
*id)
+{
+	if (pci_match_id(pci_ids_reject, dev))
+		return -ENODEV;
+
+	return xhci_pci_common_probe(dev, id);
+}
=20
-static void xhci_pci_remove(struct pci_dev *dev)
+void xhci_pci_remove(struct pci_dev *dev)
 {
 	struct xhci_hcd *xhci;
=20
@@ -675,6 +674,7 @@ static void xhci_pci_remove(struct pci_dev *dev)
=20
 	usb_hcd_pci_remove(dev);
 }
+EXPORT_SYMBOL_NS_GPL(xhci_pci_remove, xhci);
=20
 /*
  * In some Intel xHCI controllers, in order to get D3 working,
@@ -882,19 +882,8 @@ static void xhci_pci_shutdown(struct usb_hcd *hcd)
=20
 /*------------------------------------------------------------------------=
-*/
=20
-static const struct xhci_driver_data reneses_data =3D {
-	.quirks  =3D XHCI_RENESAS_FW_QUIRK,
-	.firmware =3D "renesas_usb_fw.mem",
-};
-
 /* PCI driver selection metadata; PCI hotplugging uses this */
 static const struct pci_device_id pci_ids[] =3D {
-	{ PCI_DEVICE(PCI_VENDOR_ID_RENESAS, 0x0014),
-		.driver_data =3D  (unsigned long)&reneses_data,
-	},
-	{ PCI_DEVICE(PCI_VENDOR_ID_RENESAS, 0x0015),
-		.driver_data =3D  (unsigned long)&reneses_data,
-	},
 	/* handle any USB 3.0 xHCI controller */
 	{ PCI_DEVICE_CLASS(PCI_CLASS_SERIAL_USB_XHCI, ~0),
 	},
@@ -902,14 +891,6 @@ static const struct pci_device_id pci_ids[] =3D {
 };
 MODULE_DEVICE_TABLE(pci, pci_ids);
=20
-/*
- * Without CONFIG_USB_XHCI_PCI_RENESAS renesas_xhci_check_request_fw() won=
't
- * load firmware, so don't encumber the xhci-pci driver with it.
- */
-#if IS_ENABLED(CONFIG_USB_XHCI_PCI_RENESAS)
-MODULE_FIRMWARE("renesas_usb_fw.mem");
-#endif
-
 /* pci driver glue; this is a "new style" PCI driver module */
 static struct pci_driver xhci_pci_driver =3D {
 	.name =3D		hcd_name,
diff --git a/drivers/usb/host/xhci-pci.h b/drivers/usb/host/xhci-pci.h
index cb9a8f331a44..e87c7d9d76b8 100644
--- a/drivers/usb/host/xhci-pci.h
+++ b/drivers/usb/host/xhci-pci.h
@@ -4,22 +4,7 @@
 #ifndef XHCI_PCI_H
 #define XHCI_PCI_H
=20
-#if IS_ENABLED(CONFIG_USB_XHCI_PCI_RENESAS)
-int renesas_xhci_check_request_fw(struct pci_dev *dev,
-				  const struct pci_device_id *id);
-
-#else
-static int renesas_xhci_check_request_fw(struct pci_dev *dev,
-					 const struct pci_device_id *id)
-{
-	return 0;
-}
-
-#endif
-
-struct xhci_driver_data {
-	u64 quirks;
-	const char *firmware;
-};
+int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id =
*id);
+void xhci_pci_remove(struct pci_dev *dev);
=20
 #endif
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index ebd0afd59a60..df2c81db21a1 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1616,7 +1616,7 @@ struct xhci_hcd {
 #define XHCI_DEFAULT_PM_RUNTIME_ALLOW	BIT_ULL(33)
 #define XHCI_RESET_PLL_ON_DISCONNECT	BIT_ULL(34)
 #define XHCI_SNPS_BROKEN_SUSPEND    BIT_ULL(35)
-#define XHCI_RENESAS_FW_QUIRK	BIT_ULL(36)
+/* Reserved. It was XHCI_RENESAS_FW_QUIRK */
 #define XHCI_SKIP_PHY_INIT	BIT_ULL(37)
 #define XHCI_DISABLE_SPARSE	BIT_ULL(38)
 #define XHCI_SG_TRB_CACHE_SIZE_QUIRK	BIT_ULL(39)

--aRQaP/QeofET2AnD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAmaqn1gACgkQ57/I7JWG
EQnBKQ/6Ajp57aH7kKfR0lJH8iymDLyjJeiD8AiRZScr0CBJ1NXMgxKoQfdSI/Na
NnVSz+7Htqj7SWyGAc9uQkA+ew84zVJM/mtnY6x4JCAqcJrSeePZpNcQ3j6lpq1j
cJ45v6Cuj+5OAV/5Vd0nlSAVOhB3O3KImya7Ron2i1wPdjiGjWoTW0dke9ntHBm/
514PQpBLjykWnGsNDt+Q234nEDF4vbRtycMliXCaqGRU6xd903UkRhxSdkGrw7N3
xHnz7pKRMyImwCEs6asVjVMy1E9m5nkS1ujOd4tNUKKc7lH7t0O/+1I8jhh4lLCS
fIBWjVhpVGRWKNc8cqn7Gais3X8n5py5kS31bFEaOZPt2lOMp2O0DZsrOd+28A6u
H/Lo1UD5acxvN7iF1eOeOtfvzBPKy85GUPSOpKwozFMpCk7eCWBltfGcmikhqERK
Rzc3sVqljLEYdqWWDzYvsgdW4qNqDgLsbtyeEXYpOWz4x8IdwT68Mah0yAiEKVrq
9V9R1q6MMP59kqisIMSfM5EJotWmIA20vDDegwpBXzSx4/elNR644f8Yy0rWNMa7
ER00KjvSsKuw/dei4+7isEMyOFKeOHLwoXPMap/MnqTmDGKiFRXsPHA3yb+YNtmD
jxwCrNWeZ1nZc9efnoSL101DMBj3KqXYbQPCp+MoYPDCGs9iRdY=
=UaMk
-----END PGP SIGNATURE-----

--aRQaP/QeofET2AnD--


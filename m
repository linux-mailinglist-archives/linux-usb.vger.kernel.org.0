Return-Path: <linux-usb+bounces-35475-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGs2LCOJxGnB0AQAu9opvQ
	(envelope-from <linux-usb+bounces-35475-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 02:17:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDA832DC98
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 02:17:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E37CA302C31E
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 01:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FBE3126B4;
	Thu, 26 Mar 2026 01:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/odJqfM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DF018D636
	for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 01:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774487837; cv=none; b=R3o75qfvjjjwDn9M0ZK/hflKSiaf3QezqZWxpnbmQ56cUAnroYL/aFOWpvb53qSCZJ8zgko5LhnMMzu3DfZ2cFiDPGlA4MB9DAVnVEFGReblJ+F+7U2wXw+NbvHyMDw5m39jgUMtBE/fGPeOvCajKXea3KLazjUDvPicJr9tXHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774487837; c=relaxed/simple;
	bh=FqOlEAwOfCbP23aG6bMYtRghAfx1YBK01HwsP1a1RWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BBHscdCag5crL/NqkSoJn5EGXlrdXSiE2n98uCNKRxYDg8P86lPVKrH/MNbOCTCZgIIjlDTD7p/oNK2OxAW6ZZqpT6MPsMdFKvcB584xdWRJlS7OA9IyqbyLROz/k5A76G3zlvTjjIniwdLEDVdnW/ayARTcM8gxHWa0ev5cCLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/odJqfM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486fb439299so4041705e9.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 18:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774487835; x=1775092635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=tmwvz4ZJv9HEj3L/hWGz1xzYb0Wd5vrxJOQo6Gk1qm4=;
        b=m/odJqfM39kZbkPwYqeVJlI7gUjv/PManZNjI5FzMUeGSMP4qz+zthNno6G0nsXWJS
         3VBUcYu9ZjD9CCk/XNYB8rAPQuyJUSmSppSV3k42id9IYMLVom2+NLQEF7udHjfNGgdv
         MPT4mTnbRvmlQFhU5/8uBKIKJWsO1nofZOweyFdrDjem62Tr6W9f1E3sTo0cuHluofMi
         NIhx7Y6Z+X8nrX4SsugUpHRiu6KKp0PX/u6y0Kv0SvgcoDrZxnyv/TL+vR686QE2y8b6
         3xEeSvwXx6MpQBQ5LITrTIiwutQEHc2K5WIQzOFn7NIVNW6AOv9vwY4sB01Tz3pEYBcQ
         qrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774487835; x=1775092635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmwvz4ZJv9HEj3L/hWGz1xzYb0Wd5vrxJOQo6Gk1qm4=;
        b=Si7fle6/EQL8jAxJuOJl2Joqt9H17l6BOVGKiRhZTddRuYXmF9rU3zRAUjiAYJeTuq
         dwXzQpIMYXNKOzZoSVBr+T+MltwhwSOLdmILa5igqvNLy7EyKaHlAvBVIPKDx94xOuDG
         YQ15Pq2yMVIL2gY3mP9yAMJigEFjUVJ0WNZEMKtFg/d/pCoKPCEOI+g0dHeIMrkCje8A
         4CyYn0PXAKsUyJTxuXZiu/fwWDhg6wlbjBukG4WShFEBN/1baWyU2+kMb3mP6SoOgZ0/
         AjMVvrANH7WNsjLiMueoQn+gr46RJZ/S00fA0RL6vJAjQ94TGcKxola4vsEkc0irKFNt
         iOzA==
X-Gm-Message-State: AOJu0YyLVLvqPHBNiGztS0ppmkspNsF3ytTfZMFQpD4AIIABkBE1Z29T
	QuCFxYKg09fsr9Meai5ExKCBPPlAIbCqJtnT3qD28ZdrohJ4G01dXRGA
X-Gm-Gg: ATEYQzzG/KVClUm91GuDMqtvBSSiftq4XLQKiGDjGAiYhFkX4T/HKU6ikBsyboip4fd
	FoATMXOZ2fTGxkVs7BCki9f4GpMyttFNes1zY3/y9NOp0vF/S+apH3iGADdqhlQy1fyt+AMQUF+
	MY0kPVgz7QQXv7Ew2l2UTPZy87+MJmuZcqFrqlSi6N4Up5mHJAzB+icsJplUdo6FSeX36LSf4g+
	HBCmzcj0XATE0V9dPz0JjbH/HCdvW3dZTwm40HjjudR8q2NQ5/3pREbOB4SgHn0LxCgJJ61z3Tw
	kLSPMKFevhAv8jSlsUVPIud79kwoZOew7Y42Cp6+9es2cPWTCPolyOkdTMqJCLJX2YAgQoRr/fj
	MkqU8qrCplyliJFNlflPTh6J8l/ahr/OAnSoL2kKP0VU8TDx7kyo/eELwG3oPl8laIlaclpbKPh
	cfe2p1Xw==
X-Received: by 2002:a05:600c:3b12:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-48715fc3677mr84780155e9.5.1774487834167;
        Wed, 25 Mar 2026 18:17:14 -0700 (PDT)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871fbd2a9fsm5664235e9.12.2026.03.25.18.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:17:13 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Kuen-Han Tsai <khtsai@google.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Chenyuan Yang <chenyuan0y@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] USB: hub: call ACPI _PRR reset during port power-cycle on enumeration failure
Date: Thu, 26 Mar 2026 09:17:08 +0800
Message-ID: <20260326011708.1128840-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.34 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),reject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35475-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,linux.intel.com,rowland.harvard.edu,google.com,kernel.org,canonical.com,linux.dev,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acelan.kao@canonical.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1FDA832DC98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some USB-connected devices (e.g. MT7925 Bluetooth on Dell laptops) expose
their hardware reset line via an ACPI Power Resource for Reset (_PRR)
rather than relying solely on VBUS cycling for recovery.  When the reset
GPIO gets stuck low the device stops responding on USB; a VBUS power-cycle
alone cannot recover it because the chip remains in reset regardless of
VBUS state.

Add usb_acpi_port_prr_reset() in usb-acpi.c that, given a hub device and
one-based port number, looks up the port's ACPI companion handle, evaluates
_PRR to obtain the power-resource reference, and then calls _RST on that
reference to toggle the reset line.  The function is a no-op if the port
has no ACPI handle or no _PRR method, so it is safe to call unconditionally
for every port.

Wire it into hub_port_connect() during the mid-retry VBUS power-cycle
(at (PORT_INIT_TRIES-1)/2 iterations), calling usb_acpi_port_prr_reset()
*after* VBUS goes off and *before* VBUS comes back on.  The ordering is
critical: on the tested hardware the ACPI _RST method (MBTR._RST) drives
BT_RST low for 200 ms then high again.  If _RST is called after VBUS is
already restored the GPIO pulse races with device enumeration starting on
the live bus; the device begins asserting USB signals while still held in
reset and enumeration fails.  Performing the reset while the port is
de-powered ensures the GPIO pulse completes fully before the device is
given power and time to initialise.

After VBUS is restored, add an msleep(100) conditional on _PRR._RST having
succeeded.  USB 2.0 spec §7.1.7.3 (Fig. 7-29) mandates a minimum of 100 ms
between VBUS power-on and the first reset signalling for power settling.
On root hubs, hub_power_on_good_delay() returns bPwrOn2PwrGood * 2 with
no minimum floor; on the tested xHCI root hub bPwrOn2PwrGood = 10, yielding
only 20 ms — well below the spec minimum.  (External hubs already enforce
a 100 ms minimum via hub_power_on_good_delay().)  When _PRR._RST has been
exercised the device must also complete its full power-on sequence (GPIO
de-assertion, internal oscillator start, firmware load) before USB
enumeration begins.  The 100 ms sleep enforces the spec minimum and gives
the device adequate settling time.

Tested on a Dell laptop with MT7925 Bluetooth (idVendor=0489,
idProduct=e139) whose BT_RST GPIO was stuck low.  With this fix the
device recovers autonomously at boot without requiring a G3
(mechanical power-off) cycle.  The relevant dmesg sequence:

  [    1.448491] usb 3-10: new high-speed USB device number 4 using xhci_hcd
  [    6.813942] usb 3-10: device descriptor read/64, error -110
  [   22.685978] usb 3-10: device descriptor read/64, error -110
  [   22.901715] usb 3-10: new high-speed USB device number 5 using xhci_hcd
  [   28.317963] usb 3-10: device descriptor read/64, error -110
  [   44.189949] usb 3-10: device descriptor read/64, error -110
  [   44.294065] usb usb3-port10: attempt power cycle
  [   44.872709] usb 3-10: new high-speed USB device number 6 using xhci_hcd
  [   44.888293] usb 3-10: New USB device found, idVendor=0489, idProduct=e139, bcdDevice= 1.00
  [   44.888318] usb 3-10: Manufacturer: MediaTek Inc.

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/usb/core/hub.c      | 14 ++++++++
 drivers/usb/core/usb-acpi.c | 68 +++++++++++++++++++++++++++++++++++++
 drivers/usb/core/usb.h      |  3 ++
 3 files changed, 85 insertions(+)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 24960ba9caa91..1740e96f73cc6 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -5603,11 +5603,25 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 
 		/* When halfway through our retry count, power-cycle the port */
 		if (i == (PORT_INIT_TRIES - 1) / 2) {
+			int prr_reset;
+
 			dev_info(&port_dev->dev, "attempt power cycle\n");
 			usb_hub_set_port_power(hdev, hub, port1, false);
 			msleep(2 * hub_power_on_good_delay(hub));
+			prr_reset = usb_acpi_port_prr_reset(hdev, port1);
 			usb_hub_set_port_power(hdev, hub, port1, true);
 			msleep(hub_power_on_good_delay(hub));
+			/*
+			 * USB 2.0 spec §7.1.7.3 requires at least 100 ms
+			 * between VBUS power-on and the first reset for power
+			 * settling.  hub_power_on_good_delay() on an xHCI root
+			 * hub returns bPwrOn2PwrGood * 2 with no minimum floor,
+			 * which can be as little as 20 ms.  When _PRR _RST was
+			 * also exercised the device must complete its power-on
+			 * sequence before enumeration; enforce the spec minimum.
+			 */
+			if (prr_reset == 0)
+				msleep(100);
 		}
 	}
 	if (hub->hdev->parent ||
diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index 489dbdc96f94a..ee62e3fd8e3a1 100644
--- a/drivers/usb/core/usb-acpi.c
+++ b/drivers/usb/core/usb-acpi.c
@@ -142,6 +142,74 @@ int usb_acpi_set_power_state(struct usb_device *hdev, int index, bool enable)
 }
 EXPORT_SYMBOL_GPL(usb_acpi_set_power_state);
 
+/**
+ * usb_acpi_port_prr_reset - issue an ACPI _PRR reset on a hub port
+ * @hdev: USB device belonging to the usb hub
+ * @port1: port number (one-based)
+ *
+ * Some devices expose their hardware reset line via an ACPI Power Resource for
+ * Reset (_PRR).  When such a device fails to enumerate (e.g. because the reset
+ * GPIO is stuck low), the USB power-cycle alone is not enough; the firmware
+ * reset path must also be exercised.
+ *
+ * This function evaluates _PRR on the port's ACPI companion to obtain the
+ * power-resource reference and then calls _RST on that resource to toggle the
+ * reset line.  It is intended to be called alongside the mid-retry VBUS
+ * power-cycle already performed by hub_port_connect().
+ *
+ * Returns 0 on success, -ENODEV if the port has no ACPI handle or no _PRR
+ * method, or a negative error code on failure.
+ */
+int usb_acpi_port_prr_reset(struct usb_device *hdev, int port1)
+{
+	acpi_handle port_handle;
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *pkg, *ref;
+	acpi_status status;
+	int ret = 0;
+
+	port_handle = usb_get_hub_port_acpi_handle(hdev, port1);
+	if (!port_handle)
+		return -ENODEV;
+
+	if (!acpi_has_method(port_handle, "_PRR"))
+		return -ENODEV;
+
+	status = acpi_evaluate_object(port_handle, "_PRR", NULL, &buffer);
+	if (ACPI_FAILURE(status)) {
+		dev_dbg(&hdev->dev, "port%d: _PRR evaluation failed: %s\n",
+			port1, acpi_format_exception(status));
+		return -ENODEV;
+	}
+
+	pkg = buffer.pointer;
+	if (!pkg || pkg->type != ACPI_TYPE_PACKAGE || pkg->package.count < 1) {
+		dev_dbg(&hdev->dev, "port%d: _PRR returned unexpected object\n",
+			port1);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	ref = &pkg->package.elements[0];
+	if (ref->type != ACPI_TYPE_LOCAL_REFERENCE || !ref->reference.handle) {
+		dev_dbg(&hdev->dev, "port%d: _PRR element is not a reference\n",
+			port1);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	status = acpi_evaluate_object(ref->reference.handle, "_RST", NULL, NULL);
+	if (ACPI_FAILURE(status)) {
+		dev_dbg(&hdev->dev, "port%d: _RST evaluation failed: %s\n",
+			port1, acpi_format_exception(status));
+		ret = -EIO;
+	}
+
+out:
+	kfree(buffer.pointer);
+	return ret;
+}
+
 /**
  * usb_acpi_add_usb4_devlink - add device link to USB4 Host Interface for tunneled USB3 devices
  *
diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
index a9b37aeb515be..4d3dc3bd881b2 100644
--- a/drivers/usb/core/usb.h
+++ b/drivers/usb/core/usb.h
@@ -211,7 +211,10 @@ extern int usb_acpi_register(void);
 extern void usb_acpi_unregister(void);
 extern acpi_handle usb_get_hub_port_acpi_handle(struct usb_device *hdev,
 	int port1);
+extern int usb_acpi_port_prr_reset(struct usb_device *hdev, int port1);
 #else
 static inline int usb_acpi_register(void) { return 0; };
 static inline void usb_acpi_unregister(void) { };
+static inline int usb_acpi_port_prr_reset(struct usb_device *hdev,
+					  int port1) { return -ENODEV; }
 #endif
-- 
2.53.0



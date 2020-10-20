Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 827B82929F3
	for <lists+linux-usb@lfdr.de>; Mon, 19 Oct 2020 17:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729777AbgJSPCO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Oct 2020 11:02:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59923 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729630AbgJSPCO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Oct 2020 11:02:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603119732;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=/bD/dsuRX3EslrvrmHEv36rr2PbUndykLo6mgMx1F70=;
        b=eKeqa9MV1WGpVxgecCYOVzE3Y3345fB+9bW1ZdJgGNR5pHeRCsNuXeuTAndLPdfhGrTo0j
        eQ3LrRtgIajuwwSf+OIC0yq8tx1/zBICwZrMxcdK9wQhDocvR96WXj7zQAtOISa9nAU6YZ
        ITjh4pjlo4lg4Y9t5N71UUuKs02dYFk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-T8MrvGzeOkqcko_LKy13VQ-1; Mon, 19 Oct 2020 11:02:08 -0400
X-MC-Unique: T8MrvGzeOkqcko_LKy13VQ-1
Received: by mail-qk1-f200.google.com with SMTP id x5so7452615qkn.2
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2020 08:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/bD/dsuRX3EslrvrmHEv36rr2PbUndykLo6mgMx1F70=;
        b=kHPYhF5ENcwlFjc6NZS7IPckQtoOgDJUeKksx+up2ZV3dhbf1usfs2dqVuhH2znN9F
         /KSIH33f8+JKV6Tk+eq5iv1lJNTmsro74lmjJDoD9K2vG7rBEPYD8ZWG7AZB7k+Kj1p7
         Eouv1J2I44Z3hLtJSe/0eQ2P50lD5gZ34YAvYCivJ/Gq3rE/WmrngMe6THXxyKDuRhZc
         8xqlHuHTW3tD1kgaJYpwgvJLK6DIZy60C4Qzp8HIPKaKonjmDD6mWOZfwGxUWJMd5u5i
         p9xPmvVjZDb+OE6g+n2UW20KEE9EX7wyqAHu5VWe4ek6EuV7JQ5KbY8aqWV0FgQcBqqZ
         24vQ==
X-Gm-Message-State: AOAM530b0LiOphFQcBR4+h7MOiTm3pg/phRy8wtJNWwjX3YSnRyEIR12
        nDl9Xcl3f5hu9d32t9NLU5yWa6pKwbrguT9EPtYZprV2bYNQFqtmiNPErEZxqwJWjjr+0jhgmRM
        lzhmdkVL6Yyc4uVW9REwZ
X-Received: by 2002:a37:9d0c:: with SMTP id g12mr2320545qke.264.1603119727783;
        Mon, 19 Oct 2020 08:02:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmZslZsML7DDFClBLZ1F0QGtTNX0LHkJmGJ1Ryu7guDUWqyKqaoGdJLEfFRje/3vEq7yiXFg==
X-Received: by 2002:a37:9d0c:: with SMTP id g12mr2320514qke.264.1603119727469;
        Mon, 19 Oct 2020 08:02:07 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id p1sm111874qkk.95.2020.10.19.08.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 08:02:06 -0700 (PDT)
From:   trix@redhat.com
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        mathias.nyman@intel.com, johan@kernel.org,
        stern@rowland.harvard.edu, gustavoars@kernel.org,
        viro@zeniv.linux.org.uk, lee.jones@linaro.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net, Tom Rix <trix@redhat.com>
Subject: [PATCH] usb: remove unneeded break
Date:   Mon, 19 Oct 2020 08:02:02 -0700
Message-Id: <20201019150202.19713-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Tom Rix <trix@redhat.com>

A break is not needed if it is preceded by a return or goto

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/usb/gadget/function/f_hid.c | 9 ---------
 drivers/usb/host/xhci-mem.c         | 1 -
 drivers/usb/misc/iowarrior.c        | 3 ---
 drivers/usb/serial/iuu_phoenix.c    | 2 --
 drivers/usb/storage/freecom.c       | 1 -
 5 files changed, 16 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 1125f4715830..5204769834d1 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -511,9 +511,7 @@ static int hidg_setup(struct usb_function *f,
 		/* send an empty report */
 		length = min_t(unsigned, length, hidg->report_length);
 		memset(req->buf, 0x0, length);
-
 		goto respond;
-		break;
 
 	case ((USB_DIR_IN | USB_TYPE_CLASS | USB_RECIP_INTERFACE) << 8
 		  | HID_REQ_GET_PROTOCOL):
@@ -521,13 +519,11 @@ static int hidg_setup(struct usb_function *f,
 		length = min_t(unsigned int, length, 1);
 		((u8 *) req->buf)[0] = hidg->protocol;
 		goto respond;
-		break;
 
 	case ((USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_INTERFACE) << 8
 		  | HID_REQ_SET_REPORT):
 		VDBG(cdev, "set_report | wLength=%d\n", ctrl->wLength);
 		goto stall;
-		break;
 
 	case ((USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_INTERFACE) << 8
 		  | HID_REQ_SET_PROTOCOL):
@@ -544,7 +540,6 @@ static int hidg_setup(struct usb_function *f,
 			goto respond;
 		}
 		goto stall;
-		break;
 
 	case ((USB_DIR_IN | USB_TYPE_STANDARD | USB_RECIP_INTERFACE) << 8
 		  | USB_REQ_GET_DESCRIPTOR):
@@ -562,7 +557,6 @@ static int hidg_setup(struct usb_function *f,
 						   hidg_desc_copy.bLength);
 			memcpy(req->buf, &hidg_desc_copy, length);
 			goto respond;
-			break;
 		}
 		case HID_DT_REPORT:
 			VDBG(cdev, "USB_REQ_GET_DESCRIPTOR: REPORT\n");
@@ -570,13 +564,11 @@ static int hidg_setup(struct usb_function *f,
 						   hidg->report_desc_length);
 			memcpy(req->buf, hidg->report_desc, length);
 			goto respond;
-			break;
 
 		default:
 			VDBG(cdev, "Unknown descriptor request 0x%x\n",
 				 value >> 8);
 			goto stall;
-			break;
 		}
 		break;
 
@@ -584,7 +576,6 @@ static int hidg_setup(struct usb_function *f,
 		VDBG(cdev, "Unknown request 0x%x\n",
 			 ctrl->bRequest);
 		goto stall;
-		break;
 	}
 
 stall:
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index fe405cd38dbc..b46ef45c4d25 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1144,7 +1144,6 @@ int xhci_setup_addressable_virt_dev(struct xhci_hcd *xhci, struct usb_device *ud
 	case USB_SPEED_WIRELESS:
 		xhci_dbg(xhci, "FIXME xHCI doesn't support wireless speeds\n");
 		return -EINVAL;
-		break;
 	default:
 		/* Speed was set earlier, this shouldn't happen. */
 		return -EINVAL;
diff --git a/drivers/usb/misc/iowarrior.c b/drivers/usb/misc/iowarrior.c
index 70ec29681526..efbd317f2f25 100644
--- a/drivers/usb/misc/iowarrior.c
+++ b/drivers/usb/misc/iowarrior.c
@@ -384,7 +384,6 @@ static ssize_t iowarrior_write(struct file *file,
 		retval = usb_set_report(dev->interface, 2, 0, buf, count);
 		kfree(buf);
 		goto exit;
-		break;
 	case USB_DEVICE_ID_CODEMERCS_IOW56:
 	case USB_DEVICE_ID_CODEMERCS_IOW56AM:
 	case USB_DEVICE_ID_CODEMERCS_IOW28:
@@ -454,14 +453,12 @@ static ssize_t iowarrior_write(struct file *file,
 		retval = count;
 		usb_free_urb(int_out_urb);
 		goto exit;
-		break;
 	default:
 		/* what do we have here ? An unsupported Product-ID ? */
 		dev_err(&dev->interface->dev, "%s - not supported for product=0x%x\n",
 			__func__, dev->product_id);
 		retval = -EFAULT;
 		goto exit;
-		break;
 	}
 error:
 	usb_free_coherent(dev->udev, dev->report_size, buf,
diff --git a/drivers/usb/serial/iuu_phoenix.c b/drivers/usb/serial/iuu_phoenix.c
index b4ba79123d9d..f1201d4de297 100644
--- a/drivers/usb/serial/iuu_phoenix.c
+++ b/drivers/usb/serial/iuu_phoenix.c
@@ -850,7 +850,6 @@ static int iuu_uart_baud(struct usb_serial_port *port, u32 baud_base,
 	default:
 		kfree(dataout);
 		return IUU_INVALID_PARAMETER;
-		break;
 	}
 
 	switch (parity & 0xF0) {
@@ -864,7 +863,6 @@ static int iuu_uart_baud(struct usb_serial_port *port, u32 baud_base,
 	default:
 		kfree(dataout);
 		return IUU_INVALID_PARAMETER;
-		break;
 	}
 
 	status = bulk_immediate(port, dataout, DataCount);
diff --git a/drivers/usb/storage/freecom.c b/drivers/usb/storage/freecom.c
index 3d5f7d0ff0f1..2b098b55c4cb 100644
--- a/drivers/usb/storage/freecom.c
+++ b/drivers/usb/storage/freecom.c
@@ -431,7 +431,6 @@ static int freecom_transport(struct scsi_cmnd *srb, struct us_data *us)
 			     us->srb->sc_data_direction);
 		/* Return fail, SCSI seems to handle this better. */
 		return USB_STOR_TRANSPORT_FAILED;
-		break;
 	}
 
 	return USB_STOR_TRANSPORT_GOOD;
-- 
2.18.1


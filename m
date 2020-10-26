Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDCA6299728
	for <lists+linux-usb@lfdr.de>; Mon, 26 Oct 2020 20:39:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1786281AbgJZTjx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Oct 2020 15:39:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47674 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1786141AbgJZTjw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Oct 2020 15:39:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603741191;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=lCWigmNkQYdFYX02ynyqvoR8Vn8yvpoh4XRQOBQT06E=;
        b=aG7bhzWdQ0t7DYabcFq0HhBegsbo9SIlVEmHpzKzzJgkHGZ1RL2jCKrJ8hS4SrM8bYb5FS
        Vf3t0JFnv0+NSZAPjgG7VO5G1hLcuoGghFp5i8YHjGieiSe1tUG6EF6aScb88IzKprEna1
        wE9idhKosV/j+QOcyYbavRDZ/f3bNws=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-Vza5GNftN1q10DYLudCWGw-1; Mon, 26 Oct 2020 15:39:49 -0400
X-MC-Unique: Vza5GNftN1q10DYLudCWGw-1
Received: by mail-ot1-f70.google.com with SMTP id i25so4021407otj.0
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2020 12:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lCWigmNkQYdFYX02ynyqvoR8Vn8yvpoh4XRQOBQT06E=;
        b=SjY6ZUJYSfFVw8WD75qrJWjuGDknqHPKbeZi2oy8PlzsRH2E/UG2kLWfFpEAyQ/BG1
         u8Hp7VZIP7bkrsnzCnoBtW2J369btopHieb/ZLkjHUbhQhZI4lL5GgcubsDwqQSxcWvk
         ieCdOXn0gf21okpuRpMTS1IFc0ec1VLZoX1s7MCZrCpJ2pvAZAqTUjjS1o59HkFVf6bQ
         2aQGVJHemHaK3AmNlO1PeNroQQUJuFfc3ozsjYUiKFIsgWt947cr1adG+oCixFh1dJdn
         GyCVhiB1PG3071/6C/95fQfK2lCUgRElC2phl9UqiTOKnVXKh7LA4aKZURjDsm0ulZG5
         9I7A==
X-Gm-Message-State: AOAM530bLYscWMp3X1yBVUgRQVcg4dYMHlbuA7xuR5HTTeceWLPP1KpV
        wqybqIdWHRpZzhebbvciqLjWqLuRqM7IVHZcT9VWMAuTKGyRQlmQu7dliAtoIPsuRoVRsglRANi
        c3v2F9EHesy7cdVO5yQ0R
X-Received: by 2002:a9d:2a88:: with SMTP id e8mr12231287otb.122.1603741188410;
        Mon, 26 Oct 2020 12:39:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsyhAyUP2n2wv1fWsYURWnBm/cPB7m0J6DqoavC6i6FD6IAtB7NM8dGRZmoMdpumanQCoxXA==
X-Received: by 2002:a9d:2a88:: with SMTP id e8mr12231270otb.122.1603741188215;
        Mon, 26 Oct 2020 12:39:48 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id t29sm4230509otd.51.2020.10.26.12.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 12:39:47 -0700 (PDT)
From:   trix@redhat.com
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        gustavoars@kernel.org, viro@zeniv.linux.org.uk
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH v2] usb: gadget: f_hid: remove unneeded break
Date:   Mon, 26 Oct 2020 12:39:33 -0700
Message-Id: <20201026193933.1434490-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Tom Rix <trix@redhat.com>

A break is not needed if it is preceded by a goto.

Signed-off-by: Tom Rix <trix@redhat.com>
---
v2: split from larger patch
---
 drivers/usb/gadget/function/f_hid.c | 9 ---------
 1 file changed, 9 deletions(-)

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
-- 
2.18.1


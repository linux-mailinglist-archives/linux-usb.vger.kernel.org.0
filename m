Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD621C083
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2019 04:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbfENCOv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 May 2019 22:14:51 -0400
Received: from mail-it1-f196.google.com ([209.85.166.196]:54837 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbfENCOv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 May 2019 22:14:51 -0400
Received: by mail-it1-f196.google.com with SMTP id a190so2415766ite.4
        for <linux-usb@vger.kernel.org>; Mon, 13 May 2019 19:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dropbox.com; s=corp;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=CaKRptNfw8G27WF6QPZx0KdR3QHsyfrwLs/NYqBCzoQ=;
        b=sXQYoLPexm2V/w3A7XstXTzxrfGuE3LYuIvDgT13WhzH6IFE41yJYjJG4y/jtfsLt+
         SJ3rSZ/VHP8733oLREFoDzzbeewGpiizcKBOQ17reGxFbIhuEvoQBTEqGu+3fBLSCL7Z
         FmkdVpdTLP1WYqm/vlbo853Ldf1RkfYyNlpSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=CaKRptNfw8G27WF6QPZx0KdR3QHsyfrwLs/NYqBCzoQ=;
        b=NTHI0lwP64PpAUZOXsgMlORbvovEgqwcKWGYnq+G0lL3YRuDlSDq+dDqHZOKEscqSK
         jFKj32qtLbQSW6D4vVAbUQB+dQrv2xXspbpVzcpoCq1vscDgLLZCmPXPCqhKxCiZR8tG
         ZJasExpGNnJp6aEslKYpuBhK1agoNHQoEyys0HkVoWTzrpXHeoaM1iAMUIU0+U6x16km
         XCh6SQUQXA2nkEtLOf8OG4NgFH8GaAbJw3G6L4DwFbSTYfAyXbstZRgm4VxAYlJTf5qd
         0YuqB+V+zu+I602j3+FpqkWU84e5kKcSinYbSphhvjfiGLeAa3hx1NLw8cMwOJodNl3i
         l+cw==
X-Gm-Message-State: APjAAAXnVD7r/8XzcJ+YPV5e5LKEyVjYqn+XXq6L6srVDpot/iNxge8Y
        Oy0c3Iwz7LNfJMaJiKDXwaJ+K/WF0Aw8oAKqQGvI0BGe35JD0w==
X-Google-Smtp-Source: APXvYqzallrGkTJ1flJIDHNh+tOPYhKJp6Pxz8Oo12jdO3CcfK8dVntISKdQzI9ZaeH5X7GKMtB/mGNiOoO/LpN6h6A=
X-Received: by 2002:a02:2b1d:: with SMTP id h29mr21078306jaa.76.1557800090014;
 Mon, 13 May 2019 19:14:50 -0700 (PDT)
MIME-Version: 1.0
From:   Rick Mark <rickmark@dropbox.com>
Date:   Mon, 13 May 2019 19:14:38 -0700
Message-ID: <CAEFJ+1OA+=SBRa_O3UupJT_KHm_XDw-4uJ9J3cRJQOW0T_c6aA@mail.gmail.com>
Subject: Lack of length checking in USB configuration may allow buffer overflow
To:     linux-usb@vger.kernel.org
Cc:     enterprise-infrasec-team <enterprise-infrasec-team@dropbox.com>,
        production-infrasec-team <production-infrasec-team@dropbox.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hey All,

I was seeing a linux VM crash due to malformed USB configuration
payloads being malformed.  I'm testing this patch now which should
provide better security checking (but this is my first patch so be
kind if I have things wrong.)

R

From d7b0dd52f3b3b38126504b17d2d9c9ceaa572edf Mon Sep 17 00:00:00 2001
From: Rick Mark <rickmark@outlook.com>
Date: Mon, 13 May 2019 19:06:46 -0700
Subject: [PATCH] Security checks in USB configurations

---
 drivers/usb/core/config.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 7b5cb28ff..8cb9a136e 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -33,6 +33,13 @@ static int find_next_descriptor(unsigned char
*buffer, int size,

  /* Find the next descriptor of type dt1 or dt2 */
  while (size > 0) {
+     if (size < sizeof(struct usb_descriptor_header)) {
+         printk( KERN_ERR "usb config: find_next_descriptor "
+                          "with size %d not sizeof("
+                          "struct usb_descriptor_header)", size );
+         break;
+     }
+
  h = (struct usb_descriptor_header *) buffer;
  if (h->bDescriptorType == dt1 || h->bDescriptorType == dt2)
  break;
@@ -58,6 +65,13 @@ static void
usb_parse_ssp_isoc_endpoint_companion(struct device *ddev,
  * The SuperSpeedPlus Isoc endpoint companion descriptor immediately
  * follows the SuperSpeed Endpoint Companion descriptor
  */
+ if (size < sizeof(struct usb_ssp_isoc_ep_comp_descriptor)) {
+        dev_warn(ddev, "Invalid size %d for SuperSpeedPlus isoc
endpoint companion"
+                       "for config %d interface %d altsetting %d ep %d.\n",
+                 size, cfgno, inum, asnum, ep->desc.bEndpointAddress);
+        return;
+ }
+
  desc = (struct usb_ssp_isoc_ep_comp_descriptor *) buffer;
  if (desc->bDescriptorType != USB_DT_SSP_ISOC_ENDPOINT_COMP ||
      size < USB_DT_SSP_ISOC_EP_COMP_SIZE) {
@@ -76,6 +90,14 @@ static void usb_parse_ss_endpoint_companion(struct
device *ddev, int cfgno,
  struct usb_ss_ep_comp_descriptor *desc;
  int max_tx;

+ if (size < sizeof(struct usb_ss_ep_comp_descriptor)) {
+        dev_warn(ddev, "Invalid size %d of SuperSpeed endpoint"
+                       " companion for config %d "
+                       " interface %d altsetting %d: "
+                       "using minimum values\n",
+                 size, cfgno, inum, asnum);
+        return;
+ }
  /* The SuperSpeed endpoint companion descriptor is supposed to
  * be the first thing immediately following the endpoint descriptor.
  */
@@ -103,6 +125,16 @@ static void
usb_parse_ss_endpoint_companion(struct device *ddev, int cfgno,
  ep->desc.wMaxPacketSize;
  return;
  }
+
+ if ((size - desc->bLength) < 0 ||
+     size < USB_DT_SS_EP_COMP_SIZE) {
+        dev_warn(ddev, "Control endpoint with bMaxBurst = %d in "
+                       "config %d interface %d altsetting %d ep %d: "
+                       "has invalid bLength %d vs size %d\n", desc->bMaxBurst,
+                 cfgno, inum, asnum, ep->desc.bEndpointAddress,
desc->bLength, size);
+        return;
+ }
+
  buffer += desc->bLength;
  size -= desc->bLength;
  memcpy(&ep->ss_ep_comp, desc, USB_DT_SS_EP_COMP_SIZE);
@@ -214,7 +246,24 @@ static int usb_parse_endpoint(struct device
*ddev, int cfgno, int inum,
  unsigned int maxp;
  const unsigned short *maxpacket_maxes;

+ if (size < sizeof(struct usb_endpoint_descriptor)) {
+        dev_warn(ddev, "config %d interface %d altsetting %d has an "
+                       "size %d smaller then endpoint descriptor, skipping\n",
+                 cfgno, inum, asnum, size);
+
+        return -EINVAL;
+ }
+
  d = (struct usb_endpoint_descriptor *) buffer;
+
+ if ((size - d->bLength) < 0) {
+        dev_warn(ddev, "config %d interface %d altsetting %d has an "
+                       "invalid endpoint descriptor of length %d, skipping\n",
+                 cfgno, inum, asnum, d->bLength);
+
+        return -EINVAL;
+ }
+
  buffer += d->bLength;
  size -= d->bLength;

@@ -446,7 +495,18 @@ static int usb_parse_interface(struct device
*ddev, int cfgno,
  int len, retval;
  int num_ep, num_ep_orig;

+ if (size < sizeof(struct usb_interface_descriptor)) {
+        dev_err(ddev, "config %d interface %d has an "
+                       "invalid endpoint descriptor of length %d, skipping\n",
+                 cfgno, inum, size);
+    }
  d = (struct usb_interface_descriptor *) buffer;
+
+ if ((size - d->bLength) < 0) {
+        dev_err(ddev, "config %d interface %d has an "
+                       "invalid endpoint descriptor of length %d, skipping\n",
+                 cfgno, inum, d->bLength);
+ }
  buffer += d->bLength;
  size -= d->bLength;

@@ -514,6 +574,13 @@ static int usb_parse_interface(struct device
*ddev, int cfgno,
  /* Parse all the endpoint descriptors */
  n = 0;
  while (size > 0) {
+     if (size < sizeof(struct usb_descriptor_header)) {
+            dev_err(ddev, "config %d interface %d has an "
+                           "invalid endpoint descriptor of length %d,
skipping\n",
+                     cfgno, inum, size);
+            return -EINVAL;
+     }
+
  if (((struct usb_descriptor_header *) buffer)->bDescriptorType
       == USB_DT_INTERFACE)
  break;
-- 
2.11.0

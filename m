Return-Path: <linux-usb+bounces-24347-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD14AC5FB2
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 04:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 542357A91CA
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 02:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40BAD19D071;
	Wed, 28 May 2025 02:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lP3DPm00"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1805C28E0F
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 02:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748400743; cv=none; b=Oup0ugUgga9a2g0soawXFP6wCcFWpMbnzDJ2WMWcj31IsCackMp05amlHnJYggZocSlsA7s91ArDhXgqj41GbczRooJOkdQlxhgW1fDOr4ewtRRd6mn2fVCiYTxbgWJjiOYVyq5fr5TIcBohbat4rxsp71S/Z02VmC30kqz+GSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748400743; c=relaxed/simple;
	bh=Lmgy7MqGrCLBP46G6gw23g7U95PebNNozAWuuAbDHB8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Fy94PtZOYFwt6KnLNnAU1qxYpM6eJs+JndWLanVJGPiW9hkZ/6MX1mYdwAs3eIBRCcgWHfIy+gNDUGz1JSoeMpJkoYwTdwPD0TuEnDlk+ROpqDeVrWOj6OK0+srbC9PUBBvvvqWpZ4IyA35P30dpWzrRsq2WSxb/UF9K+oEG5xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lP3DPm00; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-602b5b4c125so823289a12.3
        for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 19:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748400740; x=1749005540; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=scq/nYJh7SI3oVPlVc81MgirDlyIQ0ruJNBhj8Bs00s=;
        b=lP3DPm00+6Kbh3xIowOMX8YgMtIQXoG5wtKrKAoNosvA3zHD0qmSfKP+sirBItWFV4
         xlLQqlctzFC/rpWH5zr/4DhxrKbDq1odX+TbADrqzXJEavl3Wi3Kf01mGj+Vc+xB83eS
         lHWqTogOmikgDqnF8309jkfNi10bMFSBZbgUtnG/yovkvBFgAXis5kK1a/qvg74FPmeE
         t5CoMl/6Sv3M3wzW4gvniWuRyONX1kqA4rLgLrECCzSY3DNRts0IMt/wYAr5h9xKuZGh
         086TR1gu4A3iealNECZ+OqjCxKF4712Az4L6JpuDdtYqaosupCb8pPrXfrlzyBkLV0xO
         52MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748400740; x=1749005540;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=scq/nYJh7SI3oVPlVc81MgirDlyIQ0ruJNBhj8Bs00s=;
        b=FGlw7RDkh7RfNtIjHs0zNNqiPMEftdhNMJNGyo/Gyh72K8Eqf53eWeOO8KoBhPIB6d
         XCuCc+ncth8txG0wT/VR7GG0fa28yzKNj/LQ6frug0jfI6IXE7A6KTYCqr9L+WjOl49f
         RPsz3RoHy3HpYNwx4E5hQgbkpnQ0Y+S0GeCInmU2XyoeIzkY6BOKstUXS2o7SvMbONXh
         U8U43y+mj/eORNMouzqExqfaDUnXPm1z31M37pIBppRGR2arpEuzl0thOzsi9m77fsve
         mGi5ZyzelCEZH9wKB4VSUTgK+YtdugIpLKZ9Q7ZtF4pCn7mVe1HRkNt+VULViVYpi/4J
         f/Cg==
X-Gm-Message-State: AOJu0YystxHma6srIMDRuhJxVQqfqUfPpeFn3iEWOV0daIohhre5dt0q
	i2Ut3SW6PaZEuHSfeV3cl0PBoTkPWO+TARprdkznlqQGJVek/PHn1UCB7jqiYAN39cwr/I+hsmL
	aaUkZsgSUM3nvcoEzY7OPH8bBh1J0LEVnBku1u8w=
X-Gm-Gg: ASbGnctP2XpaYRW2RhqSnvuyO8Y7u4TwCvC6K4I54NYO9fa805tCgs9sIPIHJq6WKRt
	RzSiNYvgYfAorLB5lKq295Q5MErhtEp11CD0FtvZP92p3kNCbcD/z7HTcA11B9Ltm5nR91pplmJ
	8XzI9BaZ66Pvmi/2Qgfb7+/4+MNWlHbulM
X-Google-Smtp-Source: AGHT+IG2tovSV/thWBkzTRrbc36G8sGeo0eNhNLG+fbIV3MFtjKQxTkpojoKfc26MJ2o299noxLkwChKLgToT6Mr0GU=
X-Received: by 2002:a17:907:1df3:b0:ad8:8f5a:9d2b with SMTP id
 a640c23a62f3a-ad88f5a9df8mr129761266b.16.1748400739933; Tue, 27 May 2025
 19:52:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Josh Cabarrus <joshcabarrus@gmail.com>
Date: Tue, 27 May 2025 20:48:20 -0600
X-Gm-Features: AX0GCFtKbCY_Y1dFctlFWHvkIQ4hqKzQYKA_bi7EPXS6kHvQlCNWvadD1Fh9abU
Message-ID: <CAD=osaSH51vGF_zq2ArWY-6jCuG0LfMO5guSE9mgGpc-YPWOtw@mail.gmail.com>
Subject: g_webcam UVC gadget causes USB\DEVICE_DESCRIPTOR_FAILURE on Windows 11
To: linux-usb@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, balbi@kernel.org
Content-Type: text/plain; charset="UTF-8"

Bug Report: g_webcam UVC gadget incompatible with Windows 11 USB
descriptor validation

To: linux-usb@vger.kernel.org
CC: laurent.pinchart@ideasonboard.com, balbi@kernel.org
Subject: g_webcam UVC gadget causes USB\DEVICE_DESCRIPTOR_FAILURE on Windows 11

Summary

The g_webcam UVC gadget driver fails to enumerate properly on Windows
11, returning USB\DEVICE_DESCRIPTOR_FAILURE in Device Manager, while
other USB gadgets (g_serial, g_mass_storage) work correctly on the
same hardware and Windows version. This represents a regression in
Windows compatibility.

System Information

Hardware: Raspberry Pi Zero W Rev 1.1 (BCM2835, Revision: 9000c1)
Kernel: Linux 6.12.25+rpt-rpi-v6 #1 Raspbian (armv6l)
USB Controller: dwc2 20980000.usb
Host OS: Windows 11 (up to date)

Problem Description

When g_webcam is loaded and the Pi Zero W is connected to Windows 11 via USB:

g_webcam behavior:

Loads successfully on Pi: g_webcam ready, bound driver g_webcam
UDC state remains: not attached (never reaches configured)
Windows shows: Unknown USB Device (Device Descriptor Request Failed)
Hardware ID: USB\DEVICE_DESCRIPTOR_FAILURE

g_serial behavior (control test):

Loads successfully: g_serial ready, bound driver g_serial
UDC state becomes: configured
Windows properly recognizes as COM port device

Steps to Reproduce

bash

# On Raspberry Pi Zero W:
sudo modprobe g_webcam
cat /sys/class/udc/20980000.usb/state  # Shows: not attached

# Connect USB cable to Windows 11
# Result: "Unknown USB Device" in Device Manager

# Control test:
sudo rmmod g_webcam
sudo modprobe g_serial
cat /sys/class/udc/20980000.usb/state  # Shows: configured
# Result: Working COM port in Windows

Expected vs Actual Behavior

Expected: g_webcam should enumerate successfully on Windows 11 like
other gadgets and previous Windows versions.

Actual: Windows 11 rejects the USB device descriptors with
DEVICE_DESCRIPTOR_FAILURE.

Analysis

The issue appears to be Windows 11's stricter USB descriptor
validation. The g_webcam UVC descriptors may not fully comply with:

USB Video Class specification requirements
Windows 11's enhanced USB security validation
Microsoft's USB descriptor formatting standards

Loaded Modules

g_webcam               16384  0
usb_f_uvc              77824  5
uvc                    12288  1 usb_f_uvc
libcomposite           69632  17 usb_f_acm,usb_f_uvc,g_webcam
dwc2                  176128  0

Kernel Messages

g_webcam gadget.0: uvc: uvc_function_bind()
g_webcam gadget.0: Webcam Video Gadget
g_webcam gadget.0: g_webcam ready
dwc2 20980000.usb: bound driver g_webcam

Impact

This affects numerous Raspberry Pi Zero W webcam projects and
tutorials that previously worked with Windows. Users report this issue
across multiple Pi Zero W webcam implementations.

Suggested Investigation Areas

USB Descriptor Compliance: Review g_webcam's USB descriptors against
latest USB Video Class specification
Windows 11 Requirements: Compare descriptor format with Windows 11's
validation requirements
VID/PID Issues: Verify Vendor/Product ID configuration doesn't trigger
Windows driver conflicts
UVC Version Compatibility: Check if UVC version advertised matches
capabilities provided

Request

Could the maintainers investigate updating g_webcam's USB descriptors
to meet Windows 11's stricter validation requirements? The fact that
g_serial works but g_webcam fails suggests this is a
descriptor-specific issue rather than hardware or driver framework
problem.

Additional Information Available

I can provide:

USB protocol analyzer captures
Testing with different Windows versions
Comparison with working UVC implementations
Further diagnostic information as needed

Thank you for maintaining the USB gadget subsystem.

Reporter: Josh Cabarrus joshcabarrus@gmail.com
Date: May 27, 2025

P.S.  I used anthropic's claude.ai running Claude Sonnet 4 to
troubleshoot this issue.  I can upload the full conversation with all
troubleshooting steps if needed.


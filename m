Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 155DD132CA4
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2020 18:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728455AbgAGRK0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jan 2020 12:10:26 -0500
Received: from mail-il1-f181.google.com ([209.85.166.181]:35994 "EHLO
        mail-il1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728266AbgAGRKZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jan 2020 12:10:25 -0500
Received: by mail-il1-f181.google.com with SMTP id b15so220796iln.3
        for <linux-usb@vger.kernel.org>; Tue, 07 Jan 2020 09:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=fphYlhq33FNRFDANO53NpKUyj2srJpbxon8aXTAZWqw=;
        b=nieTZ3LFAzR8yu6Fo5T6CuvESmy/NqeEZqauar+I4Kk+VGrrCag6mB7C+Jc0iSgyJV
         NNVqXN/x7qYaOot/WJzyIRGfhd6g/fZoN5qicNDOpKU/VcZ6s4OlA1uAEC08DG1oqS6f
         wbSNjbgXBXLY63VwCLJXGfWBueR1+7nJ5vNCzKzZJgfGhvWswukO9wJ4k8dlA1/OjC+l
         vhxu2TpQPBAugc/fqXFPDS3yYuwdNf5N9MI2/iF5QKYm+BHF5T0zGhkKYl3szKoKF8g1
         z9V3hekfqYXY0uWbjoW36lH6WJ38lY6wi3UkPh9LyroFXp+mYAVRNGeWLakAWeqsMQdY
         LUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=fphYlhq33FNRFDANO53NpKUyj2srJpbxon8aXTAZWqw=;
        b=r081J50frOnFOe3+/qYCy8mVJFtuI0I7s3voj3+m0boLpYjQ0TvCEuxws8RM+1waTm
         yAyE3lPFY3LPtVbIP2Z+TcJwXFIN7pHLTVPpSePdTzXJegZpKSc1FueqlbGckQiVVKHJ
         DBzC9hlBmxZTR5A1Em25RZGunbZIiGFDpi5MD9SgCtQs7ZESCPa5U+Os4uE2NzdZey7U
         ehFhL3JSUpaUPvC2fnyMTNdCXZ/Xx2Pld1BExwoHByzn5WYtDJPaDa9VRhkQNtYJaZ/t
         LT0TdUiQFLCoOaDZZlO5OlSJMlYLD0OWGkcodIwjN7AS0vvm/nbPNwhSFUkyLlUXvZnt
         Ba6Q==
X-Gm-Message-State: APjAAAUE8KDvRzU0aiyjFJUykKt/KhgMIxrZAHrEqVGPu98XuMfYN2QF
        NvvYSVDnhBmDWjsV+lBzZnQfdfoffiXdJYkKIAE7uEwC
X-Google-Smtp-Source: APXvYqy4P4Qsc8bkK0GmsA7KFtWz7svwyXMpJ+2j+3MCG3qRP4YnqDxxzpqdwZy2eQM11LMWuH4owhRhNTg+LBC/mMw=
X-Received: by 2002:a92:bb08:: with SMTP id w8mr69662ili.27.1578417024910;
 Tue, 07 Jan 2020 09:10:24 -0800 (PST)
MIME-Version: 1.0
From:   =?UTF-8?Q?Tomasz_Mo=C5=84?= <desowin@gmail.com>
Date:   Tue, 7 Jan 2020 18:10:13 +0100
Message-ID: <CAOHtt39wC1RzRWPi2hb6vS7EZWoVxGGHqeten=3a6M-jYGWkcA@mail.gmail.com>
Subject: Use of address 0 in usbmon
To:     linux-usb@vger.kernel.org
Cc:     Pete Zaitcev <zaitcev@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

Linux kernel allows submitting URBs directed at Root Hub. These
include, but are not limited to, the hub port control requests
(CLEAR_FEATURE, GET_STATUS). While it works fine and simplifies the
code, such requests gets reported by usbmon as directed to device
address 0, which is not quite true.

The device address 0 is assigned to device after reset. When capturing
(in hardware) on the USB bus, there are only two requests sent to
address 0:
  * GET DESCRIPTOR
  * SET ADDRESS

The genuine "address 0" requests can be differentiated from the "Root
Hub" requests in usbmon by checking if is_root_hub(urb->dev) is true.
Unfortunately, this information is not available to user-space and
thus the tools like Wireshark cannot mark the URBs as directed to Root
Hub.

Would it be possible to modify the usbmon format, so the
is_root_hub(urb->dev) flag would be somehow available to the
user-space tools?

Best Regards,
Tomasz Mo=C5=84

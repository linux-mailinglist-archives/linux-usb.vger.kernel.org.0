Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 956D415481B
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2020 16:30:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727479AbgBFPaz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Feb 2020 10:30:55 -0500
Received: from mail-pf1-f176.google.com ([209.85.210.176]:37207 "EHLO
        mail-pf1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbgBFPaz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Feb 2020 10:30:55 -0500
Received: by mail-pf1-f176.google.com with SMTP id p14so3299478pfn.4
        for <linux-usb@vger.kernel.org>; Thu, 06 Feb 2020 07:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=hZWWHvxiAS6rVI2lFepgRgRLUiTWelvEzHdakGPqFzQ=;
        b=NlbW08BWOEHpvJXTCTyJYyLK60cFKEB/ZFlNxzGvVPKHt8Q5g4HmGS2XLFeKIQone8
         9zZ/M+QDLEX/H0z0rB/NztnoSiuRwMUOtEHa5Csbv0uHMtw2OKyhZVMDje0Aaj7UijKG
         q5U6eqNbpLlJ3VlWergfmct3fdSQCbxwnMZ/d19tMam/vWYno34a3Btgb4m/BDfEdu8H
         NYBykxi0/iBjjPVSpPtKE0N2sBLWAsxETMklYUY7hHh5m+4HSRwYXpy7SJUm2LiK6rfa
         Ip/3+/Fi+Nkvm2ztbyfIcWsmYC8miawBpc2H/ddjAAtmXgb2koaHI79ujtYczoFFAGE1
         4z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=hZWWHvxiAS6rVI2lFepgRgRLUiTWelvEzHdakGPqFzQ=;
        b=otD7SCLMNmLX5dLzciomtMW5VsD7JZdjuGSZmk1vREFDY4M/juf0QlubHCvCc54FcJ
         CnGBFQi6TYmgLqr+y5bnLwIClkodah9LioOFrE8Kt3ADk1akrabiGZTcHzSoROj5q36y
         J1G3+JAVPNKQXKr0okuWVjxveEpoV3SkegSwFaS6uk5LzYlllzYdPGRABrAJQh57MDes
         uhPf4hq7sz8oU8Y2H46EMFSbIJPETpmj0PiLimP6CG25f55mfwGS/qlG4kIokklpJKkl
         7upJWAlh1rFdTo7/OZIjzdU5wwUt/vZ4G1Bz57B7zE8JUfwyDA9maJaw0wTxI3/D8jr0
         BfaA==
X-Gm-Message-State: APjAAAWIiXjMFs2tf8XnimmyLEgiS2HnAlPSgWB70e+Gaoxy8AMi6X0W
        hr8jFauYKsfvI+viHRCmCgYB5xrd3RsJUkGIOGY=
X-Google-Smtp-Source: APXvYqy2bpktvW9FkAJ7U4S/zUjK2ZjEw8h0nC4IeVBiZyw2Z/5WcD6kzhoSvay2iWv2bJlqG8b178RHlMwiYxjDDcE=
X-Received: by 2002:a63:cd03:: with SMTP id i3mr4363381pgg.257.1581003054558;
 Thu, 06 Feb 2020 07:30:54 -0800 (PST)
MIME-Version: 1.0
From:   Farhad Jahangirov <farhad.jahangirov@gmail.com>
Date:   Thu, 6 Feb 2020 15:30:23 +0000
Message-ID: <CAFJOEtr5ZOYDGVjmMTGoORLT3UJy7wLx79Lv8eBEyQVMh6H-eg@mail.gmail.com>
Subject: AX88179 driver is appending a two-byte VSS Ethernet Monitoring
 trailer to every IP packet
To:     davem@davemloft.net, hslester96@gmail.com, allison@lohutok.net,
        opensource@jilayne.com, tglx@linutronix.de,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver for AX88179 USB 3.0 to Gigabit Ethernet adapter appends a
two-byte "VSS Ethernet Monitoring trailer" to every received IP
packet.

Issue observed on 4.15.0-76, 4.19.93, all the way up to
5.5.0-050500-generic #202001262030.

The manufacturer-supplied driver from
https://www.asix.com.tw/download.php?sub=driverdetail&PItemID=131 does
not have this issue.

This is the same issue as reported earlier here:
https://bugzilla.kernel.org/show_bug.cgi?id=121141

Please let me know if I can help with more information or anything else.

Kind regards,
Farhad

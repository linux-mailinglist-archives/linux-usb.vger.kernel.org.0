Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8BB42B8CD1
	for <lists+linux-usb@lfdr.de>; Thu, 19 Nov 2020 09:08:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbgKSIF1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Nov 2020 03:05:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgKSIF1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Nov 2020 03:05:27 -0500
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17D97C0613CF
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2020 00:05:27 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id l22so2562551vsa.4
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2020 00:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=cy4emllfc+J5YrBKtpxSmH7isRrDnwx875lpX6aEmSA=;
        b=XnlmHqwllAtlzF3r5S6oxntPtC2vyEAJ6Vke69qcAwy0hYJ9C3+6ejyP6mWpwY767w
         gHc3dM9vL1AG/UH9Es3Dqq3I23u4WeFp5F1+9szzM34/DQvQduUi5dMuGh4Wn7u6vQc2
         1XzwdL+QTso2Z1cHOxA5RMlVXH+2e3p5GmtHGqJhCV6iBkHvKd8yfVRV9VnNHuHtEftA
         noUlN2tb0rXdRJ6tUk8UkzGbxwqBywbHbVc++HRJ3552M/iCtNRRW4FOjeffpkZoht/D
         a5jW/XkEQ7bzBEjKxBTXqGc0fy0ZrTVW5e/MC54szWbcd9Z08PyiYf1GxKvBbUB/ObUi
         e7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=cy4emllfc+J5YrBKtpxSmH7isRrDnwx875lpX6aEmSA=;
        b=Hchu2Wf5Xw4YElG14mOqpmCnr8Mr5fxh/hO31I3JmiAYAwZnc35amjqBG8J/lXod/4
         hO83LQ/xvdsVCg9Sa7r78X9V6FPIOvo58SMmiFUfUU1Mng8sZQIEAcs0FmzUc+9zP97k
         IIIP7rXSrWdatGSGKH2uhAHWrelVsNGrr8MSoBv0mU1LaNqWN5Mm2Ewmp4n/KC0ImQxd
         awy42xEbdypJfdUIDXCnbqzf/qpQYbSZ6T3KuMG+giI4DnqiduoSrAeHJOH/JzyLluG5
         62+MR1gQR6LlUpwWF7hHJ4vd7MJ/KC2Uth2VONgkXB21rq1Fkw2EBw0oLGJdD9WZ8Unv
         U+AA==
X-Gm-Message-State: AOAM532/DWkapdANjY8FxLmC7R7X9G6VeEUUaW+k+4Qcg7ELLQeEshEi
        zTqACS1RC8h0ftsIOoEXyRJKP5rcZg2/0RBHH7xsYm4xJ9s=
X-Google-Smtp-Source: ABdhPJxi5Xpoa+pomCCtG7sgBeAafdIIY+lzNAr8+Pro84ox6vB4zFg+4alGJXVh65KAT1t5DEXlPbUvsJdcW9Gj50A=
X-Received: by 2002:a67:774c:: with SMTP id s73mr7945163vsc.1.1605773125749;
 Thu, 19 Nov 2020 00:05:25 -0800 (PST)
MIME-Version: 1.0
From:   Kevin Liu <kliutw1947@gmail.com>
Date:   Thu, 19 Nov 2020 16:05:14 +0800
Message-ID: <CAMLv=Q9DVb+t63eK9fyDsdUWTF7d7jHQy5QXik=-nyV0rVE-3Q@mail.gmail.com>
Subject: add product ID 1b93 under Supermicro 2c23
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I tried to add product ID 1b93 under Supermicro 2c23 on USB ID
Repository last week, could you please help to check the request and
let me know if any additional action I shall take? Thank you very
much.

Information captured from USB ID Repository:
Main -> USB Devices -> Device UD:2c23 -> Subsystem UD:2c23:1b93
Name: USB Ethernet/RNDIS
Add PID for lan-over-usb host interface device that will be applied on
Supermicro motherboard from late 2020.
kliutw1947
2020-11-13 09:20:12


Regards,
Kevin Liu
Sr. Product Manager, SW
Super Micro Computer, Inc. TAIWAN
23511=E6=96=B0=E5=8C=97=E5=B8=82=E4=B8=AD=E5=92=8C=E5=8D=80=E5=BB=BA=E4=B8=
=80=E8=B7=AF150=E8=99=9F6=E6=A8=93
6F., No.150, Jian 1st Rd., Zhonghe Dist., New Taipei City 23511, Taiwan, R.=
O.C.
TEL: +886 2 82263990 #3436
Mobile: +886 937 170436

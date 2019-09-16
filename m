Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9703CB3D84
	for <lists+linux-usb@lfdr.de>; Mon, 16 Sep 2019 17:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730697AbfIPPTn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Sep 2019 11:19:43 -0400
Received: from mail-io1-f45.google.com ([209.85.166.45]:40306 "EHLO
        mail-io1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbfIPPTn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Sep 2019 11:19:43 -0400
Received: by mail-io1-f45.google.com with SMTP id h144so79475023iof.7
        for <linux-usb@vger.kernel.org>; Mon, 16 Sep 2019 08:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vDE6un5TdIDHWhyTO451c8k0sL9GKNam+arthvJoAr8=;
        b=FpKQAdljT+aE7I8jAVF1bCU+yeXrN/kzsq3ZmsP1JdIw6taCBaqOuR0oOfysm8xu41
         v+j3kW3l/dq0y3r8QMTCgmsY+8pSHUtrAikHRhLoPY1SPf37fz4uWMOQYQx9Pc99icrf
         ml+RS4W+pkcAQCm5GJkEoVVSeeTw3z8IV2ZsgRJfTk2Lnhz+Vj4wuiBtrCrgT7q0Cte4
         PKLQkG243w3iyH+AZ1+5/o9PoDvPoR9TIS2+YcKgqn9SilPwSkMhOAO5KSPzzlYDjE9T
         u20DUcURb40t+Akkn/HODlsByOBHYaTN3aT+STrbTwc+J3PsyguqcwKG7OkrNyKuybKv
         QTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vDE6un5TdIDHWhyTO451c8k0sL9GKNam+arthvJoAr8=;
        b=aar5+XlhinlN0Vjp+Oqu3PgkXX7jRvV9Re88ZrRu8ZOzR265RSLubZZoqY1DUJA7xR
         MmqEut4EJS4cC4IJFF+ZO/m0JhMv7OCSP3pz1D/1ko+WrHEPS4mVyOGvIF1cfzystyn6
         /0I5yLBSdKdydg6qhd95RxkguunQapuc8yCR8gjNd0nKaC/QQEvUJXsdXwBPKRAJsLi0
         U7nGfT92d500pjTnQf2UdFm3TnwBUc1beyImZxdG6z/anfj6tHaT1G/N0wvOX/i/iawV
         7QQUlv5Oh10S0EvA9zcy9Vy7kbiyAPfNYdHTU/WkZA9ABtFde2vPHnLBm/Tx4kwt3ajF
         bnQA==
X-Gm-Message-State: APjAAAXr8twcaK3znvUpWTtG7vT1xh/Zjl1QYoRYo9Bfhze/w0Ko3cAt
        nwTj80Kb8LkhWIop1chAP9Cjayv3KF9V/M0Lbwk=
X-Google-Smtp-Source: APXvYqx0ThOcgKCx7Vci/w0CB1wNjnPQfwP/VrC//q47ZUKw295o+sbIuLUyFD+ohLiYYz78j386Aalo8E8+8Zly9B0=
X-Received: by 2002:a5e:8a43:: with SMTP id o3mr456472iom.296.1568647182542;
 Mon, 16 Sep 2019 08:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <CANMwUkjb7sCTQKjZG8Dxgta=WrNFc4eRLnCtdbxCx_MJd93oYA@mail.gmail.com>
 <38c06b3b-d9b3-a175-9fb9-7d13f0501490@linux.intel.com>
In-Reply-To: <38c06b3b-d9b3-a175-9fb9-7d13f0501490@linux.intel.com>
From:   =?UTF-8?Q?Lo=C3=AFc_Yhuel?= <loic.yhuel@gmail.com>
Date:   Mon, 16 Sep 2019 17:19:30 +0200
Message-ID: <CANMwUkj5kyxE21fDutTyPnW9vibpYwG_602YFO6tB=Mkr8905w@mail.gmail.com>
Subject: Re: No SuperSpeedPlus on ASM2142
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Le lun. 16 sept. 2019 =C3=A0 14:57, Mathias Nyman
<mathias.nyman@linux.intel.com> a =C3=A9crit :
> So both places that indicate USB 3.1 support are not according to latest =
spec,
> SBRN (Serial Bus Release Number) is 30 instead of 31, and supported proto=
col
> capability minor revision is 0x1 instead of 0x10.
Yes. I searched for firmwares, but I only saw a much older version
available on Internet.

> Most reliable way of checking the current actual port speed is reading pr=
otocol speed id
> from the ports PORTSC register port-speed field.
> Use debugfs: (with your correct pci address and port number)
Currently I have "PortSpeed:4" which matches with the "Gen 1" trace.
If I even get a "Gen 2" trace again, I will check.

> Is the xHCI controller id PCI D0 state even when runtime suspeded?
> Some ACPI tables end up preventing D3 for runtime suspend, keeping contro=
ller in D0
> and possibly preventing PME# wake signaling
It seems you are right, lspci still shows D0 :
Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D55mA PME(D0+,D1-,D2-,D3hot-,D3cold=
-)
Status: D0 NoSoftRst+ PME-Enable+ DSel=3D0 DScale=3D0 PME-

The other USB controllers (AMD 3.0 and 3.1) have
"PME(D0+,D1-,D2-,D3hot+,D3cold+)",
are in D3 state when runtime suspended, and wake up correctly.

Looking at this, I realized the front panel USB3.0 connectors are on the AM=
D 3.1
controller, I wonder how they are limited to SuperSpeed (configured by
the BIOS ?).

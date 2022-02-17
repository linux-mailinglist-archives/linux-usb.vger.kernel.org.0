Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B73A4BA3B7
	for <lists+linux-usb@lfdr.de>; Thu, 17 Feb 2022 15:54:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242211AbiBQOy0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Feb 2022 09:54:26 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242227AbiBQOyY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Feb 2022 09:54:24 -0500
X-Greylist: delayed 4340 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 17 Feb 2022 06:54:09 PST
Received: from titan58.planetwebservers.net (titan58.planetwebservers.net [51.79.1.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1DA22B1ABA
        for <linux-usb@vger.kernel.org>; Thu, 17 Feb 2022 06:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
        s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
        References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=WgY8r7I5Tt9PUL+CU2A9cEQxzGIe4rFuqRrE+HpzTHo=; b=LFP8QwMS0TeHFkg+9w10cseFj0
        z36af7bwp3vGYoaLeWtNyV43Lo2y5eJ1jO0og+Ouh6KOnodWgYJXREhmnR8FFhnPbDVvAfVnCy0/t
        CXDAEC4jaKhNuQB7fTjcj/Li8/Skqgv1j6WgeUY5wyQ/977rH4pCHMzAJRB75sfRu0Ar5fAJLbUhq
        VjokIxo24SdiV7ebQtj7TBido3jHCPM7huxmZva0CdDJCAOGxz8/j8lFpGTZBubwOhTWKIHyWfve1
        zKu/XWy4TcfZT+3w1nwpeEYsBUpUJfKgEV23luF1kEvs7kkFPvR31NPxtXLNrXOZ3z5q5lQvWqlaX
        DHzwV8nA==;
Received: from [37.19.212.25] (port=45688 helo=dummy.faircode.eu)
        by titan.planetwebservers.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <bjlockie@lockie.ca>)
        id 1nKh2Z-0000MJ-Is; Fri, 18 Feb 2022 00:41:44 +1100
Date:   Thu, 17 Feb 2022 13:41:42 +0000 (UTC)
From:   James <bjlockie@lockie.ca>
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Message-ID: <82b1c7ae-1755-4f15-979a-490b07de124d@lockie.ca>
In-Reply-To: <734b8412-1e93-19ac-b7f5-24d703302a4d@molgen.mpg.de>
References:  <734b8412-1e93-19ac-b7f5-24d703302a4d@molgen.mpg.de>
Subject: Re: Linux logs error `3:3: cannot set freq 24000 to ep 0x82`
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <82b1c7ae-1755-4f15-979a-490b07de124d@lockie.ca>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - titan.planetwebservers.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lockie.ca
X-Get-Message-Sender-Via: titan.planetwebservers.net: authenticated_id: bjlockie@lockie.ca
X-Authenticated-Sender: titan.planetwebservers.net: bjlockie@lockie.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-From-Rewrite: unmodified, already matched
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Feb. 17, 2022 06:07:16 Paul Menzel <pmenzel@molgen.mpg.de>:

> Dear Linux folks,
>
>
> On the Dell OptiPlex 5055 connect a Logitech Webcam C270 over USB, Linux =
5.10.93 reports the error below:
>
> =C2=A0=C2=A0=C2=A0=C2=A0 $ dmesg --level=3Derr
> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0 13.739837] usb 3-2: 3:3: cannot se=
t freq 24000 to ep 0x82
What problem do you experience?

https://www.techytalk.info/logitech-e3500-webcam-and-cannot-set-freq-16000-=
to-ep-0x86/


> =C2=A0=C2=A0=C2=A0=C2=A0 $ dmesg | grep -e 'usb 3-2' -e input10
> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 4.682834] usb 3-2: new high-=
speed USB device number 2 using xhci_hcd
> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0 12.268308] input: C270 HD WEBCAM a=
s /devices/pci0000:00/0000:00:07.1/0000:05:00.3/usb3/3-2/3-2:1.0/input/inpu=
t10
> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0 13.709847] usb 3-2: current rate 1=
6000 is different from the runtime rate 32000
> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0 13.725839] usb 3-2: current rate 2=
4000 is different from the runtime rate 16000
> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0 13.739837] usb 3-2: 3:3: cannot se=
t freq 24000 to ep 0x82
> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0 13.864837] usb 3-2: set resolution=
 quirk: cval->res =3D 384
> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0 59.598714] usb 3-2: reset high-spe=
ed USB device number 2 using xhci_hcd
> =C2=A0=C2=A0=C2=A0=C2=A0 [ 3921.003081] usb 3-2: reset high-speed USB dev=
ice number 2 using xhci_hcd
> =C2=A0=C2=A0=C2=A0=C2=A0 [ 3926.523106] usb 3-2: reset high-speed USB dev=
ice number 2 using xhci_hcd
>
> =C2=A0=C2=A0=C2=A0=C2=A0 $ lsusb
> =C2=A0=C2=A0=C2=A0=C2=A0 Bus 004 Device 001: ID 1d6b:0003 Linux Foundatio=
n 3.0 root hub
> =C2=A0=C2=A0=C2=A0=C2=A0 Bus 003 Device 002: ID 046d:0825 Logitech, Inc. =
Webcam C270
> =C2=A0=C2=A0=C2=A0=C2=A0 Bus 003 Device 001: ID 1d6b:0002 Linux Foundatio=
n 2.0 root hub
> =C2=A0=C2=A0=C2=A0=C2=A0 Bus 002 Device 001: ID 1d6b:0003 Linux Foundatio=
n 3.0 root hub
> =C2=A0=C2=A0=C2=A0=C2=A0 Bus 001 Device 002: ID 413c:301a Dell Computer C=
orp.
> =C2=A0=C2=A0=C2=A0=C2=A0 Bus 001 Device 003: ID 413c:2113 Dell Computer C=
orp.
> =C2=A0=C2=A0=C2=A0=C2=A0 Bus 001 Device 001: ID 1d6b:0002 Linux Foundatio=
n 2.0 root hub
>
> What does that error mean exactly, and what can be done about it? Could t=
he message be extended like =E2=80=9CReport that problem to the USB device =
vendor to fix the firmware to be spec compliant.=E2=80=9D or something like=
 that? (If that is the case.)
>
>
> Kind regards
>
> Paul


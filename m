Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5B622539C
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jul 2020 21:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbgGSTFm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jul 2020 15:05:42 -0400
Received: from mout.gmx.net ([212.227.15.18]:40259 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726161AbgGSTFm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 19 Jul 2020 15:05:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1595185540;
        bh=2dAwBcSB523+7RrEZSh7oMoGe3VtaQETnkiTl5ymp/Q=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=TidY9omNUuBGFqxfrmAMj4KqxnEg3rqEHjhVSYMY1n3qcr55MNuTEfM9trFRnwDEp
         6lCTXwif18j63wd5Xh3kNFKp/0iTnHbDXLuSNzDnFI58EtlxGMofuEksaeotfPZJvS
         NIdadhGcBJcjx5hx4F5nwmO2jriDaHx5OFGT1sKw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [2.204.111.63] ([2.204.111.63]) by web-mail.gmx.net
 (3c-app-gmx-bs53.server.lan [172.19.170.137]) (via HTTP); Sun, 19 Jul 2020
 21:05:40 +0200
MIME-Version: 1.0
Message-ID: <trinity-1ebbee57-9733-4e6a-8924-6364303e871f-1595185540319@3c-app-gmx-bs53>
From:   Achim Dahlhoff <achimdahlhoff@gmx.de>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Subject: Aw: Re: bug: Reproduceable hung-task in snd_usb_pcm or usb-core in
 VM with Behringer device.
Content-Type: text/plain; charset=UTF-8
Date:   Sun, 19 Jul 2020 21:05:40 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20200719144715.GB1200012@rowland.harvard.edu>
References: <trinity-384b299a-61b0-461c-9abb-1a00fc942b85-1595083781938@3c-app-gmx-bap08>
 <20200719144715.GB1200012@rowland.harvard.edu>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:Rv0m11HN91PV4DSZAyYhuzqcKRTP+kFaqELJfLzwxLpa5Oa8Y+Ky/Twr6Nxpga1qpoUFq
 LV0LOJfTA5G9G2yqJXjXxsRfD/5YUrJ9m7+a/O5Ev+EOGjoJF+g0cOz2K+Kc6lJSCcXI5UUZuTZR
 dt72S9hUXL7Cccl2b+o4lDIMGOnJvTQqtKpPG/bjlhj2bXfrD0cA+PbX3Vgn88LLNcWuWiNMkWzb
 QVuQWxqSW8N6l9bis8cTXRetz/pCCaawpcEKEJorgVHGLGW7RJqNCBJPpKINT0MwladYQU2OiRkj
 8o=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bKZj4m6a2RI=:jJqmADvFZAQjcGqeyzRjTn
 t3N0+zfizIw5pkXZW8l5JeumR4nVl+6Nxnw8EwreJysbHj5TSi+qgts0PUkc05CybLUzM9en8
 SFABSj/DXuBkGpCLKXMBoeKRhnBWCRzkf84ETrLkbxStz4RL36aa7PeW4E1n/NfIAsjUfljjj
 cMxpqw9fQc/TcMhCl0fbCT16z2hm6hdZ230DMC+OK5wLTCW5oBU5qaCfivePj5VLCu7q92oF1
 IruEXoY13lDQq9FhZbLBN0t7lLaYk71zA41s25ZbST4QKd3rQpZjAXIp/eMB6M5ujDoDeEkZm
 bDeVFrby1Q24X39JMnkr/U0v2q4EhV6+KlsTYxa7FJN3bjtf4CCH5LuYDjnfPMrWi7yaZB2f2
 RUEmb/6iyzejZjx56yMJTh/q+Gkyz6tOoogDI7ARepBLJrs5r4I2HSWU+hs1qBauHgSEBgT9s
 yOcYR3OR8GNbZ71HNNXm/IqxlizIWb531MVQHAz6RDgKLZDLmQN+99RgIHR5p9oqrjEGJgWP1
 1UQaA+m9Ui9YZ8YTlb4duG4jnP1PoL4VPOTrOHkeD0QC3D9Z4WWJhyWwyXZQ3ZysryrYv2s/H
 L3lCs5w9GKEm9X+fQdfYJDCXB1D18/sYIk/QVBlOelv6E0PVT+MkDMmLLH6kF0zt3cbENuMRY
 i7Y7vS1EA2ErAAOd5cempFCZ8+qxvvt2w6ZBFWvW8z4n7d8ogRBy5TDEmFli8+85ltDE=
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>> Reproduceable hung-task in snd_usb_pcm or usb-core
>> in VM with Behringer device.
>>
>> Hello maintainers of usb,
>>
>> I found a reproduceable hung-task problem when trying to use Behringer
>> "Uphoria" audio devices inside VMware workstation, on Debian-SID with
>> kernel 5.7 or with 5.8-rc5 . Kernel-trace and USB IDs are included.
>>
>> Am I right to post here?
>
>Yes.
>
>> The problem occurs every time when accessing the devices.
>> The problem does NOT occur with:
>> - another sound device (griffin)
>> - on native Linux on another machine
>
>What about when you use the problematic machine with native Linux?
>That's really the most important case.

I have run it with native Linux on the same AMD machine, and now it works.
Tried both the USB2 and the USB3 ports.

It still outputs these warnings when connecting:

[  205.639776] usb 1-6: new high-speed USB device number 8 using xhci_hcd
[  205.823725] usb 1-6: New USB device found, idVendor=3D1397, idProduct=
=3D0509, bcdDevice=3D 1.12
[  205.823732] usb 1-6: New USB device strings: Mfr=3D1, Product=3D3, Seri=
alNumber=3D0
[  205.823736] usb 1-6: Product: UMC404HD 192k
[  205.823738] usb 1-6: Manufacturer: BEHRINGER
[  208.045722] xhci_hcd 0000:03:00.0: WARN: buffer overrun event for slot =
7 ep 4 on endpoint
[  208.045844] xhci_hcd 0000:03:00.0: WARN: buffer overrun event for slot =
7 ep 4 on endpoint
[  208.045969] xhci_hcd 0000:03:00.0: WARN: buffer overrun event for slot =
7 ep 4 on endpoint
[  208.046094] xhci_hcd 0000:03:00.0: WARN: buffer overrun event for slot =
7 ep 4 on endpoint
[  208.046468] retire_capture_urb: 3 callbacks suppressed

But I cannot see the problem anymore. So the problem is related to
VMware. But other devices, also audio, work in that VMware installation.

>
>> I cannot tell if it is a bug with VMware, the Behringer
>> audio devices,
>> or if this might point to a bug in snd_usb_pcm.
>
>If the device works on the same machine under native Linux then
>most likely it is a problem in VMware.
>
>If it doesn't, the failure symptoms (a hang inside usb_kill_urb)
>indicate a problem in the USB host controller hardware or driver,
>not in snd_usb_pcm or the audio device.
>
>> If you have an idea what to try I can apply patches,
>> rebuild kernel and try if an improvement works.
>
>Try booting from a "Live" distribution and see what happens, if you
>don't want to install Linux on the test machine.
>
>Alan Stern

Thanks for your answer!

Achim.


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2BA1D375D
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 03:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727588AbfJKBzL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Oct 2019 21:55:11 -0400
Received: from mout.gmx.net ([212.227.17.20]:36447 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727518AbfJKBzL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Oct 2019 21:55:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1570758906;
        bh=+n3HQOH8mGtPwjYxzmXzEJTSPpAlcRYnlrfLR+WZtag=;
        h=X-UI-Sender-Class:Subject:From:To:References:Date:In-Reply-To;
        b=L+j/XExN519/Yq+f79+Jse0aL65C/nzxTdTJpbg4PGERrJI+dAJkmcTYC4YY9/ZTN
         Ghyq6YyKewMGXfTyAHaLRZE8Fn6SNQEDK9T5OlD/ByL6HtydSC3AVHtP/oSJwLACzD
         Hn/MwVubPgmQFjnPn3LlNlCw0Ooyrva9QrJTKWsw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.0.0.132] ([212.88.11.189]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MulmF-1i07EQ34BX-00rqrL; Fri, 11
 Oct 2019 03:55:05 +0200
Subject: Re: Regression: USB/xhci issues on some systems with newer kernel
 versions
From:   Bernhard Gebetsberger <bernhard.gebetsberger@gmx.at>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        linux-usb@vger.kernel.org
References: <3edaf835-7cde-37d9-5a0a-5a9b21a02968@gmx.at>
 <4dfc2bca-e333-4f05-e795-23cbe481d53e@linux.intel.com>
 <485bd962-2a2d-1e15-54c6-3685fb7597a3@gmx.at>
Message-ID: <a5217250-cbef-1713-0518-16e28e1ed1ad@gmx.at>
Date:   Fri, 11 Oct 2019 03:55:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <485bd962-2a2d-1e15-54c6-3685fb7597a3@gmx.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:g4ua7CWsHiM9upUAO9JO9Zcr/J69CmM9DyBHh9bsNJFXtsxRIRK
 Xk5GSR878w68tlug5VQEz8RfLc8Csgl3+70XAlPJeWbMu1XC4PmSpP2eX/F3U2+vlTiVZVl
 dBYUYdboLAun8G+ieBzo9xxtmHED5T92nHJAFsDgmPrvnE1yrFMNgnD3YiA1r4GJEjfbYSB
 cJbCN7PZOAx4Z3AYApQGA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2Caulr7Rzb0=:96UIgjZWXF+jnShgt7PbGi
 l4A/NwG9NP/08pK0szEU1F1k5R+vmoRnN2/mZgYSTxXGT9lRM/tlyZF3eMtsxBLI5Yod1a8Ep
 EJ3ew4IzdjLWLQtHwXP5Wl6pTjE0hwLqH8J+ugNqNf9qFasGdj6sWM5kVg2/Dlrwj5K66EI4p
 GbhQgBXso7FC4LwGI3bNLqgAJ/1utGRdgztjoea4CiXJPjoI5nGg7Sd4RVzaYxtcUizz0mA5Z
 mk9ptYbNQCUQPaeflZiXMnkzX9GjtHMZN8+ivBAxzfA9hJ3Kjl0W23a/TWkBBETvuF8kEruhj
 CGupBl3iMEUplhxHMqXGO1REg0K84I3LqqI6AyMqRIDsh3YZX2AyMpmIcijh7e2Yb/uHAgGLZ
 bhYYnizhwONXwlZI3Zt28WzuHYsfwBIu+FmMzuh54tCgPRQsdha/J9fO8R8AY0lsMhHMRady2
 OqyTYYlJv7yJK5nhBL3mw4+OKj4mVVgsOWIJ/by2qodFXIoKn5+Ua9oh3MWvIkQ6VsQ3TGMfd
 uNU1V5C8xymKNcVheLbqlSfEFWLpfDk/UEdJAutbK34h97/bb9eKoCBsjCYqWdgwA6BeNte2e
 rku48fqDFsiizIkbqROorGnnAZZdCFU/Qq4XzedDnLL+pUXA0mbQQGLpLkPwBBwJvilxlMY8j
 k8LQF98wxT2gKWnMdDHhalQPcHldOqz11vga/UNOy7fzDTu8W2u2joE3ytgDYxOSV+7h8kzOL
 RVYeUnieLAvzYMbV/BkSyOejduo1tNGjtCKV4HseS/Piif4prW6b7x/4DxAke6E6RnbyjDm0Z
 qkJbNkibC5bXL+qSRTQN+tLYoCfQAMMWocxyfbQsymiCLPfDGush8S4U1jBYG+FGiCM3M+Br3
 sgkTczqiogNuvc0uwwgO9MTCyB73PBieqazCEPj9I7Qvq9YzjQN19oCmUAIHBmleq/MKyXtSz
 BwVUxyGR5kHKcBOCjLNfDIlop+aBAHnJxukvi5Mt7JToGVCLrjVzCrHzKlitMQzcEK2TKnAf8
 GXBt97gIFs3tnNzFLnLYaHmgNnCWsDn4qNYBrt5rmgLy6P2TOE/MVPGVF45qOBLVPA5TfQE0a
 C3YyzIl5SGadYqLRlzNtNICWaXxKkvzy6RXSV/5dkwo7LmBp0qevTY8iF4IJPSFy2wNkN23ra
 bb5nJA18YSfWo+k7UF7HIfJoXrrD939inraD8pzadUr40qsOEM6aMXf4IZVdEpSASx6fDA39J
 SK5kBvKuOEv6PLfTMAIYXI7zL5mxbkUU+0SZM9s6ws/13ukRpdp2aDDWlyEA=
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I've just noticed that this problem also occurs when unplugging an affecte=
d device.
When unplugging the device the error
=C2=A0=C2=A0=C2=A0 "WARN Set TR Deq Ptr cmd failed due to incorrect slot o=
r ep state"
gets shown, even though I don't get this error when plugging the device in=
.

Here is a link to the dmesg and trace logs:
https://gist.github.com/Brn9hrd7/011405276fdf7a699dcc5cb83c67d276
maybe there is something useful in there that was missing in the previous =
logs.

- Bernhard


Am 03.10.19 um 17:13 schrieb Bernhard Gebetsberger:
> I sent the instructions to one of the users in the bug tracker.
> Here is the download link for his logs: https://www.sendspace.com/file/4=
13hlj
>
> - Bernhard
>
> Am 03.10.19 um 12:23 schrieb Mathias Nyman:
>> On 2.10.2019 15.28, Bernhard Gebetsberger wrote:
>>> Hi,
>>>
>>> There has been a regression in the xhci driver since kernel version 4.=
20, on some systems some usb devices won't work until the system gets rebo=
oted.
>>> The error message in dmesg is "WARN Set TR Deq Ptr cmd failed due to i=
ncorrect slot or ep state", although for some reason there are some usb de=
vices that are affected by this issue but don't throw the error message(in=
cluding the device I'm using, I got the error in previous kernel versions =
though).
>>> It seems like this bug can also lead to system instability, one user r=
eported in the bug tracker(https://bugzilla.kernel.org/show_bug.cgi?id=3D2=
02541#c58) that he got a system freeze because of this when using kernel 5=
.3.1.
>>>
>> Ok, lets take a look at this.
>> Some of the symptoms vary a bit in the report, so lets focus on ones th=
at
>> show: "WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state=
"
>>
>>> When looking at the responses in the bug tracker, it looks like it mos=
tly affects Ryzen based systems with 300 series motherboards, although the=
re are some other affected systems as well. It doesn't only affect wifi/bl=
uetooth sticks, some users even got this issue when connecting their smart=
phone or their external hard drive to their PC.
>>> I have uploaded the whole dmesg file and the tracing file to transfer.=
sh: https://transfer.sh/zYohl/dmesg and https://transfer.sh/KNbFL/xhci-tra=
ce
>> Hmm, trying to download these just shows "Not Found"
>>
>> Could someone with a affected system enable tracing and dynamic debug o=
n a
>> recent kernel, take logs and traces of one failing instance where the m=
essage
>> "WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state" is s=
een.
>>
>> mount -t debugfs none /sys/kernel/debug
>> echo 'module xhci_hcd =3Dp' >/sys/kernel/debug/dynamic_debug/control
>> echo 'module usbcore =3Dp' >/sys/kernel/debug/dynamic_debug/control
>> echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
>> echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
>>
>> < Trigger the issue >
>>
>> Send output of dmesg
>> Send content of /sys/kernel/debug/tracing/trace
>>
>>> The issues occur since commit f8f80be501aa2f10669585c3e328fad079d8cb3a=
 "xhci: Use soft retry to recover faster from transaction errors". I think=
 this commit should be reverted at least until a workaround has been found=
, especially since the next two kernel versions will be used by a lot of d=
istributions(5.4 because it's a LTS kernel and 5.5 will probably be used i=
n Ubuntu 20.04) so more users would be affected by this.
>>>
>> There some time left before 5.4 is out, lets see if we can find the roo=
t cause first.
>>
>> -Mathias
>>

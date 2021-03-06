Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45B0532FC85
	for <lists+linux-usb@lfdr.de>; Sat,  6 Mar 2021 19:40:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbhCFSjb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 Mar 2021 13:39:31 -0500
Received: from mout.web.de ([212.227.15.14]:46621 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231229AbhCFSjM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 6 Mar 2021 13:39:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1615055951;
        bh=xT7qWhHQD9qeK2oZu81NMxw0C6HkrOtn44DzUf8mXzI=;
        h=X-UI-Sender-Class:Subject:From:To:References:Date:In-Reply-To;
        b=bIxY1B16yYFBkQqKYWvTHen+BxLD1PFjKwLyJGO/+wGgIjHVqBtuPf23puN7YBC5f
         YpfvpJCZlDbqIdFJwhGG0z1vq1jhg4VkK6ocdN8qpM+mnRnAVQoIJQFTVHpa50veU1
         H2kscOocTEEcF6kW10HYod3cfSRWSaWpL8YMPQjk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.53] ([128.0.103.26]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MBS71-1lTuN72pIN-00D4W9 for
 <linux-usb@vger.kernel.org>; Sat, 06 Mar 2021 19:39:11 +0100
Subject: Re: A question about UAS
From:   Aaron Dewes <aaron.dewes@web.de>
To:     linux-usb@vger.kernel.org
References: <2ad0d2f9-0ef1-05b5-76db-b178107bfccb@web.de>
 <YEO1t63SQw1Ui4ce@kroah.com> <e5c24520-bc6d-8eec-4e51-6cbc30dd59a6@web.de>
 <20210306182531.GA77074@rowland.harvard.edu>
 <1e60a591-7b7e-ca80-41cf-16fa440d7248@web.de>
Message-ID: <e903b8b3-e381-c6d9-248d-a0cee02a5a01@web.de>
Date:   Sat, 6 Mar 2021 19:39:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1e60a591-7b7e-ca80-41cf-16fa440d7248@web.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:SR0+g3XsLzbZkYeVzbh7Nb1g+LC4VrhUSapidHXePjaqN3MGdkW
 ED88NX6QMZE5svhKd93Ix99PfeZQUkoY6wzWTP0NA9GG1Nm1+x72skabFe64RtAfh1D3oLW
 gdrPpffk3B/4a4xgxsQg3Z2zoAuqWwibSLG7Vo9u884jgaqAnFiOYDUwsdvQZ3YjVTvWz5J
 mJW3ZsKQedk+M4y4ZrKWw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RRAW3HHc0qI=:SAtQ5QmSd4UXm82urdVZBp
 X+5AaKqxCAykYpYlSOcvlQE789XzE9/sL73hNFfJj+GAnAO9xpKoMwL4Mur2Fm5bpRmpj6jjY
 bNsCgFUziMPhDSlO++u3s17BYvBN0O49vzstlWE6eh3HQuSUc0eX83EWvcZJC4HEBeYssPqOe
 6JrTcnB4LxCLk7XG/MOyJIOcWTIHl7MnZ0P0V70aETMqm/ECo6BxGB0sqrsQATnFIieIwYeWl
 VKky9ncaGHgF05PnWtJ+xU0MIRpddVMBwqVWu0jVHh8qmAtk+1+K9vH1w1CPt9Le6WWf1UDFN
 Wta4Vu5ffvuuoqCp88s8+q05e557rc17rtds0YwW4PqKk6nFvcW9Fytpze9Bg3lIovtWdCqXa
 Tk8B1y0MTifbMZDiAOoX8DjDtmNDbGmhmn0tlC/0UOab8918RHoghm0mTk6dbIEB+5a4iiGra
 GN1v+0dz4Bf6KGqo4F6GbZlbyzs3OctVz7+PtRHqLI8XuwfXdMJV/Fv54+p5hki9Qv6hE54Wt
 4jemTowg7utoDO8c/PRhfPCAmg7OWiqnhPhnU9zuyyRmh2k10zSsWE74dL3c9zbVYi09C9bDs
 cmzC2O5W+Yktygo0xg6ysWW/5D0V6fge09Jjf6yLCJaHwIWEbe6E0EkXw+LZ4KslyV1pg8oo3
 1b7/6cOtrHifaoFb6Wa3wZ2zodXLNTnmprR37tqgYEQ24YbjdsIf5pfbR/4Gb2VsIwLyHVpjF
 OteUl79fqLx3Yd310xdArEeAvR4SZEY/0mJcxoTUwLwGmBihU3G1Fz9clmCI6XqbgqKN0emv7
 niitwIqb+wrFPRu5Kcv40aF6YX0jb1DeVhWChikO0Nnfq9z7o/1zVpOwnPx0nKzKgdo+Cu8NX
 KT0JFDGcXY6p5oTzBzlg==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


> On Sat, Mar 06, 2021 at 06:27:06PM +0100, Aaron Dewes wrote:
>>> On Sat, Mar 06, 2021 at 05:34:32PM +0100, Aaron Dewes wrote:
>>>> Hello!
>>>>
>>>> Sorry if this suggestion/question sounds stupid, I don't have experie=
nce
>>>> with the kernel code and this mailing list.
>>>>
>>>> I'm a contributor to Umbrel (getumbrel.com), and we provide a softwar=
e
>>>> that allows to run a bitcoin node easily, and we've run into many peo=
ple
>>>> having UAS issues
>>> What specific UAS issues?  And why not just fix those instead?
>> Sorry, I should've been more specific. When I said UAS issues, I meant
>> that we've had many users who used drives that were incompatible with
>> UAS, and that script is our way to detect that and fix it, because the
>> kernel apparently often doesn't detect that, and I think that way would
>> be a way to actually automatically detect such issues.
> The kernel _does_ autodetect drives that don't claim to support uas.
> Are you saying that your users have drives which claim to support uas
> but don't actually support it?  If that's so, can you tell us what
> drives they are so we can put this information into the kernel?

This is what we added to cmdline, but the list was too large, so we had
to remove a few for our latest release:

usb-storage.quirks=3D152d:1561:u,152d:1576:u,152d:0578:u,125f:a76a:u,04e8:=
61b6:u,174c:55aa:u,04e8:61f5:u,04e8:4001:u,1058:082a:u,2109:0711:u,152d:05=
62:u,7825:a2a4:u,04e8:4001:u

I don't remember all the drives, these were mostly reports from users
who had issues.

A few ones I could look up in our commit history:

- JMicron JMS578 and JMS579

- Samsung M3 Portable

- ADATA ED600

- PA023U3

- A SATA-to-USB adapter sold by "BerryBase", a German RPi-related shop

This is on kernel 5.4, so some might have already been added.

To me, it seems like most, if not all devices with the vendor id "152d"
have UAS issues.

> And can you tell us what errors the users encounter?
Either a complete crash & unmount of the connection or really slow
writing speed.
> Also, how can you be sure that the drives don't support uas at all, as
> opposed to supporting uas in general but not a few specific commands?
I'm not sure about that.
>> Currently, drivers/usb/storage/unusual_devs.h disables UAS for a few
>> devices, but autodetecting would be better in my opinion.
> Autodetecting the way you want wouldn't really work very well.  It would
> require the user to plug in the drive and initiate some actiity on it
> which would generate a flurry of errors, so that the kernel could see
> that it should try usb-storage instead.  Then the user would have to
> unplug the drive and plug it in a second time so that usb-storage could
> manage it.
>
> Alan Stern
Oh, I see, then that's not good.

Thank you for your reply!

Aaron Dewes


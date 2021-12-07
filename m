Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3432F46AF57
	for <lists+linux-usb@lfdr.de>; Tue,  7 Dec 2021 01:46:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378653AbhLGAtn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Dec 2021 19:49:43 -0500
Received: from mout.gmx.net ([212.227.17.20]:32855 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231593AbhLGAtm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 Dec 2021 19:49:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1638837962;
        bh=unPJ6WYwrD6FycySyJum1KO9PzNELlDt+zDcE63EtXw=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=hy3NgAnEt29rIW8Vrtbf0X92J3QMxqS6AyX8bsVrdtfkUyYwQUsGGq8eHe8zM4iC3
         PH2N5brd5ch9czfcketo5wRABSZf7JAFbuYwYvbk/HoZ6czU85kPz35Czrl3obmEYO
         U7regf2IYgNIgWM90D8E7JlXmp4Nk/H5Fpr2p3WY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from tbook.localnet ([87.167.89.104]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLiCu-1nC3zd3KKm-00HbU6; Tue, 07
 Dec 2021 01:46:01 +0100
From:   Tobias Bachmann <tobachmann@gmx.de>
To:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Pavankumar Kondeti <pkondeti@codeaurora.org>,
        linux-usb <linux-usb@vger.kernel.org>
Subject: Re: Regression: "xhci: Fix command ring pointer corruption while aborting a command" breaks USB on Intel controllers
Date:   Tue, 07 Dec 2021 01:46:00 +0100
Message-ID: <11877377.O9o76ZdvQC@tbook>
In-Reply-To: <Yay1EiY/F7ezPeb6@kroah.com>
References: <0a4d723c-221f-a42a-434c-34283a4cdab7@redhat.com> <Yax2MOuKXECUxzbd@kroah.com> <Yay1EiY/F7ezPeb6@kroah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"
X-Provags-ID: V03:K1:9zgQxT9pnT/FMZLFmUKQeg2tojsGo3NGC/yUCjrWTdILE8fCW7u
 s1C1XB2r3YkfoS0fjtCsk8yDlP+6deNnyILyCfdtKwkyMEpGyU2EQ2V1sQmyr4QZQFR0NdO
 XVeMfheDTtFOe4I9FU3Pk0QWW8IqMfknD2u47x6TKCcQcinXgGa0GK3SQ5PsMfcf8AiAS6s
 6xDljewHUTd0mGhhiAueQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8GiLjhea9YE=:mdkLw7FpKhyKbbctI7HaNo
 4dyirJRicWtIebhJBe5cmBcNrM7itsG2aFBRlekH2IBLWbkrRcKIGYs+fcqSRKqXz+77OI5yt
 5cNHo7MZMpjjNlLUFt63axjJzjz51uQM0KJ6pI1Fn51f3FTrFbCTh8kXAHVLJObHsDONFWzq5
 wkvVqzEKt8lRdlAfnKyD2vVIRKtqS8Rd4dCOv9nbx5G5v/G6kGpfcu6fP5/tRh2M9+X9a6sqj
 Q2caVPh2oeav2lJuutt3AaKUhACU6IwNT/Kftfd8hpTqSDQ7YORhAPPUjyN0xZWYrJGrtaidw
 ZJ2swKMjuXT4UX6Mds9PPXeLscLxtXC0xX8AvlIvXTu5v1GRl/fNmL/6+RTyXuYBC/w5IGHVh
 lMjiN7eCUbSKFnJX8bX8h3cNbjYUaL20Cn763nbDTWYpPPWwwYfwuCklEjsPj+po0wS81bvcz
 lWksJpJI7Tcs6eN3281SfSzFoKRj2o+hCTkLTpSUe/TgaGw3rmk8jHfnUZ2HoEPRXvtjZWIch
 ZbuE7KpjRk4Nn6Vz3brDoO1+35R2e0lym2b0SqvmTGlihXvqE5kPRAymWK6JAtXgAypto9qd2
 uT26K8+bWYh9SY8AWtbvb4F1si4ZD+FzGw09j+4SBQkcTaQhzkhBLsUkefSEE1p0lxmt1myKO
 KXnIiDvyNL8Zn+leA8btL+fAZaLcBQpfIVXAFWdvhe7vPHh3CPq/Dh3gdf9K8MGdObGKgZUML
 2KqGFO+2+cw3orugEGs4MFynTVRnA83xqkcPIwGjOUzWvHjuDc33U18yDhCjhdvlGriGIHMQW
 Skuzhm8wKyUPlPeCHdNAl6DQPMe1aKsRrEBYNFQPL9jz1iX1z5pmJOqdACyaJGIuMpqjZEb+G
 QfvDuCWRF9K3S3bAGUV/r+JCexDAEuJlqmEwtJf/I25UMZJA2UActTtjKUee7Nn6KFtisaPGg
 OkGyB5ZSv32CqBOSFOX84dvxNpFoDzbyx8z0NGv3mQTLKO2D1ZylsKRGSj0e1rQEFPOQzw26B
 0gEu0U1NxteFL6bb/pJDRbSr2RqydEESsLbt2IUgNYq5beKKH0ZWwA2sKcE4a4mU1zkvA3NNG
 oC7H9nDFQ3kwxk=
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Dec 05, 2021, 13:48:18 CET Greg Kroah-Hartman wrote:
> > I think this is fixed by 09f736aa9547 ("xhci: Fix commad ring abort,
> > write all 64 bits to CRCR register.") in linux-next and I'll be sendin=
g
> > it to Linus in a few hours.
>
> Pull request is here:
> 	https://lore.kernel.org/r/Yayq/Xdb/pHSS7/l@kroah.com

As one of the affected users, I can confirm that my issue is resolved
in 5.16-rc4, which includes that pull request.


